Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C952BE44
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 21:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765358; cv=none; b=cR8pCq3XDIDNYKVfgFcyBhDBAdCBF5xqCHgrlEdDOkBQAY/HBXI/oDObVzxbxLfh4TJrBFS7sZt/LGo6K6RwqjQhLHJtEuuvyGt9AK8qI43KrjTWJLeZ3bqNgGBmJZw6e65A0qB442VehwunusLHPiIvAfHXZFwrCv5J+bq/CbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765358; c=relaxed/simple;
	bh=khvWqygseB7fpC76dgUJOaNtCER/GOHR4LnPt6eYkbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/bKhAdfHGLpWka2krbELHxjjqtJQ2UyZ5Mqozb6GOWEirBeYmJJoGsX19nQGyjWZCb12Ut9ctkefSeFiJS2NkxCwWEfWC7QtoEnQIHmR7DIoGz72PBX928zqPtMYIs24Vc0HIFjhOjke9Y+bsInX/bj1BHEYt+ae7szyVFc9+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Or7e4B3r; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Or7e4B3r"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c8ff1so1344895ad.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789765356; x=1790370156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SyEeb8Fr9emmHGcnOcMAo5PWMFsb+SWAIx+uH54QAkE=;
        b=Or7e4B3rgTGC2PJTVavYfeXYS2xnDUUu3+TUQOgdl46aB0i8tmklIGX+k1VhuPZEcW
         lpsSueYhj54Tyh8RSoM+0FNPjNjvA/IXnDBckfe+G0RaNMz2o5zQmHBR0YNo0srDBCYa
         ls9x1CGMEbYVKKg7dlwDheSchWRT2rVi3Iz7N5Gzv9h1YfS0vg7ZHB9biAieqWxDb19l
         o6NfYUBW7hXhSwGSNFIrhPCZluhRYd98mIxofJ0qzqljq26pHNCXlQWMuEmsKqu/Qlh2
         RQQBMzoiy64u7tdVtPV/UENLrUw1JthHBqS+LBMcGESWx9oLM/ZJxb1zplCTqMWzYgOP
         bjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765356; x=1790370156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SyEeb8Fr9emmHGcnOcMAo5PWMFsb+SWAIx+uH54QAkE=;
        b=PWBSkDD6dEacuF3JUGi4b0YlEcdOagC67EJZscFhI4ZZfd56MnV+eOb2lYh88kHN3x
         v19atuQg0YuwFCNUuje9rBjfw/+iaj7V7GFVeq9L7kltmrkMqTqUdfOktrOZEsh4Jnin
         zI+vELsMwNlALM0sn5DpO/YdEvmbSGRdwzvbotdK5meCXbKN/Q9MXVFZet8VzjIm76uj
         c2MpE1hulVExOottr6DOyZdmtbQySro8Cd4S+5f0HYyK8RubgXsQ0+DYza7sp9/M+ep3
         0V02NVmm3n7igCEjCAoqXWKUfPImin5crnIwTmYr8+FHIaXMsU3JDz7d77ly2+FplDSH
         I6VA==
X-Forwarded-Encrypted: i=1; AKwUvBxsnJTmFb3VFtaSKBJGrlCXVUeeAAfXllwgsexxwzBXubRDI8gdOPnRS1ofg6EPRKcrw1T+eRq9aqRu@vger.kernel.org
X-Gm-Message-State: AFuF++kD3OQpsQqf6MC6ZPo+pvsJTEEjA2ve3uDQPg013o3PzlLmASqe
	KjA6vQzA+THk9a6OwJ7SYzgA1a5OEGjoAwdD6svtLema/9GgwRSKjgZw
X-Gm-Gg: AYBFou0z5ljc397FbNcULo5Nnu6MY121ffOx9RXa732PLrGBnDqz9eWPxcSOqFN97lB
	4QAwvmZt6uijtw8t8L3mfv+efQ36+ylI1ZMlBvooLJ7kXWqY8SZzEB6imygHfegFstGed94fUHp
	trGwP1c4B/DNyx1NP8gw4GauokmSzeHqYz7u3tvD6Rkj3GdAG3kQhAVymUy1/GjyEP9eT6Wfg0y
	B/D6cOwGC7cb4x6lTY6Rf90R2EY+LcRXeit41qb5YkucEZhokDRvpe2A6fA1mEFiHarhd9oSlQV
	j3lOWNy5hcOQwfDtuLVoi3H0sKdHcKeg6t8bLccIUkX2iR95+6Z/0ERP4TDEQcvVxCFYqmvPfuP
	rV32RWZsgGBTPGwEynt0oPuHap05PCgQpRYuk48eCfWmDX8fTn8Eez1eAmz5rfcF5YBOb2oPhE+
	If/4ahBQ8yONdv+QumDmgaIB2UvCM6g979ACOMT/P7zz9kRdR4jNKnlzgdvRlo3s3FCtXtOS8p4
	iblxV4s
X-Received: by 2002:a17:90b:4acc:b0:39d:f130:ba54 with SMTP id 98e67ed59e1d1-39e549c111fmr6837005a91.0.1789765355954;
        Fri, 18 Sep 2026 14:02:35 -0700 (PDT)
Received: from [10.198.60.252] ([2409:40c2:5404:cbbd:a461:609f:eccf:23f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55ab3a3sm1396904c88.5.2026.09.18.14.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:02:35 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 19 Sep 2026 02:31:24 +0530
Subject: [PATCH v3 3/4] regulator: dt-bindings: Reference Tegra regulator
 coupling schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-ti-tps6586x-v3-3-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
In-Reply-To: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789765290; l=3311;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=khvWqygseB7fpC76dgUJOaNtCER/GOHR4LnPt6eYkbw=;
 b=Vq0Gccle4lp1aryeTtZiKIETU7HnviwUPyZ5s/r/ULkM3lkxhmNg6Q8Vtgw3WXgae4i/a9tn4
 HSSVF2sS11XC5xTQnXE+/mBx/bMvpoV8S/ruSvxGOGyutaNiLWg0G1P
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
Tegra-specific regulator coupling properties. Update their dt bindings
to reference the shared nvidia,tegra-regulators-coupling.yaml schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml       | 12 +++++++++---
 .../bindings/regulator/maxim,max77620-regulator.yaml         |  5 ++++-
 Documentation/devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index caff9dc0b2bb..798d27099401 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -99,7 +99,9 @@ properties:
     patternProperties:
       "^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
@@ -112,7 +114,9 @@ properties:
 
       "^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
@@ -125,7 +129,9 @@ properties:
 
       "^ldo[1-8]$":
         type: object
-        $ref: /schemas/regulator/regulator.yaml#
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
         properties:
           ti,regulator-ext-sleep-control:
             description: |
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
index 7118c34961ba..67fbe7d6dc1c 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
@@ -22,7 +22,10 @@ patternProperties:
 
   "^(sd[0-3]|ldo[0-8])$":
     type: object
-    $ref: /schemas/regulator/regulator.yaml#
+    allOf:
+      - $ref: /schemas/regulator/regulator.yaml#
+      - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+
     unevaluatedProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml b/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
index 90c39275c150..6768fc6ea0d3 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps62360.yaml
@@ -20,6 +20,7 @@ description: |
 
 allOf:
   - $ref: regulator.yaml#
+  - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
 
 properties:
   compatible:

-- 
2.55.0

