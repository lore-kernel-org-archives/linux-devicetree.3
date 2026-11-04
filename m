Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803993;
	b=EL0+vyAXZkc8tGy2pcTV38qIUNbbrhpTR/kIn+hsCucHu9H3dZ/+2rqK0HAAS3K30OU8
	 LpByd1oiNyQTKOBaHc04ofkndygctYr7KM0wKnxfbGcrYaACXkrhvtQqQHcpfPPtUhhcj
	 21gpYt0tyULgEhzoLtGPULN+CKPAsWFX/p1yESyYskep4h+BtoKreVSwhFh6b/7htuEPn
	 8IqfEKTb7F2ur+W2FV1mgEm8D00nkNtiJDoIfDZpFDM6ux4qY9QVP+4z2PQubKfMCKtIj
	 BAMRxczBpAy/m9X+oIZjI+2F99g63BhQIT9yG8Kkez5D0+3fnI0UYYn/2tRHV11J04w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Bdpb7DkbNvx1cd2LuIdKPUEVWFbLibGs47NkSZrjc4Y=;
	b=BUIqTi1x59DCNJjdQvqKDw71pd/qVN7Qpkfv8/h3ctvCyDwDBxG/WG+Nfo2utZqG7EaY
	 zxGi6PLmeqK0zq9wHgT+eNkWpQo48HUSxLaKmGt1wbsjhjR2VvfTH/nM4MIKz5I/ncwYp
	 9J+GRlesZCQnmawFfLdhC2G00N7mJvs77cPq4x/vp/rb+NDoD4DZTLcqG48OAwLPxnlo3
	 0KH6+iTStAAX9HhdIatePkM+7QIafCQm1tcZaMb+OQ6h010Y+659vUAi0aFzUb2WXqBDl
	 O1EeyX37RqRXlfGE2AnB1uxA1n72VvWKZ3oPSRHkm5If5pno8dlHrZ3Z3khM4XG+35g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nhCkXx55;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4DE606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D4DE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nhCkXx55
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b2d14968c9so8776097b3.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793803992; x=1794408792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bdpb7DkbNvx1cd2LuIdKPUEVWFbLibGs47NkSZrjc4Y=;
        b=nhCkXx556Tk5e8a3HmNRAJC683ua7/RYJLcvl12sYCREFXjyUA0Ys6CRjrtY+yDUlr
         Mlywezs4Pd5paq4wehu1BHjzzLtc7RNXwUFaekezQhi62MFjyDzBrpMBqNMvrnDWQS5V
         vBtzmvUr1iJh6Ycb9SKwSccJnvnyd4UdXtTVVPqP91hZKb5lcb/XNmzHoJp2vZ5E1CSf
         hqmCEUqxFtVPho7lh6ZrHyinZiWi7uCdpgu2S0CxPvBRsLGbGyakGNzgaHhjTuVgy590
         QgLfSAiGJdV/rC03FphIRnar0B+sMHdr+2IMs41aTvzGcq4lzZE6wnEJ2ia3rZqlD2oD
         OfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803992; x=1794408792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bdpb7DkbNvx1cd2LuIdKPUEVWFbLibGs47NkSZrjc4Y=;
        b=1eIu+S6ExJvCh5IfeUeltQix0hjJqgJIR/mga+XOgkKNxKKc2/1nOa+vSX30q26kie
         VsxKiNmcG37LeYjQ35dRnxBQQxRc6JP63UTtMNiuX7nLUWg0mJDJ9SK+4KBavRklOlc1
         1Rf5/eaUUdkaFXnR3K+9Q1PPsOSlj5T7Q+tOIwSTjj5jFoykijrndOh0D0edgzRb3kuj
         FNGAVdFpFbecpm8Zzlx6mzE1adjwHiZv2+O48Cz540nJ9s0ruUDkM5dRmxcv8b+4472z
         SnHRHy7tZtpm95KlbgtB3V9rtD81HaJ1lb4gio46WQQq70N0PsgPvBdR/9lYnNlxGCvt
         VQWg==
X-Forwarded-Encrypted: i=1; AKwUvBxq7D25s3AzgkqS3su8pUFwoG1/AAH90pqG9jYCbi+9SmcX9ZIOjfbfz7yozA6lrk/vc+NEEWHQVAT6@vger.kernel.org
X-Gm-Message-State: APuU4Z/JB0Vx+qcofo+eTCWLcwmI/rH7FNLOJmq/jYbCEapJULLHja5e
	yQPnGxMgb4SOyJsELLGFm2NT8mtUr53/CimV0vpluYT3DObnzwrfHgphT72Y5PrhdEU=
X-Gm-Gg: AYBFou1cT4emT/k2rO0XrubWghzeaoAZh0VbtWJuWUmeO5B4h3jB07eW4dggbn4CUH3
	qrUb7mq20UTSV1JQkfOheQajThlg9144M5niARtXwMgXrIRhgdGyV9iE6jJlUAe4IOyma2A3mlO
	t3OuL/4P0sDtxNeuxKHWBKlNbADCBqbZvLJxlSQ7eaMVniFgGlisAfvdYxKsXbeffrLjxLrqJIA
	JlaLARv263qFWPLoMKG7AGmoPyBI78jPPdmIwrbYT4CLANBxYHslxS4Amf9prPGGa8IkEGOKlnM
	f1DhlDzOhFf2Y2p49YFtQgqFLG+TsvD3mZtNKWDcJFGIHTHkh8OD0FMtYkn6PXx8debdMLxUatT
	QVkbjVg4FcX63XW7hi5ueq3NGGGSl6g0opJrEgTcBPD/54CcUGy70ZFUQ5sZPpvGih8YB8HU8AB
	Fd2f94WyTOSIWXaXE6qLLAXEfcdbOxsOshY+tE+8LBaQgvI4u0dzRA67+snXJFzLlR6AHin7JwD
	s5Y0wCNWGGAuHdsWkt2DxAbHpGI6Zq/vJDheEbvMjXXV5eIixEtbBkGRCxxkqNosrL0LJhv7Xag
	SjYL8bukLAIshvX36fJf2URmb5MwI5I0IrfUTmDZtwICBjiy7xP5wlIIz6Kmix7vMAtdkPAGo4z
	WOw78pn2ruFMiXA==
X-Received: by 2002:a05:690e:16c1:b0:677:b9d8:a475 with SMTP id 956f58d0204a3-67ba50cc6a5mr6545943d50.147.1793803992459;
        Wed, 04 Nov 2026 06:53:12 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm1569080d50.10.2026.11.04.06.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:53:11 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 04 Nov 2026 11:52:34 -0300
Subject: [PATCH v2 2/2] riscv: dts: sophgo: add Milk-V Duo ethernet DTB
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-milkv-duo-eth-overlay-v2-2-e3d2d39cf229@baylibre.com>
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

Add a DTB that applies the shared cv18xx-eth.dtbo overlay to the Milk-V
Duo (CV1800B) base DTB. This enables gmac0 and the internal PHY MDIO mux
on boards with the Ethernet IO board, matching the existing Milk-V Duo
256M DTB.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 arch/riscv/boot/dts/sophgo/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 440acd0aa55a..3c9f3530526e 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
+cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv18xx-eth.dtbo
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb

-- 
2.53.0

