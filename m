Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0951B3FCB2C
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782490502; cv=none; b=bNYnWqKeElXahnQGgg6+75OcJQLVlD0e84q5KP3ks90Qmwe4/lPZNgzcnh6yRWe+QxMPWCRbt9jLL46zgBs2mh6TIkWl2MBuZjMnE6v9nVloVI+1r7rBROH0DxdOLMiH3eLiQu2gb7B7M7txRslk5AOb0LWoWZbvjgGnggu7NgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782490502; c=relaxed/simple;
	bh=gZAVNAenNNe8ShNpW+y1uL8RlMk/a2pYRFQS9VthVm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htvyyJVgmslMyT1NV4UYHW/kxZ31ANjTHemkYpQqI4pR3p+oho47xCo+7XuxT5580l9Aw06rfzdycqBLYKyAaTlegEMsQLxXOmFWCDYpOh+tG/bb0FReIHiQ/qn/aajW8XHbrRfT6UCu49p8qiQadtGiYDP2XnV1VODmb47E7f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/nfFsvh; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/nfFsvh"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9483cd614so1067950a34.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 09:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782490500; x=1783095300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=P/nfFsvhHSJsm+luF8ljtXU6tiFwt1oEiapyTWVgNOxdnWQLRa2sMFZ+UBw1xCs0cb
         lrkPQs1Ef5DolOLZOlktHJxWSc6Vo2uLg1lkWixHesmfNURVtZJQmRywGpddcDm7Om9T
         RCLKRC61kLt97LnhvQOotpItDe1BSDzlnV9M22tb7FMG1jC41/8V+KxcpJibYJfcvhWR
         i22LvO/nv/p/EpkS9J3dLxsHFNhj8DEGzS2D38YYOnj1nmCcjKiwijb9sX04MEncbCbZ
         n71ci12OljcG4fLUqbMIba1xDo2w+2iMWKLAYx1irdyfuz+3BfkD0VFUolivq2dEYmnZ
         5I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782490500; x=1783095300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=I/8cQsXSiWWCFjRQbjJAE+JsmbZkvvxbIsoC4Y90AMtMvvK/wYZLsA81t69YMtW1z8
         3cdglPnkc2QBR+QBeGj/6lEkTnxq6R6jVYFqCi98nAhSu1nhJz/q+3WNl0iYnvPHHknA
         kkCA/4Y8eIBqU34EW9JUX+t44wfATCCTp8HgOvNXlrn+hZ9EdWfCrEyfS/DBWkd7WyjJ
         bu+W2yirr2McfYcqWv8vjADzuu7eEDPumc5WsIoQZ+Mr2Z4Od0ksEz5ftSEMbKSj75qC
         ZZIR7WM1DF90t10THCGS6XMd0P7j5DmN1IHwe4QlgAF3MMWvtGUN/TbfjvT56F7lKem2
         m50w==
X-Forwarded-Encrypted: i=1; AFNElJ8mRx2Tryg7/f5/ombcudSsfEng0zpEsc6iQ2DU+E/sKI2aVR2NU01uRum+NGqbJGfu8+3E3Bh8eMZV@vger.kernel.org
X-Gm-Message-State: AOJu0YwnKMwgjMBlWWV7EbKh4E8P4ybJadr24RKyoiNhWi+lxkVeunbd
	EZ1UzQRzGjQf6mNP2IQoS/ATPiCP+KzLG2XW+1wEty6cW2gC3c8NscTd
X-Gm-Gg: AfdE7cko4lRVKVBhiJTBLBYhhcn2uMnPqwbYXTOooEMFrQmhx4oX6qFVwOvQ2yTgnce
	zQeJ+xgm3xK7xm8JAaxxzuxzTfAZbBA1sgzfgA9g47I4yCcEwW7CgO7QhWO/E5bQjexzsxe1FXO
	8jSVNRm+9tseo/CaWn0VbDYGxunnJco95Gh91gmWNYSAHB81UhvFx9l5pyrM7DnjHkS3GjEGKeg
	VRrzPJ+QSLWNsx+zdfmJpLwHXvRlhL+O8mbiawcxkOh0kTXLINpScSxS+8y2XKWaL90hWCH9Ujl
	sDfksIl1SkeiJ4HigJ4AugayVFY11qBHuqlrJUadpvEmywUMAm3OZD5JXfc8XtFXQhs15wtz8Pr
	9uygkHvIFtedaClhAyqe3o8mOwmwULgZjXZtWDlvGTrgl0wUD3u79L58W98UzooE4JAGev56Z5t
	ev/f3KmhuDvDE=
X-Received: by 2002:a05:6830:3156:b0:7e7:24f9:55c8 with SMTP id 46e09a7af769-7e99c88bc00mr5453019a34.5.1782490500202;
        Fri, 26 Jun 2026 09:15:00 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa579235sm1970211a34.1.2026.06.26.09.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:14:59 -0700 (PDT)
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
Subject: [PATCH V15 9/9] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Fri, 26 Jun 2026 11:12:30 -0500
Message-ID: <20260626161230.93069-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626161230.93069-1-macroalpha82@gmail.com>
References: <20260626161230.93069-1-macroalpha82@gmail.com>
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

