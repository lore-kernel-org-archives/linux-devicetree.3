Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2795647F2D7
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985724; cv=none; b=ohoFamxW+SceW3vVYTg7vmz1yx2lZMKXuMprmh3npMMaWtXU2Rt1609wLfKE4kGb+c/k2Rl+YiwDaoqk7NnSt+D+EQbPxUZ9uHya0NEMBdjzzEGaMsKAwrYWjZQVOJ1rpj6c6QiYejPe69ORciO1UcCu6AtkQBChJ4nyzvrBWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985724; c=relaxed/simple;
	bh=hrCUX8Bh3eFHJyaCVBgZRN5VZ7sNeUdZuD9namUBqv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YN2Y5qdzdR+gmarIX72hh6dKKSIwTwnqBpgKs9aLzXI99/ZH0PMOuUBU+PVinGFXI5WLHv4kQZcV+5tu+pJ8D2P02pcARNQZRviFZZjNkqdVA61i4UKmhRoX7rmIRJhz8+JsDlCVVxQYPm8RmG0RvDZyp6Hxh6A7sLRoCRLMrF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QW831ol4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QW831ol4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4629051c946so276136f8f.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985719; x=1783590519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3m1XjHxo7FhwfF9U5zDsES1ldCcG+EqOIf5nMHV438M=;
        b=QW831ol4mOa9Git5W8ltRYFuFyJ/on5sYiyA4DSbfMjAvr6LF9qLt0piaRYm7IgUqc
         rqt9GTyqt9FaKCp3ZdxGy/7GRuSEnLf+IzRjdq2aPmyvj2c9TEivJMzHFVWB5CRQmWu6
         SCcnJ9D3eNX/uLBuRaiBURyBbQcQdFRAREZ2PrOj3uOMLWT3YDaqWLxKEAbBHR331oNv
         WbFIrtT4c+zzF20INf0fb+EPZrbUBkAI5PNX7hgO8u0H4V0AKbq7pGMPds2a2lglkP2g
         T68sH7sDF+8Q8Vs2ICQHNDrW0NSSd0meLf3YQGbceW8Ut6UniyjbN5/H30SFJk0LFzuf
         g88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985719; x=1783590519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3m1XjHxo7FhwfF9U5zDsES1ldCcG+EqOIf5nMHV438M=;
        b=ORVm6qyOya/8zjmSEXUWjMVINtmXiV9SMzA9NRHWgA1hWa1Oc1/wdgn1DQX+byelMD
         uVt+HOXeot8XuHr9Lu8XZ8Zi5oM8C7E59pOcmEhrRh6iPI5XiqRct5XSnmUKxmmKGc8L
         RJDbUw4yLI1+ubs3pddQiUbH6hwpwzooMkzriXmXiCVBftTxJp9Tqujy85gUj/OYPnU7
         lyU4hKwUwdzO25cLSWYavdxWDI61qgjLV/evf3nN0+cXooPG4VknDULwv4y7ejcedL6p
         DsEgkW1W7j39YcRNSAbB/XdPjpvYKXC8ef+Y+H88qInfm16wuAP96e6kFd+fy0G42jUu
         8Bcw==
X-Forwarded-Encrypted: i=1; AHgh+RrY7vcx+c22Azb7GKxyRLRLofxfzUkBXcBI4NIFPSIk5E5k2slCmKJmhohYkcUHty6d+JGGzGEAUsLw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnbo9mrTHs91SOnC7Yff2GN9Xt7Z+QTcQ3DUNAFhmV52bb52g5
	CmfDfrQWb7qAidLL+H6P8XiK68iT8PDRvj0Y8pdcuR2OVHWR2j04P53iwRjlaqVR4yY=
X-Gm-Gg: AfdE7cmfXqz21y137xOMgHtPkWH5jZbdkRQacVR5hoql+1m6+WcMU7B67M2o9cmRHcf
	/FJ/DYR1cUFPmiI+eN80STAvPN2XP/c57Ou8rfDI2tAWbRPb2f42Vexea8EG2ciczdZGRVA0Nx8
	tuSVA4p02136FjNYLURuznWOGI0MrR9a+gmp38ROCbOTqUMaaCePGrQUrohxrCCYCleePv/F/Cz
	PxJIo4U8Kx2fx8FDWUUDltOtTKAHIV5kIHs7YSOC6JUhD+ssr5REauTl3zweJP3PDsUv2tdekbR
	RdtCOwinfK0ePotW61EK1DxUhjUstcUBqrj5yICwK5+N88CHh10zIhlmxt8/mqF9DTu8XXRzjNu
	n2N/1QVFttUe/Q8R8+tMMBD13ZAgyRvfLTXDhsTFxPDNApyMdv0rGk8Q46PQuUsuDNnCNv4fszk
	9ws3uwm28JA9nUaJnvv974FPlnKL0c/7de3A==
X-Received: by 2002:a05:6000:2404:b0:475:f0c2:75b4 with SMTP id ffacd0b85a97d-47746910ae8mr7790348f8f.31.1782985719406;
        Thu, 02 Jul 2026 02:48:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4a09sm7656816f8f.13.2026.07.02.02.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:48:33 +0200
Subject: [PATCH v5 3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8x50-adc5-gen3-v5-3-8169953634ad@linaro.org>
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7118;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hrCUX8Bh3eFHJyaCVBgZRN5VZ7sNeUdZuD9namUBqv4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjPyOubbD2+o8CAoT0KCXcScfkj2NArG9lJ9h2Y2
 MJiUOeiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYz8gAKCRB33NvayMhJ0XiUEA
 CdI7XBK2yRNl+C2PkTXW1VzzcOczVChDCEAPhuinmOKpN884EaP8Hd3tA9vVBqkeEx4v0YUFDowEXl
 t6nJVvKRWSlTjBBfp14GRQXl81FhAs58KGj0aAfVnu8cOzgTA95b4WEKuCejGp5Qjn6i58RHDOFXSU
 BsaRuE8AFWaA5//6zwGE+V7f1KL5oLo7/0ySa6Q6lzU3IT20P2tJnutoFXdhBWvHJ1J0R9YwL6EQT8
 MTGqc6U8I0D+zb+h8tX/P2GOZf+XCFfzdbR1VtrDGz2n4P81Bvdtj/9WG32MlxEWdA7IADpMN5jEfd
 msvdAl9pNYmvjCzEZjnVKWhSwCxuxOozh7BOiKmbA8JauPe10/d8Pzp+i2o5yeNihVwFLgjvxWddI2
 HozwbW/kUYGvWLJCZykuXcFbOvinIemKyKlm1HdQyj64alVeR4iiiZI9GkpJxd9agc1ny1DRlqzRQC
 iTj66q4EshN3M18VEruGpRBALQjfQTZ6SFzNabcGvdJlMHA3iq1FeJf3RZ9Z6t/2x3lA0Mc24VIjpP
 5eFmxiojYwkkIGMYfmjvExFPfsdXMzOUbplE6AbAGNwG7GnjyKRlk+Wsis4eD+/YmmOujVJ6xrib8I
 +jFfztNU1xi+uiTpTVTPhg0F2PNFlNJjrq2W6fQLTnklUw4Kb5vep2dMf6Eg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 277 ++++++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..96ea55c8c977 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -280,6 +280,92 @@ platform {
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
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -1102,27 +1188,218 @@ led@3 {
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

