Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DDB4183C1
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544498; cv=none; b=QqzxkzoXQaDwkCDuS3O8gClLAUfBAeg5d4qZviuon0X7hoSm9guM54rI1+mMRZEJW9itUb5c+Q9uRAAddNXHx5yOz0klxrK8ud7YfMc5OQC7pHHLgCO8IzoZhNcvAYRb2kAlspSijZgzcA6UuMAfEBnZWx7tGVyLVDh3hhwRdY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544498; c=relaxed/simple;
	bh=gZAVNAenNNe8ShNpW+y1uL8RlMk/a2pYRFQS9VthVm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWGh8ySS4LoqeEkOnQpURcDfPrF1drWcUk3byli3XoHhBImAY6OLn1O9siGSquhK79foGVmCGBtc+dzwSPT0pSGUKkmXeq8j0Ofvs8e5SP9uL3Cgj5rlqx2PEnL/plXNMQ5nB3bSERPpWXZT6+dLyTM+t2MsjeyH5YKnBATBFX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foGZwCUj; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foGZwCUj"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e6e41cf7aeso1885612a34.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544496; x=1782149296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=foGZwCUjEc0RAu1czDpZu/lSpWcQbC84JqoT73ahAZHg55btwHwhZKt9F3fhXL2D8Q
         mkzpiGrVr7b6gVIbQmM8KPjOoGgvfdbWT3x6KTY7YSSHEJsGyYVx/KjAVAi+G7LxN7+K
         gYQTliU1WWmYZH0UjpypjntObJHBzTwMlAOafbh5tYVqXPEdC54Pec8NdWLgrS/QUmoA
         uNZg/ipznkS4OUWzeKjG3ni0wAjwFgavxgz43tuZBUfBfUWTUTLhtDPP3ZOIVK+SYEpV
         qicy4TfomBwdhUR6pIfOzEOCKVRSIij1NPoJsPre5az8TcnACmgA3mPiGl9tviqApioH
         DmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544496; x=1782149296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=rMAdkBwA6ZYBbvOQqeuhxRmQpWQWaQYIE9UumUYBcPXxMJ1ncUGcH4QQCvNmvCdh+b
         OTw2dVweWmlzTXr1MLmLZcSxcEny3AR3bXKkZ/JyVO0ujghwjf9Q9rPvfnoGgbMqHnoM
         IZbVEM+AVfjsO9ZMQc+Fbwud93Wti8dDQ6wDUNO96LnXZD6y6esv3zG8Sm5H1bE7O8Bp
         WHaBA9Lbcp1XQlb0zLMrxA8U8dzr0tbOmDTte2wEbnWdyb1qWyyQiXxACS/+JQd4CK91
         U5MfBenstfk0FlWma4T9BmoF+BY7amWCZhuLUyf4mcoxO6doICPH1zTtdrMDlx6CL2XF
         B9wA==
X-Forwarded-Encrypted: i=1; AFNElJ80qT0Yuz9K8MexQDQEGvJm8kBu0j/gyrh216zY2RZsnJfYDU9ELvkkS5BlqghZIlFLnLP6XjbMk7p0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv1EOF9VJVCkBppZ47i5rA02BP+WXPvhJIZQR96L+JLJsPcbp5
	L+FrN9TCpJ7blz34OJpNg1wIH9+bx3YHFfif6694TQCjvYpo+wMi66gj
X-Gm-Gg: Acq92OGNLX2ZYxhr/6XbQSbDLy5beaygU4LokUQh7A4vj61chTMUaZ1QlKWqfeud9Gw
	63dnrypU3vbQOtx06JkmmDpP+mAU7KgloiBXKsxpodrRETdi9N9G8BYdFozpaOaUZznZPfZLrYp
	LQJGX4hDY43tIfNUuTuUg3Li71SkcFL5V6bL8WxhvB7vAl/mAylACzf/Y2zjtHB98U+MhYucxgJ
	2oRrxlJLnG+8C9gl0AcNDPSs2ef7PI4t26Tdpov13mXI+j6io8h7WlTsYkMBs7U21OefPUAH8b4
	B1mkrEQDnFFwLmIey1VJ+XbE/RaHi7TbgOp6puPBRSjw1bzKjfThoBiOFjw9ZM7YfRe+SyF00Qq
	oq1NUwLy9If2koJjanWYRXM9CklYzYtvOvrwhfHEl+AsQHdJKITrUCVywaqPTuwlpwLVMfVeT85
	ltO1GpXtg6zYdXoNln0KrCWw==
X-Received: by 2002:a05:6830:230b:b0:7e5:b3f6:c6ad with SMTP id 46e09a7af769-7e78466e990mr10539475a34.4.1781544496051;
        Mon, 15 Jun 2026 10:28:16 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f451fe7sm4480033a34.0.2026.06.15.10.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:28:15 -0700 (PDT)
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
Subject: [PATCH V13 9/9] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Mon, 15 Jun 2026 12:25:52 -0500
Message-ID: <20260615172554.160910-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615172554.160910-1-macroalpha82@gmail.com>
References: <20260615172554.160910-1-macroalpha82@gmail.com>
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

