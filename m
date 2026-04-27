Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F71351C2A
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306518; cv=none; b=HBkQnY6wZQ/aHRACVjvzheW72betFyF0/GwoyzseFBOLvogkakL4mgaEDPnbPhXemr4LoKAVnXZwkiTTTgN8DZCzc8ac1ujxbAu1biUmNVuiOHqxyJjZQzHSwEAItVw0UH30IISVBRgzRjVdxGejvSlWiZndILwkJ975bhDkq5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306518; c=relaxed/simple;
	bh=gh+gyyibXVgmz6oKLPN+g/HIIFQnoruH6nJZZLk/vMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5ltQJhFcyITVk5p/GJnDAKOiWY1DDl92Ir/pUG+5wnZEmmzxRKC+1UbB+RWYYFSQko7N8FDD0xSifiDhqwAlcvNeIwILMri+Tg5IIUZ42FKNwmQZ9SiPqeuOw8zpklyG58acf+7k+nT5UoepU+waNf8GkFV6eXifHT1ir7sN+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBnZLave; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBnZLave"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so137406415e9.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 09:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777306514; x=1777911314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7nHYFe9E6eacQa3hEJLzgoVLJqj03Ug6IiFcdL3B3E=;
        b=sBnZLaverHYKfmio8i569WoYqqoQkndadL0CZgbd4E3tcbdo4EHeJlsRE88zVaJUjr
         drn5ZU0ubv89e+Yt9PTSx75f48641ee/UGIfl+s8hfsetios+Tktl6gdyjcZf9RoQlWm
         dkxlRxq3Cf8PocylFTxC87wC2gltcrFxX2h63mW0dP9j0vKyGucM+MOg1xJJte/a93mf
         cAr8NhypiTseBHMyiaEmnCY8eymsh1cFDKF9eJSjT6qeGGZTNJCLMzQWdsixSQfdQMPb
         j7DnTDVXvwklP5EhVgxGyvwh/IjktTUDHQCAk0G/bAhmxUwfSSwdyiC6liLyunaN9Iti
         NiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306514; x=1777911314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P7nHYFe9E6eacQa3hEJLzgoVLJqj03Ug6IiFcdL3B3E=;
        b=QjYey28OCB0sa19eshxVzhNBrtsU8gx3CRTQ+mYji+yqBGrNoXNHLO3KQdW3L6QJmS
         +h2QYaH2J4F7bctye8TbPr4ftSUy5kSC3CnsoLrjpBV/0Mdeh+XxShAqbDdocZ6Nv98O
         uku/CZVwua0p9NaDvvB63R6aexWdumxi/+uB+fmvrwOuRhCkh6AgHZ+W9g1HWv/Ag/e6
         jJxD7BsM6Vbu1d/U73wbTVAgetcLtb6tOxRncPtqJqTArni1XfZkwK7GLeKYb87fAGDa
         HTRm+ucMsM+R7018gXRnpC8soV9Zer3ajqwEMxguK83pOQ5HqAKor4DiaLMLff24Zde3
         ujWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kmGUoZ3k/EfBcc1edWheqnT4zqH141rxPuyjDCSbKF7HJ8Ni2/NAZAlSWR38I04M167pS0jWKBe/0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9DuOoF9gGcQKES03GMb3tdOaLNMLDVBI/3m64+PVdCXgByctm
	KgodkRNSzyRQBoDbMoEvfuA6pCVxupM7E2mTlbvOf1qSCVZqpVfaXUctxpE5zFWDQBw=
X-Gm-Gg: AeBDiev0/ITgmvFArxWdZMmzszb3+Xh0ePzxe7ZrYuWB1/b0gXIqBi5TARrBCpBviLm
	0XmRluPkvT/sD8KXrjiI8Krw1XOJJNXU6gc+4MXpryEXrmcJT09xuerCEW89ni37EP3Uujd/e31
	zJlXntaOU88CUCtYc9piB20N3mWOCCC4a5Ef5qP9qnqFrVKIeJk7kKkKjEyDvhmwR7b5oryX836
	51OcH+YOdvRxZtvtG/Hz+Qof/xLKbSTpvZ1aJuPrrI0mIOySiKaXTyLhAXf5OfVh/Is8plw5RCW
	mfVoEXhfCnxEiG2ET7lQ73vbsh0Z3zO629RgDeV/O3YR3APP/lN8beaOrh/LLVQ7VOcgPwNcMSF
	0QIBa86EGQ2osu/NCj8E3i0x9NUvA7IIPOxbHyeguxDiA4rhC9+nZZREbtmbBSmAyweqvDC4aj0
	YDl88POfTqRkqpLaSOzTpiMAuZIsr9CuyQnkK7oltBtMC+zrdN2hLGm40=
X-Received: by 2002:a05:600c:5303:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-48a76f773d3mr512715e9.19.1777306513974;
        Mon, 27 Apr 2026 09:15:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm831407275e9.12.2026.04.27.09.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:15:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 27 Apr 2026 18:15:07 +0200
Subject: [PATCH RFC 3/6] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-topic-sm8x50-adc5-gen3-v1-3-8a70f7b90a75@linaro.org>
References: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
In-Reply-To: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7619;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gh+gyyibXVgmz6oKLPN+g/HIIFQnoruH6nJZZLk/vMI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp74uM5g9t+edRbUSyWS5F7vCV9zBCRSr35K4ZR4HY
 8qfnN7eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCae+LjAAKCRB33NvayMhJ0b/CD/
 0T0V+Yh0cpUBgyBZJCcqPLAYoO9+O+6NLkUXxzoR+/BjUyaaRsAuhGvqiLFbnFLjaONoDq8p0T0obI
 q+Bv3cTmnj73u+Y/cZs7wa48ofSN953/AWLZT4O3PDN+kodXkZXwmW2uAh/u16oF97nOXnQyxCCidC
 nwk2NfoHJO+OJnx1rh5SVE2I+3UZd8Kec7rBSVcN5sF9MGRbyz3kI4gXjoP2DVUHAmHo6w11cVPgMc
 AUkw0srTCIG8KchK74Ho/3jBXGmYxvVPUdid8uEFlA8sjXho5+5VUYRaEF51g/brSi3zbZGbmQAwt2
 xt99r1jpurlyohRTSUXBdRrcApLOt9AT+vCqWfXAH/9oMppeSn9gps5XgiWwogBt2GKcYHGyHh8F6s
 6yj1OKIQ8W5B17RhIG2iqeWdIKk0MP1wqYSzOobPFgMIcd2ybGhdOQX3rtMzrURCKXfHN87yub0siq
 cRxj7QCWnD9el5wGYp89WwRsxpcZRyUDh/FXVVU0rAuvB6ZXUfVjxD8UoKMjUhdma/u2iqXsA9+CRU
 tpkyOJ8s0ZgCz0Kr1PrvLEqmufsqOsJQ8J+SRf5AbuoeUikzmSKrUGob1AxlVM2xUutR0nkk+oEpSR
 941HoMRr++THykgnacapMeADKdh1Jun4BsyeJp5BgZCGuAwL6typthyS/b6A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 279 ++++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c..8405cb9e0d6d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -17,6 +17,9 @@
 #include "pmk8550.dtsi"
 #include "pmr735d_a.dtsi"
 #include "pmr735d_b.dtsi"
+#include "qcom,pm8550-adc5-gen3.h"
+#include "qcom,pm8550b-adc5-gen3.h"
+#include "qcom,pm8550vx-adc5-gen3.h"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8550 QRD";
@@ -205,6 +208,92 @@ platform {
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
 		regulator-name = "vph_pwr";
@@ -997,27 +1086,217 @@ led@3 {
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

