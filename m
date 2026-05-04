Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454CD3E3D8D
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912204; cv=none; b=UeA3BNd5EnFIsKxcG2FsWT9krtT+JTznV0Cofvt0EDAbs8jPyIcP7r4UZrDuWFMPu2LNeYLkg6VSwJXBNSH/Xe97T0xBjrK/ccXGqOKQlQozn5BwBMzbbF++PbDZvaHhyFf1KzEvuk3c/tJdVOohKe9aIY4egsrrjh80Gocv4CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912204; c=relaxed/simple;
	bh=6SyKbrlGvVfgbPKM7M3c/h6sOZizD0PfCGoCaI5SGY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZjuEZzkhLUf+gBhp3cxpOFE/gq2TxBVU8RmttypDIVkosprdIRbiUsFGnW7iNHC2gAM6tVzjfOJMwZ3ePt+X3CK2LaLdrXZWsrqCxvot7/QTF8YdkD7UhC4bvFjhAsdibGppBgvfx8EKD6PubppaCilLXVMzznR7fLZbz9m73o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ozHKmgrB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ozHKmgrB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso34268855e9.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777912201; x=1778517001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ak2WorJz7EgyBKTiaAWsjzmQxkyMJ/7FvBHb/RPIyE0=;
        b=ozHKmgrBLgvqTZPM7wyVojlpg2bm3SaQsChfQZAI/xmz2tB1uxj0GEV2ZKHYzQbqkc
         HEAx7VJnziVWzkuhCWEJDM2RI46gtIXTe5d6Gt3cl6tJYlYZGwXjnb8PKQbPRMjEcJJG
         VSeVljm5Y5ZteVfqJPvBvMoAwb4dZ3HC4kK1UsXbwX9jjUTDPagnUAwX41BVKKv4FQk5
         leqTmOffUCdevOQ/9/ivbBvSBtkgNJ6LVZuxbDfKQ9kjkGdW7OuakrTnzT6Z0AXLLMsq
         TnIRjZutkVhf+woEp7UXA6cihLzYziH3hvCDQY6Bct13QKtO/7UQvryfWJr0GSJaWB2r
         B+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912201; x=1778517001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ak2WorJz7EgyBKTiaAWsjzmQxkyMJ/7FvBHb/RPIyE0=;
        b=ebTGG2SgYloPkk+vRt5ddEMafFGvKoQZY9O5JnqhCmaon6unNu5THADGGzWdiJy7W0
         3j+d4Kq9tssEzLF/XhBIYbxN2a4Dj42gAX0Uj9wk2xQx41ETqaPNiRR6pfA5P97K8MiX
         ey3VLT/y8EdI1+eOW5b6Uj2M2VqUJnUvjmsUHSILGkUxE5Gwu4kpYg3kzHDtWQ/fP84+
         vJjl8n7oUkK/GsuFcPr/aaQsDMv+exAxJLqg5NcyZF0zb4MBGVhJkwYO9AiiPt60bHX7
         ewaSar70KChFoqgohbae893haQENNozO/6vTMvN1Dori+NuEvZeVTjExypzR+2idC/pO
         o7Kw==
X-Forwarded-Encrypted: i=1; AFNElJ/BC+4Q33YvC6LD1+j/fZA/iWIkNEQ1Jz2qYwKj+OliiNkjvbx7qqbAh+AXlTyBba52BMJ4fWnd81W5@vger.kernel.org
X-Gm-Message-State: AOJu0YxwvPuxWvgSEkqNTl3fqcAOlRnz1nQIuum1mkHYEffEuHmnInjE
	rbd3BYP5JK+JVMwLAAhfzr3/9jBlSsWxWcqpK90A16pWFNj7yI41oGPBD83YvORBTyQ=
X-Gm-Gg: AeBDiesRp5oIwnOYmGD63Yxyxf+bYUY6/wl2u1hI6QIq3PcJjp5MohLoSZisICRMBBp
	+PS/s43JcYWJAW093EP3dW2IAQsVRlyC6odLllP0KJYtKH3g9u/ywnLZnZUcJnZc6o6RmCEWxyf
	rcagvJQY0E4Uk85f6NSFEvFcJrcZ0S4wOlc8a4k6BUbtpINOpszqqot6t2DH9n2ajc8Izh1GEZi
	rIeV29woLWq9aF629bQCSXhlVjtwS0VU3CN4qI4jyDt8BDavMRQd8COpe4IuOolF2/4sO+F+8Zx
	2Zv77aCKJtCNzB5ALsYF5K7yM0v/eA5LYsss9m15XDcwFh4ZaHjTVLwuzWtdDvXJzoY/505n/Wz
	OwackKCuw2Db0KuoZmAx5sF6VWVShg80MhUNvxF7wRYq121rGdWGgM/UwvrYp7DOYC7dkBeOOiA
	J6hVb7FlAlB+KFZZtAfHb9vGgS+q1209RYAO/ekj6hYw1HS1Y027SRbA0=
X-Received: by 2002:a05:600c:608c:b0:48a:8905:a500 with SMTP id 5b1f17b1804b1-48a986429e9mr176290885e9.12.1777912200460;
        Mon, 04 May 2026 09:30:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm405071055e9.11.2026.05.04.09.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:30:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 04 May 2026 18:29:54 +0200
Subject: [PATCH RFC v2 6/6] arm64: dts: qcom: sm8650-hdk: add SPMI ADC
 channels and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-topic-sm8x50-adc5-gen3-v2-6-5cc04d6ecda0@linaro.org>
References: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
In-Reply-To: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+MmCw7UDQdWslJ+zthwRWgQfz6q/ixnV6i1jvrtO
 LdQTMRuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafjJggAKCRB33NvayMhJ0f+2D/
 9xM5ZmZUHRN94/f62SU8mtWmciPzw11QmS6eF4fle/BLIQ/24YMQzw0UYSMcljPWScmW2Z6dNiDRGZ
 n7uOU/nB+UBEe2jyio7T9iljA6+U0pqmkVOwqh4VjifWBhghtWEezBRKaGHpNPQ5tkwZTz2NHUHK4a
 Okm1KFySKfto/dWXwJZh8DmqrWBWopFjCr0vVB1kQsDap0O0YOK3cIAx9lUPzdKORACTBYdb8TfjOg
 AEA2PmZzB/O5ah1wflF7Fltip+sAEI3BO+KRDhZmJlNKpVsgOhkOFUjsvdWEGgdx+PrVk1NeG17Ben
 GEumYqw1FtRZ/gwShsIVQWbSMNKzVhz8hRYosHeCQrtd3FveoqGNVC1fVQC5t5+i0L3V+QobaMQI6w
 cmxHNcOdXoQXvBu6yTAIcWi/CuT4KoKlYNhQYKduIBLyf9JICyETGzjHeUtU/aePsPHpMCZ3zqGOTL
 NFvfoKMX+cjFZTmW27w11E8jsvRQ4ng90FsiVdpOfnXu+/H6Cjq1pBOmbv/IvtLWBu7/VBUS4Haj/A
 khd9EkQ4+z7zf7z4ABpOPuVKihfr9HJHBKE3stXlj93ArMnGmg4oompQD4v5jeDL+zssGwFNAiNhNC
 lOZI4MFAfggv9E3ofDhO8qVj+a7qOwhxBEp4eZuCRmIXR+B+dQ4/XwSrjJTw==
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

