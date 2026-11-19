Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053300;
	b=DgZu7ThXDzUvqnzDoDi35eeVwONp1uLDv6V2pCLLaeof8qQhYwrszDbu83bia0i3eBgG
	 jzThvQ/ghvTae4b25tsxj0VhVijeudKAgGLdD7QkZWYB7bcfr9NChkQu9z4IIxNjwNLUt
	 0Bf2KghTb5tqtfuOzGOWUB5KUWC4gpOPB0d1t7ruYPwzw9k3Jm2OWQkFPHUg+sk6zjfur
	 f2RloPlKSj6SqBv8F+hkBfGrEWXRh3uq2gUIzCej7cJqjupNHOGg1tPSrz/NkLvWOwjBp
	 1puQhT3B1KuM+R9QA1dzYTYKslgGQGZHkyg4hJYNBCMj7wvtm64uC7XPunqrZBnbXow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tjBxBXExyy9WLefYOQ4nHcOgOQ5o+ZNc0xlxhA3bZ8E=;
	b=IXkfoZFisYHxiZphwH2Fld+3VyXEa6cRWofSgeddGvZIZAIjbfvZTAIrCD+fnT8H/BtT
	 EFPv+xxMkcxD23sl0oyIFwZLABPiBtFGi9IeVW/lKpvz9l0lMFzG7D0C89sifzrtFFLh+
	 I6pzij6Rrh9ZTRcVjjAOD3Cox1wCKQIx7p290V61m4CWKHhNcyRNXUhymVHJ8g7S+LNB3
	 V3GPX+5eo/tPdldG6cUCdfduHE6QIHwlN9qeROnn7BLQXBSoUcHdvKrUYlAYvTb5boaGc
	 sAS5xWW+TFSEqQ9ZbzMhCAvsCw6QttHj+0TAuzdFtx3XkoAq7VS5yOe/rkXMAVHv51A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yiDpmAby;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CE060A2617
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69CE060A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yiDpmAby
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1305090a91.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795053300; x=1795658100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjBxBXExyy9WLefYOQ4nHcOgOQ5o+ZNc0xlxhA3bZ8E=;
        b=yiDpmAbyEafa+Bp5TnuXax0bY7p1lXAGnYEyqXmuMV5ajdev7k2TECoemjX6fe/7v5
         zsDZNStqvnScyh0UBRWmwPPMYLYTkH9ZmmYesSJ60RChor5miC0PQMXYt8iEBxgYWCQ+
         RH1ZSrSSH2T8DEWV/aKxc3aR/yxQBE3obLRAcmMc0R33nW8Xdw2MFLtXj8KAct24cV5k
         caDScZtQPTVTY4Pg0cQnfOZyjLVOBGwZTWMcCExLfi+dTfyCnH/UxqB8M1h0kFItcgpA
         r/30T6Bu9zQcxrqzQ8K93WwLadVtLD3LQk/w0r+hOi78DK19M/4Acx/Fei8pmpkpDYfY
         Ry5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053300; x=1795658100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjBxBXExyy9WLefYOQ4nHcOgOQ5o+ZNc0xlxhA3bZ8E=;
        b=NZ5CzFR9kmX3HpbvKchaKhNsC/mEZwAzEtkJNSygMe1AAClRRPVOiMYWow7B8dCa7y
         kVb3DQXSU8gYb7maZoQUoCoVI4iTlP0hcPv6Mdvv+dOufLVxBKRYwPTPYVC+rSUISZVR
         aiLhjigsnJxIo8r8YbwfmGoFUXzvkWIW13q15Slon+/OX2498puawnf0HZqgoHjgg+kl
         9WO6FJV0p0JrGZQWEmFlKnzie7EJ8WtI3yAD0SUqq9nppBoahv6wl1UAAEvfC2M72Gpy
         pcggIPhdLg+aOGMK3nGsSFYmlDroSN1mJAJZIBDoL3ZIj2JKQiN+KpoevDYFbzbhgR8e
         xzgg==
X-Forwarded-Encrypted: i=1; AL+hErEtJhShOj2VvqPSTMK1XCan1cOlyJjFJMvajLdAeIDKWusmlR+gXW0oqvEAaCz+2lz9lfQwlCGAILYG@vger.kernel.org
X-Gm-Message-State: APuU4Z81MxsT8IUh2Zsog6gW4sZFxuvf5FD4bACdHTuG7fnUI2dAz9j4
	Pdt7WTRSF4wKwUHoPbBP+9c/SBEtDsmAHhz3Z20MvLF02+j6ztVnD5nk
X-Gm-Gg: AZFdTZfvTkKmqq5f5dww31N2Tk9KWqw9KH9WZVZLVcITMnoXKJahULfyaIDGobWyazO
	58IhLtDX6ONuNuPRGpWQ1CopNPEcGcrmER9zzARGh+UOSggEwgVySO40g36fmKg1QyDvuT6xGmY
	h9iNtBnNAnCqMKnsHUO62pdS9ZBZrlgTlGwtvZpLbWEpF/C91VfYipWGXAfRDm7Akzw12jcK9E/
	/h4yl5GSj9lw7C5tRkWpMC4yPPPgYRTBVrJQ1RAyWEp92yzUQf++8wbRCGZtNVU2BqnFBInKUxz
	YQHU30WgtdiKyxv1EP4ZpnCaTLwMCemUkoHbOww8V3NhXRfwg7+ggUXZQnksh5GHsuH4CJ2djm8
	+aRncS0Cxou2v0NTEXPI1lW+wrdOKFRnTqACzKnT1e51wdfXpckbiTMMhKlo31hQjD7gcAxNmew
	3rHGdcF/LiC3VhKbuZ1YxpXOQe1xXg3DLCkiqmqxdcLGh9pe/XoUjGT/ACG+qQnMvt4u26xJqNm
	vLm6dBEdoHe9xldOHQ0scWFYnfEO4jAUqslLY/8EMX/LAXFG0mjN4Z0byaexaUxpw7eIbmOhRH0
	ZJ+CKlu6A6Nxfe4M2+06HuopdO6R7eKzPLZnUGSu0Cdaif1hB+RrodWmtjh6tYb46pcXMzyDb4A
	L90VRQa+ik2D6hHQ=
X-Received: by 2002:a17:90b:3d8f:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b3d07cd7c6mr4085733a91.61.1795053299722;
        Wed, 18 Nov 2026 17:54:59 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe03c3d4sm773081a91.14.2026.11.18.17.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:54:59 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
Date: Thu, 19 Nov 2026 09:54:46 +0800
Message-Id: <20261119015447.160470-2-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119015447.160470-1-shanchun1218@gmail.com>
References: <20261119015447.160470-1-shanchun1218@gmail.com>
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

Add binding for Nuvoton MA35D1 PDMA controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
---
 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
new file mode 100644
index 000000000000..d05971662a5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PDMA controller
+
+description:
+  The MA35D1 SoC has four Peripheral DMA (PDMA) controllers. Each controller
+  has 10 channels and performs memory-to-memory, memory-to-peripheral and
+  peripheral-to-memory transfers.
+
+maintainers:
+  - Shan-Chun Hung <shanchun1218@gmail.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-pdma
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#dma-cells":
+    const: 2
+    description:
+      The first cell is the PDMA channel number. The second cell is the
+      peripheral request source number, as listed in the reference manual.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#dma-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@40080000 {
+            compatible = "nuvoton,ma35d1-pdma";
+            reg = <0x0 0x40080000 0x0 0x2000>;
+            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk PDMA0_GATE>;
+            resets = <&sys MA35D1_RESET_PDMA0>;
+            #dma-cells = <2>;
+        };
+    };
+
+...
-- 
2.25.1

