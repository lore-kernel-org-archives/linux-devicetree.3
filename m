Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729A3C9ED0
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909324; cv=none; b=Jm+nt/AN1kWxgn3o0BoFaeBpJjfV8K3iIeKKjQNPHxM3IKPAoE5YrEXfSsW/9dzJVAXrb/ZyXFaG8noY2sjchurqgFJnPY8K9UheEfvzoobxO7iE7ED2LwuL/Z9VVGC/KvE9QAmHl9C/+bZBI1jssngKjozu4KqdRk/E4RWE4KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909324; c=relaxed/simple;
	bh=0aV1EDPznOoER+avhb/DV25vmwPP/eyVYyHusxCFAP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t6TYzrEbcvJM7EtJYo4ku6PYQWzgA8hueo/hTHcO3tkyljujVqTtC7rackS756z4MIw8Qk+2LwyWwz3pt4JpFmHhCuWDnUUJDhNKL9yG8WGH1hY/p4ihKk+jaFiH6N2IX+NF6rqoY1a3bKh1lFND1smrCWQAJD1K0JSfCokQ/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCu3VAGy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCu3VAGy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso34450265e9.1
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909321; x=1787514121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lt1iFyoVmOWgdJa6Q9QXH7FhQnE0Gt7SjTwOuCNZXk4=;
        b=WCu3VAGyhPu9I7KIiUPVnGjQBsHyR/Y9IpATVtLvRGkv9wbDtz0neQFhnyVuq/lkna
         Ba42GmTuzP5R6yrCXwUi+0SEArXmeX7rxiBOrayfWO1DC8/b9I2kD/ll0Wpq6rq1kY/V
         T+ozX8mr3nsozeHai/ZjXQFQZEiqavxEZQMNyipGZwcDm65Ec9LuKFLA7zcxA6XxKA36
         CseWNjppO9XVfVFsaTMhic8pdKPCxnTHV/jUSDrv/Gu9Fn2vzr60Z+TuS7ISbhGQYP79
         +CYvezgAgTVu8uQPfLd+Xw75StcDpMErO0Tq+LtDYZG5HjWRrXlLZCTyn1G7LczLYGNp
         H3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909321; x=1787514121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lt1iFyoVmOWgdJa6Q9QXH7FhQnE0Gt7SjTwOuCNZXk4=;
        b=athAhr+SYZM4HSuM2w/7izb7U3iYAP8qhTdDPtO33WyBwph+aOr4d8JzyWgLCP/vVc
         Fv32tjewc/PoMQQrB9D22khvKybCcKx9/7vse+rZ4lH0Y0sZqUUAV1lTdIpSFMtxluoU
         STLuQ+zHGdl7Lx2KbTzXTy6+1jZxzP1u4Vsf1Bo2o8Woj+p0JhLqJjyQFTQtCQhu+CGA
         Uy/aCI1MJCfrbbOiXuP2Kf9J2uUka3ptJVQEcbAiXPb0xGxRkck7xmjtnwSq0FNWUNXE
         5MLlL/O9aH8AEmjvQOvvuedmhtYIfeVGBA3Ip2+QaH9VKTqgPdDVx+DRAjczBKowGgM3
         tqXA==
X-Forwarded-Encrypted: i=1; AHgh+RqV4zOc1FsnrzaYF5dXdr63oDmO7Mq7LcRznzt+On4nSbVKAsauX7ovUZVDsXS0scxHCQjNq8/cpnHb@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ3TD027oAwr8Ctt1ihka+OsFQUi29J2wjXJPchRC5V91rTVaO
	4A3x4n4fSEIkLm5Y6EOVOmjvNKNFUMnSxA+tG9PsAkeORsMybQseIr/c
X-Gm-Gg: AR+sD11d5v5NvtIW9eOskAuMcVfbDJBRx07ty9tR+e8q8YxCUqYo3jLxA/yaOg+REjM
	lH6WaQ3d6vjbVRT3ZwHhkBRJDPk9QROT9jwrMKOqRclnef+Pb4eH5Vsjc2+5wmcL/D/Wvx/KqdX
	BjvIRgFi5xdRscHEHVgH2xfMbuNEmtq5v26xrl1AIbuG6jkYfNxHejlDuSGsQavJplYviw6Nfih
	EwtxaIuYIqxQ3aJL+5EHfludDaieKtGdWAfYprzH2H+vl+HYV2K+kDiXL1tire+rPtg6qFkhAy5
	8dbbAXyhBtEYl6dYgjEy1pQALSojIVNm+wyj6+VxI+BRuiDHbF5dUIF2TawfFX0TMWoZBSO1CvY
	JkFCHDCNAjxXQ3sB9DqAkV804H0mysEaLDHexeZ6G1Utf6kqYa84vvq/Ri02dQn6eCxJWihb61z
	gjQeKz7sK4MXpviGobxtj+m0FtGr1QPKr6Z41wJCXOzNP2M7PtwwX+p9vauLFndTPd
X-Received: by 2002:a05:600c:1546:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-49987974700mr299168845e9.14.1786909321442;
        Sun, 16 Aug 2026 12:42:01 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:f1b:d401:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996106c6esm100527875e9.5.2026.08.16.12.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:42:01 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine binding
Date: Sun, 16 Aug 2026 20:39:44 +0100
Message-ID: <20260816194112.552100-2-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816194112.552100-1-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260816194112.552100-1-dawidro@gmail.com>
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

Co-developed-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Quartz64-B,
NanoPi R5S, NanoPC-T6 LTS
---
 .../crypto/rockchip,rk3588-crypto.yaml        | 83 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml

diff --git a/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
new file mode 100644
index 000000000000..32d241c19453
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
@@ -0,0 +1,83 @@
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
+    oneOf:
+      - const: rockchip,rk3568-crypto
+      - items:
+          - enum:
+              - rockchip,rk3588-crypto
+          - const: rockchip,rk3568-crypto
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
+    minItems: 1
+    maxItems: 3
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: aclk
+      - const: hclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      crypto@fe370000 {
+        compatible = "rockchip,rk3588-crypto", "rockchip,rk3568-crypto";
+        reg = <0x0 0xfe370000 0x0 0x2000>;
+        interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&scmi_clk SCMI_CRYPTO_CORE>, <&scmi_clk SCMI_ACLK_SECURE_NS>,
+                 <&scmi_clk SCMI_HCLK_SECURE_NS>;
+        clock-names = "core", "aclk", "hclk";
+        resets = <&scmi_reset SCMI_SRST_CRYPTO_CORE>;
+        reset-names = "core";
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c8d4b913f26c..50b77a750db3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23131,9 +23131,11 @@ F:	drivers/media/platform/rockchip/rkcif/
 
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>
+M:	Dawid Olesinski <dawidro@gmail.com>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/rockchip,rk3288-crypto.yaml
+F:	Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
 F:	drivers/crypto/rockchip/
 
 ROCKCHIP I2S TDM DRIVER
-- 
2.47.3

