Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA753C0A0D
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579184; cv=none; b=XscNJknKLWJDhw0JibG9R5iFDA0asLT03bGdVPbLa1683sXYYk84ED/TqulkusWbbKoVoN+WVIzpbZUUWK1Mn5um0ZZ/q816cPzhhSVsspIl6K7D91ZHG5502I3fAZFZuMCqBc52VzQmOdl9dElLRyJZ33gzZZOsiyrBaxRvjiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579184; c=relaxed/simple;
	bh=gZAVNAenNNe8ShNpW+y1uL8RlMk/a2pYRFQS9VthVm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJmQXBJZYml3vZi2fT+d1R7c0zwhORnI+xHeRiZqkdDaNoMDFja4ZNZDu8ZG9EVtInkJkQ01QBtwmKwB9VIgjQUqnq5KhggvrRCQuVLDYGbAHEoZjF4qyoMCdXNhRa96WKfcfYVlhVFuPVhZv6bq2JreYNy5XikZM8KmthhKZYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCsuKnVq; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCsuKnVq"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-495c63c41ceso5114729b6e.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784579178; x=1785183978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=jCsuKnVqOJmeFZ+aV2Byh3oeXuLoT84Q9OwX/2/QNlyKfDVRCJUqLS7ucvdw2Gemd8
         UZ/sCqvBEMGxwuAo92auNqMql1zTM60XMSFINPHOpq7pQRSaZNF6f/DhmGWli4zTTC2O
         mSTYe+PNVqi/b+c4ubGP7u9lq2rcEXWvw27r1y0T/cKY0SOzk6P9nkTj8KRnj+vzgDKb
         Luc+it5lbu7SZXciGu2b04ICLwN76lVNWHYCVoOb5tzCIWq6yZ6hyr5cqK3jW+PG7Ov0
         RFB1cxtFKsVwp6eEBiiIJ7/WfJOkwio9EkKGz/WWcYAqssPrQkOdGhUdEKTW5ziqHmUg
         xlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579178; x=1785183978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=aheDy3rXhs9RL6l2GF0Bn0ENzEwWUC5bsOkYPddGnt2Z5bl2kmIHFrDCm43uquFDy7
         QI+bzRey+hYldYq+zUoJyqUZpVsQxRCqlIwu+0LmatRUJpp6nE3HIq6c5ZSaY5Ot9/MU
         I1syLPWskr25XScM/wZX0W8/7FlzcBwhcY2LrVvwS528Lm8mX7mLKOcY5cO1f6j8yQLd
         ywWEkdolU39wNnJd14tnXQ9bOswOlmgHTHoiPtUpEn9lBQlcP2S/Df1atf8/b45dic3Q
         eHntXlCuEMo15Kyc/NTaCpUUjGXMzG2kngFXTxIS47adtAC36BkLGdCZ80FsRQ/ozX2U
         bhCA==
X-Forwarded-Encrypted: i=1; AHgh+RofvsvQ2rwPPpZMsAUCkZT+jsWIX0b300HUZBrFsyNENO5hjltXQ6c5h5khUslHxukGVoe4qEANioVm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywef1uA5eOlfEW4kfkd4nt3p5+6hPQje1r5bgHj95vGVo4gHB25
	MwQOLiQvVBV14cIC/dshNvs8TuY4RxvyKgN3oHLRUEQo5G1/jZia7AEO
X-Gm-Gg: AfdE7ckUgBfKKwWjBPrXGnyOayseKHuEu+ch4+m1ZheiYslZlGQvBGTf0oTNNlaBesi
	xMmJWAOGrs9VroZScXeKdp7jAm5mqitt8ZxByS20UPi3a0srB03xf0B6j1MlzE6LnH7gl8T5Xbt
	/EG5TJ9gAJYZfTJR68IReFrkw+oRF480U1yBWyPjRZmiFlHjpzipHvT91lHtU01Smy7+WhofXmZ
	lHq7ql3RDeOa2vY1SKD2xI1hQ4mPqcC1BOdCQufwqKhO+TyvWjeOX3inDefT9nyESg1H9ZAxE6S
	j6hKZZSpZFGyYHFfrpn0zls6eeaOc4Lddbc9enYei9HOVAUSeVFPqjagsW9v/w1N1T+j1fQhmdP
	pcPVxmSK1hIbINEngua5WWWE+on70+DW/HcMd3FkePFbXgccI39oEIsjg8ehNwtn8TOz1inVbz7
	WbQ8+ifrv5Nz5HTpsdrMUAsA==
X-Received: by 2002:a05:6808:f8a:b0:497:e1b7:d7bf with SMTP id 5614622812f47-4a4d039ba7cmr8747067b6e.32.1784579178321;
        Mon, 20 Jul 2026 13:26:18 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:9988:5abf:3c51:d168])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3e5a0cdsm8029550b6e.18.2026.07.20.13.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:26:17 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V18 9/9] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Mon, 20 Jul 2026 15:23:41 -0500
Message-ID: <20260720202343.70138-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720202343.70138-1-macroalpha82@gmail.com>
References: <20260720202343.70138-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the Invensense ICM42607P IMU for the Anbernic RG-DS. Mount-matrix
was tested with iio-sensor-proxy and reports correct orientation.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
index 8d906ab02c5f..b770bfd5268d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
@@ -871,7 +871,13 @@ aw87391_pa_r: audio-codec@5b {
 		sound-name-prefix = "Right Amp";
 	};
 
-	/* invensense,icm42607p at 0x68 */
+	icm42607p: imu@68 {
+		compatible = "invensense,icm42607p";
+		reg = <0x68>;
+		mount-matrix = "-1", "0", "0",
+			       "0", "1", "0",
+			       "0", "0", "-1";
+	};
 };
 
 &i2c3 {
-- 
2.43.0

