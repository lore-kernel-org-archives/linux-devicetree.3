Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490396;
	b=HuZB32WWnLLcLbWaTPrcW29uN4l3g7lnARC7dAn1eclnxGuyPpBNS2UUMUwQBQN/BPZw
	 zApkqxPjRTl330RsXDDdAm1UZ8rNNUrfrCV8ZsHP3piCLdhoOKx8yYiSMpoa48cRbDSbP
	 MGehdyUCX6eMLjVc9kiyHbPGAKMP+iURwW9gvXlGNOHSmkKiLkhclUViSkfxVYRQJDBHg
	 ZdF5PF+Fb+iHOgDzgZ8i5/9gWJ60KDrMLupXN3pXy3oujQ6nZ87zEjBsMA7lh24V637jq
	 9al34KTsnciDMeILfNAwoSAuyhRg38HxjElqqBJBXDsasauW0MSY3NKorE1q8m6P/Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=uDOw7djSHttwLQtVBHUbQpMumb51EMJ+8QhRFDSN60w=;
	b=spbh4ueOAVg2lVIfTx/4a+dLl5HSw2s4ExbilK/GAL4Fy6RWF/6ds8J/JTZUbjx33ePq
	 sQwp34g8OxCigt/g2MvGKQ5kvCyotr6AzMmY2qj8xCUQ8r6bslyGOUTssW49kkkI9PT+p
	 ZIh0QqbOsUPIkYSm4oYb+mz4NluEKY3u9EFamuuhaGOa5vHa0jgHfOAbVghH4E1jggtzj
	 spwvKKHm4GT07Z2IZ1lv7RUsYGXd0lcVdHEMzfDQc7jr/et7RhrCeYvLlRh5FM+RfGEz9
	 UrQCXUtMdC7jSfuw/JoV6HlQvuB6KmdUhKwOtJQBTHi7MjyDElOFaqnfIiGNwy33JsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YdjlStoz;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD65606A896
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD65606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YdjlStoz
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ada7d53082so10242811fa.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490394; x=1795095194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDOw7djSHttwLQtVBHUbQpMumb51EMJ+8QhRFDSN60w=;
        b=YdjlStoz3t8Nu734482NDpKJwumteKZQJqBhrZDqw6KJFP+YOFDb9vHVtVDvM3bBsZ
         UjIBd1OpPIXlaEzAFZ30llWPZsE/9HA82WjKoU6rzRkluKAoADfgUDoKsqILN8FDyJr4
         sIuX0j75jyhUOTrRs4qgUJuu5wEhqBFgisDGa1orMzaISvS+SwcsJ5R33T+iX/pH65bg
         GCc2ew3/6mn0aDKND+Gvz00LdfM9xUbSmgIVTkbdhxs0f4M0t4hixGwWGVeB9kqZ6NG9
         n+9h2c8nql6SVBqP+2uHhSimLlXrio7pL8DdpeGP+seZZixgRUaINg7n8cIN83Bmtg+5
         KSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490394; x=1795095194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDOw7djSHttwLQtVBHUbQpMumb51EMJ+8QhRFDSN60w=;
        b=PZttzdxqnkexnq3qFqPS6VPMOdnfwmhbY11Um4wu1OtAyGHJfj42jXQ4z/VKFXcJ9X
         4PXZfDpJGFZsMiGLgUm7aRZiVgsmV7k5smImjLsm2pK1pEPXuUvr/CqOUf3S722YTkQu
         VyAwlKTq6VkpmOkBTlReC0P++aCedUgT/voUVwTqo5KGyXI1foc6j4jNGd44+MoajpvJ
         Jm3dhrSxMq7RVwd23ZJzgwiJZGQLNAq/6EUTXFkVTT30L8qygayqFlvd4kCU1lmWMs84
         q5mcgc0yngM2R+1Xg4CvxmvFtzADkGSfY85UAGBTQMBfsCEJSKrZEyaOFH7mg293Acf6
         1Olg==
X-Forwarded-Encrypted: i=1; AL+hErHnsiif8Eb5dPZxW0tpJa5p0YT8to5IM8anKb15rLWkjtoKqLZdP93O4n2jvASS8pf/kyX/cxSvJeXs@vger.kernel.org
X-Gm-Message-State: APuU4Z+RlgnHx9SexbgpnRc3+93+vqH5Ek+h9WrgOWTH7nJ+IpW0kRf1
	KaW1OBt6c2h3rZA3yki1XuHLFFygqBCwL2ckyXIhq06og1Zj29mRNy1D
X-Gm-Gg: AYBFou3wWe/WYb3G3h/+RvdV2JM6J2tOTJ6l1xjAPF7CDNlSo35t6WTTgkaHBuD6iYK
	4l5pZlTh6SoSjjLpSO5jeJ1SkyfL6hw5nDZnDlf5c5/izK03GUagPha7q1W8R6XoUKOMLx+v3vs
	24kzYWM8bRtchJlw02ndAPGyK80m9ALgVWbXvKr//6AWfG6aVZ6DPZ3BQlKk6AqxEGMEnLpm+Us
	CLQaiAkQ2558P2CQZLzrqn/wMhZ/YgNkmndtaYv1+4kD/dk2+Wog4BfgSXymVzLUQHpp+hG8/i2
	hD08UrTvDqh9tAPcQjDMGtmVr4OK4Ufm1RnIU3qmS+HE1MCjz6nwwixZNTk5pC+1P5D3hzsWAIG
	3WMF6MJ0/YyFJbUqLYvwBfD9csElpBcc5Fsz8luooVmqPfiBwg4+nU67sgCHuC54Ok5iqWvd89L
	4zojvVKtFHMutAnbe717gemXxIvq7EbDflIzhkReuS9OFwpCag4PXLiV0r+xLAxoEikUyIiy+rZ
	X+hqueO4qOTLmBV+dZmTVJKy5dmEdIyNn52BNU870KwD0enKrOuadQNMUDz9LeCyjguGQ5zt9rO
	GgmGQvQ1jn1LJuQY39diAOri6WKCofBAYaYAyafA
X-Received: by 2002:a05:651c:a38a:20b0:3ad:372b:1fc8 with SMTP id 38308e7fff4ca-3ae1bf44ee4mr3703341fa.9.1794490394147;
        Thu, 12 Nov 2026 05:33:14 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0926c65fsm19217631fa.28.2026.11.12.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:33:13 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 15:32:59 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sm7125-samsung: add grip sensor
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-sm7125-samsung-grip-sensor-v1-2-d45dd9c845e7@gmail.com>
References: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
In-Reply-To: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52 and A72 use a Semtech SX9360 SAR sensor to detect if
the phone has been gripped. Add this sensor to the device tree
configuration.

No I2C bus is being muxed on GPIOs 51 and 52 on SM7125, so we bit-bang
instead.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
index 5685755a44f6..52fe06303294 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
@@ -60,6 +60,39 @@ event-hall-sensor {
 		};
 	};
 
+	i2c-grip {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 51 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 52 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+		i2c-gpio,delay-us = <2>;
+
+		pinctrl-0 = <&grip_sensor_i2c_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		grip-sensor@28 {
+			compatible = "semtech,sx9360";
+			reg = <0x28>;
+
+			interrupts-extended = <&pm6150l_gpios 5 IRQ_TYPE_EDGE_FALLING>;
+
+			vdd-supply = <&vreg_l5a_2p7>;
+			svdd-supply = <&vreg_l8c_1p8>;
+
+			pinctrl-0 = <&grip_sensor_int_default>;
+			pinctrl-names = "default";
+
+			semtech,resolution = <1024>;
+			semtech,proxraw-strength = <2>;
+			semtech,avg-pos-strength = <512>;
+
+			#io-channel-cells = <1>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -379,6 +412,14 @@ &dispcc {
 };
 
 &pm6150l_gpios {
+	grip_sensor_int_default: grip-sensor-int-default-state {
+		pins = "gpio5";
+		function = "normal";
+		power-source = <0>;
+		input-enable;
+		bias-disable;
+	};
+
 	key_vol_up_default: key-vol-up-default-state {
 		pins = "gpio8";
 		function = "normal";
@@ -434,6 +475,12 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <59 4>; /* Fingerprint sensor SPI */
 
+	grip_sensor_i2c_default: grip-sensor-i2c-default-state {
+		pins = "gpio51", "gpio52";
+		function = "gpio";
+		bias-disable;
+	};
+
 	sdc2_on: sdc2-on-state {
 		clk-pins {
 			pins = "sdc2_clk";

-- 
2.56.1

