Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7FB4AA00F
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860713; cv=none; b=btxx+vM2ouh1B2S8T4G4YXT/4Y3puHASU2hiKi7lVDtCSuZmCD2tl1wLvM96Rn9TAamXg5Y/McNbAtGj1jKjAC2pq9ACIH3CZhybg5B9P50jjyu+NNFPSq3oaF++stiJI5ydwdBq88LnO3qGgLxQg1lK/jt1OF8FXxv73vWvcx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860713; c=relaxed/simple;
	bh=lhRbxtVBIybdQCTOorjTAyoTpO5aS0NzNmk5FzOl1DY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GiONOizT3jiLC4ILdBwUvQj5tddaS2sCKoFFoM8zWZKEEWKSOuib9rAJYSdUT1ntO6fTfnTvYLY5r7YWm21eWbYI63j8WSMQat26l8OVWo3OYO/ATX+dFMPanjCJSdYvIOaAbZ1mQs9PlGZg5/Fcr86RO/bSb8fvnKKzZf2k7X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAZZJCxX; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAZZJCxX"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d2c37b0bso2602432a91.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 06:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790860711; x=1791465511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2a/uAq+WStsO8aQx6BMPUzRVm0wlq4SS94ygHqJZbI=;
        b=JAZZJCxXXUd3ka+O7v4l/WJ4ocLC7Z83gQq9ljIBc64z7owfrmoWQ481IeNJCUy+WL
         hYC0tQ1Ov60trtWyR47QLr2xOdz3cO6NUH19wI4sWzhbK8ybJxJ72NuDXKGkvzfMGprJ
         eWv++8/F4nhJzDrYY4OG4G2expb33y/eGPzyyh7S5MwjdLEnMQsMdjs7UmK9FjYyqWx1
         dt8iJfQqAFk39BC1fNxr/yQvDdvIqfXGIcHSJesA0d1x1djtQTLPLSQa2btwR4lUOPkn
         7RfcapG4poRqgH59687F+1VA42GZV5Ne+DeDVZgxLYqeLNQqWLjO2nJ4YTkBjiz9UxY9
         p6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860711; x=1791465511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2a/uAq+WStsO8aQx6BMPUzRVm0wlq4SS94ygHqJZbI=;
        b=qIz8jwiUK8YlqbZX+MuruMnLuuB7lZY6T3UnyA3+ja1JcgH70p+WXDom8BdeI82rkr
         ux3OhA6lx1wgEP7xeLMn2VNb8djmfriojVe43PKbLIczhtm/PbBVSLb9BoEQHNKuvi7s
         71pCAvHlunJCcFlkjOkFhxH64ZM6tRJOvMZIEfJiORJn3/5C1V9IUjSAoWP0UqeSiVBo
         i7Dalvfu58TImMeUJNge7rFgckJwpMFc2jtg2N5wqkR/0HHaAcw9hPN35FLw5r1VQnsU
         9iFa7bPqbzyE8WLTEN0tglo5mDWWAhdwiGbQIRE/e08As+2Zl3+LiETsbx7qEz2BXn2D
         IOKA==
X-Forwarded-Encrypted: i=1; AKwUvBzNoct3F60VDQ98OW4JursCIQrnn5dsz7H+ROTbI+zfliDyXJQjJDSsid4d4VO6sA0SzL5yJZImPaS3@vger.kernel.org
X-Gm-Message-State: AFq9FYL6bQa3xKf2pPfXgpOgBnof7nhzNA4Ffurj7YZH7ab+1KYSV9SZ
	TNPv+wUYEjSDwBeC8JuC8CPOnnWT7aHnp7PYW3fzimfzla7JSTZUYgGX
X-Gm-Gg: AYBFou06zADqDCaAx4jG7wpIcoBpHPZSFtE1hKvwk/zLHDEGQNnoMzr0MwW3bl/Zjub
	iICVLSkfsiSD4SfUHfMSDDY41OpT4/OrFFvAPa5Md/hCY1m8MtHxwIhS8gEmp7Y/9q6HFWg+qZT
	arLznpnMkEE2tav5O5yacHpR5X6uivkPz8ihOcEfkxsQHSraYNefGABsKywsZMN33y53jVNun2S
	3BE5UIKJ3zsatmFUx6QgqRQO93cIbMgsOIgb8fcacXrT45OlM56AQyYC3Guj6wx8uql58RQo+PW
	QKQrFfzjUYF+xqXexEq73Cst35fHfxUX+4+73v4m+Tuv5oHDO56HNe2wjk1FB8fCyGq/dOtgXdW
	bACfrjaTXt0ZyfoWTfcUD2NvkJdhQTVucT+ekgJPngRT4xDV/oFz1i8SsTnBYNWeU7laKC8SXHN
	S0RqufgIvRtvw+UFAMrng6XApsjPwUBjnppIHw2gIFcjrVCdoFybs1lDUzdYn8GgkPsELFAK6Hb
	A26cFhn32YJxNwGvJuT1OhQpzzBHiJ6mWIZpk/u1uCHkfj+jOPsmxw45IX4
X-Received: by 2002:a17:90b:5787:b0:3a0:c1de:f720 with SMTP id 98e67ed59e1d1-3a4d197e17emr4062843a91.20.1790860710586;
        Thu, 01 Oct 2026 06:18:30 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46bb550sm5016692a91.5.2026.10.01.06.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:18:29 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v2 1/3] spi: dt-bindings: nuvoton,ma35d1-qspi: Add MA35D1 SPI controller
Date: Thu,  1 Oct 2026 21:18:16 +0800
Message-Id: <20261001131818.110028-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001131818.110028-1-cwweng.linux@gmail.com>
References: <20261001131818.110028-1-cwweng.linux@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

Extend the existing MA35D1 QSPI binding to also describe the MA35D1 SPI
controller.

The SPI and QSPI controllers are separate hardware IPs. QSPI additionally
supports dual, quad and DTR transfers and a target-mode timeout function,
but these differences do not require additional controller-specific
Devicetree properties.

Both controllers expose the same Devicetree-visible resources and provide
up to two native chip-select signals. GPIO chip selects are supported
through the generic SPI controller binding. Since the MA35D1 QSPI driver
now supports GPIO chip selects, also remove the existing restriction
on cs-gpios for the QSPI compatible.

Add the nuvoton,ma35d1-spi compatible and update the binding description
and examples to cover both controllers.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 41 +++++++++++++++++--
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
index 40965ec5163b..72f2e1e1219a 100644
--- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -4,7 +4,17 @@
 $id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Nuvoton MA35D1 Quad SPI Controller
+title: Nuvoton MA35D1 SPI and Quad SPI Controllers
+
+description: |
+  The Nuvoton MA35D1 SoC contains separate SPI and QSPI controller IPs.
+  Both controllers expose the same Devicetree-visible resources and provide
+  two native chip-select signals. GPIO chip selects are supported through the
+  generic SPI controller binding.
+
+  The QSPI controller additionally supports dual, quad and DTR transfers and
+  a target-mode timeout function. These capability differences do not require
+  additional controller properties.
 
 maintainers:
   - Chi-Wen Weng <cwweng@nuvoton.com>
@@ -14,7 +24,9 @@ allOf:
 
 properties:
   compatible:
-    const: nuvoton,ma35d1-qspi
+    enum:
+      - nuvoton,ma35d1-spi
+      - nuvoton,ma35d1-qspi
 
   reg:
     maxItems: 1
@@ -33,8 +45,6 @@ properties:
     maximum: 2
     default: 2
 
-  cs-gpios: false
-
 required:
   - compatible
   - reg
@@ -59,7 +69,30 @@ examples:
             interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
             clocks = <&clk QSPI0_GATE>;
             resets = <&sys MA35D1_RESET_QSPI0>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        spi@40600000 {
+            compatible = "nuvoton,ma35d1-spi";
+            reg = <0 0x40600000 0 0x10000>;
+            interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk SPI0_GATE>;
+            resets = <&sys MA35D1_RESET_SPI0>;
+
             #address-cells = <1>;
             #size-cells = <0>;
         };
     };
+...
-- 
2.25.1

