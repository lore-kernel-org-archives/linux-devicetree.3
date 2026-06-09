Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668D84D2ECC
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 18:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031475; cv=none; b=rq31s9DKPJUN4OLLi0lJAVS5noVPsFVnMvZ/QpylzMC5P3rVaAO9k0vfrKJWiu6v3M+6DEy/rVnID2pjnzh6ts2KQWSNNLry3yyJkb/F8BubDCRuevhHnnjN+fdwzO86PLUITsK/os24sY/IiWOXplUR1Q91t7lXa7v34uPRPJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031475; c=relaxed/simple;
	bh=PgsaEoQtBnkk8LYO0JIjLGE5WMkDKUfvgkVifb7kbTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bqwquAvicnKZmgpucKP6KKDUewGV18Uf366PM420IA7V+YVD7wC9TERkFz6EWbt1UCtsXUZad4c5jizdHXBvKpld49rIC1GnZy1Enue88A+ZIP0fBldliX8j3VSFoj7nsaStq22tqFndiTyEvdqZdybBGaF71sMt26OEWFy1GEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CI+7I8qX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CI+7I8qX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4601949975dso1129713f8f.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031471; x=1781636271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLMhKaFbIcEcm6K9KA6SmjkstYc3dFol4GbDZ9pO91s=;
        b=CI+7I8qXfwr8qX07o1cjXeXrUhjUtm9XSfGnJrE4PnrV3h0IJ7nBF5RXhojI2yGmNk
         406ozBXA1b3Dk8ewXMuE+2nMjydfmSgPT99F16KsNLFiLtCFdYAaty34qzF0Sy1iVD2v
         LYl+Kiq0pabosmqV4SEEpZZoz5O6h+ed0hPu4F8esuM3Fq6HjxbJmw1aFISZvwkwelk7
         PvfmZEQtWfC3ic6VtxcGapQMXUBvHC+Qu0u8V3zDCsBy+RgbolTjMWSxyIiDCkbP0sZh
         HfPKvzRkDV2m8ObmvpqU9TcC5M+jRbHdOr9flhpx2cAOILwli8hc6g3OsygNht7nUouP
         mDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031471; x=1781636271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZLMhKaFbIcEcm6K9KA6SmjkstYc3dFol4GbDZ9pO91s=;
        b=OKD4Lo/YTNsC84BUXlID8mfZl2VQQbNBwVF6cWPF6QtPThRwk56w17+xJuQRq2WSEL
         BT+bBeipfUMKL0r88jbdvfu7oF3jq8WTOSkwPDAbKe+2LvgRytWixhYjugDO3M6sh30o
         UurSzGif/EiN9jA0nZFoGJBrO1MrBsK476upOfRyPM/9aiysvDlAh6i9KbBROtunSIPj
         jl1JLEFGIXQZxxdpKUq1fWw05SHFNDoUl/ERL171/MGtOAV10RgBiY67oXaHcdFH0/Kk
         gKKnUEQsCcGLkTozUvK15m6+ykTMfaRTxhS7S5B1UxOIEDQX3sXt0GG142WdhgeZe2Y4
         Tjqw==
X-Forwarded-Encrypted: i=1; AFNElJ+Poyjk7ViFii21i/A23lQDHYw5z5dVlnLZaK4nb0UIPtwbdviA3N7fmvAZVxkJY3HSmGd7426MbGll@vger.kernel.org
X-Gm-Message-State: AOJu0YwYy1/jJ8ok8XcdIU9Qant5tbl9owm6PcK+Dn8eZpwOqyTETZK/
	yZ33Qkyp+TOv+X8M8e6Ru3BB0MEyHynP4W7aXzxHP8KmZMvezA96uZ74yLKOT3MlXbs=
X-Gm-Gg: Acq92OHBCAzsTemrBUPiTmt+mph2RvyAo4iE5R+GILmaiPozqiIGgCXY+KNBYwC9Jzf
	9cS7mVU8CPwJ9BDgJTd7+fTD3gMdYYPRuHqny4LSSBpNmNPHKd5z/J5kiVeb1+/IGGShAmk6Fay
	2AABvFgaahpNBWUydmKnOC/6R9XF+8VEcZ8he168lT0LHQTGNRTGPz3ng6RID2bjqPZOMYofqD2
	zZJur/ohTcQ5zvTMihGdfyrZSiKZHBPgPRSaboXf+UVGvffvpG5tIUTADl5h0WOtHGvWN0ieTpT
	6Nv/VYB6ifCeu5jYdzFdyufmd8+eGHWmT/QsChHQS8XZTTvMiIp13DFURx4J2rvJEs91HwNoOBW
	tbsDiUWj3T/B0TKMbJWpcIh8e+PakLf+BYNPU7mrvyl502vSMRPvZnRyXx1zfsy+ULNcf0/73ui
	syoF9UuPDdAABSEav1/lkfSCkO60ttznr8AVi2HRGauw==
X-Received: by 2002:a05:6000:bc9:b0:45e:9417:556f with SMTP id ffacd0b85a97d-460306413bemr23436818f8f.39.1781031470876;
        Tue, 09 Jun 2026 11:57:50 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm64579981f8f.20.2026.06.09.11.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:50 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:16 +0200
Subject: [PATCH v6 04/11] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-4-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499; i=msp@baylibre.com;
 h=from:subject:message-id; bh=PgsaEoQtBnkk8LYO0JIjLGE5WMkDKUfvgkVifb7kbTo=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxDetYY9E/+Qpmaae+nImR91ahWfDzsWLrl977qx0Z
 39p5qJNHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjAR70MM/4NyuXxOTHtyflrG
 jdrzjjeTPduXHVkZtK7j2UbO8tp1u2wYGc5l2OtcPPPO9NrEiHXLRTaYb9YK3/i4bvWSxo+LL1Z
 9W80LAA==
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
Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 7ee894d59113aa727d41b7ecd6b2bc7e12760823..8a5ff5c457579c7b1be7157d235fd4b4e5c6af11 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 	};

-- 
2.53.0

