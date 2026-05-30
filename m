Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58255327C0D
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157237; cv=none; b=o3kVa19mWwze7qyCGhMTVDAI+3vJ2isMBh9v0bp1vr2QMC4W2rX2x2b+8GuJeKWc86ByOF5Su5Bps0JDMRw2t0YV2rmzxM6mrCjb48KPN9eZBs8XNRTicYddJIxIGMagyjwgx+jBuR7mGLHS4um/zeo701kF4W+EVF7emnlk524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157237; c=relaxed/simple;
	bh=oJaLQm7RO4ezlWTTXjCrTAAHg8KhdMd5CaAE1SfLUXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AtKPO9kY5HDjLNLHZKqead4kcndAmO3TdoSaFkDw0HXqvjDuc1XR2AEc3Lxle5woTjec6f84VlKu41Fo/M9bHWmqPuQH8nr24cuFSqF4Y4wjz7TVteF5xure606YzmXhRf29xtj2ozKEKqB0P5ktwr7XAfgIqVSnHoA9KElY7Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pXCyCyEn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pXCyCyEn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso1428520f8f.0
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 09:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157233; x=1780762033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sh+f2AliULr9Rp7wvXUw2a0MafO9SPx6nLUlNFzn0RI=;
        b=pXCyCyEnOK1AzweldIusjmSZ4u8N4g3zqY9XGPuyJPoJDbQJlDAKHb8kJvznHAU6lc
         4c5z7mGBeQWH8a6414G3Yya9GWYHvlt2fTichrvPStlJbINt0niM/hbSSyLP/Q2h7yPw
         8MKM7B5QL9UaUwQRqOiNeco4VQSkJXeHDCueaTPyIdKgNV6WW6AfQ+e55WTcaiIv8cKF
         ypcR0Gm0Lu+6OdkQcuOVeK5WBWdSL1GduDTepD1usypt9ASBfIaSR9nqn/Vp2vjaj0Nu
         PXLLXIVB0w6DiDAGCPnYf8I9rTNXriSaEVGWhLPKb9cZo7I9qHHKf1sYTjgKGJkFKwK5
         Ei2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157233; x=1780762033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sh+f2AliULr9Rp7wvXUw2a0MafO9SPx6nLUlNFzn0RI=;
        b=Bq80pnifJZYf8JkB/cFcex5Yv2pcSnSmELa9eQNJTTLFDTZBvGme4d5Fv/IIf/nIiq
         RX1NHbvUOKkCvdVhTh/0aYzmfuiIW/i/b4GWO2JHPz2wSHDYzepJJ9W37cXk4phK1Tec
         o8uqk7ScwU2cEVxQc/1aTknEpmibB08fdT+89ns1upFbO4MYAguK9PhA12f+ITsb0j07
         p4WOMkxz3I2aRrndpfF3LYxBReNF1ADx6Go9RRYcXwzb0zrS/6ktbKzPNjzrtis2urCe
         b9OTQ+hIHOqOPQgZXX7olfAEkWf290jaiEUu7sJOrRGSPlflbDu3rwq2E/3pGRQmBIBP
         I4PA==
X-Forwarded-Encrypted: i=1; AFNElJ8hWFTI1n79ReEtAAy8+igZYrxK4Sa+D/nuLU+GEshGCEezwfvXYFCgPvne4M806pbF8/NHpoVM0giX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlrux2u7Is6P8iG7jcvGMPmYXO+cjRLT3OV8HbKw3Kk0JXzk0S
	cLQnvbmkVAMmyuGWCGNIsPz0gNEk8/Adl/YaOt1QoWhcHe3vYF250caH
X-Gm-Gg: Acq92OFnoioz1vgoeOLeMH7+CA5M9VxR6Z1Km9qpsFgEt4LGbGFwry0DqeHig6vEy/r
	7+ZCFeaXBopd+hOusGue6CmEEFk7XdgOQwyFR0Iq5zeZvqskeJnk5qcYiI5A1kocZ0/dzi5pxw9
	8CIKLNO1wgZnPeb5/ykOmsK/l5SDOeRKbEZunTcDnczFb1856siaOrIqMoQxxJSgu22FnH4Q+79
	KKmYGLNiqby/azbaB2FqGOL3HhZUX5pEewzmWZK+4suarbLJ6o8E75qoQSDuz4MaZNL3jkg8sAM
	0Dz3u291BrDc2nr6gM+H1+vdb0Uj0gMpRzRmGPCCUC5ceKVVNb7j/uXtQgvH/hZM2e4jZq+xECX
	O4n6otRBYVAe2cQgi5PXpbUkELT538/RiWf2fgqjQ/HqBK69n1n+IoidaDRxDnm6GuXMkZuXqcn
	LlbOQBaUB7LNMJomDiX/19zFhuLaA=
X-Received: by 2002:a05:6000:22c7:b0:43d:762e:76ba with SMTP id ffacd0b85a97d-45ef6b19b8emr8623681f8f.17.1780157232877;
        Sat, 30 May 2026 09:07:12 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm11667339f8f.0.2026.05.30.09.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:07:12 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	heiko@sntech.de
Cc: linux-crypto@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	clabbe@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine binding
Date: Sat, 30 May 2026 17:06:42 +0100
Message-ID: <20260530160704.3453555-2-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260530160704.3453555-1-dawidro@gmail.com>
References: <20260530160704.3453555-1-dawidro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a YAML device tree binding for the Rockchip second-generation (V2)
cryptographic hardware accelerator present on the RK3568 and RK3588 SoCs.

The IP block exposes AES-ECB, AES-CBC, AES-XTS block ciphers, SHA-1,
SHA-224, SHA-256, SHA-384, SHA-512, MD5, and SM3 hash algorithms, each
with a hardware DMA engine controlled via linked-list descriptors.

The binding covers two compatible strings:

  - rockchip,rk3568-crypto: clocks and resets are driven directly by the
    non-secure CRU (accessible to Linux at EL1).
  - rockchip,rk3588-crypto: clocks and resets live in SECURECRU, a
    register bank sandboxed to TrustZone. Linux must request them through
    the ARM SCMI firmware interface (scmi_clk / scmi_reset), as direct
    MMIO access to SECURECRU from EL1 triggers a bus fault.

Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
---
 .../crypto/rockchip,rk3588-crypto.yaml        | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml

diff --git a/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
new file mode 100644
index 000000000000..4188ed8920db
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/rockchip,rk3588-crypto.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip cryptographic offloader
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+  - Corentin Labbe <clabbe@baylibre.com>
+  - Dawid Olesinski <dawidro@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3568-crypto
+      - rockchip,rk3588-crypto
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock for the crypto IP internal logic
+      - description: AXI interconnect clock interface
+      - description: AHB interface clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: aclk
+      - const: hclk
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: core
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    crypto@fe370000 {
+        compatible = "rockchip,rk3588-crypto";
+        reg = <0x0 0xfe370000 0x0 0x2000>;
+        interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&scmi_clk SCMI_CRYPTO_CORE>,
+                 <&scmi_clk SCMI_ACLK_SECURE_NS>,
+                 <&scmi_clk SCMI_HCLK_SECURE_NS>;
+        clock-names = "core", "aclk", "hclk";
+        resets = <&scmi_reset SCMI_SRST_CRYPTO_CORE>;
+        reset-names = "core";
+    };
-- 
2.47.3

