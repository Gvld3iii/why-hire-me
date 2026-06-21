import json

def story_handler(event, context):
    story = [
       {
          "Chapter":1,
          "title": "The Spark",
          "text":"I got into tech in 2022 through crypto and NFTs. I wasn't trying to become an engineer, I was just curious. That curiosity turned into real building. I taught myself Solidity and the ERC-721 standard, and built the KKDY API, a system for the streetwear line Kool Kids Die Young that sends NFTs after scanning a QR code claim tag, verifying the authenticity of each physical piece on-chain. That was the first time I saw code create something with real value behind it, not just a concept.",
          "image_key": "images/chapter1_spark_collage.png",
       },
       {
          "Chapter":2,
          "title": "The learning curve",
          "text": "For years I built my skills while driving a truck. Nights, weekends, whatever time I could find on the road. No bootcamp, no classroom, just me, documentation, and a lot of trial and error. I started with Professor Messer, slowly picked up Python, and got into Docker as I got closer to realizing this wasn't just a hobby. In late 2025 I decided to invest in Stephane Maarek's AWS SAA course, and that's when things really started expanding.", 
          "image_key": "images/chapter2_grind_collage.png",
       },
       {
          "Chapter":3,
          "title": "The Build",
          "text": "I didn't wait until I felt ready to build real things. These projects came from imagination and creativity, pulled from some of my favorite shows and games. Aibo is my version of Sarah, the smart house from Eureka. CloudGuard AI takes its name from the Sentinels that protect the Halo in Halo: Combat Evolved. PredictiveOps came from wanting to actually predict the future before it happens. I built CloudGuard AI, a five-agent security platform that reads real system data. I built Aibo, a desktop AI assistant with its own voice and personality. I built PredictiveOps, an auto-healing cloud platform. I learned by shipping, not by waiting.",
          "image_key": "images/chapter3_build_collage.png",
       },
       {
          "Chapter":4,
          "title": "The Proof ",
          "text": "In 2026 I passed the AWS Certified Solutions Architect Associate exam on my first try. That wasn't the finish line, it was confirmation, not just to the tech industry but to myself. I'm not breaking into cloud engineering, I'm already in it. As I continue to grow, I'm looking for a company to learn and build with. My goal is to get the DevOps Pro certification next, then Security+. This is just the beginning. I build in public, I ship real things, and I'm ready for the next step.",
          "image_key": "images/chapter4_proof_collage.png",
       },
      

      
    ]
    return {
        "statusCode": 200,
        "body": json.dumps(story)
}
