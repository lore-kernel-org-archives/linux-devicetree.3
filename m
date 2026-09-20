Received: from mail-wr2-f36.google.com (mail-wr2-f36.google.com [74.125.225.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08848485511
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 19:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933194; cv=none; b=V6Lb7razDik/vKJUNQdSu0HPq1FMh3ncyXP7h7dMe0al5NdJkQge+A0pAJLhgLREYgr+zZ4T2YdvzC1Rez1ngO2CpBsQ22F7IE3bzBwgc2c83cTmxVE+FEJpM2IGPWK8NAZWKdnsFKa71oaGjDrOTKqJLqpza5Zs+e2g8W3/tjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933194; c=relaxed/simple;
	bh=IcZ0ZroObHElTmqm+xLAowMmloSh1BtpxoHWoTCIFJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFFqwWNkEhPGaq2hej5Ky426Qd/Yz7lWe0vXzXm/tfqvYaFtoA8MD6Tcg96zpL0eZq/0O/tar+NYQd2ZF8xDqA/UsYDoLe3zkjVvwPhUyX51ltdAJJUkAD+FkGzaUpRuxQ3A5vydWzb0Jq+JC67F72pXdKbmSOMitVHXw6R5IgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAQHv9tj; arc=none smtp.client-ip=74.125.225.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAQHv9tj"
Received: by mail-wr2-f36.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso1230259f8f.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933191; x=1790537991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwS6OKYxBk4f3QV8i+ppCjdL02P7CqhhlR3ok5XoZI0=;
        b=hAQHv9tjoiGbsK4PcMgKsao41NMrh00lTVebO2298NvPVJlzVryEhRg1+vlEU3rsfg
         ZcCxcsTTt15DJ68UQE28OP3EPtcGo0XSTuM/Feja6D2jKMUcrP0V5qCVh+zfivzgDC5P
         3M3PBPSS+SKa9e2Edku4LxExeRZz2AWMSwa5Ge6SopkvKe6aKKX7AgeCUuzQEVor2IX2
         WhAKXFfItLamNscE1Ahi9GLcQ0ic+HRHDDfgI9eQcioYLRBU7J7bmz2Boei00FOy6Pxr
         3ZgIPoCl7F94CmVkMvlxJa6ulERqP8ZToFv/QqWl+7z3CBRmHOkheibFerWTmfgcrE7P
         UQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933191; x=1790537991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JwS6OKYxBk4f3QV8i+ppCjdL02P7CqhhlR3ok5XoZI0=;
        b=zdqyKeC9akV4QEycodLGaAW4G9yzrLbJIqLeJ2G/FjRFiPGy8y+5Bjgdd1ldVfgg+9
         298J89QWD0AV6KKE1OCr+7pHzg3UebId2NGFQW6AIQCuamMNXECrxfzoVVkvkskJAHRf
         HO8ekP6qLZvC13SHzO8cN0Pdo5dsoPp/V4OB2idGhUI6vLSKiyyXP0GF4bJ8BViNWWUb
         UBdt+ZSwhdYlgJP+Po9OXSlLa4fPZgmY/8s6DGnG4AAOaJWYs79hW5sPuaPjUcGr5uga
         4i2Kf0F1j13zkMak5k3VB0vKW9BHCi6QBvpSysLCE/aSqOXGp4eYxDQSYNYNGowfMgUw
         PALQ==
X-Forwarded-Encrypted: i=1; AKwUvBydRN3dUKUIjwoG22bLLZbKnjimt01GSb2mrf787UfyadLejaHx60ArNeuYmN8EFBa9t4Rn5uWZG/Sa@vger.kernel.org
X-Gm-Message-State: AFuF++mlBMiml1f69xecXMITisXPL7LvXT/+46p3LUNhzi70KVt4ZEjg
	8+EY1oGPYUIXjqDxC3GvUowBfEBrYgMjXWZGUDwYq9QDWkWnnCAN5uLp
X-Gm-Gg: AYBFou2I5hOTz5UNHKUUA2aQGsUpy/MRrcedOsHQG3LaZNTKLw6V1AvU77Vi5MfNqIx
	5ypAu5X20ERi2Qtad2u187wqWvlJGkxvChr2tnyhCa3m7/BaFMqux9u8gQkxRMlAWR296rwOC5j
	U09KmH5LoV/XFPDV4PvZMkirtStWEx27p56AtlmEi7f5Kar1syHuZR0qlKUSP+NDNbxt5NGMHxj
	dHqfIc0S32NkhWlJbBELDSugeTy89aMyUdQTkEP9bTMYHrztgRXUxMjsywl1OMe95LFWCyxPP4k
	cEnMSLN/rqlD4GVXyoXZ1ipFftKfen9bLkwMiECW+04VordcH0gIk+St1uJuW5TyQwZA7vC38C7
	iXvPJXxe7tS8lB+AXCixPBuVoOqA82KNX/K63DZ8LVHU0VzrN9OlJde9V1mjWd7RYuEUbE66k5B
	RkJLgyJUEsRMOvHmN4WGyBDYomjzWyI1d485uKMMSng3te3YwszPzhcPhpUq5Z+uFEMTXucaY44
	N7+vyQU0mKfUmMciDEw8VbHVsi9+u9ixUILEq8mqoSgiWLFfBvyeT9hiOU0WYrgJClaZ8T0iOpR
	1o1XmzzrqVE2tuER7nnNHW4EX9ywLJ0+cTxt
X-Received: by 2002:a05:600c:3b8a:b0:49d:1d6a:4cfb with SMTP id 5b1f17b1804b1-49fc56db759mr161874135e9.1.1789933191119;
        Sun, 20 Sep 2026 12:39:51 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm168250455e9.1.2026.09.20.12.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:39:50 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: display: Add GlandaGPU binding
Date: Sun, 20 Sep 2026 21:39:43 +0200
Message-ID: <20260920193944.110983-2-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920193944.110983-1-kieweg.leander@gmail.com>
References: <20260920193944.110983-1-kieweg.leander@gmail.com>
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
 .../bindings/display/kieweg,gpu.yaml          | 56 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/kieweg,gpu.yaml

diff --git a/Documentation/devicetree/bindings/display/kieweg,gpu.yaml b/Documentation/devicetree/bindings/display/kieweg,gpu.yaml
new file mode 100644
index 000000000..0ffe34205
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/kieweg,gpu.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/kieweg,gpu.yaml#
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
+    const: kieweg,gpu-1.0
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
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@c0000000 {
+        compatible = "kieweg,gpu-1.0";
+        reg = <0xc0000000 0x1000000>;
+        interrupt-parent = <&intc>;
+        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&osc1>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b1af9deac..3a9d15dd7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -893,6 +893,8 @@ patternProperties:
     description: Khadas
   "^kiebackpeter,.*":
     description: Kieback & Peter GmbH
+  "^kieweg,.*":
+    description: Leander Kieweg
   "^kinetic,.*":
     description: Kinetic Technologies
   "^kingdisplay,.*":
-- 
2.43.0

