Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4353FAE0A
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700837; cv=none; b=BIdhJ5Ffh8Xdm89RzQgx3Q/2gXk7QTsGKpWIdbeqDVxw2vDa/34ji5D//PO8JLPQeqhAtOCroFlHaBVlu9bA5gIKX7RjqhEvMmBeOcXhIHtKJbTFU4nxQcbaMwqEKo3mRq98Qwt8OsPRk0DozkfsN110x88ZrxOJe4L1Q2Lsewg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700837; c=relaxed/simple;
	bh=1k1hTWBhsvuz7qBhsq4vZOAjvZG2XYDxS5bQTpehXyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gcWrkO+70i0PiYzPAH0sqRG+y5IwpnkFRuQMw0BzkELgcgcAEjHfd7e7qI8zEor9t3LSWGTIayR41izT8nnkpfTDXbhVGLFwO1EebgHDvYsjvW8KO7C+hcbc7l+nqHxig3SRz/eFLg6bduuvrBsDdmFMF/I9LT2y0ybLZ9mVt/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CUFy+HxE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CUFy+HxE"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso3118323f8f.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781700833; x=1782305633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JC0EZmfK6Hn6Ifl52FIuxx8uHILRQi+SSQFmpPRZbY=;
        b=CUFy+HxEDDUmBfEcQ4L1yD8lc1ex8UDRU5HuXUo+LA/4SAUourGVzoK8w56Q2rpOr1
         bxPRZxq/1KQLkPBhDW0ReaE8pEfIdOw9E2pKpQqW5RWyGWpAwLjGjRGqNtPsNolV9T8Z
         1+iP8QPUQFyJHL/SJyM93poAX6DRBBPLMgIayu7NKp9pXvjIa5QBMPsP1HrWttxKgbKv
         Vgw4i4k0EEb58+Sx8alUdV7idAZyInpzTY4M0ck5zuBPupdVKQtRgANyBNIaGDsQAogo
         IOwnz10L9Wj+/xn3jcv6cyAEHjEhQtcM/jjD8zYkp5ZNJ3C/gy+enuz5zhi+5HEtnlAO
         dCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700833; x=1782305633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4JC0EZmfK6Hn6Ifl52FIuxx8uHILRQi+SSQFmpPRZbY=;
        b=L7tF3W8sYXV9NMcJ0TC8mlcd+uCWzD37wH5FPUNflvoDkFb//kGQ7lDkaBf7BowIPC
         3B7F5bNV3jFtJE/GYNPiAz2gZk1z1mwr5d/typMxXoIqny5RGo+N/Np8QePyITnjBx7p
         OfyhvdQzmUtDM2TKXfnmdGzUc8Yh160bPDSWlAR7MmohsUR3WSUVW+b568dRrgOdquEU
         R12D1dU6k9dr2rYzZCZNe/iSMWYhIW+nVOAR+7HO80aZOP/sC2PiaV16JjVJE9bcmuE+
         /7RMW4RvFuqHlJSe74kL2aL0Bc6CpdXM3OU5jW7EBOnL6LdZoVZnEKXWN1MzTRjqhABw
         820g==
X-Forwarded-Encrypted: i=1; AFNElJ9dzI3Wi3zAYzdzDXwKvZLcD2E0nxEh5frgE9JMH35ylJH/fOFSTGyx61Lse0DvtBK0rrb7XqyS+dMC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1SUBIpb/OrrK/W0PTbh25xDEV5YNfCcA19gP9h1OhCbvRFEO9
	46nc+fWuvDnMbecA+1PiIY4tyOaLFN466Ch4zXLheYbe9GaxBWGkFgLrkIjoyBnql2r2YiqsNxt
	6QiiT
X-Gm-Gg: AfdE7ckZXYdWxPS+WoEXsZe8SESb5kpBRgpYiZu2HGV7RLxBSPeKXi0DJa3T8wlhu4b
	wncAAGktaTLSgmfu+K4D93ynlvZ/O/Y3NOj3BCx4ce+j/pgRsvgqxPgXc0o4cRSyOEPteBSy9dH
	Smr2U0BgSGy5taU8xcwl5mGcy/uDWIAeFztJw9gCpReXEd8bDII4hNxIYILxAQT4FD9jP+DTdKj
	Z2ynbgKDXe/dWpBWvw4Spje69yC7a8mstdIXv8X40k/HHwdLo6AY/8tEmZANnSU8j5OL8IeOUgx
	GY3BVbGRZ294k+PTAxkv0iGFKh+NES1ssLdx41Z4eHn9vLxRlDWxU1SflZT/HBX8SpbXIIRCncy
	ivXMKEUsfYSbeemgOYWpNQr+PgJqwHKRGPTrcHMVXBJJC5Xrq6oxmwKnLJeWP/lYG00KJviiWii
	N3IC19Hd5F0tHdMAGGXmoNRE475RXdiT09aA==
X-Received: by 2002:a05:6000:4b13:b0:462:e086:35f with SMTP id ffacd0b85a97d-462e08603dfmr3975391f8f.21.1781700833320;
        Wed, 17 Jun 2026 05:53:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm9130562f8f.10.2026.06.17.05.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:53:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 17 Jun 2026 14:53:46 +0200
Subject: [PATCH v4 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-topic-sm8x50-adc5-gen3-v4-2-4af9251731f1@linaro.org>
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7181;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1k1hTWBhsvuz7qBhsq4vZOAjvZG2XYDxS5bQTpehXyM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMpjb7BHRyfXHvtPDO/mPujpqRZL8QKL5XpH2DoS1
 LIn2SjGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajKY2wAKCRB33NvayMhJ0SwDD/
 0WkmsvvTMjmxK34WGEb5n92bR+lHe6JfMdXIN2qR56E4jDN8GSdcYDgQxk3BDKcDGMu5kaz1ibKMN0
 ZBiVHUiJ0X2cewVlaAEk0ez0eyVjcqnHndqOOy5+AjFQFrlmVVKlw0dMH06pMSnUt+fQem57KHH/Vi
 sHHl7QXxa0NlBF04aA728FzfRpZpo6KW2R6g6lKDg64yophi8mU0az4lIgj7eOni2VMfuihUP3jK/E
 BVYFahwnkzarK0/Y/Z3LVJWR7wmK8XsC1S7+eZBggRApxUwQEy3v+PfQCdQn8GuUqzR0VM95/4mosr
 r+gbty4p3Ic6dXTFx/UHC9ybjQj1B0TOjuI1nXLzCucV3AQEuOVGXGjB7X2x1203MA53Rfxn14ihNv
 xmDXnlqGTkKeflui4/WvYtS2N3kWchNObiqVTAMOvllKCdVficwdZgIeCBJ8fvJU9As766SXbqcZxq
 E58TsaJZXMXrb5lo4RnXCLCjzi6IYtiRnG9J5ZW23dWBfV7qpixSN9BvWLO7hlEnA/ZJT99lFoW9pX
 m15CRBfgk77tX7tB5qqdVchoj9YBmj8w4rqJfrsHYAvtrMaDb9NLd070e+Ba3lhU1Nm9aHWXwT3LmL
 MNV5ufkHuAX+YDva4gf1yCcpNsz4lXvAqMKmdxmQB7W2IDAlr7sN3r1Cz83A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 277 ++++++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c..9356b40a1850 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -205,6 +205,92 @@ platform {
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
 		regulator-name = "vph_pwr";
@@ -997,27 +1083,218 @@ led@3 {
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
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.34.1

