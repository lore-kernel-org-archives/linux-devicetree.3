Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA7646AA82
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647898; cv=none; b=uov2e3qHViUu9qRMNDw9gMGDGfqu7WsvFIq59ELZVxnVXprGXmyDSHvEyFaOa+bh3QsG+23IEOd3F3rYEl8EBtgjRza4Xft2bTlyzdfrllIsPlNupr/4/RGYTxOPe3yKmWF2R49kBU64z/4M4X/3W2Q+xqT+BDoMZ+xDXBP4tWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647898; c=relaxed/simple;
	bh=fUBYLqjAAjSrNZvoqOaEG+qwxyLLOtpJ1fGyhL+VBFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+voOzjSUYBKCINJhIfIWCHWS8ae5p5WjztTaB7+GJVMfCXQPr7hdluXMZNtWoqLSX4NicCNkuZvxWg0ZuCAccPeMb0i/D7JacJaiPg+O6XKwl+/4szsr3slRFKcqQuDqC2yxhU35ToKos40UpfyxBGxJCss3Yo9V/SpgrV0IX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zdKkaQty; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zdKkaQty"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f707e5d75so1783883f8f.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784647895; x=1785252695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIl0iUCErpvBGwvfYnQtkCczsuB+HGxyEnAA1ibrG4A=;
        b=zdKkaQtyutuxOYUeMfWEnxiDeZvLZSypBQVLFmfeq631/WtnrAYmOhwaATw/t9Gga/
         vhPiDH07+L9jhCQ6ZuoJZEJNZwdi9e6Ih31ovRbbJk3Vavt5UeX8Fq23dcWSH+YaL/R9
         2zyoZiA/rwdltfRjH9qJhEZvPA8+1Y8S3m3OcaP6FFDH51GnJgdYs1+FKptwh4fQXPmU
         FRPjXGMVlme/BCKXEtY4QrZKW/Tppg6vRcme6EH4Hq6GD80yd6lCUN/kFl6Iav8gAwJP
         chkGXOBVurE7GpaF4MCQ+BFTw92HJZ/MJogB+K+t5we1aYrH42RAuAm0zdO5RpY0Og9O
         5+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647895; x=1785252695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIl0iUCErpvBGwvfYnQtkCczsuB+HGxyEnAA1ibrG4A=;
        b=E0Qo4PH0BskvNApdNHYzRGBUKoiZueJP8C3aQUS6jFpLQFRqf0SeAoQvKBY7xdQCI4
         OAVZ0CZxWk7rSXbJ9mXUxAUX1tifRX3+fhtCLXofmFeFmQMh2lTXNJ2ODTLrOfvQ/Q3/
         89SiTEZDr4mqRufsd+lZOh5VGjXAxT3BWVU1qDsHyBbhAMv3C3IP/D0zT+yNt6dy4h2K
         SiTqY295qAUvQi2OqJrW4YSw0fXs/UvpfEkChcSsdPScQKzyPdICSyv6KKJOnn0yl21T
         nA38GLE/ULfbeb3qBVT6iKHEMzoIXkZxr91o4Y7bhqr8B+k58iR7kw6SbQ4vr63MC1KD
         c35A==
X-Forwarded-Encrypted: i=1; AHgh+RpNoVRkrYLnwKKOxpuwk7Ta5+8vE82LG623DXKR7Q6aOGd6JmasCNG3ikcJeHJnY8XY5BcIddmYfWcc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4cfPn+ow6/qCQPtYFcgr+gGDNIkyY7a5apBgI/2wSZrRTyZe3
	ZrJV4g+KtIvgG7KROWDEjwcnOWR1nMXI8pw8wqKYDvSwrSt0YflMflzaEsZMM6MJbUI=
X-Gm-Gg: AfdE7cmGMEuMs0l+wjai1qBTgu6zk3nbZqtKlMxi2TWL+GBFq+uNytgWK62BsIifcpb
	k0r0jBEkfQkYrYolnezSu8/QMrqdpO70tg8KSJAB1PwAKVKq2axYaeySzPwP57EFS/kUrG5e07B
	9ellAQreE2KF617rhSzxTf1wjZt1edTJhSIaCNdGBXqWxqr1r7jfmxYZu0aIBbwb2Xt/XBet4Qw
	D6t68KnwiC42lpkpsjfwdZTc7DO9BUANa8uiPYXgQBwGlp0l9wM+LqhxciycLjOKLsYRWNu+Ctf
	YGdmormtOupHxFcdA2TuXnLcrFDlil/4E5auygF0qxD5TaPiE+BNq0mD4keiobjXRaueQmqOjNC
	mkEUW7cXSXTIelcgVt+HDAEgOiBnuX9u+5f03qukPoYVCNe9E9msFSmVjWw/0DmtWUBrtjPdcYx
	Pnk0ACZqG5yX4aCd/kNM3SNh0=
X-Received: by 2002:a05:600c:6a0c:b0:493:a5d0:d1a1 with SMTP id 5b1f17b1804b1-4954a40bd0fmr163104345e9.31.1784647894853;
        Tue, 21 Jul 2026 08:31:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a63e3a8sm1043495e9.12.2026.07.21.08.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:31:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 21 Jul 2026 17:31:27 +0200
Subject: [PATCH v6 4/5] arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-topic-sm8x50-adc5-gen3-v6-4-a507f4a1e537@linaro.org>
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7168;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fUBYLqjAAjSrNZvoqOaEG+qwxyLLOtpJ1fGyhL+VBFU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqX5DSkncnFBS+040bV2LwloL8wKr+YYlFMI+7xV+z
 RV+ON3GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCal+Q0gAKCRB33NvayMhJ0fGFEA
 CsGbnOwqYjTEXjdodtn813EZjqXlzHz4oi2DzFMwjU2T3urFF6JFoIv4tk20JFboG+jx25pxqC2it7
 yaGEixq92sTtLfrSHaxbITpM3tPFTop1+hD9SXVLWtwE+XkZfK4Ij5yXHfamOfmVNG8NryEbCTU2Io
 NEW/zImU8WfclbZBZ+9UANpRdLB81eNyN4G4W2nNSC9lTwB8mn+l1rpLScEMXRYg38Zs7OA0neaElI
 vnX45hydhtD5rq+MyDbMo4SfP9GL3dDMSvpl+NorOUvZ4LoTI970mqt2N8TZx4fzUBDZZXKTpBpR36
 eEA7ZdhoZpqmFCXSTVI2iDN0zIscwxHeMo0aTilTr5f0K9zBYY4uGgv3DFaGwzqg7Tqo2O0eDeGDKN
 19iME1NG6OMjmhwoVVQB9VAfVYmOQInhjyNfjPO7jQnW9ZHEzXVxhDnjxQ/nkPW/qCJHFFy1WHwezf
 qDZ/6AOmBRLTLd+8WwWeOzFK2SaZfr3LQBgc4Mv/b2lGM5KFZnIK87SansauXqUdkLojRg5v2XAOHd
 I6sBCImF73a0XFwt+b81MZb958uRKWeMDCT3UwoYrcX7SuMO8soFrMkuCvkwMUtny8QFPopBAjzyn1
 JnfX+fFAPFTISc9bxS3j4orMWqLhupYvSTICBun+zGBsofGadXFnVBTsUK5Q==
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
index a28d70c85fa3..5709cfea1bfd 100644
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
 
@@ -1039,27 +1125,218 @@ led@3 {
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
+		qcom,hw-settle-time = <15>;
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

