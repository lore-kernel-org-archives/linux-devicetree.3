Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB0A43F095
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228778; cv=none; b=bxyOXUyh27v4TorbKeYjYgd+ZmdNC1GN1KULdq0XnXKnCUBqOi5+3MlVCmtYCVIVAtgxnF7GgzRwfmpl1rK7sE3N88zbvltamxMbdDkt9IKmr+kvNvnyQRryT47xhLrmnO7/IlG3jxrkP3erioeTscC1wx/wzE6PrgkzI4AEo10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228778; c=relaxed/simple;
	bh=/+AZg6hP2XDv78PWt241IT+LpSwJDBWfvUMImlV1iL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vxqp40orLJvl100x3USg+ewUhzO3yqOXGKIizci/iuZkMEwNYhP2EFv2qgIImxD414eTniG0GIXtVfZyZ7KJpbttzOnygNbNeZZMK3wcumOd7M6XdLnVxOus0GodWxEH/wrd6QYkeUXjHEAqZG9ZsddqtKuJ+gGxhn7A53MH0lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=me1PEY3L; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="me1PEY3L"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so12826305e9.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228774; x=1787833574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=me1PEY3LXNQ+5k5ACPPSCMZ8aEt02ld+qTfCGSAXCL87w5XoQQVHExqEuhCI7cXlfD
         IQIJc2rdFIyTVsqwY2+g8K4fJf6RoypNt/j99NU19Br2yjHFp8f0VPqJQuGArHjMIP3+
         B95xqv7QLUZPk9JDOqhwB1xBWPLdZbs4U2G9oO9zoTnAKCVXO6A5U+W1hU4OVYWGBRqV
         JB1j+gumbkzvt7iu5Xg8el5D3z9dJmcbR/JP2hRUiJXb/iawfiLa+KNgPRc6SuVZSSA6
         RUmu0mdOvr3sHwXy27e6T2K2r0ycN09R7RR2aEFN23kTqTSX2yuBrUfQssr9qUGkJ1Tk
         6i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228774; x=1787833574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=Wu/jmmSZHJP4/VXcjFteZrEVMOb/Ta/Dq6P2wuPLBiPTGutrNF87DTrKe+HvAaxCTF
         FWcuTDTQNyOTdzIZscqUEcjlSZm2nsHpH19wqz7JJ2LUJFWb119VZOpE07gOpDK3zURg
         6BYFl0eQAglvQukVOy4X1hKBcaoLbr/jsym1CqTahh4Em0Qm5sLPQnfkOmI1+aQubhhe
         VeYGhm2310W7Skx+NZNMNSZN1g2/iWttZAGnZrUfs87qSx0Tyzl5JHR1jZ/M2LdZl4Fp
         sQTAm5+iX1nthAbaNVbaIPvI2ULErTRVWoSfY+hx7LBk96jNZhzg8r3rly5bZ+Gi1upx
         +ywg==
X-Forwarded-Encrypted: i=1; AHgh+RogkwRYbrcYxLyyXIbRIKbpXS7nwjJ0K+3qXp9uwzTqCKsC6UkCP4j27iG7uXnS8c4giBhGQEQc1twE@vger.kernel.org
X-Gm-Message-State: AOJu0YwdCxgMzh7c2JCzNh1lWYylDgqcpikyyEx+1PfpB5dDmhFxAbC2
	42Sp0RBImJOij41ywkEB1Cgdu23pWV3yK5rTl8q3PWrWSj8em2mePtoX
X-Gm-Gg: AR+sD110OumalNuBBSp3/I8ttHwyrB0Js3qsr7CG9vVcxHuFzkhwhZnBUt6NJoQpMg6
	IeL6jpysXI2i25/Rm5fhP8EMTfvAAiEB83NGecKAaYmv120ibx1HHlPtlv6UjxXI0Zgg7JBSJ/4
	quleGgHlJrhwE8lNrngd4bgaFvpWl5qnc5xksd/9QfGtqDt7vPM//Ar7JFQcndtEyLP1xAb2jw8
	ZDQtj5luW6jmGuBzxdmIBuc2HdH7g9GOvIBpd1jp+TzSmJhNH9ol7VxNSHPiFwTIx8Z2IstgiNu
	DPxC6Gh/ua2MmZkaS7nM5YlAemsUyqYhjhizWnaLd+SekjbNXg5n6cgOOwIRGtWFqlZv+A1No9K
	isQ7twzI9mrVRZe7Y5KO25DD4WVeYmN/dWdvV3pVF1um1ttqVJwRVxLHxJlu5u//CfJFBvaKSvZ
	7aqSyhBzbUmcxzdtuIaaIY1R7swJUkqeUFtRJjnpmjevmbTi4XS3cGLQ==
X-Received: by 2002:a05:600c:8b27:b0:499:7024:9d4a with SMTP id 5b1f17b1804b1-499aa16a958mr242769715e9.8.1787228774181;
        Thu, 20 Aug 2026 05:26:14 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:26:13 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Thu, 20 Aug 2026 14:20:01 +0200
Message-ID: <20260820122242.120039-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the regulators found in the MediaTek MT6392 PMIC,
usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 112 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  23 ++++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..d74721d8f2ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 regulator
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+description:
+  MT6392 is a power management system chip containing three buck converters and
+  23 LDOs. All voltage regulators provided by the PMIC are described as
+  sub-nodes of this node.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt6392-regulator
+
+  vproc-supply:
+    description: Supply for buck regulator vproc
+  vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-supply:
+    description: Supply for buck regulator vsys
+  avddldo-supply:
+    description:
+      Supply for AVDD LDOs (vm, vio18, vcn18, vcamd, vcamio). According to the data sheet
+      this is an internal supply derived from vsys.
+  ldo1-supply:
+    description: Supply for LDOs group 1 (vaud28, vxo22, vaud22, vadc18, vcama, vrtc)
+  ldo2-supply:
+    description: Supply for LDOs group 2 (vcn35, vio28, vmc, vmch, vefuse, vdig18)
+  ldo3-supply:
+    description: Supply for LDOs group 3 (vusb, vemc3v3, vcamaf, vgp1, vgp2, vm25)
+
+patternProperties:
+  "^v(core|proc|sys)$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          BUCK regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          BUCK regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 1]
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|usb)$":
+    description: LDOs with fixed output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 2]
+
+  "^v(cama|dig18|rtc)$":
+    description: LDOs with fixed output without mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes: false
+      regulator-initial-mode: false
+
+  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with adjustable output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 2]
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
new file mode 100644
index 000000000000..2e1f41e0ebfe
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_REGULATOR_MODE_NORMAL	0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_LDO_MODE_LP		2
+
+#endif
-- 
2.43.0

