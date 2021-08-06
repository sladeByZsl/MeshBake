using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(MeshFilter))]
[RequireComponent(typeof(MeshRenderer))]
public class ZMask : MonoBehaviour
{
    public ParticleSystemRenderer target;


  
    private MeshFilter meshFilter;
    private MeshRenderer meshRenderer;

    List<ParticleSystemRenderer> targetList;

    void Start()
    {
        targetList = new List<ParticleSystemRenderer>();
        targetList.AddRange(this.GetComponentsInChildren<ParticleSystemRenderer>());
        for(int i=0;i<targetList.Count;i++)
        {
            targetList[i].enabled = false;
        }
        

       
        meshFilter = this.GetComponent<MeshFilter>();
        meshRenderer = this.GetComponent<MeshRenderer>();

    }

    // Update is called once per frame
    void Update()
    {
        CombineInstance[] ci = new CombineInstance[targetList.Count];
        Mesh cbMesh = new Mesh();
        for (int i = 0; i < targetList.Count; i++)
        {
            Mesh mesh = new Mesh();
            targetList[i].BakeMesh(mesh, Camera.main, true);
            ci[i].mesh = mesh;

            var rootMatrix = Matrix4x4.Rotate(this.transform.rotation).inverse
                            * Matrix4x4.Scale(this.transform.lossyScale).inverse;

            var relativePos = this.transform.InverseTransformPoint(targetList[i].transform.position);
            Matrix4x4 matrix = Matrix4x4.Translate(relativePos)* rootMatrix;

            //ci[i].transform = targetList[i].transform.localToWorldMatrix;
            //ci[i].subMeshIndex = i;
        }
        targetList[0].BakeMesh(cbMesh, Camera.main, true);
        //cbMesh.CombineMeshes(ci);
        //target.BakeMesh(mesh, Camera.main, true);
        meshFilter.sharedMesh = cbMesh;
        meshRenderer.material = target.material;
    }
}
