Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0032A3FA5E7
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723155; cv=none; b=I/6CPUcq8Tn1/HM6j31zQ9HSjvmU4vcxblZW4S82BnI4h4FFx7G7xPeTtDVTkVOsJCuHXiaoEUriXwhpesxUzjlz2ffniZiB78VeWZYZFbfiZlYeS/mDDbuF+WNzlqeTCnFA+Q6DkcsmzjTkaX3ZgP9MRyTU7bteDih6BilxWtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723155; c=relaxed/simple;
	bh=nlg2Vo5gJVuqTy6ZSc5mAEsVYdjtMTLDz7lCiJOX1tU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aA5Gm6JhLMZk2zE/mPDckSkIqMfidAkAtWG9FrDMeX8sinXvrl6k4ACcVqGSpwbbggdYIPZGbZl50xI5YvBNsc8jdbhpRULs0X8ZIssfZyP4C5KidgSAA9Gy4gbWzdSjVMcf94kWBoNl4elzIXFxNW9h58I3Rv62pGWVB1SN97c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hIGWvs6G; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hIGWvs6G"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so4251895e9.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723145; x=1790327945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PItxhm1d8xzkPavNU3zKUDfTi98fHCExarwonsyE1cQ=;
        b=hIGWvs6GFe3NiWRr9WAPFWENMy72M3Ago0qLEL3jCW9jCTExOEVGr4K4FG7JWxOR+x
         IGeBR62C5k76QNasDaM6GZWMrmcfg2BnnV1O/lO3QwUYm7+7zkBVbEpDV3SaiN8pGX2A
         QJb4qOz/U0J42OGRALSl4H4CFY0gaV3vSRJVOvX68Uf7yMouF10DOsNP+ANmEybEw9xi
         VH8VSjy4kSAgM2mYPeUp1qArUPv0C6TWqoeDxz8C39vm4Pe3sSxJOei9Hon19uw50FUu
         Ttv8eSVHqbkDUfilBI3odZbpOUJXFGtfp97neJoEiN57AeRDajRPOOJUn1L8rrq7LJGr
         x67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723145; x=1790327945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PItxhm1d8xzkPavNU3zKUDfTi98fHCExarwonsyE1cQ=;
        b=kbDncNxHdBVFSbSemdD/8vbihjRLW4q4F4guod6sUBPmuHiOOcWzJN2CBQDeUpA7tN
         yq84zAMgQYLixYVGGLxG530UiH+PhsFXxmdyS27KB83yi2g44igrQDVNjw5bOz0YJ8kf
         jeif9F4yQztXeRX+gg63ypQSisJcJFbV4r98yF9lwXNk8/uGpZp6ZCnUdfIZuxzu2lRR
         N+HJtAnQdXZ4s1Un7YGkKdLHBnnQp0nnN5tMx8ROoY7wbRGTxhpiQ7p6H/1tONumRf6A
         5cfpJkfiSwXuz8jo4tu5AulUhq5yKtIMjZ/a0r7trYeuN560pNaJ0HFZYJdPBqf1iC98
         1FsQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3lGwt8NumJui4qlQWZzX9gqvx1IhF98oVoFPT9SauEDthaXUqY20OqYCsXpLbALfSHa4dMj++JHn0@vger.kernel.org
X-Gm-Message-State: AFuF++l2+QZFnvyK0U9gh5hlA8v9vd8MtrVtdBcxuPHzL1qIdUfXrMKN
	9k8HGv8Ihtbq1zS2wtePEQ9YCot8VXYtgeE9y6XhL6EMo3AhNFf7Ks8HzZ3Vt21/HEQ=
X-Gm-Gg: AYBFou1stYySFGiVz5NtP00MRLQKwKCdMZe1RRbLZ1n+x+epRBe5h4pMbCIBWnuyiJv
	H8Ow+O+FDcLN/s1gvFKbFoOmRU9lTjmrRSZoG4kkXcLf1RbB9UkMSFYbD2gOp7g/CJPTLqEizTK
	/sAXvsRWMe5YpTwbWOvIUOhA+XCTwamN1DPiMiPmrlmvge/wQFZUIhVrrfpunrWKpjhXS4mWsB6
	SM7H9gCelY4lO7MDTguc3hJR/JDB1Njl6n3UIa9fZBEDShkZvfNExgqB7X5p4G6CB65YyQkl0Ky
	BtArwXIKJCHHR124iV799bryHZLtJHv1IUqDfCKOxr9FqvgOAoe6/UvyYNxcTvCV+EEhRfV7j3p
	nEcOylgm2r2diKK1mzI0ijcXWFE7Ds7N5Wxm/FBVM261gzk/2SN2Rp42pwm0AS4/A54qP7vtpz8
	odxlfqAx3CazV58/spaL9YEF/15UoGNiiRmf0B1yazPK7wLpY0EFDNN4qYICbfe5yEK90=
X-Received: by 2002:a05:600c:310d:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fc5721b9dmr23520765e9.10.1789723145444;
        Fri, 18 Sep 2026 02:19:05 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23a815sm156485815e9.14.2026.09.18.02.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:05 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:49 +0200
Subject: [PATCH v9 5/9] arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-5-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526; i=msp@baylibre.com;
 h=from:subject:message-id; bh=nlg2Vo5gJVuqTy6ZSc5mAEsVYdjtMTLDz7lCiJOX1tU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jNd4ntTwXnTU3m4lvFOgSprp1PNUmYmXfgX1nVK59
 mvHikNTOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAihcaMDO92LIo81Cr9+Mnp
 c5FTQv55fjQ8dmTz9lsTN+x+Uq9y/sczhv+pKyvuPpicXLPodmlO0eTUAJdLPNtePzRtaDznpfU
 yOIUVAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: b05a6c145001 ("arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors")
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d..b8af9ec81b0c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -57,7 +57,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1d08000>;
 			no-map;
 		};
 

-- 
2.55.0

