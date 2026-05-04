Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D0D3E024B
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912205; cv=none; b=gDUugT3xek3HVCEgAA8WGeSdY+eXBBCiHI6KCzsjXPuwy/5HN05p+grkn0+M7v07mAwzK/ssSlziwrJAe5rN/zEwvMIwoGih3thh+k01M7JqCTTV5zGBpuCrA6juIEtezT1JiK3M+GVY5tX8vMLUlYzUZyymdGUxpeSAgxlSKNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912205; c=relaxed/simple;
	bh=/ZuiDu/G3WU1/Gf07Rd3eeFcsxRLQ1t+nKgIPYDHy0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZnYac8ps4fKn4aTQ7gia508nNIhX6YV8Djq84+6z6oFsrkyF6R3BtQZ4jLZHmwDV6QD4fcizm4tsG8tz92gIe/xL0bT9kZiuViPogMCBEDCduJqzsdU5iFvg1JcojLLh5fTZW/8pMPLO2JtU6Z6W0Fql86uh3vLNk7TLBzOsIXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C/Gjwig/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C/Gjwig/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso48726965e9.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777912200; x=1778517000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIeCF4WBDw12rg++qmEmRbrnoO4qegsoW5hTZ+mVIPw=;
        b=C/Gjwig/0iXw/bnXssDKGRqg8ti/xx9iTFfX8mkftLiR6sgZoz/y36m3Vql0OmCdJG
         q/nh2mAgK30qLYMr8VA1BTZ+wqC8u+8DYyz45GrsvnnYOJ1OpKPX7u4IaSELGQfXU0lq
         WLP4mPi1l7ceCZQ0c84gM/dIDllFKIc+lFWXAuNoZp66366NRYuH0MgSJV8vtWASt5g+
         HmAT17m51keyy1u5yhZh9P6kj3UnX1VmZYbs9Dp9y6+SpyWuGj/zJEtO3mQlDpA8EASs
         p/vQMIIhxudCBwZ5/2j38pQv+U7QymcTWpVXJBt99jpcUaAYGjtSyOCxNMBO+h4sEh3r
         7YqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912200; x=1778517000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JIeCF4WBDw12rg++qmEmRbrnoO4qegsoW5hTZ+mVIPw=;
        b=Pt8baK+FECkRcldPxbwmym0smP60RTdavA2zBTQQgPjOC+Nd3c99WRIfLfYkxR99XX
         nSyTz/UJyT7XRzBw9LEDqPynxNVj2rYVrNiqYymXSKur3+4JjWAOH1xPMK2Hj1ott6XK
         hZzcgLQet0t4gC4WuN+hi7iJ40yEf3PE9dQscU6Wvx+ktGRWJJwTzoRqNwWsQzlYymIp
         lvUY8x95lMsRH+2Jqx3/ko8QMa6ndWBumkMah9lmwhmV9J23ZLJBYr8td0w50WGiwXDi
         6OGF2HprZC6SMiuDve0jf7fY6fVhkle9pmofXznPVt9j5H3T2PIGNA2clywia+pOHsmD
         6uMw==
X-Forwarded-Encrypted: i=1; AFNElJ+lIG/RaNJzXa1tmjKpx1093FSwjprbcAAE+a0+Yh55V39N27uSvBebh/BABqy5vYJ7MLMpwYjwUKgA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3WSQDWgMkTL7UzLTrtUkImR3Cyk9lL4KZNGe2Os3YTfSoTHKm
	x1MOD1cQ2W/tbZ/MwysNeRzGL73b/Hp3FkTuBX4DsJKhASczVZPgid0NAbWuvLJ38N4=
X-Gm-Gg: AeBDiesgMX0JqxLjNAFH2HaEj8KoddwYV+nj3q4HH3jKlm/FNf0C/bqGcfTVaBpDom8
	7n1jyfc3j4A96oy3Im0BWsz6/1KI3oeckf/jE8peQkDmfaZGjRIrlLSwHZWuTQvm1+nKN9bL2ni
	MfUhBx9CG5N9uLJI5BeLtcjAfPNPzqR6dL97BdXZiwqbCeFgc11SvzK51vax6F/Uy3UyBHR8Vkg
	Kct0g1exwxGUo2VXLgn1wnWbvXJiT7nig79KaM5wQPM7j33+Y7xjr+cM5X8p5UOMrvL05fSP7dF
	yD552rMZQmvZbEbUTKk6SilBnycD+0xzqCgHZPaF3DLFxCRONdPS799XWXyz9vQiW4k2GqITh3Q
	tU6WACKM92FuJcqRu4m3kMcanmPriG7VpD9pTeZPCH/H2wbFs+EC+iGxW2NlrCpojhoDtLtx1il
	j5szgywaiehJdl7FU9k0gU8G8d4QkY7IauEU0dk/a7YWfmfmJxyez91do=
X-Received: by 2002:a05:600c:8b17:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48d1426cdecmr3612265e9.14.1777912199737;
        Mon, 04 May 2026 09:29:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm405071055e9.11.2026.05.04.09.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:29:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 04 May 2026 18:29:53 +0200
Subject: [PATCH RFC v2 5/6] arm64: dts: qcom: sm8650-qrd: add SPMI ADC
 channels and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-topic-sm8x50-adc5-gen3-v2-5-5cc04d6ecda0@linaro.org>
References: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
In-Reply-To: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7632;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/ZuiDu/G3WU1/Gf07Rd3eeFcsxRLQ1t+nKgIPYDHy0E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+MmCTLQYHBciNJtWz73UCOEmysuZft5Ujo52XzR+
 PJkzmp6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafjJggAKCRB33NvayMhJ0WWCD/
 wPTk0aJP/c2f2wJ+8yu8/eTU66c5n6onriVXniuIekr8DhNc8aJdi573fmf0B4Wb9czljmXRtteUjW
 8jH88+Qbp7GH8uBLVF9Y2tplyHCpFu1naGEMp3bq3mtr5PQ0KMAXHUojRmfySQj8BXxKWC+vFxjmqT
 0EUbSjZhRYmEovCWK1+9Mo4zAMqDF2QOaADXncNZJ1YS9ACJKhT0VEX50nl9slr/5LwedMn5m4ii4m
 PfSksJ+9vvPZq+tM1iHnhNax2iI4AORnovFXLJsobXsjaqsq3QFFH7+BQJvedNKI+oTFgpD6IZn+dT
 9qBnPNDrTI5s4zOa7Qkd9lxhA4864RNXI78LwdI2viXSrbsWFsIcQ8jgHLFurm+Eou7cPb+RYydQ4D
 Xt0K6OGdbW5xV5Y5dhX/y0WUnQ8BVcMwalCRh+8NCP91Qf09S5ShEFcsFu4kwtzZn9yz7rUBO+93in
 B8BBzndMQyECFkcgecWgM+sEA0SMsdmnHeXAxezAeWucUMfJkyyObu6DMGqWbphqsFRfrUUDtutHCf
 1Bb5f42boY/JVK+cwRdU59DhmSHWzU97V8tZXA/OxkPFY5/GZDTWg+vOuivSUlH0uXv9W+ZjTrVcRu
 Zvm6yw1t9kaW7m1AWFABDki4rV5WNMitRBALZfn9hCkVGF9iXXhPVRGT806A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 279 ++++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index a3982ae22929..0f5f9e55586a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -16,6 +16,9 @@
 #include "pm8550vs.dtsi"
 #include "pmk8550.dtsi"
 #include "pmr735d_a.dtsi"
+#include "qcom,pm8550-adc5-gen3.h"
+#include "qcom,pm8550b-adc5-gen3.h"
+#include "qcom,pm8550vx-adc5-gen3.h"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8650 QRD";
@@ -158,6 +161,92 @@ platform {
 		};
 	};
 
+	thermal-zones {
+		skin-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550_ADC5_GEN3_AMUX_THM1_100K_PU(1)>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cam-flash-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550_ADC5_GEN3_AMUX_THM2_100K_PU(1)>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		wlan-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550_ADC5_GEN3_AMUX_THM3_100K_PU(1)>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pa-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550_ADC5_GEN3_AMUX_THM4_100K_PU(1)>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		rear-tof-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550_ADC5_GEN3_AMUX_THM5_100K_PU(1)>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		usb-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_100K_PU(7)>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		wls-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(7)>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
@@ -1040,27 +1129,217 @@ led@3 {
 	};
 };
 
+&pm8550_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550_ADC5_GEN3_DIE_TEMP(1)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550b_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_1p8>;
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pm8550b_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550B_ADC5_GEN3_DIE_TEMP(7)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
 
+&pm8550vs_c_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550VS_ADC5_GEN3_DIE_TEMP(2)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_d {
 	status = "okay";
 };
 
+&pm8550vs_d_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550VS_ADC5_GEN3_DIE_TEMP(3)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_e {
 	status = "okay";
 };
 
+&pm8550vs_e_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550VS_ADC5_GEN3_DIE_TEMP(4)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_g {
 	status = "okay";
 };
 
+&pm8550vs_g_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550VS_ADC5_GEN3_DIE_TEMP(6)>;
+	io-channel-names = "thermal";
+};
+
+&pm8550ve_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550VE_ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
+	io-channel-names = "thermal";
+};
+
+&pmk8550_vadc {
+	/* PM8550 Channel nodes */
+	channel@100 {
+		reg = <PM8550_ADC5_GEN3_REF_GND(1)>;
+		label = "pm8550_offset_ref";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@101 {
+		reg = <PM8550_ADC5_GEN3_1P25VREF(1)>;
+		label = "pm8550_vref_1p25";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@103 {
+		reg = <PM8550_ADC5_GEN3_DIE_TEMP(1)>;
+		label = "pm8550_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@18e {
+		reg = <PM8550_ADC5_GEN3_VPH_PWR(1)>;
+		label = "pm8550_vph_pwr";
+		qcom,pre-scaling = <1 3>;
+	};
+
+	channel@144 {
+		reg = <PM8550_ADC5_GEN3_AMUX_THM1_100K_PU(1)>;
+		label = "pm8550_msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		reg = <PM8550_ADC5_GEN3_AMUX_THM2_100K_PU(1)>;
+		label = "pm8550_cam_flash_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@146 {
+		reg = <PM8550_ADC5_GEN3_AMUX_THM3_100K_PU(1)>;
+		label = "pm8550_wlan_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@147 {
+		reg = <PM8550_ADC5_GEN3_AMUX_THM4_100K_PU(1)>;
+		label = "pm8550_pa_therm_1";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		reg = <PM8550_ADC5_GEN3_AMUX_THM5_100K_PU(1)>;
+		label = "pm8550_rear_tof_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	/* PM8550VS_C Channel nodes */
+	channel@203 {
+		reg = <PM8550VS_ADC5_GEN3_DIE_TEMP(2)>;
+		label = "pm8550vs_c_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_D Channel nodes */
+	channel@303 {
+		reg = <PM8550VS_ADC5_GEN3_DIE_TEMP(3)>;
+		label = "pm8550vs_d_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_E Channel nodes */
+	channel@403 {
+		reg = <PM8550VS_ADC5_GEN3_DIE_TEMP(4)>;
+		label = "pm8550vs_e_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VE Channel nodes */
+	channel@503 {
+		reg = <PM8550VE_ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
+		label = "pm8550ve_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_G Channel nodes */
+	channel@603 {
+		reg = <PM8550VS_ADC5_GEN3_DIE_TEMP(6)>;
+		label = "pm8550vs_g_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550B Channel nodes */
+	channel@700 {
+		reg = <PM8550B_ADC5_GEN3_REF_GND(7)>;
+		label = "pm8550b_offset_ref";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@701 {
+		reg = <PM8550B_ADC5_GEN3_1P25VREF(7)>;
+		label = "pm8550b_vref_1p25";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@703 {
+		reg = <PM8550B_ADC5_GEN3_DIE_TEMP(7)>;
+		label = "pm8550b_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@78e {
+		reg = <PM8550B_ADC5_GEN3_VPH_PWR(7)>;
+		label = "pm8550b_vph_pwr";
+		qcom,pre-scaling = <1 3>;
+	};
+
+	channel@78f {
+		reg = <PM8550B_ADC5_GEN3_VBAT_SNS_QBG(7)>;
+		label = "pm8550b_vbat_sns_qbg";
+		qcom,pre-scaling = <1 6>;
+	};
+
+	channel@747 {
+		reg = <PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_100K_PU(7)>;
+		label = "pm8550b_usb_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@749 {
+		reg = <PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(7)>;
+		label = "pm8550b_wls_therm";
+		qcom,ratiometric;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+};
+
 &qup_i2c3_data_clk {
 	/* Use internal I2C pull-up */
 	bias-pull-up = <2200>;

-- 
2.34.1

