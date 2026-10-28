Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203594;
	b=NLQido3Ea4OD8eJbFMgTzUbDga6cvo06BbvtmTZbhF27Iud1jd4xcSneWPxyJPPq+32B
	 TRkDvlVCS13aSNan+k0tdrnGujaffVXtKgkCCU68ln1s9jjcGUhneI6R0u9OHBS4m63qd
	 hvbjlZl+So55EwuJsPstR2kTG7pU/sfYiSYXINOvQWUIdPDw858BqNlNREovqn52imeYa
	 iMXlC7qNjMEmZGupJAlJ8Mb+o3BQHPmCAejn9LlNzPdXfbKoJAQngZPQXaE9BDesPh+ir
	 lpNThjfBPTgmfBk1MQP1z8NFqLYWvWuORHuLXXKMGbbinDPsvIiuk92UkrBhk5cjqEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K5cbxD/lRSp2Q3hLi6PLLzoHUCTKepxDQp4Kq4HqxLM=;
	b=Kx2sjyraite7RelfbfkZ3x9wEqjymG2rkfvq/f+o+dRRbKAP5P4JoD0Y/13nBtmXs66y
	 xNHrUn0+7+h9esNl8ZgzmqdkMmGPn1Twn+NkH9IFvBnKerjDRqYiQxDByapgJMTY/uXsM
	 iBYv1gRLrgd9Esp0Y0NsAX6hb5Hy4nuv9an+KhdHgoEqD4LygimamvzbQ6mDbPr5K8iuY
	 seW1nwbSQWEucDseAqCxPAwWSKn73f/pXRQieCjvV8SOhf2z5/yYx7YNLuC6AE2mr3xtc
	 EAz7i3JdOa3kwsgmMVqB+LxfbRBb3KJO5JKuw/XsJxzXqinx19+yJfbT60IRz2y6XuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mPH3qpCb;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D1360A3819
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D1360A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mPH3qpCb
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so10335365e9.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203593; x=1793808393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5cbxD/lRSp2Q3hLi6PLLzoHUCTKepxDQp4Kq4HqxLM=;
        b=mPH3qpCbAKLiev8/hNU719zKhQN6qRmCwgloVp7ypKQZpC9Uk61P8Yj7ABA16hvoM0
         +86OxbofRb70B4z3af2vh/6kS4boXPnK7Kr89xBvlCdoqdhMkfgWk1yAjghm1hu4q6C+
         Cqwmk6aI6MN2x4uCioaMdg0xvqiG+9IUdy7JUA5mub6nVtisQhw7+4pXhqWLkcExZxnQ
         rT0/j5XQ/jd9qw9/cnEW/pB5cJhyiPF6bDCExaREU0X9TRMvOk1a+QVOnAO0CGLGJ9tc
         aa2I5lc1eDV8ES3nhSOvoHuiZ3adPz9KxarEvKxpzICn871XshDaJ9331nE3NhtQoDpg
         Kmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203593; x=1793808393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5cbxD/lRSp2Q3hLi6PLLzoHUCTKepxDQp4Kq4HqxLM=;
        b=poBC9os1F36sp4cQy34ouDlucqSuuubEwgEandZAS/XhM0ybkCaiCTBHmqoibn2IFA
         0vM9bvEVLOQENAoSsgBi/m80t3IrJSeFen1dswWEVK1nAn/nyry0HDOFlHKsKrEQrYsn
         cMB7ZP2c54L3TLnrrRhF7pyHc5UZKyYMrUjtGfcCpj3Kf1EFM5fSc4dJ6TSuw0xxKRL/
         N8zUDAhND5Szmc5b7LIscZyqEubQlh1Opd2UY6QUWypRynYQhDHHnaxN8Kc+wcTC+AQe
         OTv74XLZhCsCWIhdKRmIoAN0rz+5dwi4LtrAfZZ2p1z6pC92mQMfKkygzyrFtDNEFU8W
         1smw==
X-Forwarded-Encrypted: i=1; AKwUvByTIRHfXo9rgvMr0x43El/r2ZJE7TjvEveuvyt82TcFSUseKmzjid5AOsrHXzZ2xee/FPVslfCuCeCm@vger.kernel.org
X-Gm-Message-State: AFq9FYLuHp7sR80assJaGP8pfWvbPI8ystVIlrPVStojrGAi1be5Sc7W
	feXIOYirpG4+raxLTZ4aqTv4MCfx9cOoSmChowhy0DCDhwlZH3AqpE2xg38QRTSGk2WOfHALsoh
	F3fvTsNQRGg==
X-Gm-Gg: AYBFou3oc4zyiDg6AVqRnybhLfjN3xn1Zl/dEvI2BtbXxzd8PC0cBA5l/t8PgcS/YX2
	eBS1ZgwFYVD7ASBqS3tIHYdPnY82STZJHxTxPcIGftKOoEkzLYB7cyAS//ri16VPcsyAl4UW1vX
	KTWtejohMXjEwcBcB/2qKptl5hwwnhjDWc51AykalI0DY6qBmdG+KfmSfz46974ZGfnENrQsARB
	mLuHdH2r9xWo4DPam56bHVLyUdsnUk/9NycLUjKn/jstJjXy1uETSmY7RtjC/C1j/2zel0X6GZy
	/apUgaRzNVkJYDKQ7x6RZuqDQUkUSOD3USc3v6m3c9jVfTJt9lWJirVwjj73qVp18Qce+X2Hfws
	LXz/pqXPhq66jmfg3YMeC54Mq2pZQD/mAQEB4DEoukMxHW0drLELn4Z0r6oimi5xXiCxUOw3B/s
	j3jbDz+tLRI9w53x35If0H8KIm9QhKWMMN5aLk7hzHwvXFxriaqHYur1dKXLXgHZd0AiT1l896h
	3yeXdHVZxyuSrK/SmNyO98nLIQt9w1N73k0wUsTVUK4Ebg40hr1OT5MyHrX9N0MBsbG+Fo5n+Vy
	v60gYaJKKE6JvHzvedJ0Lgav0BTiE0frTgMOjg7xSwYCwlOSua9Mw4ikWPnZ33SoxiaVjnud/4R
	XvVui20QHh5QeEZj8ovyNE+t3PGDOUkath+OTsYyphct1gkk=
X-Received: by 2002:a05:600c:34cf:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4a9667755f3mr61530825e9.12.1793203592754;
        Wed, 28 Oct 2026 09:06:32 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:32 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:09 +0100
Subject: [PATCH v2 8/9] ARM: dts: omap: dm8168-evm: Correct SD card pinmux
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-8-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=2102;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=eWhzeB8jAMTZPI1KrE3IIq1D7Ssewn5fvDeiaH0we+4=;
 b=CUTdkEkF+dq1LidthdxZMOHWhYkh3VNaqmkMHQcbzmIMwWqhtlFSpowlgfjJ9B+E6nNFDhmgJ
 4l964OezPWqCU8RpaNDL7ofSCLEmk1/wscSP2drx4dcm0qqWHWQZ+ME
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The SD card lines use external pullups and so the internal pullups need
to be disabled so that they do not cause contention on the lines.
This bug was revealed by correcting the effective bit mask of
the pinctrl device. Use the correct macro for DM8168.

Also fix typo in comment SD_DAT2->SD_DAT3.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
[ettore.chimenti@linaro.org: squashed after fixing DM816x macros ]
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index 81450e15b889..a6d42766a496 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -45,13 +45,13 @@ DM816X_IOPAD(0x0aac, MUX_MODE0)			/* SPI_D1 */
 
 	mmc_pins: mmc-pins {
 		pinctrl-single,pins = <
-			DM816X_IOPAD(0x0a70, MUX_MODE0)			/* SD_POW */
-			DM816X_IOPAD(0x0a74, MUX_MODE0)			/* SD_CLK */
-			DM816X_IOPAD(0x0a78, MUX_MODE0)			/* SD_CMD */
-			DM816X_IOPAD(0x0a7C, MUX_MODE0)			/* SD_DAT0 */
-			DM816X_IOPAD(0x0a80, MUX_MODE0)			/* SD_DAT1 */
-			DM816X_IOPAD(0x0a84, MUX_MODE0)			/* SD_DAT2 */
-			DM816X_IOPAD(0x0a88, MUX_MODE0)			/* SD_DAT2 */
+			DM816X_IOPAD(0x0a70, PULL_DIS | MUX_MODE0)	/* SD_POW */
+			DM816X_IOPAD(0x0a74, PULL_DIS | MUX_MODE0)	/* SD_CLK */
+			DM816X_IOPAD(0x0a78, PULL_DIS | MUX_MODE0)	/* SD_CMD */
+			DM816X_IOPAD(0x0a7C, PULL_DIS | MUX_MODE0)	/* SD_DAT0 */
+			DM816X_IOPAD(0x0a80, PULL_DIS | MUX_MODE0)	/* SD_DAT1 */
+			DM816X_IOPAD(0x0a84, PULL_DIS | MUX_MODE0)	/* SD_DAT2 */
+			DM816X_IOPAD(0x0a88, PULL_DIS | MUX_MODE0)	/* SD_DAT3 */
 			DM816X_IOPAD(0x0a8c, MUX_MODE2)			/* GP1[7] */
 			DM816X_IOPAD(0x0a90, MUX_MODE2)			/* GP1[8] */
 		>;

-- 
2.56.0

