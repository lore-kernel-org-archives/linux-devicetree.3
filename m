Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934220;
	b=YNyTupQrh/S6wBiklCzi/rZN+vsdxFeIxiaVSm2j6lTSNiAEK46lQ+u3P80vHkLF5qX+
	 zVT2/HJfCYjfFlcsx0PG8+Xj+uPOfuZUn0FHaIwWnPEUfxX7WwHc8/ayWzXsoKtcGEUY+
	 E8KUrFONw6JkOdL7xyOTIORCKdPK5s/6QE525bAAwwFY9fN8Ofbt9iebtxd6cDvuXw+Hi
	 xikwzK/Yzqi2zoPUCFB5A4RYbuhI5x7/xZEm3QP5yZyHnblin9TEShnyOq7TxEL7RWVAF
	 1k77G3RpHjXtBimAzFaa6zmVlQ0El46dO994VLiXk7irjxXzhxkBoleGNxPnGt+Jstw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=cL6Lm2cBZjv9q+hFge8UMv8VlPsyusharMMb4O8VvGE=;
	b=p1pTdhI1FvyHIMtMW8csNinLbWOWC5mS32AkpjNtDosa6U2Mxr4863KkWTZwCzkUxxfk
	 e1g4iZdK2GJCYGIlEYzdKgtYY/xFVtAkpzIIBwH/rVha2Gbfyj0fCyAZr/dESIO9VKkOn
	 QI6bBHoZy0JTUL7CqqolaG89P+YmsdVdgJPOIlQ1h+JBW4p1/KbAWSulGJ29uS24umzwY
	 VzHOIXBk2sLNkLCdc5gZoRo2/fiNXvnd64l6t5Iis8qSM4EVL+Xkl2pg3pLcczgnm6oku
	 WJ+n+FgLA0z7D9vvDz2Z4sI1mV/0gzn8BsSpwQUUxPe1ZHMa1gBj6K5F05qjcClmpMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfCRRh7r;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAADF606A31B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAADF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfCRRh7r
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so88134a12.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 19:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934219; x=1794539019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cL6Lm2cBZjv9q+hFge8UMv8VlPsyusharMMb4O8VvGE=;
        b=lfCRRh7rTs+88FH29dpU2AVZHolozW0ZfBcDG2pgLIgTXTYj08RKJoCe5O8pKkFCSB
         nf9zlrKyx6YYEOSSfz36/r8Fg+asdGLQtkj5IuJzSAxrJdJ+Oy381xrZkd7NIQGrk8WO
         QT9F6tknw//G2kESvEjCbQOuKa/3QM50CalwKz13lXsQ9FlPSm10NMChiwyiUdJVUzM9
         0Jii4r+9FazPnLR0Pae7ocAxi6KsEErtnX/p53pnjyDN0KSRCCRftshevWq4jlm2Csl1
         q3EeWDr3MdLFsbsuA0uvS0SnN4Yvtl1GDQ/FO6y9+wMP7pPrTfNMftUecafjTJKHuh4i
         F9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934219; x=1794539019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cL6Lm2cBZjv9q+hFge8UMv8VlPsyusharMMb4O8VvGE=;
        b=SRhH9r+FgULjlhpMAg7qLyqqCN14R+z1Zk/9794LgIwKVhcOULL3fC7WLKPzCudMdr
         h5YQbVOZBTJiy12D2EFUHO4LiFdftgK1d3DYxZjGRzUNI8u6Iot2mm0ukZvEXnN5kiTv
         l5/ewi6WlGu7brKPJOSoAe6KJdwK1M73xRHZBUMXmzyFLo56YrLdNPIp+cDt0xZRj7GD
         FPYs2cn8z5cSjcG9ukWQq9jwYJDjpBK7NqigOIlyuirLfgix07PCgKhg0T5WPKqxjVf7
         sCo9sNKHg3A0TowD4WNlpQVKfHa3BvGMgE4YMjZFb7lC4RV0EI5ATeiWPn8MRWD6+tfR
         UstA==
X-Gm-Message-State: APuU4Z/aqPPifZJ9P6D0riJsTjPhMp4QVu2iaa+YKELlOQvsk2BG0VXP
	XfDr1E+qiPld6pgSAlcMS+V4ePmzkJJMgQq7jGFjPLImYium8C8vJegJ
X-Gm-Gg: AYBFou29HkiX84YeUM/XNavgJ1185WCUcY4cLVXCWs8aD18Jl4lk/0ZVQBMrcmY6mmp
	aeU+7exC3Yrpuculq6jgZfzpgwtPrqnmo2886phtSkHpLi4J+k4wN+nLAIm/y+0pcCFwKHKDxpd
	exZ7owtP+WJORl3P4TjN1RX30f/VmwlWyyD4C5n5YO+HBY5/xLLK38nXMVQEjWkb/f9GGzoEtAR
	CWS+Tq0jGTMe32lJ7CceUzRUOQm65Z6nlAV1U/3O0dODknlPVHs1An3uPxqfCAGhlolqBuWJA6O
	cLUKpyo91oWfb09e7Z+9+1eDSFrkAFlnn8i0SEi4MeH2ynXCgBV9bBJ0veaA0UQzKY3aLARE5E1
	rNA14w5VJAZJukkqDNpynaF4E8wHTeEOzC6copDKZi8BPs4efqwoHb5cbi8OPgYlCPNVOv7FWBc
	7QBAofGWsSAQE6ZKU/hZobyNLKW6tZcHmAxpK9SVWedNaba3CF5n9TklXRVYomvdAJXCcDRkkY6
	kmjaVb9p4sDt2eqEos4+T/I1KUBBnIuuC63AQHRKmx9XfwEu+xDdL9uJGYF1H0hdVor+xWdfWOj
	3Naw3RL4ZjzkbeDmwXm2SVLV29IM343DjrfaSmvVU/RXsEpDnx4bUfw8e2D1MYQse0wO
X-Received: by 2002:a05:6300:67c7:b0:3e2:3222:2559 with SMTP id adf61e73a8af0-3ebb2a978f5mr1627729637.62.1793934219096;
        Thu, 05 Nov 2026 19:03:39 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a04a39sm118179a12.15.2026.11.05.19.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:03:37 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 06 Nov 2026 11:08:02 +0800
Subject: [PATCH 1/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs
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
Message-Id: <20261106-ventura2-dts-update-v1-1-b085ece9bf57@gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
In-Reply-To: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=s3+YaNI0kXS1WHGDFc6jVaitSFXgSkUDG8m8Ajnq+tw=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq7USVrNYo936MKfY8QZ8ByY59Ccq89oZ8md29i
 fRH6E9D4z+JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCau1ElQAKCRClg0K3CVbE
 gQTMCACAEQvBIE/8WEFrZZ9u96QoYyPrhnfijSAw8ZPvSKASOXgKbhwNEy6a1B/bZCP2Qq7fbB/
 rwWGG3+VsplhWYGMjCzV/5hJHtPbkUjMNw6RqLytydlwFNlM4/MMJ5BloWHIrmm9Q2gVI8onIvU
 E/rkDcrss9iLgt5cFCwV0IJdPZPIic6Nb5OgGMoqmQ21pRTiu6GxOY49zMJOihDbgtd9vVGv6Ex
 /hkkon9DJfi7gKUgU4xHoo7nyDDP5c3jM2FfB6oMP/hm+vs2LuExbc7VtXj+QKd+M7BTBqPoiR4
 tZ1dplLGWvitZI8JDLtX0gtr1PpREtIggD79yh5gb+MsgISe
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Ventura2 has three LTC2305 2-channel 12-bit ADCs: one behind channel 2
of the PCA9548 mux on I2C bus 0, and two on I2C bus 3 at addresses
0x08 and 0x09. The bus 3 ADCs read the valve voltages.

Describe the ADCs and expose the bus 3 channels through iio-hwmon so
the voltages are reported as hwmon sensors.

The ADCs use their internal 4.096V reference, so no vref-supply is
described.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts     | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index f3dbdece3076..50e652cc37a1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -190,7 +190,8 @@ iio-hwmon {
 		io-channels =
 			<&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
 			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
-			<&adc1 2>;
+			<&adc1 2>,
+			<&adc_op_fb1 0>, <&adc_op_fb1 1>, <&adc_op_fb2 0>;
 	};
 
 	leds {
@@ -392,6 +393,12 @@ i2c0mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			adc@8 {
+				compatible = "lltc,ltc2305";
+				reg = <0x08>;
+				#io-channel-cells = <1>;
+			};
 		};
 
 		i2c0mux0ch3: i2c@3 {
@@ -583,6 +590,18 @@ &i2c3 {
 
 	status = "okay";
 
+	adc_op_fb1: adc@8 {
+		compatible = "lltc,ltc2305";
+		reg = <0x08>;
+		#io-channel-cells = <1>;
+	};
+
+	adc_op_fb2: adc@9 {
+		compatible = "lltc,ltc2305";
+		reg = <0x09>;
+		#io-channel-cells = <1>;
+	};
+
 	dac@c {
 		compatible = "adi,ad5612";
 		reg = <0x0c>;

-- 
2.34.1

