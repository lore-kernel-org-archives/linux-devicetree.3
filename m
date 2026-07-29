Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FDB3BED08
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785308893; cv=none; b=EIjYJJWZPXo2qOhHBNG479+tFTgM/pPiObevZVeel9411bpIw1do+I6b5zo6ckqZcnXIWWKwj/UaltCAliE84y13Ct0jEJN5sPKoNH3Q+YTkeQs8NJ/iD8AaKLHpszZ9sNTg8/etvL7qiI5/0Q0WAiPNrjxUYg2XGI/mHeSKAyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785308893; c=relaxed/simple;
	bh=P3FWPCjBP6pAGlnH8F85iO2/rzbGLfWKY3/sK26FfLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DZZHZZmg/eHpXkxBqk5CMBpHHG/oHoaF7DwA4uJnnvgmpqMdglikN7wOjBxIlSsXRCVzYnShDNxzP7AP/QNlJqbntWeWlsH+LOzInvO09yAPD9/DLBsjYakd92+TQtcdquUJrQNLWWp+2QZRdlcUCZo7PHX9edkSBDrKnsJeBdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiuqZwX2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiuqZwX2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so79711a91.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 00:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785308891; x=1785913691; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HqdyLYriWwjvooA0ORxQmLjwDiVqgXA5NTC4AkVBgdk=;
        b=TiuqZwX21qSdKlgH8Z+egdsW3aWTJWgbyg0aBBTlGeCsLSDOJ8ZdJDt9eRGWaHP9b3
         4MNdlIWwrvj34CoC4G3CDtlyUAYPZw+k+NBN3tAK+x8smcn/nZ4VujlmHgFNrTHSOAj5
         to+3fo41Vv+VsNGkoquJwaiTdZ0MlSSfONSluTXn8jsQ/vdaGdbZARZhDvEnW7RmZJIk
         o8LyCiKPFCOWsr8rIq4xJtKQTPtSATWyYz7eLNzfnKxOEU3qNuNSx6CfB0mUWESducRi
         +bhEmEhANQKNmSNVCKiz2nqeAiyVqMWIThKBzTafHUvTIrcB98/xyQwhnRFlIQ7Paz3K
         ugnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785308891; x=1785913691;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HqdyLYriWwjvooA0ORxQmLjwDiVqgXA5NTC4AkVBgdk=;
        b=piI4ly8yRMD6bQLNyoMD/m/WIJuXWC2C/9L8DBLMjRTnPH70ildVvflThSXGjkC1Q2
         6aYPnkhQ85X+YSVurTt0/oWBqSAsuilZFhPutROLingmmjC40cqxevONaLPTv7CfZG38
         n9zZNxfgJM8c9UzbrUJNLlESDbZPjPQv558gA76xsLFYMuzF41yiq5ErNtuET8ZAhF9L
         jEs+smb7IXU43n7IQVD+Td0Ti/8D7ijZ1aOSQmRATqoMyGCNOTtXcfJm4J0kN+Cct0vY
         SU8rzdpPvkwpm2DFyT43DH27Upu40KFuRJcXTbeOhTMcas0VLMk70VTLoFjXaIXC6i6s
         6OzA==
X-Forwarded-Encrypted: i=1; AHgh+Roj2Hx5L429nSssVrbWHBL8kf6qIkmuF69/9ZOnTZ/LJmjCw/HFtsU5/NFY/dE8IzWkErIrRetFTmhq@vger.kernel.org
X-Gm-Message-State: AOJu0YyzG2cIc7vLjpllUdrDjwP8PQcq0bh5rhDDed7lOX7Dodq7NT4+
	Vuw0ZzleHZbio+QsMUeCdy7ejmvN6m02amivunCCMsw4ooR3e0uCZIL/
X-Gm-Gg: AR+sD13eYoKxZt3iwYO1YR2mWp2oJ9YtoPlAYPJh1KxvgqIeST5nzdqfvOQFa8gGUTY
	rTTjmWHI/dxPYja4pgGkuXX8bLITnAlZOQ2hTkifnbb9lB//ap9rmJd6k5ebtAnJSe5HuqyEH/m
	k9YSTPGeODCPS+FCjHkX96Y/srwutscZIRfADLZ1Rqg9dGBsylQbV91CaWNbJwrQRMKp1qnRYLQ
	afohVN/HBJ9uyHFfnxY/2b5n+1g/gGqvftpnBtf/xdQpiVDnlDgPsM5V3s4cupKaE7qqYdSXVop
	p/ClI9fbd4GeHqLQ/S4hr51JgZQ+/K9OFX/nx/uu30eFc1XIc+QqvKBvyGTqBFxy9L0HxvVABRU
	z9gT+4iaDwvWLZGK7DN+FVcFYrKFE/Z0LRNstRflncZXYwfV/kPu/ZXyqQ7vX+iFUnCW/0PkxIS
	DclRUUORhOzLH3r7/0iK3gxMlXYGlCPRxNfs0DxlNryCJJR3GE+z9ixkGddEfPELInN8eDOw==
X-Received: by 2002:a17:90a:e7ce:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38f7c991f61mr4585139a91.3.1785308891140;
        Wed, 29 Jul 2026 00:08:11 -0700 (PDT)
Received: from [10.136.11.252] ([2409:40c2:500e:cf:36e8:6bdc:17c3:c887])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265be48sm6415402c88.8.2026.07.29.00.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:08:10 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 29 Jul 2026 12:37:55 +0530
Subject: [PATCH v3] regulator: dt-bindings: ti,pbias-omap: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-ti-pbias-omap-v3-1-20fcc0bdc890@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NwQ6CMBAFf4X0bE23QFs8+R/GA5QF1gglFImG8
 O9S9EA4TvJm3sw8DoSeXaKZDTiRJ9etEJ8iZpu8q5FTuTKTQiqhRcJH4n1BueeuzXueCmNtlmp
 lM2Cr0w9Y0Xvr3e4/9q/igXYMkbBoyI9u+GyHE4Tdvw360J6AA0+lNomBGIyAa93m9Dxb17LQn
 uTOlvJoy9VGqaqiTLRChXt7WZYvKKLW1PoAAAA=
X-Change-ID: 20260704-ti-pbias-omap-508cc9576c91
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785308882; l=6118;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=P3FWPCjBP6pAGlnH8F85iO2/rzbGLfWKY3/sK26FfLw=;
 b=k9lex35uLuHdSQqIKJUfhyLBPrRwGbchdahE1eeaBG5CB5PBWHBJ/s6J1zmOmrh15SXFjDc0W
 IInbnjwd8tLCD7BuykSFE2OoBeHQpeWBglT669HGj8Sq/VuctGhE9po
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments PBIAS internal regulator from text to DT
schema. Since all in tree DT uses SoC specific compatible along with
"ti,pbias-omap" Convert compatible property to require the two-string
form.
Add child regulator nodes as property as they are fixed and node
name is matched by driver.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Fixed typo in subject
- Removed unnecessary full stop
- Added explaination for compatible changes
- Removed exact matching of regulator-name as only node name is matched
- Added additionalProperties instead of unevaluated as binding doesnt
  $ref anything
- Dropped unused lables
- Link to v2: https://lore.kernel.org/r/20260722-ti-pbias-omap-v2-1-e26fbd476e6e@gmail.com

Changes in v2:
- remove top level $ref: regulator.yaml#
- update schema to support OMAP3 SoCs to have both MMC and
  SIM PBIAS regulators
- Link to v1: https://lore.kernel.org/r/20260717-ti-pbias-omap-v1-1-527848131801@gmail.com
---
 .../bindings/regulator/pbias-regulator.txt         |  32 -----
 .../bindings/regulator/ti,pbias-omap.yaml          | 137 +++++++++++++++++++++
 2 files changed, 137 insertions(+), 32 deletions(-)

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
index 000000000000..4533f337963f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,pbias-omap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments PBIAS internal regulator
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
+    unevaluatedProperties: false
+
+    required:
+      - regulator-name
+
+  pbias_sim_omap3:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+    required:
+      - regulator-name
+
+  pbias_mmc_omap4:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+    required:
+      - regulator-name
+
+  pbias_mmc_omap5:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+    required:
+      - regulator-name
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
+additionalProperties: false
+
+examples:
+  - |
+    pbias_regulator@0 {
+        compatible = "ti,pbias-omap5", "ti,pbias-omap";
+        reg = <0 0x4>;
+        syscon = <&omap5_padconf_global>;
+        pbias_mmc_omap5 {
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

