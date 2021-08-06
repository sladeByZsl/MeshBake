using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestNEw : MonoBehaviour
{
    public BakeSkin skin;
    void Start()
    {
        this.GetComponent<MeshFilter>().mesh = skin.mesh;
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
