Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B9247ECDC
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985725; cv=none; b=H84Qckt7dA5YXSjVWg0ISafqky1hPlAjH/8NwQ2dlCHSpBCzRjYspLuR+ffJSVC1Dzil/9UHuLA63Mg9NKd+xae04UvndhYW6DQgowu0489h9Ge2gzwr88fhUjvcSJ1ot9lG8B9tf6ST2+nfY2SA3JRSp+epC3mivhqFkvHPQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985725; c=relaxed/simple;
	bh=8+dE+Aeo7LtiR90EOOGS1JgFM0V2oi96HRBc2ZUpDhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0FIUApgie89ml1JQP5tpqem6ZtjWORxphFe5qPN2suyRO9kPVMgI2D4my9VtlouaLmqXo3/dKFl4lsPARMsIQQVoAwxU9qynydNMgN1fqhZjC/MEAOl30EBNTVelifqWfAX0uWD2h9hv3wBPc0beMJPexPl07PI49U/ZioZ5dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nlbJCwG8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nlbJCwG8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4720d22c94aso1447397f8f.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985720; x=1783590520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HorlTbV6AkjQpBxrBvqbgfNSnrRuUgaDn+vM/bQ/fUg=;
        b=nlbJCwG8YdA5LJK5ZC3qks24IerzaLuehnaNPRszOTfCzqHGwjNNveZO9r8j43nrFi
         okDU7hYQrwHCZ6q5MU6PIbhdweQj9qpYRL9fxa8Cvc6ISBcI49s3fQPygu2HAnP4CIzj
         rJ5UN7ag4VZ/2x+WRnggDPDQm6iuBQ80m/PVX/MIplbmdaITzfMYjZRLeipy18V00eRC
         D8BmIDK7P0J6lYTTqbarw5kc3gLEUORmqIRz/ZVR98EbWzW9nj0d2t+6sZWityFYx0hH
         d6sUipv+OYcqE0lokO26Je/MehHD/WXVPAzta0PQc/a/RWYG9z6VEaWUjo5I+5yGLARF
         l5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985720; x=1783590520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HorlTbV6AkjQpBxrBvqbgfNSnrRuUgaDn+vM/bQ/fUg=;
        b=Ykf+SLkL3JR1/0yr5yamKiDGcY+mQjpcjtJY41u5oQLdK5f1YAqFU9CoBzk8FtVISS
         y3fTpgWuq2zwn5Bv9U5BTzfvWE5YlshlwQQFqOm6dTwRlcGz+Ik1xqv+/3rZxEzSpEYU
         wX0r95PMWlZgloIFcWUOtGMEMuXFOnJhwy+OzEWEOPErESrPv0KP7CqIwtnkTSGnDMba
         hVuEkm2Y0Yga/vIKnhemLtSr8xtl36kjkdef2qPVZLgvaTrcJxOeh3dwG/hsQDED6btR
         y87PSTEU34L7eFdV0Y/BK3bY2ZvFTc/ERMiqkNeeG6uoFkxktHjVkQklAqAEzwssMnR4
         IQbQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWoHDDPsUQJFgLYFLiGP+ewoSV8/ECMjXh4vwH0siCmM1fDECCDeZXz+MuUQBWmMMrTiJTxSyTIU4w@vger.kernel.org
X-Gm-Message-State: AOJu0YxNkR8rjlmIlHKzIisstABZy+SXfk8mqRaI52YPEaMXC3raOVE8
	Bn2bSiNkZdO5vKT9swjrDpoaXZUdBN+J/7ymnM4sZuBLLm9fFfB15xLugHcEe8i2Esg=
X-Gm-Gg: AfdE7cl58wkrGMeurUXj0kAhIDyDsbPsgbMEa1uHGyP+me2pSA82ooMJbASnQmRiwnN
	WjNVGPZzDzcLfZdvjCaqTTn0COoWTr/rPS/ADWPRG5kidjomAUlDghmNPEO7QHlW8XtazDvm8Or
	/UZ1AOfjVbVm2zpz6sUH42gd7kJ9W7DK5LLFEgbQ3YtTVEYtAOxukyyFkTs8CgKccOFPQVSnKww
	Ap7jn73kkKA7WM1B4mOBGA3mRXTTj7FiYhdzOg/GwJOWnRAh1VFowh9rREFHASM86EqWdYbBXxI
	RY5R+p3vMODBEMye2HOoyC7qTrlZNhKq26zgeBWZfaObOK1DCo5EQ0BiXtk5OcA04y/0fd1vWz0
	FdTb8qjx7d78EMUUFPGgjIovRAljhHJnEMRWJ4+kpULAg9aI8sIpj5GzsK+DhGon0s7ET83Ot4I
	lM/NhePf97l+LuzqT5f+X8/nUMZQEaNIUt5A==
X-Received: by 2002:a05:6000:22ca:b0:475:f0d1:eb56 with SMTP id ffacd0b85a97d-477b1b9815bmr6542251f8f.49.1782985720236;
        Thu, 02 Jul 2026 02:48:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4a09sm7656816f8f.13.2026.07.02.02.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:48:34 +0200
Subject: [PATCH v5 4/5] arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8x50-adc5-gen3-v5-4-8169953634ad@linaro.org>
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7174;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8+dE+Aeo7LtiR90EOOGS1JgFM0V2oi96HRBc2ZUpDhU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjPzIogC3cFNvfuvbFIOLoMABNxOO5h4voH94eBj
 bFMXoQaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYz8wAKCRB33NvayMhJ0XE/EA
 CZ8zpRL2TbkIrwj627Ow0UJoSuuWMT/jBCFUehOhzFkI+p2NDN0UhEQwEbI3rSgsZQfjCH6I08r+t5
 8xHOq1JQWBK0lJA4S2ODgBWpN9L4wNochKzTJA89aKdBoyigDGv2xhbCR2YfTc1P6ENZWxT6YSwwym
 eplujA21Gne5XetvpXEDbzPkzItq7akEJ4AGm57XBivFrUttNh9hWJ+KheWunxfgRqucD7ow0gtPoY
 fNnOn8DB1oQxjk5fhaLSqTJAjJPxr+SgmCKjVFBMAkZOMo3RLQbUA7ipD54qIBClqtD0uXD363BkPh
 8bX3UAI0Pe3hVk1EZoRrPRCYnRHCyQPR60rRXkJPIDAPMy1Xw/N0gqxVG4/BKc3sHQJDBYZMyIdpcW
 wcQhKv5AiFQXL94ztbUUZruhqjXgjeJEjIXyq5eQ0nrpD2NLaPoWSVdSqpLE/Vb4GrZSOqs4UeQJQl
 +6/AOMjdeSvWzm1fuUa9WUfb4c5msquU+wUV0X0BIMzH8k2hYqNB5lIfdCl284P30ruMNkzvLcE8oq
 mH3qtVQkyNWlHQArb6s1b3jgwd4LIX6WCuoKg6FflOly+SioiCZm+3iqbgaL4RKWWCKlmCwp1RduE8
 23LV7miOE9KC7sgdulAoUwLwqDb4MAp0U6RT58GNAVoH8IeYxTNvUyWxUd2g==
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
index a3982ae22929..ba63bfc78e6e 100644
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
+				trip-point0 {
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
+				trip-point0 {
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
+				trip-point0 {
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
+				trip-point0 {
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
+				trip-point0 {
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
+				trip-point0 {
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
+				trip-point0 {
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

