Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC89444604E
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433114; cv=none; b=lvl3jrRX7y2GRxaGKKIrWjTVPeYLWa8cnudj6QcYoa8E6+6YSTeUhgUzFk2BGMSODpmui7iARmdBU7GhmHeWV/kmAiWyCAkFmhI/+jq6I1mTlV6BPKORqsIhhr1b0qPRIDn+sYCawTkeOIr/zGn57Vhl0gZP3oGDbSreKS6nX4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433114; c=relaxed/simple;
	bh=YrUYRIjGBFucQssve9+WrpRq9aJNIIdxHGEsMgwxsv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adYANf6kh3mbTX8mNAGoawvgPI+73GdHQmnAqad0xcb4MNQwfzDBEZTbaqyalxWkUwI92dGSk9sJsIer7S9pPZrtPgZ4zZ3sn9ZEH7y8+b9SvY/BgaLiJ2zeQZMrM1msNeZRcdbSTt6HddDS0W8MPSHJdNHeS8AiRZS9ihoUKcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TS4MH66F; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TS4MH66F"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49557167508so339175e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433111; x=1786037911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PM3BRrh2FNXUCkcSKqT+U8kC/SFlU1y7/LSteg7Tts0=;
        b=TS4MH66FCwfy68ZCNkHPKzhho0KZC1kXREMltLtw2/Yi41r13Pr5XA9QtOK227tdxM
         2Wl15yF56VaSNAoHk/0nHawAjAhksTNofVhnpjnQJcTtQouHfK0hqfI84edhsHOptaFG
         XE7wv0jmhY1+Qh+J62ZEB5THruBy1RWwdY+5n7qp39sYpBUPc9K/or2Kd4b1cZONNMCV
         Df5ZuaUCClRW5De0T3j5FyKD3z0AmjJtMKVqEA73d+oHYOXx0rRnXLMzF5/AGeSEJcrQ
         CxU98+qnmufcJ4xOTcFiT/fFzlkut8S+OQm+N2sCo3lyGHt1gM0NcFgZvWatnVlbRDN4
         Musg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433111; x=1786037911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PM3BRrh2FNXUCkcSKqT+U8kC/SFlU1y7/LSteg7Tts0=;
        b=iyyNR7ezkxUfPwxm22zyHPYDeENhOz9KqSPGv/UhPsSUcZk3NN3hedWZ4B4gS9S6Xw
         vAiZkIvdSxiP5eRzgFVCe9IlKeZNB1wgllCimbjy7M4/TT4XAPTuVF0xGXtOKI1NxMjK
         rfv5PzLc+dKMszMtkBIs2x8cThvF5puKaN/dgUxPOQ9KsaEk/YgKyDY2pNQXbY4Yrix1
         cdXBbPk7kmG7E+62S0Qsvv89NKMC+AkMci8ogMv6I/S0YpUXCmqtoWUNwL6WtnabjKiM
         Zks83Pm+QmW59NkWa8y2vYxcTPoz9z6103fsdOTAx1LnDv/LXmwHd5ZXTGhb8sR2B7Y7
         zrFg==
X-Forwarded-Encrypted: i=1; AHgh+RqPmo0bQ1goGXXVTda/AbBkk9dKgFpEFZZsPrGTDKx1Nn/6VBhw/b9Ahdim6MHhO3y8XGPVFeIf//lk@vger.kernel.org
X-Gm-Message-State: AOJu0YxLrXX80as1jhnAYmTqs56gQMYwwPuJUICDTzfqrapA1SU8CeGB
	7SMzb+7IsFSm54lJkLcPmS2WZ0tKdERgPPAGDDsQ2wrjkMscrKm5jahW
X-Gm-Gg: AR+sD10z2PZS7KV04epm9cVU+dfvxqSv0d/1p13K4y8n1JjdAV2lReERMSccTJAcwJi
	AwK6tXwxj+jQU+wJRJ+P+UFS6Q9vOBk1hBY9WhRaEnEXs26DNTqUU/IjB8H3bmqTg4jeJ2HQ4yP
	+QiCvDWC4Zt67HD7B+ORpABBY21PfkD2cH0tGgFCWyfMnHKQq3ZIZwGYFhcVH7xLyC9Xk8GTEiH
	6vPkNOeAt/8nENAD/2ixp3Uon/Tq9DbRmv+EyKsRukwWk/5qpZXTCSo1X5hrHLIWvwXZP1si7wt
	799VKKNQ42vfGsldMcCHcjEUrMWxl3ZBv/asJYq30tluuUXsoK5tyK80XUIG9GFvYMnMwzucgH8
	cMGQD9+zZcO9QqndAIn6jtRpMHqZMSXYz6p3U93p6EdKU8gTdyIyNaX2eJI8YyD7SlnfX2Anuw0
	SD2ExvET4urtdzhZFtI139nrrvXb+7nNKPitLmc9J34bdjqs+Jiolknt0qhgq7gI8fR2q42egnI
	VVP3InhH0Z5h/NMdjJRtQDGyZsH/q3lJTebh1ltjanEPclnlIHAYS0zc+irA0YrGg4nViEKrHx2
	EIWjL/UoEo3O10q7rpR6ZW9r4eQ=
X-Received: by 2002:a05:600c:e557:10b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49800e898e4mr37361575e9.7.1785433110898;
        Thu, 30 Jul 2026 10:38:30 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f0ecd4sm71603455e9.1.2026.07.30.10.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:38:30 -0700 (PDT)
From: Leander Kieweg <kieweg.leander@gmail.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	u.kleine-koenig@baylibre.com,
	Leander Kieweg <kieweg.leander@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: display: Add GlandaGPU binding
Date: Thu, 30 Jul 2026 19:36:41 +0200
Message-ID: <20260730173643.256052-2-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730173643.256052-1-kieweg.leander@gmail.com>
References: <20260730173643.256052-1-kieweg.leander@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding documentation for GlandaGPU, a custom
FPGA-based 2D display controller.

For hardware designs and RTL sources, see:
https://github.com/stiangglanda/GlandaGPU

Signed-off-by: Leander Kieweg <kieweg.leander@gmail.com>
---
 .../bindings/display/glanda,gpu.yaml          | 55 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/glanda,gpu.yaml

diff --git a/Documentation/devicetree/bindings/display/glanda,gpu.yaml b/Documentation/devicetree/bindings/display/glanda,gpu.yaml
new file mode 100644
index 000000000..988a30946
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/glanda,gpu.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/glanda,gpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GlandaGPU 2D Hardware Accelerated Display Controller
+
+maintainers:
+  - Leander Kieweg <kieweg.leander@gmail.com>
+
+description: |
+  GlandaGPU is a custom FPGA soft-IP core providing a simple
+  2D hardware-accelerated drawing engine with a VGA-compatible
+  display output. The register window covers a combined VRAM + MMIO
+  region, with MMIO registers at a fixed offset within it.
+
+  For hardware designs and RTL sources, see:
+  https://github.com/stiangglanda/GlandaGPU
+
+properties:
+  compatible:
+    const: glanda,gpu-1.0
+
+  reg:
+    maxItems: 1
+    description:
+      Combined VRAM + MMIO register window (VRAM at offset 0,
+      MMIO registers at offset 0x00200000 within this range).
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Bus and pixel clock provided to the FPGA IP.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@c0000000 {
+        compatible = "glanda,gpu-1.0";
+        reg = <0xc0000000 0x1000000>;
+        interrupt-parent = <&intc>;
+        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&osc1>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b1af9deac..b8b7a5401 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -666,6 +666,8 @@ patternProperties:
     description: Giantplus Technology Co., Ltd.
   "^gira,.*":
     description: Gira Giersiepen GmbH & Co. KG
+  "^glanda,.*":
+    description: GlandaGPU
   "^glinet,.*":
     description: GL Intelligence, Inc.
   "^globalscale,.*":
-- 
2.43.0

