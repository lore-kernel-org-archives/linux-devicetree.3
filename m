Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466493090D5
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542824; cv=none; b=e4R9Ryarb08I19L291FrvU+U17on8OY+aTLWgyh50LeNRHt/N58KJGuDte8sUpoFH7R2a/CNco8kYBgQzmulq30biBBRzPz160PevU651wpbzs/w88+Z768QsXrIasg/LeODiKpOOxZbcnyDM67TBqihiuF6BHY/6plWLjcW0lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542824; c=relaxed/simple;
	bh=bFpIegPMQqyGnUWbfsDQEH1/PqlcALX7xNv0MVhAoAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jk2G3EjV0PcHnRrfJ94aGXq5TDOUjM6812xJhtqa1SXOAvzvAutIEAhXwa/bPk1zg+nviGo6ZnGDLKK1QrOY/4DX9ECYBZRnLL8vldoGBfmw+mCL0aA5DbPRUQJyrdfE7yPYFCmUfIb2Pw1vkk2gOy0335kredUjfpGa2jaojKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PQXi0bfy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PQXi0bfy"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b64c8311so36475355e9.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542821; x=1782147621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uvfJAZ/NzaR4FcYi1fvTmfzy99eDkYQ7i+GspqtWgo=;
        b=PQXi0bfyT0A9ZpBpLfbHiaBN6fl4laYub6Go7fnxqE7WsxiGRgQUOhUjXjmOOwAUtb
         fAzBwd+kOCTsjcCozlfyZi9zIhASGZdis5ItPr8RaUqV53fnmz78MRV0Fsih6Wu9mXeh
         //wB1m8hpzpaa+ESS8KUycXelAKB/C1UfNxmP0sBKqWWd/UC2bP0ifPs5i4WPqzRHSGw
         wQucpdAovab+AxxaevNr18Eku2oJP1l2XX2CR4vEBziFy9Py1SDlpgjY7rHu1pTEXzKh
         N/TaLPnL90oB86N0dd2LZeP1N+8suV5sMTvDCFjVfac8rLclaFV0CFjIclyjGpkjQAYz
         t6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542821; x=1782147621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/uvfJAZ/NzaR4FcYi1fvTmfzy99eDkYQ7i+GspqtWgo=;
        b=LTAVGtYcJLMh5We2eNENrfmSgDAf77Bd1V1H6DzUvRByxoIusrGy77jLmA0pNhff9c
         brijA4zvI55PN0cXZT4eW18nLzx9c4/ALlhgwBkYlY9FTKfqBC6VjIuTtH6ALYKfvfII
         5j4iVT2niPGiupi0yOQN7iHyOCQETz+BwX3f1CGZeesoys5QjIem9b+9Rpd4drQjguDy
         AwBcqqs4X22NvMr7Y159mZIJj/Vk3FgU3Mc83YJH6AdpTX/rbYKm3ZKOZPM7Z8V3pbsf
         1dtyayp2y5IcgmRlz0ConFvmqxMRqzwb+llGkMioijFDez7Ty4lz6IttRPCE0Q3pW9Fk
         JpOw==
X-Forwarded-Encrypted: i=1; AFNElJ9IsokJgEnViNhwxxvacMSUPTQpYRDroeUpgy0FkvNlI63e6Ran8HG/M9sSSBQaVz27M3Yy+HaXxwGW@vger.kernel.org
X-Gm-Message-State: AOJu0YwLHTa8vuTTB1RfGXfrt6EU2p9X8EvHSjKvVq41mbjA01kq5fII
	UIGuRSJRvEr04J3CnUaQRHN0vF4ly6c0rq5Zj0xZq5GorvRrharZb8a9jTA0KTvivpKPdk3vntW
	kvV4RNVA=
X-Gm-Gg: Acq92OEh7vrU7YODMsOeNa7HDyfodsjju4qyABAD5l3XNPHSFV2X4LmQzwStkRkNWz0
	bWgKXNaeKpkIXprb3Ouc5UFVW2EEYMCMV61xPqTlNnQWhVcxqbga3xXtHWvMzLOpOkS3APiB0rb
	PwDjvy6Jm87IuVIF7VVC6+I4Aj5gXjnxIxJdKOsqZtwPhC2yn3rZXNa9YesHP1Rxxtcqwso8nlx
	9zNwrVtQWeRHc9+vHAcVN+HSWWEFhIPu7OWBITbhB9Mre7xHiR+k36EWgyS5ITonBGG7MivpOpr
	YSrxAutHc3yV05dYxKaIp8N+sVUDo/nnSGB3RYr2P4++Sl+BHxBEjo0QiHv4vP7+sbYooykEvNN
	QhAvpw7fZoof+ECzwnO7INVQ91RDD1bZP6J+0L4zIhRpXVbz1CGV+1pUdPQOS7D90MRoCBqPb1w
	9tH1MkRD5E2o9MD+a0TcvV85rIJPRvw60XhtttJODvVQRx
X-Received: by 2002:a05:600c:6286:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-4922ff93b2cmr429485e9.11.1781542820538;
        Mon, 15 Jun 2026 10:00:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47d1csm5716425e9.4.2026.06.15.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:00:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 19:00:09 +0200
Subject: [PATCH RFC v3 3/6] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-adc5-gen3-v3-3-216a2b5ccb85@linaro.org>
References: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7729;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bFpIegPMQqyGnUWbfsDQEH1/PqlcALX7xNv0MVhAoAQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC+f2ZMjvk+hfeG6l2RNeMBKePsHs8qyhc+0xVmT
 i6hunsuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAvnwAKCRB33NvayMhJ0T2MD/
 9OZMndqZBU1MA1U223JvzGUODl486uSA5RfqiPm6e92zjbK/ymcONeUkCrxQnCGYWadiH7Lqe5zGGc
 NtidVmBSCThXuXMi29fz7SMZk1t+vwbftLo3ANW9pNqhgKSoVf/KGQnCAwUS9l2F2FhyQzjIkjGWI8
 gktQTBn09Hgv5AQMKi0oC3LeKDgxS7l9cIJ+JCLJ2Mn9fXz8wmGolkyZsAO6ca0BOPs1qaixzU5PXd
 86HTOWwgDA2udCZh8jnOiauhsKHv0ieeChCx3Zu1Xk2VMyaoMnLwenmCycbm/jAl6CXXKxPMabwk/m
 ObYlAyddxz0OLSoQu3lKsrW6PSytrHuY+O+AYADAMJaggEpReMTVuSbkWbAYSScBT41qe/jk0zwk6I
 36aw1hj6jmKnsVo/5e8t73YluFw90DPnZkmlkgaP0/8+w7a50NlISHtmS9HV3oCx2W5wogioHYhf0H
 voi1UwCetQTHxau4BaCY4gBaQ+mtMYQl2l27xefduqk8OA5xeFA1q83ZhpUaRMQIKBsKgH7gp+5M4M
 cdQhhza1sbZrWOUe0+63NS8D2zB5d7f6kt6XHJqT9g0NDUZ2tpUNdVO6kOGzFtFpVltJIq2zHjC62N
 p3abzVPw/eQ0157ttGaCkIZaM8bnbQg+UGr2aVeDcnYXKjHreE5oW9t96f9w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

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

