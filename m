Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8FDEEA8
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700841; cv=none; b=BpuC7Ah3n0hsVvT+ihRQ/rkbtOmqEFwd+KyNk8+h6cvRapsDI4z6ecTuZVHaP+6EYGQxQ5rDY7oPpll9MKbfo4FiG8RxmvCa/9GaJQFf6MIpAwUNQKdvs3ni7y5Mg6EhOj1zee3wjR33L2RZOHnd7vEc43ZiAV8icWzvqXCrWMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700841; c=relaxed/simple;
	bh=co3zJ1YkSnTpdHKF+bz6CkAeVpcSuD9MWZee6XOEQSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=niVYv1GP/qedALHXSa19fTnNXk7wqJT98GBDlb20gzLNigIgozUE1TfqwaHUI8dGGDRdlEbuLDknAEUftx0fUFTO5uxTeMPnBuJ/zh27hYJISC6Uxt66KgFvVoJhRPEmL0cikwOL8mQ+s128HZeTqBhXXnbOm5gZkAQuu4YnxCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mSGZM1uX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mSGZM1uX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso38195985e9.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781700838; x=1782305638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEP4f57V0XIAN3mPY8YqCX+FrVX90yL/cJOfjBY3eLU=;
        b=mSGZM1uXlaf9XE00CLzsHQSob50hWueLF0pLW1CeGb/SbcnYf4b7ruaITEMgLa/wfH
         nE9vZvl4JygXOwA9l7xOGzUuTJAb9lYK6/wHjL4qNCMEg9UAxWDWc/mtSpkVjeosYuRc
         ykkBWZP3vTMRzAy3if+mhfqegMa7q/wzkz7/ygIGpSghJsfsONqLCJn6KSOAHVoVTJ9m
         riNHh1ZOtu3A+7UEpUklo9athWnjDSUSQkG0pyzqpFYTYOpxKvt2YOoxtp+6MmJsHBe8
         dfJYxOPPBJYL96YvDdYJOMYOVjHHOr5S1e2Y3B2LtubIiEyhFFrDLWQkjK8BGCbdJSB8
         PegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700838; x=1782305638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DEP4f57V0XIAN3mPY8YqCX+FrVX90yL/cJOfjBY3eLU=;
        b=b158KnH3YDJ5Dm0UlCor9dmY7qGEfYu/0MahlPte3ZDhcEIYiFO7bMqdiFyqBwO5tJ
         AoSHUkybf5V2IJ0spB/ko+yYH0CS8h2uAbB1wtmJwh11QvxhBuHvGyRVg1RIwLMI0pHc
         BV6VvrFrJ69GpudfnYhTztXTLKhwiTmaxY1laQFAr9NBngoUL5BPAkgQrKFQC3dsPb4e
         eubcznQ8KmNHnzlMCjaKi0A73JfcO4d3Eh/bYPUm4gsGpb5OGt2efsy67uXT1X2kbmSS
         epAHPlrX8FYr1ChTapNFdjKHwoQHzPNiUW52OLcikcYmkBJfQ61JR9T907OjuEPQXZgj
         vgBA==
X-Forwarded-Encrypted: i=1; AFNElJ8UtwGYbJdgpb1XKtbTDBgpk5resNe+zeo8GFrkD2X6MqTDErurEc3ANaSYcunPKtK+JpAP17KpajOm@vger.kernel.org
X-Gm-Message-State: AOJu0YzEQTxmtYgg/gQuGdioq/TBZ3+If//3VNhgb3L4JUafb6KeECig
	pr/1EqzfEdxRKsgQyw1SBKHH6/yh5bntGw5zvypu4AlaACtyujJkbsoeY0EpdqX4u6vzI9pzKB/
	gejRW
X-Gm-Gg: Acq92OGk+qG+vA21vdFFWk4UrWxlmgXd2+0iLQIQHjokyagC67PpDFqdS+gJ5TcTsMG
	hwkZ+YbuOgiVTX3e89Ym0kuQXnA1QZOxble3N+nNnT5pvBJcM2MVCEJ9oepi5hSN2ZlxjiHkKqE
	Hib2tVtNNdHl6m4KICFRDrMBJdsM9FmE7Sb5/rfAzVoUIbllZa0AUy2/44E9K/PZNZpy8QmJUmC
	IBf6JZLAhKbIDydiJrPI/Izi9+IB32tt9XdKrA4USZj7705cXrcFBZ3X+GMrmKUeLpzvjMaWWbm
	qCsisCsu/wqQolm2anBQdjHVciEVxPTvwVbn4cAxmjwgzW+ebAzes9nPXxBMoE8RT6Ed2svrYO5
	WcCAMyGgdlKd2vk4Zr5TVTpaoOzQ0TScX7EUUCPbY/A82GK1Qnmyxyy3CROawbBln+8pdn8qre4
	+xEwzuPPgHKEd7SUTzpDTVa+/8yCfU/xPTUUEaYTkU8xds
X-Received: by 2002:a05:600c:2947:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-492333f5dbamr40385605e9.10.1781700837751;
        Wed, 17 Jun 2026 05:53:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm9130562f8f.10.2026.06.17.05.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:53:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 17 Jun 2026 14:53:49 +0200
Subject: [PATCH v4 5/5] arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-topic-sm8x50-adc5-gen3-v4-5-4af9251731f1@linaro.org>
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7153;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=co3zJ1YkSnTpdHKF+bz6CkAeVpcSuD9MWZee6XOEQSc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMpjcfEwz+3bq23HGrknx6+//uwN47parhOyUTHFv
 LpgyW9aJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajKY3AAKCRB33NvayMhJ0ZLSEA
 DDc9BRqCZ6F6G/LdNeWscm0ml57UXKlbeSl0ElfwkwvnIOKM1EtswzLfFq8MNV3uGuO0jsxbbLXCkV
 6p8jthK+x/x58V28CRbUdlLvwPgGSqSDKbeRs1X7PN5zXRuZ9sEKQVQFIYiXD34sWpL3Z/b7BQmi5K
 kWJ6yCIgD65uJSuJM8wXvVubyIz+Dwy+SekT1vRNo6M3p5RwelBNwJZT3V4sJBFR/H2B6W3D66wgSI
 QJPBWhHLHDJjwgwDHt0gSpGjLqTDCAHLI/dQ/7Q4rWMx8Pl9A0bpYozAw9DBSmW3xKaXcUDKX+T5BV
 1kVsG/+bUeEgBHk/8EA3z0OiyFJPMOpRnF9IAkhHjSkSxfPR+PE9W0y716346W5L6dAavYhCIaNZNp
 l/sAphV84i5BwmILKwkqt9LVo0eU3OJrj/qwsXBViXkmi3xVERKi/7JsRW58e1Ig3jejgP7ng57w+X
 0qg8qlUEHVRJWm2JISWd1gNoNG5p9U1ByHyHF9BX4cGj+dHaDPD+nJARLyR3vE3TLvLrw2Zd1IN4Bb
 qGZ8/c0fzTpL2V3DwM9N8JKRapQBB3lE67H5nP2gnZS9DamfNkxejXbF3533ItNXcoCsx/1BYxeBc7
 irAH/aOuNH9Q/N7/UVVqVcnpSfDpiwhXRllpJ5Jx400hIuuqg+017fKAu5Ug==
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
index eabc828c05b4..05af2913055e 100644
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

