Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BE43E3C55
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912202; cv=none; b=emPEwyZwZEuGGy1t43QmybGmY/CuR85YHimM/DNEabOtEyIIX7pdy16e6uXqRSFVn0nzkifv4ZqRxpQ/91aUqF96i7NgHhWeNSjSE09bC27iGD0nH+eYr5RjAIrOyARZAcCo80rrhdbngfYeWwRU//1yZdXKDUh7B6n2J+RjM9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912202; c=relaxed/simple;
	bh=gh+gyyibXVgmz6oKLPN+g/HIIFQnoruH6nJZZLk/vMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vy5UM3LJbnA4rKeL4RXrNe4oo4+dVye7Nk3ukBdiogYs2vg/38xZk2C10I89zIGRiAxVygKhIU+UStIe0t4+CZr1v/OIy3XcQ1AHXL44w9anJui2SvyNb3LxjFa+tgLsTu6o7zMPZRbINPIU26Bnji6BGF2P9S6hysnhrwiABW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DG6vPdZj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DG6vPdZj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488d2079582so46497985e9.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777912198; x=1778516998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7nHYFe9E6eacQa3hEJLzgoVLJqj03Ug6IiFcdL3B3E=;
        b=DG6vPdZj8FTCuc/ssu3OCwqb0RSTtKOwa7kVKwa3xk23bYlY+zD+v/0LSdIfhxsr9O
         Ig7lbhKNDrZO8ABaoOgSBpyRu/q2xmRH/ySpgZ+KqQelkznWj1oNkPPrh4g+tgDpVmXO
         j1lleVN9ZTK4rfo8yMApiu+cUXxI16+4/65WuzRm7mFAOwto71CuN632oZVMN4Xp5hjQ
         06rPrEcWTDlulyd2xvAN9sh6p4T49B0Dq0pGzpB6fi4UwcBhsYNXOvzX3YRS5CUHn6SL
         9zsG2Rf9VgN43OwD1d3KEz6sD3fN9flwhcNpK2y2F2omf2nlBep5ozYwYDMcGHKbAlYl
         2XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912198; x=1778516998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P7nHYFe9E6eacQa3hEJLzgoVLJqj03Ug6IiFcdL3B3E=;
        b=dX43YcOSxAnA1lfGsDSSuXZblBNQYMnoPaVb7SY1nIJbHK/wFgUUariqUwzDu+3zNZ
         y/eSXekxHJ8wrE9G/t/EN2rWs3Zb7Tr7E1Q/wjMlGsJc5ISlxwrn4F8fcnhRxuOxuDWW
         /HNvTa0TTgfn3Tb3fkNOWX1efDFZ2lKBqcgVKp9Qspfs7ZjvUDBb+DQpG65qqRMTMvA3
         6s2Ds1HDGr5mC/ESjx1KolR2J9tuMiIIN8/HHdzdbPK55+f1VKIPpWD5O1wZULB3fzI/
         2Px5hXkjck510QdGznN6Sf3JS+icFqzskDTgRc7jHPh32Yn1XVQo+C0ERZwUjjyj5yBb
         6mig==
X-Forwarded-Encrypted: i=1; AFNElJ+oFumaZsjX6H2UcXC+wWTAe6c/ybIUo1EZ8HthzrgLnJBT2miImntFTgZfwG5k4t2i7CjS6ao0TaRu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu1LVHB/vjXugdNCcIPDdgEgrwx7/KVgz1xiRPk8eSQryGzMst
	WX2N3ti+sw6FooTcdk/yWJpQY3TMwOmdSfPPcr1YprK6HaLxE41n0ovpA9N6gcLK/uA=
X-Gm-Gg: AeBDieuOPsa+PD3zc05z0I1eI5MZkbw6XVe3oVGdc8GhpZ34fio5fS5XP+lKENPtM1d
	Gn2Z4q3qz/j6jkgNRcrOfd03SNWLMrDd5rN5ROmLMYitUAd+foo3VOM4GyZwsCSgHk9pfTK+xBT
	c7ra/UmRn1X65wv+hxIxlNVGs2tTZvj2CL27Iq2+lnzg9Jqw4EQysGePucs/Oqm9B1A213lhe4J
	04U4a2v9tnztSc+VEHogBBpej/M63YsrtFlivmFVI/Zi9BpgzBoMrfp7dGMUoQ1heOEBBWMjl4g
	aZDrGjeyzXo7rSCIR6eURt1BFc5YcN8NFTi+XqF9W3pfQD18RtAhTPhYvyWsmEbeNI8V5BVIQko
	ZcfQ7qo9Dd/0xfo6EebGjhXosJderD4ejwfypOg3PHyZj/LVX+xhKYqYPIaZRhPdKH/s2xbqos/
	jCblw1mUatmnvRaq//G4ghZxGJROPd97/bURI+sxkPwSjhFjZRvOqXplA=
X-Received: by 2002:a05:600c:797:b0:48d:35e:82cb with SMTP id 5b1f17b1804b1-48d035e8304mr73707755e9.28.1777912198227;
        Mon, 04 May 2026 09:29:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm405071055e9.11.2026.05.04.09.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:29:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 04 May 2026 18:29:51 +0200
Subject: [PATCH RFC v2 3/6] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-topic-sm8x50-adc5-gen3-v2-3-5cc04d6ecda0@linaro.org>
References: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
In-Reply-To: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7619;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gh+gyyibXVgmz6oKLPN+g/HIIFQnoruH6nJZZLk/vMI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+MmBzRv1h4V4+Zq37nRotWEtRJmYN5sKQVx41GQo
 ESbVi++JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafjJgQAKCRB33NvayMhJ0RClD/
 4sgagGX7c+7hHyUHzfZ22cRAdwFwjscPfS3OYA9mFKBDMnU+nctw0eh5qf2OG9Hc02XjgPWA7tiEb5
 IJuzGjv+AdQa25kkO7S7rHE+TPkd3eadHRvA4qkBCyMLgU5YHTL8ag9x0s6QI3hqqQu9Gr4rR9oyWB
 3Aa6liZmwRjC+LLxDt4FH3nfiOJTBONZ4e+bzz7mKqh0SdcI8lqYlxQ4HR7w23zHimNrdjtRD5IEyf
 srCph9l5sl+x41vcROVoOHyt+MF66tflLtVY1qSSd1SdzEZuWq+Nh4PUxqFfKoQp5vx9SMeUfuSovb
 xgqlymzE2EufDfKlVJNuYvdiz6+8RU8uOgj7Gc2RdA60OWa0RerdUEiGV6yyQr2oRGHsz5AJ3m478M
 UrQCXBcuGQa+1R4s1/nrfmDGtYm5t5KCD9z51wv+ReonWEd4rJZXUi4LtIfMmVK4zKzTDorYpCNSBI
 MwAKW+oueMgSW3cwWjMBFoPqwmJ1odUVuy7onGBpc6vgLwIFqBTkfx8V/faur4NfSIFhLKMGe25wZP
 eQAMisYZeHy8+kiL5JBlRbBab0YNe21qJB667B07hzwJauWFFOEINlvjc8UEtRhoVgJEl5JclKVl/F
 SSsGxkKJL3hI4edPTmiKMvrbUBatLTwvXjiJLezXbvqZ+q/IskAZ4bg4QvzQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

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

