Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6084638B7BA
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 19:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787601278; cv=none; b=ujisn9WoLr+jxFABche7RP3Olff4+fw915EVmKY/ASYeTlMXjWdebiOInxQXLN9wciqkFH28bhmCo4rcj17Tsb+oO55uXDsappiPiDVWlw6S7kchLBFpSzxWWnnIubH64n/ZC4u54OBjpAptMBvnAPlSfiHDI2hoqPX/qKP1i64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787601278; c=relaxed/simple;
	bh=8geZ8AJGhKzOHuWNZM3a7GfyVRs2qOSc+GK8c85oVeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZ+DwmVALz2IpYrC3366cBYDzSzsn8R3+1XhYHpqYjbopfh4NdTTOTywzWe7IhiHiie5uGyXMjA5FlJf15V6M0MseCuaKv+oPgwZY3Hs2cT/LUTvuWTdmQlgl0Ou6iae5b8d1UhHFjsqpj/tu7ncg/+D4BRlc/+W6zxyCRcCxHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIszImwv; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIszImwv"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c167aa9500dso598998366b.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 12:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787601276; x=1788206076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7769R8m5fjpUM/KSgOtTNE43hbaxs0YKNppnGOC6Rk=;
        b=gIszImwvaTUxP2SK+7B7YoDlsOzbBK/r8fgcF2KP9bGc0FuR/WrFIg4MiGf3+27sy/
         V6gYG7d2MQkKi+5nIE+OTkaG4giI8zsFr+ISPXa4gRcl6rR4zw7jL3R+h1qkfnS9YpHg
         8Luzn6Ih8CqfajfGz2p1IleHxsjLOm2iJoAu3pxRy4znA/k9UHf1LDxsDhPogYzDqX6+
         iwroBqNPUgFfvpvT7SOS+jpFoPHy4GUKsKyAJtVAbRyhhha9VFTy15/+2UzUj7wBjhB0
         /5/LHUvJvFsOucA0Js1GRdMS+LepxMF1dKg+fDm27OecCfT/BCpxEmyARA+GgBeFZIh2
         VYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601276; x=1788206076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d7769R8m5fjpUM/KSgOtTNE43hbaxs0YKNppnGOC6Rk=;
        b=E4wWOQPN82oLRK6aon3gOPlSJ1OyoXhcCKAHs7hf/h01GTX2qf9jLJIRj9a6ZzkSww
         k9TKOLaRC0NLlHiOnWnb0ilcsY+WVW51X6STOML2oO2VAMg+lXbPkNF2wbiAKdQm27LN
         FuGZZnV1NUuwA9uSxgwzI3GHMMAKgXLW3ar4TZ4x81CmqM9VProIeHFPGbP59sqiJ5jW
         MOMO9LYaBMZgZp3n2H+dkYMy4BoMXK7u5brYRir2cUKT6jC8qOqfmhDzlprbYnjInzco
         tlmqu4SjrViLElIRkU/B5akVMfAgm+DHqTTf4LHk0ZClmm+lHia7NmbwdBUjyieOQK57
         C9/A==
X-Forwarded-Encrypted: i=1; AHgh+Rpi8I8+b0WaDvKpT1/ID7kUrhA5wFpV4sH+AlX5jFwrZtixrYMiXmjAHH2RV2XZQouIkw6QwBj/BK9Z@vger.kernel.org
X-Gm-Message-State: AFuF++mz7wothHS100gZdUcB3MnXBHJ9Hfae06l0fq1r3goH/3ORSbtk
	QrFi/uBDq2VYrTXKp4OUPGIAld672neHGwVn7ce+ec+PjJQGvfe7LzBN
X-Gm-Gg: AR+sD104netNhHxDjF5kHJx+lfzbW8zpGGo0tjICQRMU0hlDWn5SqGEqeJqRUTYonaX
	CLr+5JTcdRKQDQGnytS9gnx1F4rh3lUppO0rNaM/+Rp+qU8hrqOwcpr92jGhKxYYpwEc/6ifX53
	hzwXiqqHBRdBWvvVC7hJTflP0/LkFMLF5h4PsSG00qbEWPkQ3r91S9mxFSOQuh/Z+Bitk0ODFWL
	54g6Qnc4K3IeGvXOCXp6YWqHWSxuazbONbVsWiLFH3dzg8nbGIxUODlYsnsmHx6UIz+WcMLVyOB
	Ae9plhVXIfPHf3/8QbVQMrsbc0zQgzKNGq0INcDWmjZbD06WxqFqgmLvW4xdHWnFiXLGWkWH9K/
	PsULff/htL2FRuN/HVYdT5my8ztKSd1SwNxlT0G3sv4lG8q8d6UwUGxtzG83z3HF6CDa1ngyA9A
	2p4drpjRW+bwiudfXRkxKlpLOHk8VtYPHpnXCOq7EL9DfZ1IEyTkWlEESZxPu89w3ChkgaLRclx
	34+laG82fmQKSQABCogg0Wz//B4WmK5cAyyancO7uQvAXDUoMnZ65NXVJPWhQBt8ayV2vtkB0fM
	eImLu3EHYD4b9TtM0EGotVpggdo=
X-Received: by 2002:a17:907:e1d0:20b0:c20:f864:d480 with SMTP id a640c23a62f3a-c246a6559aemr2325229166b.13.1787601275565;
        Mon, 24 Aug 2026 12:54:35 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e025158sm11410217a12.11.2026.08.24.12.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:54:35 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: display: Add GlandaGPU binding
Date: Mon, 24 Aug 2026 21:54:17 +0200
Message-ID: <20260824195418.17707-2-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195418.17707-1-kieweg.leander@gmail.com>
References: <20260824195418.17707-1-kieweg.leander@gmail.com>
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
 .../bindings/display/kieweg,gpu.yaml          | 55 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/kieweg,gpu.yaml

diff --git a/Documentation/devicetree/bindings/display/kieweg,gpu.yaml b/Documentation/devicetree/bindings/display/kieweg,gpu.yaml
new file mode 100644
index 000000000..c0fda8438
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/kieweg,gpu.yaml
@@ -0,0 +1,55 @@
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
index b1af9deac..fd2fd5ea2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -666,6 +666,8 @@ patternProperties:
     description: Giantplus Technology Co., Ltd.
   "^gira,.*":
     description: Gira Giersiepen GmbH & Co. KG
+  "^kieweg,.*":
+    description: Leander Kieweg
   "^glinet,.*":
     description: GL Intelligence, Inc.
   "^globalscale,.*":
-- 
2.43.0

