Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BCA4C9547
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031471; cv=none; b=cegtVDrlaeRX4iXvgzgot4UnMDwBouw3lm1kdk20as94WJMGV68cXYdOvkpG7ybI8mPlGY4Shh54TcKU2Es+biZesNyRWPQ3q+qTPF9DU/faw7POHby4tdEuzakQjxiIn1J+hbJSJkPejM5U1/6RnuzCT+BjR1JSI2PLfFZ0cck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031471; c=relaxed/simple;
	bh=/cdLsE4GymvHLRjtj+WocAzlDHQHGpLi8wiqmhvVCHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASeL3Ygh28Y+A31qdNiomUr1r6lP90VAq8j7B4q+14P4n0V5rYBrUfm1zEC+6hARFiYWudlCJMuGmYzkVF6g31rGbpeN+9lY+MK4ywDE7kgNYJhLpRiih23hfxM+iwb/UW9JinJWgR8JgjhA74Iv9J+SlugS7KvBvUvY4YEypIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FAkXhb7A; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FAkXhb7A"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4905529b933so64285875e9.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031468; x=1781636268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=;
        b=FAkXhb7AvPEnEWNkBl2QIgZm7qO81gZ5ciPL/1lphbeibd4XXuTBPLGahijbhLWx6J
         JG+zSZoxVbw9XkbyenBFmphcGyOr+gx5x8ImqEbtfiNdX0Ue8eb9+1DIHfCzpAg321M8
         zxcfQrbpUvGtRakQMnjPl7NCoRsUa2GQrysYPuMwL+GevZArbn+sD4emg30jpNs7QzJa
         xFnygXTL/Tg8mE5hb/eoH6/VwDlEUGAp05ClsFHvV9PHTcWF2koYmaTZUHxoc5Lq5S8l
         fo9beluhY/ujJNqUBguF15HHRa45QuyvuoX6mGw1A6vk270UhzbmNXdl183vP3U/RGDR
         SmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031468; x=1781636268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=;
        b=TpYA77LEYzGuCdeByGCCguyQv9Rgcd1Yk7S6xwC4Cn3OdqNvNV2SqdBRIys+ddPcW2
         TTurnTZ0HvWqYnTiImZscv+qqODvXuA9yXQYJvpddC1wLDrDquPJM0kYyRYR2Y7tYglx
         5H/uY6tobfXIsigy7xdcP2hqrEcWQk24Mpgd1dX0MMYSVa7m4ZteWWnbA62+OnbBXTIv
         Ry6oRVMaH3yKN9bXw8ebud5f3JgHUnalp0H2z0gcBNJmlm91UCqz3bnoUGw+DbmCn5g6
         8d20H3C8eAblliTt3BBWqG/qE+kXl0+fqps6Mh2/O04fym14TliINEJ4gY1bUdUrWQzK
         9jmg==
X-Forwarded-Encrypted: i=1; AFNElJ8ACfZ1XfDsdqKwD73sJMKKbFvZVdl5haEBT+hip8gA02VL35jkxisbrBONlS4jLiT3fPJHrrh2ee8L@vger.kernel.org
X-Gm-Message-State: AOJu0YwJD5Ew061SevCbqvu6qCWLwTpWhtBNWQm1SkOhZo/f4cPiFasC
	cA+AobwIQaab9VzuOhxtfYNXgUhQULELZAln82WgAV92RC/S4GQws+suy0aZp8VnIeQ=
X-Gm-Gg: Acq92OGts7b3TASWpmcFk3ERZf777GRQxMxoF+TfEAY6wULTiumZUkhOlQ6BAhBbosU
	0nZnHGD6Nr8ekFJRRJIL6D866r7yS7ay6lOeGhzvHc/U2H536wYUb5eIIJ7yW5f1uvM4n3pAtLb
	YpEjQb3mzKuj8kVGEDlIuUJvDHtptzenURXm4GJO78ePrQovhrF0NlS5deirGoeq9htUSj4WTxS
	/SsTq/ZIWFeyY9JZOMPxNeDICjPojE3lRJgDVy4S4/m9MoTZFlhXOR1102GSq/TqOZOIrrGdZTj
	0bdskbijmSINcKS4YV4wLCrRZhyKBTYZ9EoqufoS9O2KtyqVcpH8m4UQ2Tnr/v9o+vtYYtixRoR
	R/IVheXCCTMHrDtCOvWyrTpNW4i5/MwtdT+rNJRx5ywHay03yEIrRf9S3q8Y0jpzy+FAej7Z5T8
	BF17EWHOUVjdDw1Nj295Uq6hXvl4nZuk0=
X-Received: by 2002:a05:600c:8708:b0:490:da12:f1fa with SMTP id 5b1f17b1804b1-490da12f2aemr34538895e9.31.1781031468127;
        Tue, 09 Jun 2026 11:57:48 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd502sm502660835e9.11.2026.06.09.11.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:47 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:14 +0200
Subject: [PATCH v6 02/11] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-2-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=msp@baylibre.com;
 h=from:subject:message-id; bh=/cdLsE4GymvHLRjtj+WocAzlDHQHGpLi8wiqmhvVCHs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxHv5rW2dX4XX/JznPuf6uSMXnxsK6LKU8go/vHbmn
 /SxEkODjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIYWWG/wGu1uI6LjrqD+0i
 d7RL/3k4teXyjqxl4S1HuJ8f/94zp42RoSXKiOHGAWPJzyJadza6pMt0L1+2+EjpNKtdC64ZOaS
 XMgMA
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
Fixes: 1544bca2f188 ("arm64: dts: ti: Add support for AM62D2-EVM")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5debabf1ead67eea634b48db1540186..463a3f6130b8f2927a032137e87c01df446cffda 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 			bootph-pre-ram;
 		};

-- 
2.53.0

