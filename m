Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908458;
	b=fxqONP/EQPNT5gIRJrNhWVLSoBpyjizkhlstclAOm+iJYFcSZPY8gdAqyK1j+TFHoVVE
	 002ZqnsIKywd8ldkYMSW0+iPDEMO7P72nBSfWSfxsoO56y5fI1gUQaXi5O/f9Fox+pCUi
	 Vtsek925KCfr4YlxLcSZUMl/IgFSYscx8W+flI2O3YEiYdg0ANdl4pWAWUh0Vrtj+UjHg
	 yMHJwqUcGL8eWAOzLVO4F1Zedq0EdurF1qHvm2neQln0r9vHU6/e1r3Upp04sD2Nw29rH
	 1+VrsssSWNOieOviKYhHGQDMiDY9/+dMjBuuwNLJne82R+wlIV9nRJoSff0VI0p6qBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
	b=KGQqDEAG1kyb+JplEK69K86vroVMeO+QMFwQz3+UiwOtu728Wpq7Gj6EYd+qXfsDhY3b
	 EqAeITdDBA7mzjBGgRTSEiSYLGhTTRKEwsIPG7YUUdk7/Dd2AkJGTqxmgZFfH/2GRCB6c
	 H4ckzncGLEYV15Ipcnih13+tU4OI/1Yfdb305JvcrVKaa+iGur14b/SQBzvvCXHKsKG75
	 zCp7KR5zy/lsWshTbM+csL6h1fcxmcK/NYhXzV5EJBrGjHzMu3GJfhiG8HvXKEiWRD3rh
	 1J1FNBVU7wVMEyi4AHAHyqkWfULLTzdjyP6mpmmoffT07/+ZFwHex/z5sO8sQkLM96g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLSAlbea;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBA4606B9F1
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 19:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FBA4606B9F1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLSAlbea
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so27487285e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 11:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908455; x=1794513255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=TLSAlbeaansg0obWrRFjVue5VIj8K54CuD58TZVYawDVa4jC5Uz9kGlj6X+bQBpoU0
         RMBDWWyagEX6GxxiTtav2lZiMx51AzWiDd242sMFyg0JYKbuAIclvNHGXMYeBoaF+GEj
         dO6CXIPqvt5I+wkTxKYuSbW45HO2URYgVgVt/5cuL14Mh4l1eNjAHwZeeXdu/qLd+0yr
         Ou9zJcL2JKJD9DPQKkK5QUMeAHOxDNl//pWvCBpXDBjwS9uRqP2i5lNvSNr35i6QXNoR
         vUexFPZPxi0E/3kIuJbVbmK6ODD6pGq+a/aARv0alyMkBu7IIi6a3cwcKGqYTJpDrKXL
         Sr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908455; x=1794513255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=YUuxOUPeI6stWWf9iL/FX5T8WyqgKOhBAPr2YnpH1zzPllMJYTWn8TRezvMEVrD22o
         TEVhOGyTWjUrQ2j45yCNSdXEtAy6vXs6/tenD8ERD9covLvJSuj7uFSXCm6vKnbcDmrY
         KBth6saXPcsqW3adtkSz11LqMxUEuZhdYty+XQWJdHiASKjBY3novQQAXamhx0uwLWrO
         LLp6xye8ehDt9llIC6Nf9GEAdnctbBCKH4Dz2q32FC+89LJf7arwHvO0XCSvgJtTMk1+
         R9xfhAJaqlLyrybP/3anfb2MdBOQOuf0QXKW0RmgWxBs21d8xXzvnn6vRzddMpoB3nqY
         gSTg==
X-Forwarded-Encrypted: i=1; AKwUvBzfHxQosg3TIkrNPUnbXfVnFjuuJTUVk9sT/dWjvk/VLigT1u46oxRB9KrpnFqNOq7NwJctrCtHtg+3@vger.kernel.org
X-Gm-Message-State: APuU4Z87NxapZTwfQYT+UKu6tVAY+RCVH0d91LNy7mFFOuQZiegiB0dY
	l8vwsXixS0djdJfS50AumOfKizbOjhCa6PRy/0b4YA0ifG62mDHJK3Ks
X-Gm-Gg: AYBFou2YlvXO0MQjmW4+IdppYkC7xdi0MXwWSwRYIejgCxctQ/9WI+Hp7BQ3pec6G3J
	BhBy6q9G0y1R09UmgzzbZbk3oidfMsS5nYuk7N3a/BjJT02ttifOAifaHycXcYg4IXUatH1gPoa
	sfAWsPkpyQ3d6wZHPq7VaIc0xIXurLM5Lcj5//gx7JBxSyfY1NjRFQx/bJrqr0dZwP2QVaGkJbR
	0FgvJ2VkDYfkL0nA5nZgKzv+EJuVj4jrYv60PJqQMwcxg6QMKgkUdU1zP8P6M/NE2U7aYaUZVwi
	hKDskOaBD5JCw2QnJSqHDR6K/Gl6gUT0zLDqCZP175un4G6CVaOE3IcibC6x2iBkghq3SK4rcFF
	cxTLnRD3R65ym3dDsDBLe7zW4J8xPvImu2sEPDGvG+QjvpGE5qglyjrKvy9GPVD3zA+4E0/HdGe
	2j6MYBL5vB/5BpzbJmZYjFoffKgTwyn0yMZa9EGpKViLeejjqFFqdbhSXK2nrisOYSQkOWGalBv
	O85blU8ecqcWLik0KBOOCXRzZbuGKDd3aMVby6ZP2Z4XTpmWTQgJT1lR5RKP8DH1QVC00Qmeo2n
	fLyR6UQsgtSUxx7RknEpWXcbvuoJTydJGS1s45p4PCpHVw==
X-Received: by 2002:a05:600c:3f10:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4b6dea69280mr3035835e9.14.1793908455226;
        Thu, 05 Nov 2026 11:54:15 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:54:14 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 3/8] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Thu,  5 Nov 2026 20:50:23 +0100
Message-ID: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
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

