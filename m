Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505007;
	b=ScPLlZDxRBcMrFecy3ztoqJyfnQvV5gTYlb7xxU2lJKUY9OnWYgKRtvb1HrCEmLeMNK0
	 d2eyfCKqJD/4qVL8XsLjyXLdntZhGshBB8PxCvnbu2XQhMfnH0cmLk7psNV2OK7EEwRb6
	 BAEgvis0DFeYXRJje/32iA45p5VUkH+1uasIxU7d8pqP3oLXUEB+cvbXfxd9x4H8zKjMn
	 OHgu+5t5gtkUOL/miKyCnkXp3ZkwN8FNOAREdyuX/mIxnd0WqFYjo98UKGpfQAc3TJauD
	 UzdI6SAf9RRNIyP2oVlcb6NZUORC+fJWLtonqxMcsndUQBz1N13OAl0rRsMp5r7rkoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pUI83F+vNn47A4zRNccyxKlCOIII3kxuZu0/rPY+a/I=;
	b=Nx8uUkrBU1ItjQfv9Z9+OcirECNbbMR30cM4QLpMm1xeibtj8jwuAxre5+t3OIeaBq//
	 H/VaBkLMRYm65xlveq8Rcck9odGSPaAITk44xk+Lq5uLFUavP14jMXz7xWveWSTmRTxbV
	 gcBzTfkMMoNmcUpKN9efYo6WbKzlZlt54qhV61acoqN0s428l/JMMxDau/zinknYR2t9n
	 n9kemYkKuhjL8TJSbcJUY7OSi1r8FGNHDsAQPiMGwUzaeqCtjl3aSr+wg2sdNJT5QZb2z
	 BUP1It4hurpJ4+hxNAUZ78bvyVyNpdGDQOSIlSt5AM/rMN5KNj4vzf/6FPSdAR7ik9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bzOyA8D1;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26097606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26097606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bzOyA8D1
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ea138a3497so8084605ad.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505006; x=1793109806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUI83F+vNn47A4zRNccyxKlCOIII3kxuZu0/rPY+a/I=;
        b=bzOyA8D1o7tzU8aPzMA88tVzSTY7eK69edveH/y5VPe3Gyr8aR5EDzQrCJfrVuit3x
         7mThg5r/0FHXHshjY/nuWitlE7MZkRTPFL1bTV/GapmMdRPQWFj9Om0qnXb6NqxCrZpN
         sZSulCcJ3r63DJCj6wBmP+jQFm0/00E4vaXrn0gswYUvBFjiUvA9b3noP6sZuwPLe3OA
         CfhR/iFTQgR1f5nGN0AOtVXs6UvOgut+JeUTKb2coIli2Xav7BmtWq2hVFCEZFvElCqn
         QkvgDGflnz74TgRRs+qRVS/qawtYIBFPIxxb29CZgdXB9tlzgSpZXhBc1vTMo/0lGK2G
         SQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505006; x=1793109806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pUI83F+vNn47A4zRNccyxKlCOIII3kxuZu0/rPY+a/I=;
        b=gFA7rNHKqTaoGvUdiM/9NK5S5k6dPRwzZ+1n76RMdaBMokHgGHigm4w+1iQprSYcvQ
         fintDpCLl6elnrvQTbnaiQGpytP0JYea3Sm2Puo4EV9z0CzUs6dNRsUqgIsqbuzrjnQE
         kJvca/QDtXFEswmE6O6yAm8JtGxlGXLDQUgAkhC6UGYOk4iHswFTB7IQ790U/Hq8gJSQ
         lh+zLYZMWGkucyXarsdkn7hl9nyB6sJLjjI6fLE75tQn4hd6x7CpMkIJxmzVTcG4JcBN
         FNTV2B25QDBvvJ9nkxsuTYXY7f/hzEO8axWGxFe+pu4qfPKpe6s1W89voihsh8xy1Thx
         hPgw==
X-Forwarded-Encrypted: i=1; AKwUvBwlFr4dBkA2tRkMJGJ6yYAjMC8MPt0F+FQMkZFI6uXrMd+QmhBZE0uwmnbBB4d4NzXWkmLuPjFl2nAX@vger.kernel.org
X-Gm-Message-State: AFq9FYJz8kpsqJI511uuJGw+StnaGh6kAYGfWnpLf1SQEEABX0Rv57AR
	+J6ZSojW3Mv97HBKcFIta8dPUrdE4mhFv6r9jT6C3YLrevEkAJN/YfNL
X-Gm-Gg: AYBFou2DkK1cZlZdxyODJau5k4j1seMvgwFKCnFAK0cVKgUytVqDFkzFId8QX61Tabj
	GmDo5GL5K9IdMbfcgt9JFfsTVz5qpl2+uYS7wG4OGuN8+b01upACKWSscZsroIXqFvadJYpuuju
	Zjbv7/s1j8QjO0qmilK6oa0/HgDjhHhtxU7amip8B1Lsp8lbs+hilhmglCatQYpoDaxmStFlqpD
	rmxxrfTtbVOrhaBb5v+TzYWgzdfc3Si+1UzwvVHY1WWcXerRMahXu6ljyGkcfpAP3zt7WmCO7bc
	OVMdSgJeyYkR160Nu2x6n0BZBWaICoXQ3C/tIwfK/Lqb/RK27/wubpS127KDy90Bg8PV3GSjUU5
	99UwyB7BXsFAwBbmJjxhGivsLOYGI23CNm+5APpyA42c/icG4ay57xA4Cvh49fTmTHzGp8bHriY
	M1ilWnrTFBUnhH5sK/4bm1W2AiH7tLpmzN0UeTnVf26GikhPs6wj+XA+3IEEQ1t0D3WSAOnoLmS
	6padN8HUqc=
X-Received: by 2002:a17:902:e547:b0:2e8:93b5:c555 with SMTP id d9443c01a7336-2e9a6e5296emr88242645ad.61.1792505006159;
        Tue, 20 Oct 2026 07:03:26 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm12434865ad.51.2026.10.20.07.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:03:25 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: mfd: rk8xx: add board level power hold GPIOs
Date: Tue, 20 Oct 2026 22:01:12 +0800
Message-ID: <20261020140127.720-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261020140127.720-1-yaozhonguwl@gmail.com>
References: <20261020140127.720-1-yaozhonguwl@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written,
otherwise the rails can drop and come back up instead of staying off.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time. The driver reads them for every RK8xx variant that is
the system power controller, so add them to all seven RK8xx schemas.

The array is bounded at two entries. Firefly's vendor kernel handles
exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
files use one or both of them, with an RK808 and with an RK818.

The lines are released from the PMIC's power-off path, so they are only
meaningful when the PMIC is the system power controller. Require that,
accepting whichever spellings of the property each schema allows.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk801.yaml          | 23 +++++++++++++++
 .../bindings/mfd/rockchip,rk805.yaml          | 29 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk806.yaml          | 23 +++++++++++++++
 .../bindings/mfd/rockchip,rk808.yaml          | 29 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk816.yaml          | 23 +++++++++++++++
 .../bindings/mfd/rockchip,rk817.yaml          | 29 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk818.yaml          | 29 +++++++++++++++++++
 7 files changed, 185 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447..2f9554d 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -29,6 +29,25 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -71,6 +90,10 @@ properties:
         unevaluatedProperties: false
     additionalProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+  power-hold-gpios: [ system-power-controller ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da23915..1a11c98 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -48,6 +48,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -102,6 +122,15 @@ allOf:
         clock-output-names:
           maxItems: 2
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca3..3df5501 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,25 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   rockchip,reset-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1, 2]
@@ -138,6 +157,10 @@ patternProperties:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+  power-hold-gpios: [ system-power-controller ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..a331a2f 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -113,6 +133,15 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index a58d945..f90e5d5 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -44,6 +44,25 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source: true
 
   vcc1-supply:
@@ -101,6 +120,10 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         const: gpio0
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+  power-hold-gpios: [ system-power-controller ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d17..b1cc54e 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,6 +55,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -189,6 +209,15 @@ allOf:
           patternProperties:
             "^(BOOST|OTG_SWITCH)$": false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c..96ec07a 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -105,6 +125,15 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3

