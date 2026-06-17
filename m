Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141C33F0ABC
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700844; cv=none; b=AM+jTqVuaU0hEPJKDtwA8rQMPXNNpHYTfJEghS2iEW55O6KZevEtWm/tQ3W8gvk11BPUaC2wJ1WEOauwDn5y180QcBESAAff44EtTVSK2TURpIObI6rpla/ekdskRCYv+b7fYsA6v2FQSH66sXw63mF2wy3EMc5+0VEYaZI6Uow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700844; c=relaxed/simple;
	bh=k2FfkYUu8qYjMCn/lXY/5VSnQhY0Dpe2ckXREWn8OqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NX0iZ5gv86Lo/MQVATBsgLLX5iyfCKteSsc7avlSKBPXw850U8+4fsIPSrZdiBEILpex37uvkV7F7OYmkMDJh0grmGaa7iAGUa1d9QVuf+dyFx0YqaBgnTPGms+2qKsNVy4TxqrkMMmO7MkZ082ucgB8PFRiAwYiVLedz8cs8kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zjeO8pfW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zjeO8pfW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45fe59255beso3242606f8f.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781700836; x=1782305636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Onj3JVerpDXj42c5Km78Gpy0NDNZZWak8l1As5OKZbU=;
        b=zjeO8pfWE4zsIvRZwahPr0EFUOvVbCH3ulH2Y1NKRIaQYWL8C0VFqFn7Sv9uMnZ76M
         iakqaYGo+J4iy00zWFW+rkM0CjWh2+Qd/i2WOQcXGX6rtb6QUYeYHk1ER0CN25vPHOX1
         E4P/OWuG8aE74T1es+CfvEUGYXln4H+/qD+PQTPigAWbOXmANuMYLjXr0a2DrHLUC48I
         AMYyCKx2ytFUyFk+MDp6ctVvaHtV0b/Tpi1Ggz5ajhLKe8u1o0uhp0mwzA9gY8LRcYg4
         S7r7454UHjDe/tzJlUJOOGOuM7IpwRged9/a3L3nzzmPG0ZycTeE4JsT1xBTAs7XV2uQ
         t5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700836; x=1782305636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Onj3JVerpDXj42c5Km78Gpy0NDNZZWak8l1As5OKZbU=;
        b=oi0VTSAitBH1/CiVS9ERr+byY6W4Ji8ASh4g+CF9HsGGYz4rdNhExJzMQi+QTMRubY
         sPZ5tsb5vcXwJzLrqnjmLt+zvDPVkVD4V8GSJsOXvbYBkECirIBht+vKDqjk+gBISY+b
         vjIpSrr5xRJPkeZbwOMNYFQQAL972XbNvOjzfpia0Cie034xUG5SotjphoKllsli6OoB
         rdGx6c/vwQC/GM3HnsK797ynkv9vQ26T2MuXEY07MyPOO8Mn6oljAq8ePUtuUCuU+ljX
         8g8Jv7yiTu56IqMbFkUV1LXrHe93746nitzMkkpOUb51M8nPl0oD5laIoMTbifxIyZub
         5+3A==
X-Forwarded-Encrypted: i=1; AFNElJ8ekgH3lATIWmseGeN9Cc2Qy2eoDxzAE4dxuXsueHsltj3BLfgQtwfPFZ8nSSx1rFCVcuFWEaqi/SJx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4LNi/zTkEoz41ouFXDAz2Vx0yMK5kH6TX4coxHNSf/wuX6Iy
	BW+7/KR/+qhZHi8BEE/4sa/DnmD7f8ZAOLDuVHUJemr//oojXeFYTN6A+y0qxCxwl23MYxGAplh
	ZuER2
X-Gm-Gg: AfdE7cnLBXwy0Zxbqqxmc06mAl3uC4217MElYw6VTUwWc1RyA/VmKkFF40PI9YWkb69
	p5uyh26FqQoQBQL0PLvJ1Ibqz+cgFziONyS6aDv9BUHTSm5H+Khhfuxq3clYG6GGLCklCqFo5Mg
	rErEGlHYLSNcuL8Abp1LJGdxnrQ/GYhvR0xQVcIKUFvY+YmyGhPUvEqTdgWIINWB7niqBk4//pJ
	CpNR+ely5XC4SEOu2EROhXISCg+i3WZJade+Cp02JaSM5W2mgfzVmXnTw0+uGJebNcOrL9lv9fP
	PtBSKsSFdz6QoZ8cU6+zLZhD3AORnFQVJbzIFKIUE35xdrALEFd1EOEj/AyHqBjXajyivXIP51Y
	HCCzFTolO0PO9TxIy4MpsodCf5Ox8Wkn2LIrwJfVOPOKHnMtT4G6Z6zeVGXbCb2x5T4ii6i6S1g
	1RZ29b405NfPTXIvzPbhqM02cC3lWiD1crQw==
X-Received: by 2002:a5d:424e:0:b0:45e:8547:f21e with SMTP id ffacd0b85a97d-46241d60255mr4943436f8f.36.1781700836306;
        Wed, 17 Jun 2026 05:53:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm9130562f8f.10.2026.06.17.05.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:53:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 17 Jun 2026 14:53:48 +0200
Subject: [PATCH v4 4/5] arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-topic-sm8x50-adc5-gen3-v4-4-4af9251731f1@linaro.org>
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7195;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=k2FfkYUu8qYjMCn/lXY/5VSnQhY0Dpe2ckXREWn8OqE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMpjc2JvESgjEQSR+w78Dbmef4tmu6Wbcog3W0cKh
 RgjO5fmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajKY3AAKCRB33NvayMhJ0fLXD/
 sFXhbgfTdkkLc5oulHoqS25X19gWZUzKeFyEDzAjRjUq7vl0lT46REIX+/+cJ/qsav7afPNxAVaYid
 PSYA3FQEkCa0rg/PR1XZOcSUByFdBWcz/G7gG2p1+na72tpXv78QaVkv/S3BxWoPronCDPk3Td2vOj
 CUeEHPZEVdZM3GxMeSAJQ4PWT4TUxmo4DdY1H8WkYGqk/QKSeKCO0oWOqLE0AfBlGr9ZfViL08ZKMG
 AC+49jLbRFPy6USR4S6c20oMRcRWpUnOJnLdoETB0gLRbIPmQcawE2leB++47HFzdT23769hsz5XMn
 hcFlg7O0MhUQuVNac/uHPMJ/RiunctXOPkpCKqDdLdzTCEXsyHAh2xOS0QUCjIwklFLsmg5q3fkG/r
 JlK0pa7FMUmOglgp/aRLy238WvvOSJsim0id9QVDX8XfDht6ZyMWsxN4zut4axZaXPoYzDwOW2PaYC
 v8/aWqYezr4wkc2XHdu7h+u1d1r5ZI5Dcz1SPqM8IlG91BqpqDkkuqjIn6CbL748L8UykAekP0QNh4
 1tFXE1bDQBFrDnS+M77texsW6ZF1rbyBd7WbC6MT1GmCMsUYOE3ND/hm4oO8lcnPboEc7+0iZvW3WH
 7lmXjcAzYarapoZVkZ2YKH53QdXVdyCl28H0biENnAgqVsg+SRgSUkNydzzw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 277 ++++++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index a3982ae22929..d4a0627ebbf6 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -158,6 +158,92 @@ platform {
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
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
@@ -1040,27 +1126,218 @@ led@3 {
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
 &qup_i2c3_data_clk {
 	/* Use internal I2C pull-up */
 	bias-pull-up = <2200>;

-- 
2.34.1

