Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638E9439F63
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737540; cv=none; b=NuELbmer4uE06Fj67QkOJbCTE0OEzTL1JS+9vHKdL6UzSSQAYGD8BR14UTvCNt8k53EQf0AJ8AptECr+kag8eznhoftLnOoC/8Z2a7k02bzDQaSt1J1Bo2XuStX5eVKGt01ysVnw/Z6rnoPO+eZItcXG0NEb5a06uIgN90y4Gvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737540; c=relaxed/simple;
	bh=Q1wuWECj42vCLS+URmSb5ph9RRHOC8awovhHQ4C2hd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UAD3VoNBC0QLKFzDATE4mEJTJquBfaL6qUTsPYRbSCSvqRx61S3yP9VYhVyzqlpzcntr9l9Qew/X6CAUOa/WC03d8Ehf+LbiJ+7GBAtgllqVABTMzdVQFSH4DJSZxuDwvaGmL/rB/kJRnPnnFrHK1OP0WgxVBnMvNoPu6AesYa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FShDo8fu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FShDo8fu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cad68425a7so25915ad.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784737538; x=1785342338; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OgRGHfU9FKq0Kw0lO3kLFF9gLYq/7E5KP8sqK2HQkpA=;
        b=FShDo8fuc6nAvJ3adphQ/3tQ4GuHMZirG8MJYOsPjxeJjBlZWO5soXRGjyz4C+Qv0/
         YXSumjj/gigBFZ6KU+6KAugMqHY/jwdVXoQ+tB/N623R27WSQUK+fg37kiWDxcK3498p
         nBVOzE6K0x1QdziTMWxeyEmggVX/9fzns7fKQwAIT7PyrK4dWT66nkRLIXi2TVIpOiiR
         q97sz4BJkUUbAFjTffWr+QLHganNctnV0DUnsD+VUu+MhK3PQdwJr3y5T/VVe2Ep2ECR
         dNhTB4wAXjqsO/Wks4Gnn61gg+gA1jNR1NaIGq/+spHLsOUIn6XD9SVWXJhvimr0GcCF
         z7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784737538; x=1785342338;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OgRGHfU9FKq0Kw0lO3kLFF9gLYq/7E5KP8sqK2HQkpA=;
        b=YkMNJJ2jizshD1zuK3Gu2xfxoWXLd74BkPNDZ/3E6AGt5/RwsMffxJvmT7qBEAKmF4
         TSyon2anWU0FHdB3pYYRGU3EQs3OUzlfgyosQbTmpOf6B/FxqcPLpfpuuckVzjcCZnzh
         WA2kqAvIvnf8m9ZNKWmmnTqhxpbjCzsMbxsEv9QQHGFzpOat/uXJcfa+M+HzIExvYokg
         1pYgHr7K4nfhSizoqfukrtbY6AShdEnlHgYjm+40FO8+QRyI5RTJsZABuQhjVN0isPy9
         Pr/RMR7O9WcG7Q+KkTl06LsaBAASFDvAW54JZxIBXDDTADy1KH/cureq20rpA0aEfVkw
         Zovg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3TM1ur4S8UJNzVw92eFun3ng98Bj44rPoX4NkXSgV88gQRsg8Yng6CcLa2cPcP5esqGxeBSkpcN/K@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7O+svT2auUNICPHKZC+Qd/kdvLo1BZ3wfeJlvSwuy2ynQfCVz
	aunCzOWVBhVGpZHMwsBumhXrkDh45cicgJq2QeNm+PZ/nQbiTb3Xa6D78ydiHQ==
X-Gm-Gg: AR+sD11b2yzbNiUTD2OpvYYSaY7kXS5ue5idaScuoM6YveFIq4hCDbNAlD0sY+ek8L0
	aBsUqVCiL+oLXHw8eEm3cLEN6T4wzlGBppb3kSKbYq4pMAbaaoDyQ8k2GALEkLuRN7S34LyMPi5
	hD3b1hmVzEyBTAOwq8+kldrjWO7u1P4SxMWchtZUbDs47JkvVFiVm0pXDQOt5mcleIbzo9AU+GL
	QfykjhVua//tt48bE6p7RnTy6Atu+ALwy0eBFLACntiXOu3th/FJXUXIR7g/xAeI1/aVrSxT9Xt
	kk7aTc240qIXv13JOUVKeAXdBZt4YPIe3KYZ3viKIzGMo710+KOYuZNMOsQGh8h1TSkYH976B2Q
	voCWW/9+yPOoAZIQtL/K18bPl4YDrCzWWbWNTQ8R8TGS9Tf4jpawG+SBSBsgpL8CioVa9SWTwhu
	mzXwSgRSHEBr9Bn3g=
X-Received: by 2002:a17:903:1905:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2cf80472f4amr73008795ad.4.1784737537497;
        Wed, 22 Jul 2026 09:25:37 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5428:2944:6b74:18c8:3132:3887])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081985sm11099602eec.23.2026.07.22.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:25:36 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 22 Jul 2026 21:55:07 +0530
Subject: [PATCH v2] regulator: dt-bindigs: ti,pbias-omap: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-ti-pbias-omap-v2-1-e26fbd476e6e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NQQ6CMBBFr0Jm7ZhOBVpYeQ/DotQKY4SSFomGc
 HcBXbl8yfvvzxBdYBehTGYIbuLIvl9BHhKwrekbh3xdGaSQuVAixZFxqNlE9J0ZMBPa2iJTuS0
 I1s0Q3I1fe+9SfTk+67uz4xbZjJbj6MN7P5xo835tUn/tiZAwk0qnmk6kBZ2bzvDjaH0H1bIsH
 y7TIiK8AAAA
X-Change-ID: 20260704-ti-pbias-omap-508cc9576c91
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784737526; l=5885;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Q1wuWECj42vCLS+URmSb5ph9RRHOC8awovhHQ4C2hd4=;
 b=jvFuMXX9tA5w95QdfLAFNllsxlQkf5L5HUr1QQr3Cl2UN9K4vp2HaCQUTvKJkNuwPU7wp5GHT
 hgIGZ3zJIldDXXW4pt/YE0O0lLS0eAiZjCTcK7f7M/PGfb6gC66lk0x
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments PBIAS internal regulator from text to DT
schema. No Functional changes are introduced.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- remove top level $ref: regulator.yaml#
- update schema to support OMAP3 SoCs to have both MMC and
  SIM PBIAS regulators
- Link to v1: https://lore.kernel.org/r/20260717-ti-pbias-omap-v1-1-527848131801@gmail.com
---
 .../bindings/regulator/pbias-regulator.txt         |  32 -----
 .../bindings/regulator/ti,pbias-omap.yaml          | 157 +++++++++++++++++++++
 2 files changed, 157 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/pbias-regulator.txt b/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
deleted file mode 100644
index acbcb452a69a..000000000000
--- a/Documentation/devicetree/bindings/regulator/pbias-regulator.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-PBIAS internal regulator for SD card dual voltage i/o pads on OMAP SoCs.
-
-Required properties:
-- compatible:
-  - should be "ti,pbias-dra7" for DRA7
-  - should be "ti,pbias-omap2" for OMAP2
-  - should be "ti,pbias-omap3" for OMAP3
-  - should be "ti,pbias-omap4" for OMAP4
-  - should be "ti,pbias-omap5" for OMAP5
-  - "ti,pbias-omap" is deprecated
-- reg: pbias register offset from syscon base and size of pbias register.
-- syscon : phandle of the system control module
-- regulator-name : should be
-			pbias_mmc_omap2430 for OMAP2430, OMAP3 SoCs
-			pbias_sim_omap3 for OMAP3 SoCs
-			pbias_mmc_omap4 for OMAP4 SoCs
-			pbias_mmc_omap5 for OMAP5 and DRA7 SoC
-
-Optional properties:
-- Any optional property defined in bindings/regulator/regulator.txt
-
-Example:
-
-		pbias_regulator: pbias_regulator {
-			compatible = "ti,pbias-omap";
-			reg = <0 0x4>;
-			syscon = <&omap5_padconf_global>;
-			pbias_mmc_reg: pbias_mmc_omap5 {
-				regulator-name = "pbias_mmc_omap5";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3000000>;
-			};
diff --git a/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml b/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml
new file mode 100644
index 000000000000..ea904946e352
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,pbias-omap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments PBIAS internal regulator.
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ti,pbias-dra7
+          - ti,pbias-omap2
+          - ti,pbias-omap3
+          - ti,pbias-omap4
+          - ti,pbias-omap5
+      - const: ti,pbias-omap
+
+  reg:
+    maxItems: 1
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the system control module
+
+  pbias_mmc_omap2430:
+    type: object
+    $ref: regulator.yaml#
+
+    properties:
+      regulator-name:
+        const: pbias_mmc_omap2430
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  pbias_sim_omap3:
+    type: object
+    $ref: regulator.yaml#
+
+    properties:
+      regulator-name:
+        const: pbias_sim_omap3
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  pbias_mmc_omap4:
+    type: object
+    $ref: regulator.yaml#
+
+    properties:
+      regulator-name:
+        const: pbias_mmc_omap4
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  pbias_mmc_omap5:
+    type: object
+    $ref: regulator.yaml#
+
+    properties:
+      regulator-name:
+        const: pbias_mmc_omap5
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - syscon
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,pbias-omap2
+    then:
+      required:
+        - pbias_mmc_omap2430
+      properties:
+        pbias_sim_omap3: false
+        pbias_mmc_omap4: false
+        pbias_mmc_omap5: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,pbias-omap3
+    then:
+      anyOf:
+        - required:
+            - pbias_mmc_omap2430
+        - required:
+            - pbias_sim_omap3
+      properties:
+        pbias_mmc_omap4: false
+        pbias_mmc_omap5: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,pbias-omap4
+    then:
+      required:
+        - pbias_mmc_omap4
+      properties:
+        pbias_mmc_omap2430: false
+        pbias_sim_omap3: false
+        pbias_mmc_omap5: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,pbias-omap5
+              - ti,pbias-dra7
+    then:
+      required:
+        - pbias_mmc_omap5
+      properties:
+        pbias_mmc_omap2430: false
+        pbias_sim_omap3: false
+        pbias_mmc_omap4: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pbias_regulator: pbias_regulator@0 {
+        compatible = "ti,pbias-omap5", "ti,pbias-omap";
+        reg = <0 0x4>;
+        syscon = <&omap5_padconf_global>;
+        pbias_mmc_reg: pbias_mmc_omap5 {
+            regulator-name = "pbias_mmc_omap5";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <3000000>;
+        };
+    };

---
base-commit: 1e9cdc2ea15adf4a821eefedabf6c0c8cf0b6a55
change-id: 20260704-ti-pbias-omap-508cc9576c91

Best regards,
-- 
Bhargav

