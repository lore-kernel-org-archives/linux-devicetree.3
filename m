Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616627;
	b=e60Li/ad+YkP78xIe1rUqXZOk3xXFYDSTZfwjouT5qQLy9xMZquK91Ps/XwGUHxN+CoP
	 nob+Npsaf17v8CofOG16lj8+kAiQsaosyxUYlpXRFB8nnjCXMuV/i33aloRhaYMg/vQ3G
	 vZD/QvlE8+XhrD+BYozEEXPNAlHwzGCBJq4S2JO2K2GLwhyu4KyJ1olgfYbJgaS3gGoRB
	 n68h8p1bdXBcvLu8H9aaBLuf8IWFj2S7w8ngeOl1u0A+miI5tOEoFGPFuhbF9Q+MDiPNu
	 x//dc+L3JKUk24/BF+b6hPGYerbOFGou+xFg9sph4LE7333EFGQf2W4tjSTfeVpKyqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ny39IB2+v/C8PeHVkJtEArwIrXSQ2C53NR3LzL5C2wQ=;
	b=ahn2ZMkIODQc+S6GHniMWhsj3/c5M4brZUi5zryA4e/lW71c3nTtRQa5v+EATb3tHHpO
	 NVzzccQT/NT0l/DyN6RnFsBuuWAGB8VWThghLKI3qu9CXdDpIbohWdXi06A+zqymGx9xw
	 skkcT74LSIwavGB5rmDP4iHDo2Cdrq3gE6wwYndrWBo5xObVm5tLH9wnj/Vq0SN/a3DgB
	 viErHNhsRBCw2rjVSoHoLalVQPGJ04ENkivVgWYcVC1jOSMAPpie/zyQ5JO5mXte6t1Jz
	 p8V+9TmuHG7nMG3S1Ijmvo23MeVYVve+f+Q7t6lZQoKU5xwUvjc43ABBSSDvp6YTMhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=izlRGHSP;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F32F606A329
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F32F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=izlRGHSP
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e47347279so3530658f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616625; x=1796221425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ny39IB2+v/C8PeHVkJtEArwIrXSQ2C53NR3LzL5C2wQ=;
        b=izlRGHSPk22Pur8KnK80kIAy9Me7FWkb05DdT2sFdYCSPlI+/bTGF27iUjHjw+Nipc
         X3MKhms6E4YCZM/I2CdXMBy83WPurlDASiPn1RsO/1SKm6EWYtxJU3VY0Rj2/3ygjY3i
         FL4gzAG9koSN3qQF8HhR71CAz15ItOYTmdqwUUe7x0d112vku2Whlbnm33QUK5oIQVjM
         9pcCFBCvZkfdTj7yUOcLOjwWvevosMHHPyFThtM2vkA8ZQ815jFJGM8LHyoGJwZiB/fh
         eTrv1LCuV37cVTlZKdIvzsBd4W3tTw1AwjMF721yFpJuQqn+HNoVREFfR+Qtc4j242/c
         SF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616625; x=1796221425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny39IB2+v/C8PeHVkJtEArwIrXSQ2C53NR3LzL5C2wQ=;
        b=hKdMH6P+qIi7Wex+eHK0g2fRI/ozcL0IgbO0tzYj5A/ZPhKp9RJl/8j3EufOjDdr6i
         wWg/Aq32oQrzPHuBDD2E+g5dSF89gAnT9rnorCvRRJ9kLANV18bD0XIGhEXlKP0tiQ2V
         6hUxnoTRM4lQPb/6f33v7S2vbTvkmSE3pxQXv0renHHudd+f4Ckf3c9zBCMrg1CnorK8
         j8anmh+2Oib9t7V89NgvyyaJyibAfs7+xq5n3eglmyNwuZ/Dtj9PC5iDUrIw2adnj98g
         vibmfH1XjJohpwgMnxbqaDYA2pjJIcgpicOxi+F+mhf7wuC+suMyY+U6wOewDhEwaUtE
         5tww==
X-Forwarded-Encrypted: i=1; AL+hErGLJA53Y3CihfGufGNVynCOyuWNGOwQQl0Jv5qwMSqFWY64ruyaZORGNi46BfYZKNo0kuRzA7e5ImGE@vger.kernel.org
X-Gm-Message-State: APuU4Z/52xsqh+G/tgyiFh5yWUb0u+G+2mreCjmmveWgMOSopzi4hN9a
	oHlIVgrg5wSdhP0BZ5TMi1RnZjg9ri1iRMcx6Yi0CTHhGx2s+VqCmGFU6qU3ng0DDqo=
X-Gm-Gg: AZFdTZcXyiAnjDfuenglSDb08dGvhZVF1Cf03WDZmmmbW3R2XBEpScugTQEZq+hDjr/
	AFwfKdA+wRO4TjWOGBuDV4ljBE/Ug/XUyYDxO1UwBdogovLke6zkqixwHDQ+EG/fZLMChqOGJB9
	H8f8gjwBJJU8wURcCwhij/kKMYh1dZZD4uRFbR4xuCYDKxWWAaZoUamNjOqOxSTigyc3vYZz2tp
	Wp85dSiIZ0/eAO40Ck9jM/lWv+VU6XGcK6OH0pIReSMZBHHntjLaLrQuJlENzW8fmlUtoIBtQ3A
	RbCGJWvCaubRFtCmURdH4S16i3I7PL75KR9MRMQTUuiF0ORQY/cKf3YiCb4IWP0fhRjTHcNMHsf
	vSezlceqECMJoDSUbymgIR3DZBRqmGiGsCwE1nsmK6/JTf1HMWfADtL6l+K14odc+ZfXkEB9smB
	6r3uCB+QW1UewdV+l1jmu+cQdQVrGwsNgIlJ0EID7JPDKuto4nziN3kiZRmFPbEpaJH5IVoXG2C
	WyiX6UErLQ2ecHC8aEfdpoHSmS0FJ1EuFYHW1zKdgpQHUCNu+rWHKdY+veah9BHvYDjcT65bIqo
	C1BX+LIRL6f57UMKiBaiHB0YP2PaN16BAoPzbRRGH3ja9/5HYgnssyS4U1vGk0Cyj+L7i2kD430
	AIwhicFjpQHAMdmFYtTaoiw==
X-Received: by 2002:a05:6000:2883:b0:4a7:a52f:a2be with SMTP id ffacd0b85a97d-4abb3678d88mr30767537f8f.13.1795616625424;
        Wed, 25 Nov 2026 06:23:45 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:45 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:37 +0000
Subject: [PATCH v2 5/5] arm64: dts: exynos850-e850-96: add soc thermistor
 node
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
Message-Id: <20261125-exynos850_adc-v2-5-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sam Protsenko <joe.skb7@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3

The WinLink E850-96 board has a Murata NCP03WF104 NTC thermistor placed
near the SoC package die and connected to channel 0 of the CMGP ADC.

Enable the ADC node, define a dummy 1.8V regulator supply for ADC, and
add the board-level thermistor node linked to channel 0 of exynos_adc.
Regulator is represented as a dummy one because we lack PMIC support and
should be replaced with a real one when PMIC support will be implemented.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index afef32ad4ee2..1abae8b9fa49 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -126,6 +126,14 @@ reg_dummy: regulator-0 {
 		regulator-name = "dummy_reg";
 	};
 
+	/* TODO: Remove this once PMIC is implemented  */
+	vdd_1v8_dummy: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_dummy";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
 	reg_usb_host_vbus: regulator-1 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb_host_vbus";
@@ -166,6 +174,20 @@ rtcclk: clock-rtcclk {
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 	};
+
+	thermistor-soc {
+		compatible = "murata,ncp03wf104";
+		pullup-uv = <1800000>;
+		pullup-ohm = <100000>;
+		pulldown-ohm = <0>;
+		io-channels = <&exynos_adc 0>;
+		#thermal-sensor-cells = <0>;
+	};
+};
+
+&exynos_adc {
+	status = "okay";
+	vdd-supply = <&vdd_1v8_dummy>;
 };
 
 &cmu_hsi {

-- 
2.53.0

