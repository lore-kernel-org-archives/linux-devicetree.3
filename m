Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD8F363083
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790137188; cv=none; b=b3ugRMHwQAg2lkiu0lasQHsrwVJJSu9LH4qBEmhx8ySErAFEx78Osmhmn5BDRPtSYCukFb8mGCwYbCkSl2vQSfjb1B48xXNX3I8DJ+7NLyiHfRlA7WS92HSkt96SYCf094cwOX0QNx4pk5l/m5hUujwKvFejpKfgh/E3J7As1RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790137188; c=relaxed/simple;
	bh=EZAK9VCoqm8+w1Hw0Z/ZjQV7RYJy2WKFKHBPRcRz9oQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WOv/Cv2o481cWGBRICWEJT+mtekuuyLq6sUuMBDYtYM5LV/sLXSV6u/J7cfeYvdKsGiy38i25bojOqRiNTYGU0zH/Y+t0+WtuUGzzFLyZjZpByMwHnBthQbKUNxfD99UsAFNZYntUtRWK1J2ENdLW2F0k8jSf36Zv+dwBSYS0/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgszFTRf; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgszFTRf"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so320373a91.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 21:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790137186; x=1790741986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUGLxOvF7mywRs9buCfM5BiPX8wZpsZsunHJCACFyEg=;
        b=PgszFTRf+bpxp6D6WLqhJAhlSgI6nHW0g0guqmCx3ay6930iJhOUqeT07blTA52WSr
         LnR+DRHyWreJDN95HsehivpeTyyJp7s3pNoXossggOZ4GQ961YKs6K08zqw/x9yA4m+y
         yt3g2OO1EcwciY6lQZTIlt03Qx5MdaRKJOLt9vm0ZdVMPA6X47miVeFRIu6j4+fUpXtl
         8e8Vw83q4+EtuZfjT5YIrG2hjHQRKl8PByN69nkEpmpZ95rK7Tctr+1uVLF6uZXuW3Ba
         vvT7VH6n/vwval0d2TI47ADxxII4Agep7a+6clxxNhXmqpzbp5Tz3xEkIzZhqQJuPSK6
         0NNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790137186; x=1790741986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUGLxOvF7mywRs9buCfM5BiPX8wZpsZsunHJCACFyEg=;
        b=peo+eFGLqNTFTwdOdZ1DEN3/gfPO68utuXV3q2byDTCrBuxdNbfLkCHru5Yz9VEYBd
         q4kQHMXbCgN0rVz4R9NhlPacuPtrjtRIyvqHWQnYXebbcjhpeBjv4WpPT8bztAzmaeLR
         f1JRiy2mjKk7BgR5EBNnJcE1SKSveXrxBnQvOf3GVCkqQOYAKdmkmROOuJHFVMt6oSNw
         CcWpBTYLc1nL7CBsMyREmLwfJB7q+0oGZyb5iO+wtUvi6lVpYtjDO11GNCgCxBJO9urm
         kWp89jP3Z+BaARO0eKFAKbkKGIB/Pw3f/dFnYNWj3zBwXOwI930LyEOpg6EIJU2BKCml
         FoKw==
X-Forwarded-Encrypted: i=1; AKwUvByglUlNWghh3pzsW4rwOmagmDnKoIWD7LyTPprfCEh5UC1vj+RQpDafg79vqHeqCN4yLuvJs/0Ar2Ak@vger.kernel.org
X-Gm-Message-State: AFuF++lmAgGW5FExzEOFrQyOgGBmzW1wY2juUHoKaMUxUqLpfx2PNT1y
	N6acedrYWLbbd4t+3psROziSAf/vmxHwYiHO40ebN0dmxVMVZw0O5bDC
X-Gm-Gg: AYBFou3W0P8QuCP0d0kObTWu7akx8jhVwe114Pn95m/vdvXNkdgs1jq8U2LYAedC7+V
	5gwpuc1cXVPu4Fe6Rpkiq21V2WhFOliNXZ8e4Yk9fdm7IDx+k1UrM9LqqFnTlSqWLbfr2MvVa/T
	IiyHSPeGrbps/u4uSA6D9hDeU9wkhjoVnbrwV1yl2RRy3OUiJDzHZsgCv5Ot8vJcVMsLbK9ZyQt
	0E9jxF9c/s/jjhtKQKQkl4RKkcLojvK4yI00Kk5hX9Lm2btEJRulaDxd8/xLJHcPhcAAlT+9QIN
	TNDAbcyz0iX3G0aClfvOHG396NtfVrcGmhVALHJt9suAf4BRfJ4hKy4sMC2lN6L+0EdyewHDTyl
	or57h46Gc0m4nPg6Iz5R459kt2SVXsv26Yy9PoIkwRb+mAvfCdsK1KYbl5FFEppKxsDIHlc572w
	NQYs4gsk0hBvUEfDt1Pu7ZWZazl2hE1243w0Djqykz/FaUSfdaNhJTxRQipA9Eqra3zctthIDd7
	N+NR7DAuDT9fA799DT8G0Gx1NfMYTEDKreAUVnm3AnMCzeKb4gcDYS2IC/m
X-Received: by 2002:a17:90b:4d0f:b0:39e:6a81:c922 with SMTP id 98e67ed59e1d1-3a07e641099mr1375383a91.21.1790137186121;
        Tue, 22 Sep 2026 21:19:46 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae723sm2510243a91.5.2026.09.22.21.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:19:45 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: spi: nuvoton,ma35d1-spi: Add Nuvoton MA35D1 SPI controller
Date: Wed, 23 Sep 2026 12:19:25 +0800
Message-Id: <20260923041926.425551-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260923041926.425551-1-cwweng.linux@gmail.com>
References: <20260923041926.425551-1-cwweng.linux@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add a Devicetree binding for the SPI controller found in the
Nuvoton MA35D1 SoC.

The controller provides two native chip-select outputs and supports
additional GPIO chip selects through the generic SPI controller
binding.

Describe the controller register region, clock, reset, and optional
interrupt resources.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/spi/nuvoton,ma35d1-spi.yaml      | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-spi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-spi.yaml
new file mode 100644
index 000000000000..4e1afbdb195d
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-spi.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 SPI Controller
+
+description: |
+  The Nuvoton MA35D1 SPI controller supports host and target operation and
+  provides two native chip-select outputs. GPIO chip selects are supported
+  through the generic SPI controller binding.
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  num-cs:
+    minimum: 1
+    maximum: 2
+    default: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        spi@40600000 {
+            compatible = "nuvoton,ma35d1-spi";
+            reg = <0x0 0x40600000 0x0 0x10000>;
+            interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk SPI0_GATE>;
+            resets = <&sys MA35D1_RESET_SPI0>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+...
-- 
2.25.1

