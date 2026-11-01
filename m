Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575224;
	b=ObK/9zH7fbSlMfiSc9XMW5+FknAf/l736DGUG8ynT55XcrxqsWkUF32uqIiJ+fgcbaWw
	 HbLtt3PMHEqzHHKqg0kCHzcRH7bepMV3k8fjIfKLo3CKL6FYwLI0je/qpx8OiNjKwf4R1
	 onJM2iDjJNJtiOU+oOhvAY8Ap0ZOTG1gXJ06Ai0RHhWVAEHG6IZajBRYQzDighvspfAEN
	 w8A0qXtppp1stIXbNtuBuG3AdsD1q9tOfrT6E5rlgwpEZiaEhPihw7hKeLJYyEVEid7QD
	 OAg0FMCARvdUy94a+spmV1pVxWQpVsjTbYw5frSvw04h++ZcOTf4zXhYiPcVSSYVU/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CMz7QH5hxHuI4HppoMOO6E5SNWmF8pkb67kqxTZZ+hI=;
	b=j9WH31wuK2mfup2wVt7hpPvepd7xqaA6047O/cqvPP7jX6zbuSW8+6KC5cSFuqJf0FCf
	 AFHX2o9pExbCEhAzgVUictLBPhkBlk0NMI/8HBaXwpC8ypulQMByqOkTgZJ3rbqhBG0Mc
	 UmgaaMeuW3wKrRlbXG5YeaNsekFVaPB9siVFsdprDZDOfILl9J9r6qm4hj/F6CmoztkPn
	 /ZCjj14WY/jOgN3fR41+oDT50pIC91AVQMFfTIi95v0Ym6WZwnbbbt6mQHNl3CbhRuhiS
	 JNW3BlOTYZBcUVEXMFjT0HvWR+2TMycckp1M3KwKPUSNbzOOew8MhixqavAd6r8wu4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=zQ+VRDRs;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E82606A32C
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 23:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E82606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=zQ+VRDRs
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so15244765e9.2
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 15:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793575222; x=1794180022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMz7QH5hxHuI4HppoMOO6E5SNWmF8pkb67kqxTZZ+hI=;
        b=zQ+VRDRsAihzfyiAc0GNDklzPpgtkWAJKz5g19TQ5p5QgSim+4BrF1LhyKrdj5ZEFf
         Yy0ukBfGR4wtoPLiq2UOBolnqVLNOt1HiUtPtPblu0JVSyN15T0UfyTf8PPLwAR1ptAL
         hT9MTGVJu/V3l47aIP+W89VeNK65Nyxad2UMuIneLEI29gOFdpcB9+5ooGQQr3P/o4rB
         CzI/VB3WYAx6L+bphqjz7fOhtCtzhE2gcBd3NWkkKy3Oe/CY0eAPEna972ToFcBAdFMI
         JKYzn4YxY0dliqLEYQdfGmzTrYYxGIM3cPFCmJ8hY2DUDLOAPL8FDJy3pyTMfcG1jQ4h
         rz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793575222; x=1794180022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMz7QH5hxHuI4HppoMOO6E5SNWmF8pkb67kqxTZZ+hI=;
        b=dEkBoCZ7Z5zlLvw4JIollmKtU8cN73Mqkaruru47/vZ61vGHUugqRog7raDQJp153f
         71SrEQ7RVfwwH52uih06nkUST6xmmySM6sCAQ7jXlDLYZIu99r0UYhs1t0oyFcJ5lwVi
         eiRsMHx/+Oqo6JFAfcaBlkCUtZ2+WzjbS9VGuneiTA73OXON+YH/g5kHU1pHVjh1kQBa
         RpWgZd1ut5Fyu4MCQGkEkDDUrD6ZuP4KIEkf9KCBx1D1dhdzTSENsLPJLrH3GjJRq9AG
         nr+/tHUCXpF1YybcXo8kvoSXrEARn7xq9Fx3hCWKiKm2I3T4edHSN7MzdBcmw3rG8gCw
         JJ4g==
X-Forwarded-Encrypted: i=1; AKwUvBzmh7BuaBlvP34PYLTX9kbxUoYmto9/E2SGvw6nhOmvtCWmoHX8vytdLhQ/Wg1gYDP2PZnDQJnc6c4g@vger.kernel.org
X-Gm-Message-State: AFq9FYKG8mivd2+E+thaDyfUKt6HHkSWfsBdc8BZ0lX33bCkl+DV+gmi
	7aRCxXQKX/7PHh2WJZLKCedViN3fOeysmsETt4qJFD71pkVOYIucRxgY
X-Gm-Gg: AYBFou2ypYKMgwQ5Iasb24Dgw1jhvdYWmPQEQi9H0UKdcmyPkK6vXFHTW07/gazaKt9
	wepOW+RaksLEvTitjGWRdSHax2YGhVH2cN7X3ssKAOdOwvPtFJZoz+lydB6ocwgrJRUT2GiAPS3
	+qpNfyGQg+U7TJIMGxWZpM7yHG/npILPDbOC0dYIT6c0J1eyBGcUeEV1Wa8uEUzL12djHRmWpe/
	H7seeytYcSzOQHeqJAmu4A+KJuVWjGIoRUpPuTSy19WvcUaDHhoMLi9LixtXxVnXcAiggyR9+/x
	HuBmUzpPJNQttGu76zJRkET8aNNKI/u8kpOk8QPhLpW3F5bLGpY+ROjiypFl3dNREtPNd22RnI4
	zzLeOcghhVd9llp2zF2PnoEACWZhGy66xcz6BTYqeZp/e3pkXx/SmrfieDq8hhyFJ5KvaMoOqIH
	tPqfg+dIKuVtuu9iujADFCsJVw0EOhgfjgeKHZXlAThmZ0H+7VhT6g8gKClw11tYtQgRTRA+NRZ
	rbbDfu8v7xaLlYySX2ISpGFM3pN/BTfTxEijlkvGmdc6LSn049KO7AMMJhwpO+WP+Z7rU2ah1+3
	thpk+eb2enuGz0Nm1O8uBjtZbQRXGWk3NDfu+5XvyKX59E2pBSRbCzK8FJ0WScpC8zdMeLNWKuK
	rLUlWucvxXOX7OJrMwWKg0aaZIrqZ0YYT+Leo6LSVK2RWUbsjm8nZ9dcA
X-Received: by 2002:a05:600c:470d:b0:4a2:191f:7cb8 with SMTP id 5b1f17b1804b1-4ac1899378bmr187344695e9.17.1793575222418;
        Sun, 01 Nov 2026 15:20:22 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-b1d0-8200-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:b1d0:8200:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm303691815e9.4.2026.11.01.15.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 15:20:21 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
Date: Mon,  2 Nov 2026 00:20:11 +0100
Message-ID: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
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

The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
identifying it as a Synopsys DWMAC 3.70a core.

Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8m2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8m2.dtsi b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
index 6725dd9fd825..cdc47ee1a233 100644
--- a/arch/arm/boot/dts/amlogic/meson8m2.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
@@ -25,7 +25,7 @@ canvas: video-lut@48 {
 };
 
 &ethmac {
-	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac";
+	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
 	reg = <0xc9410000 0x10000
 		0xc1108140 0x8>;
 	clocks = <&clkc CLKID_ETH>,
-- 
2.56.0

