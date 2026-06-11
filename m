Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5263B8BCC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209723; cv=none; b=QFxPOvBll6AK99m3ujLfG+NE3z8g28UTTGiDy9FngQ8bwZ8kiMg8XzlEPHcUORnb3bYtxHanZZ863vcry/42DR9Fy+SJW3YQRG3RImFrfXbq2+ZAiQ5wFXG4wLyaePCX8QJTMPVc8+LxAtuX7fXJerLAPqwHvCd22M1x9A1+tJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209723; c=relaxed/simple;
	bh=gZAVNAenNNe8ShNpW+y1uL8RlMk/a2pYRFQS9VthVm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DkBT0Cs2+DAZJdoXulGLkT2/thqPHix1DgEf9mjei2/Ob/cxXhR1aF66ZVIdxWmNT4/JLFT7XcgJSC4NaBxLD+BpSXp+EeBvBpmxEvgEV9Yl3HOlQ4kVoytsIQ/lQYCXssepyZ7dLDL7zNAMsMPdOWfjn5Nx8MFg6bgDzpunUYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/sGt2Ej; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/sGt2Ej"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-440d9bfa309so248742fac.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781209721; x=1781814521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=c/sGt2Ej5tHKFhjwxLX7HJ1YGYbdypP9n683MSEHmFv9Wys/Y5xhQGZyHf7yAUBwev
         h4w7UpHiNJ1xGMMDwYHViPQz1N4kQDBrZxA5af1xOgyieDmBT/A5TjCKKAjvDKT845BW
         u304DGKZsgQ4UuMCvARL39AP1CPJB7oGmC6+nbjxxA3FE+5NHT2xDlWQGOxYUDzc8LlW
         NS7NwOB0wNttMkq3LF0FTv2Kb5jc0Cfru8tXcrOYwfCUkBwtmbzvTHIvURr1IQnkwMtP
         w79lH4sVPInvO0H7H6f4jlvZnM6IbMcTanYykCu0EL6NvbkQBtQW8GHdB0hCJxZZ2VIM
         yFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209721; x=1781814521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=UHfn+PqpS1+d0cISD4mQ9Bx3voUlGidRDgcMdQsSjIu0FQpCMGWlR821UMmxf0zAza
         FpfvEMmFn99SsxPCdb0mD5xlzQhPKniXrbd81r6DhINLBbdh4XgAAb6OZWgg9n+4RPay
         zfLRyAXKpXG3USQcQT5PMme73WpLPLacoQiqiEBWDdYjwq30O71H288BumsN5nvJCcX8
         NYPU7lv6lAzg1XpVR3ntMpshuuS3VQr8Bf8G4nJd4cyv3e8atVxZA7JR+S7AgTL6VLlr
         vRp2KDPSG0JEolzsg3KF6jXDSYPQ22SPEbXIWLzfjYuEcu2jhggsNrRvMYrynoFby/Vm
         kq4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+URZV9WuHutrQKJZayz0y7C5wyODlZo9fVC+veV/vu7A+dRbhef3tXy+ag7kIXInDgNhvUYapMHV/5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz7mP8gwwMRWrGU9YjkZYC1aDRc3G3+jQIyCB35Xj7FXGvz72+
	AmVSjlIPwysJLL+LHNevt46enY/HyHewDbZCz0Dhpq6G4iHyI8pYlS2JJtWCZXl8
X-Gm-Gg: Acq92OHUlFDCf/K8v0JBY4xXQ1HrN4gWI7sEdw56kkOnp9lOx+qUCzFRdtmmjq2RFT9
	LEYo0BXOzZTYsLojl6MhsrofNz9+/hGK4LTNnKcqt0So70de7avrByQjSxN2/GTozvrf3IvsC2w
	tYMvKxj2Hd5Ilpn9om/NYSOboT0512arb24x5GwCT0v9eSLxMum4MNw2NmLDYwcSNA2WKHdfbIk
	osnFPv7jYA/dwDw0fdE//TF8RpmjZ3t3S1HApeU8KIiAO71oapqlkf1/cTBYFCBQHutw4LN1aUS
	dppjXBmnRl1fdflprP8CZAU8jW6+I+fXj6RTxjnVhXhsp+6nNVttpzdXvaVM74tA384NICG5qDz
	W8JNlWAgN2eff3pSoQMKsNAZP3Y+guQXh1xMssggJfSOf8FcO2pd7XSqN+qVeeZ5H+CnSMbpZd6
	wmX53sFHXE4vEcc7sg/TRRXQ==
X-Received: by 2002:a05:6871:a1d2:b0:42f:b21f:22fa with SMTP id 586e51a60fabf-44241da3288mr2990319fac.30.1781209721191;
        Thu, 11 Jun 2026 13:28:41 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44244cd05c9sm1796134fac.18.2026.06.11.13.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:28:40 -0700 (PDT)
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
Subject: [PATCH V12 9/9] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Thu, 11 Jun 2026 15:26:06 -0500
Message-ID: <20260611202607.85376-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611202607.85376-1-macroalpha82@gmail.com>
References: <20260611202607.85376-1-macroalpha82@gmail.com>
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

