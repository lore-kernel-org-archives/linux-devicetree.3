Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1132E7185
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 15:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791733568; cv=none; b=giG9XzznTf7Wa6kGgnL/RjHd9Xi4Imzac4AHf8Gm3kBcFKU3SQSegwHt3A9zOUMF5/zu2asMLBonYu9YEJc7QVsTdDUrXcA1i96hAYvmtEtfzWKqr/gAo0UO/i77OWf8lODWJ6yFHTostcYUIjVObBYJh5muPSGz3pEaG1BGfxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791733568; c=relaxed/simple;
	bh=luPo1WPcGmNZq8g6KdPpWn3vJseGfAZrWxxIyeCQNsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBFii0yxOGb6XVZBL0Swp6LNkB/ORE5liT2PyuFnltvYb0Wv+Mp7JvAENW5tet+TX+uHZWB3nfy8bpwDNO+VEUpCkDl2fMwUuym598Q4+bw7AUHuGrEytduqSF7TZuPkRklNvLumxvWtBuHetLLuX6ety5hoDD60W23iw0rUixQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nd+Po8ID; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nd+Po8ID"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0584ad71so534183f8f.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 08:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791733564; x=1792338364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIetfJ/7JjHlui5/FdOLhdp/S9WpwXXJl3LTFgmkhgo=;
        b=Nd+Po8IDMyfajs9bkkfHQSFwmLGdTssCpOfuBwbOFBVSyZ2f4vhOJKExjBd6ENPCN7
         0URumUK0kslV+NAXGwswQ7bjI6GWFIiyWPFtOuPpZTWVfqa5cyWUQ2kJNFscDYetAlnv
         JIf20c02q3vJIzsv1lIb3cVJ1XGNXVTGVCMvmV+Kpi7O1C3R9nd9s9M6+I583CEQjVqm
         IlZZuEqyvBo8BjhFmYwTDq5wDPOtzlyGjioBHF7JpUpMIRzbjjVH8XYL716lvpqzR4tG
         lwO5MyjqPX6gbJtK3pJ3iMykwZCqObVkeMdALToY9NeNne0G2nVmqhxUAeODIS/7vaXa
         1PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791733564; x=1792338364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIetfJ/7JjHlui5/FdOLhdp/S9WpwXXJl3LTFgmkhgo=;
        b=EJ4Sk98HCiLInW7nNK/bfo2hVcazfEvk4oYY05B9+N4TR3QYaxvkHcubnM7S8RS1D+
         lW5pzmS5MFjifatwa43PVAWqwYhym0ml2rdKSKLEaTfSfMFPk3FeGi13sftU+IeseKZM
         B+cR2TvnU5O4LCNd2N33SRju6URCLyXznfEAH7xvGg6k/Tj3MPgSdACt0aFIFp9Uin+a
         +EfGeqU6djm1N1/DwEeh1MiY0LRd3FszR/YCM1+nqcDCTewGmUbRB3InEVnMYWKGl+9E
         0+MKA3M6HAl9ycbMYB8UDMFReKe8it3yT8FJwt7OZ8LjSA1S43uwJXEvQ4AL8Ga00bkE
         H2jQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ4N2tfVlbHwupYkOhLmqQXb6trMl9TalePrF59etuVli8W79pnR7YRtwSiaoRgm/ZsHbXHTRxKvUL@vger.kernel.org
X-Gm-Message-State: AFq9FYLbMr7I9+P06Um3tGJiROhrk+0EtwMobeY9fm54JdlRmfVm9Y0O
	6VoEvsMTDfpvkTlg1qDn4I4C56uQaCTIzKceqdjZ0N/e14PAo0eLJyD5
X-Gm-Gg: AYBFou39nI4zDXZnkxb0OwI9rP/3IIHw8qAIHnYJabum4YOOAkX6sGUY2xBxqFk9tvJ
	pqyjZkVTKP4zhWpuOKDBJO7etrUpPM0Bs7OSIHfWU4NDAUi7gyR1XiZ/Y3bB3f0x2xSyxAHOFiQ
	PeVlbEPkGFHgwhvvI8mzga7lHNapj2iKcLjyAU8w/QSzqpm2UyC92WPwb/6dbJuM98m07rh8+bI
	0OwAK1h0VsC8ixGiWB796qsPIP+qOWJ93Llen+Oty/g3HSYtCc/VQXgAAQUkH6EfM/pZIL/LUsY
	YF9D47nqKUAZji/yTQ3V7tnfNn6uBBXa7/Khw5wkshyYwKstTmbv1X31+8RNwcvh78rF8Uh58Bp
	gpbc+WoVlPqgcSvXK8P8qLqTQSanLSDRJOpc2YoUeb2z88zzM2xw2YO5M0sSWCP352g01oLsJhf
	u2lDLFI6EUwoyNgustMZ3CBohZRmf2/8S4cuc5o6fcOD4tWqSGugZdXukLnMGXQJ1vNCmpRQHZU
	pP7MMAbT/hb1vRkYkNeROBnC3tMg5b7t88PHAUOUFdfJPYD8mFEXFEVUnLaldra0onPzXAayKBz
	zjMTuCvG2XSXTVe3mGzNAdAeNRWkbslnHYx+i7A=
X-Received: by 2002:a05:6000:491c:b0:488:844f:6034 with SMTP id ffacd0b85a97d-48dbad474bamr12837525f8f.48.1791733564150;
        Sun, 11 Oct 2026 08:46:04 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3341:ed52:5c10:2778:2fcf:de1f:bc08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db93d6069sm13996176f8f.0.2026.10.11.08.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 08:46:03 -0700 (PDT)
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
	Leander Kieweg <kieweg.leander@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/2] dt-bindings: display: Add GlandaGPU binding
Date: Sun, 11 Oct 2026 17:45:55 +0200
Message-ID: <20261011154556.155831-2-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011154556.155831-1-kieweg.leander@gmail.com>
References: <20261011154556.155831-1-kieweg.leander@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

