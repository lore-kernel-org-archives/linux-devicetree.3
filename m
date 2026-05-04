Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973513E3C5F
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 16:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912203; cv=none; b=AGRSMbB9aDkXlG+UQY4KHEA1IZZb+EU4Ky4MmIXXYZNtNopu65z51bxj2LSRQa0KsyyR20+GOhzUeBoCGizR4loPUyeCASCnPU07BpNtIBV+GOkn06T5WWDpp7HuoT0Srvd7J0q0k+59iEEdLxugk/bawQdbiNLX3nziPQVwzi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912203; c=relaxed/simple;
	bh=Atk2z0K3rltJodkMMQi70Y9UqqQouKf+wKkF3AgV0ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPdKOZEx1u6aLCU6/LjmuFGWJ3Tm+RZBSyoWFujruKod9J4e4zKGHCfp7b709rJALj4SO+sAk4tfFdJpirJ/R389iHJTgzLBwVpoaB9qt8tmJKutXbmC2LyHOqSPNfIYU2joHERhWSp42kko2Ak2AeQtr+MO7JxQIIR8PynImcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SGwy4g4c; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SGwy4g4c"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891cd41959so34536475e9.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777912199; x=1778516999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5Sv1SZR8s24+7zvPiaalVQbI/wSYYoYNIlU4Z2+kIo=;
        b=SGwy4g4c7saqrd016icuDqE/EuXUorC/CFmFA3j52Fbau5zqoJjaNnFXhTkZc3Ibq5
         NRgDJhKiWx9CYcYOIagE/IO0L44hvPVvBpmhR08uU+y0u/nw9HfKMU0rg62bIuLrq959
         OPma7AA2oIp78mvZWcPLtrBGGO40/n78d5ZkLM0AU5L5ANcknFd5THTVD1NOHw5WSnL2
         mGWb+iKYABiTH7dB4NLSzoW+jZZXUict3mkuQc88rWDspMGupZSMECsOfrnt7OqcqYxF
         1SkkwG9BnS9+fYr2AG6SZsDg9rOQgVX/BHuLANWTS60ko71kxZCL64CzSyR8FPyZP4mB
         WZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912199; x=1778516999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N5Sv1SZR8s24+7zvPiaalVQbI/wSYYoYNIlU4Z2+kIo=;
        b=KOkGziK8KUv8YbtVJfdW6OFZGqqoeJTeizxqKqFupBaV5N5ruk4gVRhxqcgyejhIoG
         Y3a/YlzJfQqzUsv23ht+LwZ/vUI2DPnVghzKQixMv42VCPq/Gi3sZHQw9bluMu/vIDQ2
         NvCC+rG9Q37k7k2FaNKcyJFLF5dQIUwyBt/sQzop4gqhjsVx1lX5LZO4P/4MYzpeXE1U
         dV1q48T7dz4+5KbNdd7jvMcZFbSSqVFlR97UAyG9nHTdAdnQksiUeif0yAMp4pYKMXlu
         OJ3hrv1oN9CYoc2ZGlx+VWK+yoF0QLddaOvG8YEViLsXoWlfan1CmuV0vMhioRxBezqu
         WHEw==
X-Forwarded-Encrypted: i=1; AFNElJ9ngwmTgDegSSLbAdKUv5+XZUmtpMPDqN4JSCYlgX3rtVP1ygvDgihuV0lgQY8k8jjnFOo+OaJeprnV@vger.kernel.org
X-Gm-Message-State: AOJu0YzOdqPU/Djl2ktb+kJZezh9fjS0qcrkmwN9ujOqkRaV2f89rC9d
	+hRT/VHMEFogbdKQqlVdrcJ9wwpD56DLWpf+z/MEz570f4Ns3HwY6qEq1GqD1+ojV/g=
X-Gm-Gg: AeBDietQvfat2vdq8tPDUGEF7YME8KCakD1hTEvJYIsO8tsQmbf4dWhzpAfqCz/MkWQ
	lNXfPIKZKz2IL9y2OLLH0XU0SkPyWsSxwr/nX5G1XTjR0ZB4FVBQerpamPtwi6LWtiGUY9fCFwA
	4Gz117g6R6XgloWSfMIPo7BqtXKkf2oD7Uzb5u4Q10D8Fx4V1zlefBmnP/OiHdJIhklfM8/5Xdk
	cH7h2hEBRwg9J9tjczAziY6gNPYB+yoUvjL0NXDMG4AnnT53J8JHfVc1Ombo58PHpp+q/ct49qu
	N7a9r+s02J8FkUN/fZQ5MGN7UBsSP/KdzeJHjViUAddPV+CYFdE5Y4oJH3LDbMSkdM4UTqX6Nzs
	puvcsmQcOONehkLDfVc4hfyTEjEXZ3ezOXUHljMGK2AEg+SZcab13dpuTZ9pAEKiNt3GVzXiqoO
	EcjI6w+qqHrvNHnKlfhcAz0rqxcyPrZsOnhi901GmAvm2uKCr8uAimKpk=
X-Received: by 2002:a05:600c:1604:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-48d0562f7efmr58942605e9.27.1777912198956;
        Mon, 04 May 2026 09:29:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm405071055e9.11.2026.05.04.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:29:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 04 May 2026 18:29:52 +0200
Subject: [PATCH RFC v2 4/6] arm64: dts: qcom: sm8550-hdk: add SPMI ADC
 channels and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-topic-sm8x50-adc5-gen3-v2-4-5cc04d6ecda0@linaro.org>
References: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
In-Reply-To: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7576;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Atk2z0K3rltJodkMMQi70Y9UqqQouKf+wKkF3AgV0ZE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+MmBUFQURCpqj2UjtdiTp85q3iB29RfKMD0CBPDi
 U1hifqWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafjJgQAKCRB33NvayMhJ0TAsD/
 wMBQTab4c8EqifviCfukiU3MkZJyc736LQnz8NYpQXSVq8oBLhSDT8+hh9Rnehct3Ik3i8cnvNrOL7
 E1VZuCCXjD1+Oo32UBRJ1lWOA3L/KU83/1wuz8HGBsQevXeoJY0TPxPoC6VvF6oETmqyMREGbMFiPG
 1eOG5C2ZenpCQaUS0nbTpvYkpG/s4sQ9XIw4Dw+6rZJNR4ei2Ex42ef22Lk145yYETTHV5zDXXtGHL
 xL3z+inN8IdhWLI5Li+1GpzD3RPG3/kXn0iKv8co/KN2AqrqPssLpCUUCVaOhbOI3hTSuqEYM9rxHF
 vWDVhuH+/QuQFABD53/lWmfjqfGXVnwia4ABMoJ0VYshrV/cAiOcC9ThSNnB71civgaQn/zUZw9WtL
 E39V5OotQ5ngOjAta36Pp8L2bP+1U2Egl7E+fRH2tvBcOr7SQHchG9UQqP43mK5uCbndwvjg0IYfqa
 jpLTawYV83b8HwEpDoFfNwbMQSJcwYX4tXNb9eMov/WpHET1EwP7hdbeCDvhdsIKjLrICq5zZpUSlL
 L0XWJodyTunvlurlcgOg4RMXxoVN0d4JW79/5xOsnc5c1Y+MMX9JmZYg/FnPywmpJ2YVDlg0phX0Tw
 btBaj2jOT5wqZfYJXOh2FfRZhrgV000mX5XPOh0xcp/iMDcDWai7ExZQscDw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

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

