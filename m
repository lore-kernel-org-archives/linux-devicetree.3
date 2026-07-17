Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C10E37BE7C
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311613; cv=none; b=NM9jhUeGhu1swAAhvTPamz+Aill61xry9l6q6pwf8CHFNqASGH38a3ecsLu+3t9hWbfb6ch+UA65UVQg9vdGcP0zhhR7x8WmXoTV3vV68BhTtp99wiU2cl02MJOC1VQMWRxbSRuGchtOCOB+Bb7MCWwdyDZy96qoVteC5GXGZYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311613; c=relaxed/simple;
	bh=+v6zUGdaY85Do0AaXBBpVTholu8Imfhu/0Sj1o6gKm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UCHeaptxRfqWiAucBkHfYb9I6lIxvuxXlgszsxa42anR0e0x4mOb1zAuCVUHgQYq1syWCDXoUh0qiISecLEI2+pLEoEzB1njeK3uA1j0D6ZyozwOpZAqHyfZ7et6weYW9h+SMW9nNEfeYzIhKn+eaVsYoLZkr8rbGJfEx0QQxmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTPE0xSf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTPE0xSf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cecdc24b1cso8041095ad.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784311610; x=1784916410; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iLC7NB3P45Wnxo9kh67hc9jfjq1FpvDhoHTvr5AoAu4=;
        b=bTPE0xSfjAb9Z2EI/Yvst5rIg0/MyTEeh8/NxRFhN976h9PNxCYFj7Bo3+b9RuAiYW
         FmaAAy7g7HNqm2i9J87ws39yGsqKtCLJ4QIZFkLyBHMY9Pma8KbRPFAGDLNjymnKDV2V
         NtAhZmVG5ok6gepCt/wE7gFR38zDcswiIHuwmUB17aWo9wphpYQ4QSZcia5ONkW4Pytz
         3EGscxDYAJlJntKEytdv0dxlmkRdYGJHVxljCs+E4dn2pLwgUWqKYiDGx+I9ivFKG0hH
         hH/fJHNAkHZkYmnCwXM44j+BbFmcxThtyDpJ9Y6WTcuM0W5lOuPYb+dyh9ySw1gknyki
         QeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784311610; x=1784916410;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iLC7NB3P45Wnxo9kh67hc9jfjq1FpvDhoHTvr5AoAu4=;
        b=H7+1EVnPw0z4CX7UXy4qF2Nv3oL0hsOoYpGu89dIzMiYzlGzbC2FZJj/NEAiu4hRsD
         iSo12JdgPxj3mNlLipA59B97Mg86MkiRMC3VyNPVH8I9x91n2z2Rt9Bok/6UbZ9dKI3I
         bRBUnXipFigPx0GSgBSQXGonXaAlP9/vYQmuE7JanBLU40Ds7BMRJhwUBtYNhI9tlWw+
         pqfF9FwMECbY7eFayGVWxYecB1N/83JhysbSE3tSRK5K4wX/CiXfPYt3yEkF0f+1Xj3m
         KWyOV5y4Kn2gtNyzlePhOfbovhdazr+EskLtRLVl4itw26YcDjqjzrLFDozoyf8wEmzk
         cKFw==
X-Forwarded-Encrypted: i=1; AHgh+RquZTbKBEB1a/Kvj3BBsQ43TNgEX7VySOaK6rtJEDBJni2p6T7Ue5WqaK/e5f0Zi3sm9YJpScXXY4If@vger.kernel.org
X-Gm-Message-State: AOJu0Yybmg+fNVTJV/tGZe+e3Brej+nod7YxWZlGUGvbfjfP3lp5TDUg
	YhS0jcPj233Y1rY4+Sv56bNzvGrIIOzlbyJRamyi9a4HEIdcTH8tySWFo8XdPg==
X-Gm-Gg: AfdE7ckrsIFzIfgB9yVFhOBFpkBm4aZj/0iOvr13ZFkIHen0IWX2MoUkwST6/KCUsuQ
	GVJ7DmksB/fk4DLGV2qFBstRS3WFXT1oqodztesyVBJrqIuXDZvffk3BXOn7toLLGPb8W/ROw6m
	poW+CU89C+Af3rRiBx0d3avAA3QWKYcFRP3AUNAS3NCLuXBEtskmFbeCjpHIL9LHAKrUg9z/SII
	I9KjCun9+eoxAJPh2EI1Kawd/R0VCtSguDfzQfvXn0YCDUdrlCPeiAY9GMxXAv5+ZoanUx5Dn85
	Ixc2lU9+7J4jYJFSoHQidjej3UIbHHJQCouVOVGcfCgKWPa5EE0XqMvWx3u92k6Z/fV98h2vk7+
	yWgAC1QmJ0jcVredEE7Nc39wUdNclPARo6gqK5zQcQPsva9nQ6u9znF/DK9RgomvPrIXp5u5p54
	3zcvYKkr8oZw9JZg==
X-Received: by 2002:a17:903:3bd0:b0:2cc:f4d4:29a0 with SMTP id d9443c01a7336-2cf3493b6ccmr32413675ad.3.1784311610511;
        Fri, 17 Jul 2026 11:06:50 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5425:b99:7cf7:c083:fd30:1cea])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb7c5sm7115280c88.10.2026.07.17.11.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:06:49 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 17 Jul 2026 23:36:33 +0530
Subject: [PATCH] regulator: dt-bindigs: ti,pbias-omap: Convert to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-ti-pbias-omap-v1-1-527848131801@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IokZ7FXERx2mdQjVkbBEkd
 zfV5Vv8f4ByEFZ4ZAcE/onKuiQUeQY0u+XFKFMylKZsjDUVboJ+FKe4fpzH2rREXW0b6gpIjQ/
 8lP369cNt/Y5vpu0/gRhPrw4ahHEAAAA=
X-Change-ID: 20260704-ti-pbias-omap-508cc9576c91
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784311599; l=5419;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=+v6zUGdaY85Do0AaXBBpVTholu8Imfhu/0Sj1o6gKm0=;
 b=nNx9W5EMiHd+rRyF7NLAKrwdVQIOAVHb5IUQLml1o0mAMg88k/YdOApPn9v5LrqeBqtlkdNS7
 nniil08/avpDqL8rVjzjSr8qdMY+tOyDtjAu0BGEuruYbiesJkeGWnQ
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments PBIAS internal regulator from text to DT
schema. No Functional changes are introduced.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../bindings/regulator/pbias-regulator.txt         |  32 -----
 .../bindings/regulator/ti,pbias-omap.yaml          | 152 +++++++++++++++++++++
 2 files changed, 152 insertions(+), 32 deletions(-)

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
index 000000000000..61a4dc87c48c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml
@@ -0,0 +1,152 @@
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
+oneOf:
+  - required:
+      - pbias_mmc_omap2430
+  - required:
+      - pbias_sim_omap3
+  - required:
+      - pbias_mmc_omap4
+  - required:
+      - pbias_mmc_omap5
+
+allOf:
+  - $ref: regulator.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,pbias-omap2
+    then:
+      required:
+        - pbias_mmc_omap2430
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,pbias-omap3
+    then:
+      oneOf:
+        - required:
+            - pbias_mmc_omap2430
+        - required:
+            - pbias_sim_omap3
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,pbias-omap4
+    then:
+      required:
+        - pbias_mmc_omap4
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

