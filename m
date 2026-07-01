Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7F748A2B2
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909656; cv=none; b=A1yaoqA/wOpRSoImxDPwsP09VfvgyrvuxvYn43y1O9TvfSTz2tGkZbr9/N7dTuOD0JYCwmlnj3/hMs/CbZUF2/UzXaOnV8C8QzxPPkUcXNGPrbUUgw5NZLQR2pgAVXqgHoMnMDw28tRkyd2JHTgEGFgyF6yK1nk1e41oqjQ/9p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909656; c=relaxed/simple;
	bh=YelZkVVslc9h94alnH0TEUnMH8PtybsYZVjRxXyvnYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y5+98P1AR5CecdDmkG/aE6EmurkyPbKtTJSMmhVx/2BNighGVhSr4Q3v1Apywdt2neeKMjo8wSu9HF1KmxiC7TdjfQfnk4Ra4eS0fBjsYs4gAWswQhnYwkg4y96aw1it6PgtjU7o3u4wmbyyjsH3pc6WK5bLQlrqAZQIhyJX4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=d1A6Xp/Z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="d1A6Xp/Z"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b27c7451so17831015e9.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909654; x=1783514454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XJVQTJ83WKN4QNQoBVEYWeqPm9RY73hmCPn8wn0X4Y=;
        b=d1A6Xp/ZCsCjWi1yKhSpWKDGvP13L7Gjvw0pBJqlVtsAuK3t+NFKiVQP5+jlMFkK6L
         UxM6Ak+cw8YuLj9wVfxjtSh3UHu506zc8RWjfkYji0u5G+k0cbwuwcYYreWoor2adOAU
         Gg33CNw7E5FbYMd0UW2tOTBPSHBPRVWO1kPexNGc+yvab1iIqNyiMAfdgXoUu91fNyHL
         62H8OcArHYV7s1qmBijiCHmVzN8eQ6W3pp8Sc4N+3j3+KZAhgKLTvIAFB2gk+7PRwE0D
         YIStVRLsi9P1E8SvLm+5HAN15xg/YRmXDCons4/hNua9xsMUBJWei92O5rAbuej2aMPG
         KVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909654; x=1783514454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XJVQTJ83WKN4QNQoBVEYWeqPm9RY73hmCPn8wn0X4Y=;
        b=ig0N/c1R6O3ygQJ9EaWhVkzN9wZuLmuBWz6m8nh0VJ2ElsJQzXjmIaoEB874dRGcCT
         RljvUzSRvlOL2j7UyApTCb9QDQOtaNlDlNdXcIk4NV7/PGMX4kKir7poayIh9gTkP23h
         ba5iUbbozzFH3uGa50KRL2E8HWLtBoeZMsx4fi6zkBq4Q75VffwrXaOiUPHxWMDCIIRd
         5E5HwcRcWFXP0j46kYDlji1RDSInhDVzUtw8x5+XpjcJj9etjk4uhZq1QV7obvx9ugRA
         uINbx/vN8H3E5anXhn0GsfG9q2es2dAKUo+poNoDWvc3pXMrWeeFISN3eKT+LCgTg1lb
         VQHA==
X-Forwarded-Encrypted: i=1; AFNElJ/BgwMWRjVCXj6G6i96Zuo4tMhZyredXVXs4lb9Df3p2QoC39dhZZIo0jIYIftITZjwwkjgqOZnhwmh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4p4D8NH24gbP+j/1Av2wdzJyGH0vhnOLlMJ6ItLTJLj9j3L6U
	j8hTNmwrn8U4XtN4lFw8VPyBiJgH/PufXctYj+Ia1xCGmBcgRZYyCCes5ZdCSGWxlpE=
X-Gm-Gg: AfdE7cnj7lc0Motq4f7gpLSKr8lcFbq8Kxz9IFVArPGd+GKGEa6xfGgXEY4AFIJrwVk
	O6nCmXlNZ0jOMG6s+F1/hWY6AdRrCdRnxCjCKLX1/P7w+z7xYC/euF/+CFBEVmI9zqLWFFguCP3
	rGdL8nDWIiyZ5kROaWXMGHPnBGrDGBY6ZpNOI9vnkHYsrbSmpyZsaT2JejlgyL1n4Qqnoi5uVMP
	ctTp+aWpaGs+RvRqbMgAMfnmSbNt0UEMc9gpteRyiTMK6RZQ+04Ofg3SKtzxcY6k8SlwoKORoAJ
	zltY98JnB0IozR0R2WEtbBWjYqNt43neq0ic9qajqMSjf4rUeFORYOhCqnROHOc2el6sOvsq7tn
	r9CbHbk2ZWidLRyiUenk3LZJW/biSEXamVJAOvZ8ygzaIx6tvvpVLmqqptWDCyriCdCss+ag7Jo
	WmyKq3JgbwUw==
X-Received: by 2002:a05:600c:4eca:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-493c231e27dmr21122275e9.5.1782909653753;
        Wed, 01 Jul 2026 05:40:53 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef1807asm46624255e9.1.2026.07.01.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:53 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:17 +0200
Subject: [PATCH v7 05/11] arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-5-e9db8b16821a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=msp@baylibre.com;
 h=from:subject:message-id; bh=YelZkVVslc9h94alnH0TEUnMH8PtybsYZVjRxXyvnYU=;
 b=kA0DAAoWhcFWaZAVSlMByyZiAGpFCpqiQjhCA1cxdGBhmgbrazRABWMA5fIDcRePwiNRXRwlp
 Ih1BAAWCgAdFiEEiWFVZv8fucZjoqazhcFWaZAVSlMFAmpFCpoACgkQhcFWaZAVSlMgwwD+Msqp
 XB4qN5JhJ9IMm6f8hnHrAPNQ/h0j6mdJuHPScsYA/iQK66BAPte0wbG7cAqITR2UsnmNlCTDZIr
 /QlK9T3sK
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
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d8f5827c49ed871351a6423db8026..16549fd7340a556798cf5a242746c219d3168d83 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -57,7 +57,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 

-- 
2.53.0

