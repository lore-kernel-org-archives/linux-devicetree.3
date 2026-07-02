Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B56947ECFE
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985724; cv=none; b=rubCePf2JA8f+b617D/TiI04pkgcjvPPiNy++Tg4S3UFYyIlGqQBzbbPqQgnhKFinhXhDldEJc0UfcBlQhyE0mW09TU/ZjVgn2mp03W1lpEikjXpLXTjv5XhNf2My/+rt82HhfgkYyr3oT1jzvFjD9+UepkC266TQOv9itV2mLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985724; c=relaxed/simple;
	bh=sTCOiDdPouMd9Hp7hUc7Jv8w7io+JLjHMvadYa9Zp6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CyNmjmveTtd3c/5qC+R3VULjEgfEqB1lhV3bcoY3iQ4958WIHdLgJnk2gVVhE9pCTDBxK7EY4OQ6w+v63pKr1mYR4BGvufAvaGws+6hj2qjjZDr36cX06NThaZXXSBAlEKl7yeWwB/scWXS7N0plhw3SoPzo+CliM1uSkmMxTpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G8gu3O0i; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G8gu3O0i"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c1950518so1951585e9.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985719; x=1783590519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRgzSQb2zmB8pWFIxx6qvYL4vygtV3dELTMaCNk1AN0=;
        b=G8gu3O0iptI/ZuwhmZr2F/OyA9LjZNuNyQ9PGPx6m9LxDLcJlFUQwUyg06o0zVdvsD
         aIxhBtnwq2fP6nxRwZuSH2u+ciAkmNPgiA0hYpLhUwLfEwG67VSKHl6nQGM4y9n0IU5S
         xzkhqh6B99nSDatoF0tkjo18se1gY9Ch1+hKWQ/t5+q682+D/m7y20XbaEF6B37Ik7V6
         pNv74X91F/j7nREFIntBIx+4eMBxqyy67Ty+sBRO5YManhGzT5vXCI01Dh5rYuUrRZ5M
         h1mzBOGiSqkg7BZes1Lo5ADLeZnJ90R7S/R32H8z9PLdV+0ULfWO56IhaapMF2j9PkyC
         FSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985719; x=1783590519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nRgzSQb2zmB8pWFIxx6qvYL4vygtV3dELTMaCNk1AN0=;
        b=mxbUBBcefeooSnsVcZr2MjHTcJcq+JziC9BprFPfdeaesrNiN5rJFppmcSOsEMVvwY
         68KLuzMA6HPFKH3PQCliXfrH4VEglseCHtINVpoQEY0c8lIPukJmeIrC0BCBWCWCLeYw
         30feTmkwsXX7y1K18RRmMb7/IAIr0AZJe+a7JuoRPI/vqQnV20Mx+B3MaAhtbEXVjhkZ
         Ns2CKB5kxiT+SC2Dk0qKGhxusGgB2QOmIHWw5nL2yMo0U7gJb9gLCW77s/p6T7DFP6Dh
         iZ0HOzMFS8weP2CMtVoq4De3f0ObpQndquUhLJyBygjvDN7Kiye8RNsI78OX5amYKz4B
         yLtA==
X-Forwarded-Encrypted: i=1; AHgh+RqopGMDP/gt+tRbcUrZZHHWFB2217RMZvNi1EOmRV+F3EpwPzjTF3YL9gY7COAmZ8pQRG3io/sTm3xm@vger.kernel.org
X-Gm-Message-State: AOJu0YzVjMzyMuTitECHMU5rYSYWiU2LQJEEu7cPNzxsazn+1mKjV8Fi
	HFPDDsocATloaDN/HAA+8ngmP7TqNQ0GGyeJ7WzRrCqIoJdqM9pUNex4yj6rVZKk2N4=
X-Gm-Gg: AfdE7clchhJ2kCXxS317eCZDTdYf356bdAGPjS2WToEvWR3RpHJvS/GW5xSaJXzKhxL
	2Ldd7TM4PHHEk1iIsW2K2xSNNk5jnfFc/ioivhMxLgLe+AjD/4jXndMpUCDn5Unp3Z1CRei5QW2
	Kr2K5D4AbilUge580dfx2JGWRfG9VNgZCmk+AWC1Z3PTnEFyUrIAAhnsklFGWd5z+0R6KbIkyDW
	JBQvg/EPgnxkXnf6doFV3GNxDg7O3czfPK76bbbwRRdS8ED3Fv8CDEdkmlLSOoupiCgAmwnIN3T
	rczev2LH0BSpzNwNvhHLKMNgdwkZ37i0VG2v7qbGDDdpukYwyy+oWBK7z63nzhqaEdc2TEWsgO0
	5jlFCOIYasMak33bUKpJU9nh9j9wsF5R+fGdW8gGv5y1GV8spJLg0PUeoXBNgCTCYoGY/CtGIBb
	iIl1cACA9In4Rl8gQEzAxxJQd1I7HuU8Po/PZ8Qyg/M6Jb
X-Received: by 2002:a05:6000:4612:b0:474:bbbb:bf17 with SMTP id ffacd0b85a97d-47740c35ff3mr7614587f8f.0.1782985718630;
        Thu, 02 Jul 2026 02:48:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4a09sm7656816f8f.13.2026.07.02.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:48:32 +0200
Subject: [PATCH v5 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8x50-adc5-gen3-v5-2-8169953634ad@linaro.org>
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7160;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sTCOiDdPouMd9Hp7hUc7Jv8w7io+JLjHMvadYa9Zp6Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjPyPHzcfdTz+rg7t+uEQtpgQVQKLNTTwY+x6a2f
 3bgsX/+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYz8gAKCRB33NvayMhJ0V6QEA
 CjN8q8EhuqpB7Gpfzlj1eeyJAv33wqDbTuynkV20JfzVW4b8PB6sGNY55NlJ0p2GZjzUIlapMK14at
 mQZEQwxMSRaaTDRB2n9LjauNX99S6uRnE+R7B6ZYOJIeKdjvS3W0os1I+gnhsuaCBrsyxMUNOJqTwe
 MXb/F7sM3YEgpV2OX1UnAQoug0axbkMKJnHfDINWyjf32pOJ0dQHoi/Z7Bt70ZgthyEly3hLyXLlM1
 1XER/WcTJFxOOC/jRTtnlalz+86E087X9T2sZCq1XcFfDLK3q7poxKwBNpKT6Kdv4cDBKIwbf+h7NJ
 19shOVQCDXYnr5Yvq4zMTyqF6OVoj+1zybK1gUc/ryzze5F8v1Ok7Ik+0gyUfTeJT6fVfJ9KzWGdYP
 MTnQj8YjQFB9DBYmUN5FZeL37WA3VAF//1MaLOVhsDYeqMgpWjtNNBhiYts5RQt8Xdot84pHdcy6I+
 j0IZd6Rrp5lsF0KVTjGR40ac4a4OJhwbDKKAPQ8ZIhmLNeaNckt2p327oB5N8M8UNS6y3VFWg8gydj
 agEVZyKLzCX5/+fNJC9zb457mqrjKAA+VT+ucMlc0+I/wvVZL8rBlk8qzezQM+ytaHljUe+GC4sUnZ
 0J6wJsLV/WCTRY9b25jnp93RqMSR6yHnWmYqzF1xk5+O3LCeIZ28mV/Cy6Ng==
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
index 2fb2e0be5e4c..6812e45d65e7 100644
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

