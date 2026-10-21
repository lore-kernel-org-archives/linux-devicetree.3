Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579955;
	b=pwxwpDhuRnWbWazaYvmpgGAfg9woNlXJTQiicCr3RDmwyCjI3199FDNOM0pmMUs6/iZ6
	 Ta3di6FUDTd9DSvmTdQRNIKIvzeILiLf3VwnEn+SBd73UGjthJ+WxGwGfkTuyD69sMTP7
	 Kv4X09QJob3g7Gx1j+kjBPqbhOdcosZ2+ANLn3M7gJ3V6Wu30PBoRvsxuRUGpCa62v0SN
	 cGaOxbUvuMxZykcqbsaZGc0xovEUb4RYIUo/puB3t5DazV5jU8GPHAas+QrrtBQyF2m26
	 4i9Rt0YMGkZMefeOeAYJyc6ngnuaZwTa+uwRLv8Ewv6FZuL+PgL8isAlT96c38GFYXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
	b=fQGVDUGockFU+jAZXTsJLn4y4tiHfY2reMTzNGJW/k4eelMUmKEJTbi3bM46blc6ltCs
	 POQpuxEM4JBOn/uMm7C4RqazTgYlsXijLjE38Oto20sySf4WHleDd+PicahcZA8K8vM25
	 2gj+mIk1psXDiLnfPoFyd76Xn49GFtKLFsQkQ4xhf13H4XLEiaKr7U4XrQuubwXNE62v+
	 bo7SYm6r7ezwZVETwBI3hwZlYNdp/qrc1taIH4H8qOk0ZGVhNm+o1gxSqf2euNnd8w5lu
	 GzuZMLYNT3XP9bUBgQcfvaczOz/D8EbKPKTIwPguOcDWIkNuJ5fKhgjsr0KzsMHYqWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nX+PjTC5;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360A4606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 360A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nX+PjTC5
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so4750415e9.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579954; x=1793184754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=nX+PjTC5jHfYJsVcXvO9LOnSZYyez+lVXs26FswZTaVGXIuu/TwFtgR9pCqMFUPjdG
         h5spDniIddEWqbf3kq9JqYHhhpnrpNNwp5A1IADZ0T0x96Q4jc3slOu4TUdCFSuX3nRA
         ls5Mcqwg9zlFHDLLjaPJvx4a1QTjn/9jfaQpKdZUTLGPXY7m1xDHZ1IiNlpN0SwWUV6n
         vyPE428bFjdXlQXNMxS3labCT9Zz80X0p+dJkuVw0P3eght+SMYDIK8w2k04VFoEHzn/
         SUy2oRVvPupxh5Cs1RDLCDRxpVsMeAgaHN+itBWiLKxXaP4HSJ8VH1Anuy5yWFqxgrn2
         nwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579954; x=1793184754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F23t8iLTcn/LXqN2lEEgBTUnPAkeyO0taUnuYVGHe48=;
        b=nlo23HEFQOOhlsEglAXPlOzprPdArKma17TZBU1/ehJS/jwIOF6JdsbRQALVcgz0Qm
         wwwa6hmtGrWBP0rmAFZ/b0s0TyOZGclHJF1lbC6KOFzgWD3fPE8ZGiji0CfQxnOWjZA5
         i8SHrdex3dBx1fVxxmNGEb2t2MCWgk1ImFeMYr6KJMP4mfn3dIZS6Xa0kcG+vrhdohos
         aYozv3Yo2IvS71q3adFrYqokDmPscBvceXGqinPcG8kniD3nQ64p7P2tgNE0hNiJx+cj
         Gpo4Aa9g9PoGanZRbxULsflLH4vdlMwqYfPfMZp3ppCQnj0ChP9mDDjUlK+NIlR7dHCC
         k47Q==
X-Forwarded-Encrypted: i=1; AKwUvBw6Hcr5ju/ogUkZu+M8BHHrCnKAoyg0wozjwK6t1+tIsVx+tgUUnfsjDcmpJn6cfj7YBe9BNQ3Fb4k8@vger.kernel.org
X-Gm-Message-State: AFq9FYLxL32Sy4/cVHX17I0j9AL8Tgj4feSYzrNjwYjf21y6RfjErTZ2
	vF8zWRWc61tOaMmG20vdhUfMhxxz/OIFBSXM908rEfQ3W6AS8nRuHK4w
X-Gm-Gg: AYBFou2035ApMn0qNyNWved+lcIdaN0oBkjjJXbdd0nJDYyGjPvDbh+nov/C835Bqi4
	O0CNXINpN7amFO0kUQwd0mcoe/oYJyOt3alYEwjZbEMf3CH6mK2NZ9DE9V5U037NMahbY+p4fiM
	BUXBu6NRVr5o/lttklbEf1p5z991JnqfbW4OLvcCjpbkzzhttHlae9KLSetfXGj1UciSTSrrNXe
	OkiV3TSyA72E6Rr5CEsC6K5DM9OpgTzt00htLQTsKhEgKZMlUJg7N4YdY9VLIaS2d43T6LjDxA2
	jW23NnEvBOPnQxtqPtJAddUdvfGJYJDzx5nfoUnEHEt3aj3YaRc6RCWRXmVyWgm77L/TKtMHBG3
	n2WCtIpOXpeF4PUt7SIRpb/n55syvnjiq2ypbkSrgbMyZbxnWzQ9gMtS1LVpryeDujQrKVkgLCi
	uSuZdpxqqSJ2+PKA4zZjgNRiGV5LFlgbZMpOcK15gj6sLqihJBkUivge+EhHHjeDBeuVU0SKA0Z
	ABtbJrzONVNHFOemXDTLb2P0Tmx7uZ/tIpcdhY0pVbMIpWOSfg=
X-Received: by 2002:a05:600c:628d:b0:4a1:f377:5c6e with SMTP id 5b1f17b1804b1-4a1fdd20a24mr31171585e9.7.1792579953510;
        Wed, 21 Oct 2026 03:52:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:52:33 -0700 (PDT)
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
Subject: [PATCH v11 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Wed, 21 Oct 2026 12:47:21 +0200
Message-ID: <20261021105109.199886-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

