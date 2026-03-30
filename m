Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FBB39E191
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859723; cv=none; b=TQhR+fofe//8BrFDVEz9DX3Y0FY7QUrnAzpAFvyND9hu6DM00Ir+8p9k3dvW9VwnQTx7VjIUX8oeasCmr5uLTXZkuuR1qj2v3YgATuatSgLIkdyPNYf2LN7GjDN79dB6JuwdSZEdr14ppg2LdNMcUR4XqfglMetdhgqjfxMXCOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859723; c=relaxed/simple;
	bh=sRQA5QLHO2sUZDXytYhE/C8tMIpR3aUH3LvjIZmVSNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oo8iGixH+1AXA3TeCF9UzOJQkJoOAYX2UfU8is/YqdyaRSDk5eI6FXZCF5wuyxVoUh6mE5S1EE2pDhUW8n65OQutjWu35Gh/YwASMqL+lER2pbXCx5sqXYHmDmAlYqHoDspzKzcdDYpK3/+ZOueevlg8HHCWYr273u4Fc38DzBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzpN8aJe; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzpN8aJe"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so50158655e9.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859721; x=1775464521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZY/r0Q2Y0NxdHq45+egYGlikRLogBMu0oJhE3y/Rf0=;
        b=MzpN8aJeZpXu2RJOLjRHo1Srmmmz9+ALJEZkI2XHIpbr1OR6s3X26O43cYGDechbLp
         fzM7a/DsHbu24VsAMuvHVc1S06HA4lTvItPF0Vge5CS81xqA7A2u1FKsA4REnJbYlAc6
         7qjRMvm9Lx5b1PSlf2T2YMT1P83+y4Roht7+Q6GO8Sj6IMo6Nv15hNgnJegmSD8Z5/qZ
         Vis+K51n2pqurFLni6dS3a9PAoeRK2EASIYtXB4XelzBzifyFDZnLXWKwn7hJqRffwvR
         7pMazMt+zJdGVQiMvZn/qi6iaqohPzNHYKzysXd1t39DtJpDgpE7SpEajC4GsWaKX22n
         oGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859721; x=1775464521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eZY/r0Q2Y0NxdHq45+egYGlikRLogBMu0oJhE3y/Rf0=;
        b=BbX7VaeftcU9DaOBl0sUlQ8ODylVEkS6hHO3Xgy3d1RL3sZMnUIK2AsyZYTZnEBH/D
         J7BA+SO9xV4ruE8EdjedVpFS8FFTohJcuYa8v/Uv3SqPDYs2+I0LnjDoyslG/wgytwIz
         /S3Iu4izyBlbSZ2J0bCF1dhyvdOfEw+Motdp9+hxGfabvbdv8YT5BbkfixdLnadspmyi
         RIm0EAhdGhnFxXxEgnV4SkBQ/gzZAar72fcpWa3MDfsWpeWbeB7nANRgFw3YSOAUBriZ
         ilom/VNlx8gFU2K/1KcQCjQc4R1KXMzzjyn600Hy7gNZJovZKjkjSO6ax4vpifJpP7Lk
         4ShQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLzqQmIq/1rtFkh33SeUCffNp0+6h7gDxOL5CIq0DOK8TsgYFZdlozhwR69MjAqSrQ+05danC/2pm/@vger.kernel.org
X-Gm-Message-State: AOJu0YxdViXOrRU91Bs+VQv3UYGVNt+YhNl4gDbcBxiS4TL4Hi/kCZ6i
	PrqOjgxQyeVLQ+zPmI31pS6KELqnC5fzTXUojskOdqUCM7GsFkChkBXu
X-Gm-Gg: ATEYQzwfwemAkfzS5ys09LzEk4u5llSOYZcTIRAPkjLzTewNucqrzuddj8OCSltgJUk
	F4qUuJKeugOVWDVXgBDDQRSdHdra/5DzE+ZsmsJfwP/lQbrR823mwrabjR5z3LhUBqVNtEy/49x
	Njnj5gjuNljT6ZlGQzJNZhhiAdexP5ODmGtSY3bpLMvPouZq7Be2uU/kotCN0cp4Ln0aSPhiERM
	E6+4dP3X8lGQrs1Cz+IE17noK4uO0I8pI1u3+Olh6gV+9ujOoIwOHfaxtvR+fFgC7AAzcP9519m
	7L9DKvD+tUebC7xXJ+XZZIHh04+DZn4qADbGQnwqXDfOjWd1YgZ2HxsQTporAK8+3zAyUgU9o6m
	dOjcuRHGXHvVvIqNAO90F1417BtvpDrixasmrDlo7I0KwHaCb9ugwhCOzrxNaqceORtT7i+Ovko
	hiRYaG4akOfkxSw1B67wc=
X-Received: by 2002:a05:600c:4e15:b0:486:ff92:63e5 with SMTP id 5b1f17b1804b1-48727d4583dmr192584345e9.6.1774859720682;
        Mon, 30 Mar 2026 01:35:20 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:35:20 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Mon, 30 Mar 2026 09:29:37 +0100
Message-ID: <20260330083429.359819-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
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
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 74 +++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     | 24 ++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..24fbaef0e717
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 regulator
+
+description:
+  Regulator node of the PMIC. This node should under the PMIC's device node.
+  MT6392 is a power management system chip containing three buck converters and
+  23 LDOs. All voltage regulators provided by the PMIC are described as
+  sub-nodes of this node.
+
+properties:
+  vproc-supply:
+    description: Supply for buck regulator vproc
+  vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-supply:
+    description: Supply for buck regulator vsys
+  avddldo-supply:
+    description: |
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
+    properties:
+      regulator-allowed-modes:
+        description: |
+          BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|rtc|vusb)$":
+    description: LDOs with fixed output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^v(cama|dig18)$":
+    description: LDOs with fixed output without mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with adjustable output
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
new file mode 100644
index 000000000000..8bd1a13faad8
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
@@ -0,0 +1,24 @@
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
+#define MT6392_BUCK_MODE_AUTO		0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_LDO_MODE_NORMAL		0
+#define MT6392_LDO_MODE_LP		1
+
+#endif
-- 
2.43.0

