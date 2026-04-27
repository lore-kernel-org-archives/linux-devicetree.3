Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE1234FF76
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306519; cv=none; b=TAj4989/6tcvJFxkpB2a0tSoIkNtyyMMLFPpp2jesuyseiOGmzKgMdCI6S7fs8ObO4bk4hgLCJmud6GvF0kzZgj8ZNmmww1f4zwZLs3tBrZ1OttL45ysTnum/TNX2EZxaIlKs8QaZ+uYEuEAw9SgIfESEZhn3cXuU9CgxWj+Xh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306519; c=relaxed/simple;
	bh=Atk2z0K3rltJodkMMQi70Y9UqqQouKf+wKkF3AgV0ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bUpBvVvzh8nzjaIeVaSwMkXEGBXqlxCu1aZi605STI/FwGJ3f2SmqHB+8cKh7csAjftMlMTXnV8HXl/ihTILMT65qRKE1z1MSrDipZsl7yHG7VX8Ihh+L589YrBBQsfl22qxP/bafhIM4MImgB77M7QNLTkSa08iIDJxSxRrI1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ldUYrDo2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ldUYrDo2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48896199cbaso103743375e9.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 09:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777306515; x=1777911315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5Sv1SZR8s24+7zvPiaalVQbI/wSYYoYNIlU4Z2+kIo=;
        b=ldUYrDo2EXDkKy/u0DgqRtUl1aG441vutaLOMYnPA1rbBjhrtH7Nd+QjtBw4DbFUv5
         g1qs1emhV+uRkxn/igOWdVcDlEr9TLn6BhzJlOgyh2SEifup9Y/clfAshnG263eUSC3M
         DjnJcr7uXLI4LAJ+7pJAq8esH7wWGr8DkCvhavUHMPcokU9tqm74K7jz11Rmcl1Z6LOa
         0fb7py5qgZgeCiJK5HFKxaJH1EA88f1QQv7r9wlVHlcevzBDzsO0/605KVyD5xAf4FxK
         xV3WIT+2B4gXnsD2JxWEZbqvruEnFjcoKX6dYvUyTP3KjM31RL/4qmUmzCKCOeDGMMuS
         ILYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306515; x=1777911315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N5Sv1SZR8s24+7zvPiaalVQbI/wSYYoYNIlU4Z2+kIo=;
        b=Swj7u/152bwyDlAJgBU594WxHY3CZwLIL8wEW2D+h4L+lKa+8KUSNW73DBcV99rfbk
         KRTJSdRfuSLk3mGq+8m+lmcwhcVPAOJulq7+8KtdhsXll1+eCutSu49mCz9VjERiAKsp
         nI8DOIpD31svrHOI3vRieqCH3h4eCYZNhxuDmIH5k/dO2pAiIOCnz0nmodcTMWKhKore
         Qx5j/GWXS4XgC/dIub6cwbeG/dZ8wZZTweUdvOngqGM1n7OUseGfPUkORqdG84N9wMMT
         luww6FBenk65OYaQDJX+9OAqy196Puc8qfK9c0XiTH1VJ8mTa2I2HPeXrWGf4Jna39ZG
         zz9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+8+xgXZDQTG7mcjQY3X0Lz4e9kSTVuw5ax9JMiAmqgO2rgmRqSHJpnZ6ptos//5A9NRztntnsByUWI@vger.kernel.org
X-Gm-Message-State: AOJu0YwDJigOXTWVWpkPlyWflqieww+vWBLIRCdOnZKmEFfOoQZTW4Nm
	/rAevd6IPuVQgEehL+75J5UgvfKhcEqu53DVM5VbEPivzEuVN3U3EDF3VGx9DqjihKw=
X-Gm-Gg: AeBDieuP7SshvHJD1iZco2yyBPYk+eGT2WpMWIjFRAKpPtezNund19L52vLG+cTGJ0q
	ThE2W8nKaNqdIIvgBH3TxN25Nu8DOnp1faFgZshEvjkJV/pGJV3rUK+e/OYRBCELpKVA6lTkkTn
	Zg0Z9efPWtgGc6HSwrCFy/ksqd+slusVEcmFrcWUl3rO5Zesai0spjMcInazNFSgRiETqOgZDeJ
	L8PAof5EyT/5WtO2kz8l/zLhg/fLH2ERaynOZ6uDbkaTcfORa4reKRu3SHPWGqS5pfYJlH5v64v
	K40WHwJ1ExiquJzOiVgSuAZ+vwiMeyKErkXqr0y/uAa+KN3TjapojvOpXJFm9gsmt29gu8KaMFt
	+tfDt0gMc3i1vYWO9PEy0S39v2fRQZ0v8u7EjA77i9PkeCcopIAejbiTmf7KjY1QjvPyTdpTyK8
	z1pw4enDqnd+CP+SPB9s0eNr04X2einzGNiGQDU0RSY/2PA4ofi1c/6ag=
X-Received: by 2002:a05:600c:34cc:b0:489:1cd2:6106 with SMTP id 5b1f17b1804b1-48a76f45acfmr1106525e9.6.1777306514708;
        Mon, 27 Apr 2026 09:15:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm831407275e9.12.2026.04.27.09.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:15:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 27 Apr 2026 18:15:08 +0200
Subject: [PATCH RFC 4/6] arm64: dts: qcom: sm8550-hdk: add SPMI ADC
 channels and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-topic-sm8x50-adc5-gen3-v1-4-8a70f7b90a75@linaro.org>
References: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
In-Reply-To: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp74uNJWwMjdsM0/F3D+s53UwydNtlvzbD1bFu6NqL
 fbkemGCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCae+LjQAKCRB33NvayMhJ0Z+jD/
 9OgYYcL10g7B4ajak0eBQ0fAl0xiNlc9k7eKfwwykwkcIPAvqk1Oh1wCUwFwlu49LVKdE64vXsiDOb
 HU0ZpV56/hoGyyyGVXtg3eAow8U9n0Sinu625MDJsxerbRmXV/fKDXyWz56xPgkPeRYXdVlO5TDMnv
 df4WRvlhThshSgK/HyXB94bVcO/XIzkYqIu0T3kSJeXFYabnLjJENWNiagR+g8ntpmwVwNLApvh27s
 8Wew5VgguqlRnPJ7D7exltXyiKrOrp4jSeYjHNFzhx/fF6VJoFywPYRWtQjB9+5wqH3zTcGvsbDLj9
 P7pOjnNgToLq1pN9jpGPYPGUn5goLLY2FeOAnzYgtwmdwhmE30mRQtQrjlPEHoY7+ELjpNboeYdOpt
 Bki60mC63oY4UTgQrcfPneOeH0Ew0UYEQ4o9G0iG1FWtkORz0JCM0UXa+ELU5h0wabXAyKjONpSEgb
 eJ8vVwKNFkFE16G9XWFrKBABVtQW5fezmFuJYJt9Ifb9ZmhYB25SeYdNDp6ZWawuW47/dYfbLEnSEZ
 FWZkLiQIwYQfkZl4wKSsOHMRAMcnVBPb+ExMdNNf/9Wi87YgDpT713/AV0DRKHXgNSiG2rcIq8B/3f
 2FZfimeO0O21rZW45p4hCgjV6RW5eZNc2AbNoyWkBpolRgWt5LT6Q4isbi4Q==
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

