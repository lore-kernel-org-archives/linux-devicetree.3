Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F2F413D63
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542826; cv=none; b=S3XZ9//5AiZIsdu6D/ALEzgMpDz6P3ZMAxwRw+Ov9dXHJjOkgQBDJ/H3DLOM7ftNwKB0UVyNOPiV6/uMaruSTDbr5OYk7x1AbGotLXMDIsqkKmIHYG+rIzQ7G6GNTNmuot81zsxUijQkpzTenIYtvCJRJ5+cdcaRIKZP/B3gJvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542826; c=relaxed/simple;
	bh=7Buk+XmAD28wPFd3QRVJXDTQDGSbxG4184sLYoTRccs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwUAXjtAEuO3bw9BC+MUO+xTpMY8fzRyPr+O+ZvhBUjYaiXIMk4iFYqB3C8dUvAW9eVMrsvafKePqwTgBsgNyLO67ovtDCjnXJbNPUUFUFETqllHFGh0wYhE/oeGApHOmlOF9Orrwly6XP8H/P0SY8XOgE2NecZl4UZNi6A0ttQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UjGTioBt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UjGTioBt"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso35381625e9.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542821; x=1782147621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Bqcu9N/VSOuF4vgkF2FEBNz8aBSfrqpXELJ2jIGfgw=;
        b=UjGTioBtuRNPmUySGzYsAmtlDHFGcbtV8TnJ7fBgk+HpT+kjdnYirzJbLQQuKkfX4b
         7I/F0o0kHg6lvlPsjxe3kkkKHG0vg2LVTzzdwc4bsaPZZJEL3ADgW/9TAlE/YA1ZGU4y
         c3f6emcXHVlBJU6rDr3yEPQ+aQ1wgTVsZF7HkJ/LFfykOwpft620DIzmML8w/Ox8Xhv5
         jlB/9TwRaqoQodPver2IEMI+SUByoM87k9o9seYhQb36P8TedPBJSFOszkM+7YP6djzK
         J/ptTz0nPc8yV1kqASm4VYzeTdDokb9k5WbvEIHyUUqd8UK24Gtt1iWNBYJOeP4iVA5q
         nNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542821; x=1782147621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Bqcu9N/VSOuF4vgkF2FEBNz8aBSfrqpXELJ2jIGfgw=;
        b=VMoGpOxb3rXTPIuRrJ6xfydQwgLz5yfcgRXycC4cKaO73c92fouBl3cZMtuakoyjIC
         HrLcv8kQdQr9KHPhFXA/Wyeev6WNWyatxz0+QZZm6zd1m8TKFLZbqStHlfZPfybhU5Ce
         EnAX5cEflp4l/ACAZIsjZmU0cEw+dkbq03K/nUARCnBAPrf21jDm4wafu2F8svWQSlkJ
         Fzdfnffm4FMaIv1YQoAZ5g/eOdkITecROrK+h9LyQl+/WlneF4CBMX1k3hkBl0uA+IOj
         8+cla8wYtKV+szsdB0YhV87HQdMtdBTDrGRPWWvcnq8bEC7QxmhxjeHxRo8OvHRGmRWE
         Z5nQ==
X-Forwarded-Encrypted: i=1; AFNElJ/i02r14z+gOE2JkIHVjUCZkd72GoOD1i4Sv/eZGvkoomRSLPlC2r8NuEyH48LRLtk17VkL99uHgeo/@vger.kernel.org
X-Gm-Message-State: AOJu0YzqfJhMvaSO7DWKYDvlCGjQbGiPTDII7ctb2LQQ99nwdlBbPecH
	yYHcV37uzt5Dj0f/beOyu+/8zVDUVPIp/+BLxMjnRo+KbKu8OkujlN0cIIZzJ4lg+d8H8qdUNAA
	/a6ZayJs=
X-Gm-Gg: Acq92OHWRdMN649dHCRRdKpabZp6CzbtIZfx2wkMDJe1j/jNvPtFP2DFZbeBzZLFXjo
	rBwxymkv5ldvYk1SySgFo6f8Dssmz3aYxreqg0fHm04Zurt13c1tb/hYVvO2MiPcxP1M0yFKIu6
	l3zHs3ntesToYBWK6Tnml9QGWBX9sc+7LRg5/XlbrG9tfk4q2CXQbWuvlPzzFTCFt1rMEIYH4zM
	PvgA6H6Y+ua8RX26cNkvpHUszfqurl13AdFQ3WvRZmg8M+JpcPZVRPSFRRm13b+iEa+ev4O9yvd
	4CTSSimoboLfz2P9UqMMOj571nPv7EApxo0iwXPS9DWUkIOigU6hTTSNqOY+EWDjeDeRldNUxNk
	4ffVRZkEXp++aPhgyPfx3V6jqSVNmIld08XCawNr9s8IS/ooXuiOX7rPDM8mhmM+47cWGVAKuwe
	fx1FmHUTyg5IPfRtylD7M73sN+ZxI01RsYO3iXw1+Lkp5PsRgZPbl9/6I=
X-Received: by 2002:a05:600c:810b:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-4922fac1214mr5310885e9.6.1781542821276;
        Mon, 15 Jun 2026 10:00:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47d1csm5716425e9.4.2026.06.15.10.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:00:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 19:00:10 +0200
Subject: [PATCH RFC v3 4/6] arm64: dts: qcom: sm8550-hdk: add SPMI ADC
 channels and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-adc5-gen3-v3-4-216a2b5ccb85@linaro.org>
References: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7686;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7Buk+XmAD28wPFd3QRVJXDTQDGSbxG4184sLYoTRccs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC+gxaJ1j1Z6S9Yyr/iHcOsxgSOM96LOH7gV061q
 21GxZGKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAvoAAKCRB33NvayMhJ0QtjD/
 4+OAn/S640ToicqX3fG8dsktpl0eB0w4XJpCjssQYUagUXQgpHVrpLidgdJqq7on0mLSCZczYytw8W
 Umz1ZkxRLO3RmedISFOBgpHS1ifhl/9RiY7yHxaCxyilZzcl/Q3Hvu0yS3H3yav92KJZ870LpIDHEL
 URJwx5XpMJj3rt2ZUNGaEzzaNpH1vwECCVgM7JC6AZ+ckNSrjX6GPllJrYzbn6G7zKtzFYKfjj/HY6
 o2gsRzP4sVJMsKTDxBnCMu/oRu2V6l/92sH+u5EfNJObJHg38ScnLOLgPoQThUNCuOtjT3RpWhsROc
 OlJw+lDk78ZGxtNBvtg9EhRaKuuEIaBP6n74otQ3F2cSYIEEFAeux3uKMg/AN8S7wKibwIWZtLrSuD
 qqA6goBFePddwmE8sQ+i4i/1YamjF0PPCz4KRwz9CslaEkZC7BIopxMeMeGWCBPHZCCBzJT66a/XFr
 YT4yWWMuTYqSZT6DCPJ8d7PqSRFvtipacLm1Euuvu8QXk7uuMaF+ls0og+I28R+Pbo1gbbPSbjjE0A
 YI38/ec/2Wxec/3BcMjQH1KxYd639T0mR9x2+nLk2juv6PbGDOMe1rJK69Sujti5+zL2w2XsyNb6FV
 CKg24Dderd6Kxzq73UJHfwy4MxC7obUsI3TfvjwuCfe13Kay5D/TnPHfI2EQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 279 ++++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..83cf48a623fc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -16,6 +16,9 @@
 #include "pm8550vs.dtsi"
 #include "pmk8550.dtsi"
 #include "pmr735d_a.dtsi"
+#include "qcom,pm8550-adc5-gen3.h"
+#include "qcom,pm8550b-adc5-gen3.h"
+#include "qcom,pm8550vx-adc5-gen3.h"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8550 HDK";
@@ -280,6 +283,92 @@ platform {
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
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -1102,27 +1191,217 @@ led@3 {
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
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.34.1

