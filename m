Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818314;
	b=xOjpXgjSN+eOFIoOU8ifS+6Lc0ZtILPe8xmXdZi8v1x5q7YSrFkqNgiM8MYXimHXavoR
	 lqXMRPdMdPuQBjZbj8bsxhP5He91db3QajFsNXnlkIwBR0e+twCfILfGME4XtK0X4jKtk
	 fm8Ibvg9iZwBSS3lywPrZm4t8Ho4la4yPm1y90mHOCaNg8JzJDI88aVNrl+QEPeE0nFsg
	 FafuJPLHmw9V1Q/BbMP7FDMfThzoPSkDtMSvXj0y+Kd5UJ5CrvEW29NGWYkRCD1fL30VT
	 4lqhg82on/pdeVQ0UZeCs/y+bF6APdKopgNMHiNDwMnABUw6lIlN6sBPKF/cIAQ4qhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=i5XsCr+ucTT+O73E9489h5skp2UtkxdhspydLfN+Gms=;
	b=dAAdjgC9DeMDy82IDQNrt4GoRW0qVIYkAYRBZewnvVU86boPte38tCDW/NcpB70Om483
	 6sZxYRXY/x8hqp1wkG4D6TQ2BhvQhQzHJNa6GW0gimBDtktbw3Zn4v6QgWzKIj00mS8+a
	 xWZ6zbAmeqp/JQF8jeEG7uJq59LS/SnOBfvjYTsbGyXSrQvEtTf4hqjfJFKEzDa1fYQXF
	 tDkTcp/IaxzQuEEGXV+NCvmVUT+K/HJ12CZJII+AeQmo18dSXAY0jos1Sar762wy37dya
	 aXvTylDFoBzq7oZ/RVe8YUyIo2i840kI8I2qnjEG0x5tjaxpzotV8cDfN3T6eAFHNmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UAkBVP0C;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AD1606D815
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19AD1606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UAkBVP0C
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so11330335e9.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818312; x=1794423112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i5XsCr+ucTT+O73E9489h5skp2UtkxdhspydLfN+Gms=;
        b=UAkBVP0CZU3vaC4cQnPJC4Ij/vDt3r1Tb/JxOQDcVXp5XvNL12ybSpEBoSFfoAccth
         jW28cIHdIUDVyOM0IXHwdCA8yGgIF/mgIFlaBsqPY1y8WhUmq//SJsVlnqGeGl2eiQH9
         mdp0T0O5iGrO39rrqKm4Bykedt3cBgX4mpi8bEbEGP7V5qX2Q7GJCbAytUsa81cba7tB
         KZOwvTZCnx7g55hxC83vf5l2aK0vJOtP9Hh9w7hrL+a/HobUeJlUrz4Ud2dPzPirSOK0
         lhWZFct36pmIWEt1UOrZjdzwnstFWeA00Qv+WYUicmrovDQhnvDvR+C3af0DUcWuzcdF
         ubOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818312; x=1794423112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5XsCr+ucTT+O73E9489h5skp2UtkxdhspydLfN+Gms=;
        b=TMoS7t8/jeOJ55DAG6fxT0U95FRTWBf6CQOa57YLddu1WMjO2Gmdv9en97U3yFoQQT
         HIcQ8LuZWxwxlQH4RnJ8rUq7If1iTYmYWYcMOwGlsYP932PxFuTEaMt90LzDWFeR73XD
         fN0bcgf6WCVSYcCG/3caarh1SSpM40t1EISEmP9CyKwKJdIhfkfwTI7CJujPa2kILBA/
         MSVK8cQuIBmLXITYHHoeAE0+6IEGsdD6tJeNRI16GJF4D6bZi82GkSY2e1gcix1EcojH
         dh/5he+oHVAJKEpoTIzdGT2Qzim4SRJC7yEdsj2Z+wa3h1qCHFUJNbm7vPRySMjgqb+B
         3rrw==
X-Gm-Message-State: APuU4Z+btbdY8K02jEenbNiIv17ArpX2BmpD8K5bNtECsWpnjyhhb1oX
	+2Wt9S7eUh8iLvO+XQGd346ytxkaBlIjee0Kz59WLsjs2A2vfZimPHqr
X-Gm-Gg: AYBFou0USiQ1jTBmR7U2dc7Ds5JC5cas9oLMoK7AErtr3UZHFEC8TB6Q6G8dxCRtCAB
	dU3ykcHHZQQMPVNF61r1h+MpqobartW/J2SUcUVc/K+LoEHHEVZj3Jm6KFxm0/EsRLmul2261yZ
	Dxuaw/D4MHglbxvquXly9onko5Q/7/xSNzqsITBuJgUTq2K7eg8ASElkwMT7iuY6rYXG0OwRAS9
	aZM+4689GV3U7VjB2WrYvinudFUILLO3kqs7XMEJ1uC/kfHRRYjWE4aAYmNTJzXZZr+pnCHP6oc
	+XDKVnwggAg4aswwxfLRXZ7YFnqiyEYaN7zzd0UP9s1IK/Kw6gqMojBflE8qKCtpsc3/l+3+JhO
	pno60J0IHqX53FXgBiNfP3FR60IEF1clrP2N2zhVp6rny8ZcGnr/mawXKvkW8vq/cgHfXpTc5uI
	/mkbKja6LNjwH4yvC67inCnn5Yq1flNAq8bJsp88bN1x4km44WwfLwkCa2cMvkyI782Ey8vJ5Jw
	Ya20ULAlHbKJzRFDh8zupwNcoG+2GEIxEQGXCr6eXlB3P7EV9pWglTshaFp+1VgQCjswK1sKIeJ
	EBGv03ti1/haSuk2B/cDAWAaVwSDSeHlHAxSE1RhjDZbCZaY5+hNkQKIZsqQ3WWqlsfiahuK6e5
	QqYxAu7LPXkJNbBrjaRg21hFEMM/MCwI+WWBPvNBj1obpiVls9kVJ6DSq/EtUW2nXLjq76jYdv2
	6ljtHG3gpYsWC2dozGew0/iiNPks06mJI3MXggsCh7df1vD+e5BnPrJxtFE1oax1vvvsO6zt+fS
	p//U6zttrwW4ml74EqeBvLQoIfUebI0v7q5ZkdmbUjo
X-Received: by 2002:a05:600c:470d:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4ac17471285mr378898355e9.7.1793818312397;
        Wed, 04 Nov 2026 10:51:52 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm4031515e9.7.2026.11.04.10.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:51:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] ARM: dts: sun8i: r40: bananapi-m2-ultra: Limit eMMC clock to 37.5 MHz
Date: Wed,  4 Nov 2026 19:51:48 +0100
Message-ID: <20261104185148.883318-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Samsung eMMC on Banana Pi M2 Ultra fails with "data error, sending
stop command" within a second of sustained reads in DDR52 mode at
50 MHz. At 37.5 MHz the same board survives a long read/write soak.

Limit the eMMC clock to 37.5 MHz. Also enable the hardware reset line,
which is routed to the controller (PC24), so the card can be recovered
after such errors.

Link: https://forum.libreelec.tv/thread/30663-banana-pi-m2u-emmc-data-error-sending-stop-command-fixed-with-a-40-mhz-device-tr/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
index cd2351acc32f..ddb70af25836 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
@@ -195,6 +195,8 @@ &mmc2 {
 	vmmc-supply = <&reg_dcdc1>;
 	vqmmc-supply = <&reg_dcdc1>;
 	bus-width = <8>;
+	max-frequency = <37500000>;
+	cap-mmc-hw-reset;
 	non-removable;
 	status = "okay";
 };

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

