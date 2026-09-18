Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E51E3AAF4E
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723127; cv=none; b=oIq0+Edw7Y6yoIyd1QW6w3HANBqsCS7JTixMsfUblQlT6ylgxfCqe2hitIpsjQcR2XXCb+Z0r2NGYDEJo4BvucEctAI7G4PAbpLYj0TISlsUalcP3FUTndZ+dmQCzxsXIVvovDI7N6y3vAcCc3UCoJ939y2t+iERZFDtRS4Kw9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723127; c=relaxed/simple;
	bh=505eaWDuf/g7YFaLEG89kbctE1WjzBDcDrij4CHCfmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHQeKSmQhgozpXY7HH8GLU6vXDToZLZ+WRkg8m/qBKIOu1eKrBW3QNRcPAeASnVnRN4YzeBQyClQYheEplB32djOKDny675txNNG6dHSX8nbMDbJ/0sKEG59HeXYxmgfyI9ZJpl8rRIhwHO1XY7UA96HEoh9kvr5hP9NFPl6yRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kobv0Hem; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kobv0Hem"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso7099335e9.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723123; x=1790327923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwPPgxwwtMFbcc3jo+UD0CgBCi1BHmLT6dmTjrAcmuE=;
        b=kobv0Hemu+hShi2JReWdix/aha1GzQQbPG3pZ/+fGMDNXIPj+c3BibS/wuk/hUWmd4
         iRlIB2LEKLkBk3hBKoxaN9xVFzcOaDovpXq87bNEtFLXjj/2RSFaMe5u58v5Al3LxPQ/
         Fjo4wI6pI//zQv8/9RZoGsn17Wtg4xeH4YGYB7UlnU0YLHhf+H4OQgg/kMFWYy0DgPOM
         scTr3ItGgNX5FJyjAxc52yS4Gm8cxdztGnIIANjvxwW6M5QZQqp6G761A64Eo0Gwgxrp
         /cKJ06X9NgIowNU8WmChW3+rQfqNsx+hNpL6ITizD/gr4c0t88Zsr4MoK5cL2ba6F11d
         ySVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723123; x=1790327923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwPPgxwwtMFbcc3jo+UD0CgBCi1BHmLT6dmTjrAcmuE=;
        b=qVG+lkms6wMWY3CiDRNAyAHStU1Wsq2eo1b/ObLLQjK3V3oS/LumBnwozigHKpZQVp
         fQCsmk1e695eSQmtnVqLEkvyZduV545teb6wxjz3+p/RsnLrNHNC6Ya+KsQIkEYUYnZz
         rJncJT9F2H4/BdQ63G3Y6/U19WJPAldDiGtvyKeAOoYFI2VdRk0iMNrnVbBzKQFr+CPe
         oARLyAiyQ406NiditwypowupLHUkYScONYnCMsRK/mdrBopoCtkczJzp4fP6/mZyz1Iy
         kUieIjSE1KU39WSaQYIZvYzZysT2jGtMS00Yh624EXp2aUtEjbR8KXyWJ3unN7iGnayC
         XGGg==
X-Forwarded-Encrypted: i=1; AKwUvBwxFJ1zqGihYNfG0Jz4uIBsAqY2g4O2A2Es4KTtU3nOylPXRnayW3ScN3J1fP7YLnyZShn+Oojaqb06@vger.kernel.org
X-Gm-Message-State: AFuF++nBamhacIjPnv/ZZq8qpPcxKaBrP1g9h5y5sZsXzsyj3Lnj5IGZ
	qNwXdLufT6nU1EGE0OUYFBT/w94LyX17SmhYqY/fdtctwXLMhgjMJlpLjm0VkETC+mA=
X-Gm-Gg: AYBFou2PoOCg+1GOJ3zHO8Y/6JVwXPq7Ec2/YPYfJ/qVUWRXatBNUdCAamuQKYoyDVY
	tMJHrwz3NpS/5sLzfKGvS05+wImAqdvZZecDRK+INULGFGWZ2fUBd5Rt0zs3dM0nocwPMaW4xNQ
	nboPI9JKU3XE5gidfxIwXfcO0CUM/PgjIMZxZr5DVPgc3ud5JtJSf+E2Tqf9mHC4boF5xM6WkpD
	AD7H9jLbISG7HbOxwa/JdIkiKDJaING4g6PTKFq1HqakoYMMIpHveQiAVPw5JI/PbR1s00FeGWa
	4a7f9u3utkl4eI7hDxd5aj9GXA81HW1/6rdNbh/vx6t57jjubY0EUX1Q+Shfj035qxaBZkJiD17
	JfuwvJOtP2cfBckpy+qQZeuyvEiI+W/t+ndu6zTG5AIn+3dg4iTz1pIHUYM09sGWfYdMLCg8fmb
	7AsgBQGNBLz9yMrOdNVd/oof8JYuQLdQt45gQWlQA1TynPU61FglLvNuqzK3tWaoyH0xw=
X-Received: by 2002:a05:600c:4ecf:b0:49f:bd3c:bc27 with SMTP id 5b1f17b1804b1-49fc574f074mr21996665e9.34.1789723122119;
        Fri, 18 Sep 2026 02:18:42 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216028sm140092905e9.7.2026.09.18.02.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:18:41 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:45 +0200
Subject: [PATCH v9 1/9] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-1-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=msp@baylibre.com;
 h=from:subject:message-id; bh=505eaWDuf/g7YFaLEG89kbctE1WjzBDcDrij4CHCfmI=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jIefHdeePXM2h1BbkvYUNb/OxfyrQh7veHfY0V3Cs
 9Rva1tZRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEwks4vhD+dB569HvCuOPjYN
 tAtjeOJoZHdZv8uGVaH86nJLppwpFQz/q8vZF+9dqSUzlfnV9Z0yy76VT8rYUb1bZO0vfrmLAU/
 +sgEA
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

AM62A additionally has a second DM firmware for edgeai whose highest
section end address reaches 0x9e700000, so the region should end there:

    0x9e700000 - 0x9c900000 = 0x1e00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 8dd0ac27fcd1 ("arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors")
Acked-by: Andrew Davis <afd@ti.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564b..53c096da68b5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 		};
 

-- 
2.55.0

