Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2657635B650
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306521; cv=none; b=t510vqZwdpxrGRBQGNJ/pODCGevclScevIIZveo1wmdlB35PuKY9+axYKNurMmfQkabM0ZjLGZdUwPRDeX1NOMusMw97gNMsgwJ/gVz7FzAHHUH8BZ26jwQc3uAj7Vqg6YsxiCxAy83g39ZCd/wrzqqEuUWu6/RdgPdw4+TUyWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306521; c=relaxed/simple;
	bh=6SyKbrlGvVfgbPKM7M3c/h6sOZizD0PfCGoCaI5SGY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YuPw9KOHV3cL5ebMmSfQyUyTpajSFyQNes7afrvhNUptzL8h4KY49avkEVD0tzuX3QigQQhYoQtax+rEozJifGSOORcYIkPWmotK2YRpP5zb0U1C0PvuP6QYf1PVlllxAOV3WhZtFtbKqNCinnXPp8eKDqeohv4FglCjuirlxAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PZGchLea; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZGchLea"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so96504485e9.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777306516; x=1777911316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ak2WorJz7EgyBKTiaAWsjzmQxkyMJ/7FvBHb/RPIyE0=;
        b=PZGchLeaFFkr8psDl+gQAEEgpJOvc1BbIGkkXNdDTfUFzltnQdshswE6HMED6j4S9O
         j4B2GlIbqgXQUwaF5GeKxaB50Ifa+WRt9vTwL6IlnsxlOHCe+1g8YazA4/C6ZUwKwSo5
         v8+xVQgv26knkMikK+3gSIHI/d7VxJ4eQyLB2XoAOYnIceGcL/SBWnghs3qo3E6WuipD
         F95jtBi02sCphMBHOI0LbdqevOlILEwd6u1lfuB47BUmVT6WIO/cCGEJKSt0MoqX+HYJ
         HzWInu8Wrup5LE8Kz/7P7OVxup5X/nrLO0qLY97Cn3xFtQDnUdITEJZWebvvUAu+2dkl
         fjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306516; x=1777911316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ak2WorJz7EgyBKTiaAWsjzmQxkyMJ/7FvBHb/RPIyE0=;
        b=rS5NQzunBnEiha36YwYhUb/uz4pWYrn2NCTWglPNmGkVvZPGvyupxsztprlT5XpfQe
         osv1kP960oJeeR3++f65YOigN8w7b7Ih6XH9SMN9Ou4/cdB+AyB84HaQJDrRJ78JmJcc
         4NuQqwVyXO2IPYrNhFPHhdy29fH/r8WBSl/w0M1cff0GKcA4pXwUPALrPW0UwyChod1i
         ec91ZWgr0iU7ycbGf90kqimYnAPLXyLNH8aBJZmCzRZIyAz6MUHDcQHJUyQ4guWkfQOQ
         cMnmoS2oq24gdFkPOGAkt6LYqiENcqPzTDyuKDkE2rjD0f8WSQ/6DkQroCtFP388QnKI
         p+wQ==
X-Forwarded-Encrypted: i=1; AFNElJ82cA5EfR3n3KUjdjodR6Xf5XYsuQGbSySYhOMwImbHDsGNp0ntnK+Me7w0l/rp7mgICOSYpnP4DNsY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5lMES/03/pQw0Lqf4cznomUF1AYva+pyvYrF927exca0u5a8t
	g5nv9kGwhZ4eyMPCuJICPp+YA0HzSVD6CZA+eclAKlzIDgwEnqCVkjed5n04F3EbI+E=
X-Gm-Gg: AeBDieuKdvg+l7j9F/UozNm/9XzoFheILRtNnezjId4NimmOKQN9K7jugltvyiSWoXJ
	Y6TO7Nt38ywflZtF8PdPI3pE77noe7EkmS7JeGtYEhqVoRijSpUXyo8kA5Vkotb5lKxvtuS94oK
	vwJr6t7bpsi7YfA02p8bEgtrlgO8HTEH+Tfj/ya4uMh6wXA+4UIQ1QC+8kwnnmGEekxaLpSwjjY
	JP60ef4DD+kSmOhKM0o/27NRpJ1LL8BYuRuF7JJGP9x4NrcY0YtmWDX1hF5o0ugKX/RHnewrdz2
	mPdFlflTwbD49CBpqwZdlSwG9/wCAOkH7BPbWgyR1g+Un9oX3b4ziW62pTb/4ar6n60ybuIa1jL
	13U2HP3/CMzJIydahk3wtGOIvag+0ygURVrGt1fyEFPgTtOJqFsov468ofH5wxyHB+6cFTbl1EA
	LKUiE2wH6/Sw5TgfThX02md7BrRILRhH0ypmjHdlVTo8qVF92lpfK9P3Y=
X-Received: by 2002:a05:600c:a416:b0:488:bfc3:efc with SMTP id 5b1f17b1804b1-48a76e018b8mr1145655e9.0.1777306516287;
        Mon, 27 Apr 2026 09:15:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm831407275e9.12.2026.04.27.09.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:15:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 27 Apr 2026 18:15:10 +0200
Subject: [PATCH RFC 6/6] arm64: dts: qcom: sm8650-hdk: add SPMI ADC
 channels and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-topic-sm8x50-adc5-gen3-v1-6-8a70f7b90a75@linaro.org>
References: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
In-Reply-To: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7589;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6SyKbrlGvVfgbPKM7M3c/h6sOZizD0PfCGoCaI5SGY8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp74uOO5J6GRaxLHA8GgCKiJu+QzmIhB7MhAs6hlpC
 CGJM8HGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCae+LjgAKCRB33NvayMhJ0bQ+D/
 0TpNz4l9VlF/UiIG6LbUOg4fYFgSx94BCELcCL+B3y9vMHraZ+lDuJVky7ComCtpyZU6jrGq5KkPAD
 3gSyzD3lz9O93dPB5T+7L7LT6Vu3Pa0Uc4a8Z0SmqLPd8mkCj4jezaZGswQUB9WZbXLiepW0+mWa+2
 FFiK1VlpNPCMB2isoP/9I4DStSrD3gf+zN1oW1tBXEY4JGwVZDm1e+5k15t/aQQqWlCtuIScSLWHzR
 VzQWuO+V7wwwPtHtBn7ec1DfHuSd9MX8qy7JHJmeAk8Lr9DRC1aNbLfOILRODPl+nkbDQOGQBpv6+K
 Vl8d/aoszaMwmuQAkeJmxsTw4PrZg6PWjMhq3XtESj2bRdqmtUEceCUGe49ZCN4CW54owWXmQhuWgc
 70WSXEOkdEbNTGb33dLhcbvhT9bLjfOid4VCqoq5oBxnYl68dCC2SIPIcDdSaIT6erpDiHzmvXKaby
 dh6UovsLFi5x+/wr8ux5vHYjlR2e+Sy5+i/79nRLHtwFOV5TWYMyuKWwgkkLYtCneAIWmH5g/PM8u6
 IJEQx8fAslKzti5e/W7mbzcJLKUv5Q0JX88xoF9DymKlQnFy279mEZRutnbszaABkoRayFyvWH0p/2
 GFuoJ2jobyDvlS6QL3y5myfBjYgizDb5pWaufTWKLD75n2RqlfDCSzZ9MMeA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 279 ++++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eabc828c05b4..cc2d341760a9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -15,6 +15,9 @@
 #include "pm8550ve.dtsi"
 #include "pm8550vs.dtsi"
 #include "pmk8550.dtsi"
+#include "qcom,pm8550-adc5-gen3.h"
+#include "qcom,pm8550b-adc5-gen3.h"
+#include "qcom,pm8550vx-adc5-gen3.h"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8650 HDK";
@@ -220,6 +223,92 @@ platform {
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
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -1041,27 +1130,217 @@ led@3 {
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

