using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BakeSkin : MonoBehaviour
{
    ParticleSystem ps;
    ParticleSystemRenderer psRender;

    public Mesh mesh;
    void Awake()
    {
        ps = this.GetComponent<ParticleSystem>();
        psRender = GetComponent<ParticleSystemRenderer>();
        mesh = new Mesh();
        psRender.BakeMesh(mesh);
    }



    // Update is called once per frame
    void Update()
    {
        
    }
}
