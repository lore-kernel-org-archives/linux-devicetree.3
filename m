Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C021481660
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909650; cv=none; b=pzRETr/2iQ3CPUzJWcMipBuzIrPBPWqSN/xCgLPpSy9CU/Z+nZ7Z/LSoZBk+ShQkcjv8upmBvpoObSW0YaJfYQTb8/bDxrZoWPlfxZleVXsMXUrospOgo9J2Wtn9gNIW/wa97ikOcN+IAuPVSGEjfnWq1pJUnu1TQO4foz6n2j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909650; c=relaxed/simple;
	bh=xJhx36MS26Ugt3HIC/X2CbJ51kDEkatoPsKwiaxCXCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OS5ptM8VBwnhGJs6658IkR64yQXRdcsa84/+qGWspEfHtgLkamrBQQ+0XQaz+mwcf71z4mAn1Ek0LEI0ogOkDACzbVVUroStZMa/bx7XOtD3nebvkEqHcixS7Xyj5ORzmKIJl/0XIvz9K0oZfS7Lzng2u1U7V2p+9HR4blbCHHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GJTSU64h; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GJTSU64h"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-470174001a0so531501f8f.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909648; x=1783514448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lExvIVm/qhAmBiXb4s7Ug/WTGW/jVwYWmx7ZmSxI+IU=;
        b=GJTSU64h9uPjYCRycm9Wsz90s84Nko3+gtURNQS0fqrqLfCNm7nTjQqgsA/pesocja
         SyCCKH3v3FGCKhSCW+0XBI379v6G+sv69iqjCRobA5210E2sOg5Hyl+gcURLwl8jWqT/
         tpU936+3PS1rDiwxpMIa0aWP4cx0AMvbJSBE06DahRjAt8eu4ZxfoAvpAFS1v8jYC8hp
         PNivwDY8K3XaHlqgjsrfvO8mv3y3qRvSyGzht9BR1k0uwLM7XH0Xzdwy9jk24gB/dOhv
         g2liYL59UQMhXJq1nOyEkj5/2k3g6MP2+QjaMDLwgy04heivWrzbdw5F7OtXpFpR7Q2R
         boJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909648; x=1783514448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lExvIVm/qhAmBiXb4s7Ug/WTGW/jVwYWmx7ZmSxI+IU=;
        b=F7k7plYOfV2K0+vO005toncpkJUtUXjbWk3Pk5N/Gh+KQLk0vdOsdJ1csGsnG3iWLH
         B7TWRqQDkoT5oNl4bKGy2KxZYQbUSBWY1JpTMmgFQ+g9o9+Rn/2a7StsINiLAJeu7l2V
         OBYfUx6zmJMAoOsDKM52U1E/kYI90qjwFaM/BgfccD+5ewtSLnN5sCOvTuhTfn1kBrGy
         bgZP7T8PYURegbElCTrbwDNP5lU42AkwbauMTbjY5+DxCylxZOcYCAC1xT1l7lcAtUS5
         LAWGHSqJePz8z7nWaes0gr8xcl4mJrDpY7bJ4oLYMTjRWWQ7Ghbkz/+KvYiLUyoLVaZU
         9l/g==
X-Forwarded-Encrypted: i=1; AHgh+RqaZmAMi9muwSmCjyLPnjpcZ4XwFH2HpZy5JdnBpbPF/cd4NQ/HO0lzuSbliEUEWoWWvnHMQ5MWvFY7@vger.kernel.org
X-Gm-Message-State: AOJu0YwrDugTAK76WRMkKJlFxh3JTD+wMUGSfy7p2Z8YSdta4gR5B4xx
	YGQGaN0+ybk7nMbRTNubvPNy2KiW/woeRUFfnjD9018wAd63yPJROrgUm6wBtkaNLXw=
X-Gm-Gg: AfdE7cnlkWtWeq+XfMA8B97PVDw5evLXFhQmOko5vzqR01m4fIhcTp5CM9gYRPnj6ac
	2DdhJKSISe7nV0UA1GSwOtha6Xof77vCMJBEuoT9KWkIVU+wCZYIKW2w6TRkQdFVvaHb/1FUtUV
	ca+AuHwSpUy9nl+nHLV1zRrAIMEpvFIfi7fHJb1H4Zp9UZe5manvlZyfYyj50qO/F1jq2FVuWgf
	klP0SgPM/ttnYVQIayhddtyTfptBdwp4Apu0837EBCAUuqBLnJaGonRiO93XY5ydGz8JrCn8NrQ
	2l7XN/e2cp1o/oBsUt1weGqmx1bJ7PNBr0vimta6LJ9wX9P0jeJkEfWIZlraqjn2TLiBYpHoRMF
	NLQVRwiNzBs7+ZRhIPXd2jbJWST2K2ygR/M7kuAP6Bp7MWLjqdYsS9y5+5YOaGBpA9r5SfAnXGM
	uHDzcsjCHqGA==
X-Received: by 2002:adf:e009:0:20b0:474:6a5b:860b with SMTP id ffacd0b85a97d-477b4fb2955mr401340f8f.37.1782909647645;
        Wed, 01 Jul 2026 05:40:47 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47566c0deacsm17848753f8f.26.2026.07.01.05.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:47 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:13 +0200
Subject: [PATCH v7 01/11] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup
 R5F memory region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-1-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
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
 b=kA0DAAoWhcFWaZAVSlMByyZiAGpFCnyjGaxDR9qbBVnjN/qS5E5NRZGzZonOGc1Sdrm+xQu/K
 Yh1BAAWCgAdFiEEiWFVZv8fucZjoqazhcFWaZAVSlMFAmpFCnwACgkQhcFWaZAVSlMRBwD/R8D5
 k4DLFbAre6LCFFxtN42qd7BzTXZEuQeC+r9vtfEBAONbUMoSrUIisHZJ7wMtgjwHi7BPgHJORi4
 RdPks5AoH
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

