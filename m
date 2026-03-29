Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D68366DB5
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774787714; cv=none; b=FTm53KIsit1+g5+CLDjpCKRw5GHGkV3Q7zi4gynIoODlGe4t4aZbQgd/bbWzG5mprTf1wP67BprhsPwRfRFKtCMlZfiWPWztJhRr/QZetnBswq+dgybZ5nRtUmbJkVlWU4kxyKsVnx984dOHLIYY1sFViZwITQ/cGfIK7uP8moI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774787714; c=relaxed/simple;
	bh=Z3qCgdReWQ1prJb0XmYEgTOQ/bvofKyS6Un91gtBtJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGWQXmCxQjCgAZgi/YbIAutcnFpuG4nK9cpTVo1pQeZdNhR7jrY3f9uxs/7GobWhxSCCPwp1yhqlVO2+EN3FfyI85c48wT3xLQXteeXAIgEBvTF75lGPh8Wyy+TsYDvjZkwXLVS8eullXQazk1UFD60HOjwTwb0wfc2bwbEOn0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXncDH9W; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXncDH9W"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c742d7c8acfso1580057a12.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 05:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774787711; x=1775392511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tLsn8hpa4BdCwst8VwbSLWHz/M72CzfhEMC9Z3GeEs=;
        b=BXncDH9W3zj+WaCTqor75xZHyvDsNzpEiElUC+59+6FJlUjBgUboRLknZzBNFNJKGO
         5nn2O3fKxIgFmkdQSxJGW/48IO1x2n2k9RZbkhKRLWD8EhXFHVWsUDVXLIVB7x0ntwcL
         /v8tkPkHunMEaSZCvENjj9uW9iSm0IjBCwdSnZMymhxnz7ep5D7mp+g3zD/zuh8wJIkn
         7k/0O8RadGm3nr/vCH7Cn52+aKFRWDUq21EHgcawyEFIz/Vi9YKA2AUAnXLPVybJ24kh
         xRkE+Wnj1f0g7n38PWVBhHKOmVs6NPJ1XLfI/tF9/WZiASAe9P5fiJC9ZGS06vDJjpk+
         YpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774787711; x=1775392511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7tLsn8hpa4BdCwst8VwbSLWHz/M72CzfhEMC9Z3GeEs=;
        b=MgHtrkXyD3Md9ViHBRB2v8pbvLAf9yGyU8mB7nb3twi/k1Gu6g34uPzgGrVdzRdaGr
         WzW4pBTORoBtKnyMpfCUSWX4rmi/Ae9qlzBXgcsHR5lIRmyZgubr+25az0jkGWEFOJjX
         IapLn6NBDTYH2WxW5xlj1vyirCEBogyS25GDma3mAI+SDGFm4unLK8qtIT75kaqKunPb
         DIEVIsr4bSyYjE2xRfs+UULp5ssrvJ4UEoWZhxOaAHtneui43bOfePwrx8QaBPc6/YOE
         JrIE1digewLYBRWNOssOFEELOThOL/fwLcHndVzhnoGnnKjVGPeJ2OtFh71e6gMxvpHQ
         feqA==
X-Forwarded-Encrypted: i=1; AJvYcCWsSWCCNN4cCuwL2Pqlzf3Co+mDDHVSkXnq8CNhFgMV0jbElnVyoB7c2u8z4PG+xaXkdl+RGx60V1G6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp86XI1Z2HLiodxJWUSCsHO3diq7Bd22msNvcwZXeh4j486s8p
	PI2or6oBhpw13GI1Ur8MiERF6v2xv5kD85+L1MDGLQK734h386sKRpyC
X-Gm-Gg: ATEYQzxh/C5W/0yRvBZvzWA8y/gkvPC5jdBRxDoXjOCbe31hL7Co5wDTpcOiQpJT8L6
	TGIHOU1WKBd8IJ/U+Uwnq8NefBUE9Rst17c/gtBdjYOt+L+GRGjrtFmPYPN6r+XZ/uBas2qzaBO
	Ps5w9+Krc139uP6cgjfQv0Tv8gSXokLyfgSDT/AEz2LVizo1OI9lgvLaYQdhRA8VqhKn2amkxWu
	5bOhcx9SEBzZUuGP9tnIGYQJk9oiYm0A2YhDlzaVmJ66FbNyTAxrRrQl1AhW2FwjpVtrLERtZE3
	0GtRwwJJLe7+dwCGIxm7X2Uf2ETHvIHqF7TJP1fh1yPIvt1uGbR7eUPMtSOux9iNknDri9PRAEr
	Qw1ixgkLOjAYCsVtpwNDhrcrNnynG2I4+yHbjY118wuFNgNBHaXQVy4u/3JCThS3Na9Lcfx6Nkv
	f2FYThcZ8STQmfPFaDoKaPpxdcmdSE9G/K+1v0P6jpy+5cqVNI/zXxVBhnbwn8VA32Tm/b4ZmsG
	Ag=
X-Received: by 2002:a17:902:d588:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2b0cdc48fbfmr101671395ad.18.1774787711463;
        Sun, 29 Mar 2026 05:35:11 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm58709665ad.72.2026.03.29.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 05:35:10 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Sun, 29 Mar 2026 18:04:43 +0530
Message-ID: <20260329123449.309814-2-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329123449.309814-1-krishnagopi487@gmail.com>
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the SPEAr Thermal Sensor bindings to DT schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changes since v2:
- No changes
Changes since v1:
- Changed unevaluatedProperties to additionalProperties in the binding
- Reword the commit message and subject in the second patch

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

diff --git a/Documentation/devicetree/bindings/thermal/spear-thermal.txt b/Documentation/devicetree/bindings/thermal/spear-thermal.txt
deleted file mode 100644
index 93e3b67c102d..000000000000
--- a/Documentation/devicetree/bindings/thermal/spear-thermal.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* SPEAr Thermal
-
-Required properties:
-- compatible : "st,thermal-spear1340"
-- reg : Address range of the thermal registers
-- st,thermal-flags: flags used to enable thermal sensor
-
-Example:
-
-	thermal@fc000000 {
-		compatible = "st,thermal-spear1340";
-		reg = <0xfc000000 0x1000>;
-		st,thermal-flags = <0x7000>;
-	};
diff --git a/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml b/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml
new file mode 100644
index 000000000000..e3462a974691
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPEAr Thermal Sensor
+
+maintainers:
+  - Viresh Kumar <vireshk@kernel.org>
+
+properties:
+  compatible:
+    const: st,thermal-spear1340
+
+  reg:
+    maxItems: 1
+
+  st,thermal-flags:
+    description: flags used to enable thermal sensor
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - st,thermal-flags
+
+additionalProperties: false
+
+examples:
+  - |
+    thermal@fc000000 {
+      compatible = "st,thermal-spear1340";
+      reg = <0xfc000000 0x1000>;
+      st,thermal-flags = <0x7000>;
+    };
-- 
2.52.0

