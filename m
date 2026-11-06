Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987771;
	b=1b5vOAUquVPt8gW4IOsUU/glygAGoBl+BNnHMjo4u1pQr2MFmBJg0M0/q9QT12gfslq6
	 W4VMOkKDM8igHQmdylADUyvZmUKFWIgSFDkXovdvOp5+pvelwjcYN7vYPcyaNwjVONjga
	 dd+vNb61SrK4H75NkucNHrAhqWAR9tcqhE9G6UNicgmrVWK0hUDnNMA7FG3HAANH6oSfY
	 E1ocP5Lz4oRHhddwEQCXyqkh0oOsmzFsIn6PLzzoPSAVxVKU72lcFd6oYSnLm/ZOTXB9K
	 tkpK5pZNrY3zPNbPyBuRDgQydn5kMvdwPcUr1PNyw6erbkieYKmbpCEbejdLi6sBukw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
	b=TD4IozDA5At5UzULD4l5lyGUkRFUWP/gK8sKThP/EAh45kLPGpbwk3vmaavioVMZeY26
	 2eWjxjcO12V2YD1+H+ixo3tzwKEb6xGcC5Tt+lvII7xjE3ZmK1J+/iblWamCxkjX/iBuu
	 6Aao99WgsIjPZvacIj8BxAp3q4zV0Lj+6UrcoY6ou7bCo+pEohxpnKL4Xd6hrJceR+TEH
	 E0hS3NGJ0x581BSq+G+6G5xMQwuHEoGNEFQuU42wQGyXIJyFY78+8P8F8EmonP/8yWVPL
	 S+G+WmajNGxf4QAzKE2dWAnJBgqHtYh8bRAEf8uVH/6mHItQOne08Kq43a4g3+yr59w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uUH3TMPQ;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CB4606D804
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3CB4606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uUH3TMPQ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1290524f8f.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987769; x=1794592569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
        b=uUH3TMPQ1yqfOWZH+L4gSxy7Y4FwnccmDu+viIbWjbFBsqr2yT6Ezee+DbBKjRYoMN
         ih1K0n439/4ZxaaqUDFl5ArkGZbA3xrp2apW06jk1AP9CylzuXHb4cVlYysr0HR1m60V
         7Ef5ZG5ssw+DpmXOwrLdQTXg0A4CbtRdTbdSyHx68BF9ZVsrhcA6RWeSkvoCv+8dtjck
         UaqhfL2c9aNZoIqCPJQQDtS5//2IhVS7ANlnFLzW32EyaZJf41NtuSnmzjkEKTMWT0qJ
         6f0BhMvrrx7LrdQQFP8Oy2F1kn3/7Nq1Zd03gHEdxZkJKyj3INzYXh+8Q75IiO5uJl4j
         f7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987769; x=1794592569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
        b=kwlNZpI5CoCi3NuAFAuxLziG/hQSJxdHm4yVGS3Z2aJyKiFBQ04NLD+G9QkggmLgdf
         kqDj1UHbkRfFRjznXbwA+A+cNgxHfXNttucxqwlS/NyWOZy4YUUbW0aNO+XY/aecUyiN
         sJwfpn7MP/LlODC/dM6jy8HHh5S6F/FKL1PQaY01VB7KXd7rHVbw/8UM5Ha6oQR4DQx6
         nkw59gMGUpXJMTytm4zbumywi/3AtqAesdYJTbamdRuUJxrOElv9A7Hr3feshqywzDhC
         WZmtj+PTUCtDJ4vs7LDzEE6sgH4BsdHSJctljywNAKSkW504p3nckw9MkoK9TAade4ix
         jDPA==
X-Forwarded-Encrypted: i=1; AL+hErHVM77+1ktE1TvgiRNPIsdF3oG1xIo3VfAJC2mGhO9impO67tV21Ep74d6ygBnjzHMQjRw8eAeIzsIj@vger.kernel.org
X-Gm-Message-State: APuU4Z/gvl00O8UGEouVMr7qD8NubIC76ntL4neM9UJ0zxOsDo1Qpcel
	Amk0tASx4pqyKSONba0nCQ9fCq1TNMXM3qVtX+MPU799KSeJo/rY96uP
X-Gm-Gg: AYBFou38DKrKeg+k2xcPZHUiRm6MqNrL/FFZcYQ2FaAHUVgHACBVFbIhAkXIo77QRaZ
	X4yDUuF+qpwdxPJrnCI2lsLWd1FSQfHbZjNa76mO+KmDpIc+nsht6rIkgLJsPD2oSsSo2He1nM3
	opr9Wg5BOeL6g6mcbaYzjmCd9mJveIHfT8+c8vKG8zwZcoh3qhisEFTZ1rvi/SGTTjQBp7jCoTO
	aqKQt4wD80HtQ5dInZx0RLYzNFflj7ZcdGs744N/XCqzbrtnArrJvoM0MpS2k9EvxwUY+Pp5iC+
	VS52eN44InzD/YVL+pkKQaV5nyZOyNEQ3dkmBXhxMgV15Ip0cdLLK4bUiMu3VGEyaX0hN7abBN+
	l0wIJkwPvtP3yOy1KBQcf2lmsO5uCF4v44XSM8F5My5RvJ2Y6Yj+pMR4JL0rkSpEklaOYitDEcv
	L9tUb5ALYvINCn9xpGtVHFVyAs0iDJbzsna73myGJ4FHcQmD4GdMqndBrmY17g6pBDsmEGhv620
	cXl4qbWBKPgiAirh9lU2JI+p5ahE4hL7rNcZEWvI6pFHsnpsbWrLw7HAiaaXV2HDHPApN0SI8J6
	0n+vgaGieJQVraE+1GCBjVpFo96aFJ8=
X-Received: by 2002:a05:6000:2c09:b0:488:8347:a110 with SMTP id ffacd0b85a97d-492777dc1fcmr7593332f8f.7.1793987768982;
        Fri, 06 Nov 2026 09:56:08 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm4649612f8f.23.2026.11.06.09.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:56:08 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH 3/3] riscv: dts: starfive: jh7110: Add the RTC node
Date: Fri,  6 Nov 2026 17:56:00 +0000
Message-ID: <20261106175600.3877614-4-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106175600.3877614-1-oo.hehir@gmail.com>
References: <20261106175600.3877614-1-oo.hehir@gmail.com>
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

Tested on a VisionFive 2 v1.3B.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 82ea63f71..14f92b942 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1206,6 +1206,20 @@ pwrc: power-controller@17030000 {
 			#power-domain-cells = <1>;
 		};
 
+		rtc: rtc@17040000 {
+			compatible = "starfive,jh7110-rtc";
+			reg = <0x0 0x17040000 0x0 0x10000>;
+			interrupts = <10>, <11>, <12>;
+			interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+			clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+				 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+				 <&aoncrg JH7110_AONCLK_RTC_32K>;
+			clock-names = "apb", "cal", "32k";
+			resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+				 <&aoncrg JH7110_AONRST_RTC_APB>,
+				 <&aoncrg JH7110_AONRST_RTC_CAL>;
+		};
+
 		csi2rx: csi@19800000 {
 			compatible = "starfive,jh7110-csi2rx", "cdns,csi2rx";
 			reg = <0x0 0x19800000 0x0 0x10000>;
-- 
2.43.0

