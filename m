Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001814854EA
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962603; cv=none; b=rK+4vlS428e+y/wQixVA54MoUCbgYUjopNn+jU60EFPAgXpPkl1+mcu5Gi+4C28Vn9kWRMwdBddWUnAit0RHp+okV2OBKT1iCP2yVZAAgG3WXNUrC4eeFdx5ftM7Fzh/BD1PEKN6QcrDMbewE9JjgSvoOxdfzzkdZo6YKRctG1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962603; c=relaxed/simple;
	bh=CeyU9HOfdIbNHxLPEk/FyCv98GowCMXlUEEA/1i+ud8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JeCYBn2TViUh7ydGmKELn7rk8Eu+02r5Z0gdZm3KYTcbbJ7tVKNC18l1Xvv0GXzspuGGqPlaFxKfkOmh4i4ZxMgQRzrPXm1e/7szrI2B61sdIGRQqIngkosDj5ThbOydGMIjxbpT31u626ju/msLa52yWjeLF/e8xzG8rH59Uas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKjHhe8z; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKjHhe8z"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2304468f8f.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962594; x=1792567394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E7VKM0kGySt6jsEqGEdmnsrJTxTzNoBKKYUnpSNyRaA=;
        b=sKjHhe8zrM4SDZBtePkpBGaONTOifz6eRBsHidFxPYnmcoIiOcKtzcFT5sgwxsaC6Z
         BJQ3LVzU/lJB/+z//iB/phhQGmMRJJMpyRkGkbrgm+ND67WNXrH2zrNmqsMjK7YNTtz2
         uJI4bBCHFCBvcRNBGg16GYVuTGWu5n01h/znObUNI8ascYru5YsHfpRQ65CDFKmDs5QX
         Ooxp0PiD70vlFz3FBPGgozgOmCv6hpFEqJipynd0hZB2RTNXpZlyAZrUmKTg3I/HTD4j
         FJH0k2bDju62p+2LaqEGJI6zJDOelukJ8k4/iXNT34pRyksM+JU071jx1UG8Q7fWhOIC
         RNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962594; x=1792567394;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7VKM0kGySt6jsEqGEdmnsrJTxTzNoBKKYUnpSNyRaA=;
        b=fdWbur9nLch6avByVl7gKCDsQvmtBPN7ZPt5Gh6lhYqFJXEgsJvTKxoZ6apZigAJJr
         v+hdjEU35mafknhMfliZJK5grq3XgHrrwn4TJUpd7MUUtwDCLJCIjHXHNFi5WKJuKPHx
         FJGfbi52VYJ7AzMX0fYvvsX7Rcvfp3RG26NbvKEV60D03EfQE3/dSrsdganZM5AC00m2
         tF2CnEEvI+oitqz93oeUPiyxjeOpaRdZJTIDdNtmNT1RoH1AU/QE4GyCag3DRBlPzeQA
         wFBw+UruiANwlL8toMp1B1V782fwiUQDQg7Umr8peI05ODAY4/EBnJthtqGCFvA9HQGN
         r08Q==
X-Forwarded-Encrypted: i=1; AKwUvBxtSwmDHpU+vxdA0bK9ufTO+ddcuuevSsfu29GYVgR1+Vf3lOOI64HAXijwXI38GAHNLKCCgFKJW/N7@vger.kernel.org
X-Gm-Message-State: AFq9FYIwcZC/4YQ3vS+AsYXSqTvnasmpx9J2490jE1fOG3qmM9NWlgkp
	EHj6E/EL9MigkmpWTF+2jeXiR0H7AsGPiREE+py212a/clghvltf1Jz9
X-Gm-Gg: AYBFou3Fl/aJsXB5bTzf69tKL1mt6uALwZUj1s68KuQDBi+xklju3YjssfiSIBIAA+h
	zEzHbu1a00w5SnDxPjO/9cFzdkdPQXCj5lZTDwn1L2a4SjdExfJsGg8RWmbDOUJJly2vCua8f3t
	PSBFJZvWxRiTVMheb90WuPWENnpsRKHoYzFwJIXjIreqYWkIFpjLjcV8rPsuQWMsch4edbYa0wx
	mjZl3G8bAaHpO/wpVKi68ZL127UwmISEGN2IatQMkkX8S8hexgidwwfYTYaB+/xd2Ao0306aDfa
	PfBfz8ase6m3/q0ajwArXUqQMsBtIW5o+GtEnojDM3w/u0PiDB5eTSALzODmcpfDtwqxR/cZf7n
	UvEDGv1lPoiy3h9Yd/FTRFJVFrmUcNODwz2Z0ENao0S/i4ZU7kKXFYTnvLbN6COe1ecUUi4UZVd
	p2ais0zAbS/2xfcxFn4Ok6nTQcQJjSIxqe6wRSRyBEsWBPXyrkivMw2B6t+DGzbHlz4NxaLgf9l
	LgBqYXoFcCU43192cFKmJpX42p/Shue1HnKmnSAQt6o/yfB+Rqri4qPfv+WzCXP2BMUz8QHSgGu
	KVEP0VdQEGz8HCuKYCBx5Tvylr1a+M8jRhVyrZ2djY//Nb+ntcTJJMrYhS3Ksg==
X-Received: by 2002:adf:e80b:0:b0:487:342:d141 with SMTP id ffacd0b85a97d-48dbaae8b8dmr21050586f8f.23.1791962593943;
        Wed, 14 Oct 2026 00:23:13 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:13 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/24] dt-bindings: spi: Add ZTE ZX family SPI flash controller binding
Date: Wed, 14 Oct 2026 08:20:59 +0100
Message-ID: <20261014072109.1759502-20-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Device Tree binding for the ZTE ZX family SPI flash controller,
supporting both ZX29 and ZX279128S SoCs.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/spi/zte,zx279128s-spifc.yaml     | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml

diff --git a/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml b/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
new file mode 100644
index 0000000000..201fe46b2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/zte,zx279128s-spifc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s SPI flash controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The SPI flash controller of the ZTE zx279128s runs flash operations (an
+  opcode with optional address, dummy and data phases) on one chip select.
+  The data phase can use one, two or four lines.
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - zte,zx29-qspi
+      - zte,zx279128s-spifc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: work clock, the source of the SPI clock
+      - description: register (APB) clock
+
+  clock-names:
+    items:
+      - const: wclk
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spi@94406000 {
+        compatible = "zte,zx279128s-spifc";
+        reg = <0x94406000 0x1000>;
+        interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&lsp0crpm ZX279128S_LSP0_SPI_WCLK>,
+                 <&lsp0crpm ZX279128S_LSP0_SPI_PCLK>;
+        clock-names = "wclk", "pclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "spi-nand";
+            reg = <0>;
+            spi-max-frequency = <50000000>;
+            spi-rx-bus-width = <2>;
+        };
+    };
-- 
2.55.0

