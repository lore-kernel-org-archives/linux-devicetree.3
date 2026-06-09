Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669804C77A4
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 18:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031469; cv=none; b=HXNla7dIr2iBM67vyW/quUzWLQvAtNS5TsLHK08iX0+3DyX3K39xebvwxN4JNnXpgvaAwMkNz/wj7P6vHhkNbtxOCCDIPxqgUuEbQIby2LXGMPMDkV9eyLmMlO1P3aKCmTiRg3CcbD0pzIKonAXsfKopLTq35ESm+bYYY3aC6P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031469; c=relaxed/simple;
	bh=xJhx36MS26Ugt3HIC/X2CbJ51kDEkatoPsKwiaxCXCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwvqi8h6CgAJZ4Cd9LsBGFXIElN6UJsbJKR/V/rx6dmrxB2Yq4QY7jAxyos5hsTSYCS4zIvAujjmHTqHUpxxh3B7xVH3yyKnZnIADnbi+lFT4z33OquRp8V8IlMSDn0ZNmDZV4JO+gs1bD+RjIQah9wW+sk/3iOjnTdMDP3TqSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=G1ij2FQF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="G1ij2FQF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so22217195e9.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031467; x=1781636267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lExvIVm/qhAmBiXb4s7Ug/WTGW/jVwYWmx7ZmSxI+IU=;
        b=G1ij2FQFgQzzwjiSGQq9OSTlXLzPN0lNAh4hDD0BvbMaFuBjwDbhqqwdk/SxHu79Br
         anmjaZi0zNuKO4A2STn/g1EyL+W7Z3XXIL1DOg8ycS3BYtjc88sD5gQgc1xRxh1TJigY
         HheRz9i9sTYNNhfTNu/FOErOzlV7IzUSPI25U77MlFB60cmJqaPN5a13H891GWYFJ7Jg
         zAn9C36TBer+lZwYnAzMj4YtCoKqFf3cFMCUnuuVa8mX2KkVZZMksqv2wRxgFCE5E7oH
         78xJ22T1hSKmI5GeNyuFVLI0ec2juUlkE2q9/YPBK931abVLTR8Jk3u/BpZMnu0//Qg7
         cFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031467; x=1781636267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lExvIVm/qhAmBiXb4s7Ug/WTGW/jVwYWmx7ZmSxI+IU=;
        b=AsQFdGvNqyprsNMVCFqph0mcpAeyb0l1e3YnEtZEu0fNzVC42TB7ni03Q3gvF/tysF
         qEWE6/R83tUUukBV3QLmo9ZsPaTiECk/F8hdJpLgDDqJy4D5B/dx7Dslbos+RUdTch0d
         GT3zucsL+M82M0MGQEc7ezpv35O4qaZENB06n7HYgJX1iNdtFv6rZ6GxDyHDmfzF6HAx
         S4iNCdD2ObSqqET0/cnc1uWjs62EHPC04jGt06e6mQstiBbha4etO4zU3wvjD/otu9Qs
         zIz0ar0otXoEWuaDjkTZpKVJ26mN4i2/huMOOdsGBhnVLHut5Vn2exUaWlB0F7MiLvrE
         AYRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xP1IhKud7gW/EbLle1S5PQvD/XBTaDYUGytE3gDSPr6QvM4ChGaYTkZrDzkuOIl+BRnALVBjIca0O@vger.kernel.org
X-Gm-Message-State: AOJu0Yzre6hICMEUKETg3DiypDYgYMf0pYw23SnSJjumXHiIP68RkY6b
	1ZzMfgmskyDxXoKdXR1e+StxUprOLyZX7mnYGe/E/M99PiOff2MwwD9vlF+eLoOCPxU=
X-Gm-Gg: Acq92OGjGCzmQCeByAxfIL6wZia2Pq8Ez604SKHUPLD1AAwEC3ys9+HxedQLX3ooyh4
	kRo41e4wXL6NEVJtTst97W6NA+ayVcKZD69ijFRkx6L4KgZJkQgN31W1Jtz2X5xsYXd0+8cJaJ9
	XwbAM1GEGjHvxDIwf7/spxwiD8TX6cqVMoMNpT34y+Q6s3wWGJuRpnXBDMOIjMXTevw5N7gTEyn
	rXC3HWbYCMzfQvDhsqQHNqWckL7qCABOYhLg7JiINwd8t0IvnoGFLquB3Nu3eWw1S3D8FxGtvpy
	i5IoiBZQ58sFzQSE1CPvV8GxeboPRxTSwl05cuh1k7inliHLDT2aJqJWPYxDvuFQBR4QFZWOqDi
	T/NwOzyTPx18WkYhC/d32ZWHHgqI9jR1lrJd9N+mlbr4goxR5H5tyebJe8clLpM2sDCkTvbjG8Q
	znn+hwd6J/WH6K/Q3zM3GfSO0X0y7cj5fHtd+GAs0X+A==
X-Received: by 2002:a05:600c:620f:b0:490:b2c9:e284 with SMTP id 5b1f17b1804b1-490c2612c43mr336277975e9.30.1781031466795;
        Tue, 09 Jun 2026 11:57:46 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm69575716f8f.23.2026.06.09.11.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:46 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:13 +0200
Subject: [PATCH v6 01/11] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup
 R5F memory region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-1-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=msp@baylibre.com;
 h=from:subject:message-id; bh=xJhx36MS26Ugt3HIC/X2CbJ51kDEkatoPsKwiaxCXCQ=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxOu85+VVddJlzQuOn4l65CN2dn/N/5y0sGM1WROZ+
 0xvtyp2lLIwiHExyIopsnQmhqb9l995LHnRss0wc1iZQIYwcHEKwEQOSzAy7JnOUWdWPfGF6sqb
 kQzT/Rc+fGCoOb90vVP42f0Pvzdtr2f4Hy3XlL59582spl2LPsxxylnlxh+vHKVXaKBz4fwN52M
 xzAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 8dd0ac27fcd1 ("arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564bcac9558f88c94381f07db30d4f99..e13da7c95a30459e7649f284689039b89a95f651 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 		};
 

-- 
2.53.0

