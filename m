Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416D43BFAEB
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 03:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790824164; cv=none; b=WuCHD80vpTaPwk51UPmXF1gq9seMjW/iwHOqDiZ7Q1RfClpaITENXHKfRvcYYHMGMf+6TD7PZIYgqyfYNsQGUsiiHw9JoHGg9Y7p+FrXDIr6U4cnOrGg52ge4/WXPPn1ugLlFT6ZHUQeqcfLCWqDifACHuFa+CBlWJDJpamzNEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790824164; c=relaxed/simple;
	bh=TteloVrPTotS9ygm6D3WqNqunfp6Ius4z2873ee1cEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KYSf/N8Bkveb/zBE2TG3ugoYXDR8FjezoQCbIsNjEeJP0xFdz6qx4UUbL8CxBpvFxCQ9w8Zi+SbZALidFCF0eyg8MuXVs3D9rcew6J6iKYxqZMX2FRrHrtL1Z1iTbRShGXFIlIeyNRazxvNOhfOKn54J2NO7YE5XGnXT/lARtrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MxzD2x0R; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MxzD2x0R"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so3656406f8f.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 20:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790824159; x=1791428959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXgwDcjt3oL3FBnIimeVJTsO9Athy2H48105XxaThRA=;
        b=MxzD2x0Rp8Q5suN6X6U11zZ/eDuu52iIPSPvPb8996hMi0UyxyX/N0do+CAX6JFrQb
         df3rYdRscie+KVxE2ovoJgpFueOYU6fJ69lZW6YiLGi77+F2ot65mTjj/E6T982vZbmK
         teECSrZbowk3hp3O4LrBOK3dzmR38JK01lA4JSpiG8abw1P3AoqVAjyEWb3eCM+Hdz8l
         CgxlxVljNOrayJ0UCgARI14/Pv98wamDXYFnENtCZKWZBUFWRKAoFrJl/+reZ+Z/VPMI
         J8gpqyT6qQNW+2MT/fXYKp8ChAn5efOZJt2lVLLoOyiSLNKAVenRFi6e/dMGP41faQYK
         KghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824159; x=1791428959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXgwDcjt3oL3FBnIimeVJTsO9Athy2H48105XxaThRA=;
        b=yzl1Jb+lxlCJB1+0Ohgf5P9n/yzka+aFkR1L7Zdn7O6HdxKqpu3/DAxRxTHGbGhn0n
         +O0WTh+HrNzm+glFZzaikyndePlZ0HwEka/2/xwmLcGM6M4DnzY4IXNeE0I+W7XsQmw/
         /CmT81GzNVxpD4roqGylFFVtIX+2XLHp654CTqQhKTGqWw0nwk3ONkzeI7eBMKxtrl4R
         jjC/ZWqQyZeEYarN/WCZ+ba6ylKnxl6M3F9OVkBNw25R0AHl2mVdzvlTyBQJ643Vi5oE
         /EVizMEvJklGGkKXw0ZSdOQw4If0WJ1tiGLRkVDjAN8eXhR2yXLgJTOm+vXeWuxtQ1zY
         +uTw==
X-Forwarded-Encrypted: i=1; AKwUvBx+Rxsz7Ntt6niqQLmODbAUXmycq51nKy89PMRFs93yH/n4OlfHJfZj94HKjw2l9P7WRE8K/O0p6yGk@vger.kernel.org
X-Gm-Message-State: AFuF++mvIZU/9N0Re/nNddJbGbgQvOKfHhWy9M8sKXIiyFht3jKMakto
	hx+XnaleDEI4X9Iy9EDx/HhDgtLZOZfWwbAol4paOkTETEXV6JJy8L83BMYfKVNPwm8=
X-Gm-Gg: AYBFou3Ed2KUJWkG/1iu7tV6hrnymFrffZqu8rdrVQfTn732Go6fy2fwqECrE9GsEeC
	W8ItsndaqUayIY7jO3xkLWfcIe5xiQNd14HHFJHPKoqU0uakPi/tnBCeAkqka9b65pPuC74rQI4
	hDJRgoGg2P2HWzio+sMbichuW+8+sWkqWLMZR3fMsiGShDwxBWywRU1Q3CPYuHmynVX1DLsu5yK
	Vx3ChgYX/1cpRaByvAQPde5Fit8blTvuACQWQt8klObSeQ6trL6Tqjcl+zq2RAT7UZJcRUYG3VK
	BgKnrUNCNG8lo8J3Wk/igI6AYEHXOspjZZBHRchK2D/x4onmNo/iQzFDfvbW3YEr/afmGiv+NWx
	j0wVTZ1+F5/etyxyFG/hSmR1PmJwQmIKHwPptInmEp9Rmi2m4xv4Pzqf+kABvO9fh0a+DmGoPWd
	VLMIxeumAIoJg+OWUgHzzkSORUTdH0WT3gSRZNt5PsbEMnDLzVQIlccCDX1m+/3fC4sP/nSvIHu
	DWUeOGVN/Oec+k3jLAqiRkuAeBL20CdgVcZ5+FBl+gGCxerR9xKabyZxPtFpC4JC9+b7IbA
X-Received: by 2002:a05:600c:8b5b:b0:49f:ffd0:9a9a with SMTP id 5b1f17b1804b1-4a01b12055amr52287295e9.25.1790824159423;
        Wed, 30 Sep 2026 20:09:19 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9145e6sm27091885e9.5.2026.09.30.20.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:09:18 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 01 Oct 2026 04:09:15 +0100
Subject: [PATCH 4/4] arm64: dts: exynos850-e850-96: add soc thermistor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-exynos850_adc-v1-4-791b3516bb9d@linaro.org>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The WinLink E850-96 board has a Murata NCP03WF104 NTC thermistor placed
near the SoC package die and connected to channel 0 of the CMGP ADC.

Enable the ADC node, define a dummy 1.8V regulator supply for ADC, and
add the board-level thermistor node linked to channel 0 of exynos_adc.
Regulator is represented as a dummy one because we lack PMIC support and
should be replaced with a real one when PMIC support will be implemented.

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
2.51.0

