Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E2547ECFC
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985725; cv=none; b=rDI8VmdI54/ybR1GSxSXQtEOdQ7e3g7m5cCbLN1wPojFG3mJF/YOt9Ka8VRHoRhOMOuY0Xziuk5mKprVvtyo0bh/d6IbSnQ+T7VQVsIqDUIa5XZ5IO6eHkrk2uqzJZE6neWiM/7tGIJwI1/v5RD46aMXCqYExFUFkdGPTdK3vGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985725; c=relaxed/simple;
	bh=cZQBMbT8UP2lkmDkrbhsxd1M8BU8CKf+pnrqSOPJnjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MmLO4+5szZ7u5WSXfhQLOK2Nrv/Eakkxy29Dv4KhgqaDItZk8gVhY5SkgbVCUacYeQqPe24m928T0wpLr8l+gHRZr9xDMdLoYmL27aHnamKJgGpxHLZkBqooNY37PmNp6IT/eCL9IWN55WeDNQ8eUJxbhWIRrfNUthqa1GWxt14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oLnMcweF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oLnMcweF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47122683cf3so1189811f8f.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985721; x=1783590521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HB0+Ooke2gLqfnfEYKBHHrjqRObfC8h6Th1btNXxIwk=;
        b=oLnMcweF1EHx/eKL+35kinpZ8FXhh+bsOvgSbjdcHw46ne3247BgPfAO0RszdZ6+ux
         JjI2M5P7GgGVJ6W0YNcI7Lgo8FX2UFaVoKN9uahBf6zq7ObWmizNzciTXmHWLoNbGXtK
         dqDkVBKwrbOi7Yvj1JFh03o2GSrGal0t2hdEpVI/AOf7vzjah34JXvJ7RbYO7eCj6qGU
         tvXtVKWSaLi5Y+SUD84GVD+8+weNEMNc0pwSW3pZQ3Lej7v633D+eaLT76fjEii9eJjO
         cY3OGuOHLe1x+barabTHcgzBRidbHgMvJ5JwLR6koM5BsrgZquHrhag0W+XqSLXzBDP8
         22iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985721; x=1783590521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HB0+Ooke2gLqfnfEYKBHHrjqRObfC8h6Th1btNXxIwk=;
        b=OGMsPtmJWrRvdWvbEzIHmmLLL4/nUA1ObkPNP4SUAmU5ka+LefEd2GAKBewGLUM+Nw
         lOCLsYMS+ZoTbsyVLwcnwbJ0d2toQPfGQJ8ez94X7/3d7l/SbFxHU8ZtxKyJDoT8L7SM
         xVjbQjU6Oh3L7uf9ZP6CY13z2d1V/QwPluWMBvN6HVcX5qXDh/p6RT9trMBnItltg3XH
         3zxAfJxj/1NK4O9UzFM2rdPQ88LezLrvqV3dd6N8dwMZuUZx//thZtCHbIy1jki6RXAU
         rSuKFj/SN36dckNauZEArjkPMmFT92PaOkvGUpvysin9ry+gQ3Bxepr0L478Cc+Q69JD
         6f6A==
X-Forwarded-Encrypted: i=1; AHgh+RpXGwWZMLSFEIW27czndHCC6kpUkN1VEMiPFFAKpDBLyKtXYUK4c3GY0Ck5cCAhMIVbtK/9qvUahtDz@vger.kernel.org
X-Gm-Message-State: AOJu0YyvlzyndhMJ0qFfn9zy1H6Kfzt9EEDwoH+8sLzcyV1IrT6KATM2
	oCxNM9rlpwJkXOpQ6Y9RS1nAW+vNn5tc4Ak3vlrPGGROmBQxUX+J7RxYVn4KyqxOzSc=
X-Gm-Gg: AfdE7ckOPxz8z6si0Oy0NUxpnjRxCFOVPVrhoZO/hYctJMN6bhdqGcAXEX4Swk2r9B3
	f2WF+v10MaVEGDbNgjqtS/oltfjLTSJ1RfV2rHmCC1LKJIN/WQ5ScBTu5lKWEe3vD0tha/s9a63
	vVGbbTmowlIQP/E859cuW7hhpVAcZtFCwCQG3OkJ/AxSXs7cB3fqbHtApyPAfIDneZmJXb/W2We
	gV1lesqKkaMQLte//aS3qdE8Sv1VF8yhSJc8cCnEy1MCw2XxbsK7ZsvVBZkVzkGbUyTnFs1UOCZ
	ZGJGXDq2u2rL33MgLiz8jS/t7PZhnnrfpjDsd9wAh51fSrJgZLvWhvPQID2wsLBi+QFsInpoNiU
	LodP955LtKi+CKIiEuAUeEPYlO/bl0jTMQG5sqJbQClTAY66ZXGa+AWluhM6W+V2HRUlNImn5J6
	3MpFSdOwMXFCDsCckpgNGkR/5az+DpS/dS1g==
X-Received: by 2002:a5d:58f1:0:b0:462:fdf2:3a50 with SMTP id ffacd0b85a97d-4775a100ed8mr6243526f8f.32.1782985720993;
        Thu, 02 Jul 2026 02:48:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4a09sm7656816f8f.13.2026.07.02.02.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:48:35 +0200
Subject: [PATCH v5 5/5] arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8x50-adc5-gen3-v5-5-8169953634ad@linaro.org>
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7132;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cZQBMbT8UP2lkmDkrbhsxd1M8BU8CKf+pnrqSOPJnjg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjPzPwh+SW0IWZozTis6PkT6wiKTrxFDctY28pEq
 T5+aNhCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYz8wAKCRB33NvayMhJ0YqBD/
 4wCihZ1S5iN6MYetUGPDDb4QE51F5q47BsXArSTC25DDUdz0fm6+dDPUQ5e2mnt6YyhHQAdDRNYIgv
 Hh5IF0CyBIEVyk65P3o+LGPMuoKhn6mrUdrrQ7xPlTTGB9Hl/xNiX1JElyjqiRtolZ7eVua5AUF4UD
 Nbmu78wsn5HE//EYnXsktd05UL7zkCzCJxGA9wJ8th6nRkSZc5R+sm8mlaQksRWoGnriUf4zPArzOw
 aGTYnbU3sbVVEcjrZMSawGNO51HDTrJ5GM8QUVR34D3n4E4fVLgUG1gwLOeurL2YDBvUvEaAuzsv5Z
 3L5m3WRTxcqKjw1dMlqqcVwISG9tCjzVnn6Me3/VUlm4KQCzDobdSNkOOgLsDRqvtWolE+QrdgPBDa
 QfEzaeSr+h/O/VVQtgUA8IAbjCopFC/bxhD9wt3EkqASUyHahEwH9j8FoniW5KF05v8pbgi7z5WFh6
 /I2GjK0kpmydKWKfSQaLSS8Z3l/YJUCFM03MiTyVDvefrfD0wCM0LqeHxM+KHLBu75Tzf/toWYOzEu
 CroVhDKX9V9G8y6jBAOhaAeTkI/N4IKPJ8nPMtGqjqI7nk0SjnPOG5hLo0imiPuugK9T3viENcRvjG
 jnBcuYIPH79QyuDj2gkc0ZIHyLF7uvsrsMUIBB5U9GIIee/RGms/nXnwDBRQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 277 ++++++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eabc828c05b4..3a4a27e528c5 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -220,6 +220,92 @@ platform {
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
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -1041,27 +1127,218 @@ led@3 {
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

