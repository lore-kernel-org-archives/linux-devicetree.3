Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445275;
	b=IN8wkmNFE29CuaJxJVUnntuiMFRNvSiY8T9Vh8xDn4NZrHBFKEkHNomv89YpW82grWs9
	 UWwGRvquHnLan6beybVKyFky4PLk+vd93zppaip+w3gzTToVAcYe+Lcs6B3cLCqAXqY4I
	 FVQvD2kGgu6jqjlofQPpaOOEgmMUJpZvA60+p/j4Er2JDXhP7z3ejWedv8j7RN7axhPxj
	 2lAvbPNzYz/NLvujqQKOdzkzXNpXgAuwVI6OjchjcNfyJmX6w0Vz5pax9/pVwy5Ge/lg2
	 xbjUWUzl5KypUi6Q+Yw5qEYVT+Z2LHMGDVvrOr0GEbss0BEwNnzAs/8rtQjhDFvkylA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445275;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tIxCTm1jnkogO0qe7ZkDy/eWucIvI1gk3nDIsM7jSRU=;
	b=kDAQfn7/zBEHlEfIO1vU0YHbfAraQlVTVPk4H0ww4t4D3dd89arco+T1+o6BP9oQc5S+
	 +h9FvLhDqAleugPvMj/MIVVJAO/ZrqHDdfpDa8vdU0jeu45+OeUQgDBf3x/BEX1Lwfa9q
	 Zy9NVqRSwIcn0e36We6dEWUMboAXLvZaxLwop7fWBl8uUlHMvGneGh1bDX6nwHsjwO8X4
	 V2VKxEgUQWdECPIxEmWztm/BnraN2gItEyGLIPMn1REy1uVE8A7DzbNVf+cNG4KFWxpuQ
	 mUQfxhlmOiS4gMLt/16sIWA2QmDfO5tPCA+yYHKzl4QfinMOxcoZqy3s17PYTQTpfeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HzYyMnEZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D02606A31E;
	Mon, 23 Nov 2026 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HzYyMnEZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795445275;
	b=auHe+Cd55RySlzKS1iuDzxgqM6jFrS+Iv3AvnkZR4D10cyoeJBqM4ZSmQacFSg29LPBR
	 1u6n43SAd4+rS/DSlSYW7HcqzJwXhMZ+89dZ0cLFR1Ylo0k7ZrOFc2KNUd9QAX+I5o+o6
	 p5bRDDL3+jVrQsiPEpQuwuilGedOQzq1jd9fgZDK08KsjOLX21PXRbujRW3S2xkDca2re
	 6ZMuDVqTeGmQj1M5CwtUKYSxBj3Sp4miNJGcIxbdKs6DVTNzO4WAYybNPGl8fn12BPUP2
	 3cqB8XmVLLFdS6qqHtyRUb3d0mE8e03sdk/azcSuWQZVbR3rArZ5jrl/Fa5Q+jsNFBw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795445275;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tIxCTm1jnkogO0qe7ZkDy/eWucIvI1gk3nDIsM7jSRU=;
	b=ZAN0ERIhDuxRTfN2+lOtcjTKAslavSzpyGR+gnIMzuRlcXLMmOI1lJioAL82sUoAoaQe
	 j3yIEc6tF0q3ZXfkIBdYbbMAvHVdyldYe9H3FCLySkP9UW0GXFyKjYafzcPG3YiGnP8AQ
	 4Y9sBGxCgaH2H745J7zpQnQage4zr+3vq+tn8yugNuCha85/Oeht99/mpBg5PiWxERB+c
	 3ZLYMtbjGdXbuqRh6I0UaMzWSjazCdjVa+chGxeu41u1X0xG4yww4VXUzqKG62xZpXTne
	 /MOXgQk+Y2tx0yqgmQF6Oa+/6J4aj+Z9BBLZIStduhmWDiAU+OEax4Y5YY5Y5MpNtBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81F351F000F2;
	Mon, 23 Nov 2026 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445274;
	bh=tIxCTm1jnkogO0qe7ZkDy/eWucIvI1gk3nDIsM7jSRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HzYyMnEZZp4wxZk8WhqOKgkmJVS4qvBM1Zm3HDtGHDaexbrlA8YSUYbVVSeTeKFJd
	 09gThI3pBBSZLHsoZgyudSxYUGrevaplq6eaRIY75TfCwJWpPjd9IP2vfEYjlf4vPT
	 RsOcOQlOaFkX0rbwSO+6SW48WtTG3vZK31VAOQdW7YOGvIFruW4GxTIDA279b9uwLz
	 sDbNuvWvgGD8Wb+WezgTRTydplix6oz+3s8xFo49dBr+FtZDZb17Vdopit+Z55HL9M
	 gzYPJ8URc6u6yhNocq3MPN2hOFTkyQ6gk5hPH+gpHFHjZg3uWlIcp4fsx6P+8ZIYKh
	 4JN9OVD5jcv+Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8AB6D4C50B;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 23 Nov 2026 15:47:00 +0100
Subject: [PATCH v4 5/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-p8700-dts-v4-5-60bb7bf8a7a1@htecgroup.com>
References: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
In-Reply-To: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445243; l=2574;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=NmIYyLj+gJ6O//Yk7OxU878XkPBa6KujS6dDK+sOfuA=;
 b=6tO0rnD8M6h/dLvtbjq9aI4b8ZLzGanSZtXqjUUylzUmZHCWb2ogO/5WB2t5zHb2pdn5Hiuqj
 4ZAs2yGcdCkCWXK+5ByYjc8RposbTs5FsmbaqiyD0il36gbEdarnD/z
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the MIPS P8700 ACLINT MTIMER.
Extend support for both mtimecmp and mtime registers
within the ACLINT MTIMER, identified via reg-names.

When both registers are present, the order is fixed to
mtime first and mtimecmp second because both OpenSBI
and U-Boot expect this behavior of the riscv,aclint-mtimer compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index cf7c82e980f674afcf59fc726742dc4f49c1a820..e74816c171d9e9b3417806c531969085d260977a 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -21,13 +21,19 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mtimer
           - const: nuclei,ux900-aclint-mtimer
+      - const: mips,p8700-aclint-mtimer
 
   reg:
+    minItems: 1
     items:
+      - description: MTIME Registers, or MTIMECMP Registers if only one
+          region is present
       - description: MTIMECMP Registers
 
   reg-names:
+    minItems: 1
     items:
+      - enum: [ mtime, mtimecmp ]
       - const: mtimecmp
 
   interrupts-extended:
@@ -42,6 +48,28 @@ required:
   - reg-names
   - interrupts-extended
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mips,p8700-aclint-mtimer
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          items:
+            - const: mtime
+            - const: mtimecmp
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          items:
+            - const: mtimecmp
+
 examples:
   - |
     timer@ac000000 {
@@ -53,4 +81,15 @@ examples:
       reg = <0xac000000 0x00010000>;
       reg-names = "mtimecmp";
     };
+
+  - |
+    timer@16108050 {
+        compatible = "mips,p8700-aclint-mtimer";
+        reg = <0x16108050 0x8>, <0x16154000 0x7ff8>;
+        reg-names = "mtime", "mtimecmp";
+        interrupts-extended = <&cpu1intc 7>,
+                              <&cpu2intc 7>,
+                              <&cpu3intc 7>,
+                              <&cpu4intc 7>;
+    };
 ...

-- 
2.43.0


