Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841003B27D6
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 19:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778354511; cv=none; b=Qhgw8zRfdSNT3c+ls7MHviV2VMexAg1ewnighgMWaQuVDppvo0flt2nRiTYhcL7qBzEZV5qOyx+0JD0czuHys3YJUC9M96YICn9fkpjEsrmgBVN9SvAMzFsCnxig+TAWQM5xCQ4uUnUG+jT6+N8pdHrKvzpPBv1Z+MxdrJ8PJmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778354511; c=relaxed/simple;
	bh=7P166A8vdKpbCTvjwJ0c7DTCaR8r6ukvy1kUs71vwQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZbazf34u8oUF83w/dvmZBK0wer5if4f1RZfgZc8pEHtIKJSL7/wmX7iweDo+Niv04n7tpazj1+U8QtWfBNCB395C6C9iiN39Hyf4UlryIDOFwbt/P865FUDtQ4LBRzHFDZELzhrAG3kQIsRs9cq9JxgLofbwDjnYwWod5i6B0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0ac2Z0h; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0ac2Z0h"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dbccf6a23dso2572817a34.2
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 12:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778354508; x=1778959308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNoA18UrHfHWWifSIaqhsuJYv6mLpyyKyk6HN99Blw8=;
        b=n0ac2Z0hpp2ofBDlk7KTDo4BFTFRDRqoQoYOSvG5mizJJlfbQRyGQK77V7ZfuVpklS
         UI094MNcLQ/jCp5lHWbAZmaeoQ6eZCg7yZ5MxiPsFqXuzfLz9V3S/XN9rsZ6r5AtT67s
         tvM3nUMsA3qAj4DzdkCwFnt3gJ6s57VCCr+ex6/i4fbCHsVS/zvczrj4r6mXUTklcZTL
         zwcffvJj/smb8BcD0IS0JjGUBQSphRWacRUxQTTEkYXVO4BVLmunfGQnu6xnusMcovsr
         AZvdh05jDTP4TjC9kQi7ZgmLaXCtnXFZKxqqc75jgfqtWaT35+rtjoTqfxdXLg9qaAsP
         zvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778354508; x=1778959308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNoA18UrHfHWWifSIaqhsuJYv6mLpyyKyk6HN99Blw8=;
        b=X9zQb4RNXpQkd9jzcvhPmiwx46+a59ib8slTeHvbM0/gJMhMxixH1CQytmbrZHsvm6
         sqJAqPsla/cavriXL5P9br+tBcCZVsJ0a9ndFOIqye7m6K2Tzcvyyx++IDwXET0mG4Yc
         2WZBx8NI5SY5+fbcByKqMF1Gga7DgNp0FTyzhHZQt740cN6iqpUDxDhj9i8syuE502Cb
         6RKHFpnOS4ZhoP0q4m8IULNbH/2KxkZBFSm94KIAg1gdzjsNKTrDullMkdZyiOQ3BO2v
         O70eY0zmPjgvXyjwReS6Bab9VN/+j3nfthHsPa2ypn4SgAVY85h9uJLf0xjkRuRde5uZ
         0kxw==
X-Forwarded-Encrypted: i=1; AFNElJ+zmNYRYYskuoUC+fjcbKzqjKzMYGEANX5u3Qs4FBabZ/MjBWWTHjMhdu99vZkJfmM2hW7kIkCo+1Qu@vger.kernel.org
X-Gm-Message-State: AOJu0YwqM/b3x6Igfhq5x59xkDB8XxFH6kJeElfK5jm0x4C2M7/4FQ9v
	CJhYWfLBTWiqlWPratMHJES6+oi9wj8fwfnzXB+7cUFIbCWntTu1Ihl2
X-Gm-Gg: Acq92OHc6OiX6JQjuPWe1A9SGlR+GuAqVYgE8iyuVCTkT8iGWUu8h53ehpT/YTnVsTv
	0vtsM3zk2OpxAiSNxNQBbZ1Dy4bAO5E8tEDRczE+3mfFgIrUfOhzg8/aDZHhRFX3gSevUHZ5nZc
	71FZGXD4q820yYkxNmkjUTwbhpP7ap5Iha6Qr744RBsTyQs6r9yf6BgoKNUYScYQckqGM2ubEnV
	3dDGHgNklhtl073SlEd0ZeT1ZpzjZfPZiDwXVV7BWHexts+uVgB87wa36EcYGLG3vQyg39rqMSc
	kttwBpEBf3x2KBzS5S8tvrbEZShnfQ5AkaadLTVnphlKnWERFdO0wE7OQFy+fV9wl7njaJBP/ll
	NledPyQ0VoGVK/krfs5EsTdy/Dw3oaCv6kzbsYwyVC8V2vYRzBqQFWMC/A2eca9r6C5JLCkn9ry
	VSObu3w96qpieWoenFfKyf
X-Received: by 2002:a05:6820:1503:b0:694:a362:e3ab with SMTP id 006d021491bc7-69b25d2bb6emr4168344eaf.55.1778354508542;
        Sat, 09 May 2026 12:21:48 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4355736f517sm5243896fac.12.2026.05.09.12.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:21:48 -0700 (PDT)
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
Subject: [PATCH V5 11/11] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Sat,  9 May 2026 14:19:05 -0500
Message-ID: <20260509191907.24734-12-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260509191907.24734-1-macroalpha82@gmail.com>
References: <20260509191907.24734-1-macroalpha82@gmail.com>
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
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
index 8d906ab02c5f..875ca884deca 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
@@ -871,7 +871,18 @@ aw87391_pa_r: audio-codec@5b {
 		sound-name-prefix = "Right Amp";
 	};
 
-	/* invensense,icm42607p at 0x68 */
+	icm42607p: imu@68 {
+		compatible = "invensense,icm42607p";
+		reg = <0x68>;
+		interrupt-names = "INT1";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD6 IRQ_TYPE_EDGE_FALLING>;
+		mount-matrix = "-1", "0", "0",
+			       "0", "1", "0",
+			       "0", "0", "-1";
+		pinctrl-0 = <&accel_irq>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c3 {
@@ -932,6 +943,13 @@ &i2s1_8ch {
 };
 
 &pinctrl {
+	accel {
+		accel_irq: accel-irq {
+			rockchip,pins =
+				<0 RK_PD6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	gpio-keys {
 		vol_keys_l: vol-keys_l {
 			rockchip,pins =
-- 
2.43.0

