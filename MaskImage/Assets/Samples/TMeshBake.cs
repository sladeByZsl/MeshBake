using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using Coffee.UIParticleExtensions;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Serialization;
using UnityEngine.UI;

namespace Coffee.UIExtensions
{
    [ExecuteInEditMode]
    [RequireComponent(typeof(RectTransform))]
    [RequireComponent(typeof(CanvasRenderer))]
    public class TMeshBake : MaskableGraphic
    {
        private List<ParticleSystem> m_Particles = new List<ParticleSystem>();
        public List<ParticleSystem> particles
        {
            get { return m_Particles; }
        }

        protected override void Awake()
        {
            
        }
        ParticleSystem ps;
        protected override void OnEnable()
        {
            ps = this.GetComponent<ParticleSystem>();
            var r = ps.GetComponent<ParticleSystemRenderer>();
            //MeshHelper.CombineMesh(particle.bakedMesh);
            //GetComponentsInChildren(particles);
            //Exec(particles,p => p.GetComponent<ParticleSystemRenderer>().enabled = false);
        }

        public void Exec(List<ParticleSystem> self, Action<ParticleSystem> action)
        {
            self.RemoveAll(p => !p);
            self.ForEach(action);
        }
    }
}
