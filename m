Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F391E4183AF
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542827; cv=none; b=BoXL2e1wQrfkFYANz4a3zxRYYU5ZRn+jQ39deoCv0iNmQCfpgMwWeY7pJWBqSnN0tWsGTH4LNkdF+jRcVmmgz9A/JUQWTx/GOigPdtLJbtx7hz4MO/srNso9B1CneomutXUnZ2NuIt/qMV8yXe1tTMTzIqKnHVFLFPSidsED5XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542827; c=relaxed/simple;
	bh=s59h4vF5SixW1vtnADYCCqyEseA8yViq+7YLnORqYVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NhtCC4BFmTwq9jIa8Whyr7iK4Cl/pI3SF6QoiqBIT7MuBv7BXfz65vBzj+p2PRWGLAbCZKrJ6Lypy8DWgLnyH+jB0Vb9ae4Wnl3uHV2IVH2CG0ce3IHukPDAKpMaw3ssFqdS9VRCtAfObfc/vwekZxIj5qetBhAtqmeZVz8HyFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d8NJOLEy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d8NJOLEy"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so39760835e9.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542823; x=1782147623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgJAMrZSUZnxqDpno8DCMCCjOngygjeOn0i4rNqXsHc=;
        b=d8NJOLEytv2fOIO8AOXeXUOnG9apY9V+4jONSaHUjlvq0ROSudEaHqEosZm+25VrIa
         UvBgmbYaHFm3zoTBuLqj9SbyOlYQHKWBIPwCHAqYFc1o8HmuCymMGPjl/u9wLghGn9aT
         ffD5cmNWWnfLEEASmfSk0lxgKrMCNJnfE7thrSkflKD/MOrtUFHlFBzFGRD6r175LlFG
         DuGBAikbXij2SFeHh1zsnQZ3YgP1Q6rRcylONEndETBg9m5Kz6jrtPvJVjsGj7bfkUB5
         U4jrnq1rgAdt6F6WvCrav1s9VpFvhtmz+uuKp19Z50I4CfbGlY0tVMHxN/vPqbWxY8co
         mMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542823; x=1782147623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JgJAMrZSUZnxqDpno8DCMCCjOngygjeOn0i4rNqXsHc=;
        b=ABdt5V5KvTEIna/wi3DWuXi2YKIs7t64RgwvZyOTAEXeyHdcYhR1gFCcSPJFshU8zJ
         iqalLNFPSPgUyDyvf1HWDIb7QELxr7zV1HhyUIsgAsThYOSrOYdDEY/NWFZYT7JdaVOv
         KKV8HTWR7efWWhjeQ03YzGM318jXm9B93k7g8+gUj3R35Qx7KkL6mLYgp/xRV7wCLjlw
         W/9ES2Re8Z9SiPQLrKZbYtyM4sCe0eB4kwbKzddody6bSx4U3yoPxip/aAcZRiZdsT8Z
         HHqzhxzWnGsojXCI+5W9EruA2ghJWjU6Al12dKc/85aIVVGe+bD/ekWkgsUImuDOtdwJ
         3Jsg==
X-Forwarded-Encrypted: i=1; AFNElJ+se1pMPnJWnr0XYJmRlwu7WkCZlOmAKnIP6o0umhNIr5wq3W7XJ1bjIsJR4kerHKHzXahYpGIRInDU@vger.kernel.org
X-Gm-Message-State: AOJu0YzllX0BmXKE94fKCMzsQk9aAAywaN6+6fmARxxQb0kubF8ICgDD
	aG0itZeh7/CbNbdLDi8xE4WO7pQGEPexBDY3fvAA1fF8IItzZ7B47swDEoNk1zAJm7KujU9InIO
	h9AklHP0=
X-Gm-Gg: Acq92OFHCUp45llM8VXc35mn7SqiSi2rky6Fk0qV4YNwgSY4+MlXA2poCKCv4Hv2GQ5
	P1sVQON4oyuALTTL4aUZNJlimFf2mKl+Yi6BLtFPzjBw0x4+KmBt6iyEmQJNbpsT3nLiSObSSiI
	FxkKrOslyv6WWSN8SLy464Yl2sbbuvSelZqHNlwVW2h4GW+e6lhq4HU2VJcboqaxt/o+/Fb1pe+
	Ma0asJzQOHkl2kKnvtRNzO0TvW+avQrxy36d3mjFhUwIRcx+WN7kFn2z6ZUPAewaFL5lmsMqD19
	pRKrJ0JiQdyZW3Q+8b0sgE5lPKGLkLGBlWeEmVsYVj6hl0mT/MO4HLkq1TK2VDyEYZ1xgS4TmqN
	KULcCTXQM+y+eIbwFAsOf8xsW10z3yeE9lvl27nTS0ZOLiCrPftUUODInUpllteb0aJ0eU7YApz
	CtKwMkUR5fISx3xTE77Uqgx6vQGCSsZ0ix23W60BqpJ5gR
X-Received: by 2002:a05:600d:8494:20b0:492:2d84:fbd1 with SMTP id 5b1f17b1804b1-4922ff7bc9cmr720035e9.15.1781542822937;
        Mon, 15 Jun 2026 10:00:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47d1csm5716425e9.4.2026.06.15.10.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:00:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 19:00:12 +0200
Subject: [PATCH RFC v3 6/6] arm64: dts: qcom: sm8650-hdk: add SPMI ADC
 channels and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-adc5-gen3-v3-6-216a2b5ccb85@linaro.org>
References: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7699;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=s59h4vF5SixW1vtnADYCCqyEseA8yViq+7YLnORqYVs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC+hWt+qB9DilfCOdsMGvCEY+YpiA2kAgG+/htBc
 ahMMDBCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAvoQAKCRB33NvayMhJ0fhLD/
 9Lp9fULdkQ3Gn6QDzWW+GMnM+xLcXs4i3qKRB3yYlnHBLYhT07PB8TxdLjscz/FCbsZRBsBFcvg1Rq
 O1BUv1NSApHRztb05tM4pDWB6AedDQpT3wTq8SbqwaSZpGMXE3bhUIRmYVhjDsUAgXRGFNYgTbDwdm
 ZBnJlXxn+A7ILMAYwSXbDIhuFWMDEGXmouc2Kcd65vX77+fjxoociGNIlfPOjpC5EFM6TXIK0EHqQ6
 etFlRVPP1ic7LI8+NdkiXZwpN8X3zpUKG8YGh8NhqsPgoYimBYEGdHP/5ygQehdQVJY/8Eqvh0sIT1
 KADb0tifFoUP8/OOaoH/JQo6056QmFGVWwRHACV92HG+dxoP4p7OxG5YbNwEXlSXUKjT5f9sqGpWiy
 2Aq3k71FptBWkojSKNRGgnlF/ZCtBg3kF1R4scoJmi5v637Mo3HcMPrA5kvXlGrKAOZ/FrwjMUGAEO
 qk4I7B3l2hKH48rLo9LuTJyeFcslbuckyGvSPiPFUh55DDSzLjgNht1CfwEMAZvlh+y4WIakZl58at
 4cuJdAYfoanPRuvxEn7lRbaytyYhV9JFE2zVtdCjUkW5y/3ENDZjd/6lerNx58wv4cSMi/SXKk3pL3
 djVNsDhjdz2CdOa3ng4zps9f6MQCJbbGIb5XC0pPY1ZChytqMK9WnfMMT9oA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

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

