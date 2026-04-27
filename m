Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADCB351C26
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306520; cv=none; b=tWSuM19fOPvc52tjdzSsRcwN7oRCIv+jQPfTI0ybm/dAXpSY9RQQGw015Ad9lMQ1evi9iRMzl3jrEzGEWlTGMmb3Up+jsmMureNIffkYbWJNscep78Odb5J2QqiACjw2jtLaXwLtHYqtgc386JM23idX+V756gfFfeO8yKh6vvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306520; c=relaxed/simple;
	bh=/ZuiDu/G3WU1/Gf07Rd3eeFcsxRLQ1t+nKgIPYDHy0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvFcFb5nZt57fPIuEF3iHQz8c6TzN3AKkfR482uZWoDDQQ8vCHw8s8jFFFYnYOVnPGioy/Lb+f+FVI5AKSqOOYh79xvMCCzQT07wdc9kt5dDNnioWegNidgznNtgl1HoA/EoQVFCZi4Q1zD6rQeuwnodm5fBiTnvavzve0xcHDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=an9Af/yo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="an9Af/yo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so62081765e9.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777306516; x=1777911316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIeCF4WBDw12rg++qmEmRbrnoO4qegsoW5hTZ+mVIPw=;
        b=an9Af/yoZuYDlcSKvM6FYpnQ8O4/etayD2NfQxQHZbxu8WJ/GnuorkeblYbAnJS7z0
         D13+oXWOyG1FdURgsXcwQ0NfrRg16WIO0n9s8cQu5C62VpT2f7Z0A8PX9zHL/P8KMj1I
         UkVmILeZjenxW1XvRk2XB5zRe00O7GjyEwg+HXcElltjpwgc/RpHUa1SPefq8OUvNTjE
         XQQFycCmCBYunVvDGduflqjptWBj5x2W52yb+oj47jGQM2nuJO7LAsWRdJbcNuYAuJPg
         u1MdyYTdkr7r1+eZKp+Rt0eoWIEILf1Fp8c1GUBnyXLfJRuJcCzwoOBO8PlNHr/bohLr
         mtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306516; x=1777911316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JIeCF4WBDw12rg++qmEmRbrnoO4qegsoW5hTZ+mVIPw=;
        b=S4v55Otw/4lK2oz+3BgPfkXb/d1B1A8+nU02lBNMYSdUPjq9LMkm97tiPlrw+ZVFDd
         AiHoOq4+tEg8G5UfdEf3RfrTjjW+qd5h4jgks+tooXJCRgLBJpBIeP1UE5VagkI4ufDC
         8me94TUs5KoXe1L0mEOJ4OV5XtYvrU56ZI4pOzEISdyDEv9vAG+d77S1ZfTjA3vpBoE1
         DHoufRg1opBxbaybM5ecbCMb5RPLChEvoHx+R/604XKPJ/OUWL7XGu2cgzQa1kb03F05
         fj9DPfxOmf4aGgxoaUJBAPVoqlmqdnCyHI+ii/UIkGZbFJlBws/1f0YGiNQRh6oUgM3X
         fZMg==
X-Forwarded-Encrypted: i=1; AFNElJ9S0bSEGN5N4liPbadzCVIhmm6u5kPZRLpIuLPw3iaqIXKH0w/MxGTfzVJ4eNbdukEfbu4yjcnz+c9P@vger.kernel.org
X-Gm-Message-State: AOJu0YyaVD7X+GkBFDzTn/N8sbtLgE030EcuM2ffHMy3OzspENxYSgkY
	dM1ltCqZLYZu6W1U0ei73/yS/kagnkS3C5E7tcOpMYOILdbEq1YMjDdHKq7gEfeSo44=
X-Gm-Gg: AeBDiesPVjPsKgnVUsRM+aS07Fe4cUbs2BmXerKcUI7nVvU/ldLC0JwgyLt8l3a87ww
	Bma83CdRjDrQUOEc/uIJXSz+sc7g8Uh1uzIzgs3eMWDal5dXuClFB2LylJwUlP76OmAKq9sebV/
	eXDHrbidYFnP/qi5QnPToqulLsR9NU3AeJrPPQzK30gRd2zMjY84qc63yFEiJ94patbACAOYPy8
	4PfA3r6TT0O5QiXE46/Y4rbmxBSx+pTi300e/PrKHIR4CIrow1JwyqBsev7fhpoiGv7gWA9ik26
	epXMtqvT3dpuiFVsAfludMRCRWtYkg74NnZ/6LzWMYG1PSv2x0bUb7qSJgjysm2fGPA6H2uISkk
	A71G2qia31ZLlFCiS+vvPB1XFNbnzb6kvzEx2r3Yvp4aXR1nXEedmMbSrkrIgSrb8IpqqduafHZ
	XSUJSqiRAxyJfipQHDGZI+Ke8qzPMYhm36e69rEOHt8TYO72WIoSKSySY=
X-Received: by 2002:a05:600d:8454:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-48a76f77361mr95475e9.16.1777306515484;
        Mon, 27 Apr 2026 09:15:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm831407275e9.12.2026.04.27.09.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:15:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 27 Apr 2026 18:15:09 +0200
Subject: [PATCH RFC 5/6] arm64: dts: qcom: sm8650-qrd: add SPMI ADC
 channels and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-topic-sm8x50-adc5-gen3-v1-5-8a70f7b90a75@linaro.org>
References: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
In-Reply-To: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp74uNM+c5LL/o1FEO6FqnglR8APAp517bFgl3hX5P
 9+/Z1oiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCae+LjQAKCRB33NvayMhJ0Q3vD/
 0W/6edV1bxAsZN+cXGsoDjRX8qWB61jJtgWckCSRkPkZhujLLOKCN3HO5E3NEz4oxl//6k3xkZs0ZU
 y//QeWY/3UG5qjWU8k64/o2SgWmNutlIWee577SSG6FVdMuN2x4tP62GK9ddYL763Ltrxllvo+Ijki
 mgDXENy9623cTJGFwdYIoN+83zrWzuFxNypv54eQo4/0I3Z5fkHCvKu1x0S+jjHQ84D/XgjNQJOeOT
 MRRwKORtX+yHd1fwb49ddCDVrFPZMD0ug1q61Nt/7arCP8uubWrfu6Ob/JeU631gMHmTBRM01y+QS2
 usght1kKXM5v6f2wIgiwTOUd6uzCfTkiSm9TR8TjcucD0kTkgGf4w0nJHaWKfB8wNt8ob8m12eeHGV
 SJ6zXTlJnj4c84biuIvzkke0KITKnyEsZo+bsFj9+QL2heL7dvjysfyCgLvnbH/wCXvCIIj5Zk5VD/
 I3ctNInUF220ZZNjtkalllWsY/3gKi6VUKoX8dNoHotnH6gJQqbO21u+Gnowd18Ski9DziTl1G8GWW
 ohYqG6B+LnvZ286WWJazNX4Ev6+i+rSJDWjFq03FApD4zZ7KEex2iiupOLBkdK7QCWHbVIncETNjHn
 4VlplJqE6xO7XrJ/zhuVoDzXAdPPjqvJrh0Lz5dZ7o1XtZzD2tH5CMrcQGkA==
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

