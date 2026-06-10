Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E2B349CCB
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 17:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114256; cv=none; b=nHdN/EayKZGlZfTg7PnvRLFtnIQZMFVWhRu9RSXS7snxtQMn1FwEXwkWdDTfzFZTpix5yKt+P3KjatwITgs6D6LaYrLnv+nGhGIsPNLH+W/1oUyXN2SNPcViBPUpV9kLvWxM+tTZaR8SQHDlYgme7ULmgqI/u5NeZKMxe2rnQls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114256; c=relaxed/simple;
	bh=gZAVNAenNNe8ShNpW+y1uL8RlMk/a2pYRFQS9VthVm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eiFQ6WEkSxGblS6q6MrHfprGYnedcrLT/RAPmgyzQhKbGY8Im3yvL+zPXK2WLf59qoJ8NKRmcM1PGxyM4yxEO/A3BJsVmMVxtA7++DiO8vqboug7aDD1tFZUL1uYrB6QQVGrsLqhJjdBSWeDqnJF9khx1a0/N6M3JKjIrtI0bGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElLv9txd; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElLv9txd"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-43d3454f643so2897132fac.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 10:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781114253; x=1781719053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=ElLv9txdq33qNxHsOJtaDVtTKbDCPNuW30dhPlXK+lb29s8HrS0BQTh6Q7b6fCajFl
         i794/CkfLOXGwgZ3s7RR19hQVqhVAUwyouOGyHqErxdasZnOw/IjsXp9HOxwdeNNpzmY
         mm0pmcWLDKEcSY3OCKNMwPwDiT+euWA7dnpfsXSyt3wOR1TW4IMrsRfcB4+gE5edWnzg
         4zZdwZY+LDb2lourKKbOU/30r80Sb4R4q9pJyRZgyDoF4NSLVEAIewIWRqaggblRbBJk
         jKQb8fvtkWoBZxGGFKNAvqCC+GvQwPeMsmnCNrfuVK37647ZQ/bQqC8OKEs1XE5Goza6
         gtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114253; x=1781719053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=AIPr2HZBv+cC4tvj7DHAiOOnPcOL6/61HOeuh7n1ZocLuqmcI1TfS6aQXLyi0H1cn/
         IYQtDKM+bqww8T8XLZtJZ8i8+6zYLVwREvoDYp0UTVbkeWeRMIg41NmmkbvRhER8s6RX
         vxJ+PSSCQw9O6zZbLbSnhoCxh0OvFtjTvgDBHF+WEGcNIgJZAa0pbP3mCsBMzw55R/IM
         M0yT9/0k1l3ShDIDaHZi6j2/iucKxDaddG6upQ5Jo7zokT2xM9wxTIXzlaM4r5DWdeVd
         EjrcVNtzmGQmmUQa8XRTqqJUv+cbjFxMo3x6IJ52BT/iS0ttPLe9J8fwdCqir+1MN2O0
         z9Mg==
X-Forwarded-Encrypted: i=1; AFNElJ+r6TPGFwB62DXlqfh+hUEtq25vDK1pFRELh5RMe1MtLNcmzwJ26ml+3YQThIunKlh+61HRPM9e+zhZ@vger.kernel.org
X-Gm-Message-State: AOJu0YycxSenv+WhKS4khniphg3qMou54NMOwY2Bhnr9anvNRXCQ+w3E
	R3zdbRhXsLYh2iTfrpO6E3CbITSSub6nTn5GgUPJJbnEBor9YL+kUZFP
X-Gm-Gg: Acq92OF7Ao6rRx5N2DjT8jP4Tt2d1w4v+utQw3NKMBrEooNhVFO/04023EQf4AdV9zw
	Mc4pFcL4V7TqZp04I2pQZG//rdnV5T+adTNrF4r8xh+WaaW3frHGw7r4frc7vbF3b/Sr4buyL2l
	p82XVXiF/DylFIFdXKVO/Qe1cReQXon7fj/8lD9mKaGIMhGfdTWFOW2QlMEjAnE7Ip3grMuNgVR
	6fRlc7MqlqK3ON1vHAT9Msebe4Aqb2zelzu4INDS7zNsvdIQOlAKF9ELYTEyy1gvCIUC0td8MlO
	njxt+AB5o7hVT80kGk6jazPfhj6uFBhLprWl3LCSBxMbnOPGXTM6gtIUf4aY5O8F1gn34cyqvEu
	7FBg8PXXL8p6f670QXgGB/6K2NsCCVtXyuhUTOzDQr3qxU536jCCb1EyeY5di1q7hqyDO5uYhzM
	WHRzBcVNOLbYJvN5HOiGuNnDti0rTHRycYwUiArr/TWbLjmBB95zdMKQ==
X-Received: by 2002:a05:6870:c26e:b0:440:67b1:b5b1 with SMTP id 586e51a60fabf-4413d6ba671mr14468737fac.21.1781114252742;
        Wed, 10 Jun 2026 10:57:32 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:b86b:51ed:28ca:695f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d7d4f449sm21180794fac.8.2026.06.10.10.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:57:32 -0700 (PDT)
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
Subject: [PATCH V11 9/9] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Wed, 10 Jun 2026 12:54:53 -0500
Message-ID: <20260610175455.19006-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610175455.19006-1-macroalpha82@gmail.com>
References: <20260610175455.19006-1-macroalpha82@gmail.com>
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

