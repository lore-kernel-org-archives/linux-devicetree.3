Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCE738F945
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786101887; cv=none; b=SaO9P8b6CUfssITwUmWxvnUTV6sNgUleUoroPPcmyDjiJlVf88JZLNCymrvzWMgSNRU/PAkupw67pxUzOlZNjUhYf/mMSXWIkH3IE9H419rvP6+I2Km3OC3C2uiuP162Cu/m7aF02JAKnuNPcGhyZN7gKuBaAb/BAvbuDuswYEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786101887; c=relaxed/simple;
	bh=YbsBvvHyVz4j6WDGTI7rUyGE4Pc4pKISfSMQF0v3RXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kPp5TYCEj6S8yhAqhcp+fKQ0BqcZVXxBHQPa4exuvkCEJYLFJH/1QhGedVCNY8qVWdt1U313jrEacK8HQGXDaKv7bjAtcIpAVIepd4lynbr6nXgJ0LwqdNrdXcT7SFUjxTFUHTgAPZSW7D5oQfwb0D56VgQj6zhK57Kw9YulNI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ji9g6yGS; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ji9g6yGS"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso3928350b3a.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 04:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786101886; x=1786706686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pnu3iLD2kYSjbeTomVdCVLxo+qs2c03NdwMIpYQOFt8=;
        b=ji9g6yGSGrao+KF5/DYU34LUtqhZ1JeiDIvihGeAd64KyotfvgovGhtJV4DAX9vv1H
         P0cBCyR5Pv27+1bhdqUNNWL9I3ESTEH6DON3nULZcQEp/PoQjZrEwIpV97zfNQYD3owQ
         L87Mpeo/OuLOrhmNDla21+4DHxbKpSX2weGkzam/PiI9POhw+NwmOGkSoILGzJ/Mg2iH
         Vl2RD+QRXDIKKUHRoMnUZjLswf7iyHfDumku4Q7l1GHYMXUVKDFzr8OrVaWFve1Gazpx
         0E0fRuG6VSKjss7exhx6YOdeiLncBLAYLyQYjbKwmOl2HfLU5iZ96FJnVsrk4xkMH78L
         QlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786101886; x=1786706686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pnu3iLD2kYSjbeTomVdCVLxo+qs2c03NdwMIpYQOFt8=;
        b=KNoopsR25h7Fly3gYOFH9ix2cfE9LmpKYDWp8ghhmHyQF9oczAv7067dIJVJwsoU97
         fAOlPrPPlpo6M4rEnThiG6cTz5gaVPaQUQjg2Za76WJ+qrbgXZIX2K/dy+ahy/lJt9fV
         YMtwXpsgWZMB9QoGJyFOtDTyesbodaCHuc14gDzUjP3mQbfRIu+f5wFLuj+mfWpJ0/93
         gPws/RazEw5nFa4YNpReHacI8HbbEM7Ub9oRpGVLtEm49Ovp5DRJ7LOkeA/5k7gjqRyC
         0gHGkW/Qk4PHkV2R9to7Eao1Vu0r3TaMAu7Pm8+6l2+Mjg5zYMRpxtfCdsd/dhIzg/0X
         SlBw==
X-Forwarded-Encrypted: i=1; AHgh+Rq50dOms9WtVnpjQMtWlAQvSyY41VsC39QZO0JjFCeDFDvH4rguuNuRbmThXBYJ7Lex1Apt0rFTJYh/@vger.kernel.org
X-Gm-Message-State: AOJu0YwMwYZhezG1BrOB0QlEmxsFmRYgZSFaW2h9Lc3O3baxrF5206Jr
	UsCPwwn4iAJFo0ExvLx4mZBYoeN6H6uTpu3XsJiFWJj9lIXPf4LWyhZq
X-Gm-Gg: AR+sD132pv/jgrZqYLHNfPSNbVCxexacuubdiIYG5Xopc2R+V5bVKLVn4yWrcHj0hYW
	bsovezYth4LiZCAFyjdCRiV9caB7WxIKENA/0V1G0I2d+/W6QRWYhs3evFU1ILW+iG8T+mwflY5
	M4ygKExuWioX4qeafSGi+k39n8DEnMiUS7+2PHAubHbcgClsweiCvc8y2ovTUVQT8+EV+OP3fCW
	lhlNf4E8j7SYzbB+0WXHfS2VryD6/XfHi4k630dpyjkHKHTrmou/uVi9TlNuvAqKeQHeqWGPKaz
	IFUiKcc8aRcZ02gZAizRdZKvii2uSqK8Apm7w8l6Plsyd1QQT7D0CRuQ81BOcBL/qUK4XMLx4A7
	mbKviufaJ1kUJuniVu8Ugvse6AAI2T4Oazm+U0znPhFABAFftffgsjHNighjFK9ApCyIRN0jnyu
	bNCjaHOGLi/toDJMBvwMm0WyumaUZuuaz5niBu00V8l83NSzpzlTnJpW6IarS3X/xdXL2lubrV7
	V0WNTZ19ZNlD8euUHRNp4+VIcf5E+udCYNOnQ==
X-Received: by 2002:a05:6a20:cfa2:b0:3c3:875d:c52f with SMTP id adf61e73a8af0-3cb85dc28femr29154698637.10.1786101885389;
        Fri, 07 Aug 2026 04:24:45 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:e1cd:daf4:8fac:b7e6:4f37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199bfd8sm6349351c88.2.2026.08.07.04.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:24:44 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-hugsun-x99
Date: Fri,  7 Aug 2026 08:24:31 -0300
Message-ID: <20260807112432.49685-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to brcm,bluetooth.yaml, the correct clock-names to describe
the 32768kHz Low Power Oscillator is "lpo".

Change it accordingly to fix the following dt-schema warning:

clock-names: 'oneOf' conditional failed, one must be fixed:
        ['ext_clock'] is too short
        'extclk' was expected
        'txco' was expected
        'lpo' was expected

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use "lpo" name instead. (Sashiko)

 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
index 352c8efb37e0..27ebbbc66633 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
@@ -703,7 +703,7 @@ &uart0 {
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		clocks = <&rk808 1>;
-		clock-names = "ext_clock";
+		clock-names = "lpo";
 		device-wakeup-gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
 		shutdown-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
-- 
2.43.0

