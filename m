Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658FF4A64CC
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439247; cv=none; b=T1iaykzNaTlzZdN7UBXlcXOfm3DGesGlo7pDo1XjOHVNBA9vZAmVf94pIdX/0IjUwYDtW3BHv4ZOfrkay35G2vpSYNMRjAqa265Aydlc6/2vItmpaW40EjlnvcFPdl41dZ2Wygz66DcXHLQ9FuYBoPl6gj/0REUDVcers+0o7+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439247; c=relaxed/simple;
	bh=ZwJXMA+1QA5TucBLp3r/RzMpy1IYlsUW+V3ZnaKwxIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nb9zPXxjYzMGa5bJRFtCQQgEEVDQZJKaUVm1C4sPPunPsl0bF00l7QEnCMkrvLXnrRrgAR4r+2bB5EjOwsER5xgGv0aH0H+2cjSpqOe3ji14iswiUCzRxEDejhWbQExVkqTK1maCoIDvKPXL6uW5DwQ+WkY6iWQsZzLN6ZeFy1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OBzIGRQ3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OBzIGRQ3"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1509795f8f.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 05:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439243; x=1789044043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2v0qNgBoH1TXRaPo8shpK7bVX+93ymH+IULfi7N/1i8=;
        b=OBzIGRQ3rkbS/quQIlL7memWXfJbDSne3c+qZ6w2V2FP0p/w6HBTLmd0acNS6hcX41
         apVoZiomw47LVhoqk0uCXXx+X6ibMJ3UyE5foX8gSmEE8Oe+XOi5/BslUZJUwM+lr76F
         Yxa/AoTuqsGFyfBtXC3o6JKaCyi44DMYJJY/LntKwCqG6o6blq129mIys6bYZzXOuwzN
         vQFivD1iZqcSNXmj2x8w++VHG7pHhAsq2XB7u7xJvAK7AsaUL8v7KeOSu/2rGnbQmDAJ
         jQH8C/tMHNXtLrURmwRYYhJ7XvBzpLpluWYKKLO19a/1sht9TjwBZGq15EgACn6brYBi
         akpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439243; x=1789044043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v0qNgBoH1TXRaPo8shpK7bVX+93ymH+IULfi7N/1i8=;
        b=d6RfFljX2FEuKP+OcybpITdPo7aEMJPEBzZ4rF/G3+qiT/oj3Cnj7wggHkeAP3cylp
         /P60zt0g0IwHHwBq4zuETREO60zrk+p9tf5AyrKGVKGWi8D24vKxPHXXhbI4rMk3Brnv
         KrW+m6v5oDby0jNeibGY2a6NGGJ/YEW/KjPotLSobiUa1iWdbLCsozaCnrVFJhoNOEVE
         mlmm1DLe1pJNviDl5oueCpo9rnagJM8rd4mnAFQ6Qkxkw+EiMMJuDdjn+zjJeC9WhAUq
         6w49t7vHXaujUjA8nxfzPM047yZuuxBNayMTEg2k1o6oWA+DxzM3F+fEYftJX13PgW0b
         iPbw==
X-Forwarded-Encrypted: i=1; AKwUvBwgJqxNGkxpYDPhzAs7yUkeFt4qfTtf932QELaYoHHlWZzUTVtfP8ZuPU1JDe0I29TCrFjjID0aL2ub@vger.kernel.org
X-Gm-Message-State: AFuF++msZXhoNDectgIiJZrngv5f8fP+yjIF6SYYO5iVjKcqiUj1rmLO
	vDKg8jj9AYrY3gA9VCUAip1+oLBDhJygxe+m8PE3ZVb3r2sIiHYV9omBuWYwAOFBwnk=
X-Gm-Gg: AYBFou3ao4sBRuSpzIY8kfkf80/pr/oblJjBYsSKwyYtu4V0GhmwNOUXUaOo51QBhjb
	n7BU71QbrrStRQuAC5eLinZqLZUs95aClOiwPvKW+6KQ/yk30UFfifTXi0tLpgiei8SY8LgB/uG
	WXMP7JAZdH0Mc2DjX8jFm7R5A6YqWTZTjrzO/fOQ8nZKMS5xqSfj7KFzNx+cAD/V1IVipj7IKcg
	r/p85V+s8ZOYpTwX67WQmHrswlGtsHxxaNPgK8DqLFq9EEk4xo1izcoo2A8YOKaf6w3dV2Zz16n
	LnOuPB1wbcIPAmvdYJ53uBV/McjNNuB7yOW3JhTd4ygpY2rga7fe138GB7MTpe7RsmFIYDk55wP
	KArh8aUF0SWng0PWwrDsyET8QgKg6D+yWq63IJZQsJjrrkbzMLcb4UWHExD12NuhrpHe9zhqqXM
	cYGuVcQIh2TGWNK4vwcBchLtL0lAqEJqKUPPMre4Dt49yN5SbWWZ8CHqADMA==
X-Received: by 2002:a05:6000:41d8:b0:484:3621:6341 with SMTP id ffacd0b85a97d-484913b97fbmr25937634f8f.15.1788439243626;
        Thu, 03 Sep 2026 05:40:43 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7fddbsm12989384f8f.11.2026.09.03.05.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:43 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:27 +0200
Subject: [PATCH v8 6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-6-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=msp@baylibre.com;
 h=from:subject:message-id; bh=ZwJXMA+1QA5TucBLp3r/RzMpy1IYlsUW+V3ZnaKwxIY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWYvKTfdd5hBzeW4ieFW+qNR3z9lQ5qnZXP17jQyd5
 tzz33yjo5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYSU87wz/jCsTNnDzlIzmWQ
 UX7RohDwqKEkcu5ygxm3Nyx7aP8z4wDD/0Lt3VXK/InqnK/+Sy6e/ffjY/vz0WZP1qg8u5DtGfX
 TkwEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with
0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 571562e76458 ("arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 8a8dec80cb30..3d1a2c5bc464 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 

-- 
2.55.0

