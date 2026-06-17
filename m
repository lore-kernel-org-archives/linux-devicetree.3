Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9AD3F5BC0
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700840; cv=none; b=U9Teg6hTcCvGFLgC+xzYAlPS+k+ylR1be50f5YDJl8zxXe70Kfis41Ws+Kz5PtYZkkLip5apTltg3gCvJrNvcuO5xn72TM2XaEzET61grPlC2FcMGiMU19xPAqBYRueLpe8DzITXdJoliU5VHQaIN8UtXJ1P81F9hPQKeXsQ7IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700840; c=relaxed/simple;
	bh=eKVA40zvNTnz2Uo8qfzsM6JC+f9Jz/GL+8yFunA9mRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1h2LNSDbgbk/ZEUA7pSEC71TQ8ZyQRISwGSx97mH9WrFRClfJ8PHWpzyyFvX13Kuvq4GyTYUbBOkOqvWumpSPIg0aQZ82fH8scXgGC2gVLmcXLSSCqN+bxIRmq8ZNBYEAoQwvhCkvpMQOn+BGf+5mqg0LHE13JqcHA7Ok2Gq3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmKTrhqa; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jmKTrhqa"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45fd464d51fso3388926f8f.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781700835; x=1782305635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cmlLxSwWl8MO6GOSzERJUakH1AulLYsReRHOwXA/jA=;
        b=jmKTrhqawcDnpwYXAt8Y23qwFMHx42Aq/E0JHdGiJ3QPn1MiEPr0Bvnc3mfMYLesso
         i3MSyvj4tWJciKPcT0U81FbBZqpD4fLLXyNJdnL2hu/MPwyWdqHiiuiiT3TMz4ZyYAEg
         9LYG4VitUSOpvk7wmGnH/tIwMkbyFlR44lQtJYdK7Tehb7FcD6mRvwS2nOkROYgJSG3u
         8W28eE6lYep/ZhHp2ip6vGsm8Bkhqx3DW+IMtUt1Ius+COZ3GJ8cY2dMVF2A0JETNMsy
         693k33++iUcC7I5C1W3vvMa1yPV/GBw+XdxbCm4bo/PytATAT9yiOp5yBK8xkTivI3G6
         2NOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700835; x=1782305635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cmlLxSwWl8MO6GOSzERJUakH1AulLYsReRHOwXA/jA=;
        b=qMt3QuuODa1amilhKja77kYyevjxB6F7CO/rGQ4BASnhMj7WBg/BOOUf/J6yfGPR9M
         FqUxiOkdQUgNiWUXxzQ7CIGbs16hz4Jd0FPi+uqzo5n730RzrNq6HdzgrF55HiAqlHdq
         f6AAgw3Or+IG0zydKOJMO57QwUCD/FoxGeoHJ2shgSqoIYjxrB+B7R9GOPmmuRbUpvIf
         YRYXRGavFTeuv/VvbjenScRgPnKx4VTzSysTTdPcAlwjdd4Y7B3u90t5OqhAf7B7yoRS
         Tvi6JduzlOJ2rcU1GJX7w1mt4ZvlZiX2RpnhXnMs3h1n3D2DmuEWrl42QHkQ6Ps5GCrP
         kGew==
X-Forwarded-Encrypted: i=1; AFNElJ8fUs4xyJd12jKKni0tK36KB9pcDaJe3WXap47piVSpZN2twfcEMARNAQm48Pr3o3UQK+Jxi/ek2mt2@vger.kernel.org
X-Gm-Message-State: AOJu0YwGYIS1rEsVyJtHM06iN8PTqZ3QkW3tdiaNTN7eMJwL8HHNUQ0l
	+tBm61UyoZ8e3Wkj2ZBPMEhHhyxVoO/QbfNHiczCS48iqKiCu00Jo6uzOfxJ7hH8+lEYeP8NEv8
	2Wjz6
X-Gm-Gg: AfdE7cm4UPN2IRBRT6wjQDFnfAGXwc2E1xqKQE+AavhdMEHO2ylkcUxGIpFcCy95/MI
	itFVsInBUp80ho1CZguSyMpr10DVj3HtcPNWR+EBPjOF9KDiwRcdl6ArT/Sx35Lvwy8wk5IZFhe
	BHp2KB/sBH6xsLh0xpWADeUZ3RDIhFBwwTi+WC9DPfTBOId4mULHLdS8pa5Yfole6bBKvLJvaRq
	gBPEVgI8XlhVJrYmbbgJvLL22DMi9Ga4NckDBY2YcqgXoWRQ24lw6xuh1Fpn4IGW6cX8KziSABz
	wX8RyiL2/B02xylURVNluiDIsbIZVSuVPD9hGhTz/tUUxiismy0ATbC0994oVnLxZPW6eFspcLW
	fj+Cr4hdwoc6I2Rn1JTV/VK+7Gmk2e7hJOvN02A+hZCXrVQYQOEfN3d9SAvN+WNAWbYw0WOLhf5
	khyyoT2e038OZCooE9B42/D682OKe6KJwaYQ==
X-Received: by 2002:a05:6000:43c6:20b0:452:75ca:3fab with SMTP id ffacd0b85a97d-4623955b609mr5441908f8f.38.1781700834871;
        Wed, 17 Jun 2026 05:53:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm9130562f8f.10.2026.06.17.05.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:53:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 17 Jun 2026 14:53:47 +0200
Subject: [PATCH v4 3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-topic-sm8x50-adc5-gen3-v4-3-4af9251731f1@linaro.org>
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7139;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=eKVA40zvNTnz2Uo8qfzsM6JC+f9Jz/GL+8yFunA9mRo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMpjb+D8IpVgXqP8M7eDR+LJNcqFx+CR0grv3wVMG
 qzc0g/mJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajKY2wAKCRB33NvayMhJ0egoEA
 DKQDDwklmV1808pb1ms/C7FrTRNJBf7F8ZmwMnzOFmlngQws3ykfXsBbtVDZ6c7yuJwVykXYWNDeXN
 ZfVOu+lmd1qh/c41VS4IYoK3IvBHSFUkq9iKgYt4Oz474W/sJTmhBV18uIWs4DQVdNwuoMcxgJZChr
 JssKd9L8ZLDoiVqRIVRLeXX/p0K3PDhOL6XytK2PJVz6eIbgNjmjqjrbvyg+37cTBOHqv27z2m6EQu
 KyMXfS2xhElfctRdI0e72UgetKfqUtd1B2DRYwlzYcC3RAV0QWJ/dFZ0E/lmfdvGCk2AUH5iMPDnls
 RkP60aK8KEaK2kEGLxf6s+dKofAL6hPL4tAkynyurgoiGiZ77bmBg5opi52d0e9YUhxaa48TITA+SF
 A8R1WyfmK0vwmGZJUVIuSRZZJTeV+l19129F8IxjYd4Co33f7FW7ehx4dzXR7fw9b4NnGrZQNVI3XI
 zriaN8/7G3rcqn2PBtCx0/S1cfgBvHUyxucGSzRWPEumlnY9QZ8nUBwYQ+9ot2Raz6QmNsZVFdGZH+
 egRdjpmEJcfoit4RG73dOAhZFOH8xil4Zh6PJpVOWVmpYZhOZ60/aJqLSizv9YglJ3WS68JX8BdoGg
 Btd9y5I86W5+t9NPpPTiKekIFeQs220OsdoXe/W28gL0FZvGSpTcifKij8PA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 277 ++++++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..f19419f63e36 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -280,6 +280,92 @@ platform {
 		};
 	};
 
+	thermal-zones {
+		skin-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
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
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
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
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
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
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
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
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
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
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(7)>;
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
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX6_THM_100K_PU(7)>;
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
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -1102,27 +1188,218 @@ led@3 {
 	};
 };
 
+&pm8550_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(1)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550b_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_1p8>;
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pm8550b_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(7)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
 
+&pm8550vs_c_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(2)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_d {
 	status = "okay";
 };
 
+&pm8550vs_d_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(3)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_e {
 	status = "okay";
 };
 
+&pm8550vs_e_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(4)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_g {
 	status = "okay";
 };
 
+&pm8550vs_g_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(6)>;
+	io-channel-names = "thermal";
+};
+
+&pm8550ve_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
+	io-channel-names = "thermal";
+};
+
+&pmk8550_vadc {
+	/* PM8550 Channel nodes */
+	channel@100 {
+		reg = <ADC5_GEN3_REF_GND(1)>;
+		label = "pm8550_offset_ref";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@101 {
+		reg = <ADC5_GEN3_1P25VREF(1)>;
+		label = "pm8550_vref_1p25";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@103 {
+		reg = <ADC5_GEN3_DIE_TEMP(1)>;
+		label = "pm8550_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@144 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+		label = "pm8550_msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		label = "pm8550_cam_flash_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@146 {
+		reg = <ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		label = "pm8550_wlan_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@147 {
+		reg = <ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		label = "pm8550_pa_therm_1";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		reg = <ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		label = "pm8550_rear_tof_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@18e {
+		reg = <ADC5_GEN3_VPH_PWR(1)>;
+		label = "pm8550_vph_pwr";
+		qcom,pre-scaling = <1 3>;
+	};
+
+	/* PM8550VS_C Channel nodes */
+	channel@203 {
+		reg = <ADC5_GEN3_DIE_TEMP(2)>;
+		label = "pm8550vs_c_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_D Channel nodes */
+	channel@303 {
+		reg = <ADC5_GEN3_DIE_TEMP(3)>;
+		label = "pm8550vs_d_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_E Channel nodes */
+	channel@403 {
+		reg = <ADC5_GEN3_DIE_TEMP(4)>;
+		label = "pm8550vs_e_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VE Channel nodes */
+	channel@503 {
+		reg = <ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
+		label = "pm8550ve_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_G Channel nodes */
+	channel@603 {
+		reg = <ADC5_GEN3_DIE_TEMP(6)>;
+		label = "pm8550vs_g_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550B Channel nodes */
+	channel@700 {
+		reg = <ADC5_GEN3_REF_GND(7)>;
+		label = "pm8550b_offset_ref";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@701 {
+		reg = <ADC5_GEN3_1P25VREF(7)>;
+		label = "pm8550b_vref_1p25";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@703 {
+		reg = <ADC5_GEN3_DIE_TEMP(7)>;
+		label = "pm8550b_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@747 {
+		reg = <ADC5_GEN3_AMUX4_THM_100K_PU(7)>;
+		label = "pm8550b_usb_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@749 {
+		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(7)>;
+		label = "pm8550b_wls_therm";
+		qcom,ratiometric;
+		/* use the default settle time */
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@78e {
+		reg = <ADC5_GEN3_VPH_PWR(7)>;
+		label = "pm8550b_vph_pwr";
+		qcom,pre-scaling = <1 3>;
+	};
+
+	channel@78f {
+		reg = <ADC5_GEN3_VBAT_SNS_QBG(7)>;
+		label = "pm8550b_vbat_sns_qbg";
+		qcom,pre-scaling = <1 6>;
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.34.1

