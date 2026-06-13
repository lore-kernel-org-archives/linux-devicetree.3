Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BB13C1991
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338215; cv=none; b=hNSZqa9D546Gf6BKY3RgVOCjJBO1xW9m6qls294UcCmhezBrDF63UC+jWLNoNBJRJzoRGwPFI4/M6kyASpsdS/61bQnPxVMPIEgSQieqvIInfAf3f8L+B2+8fKXG6XGzYHiFK+akQrbgnZeYx+KvBC29wdlqsnnoku/5H7cVSfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338215; c=relaxed/simple;
	bh=bp5L5N4e5uX9KDVnsGLbH09fAwvEF/nOE8lPJ6RWh2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t4PjGY865TPC7rh4Q6Cr5wk1/AoW9YPfNEpw+eQ3kf6f1dMQce+91w23idwyEFxzmyyjfFT0QUrOcREwZzs5YZuRiw/z9Ev1FrFovNqfmdEyqQIiuOcwLEnpy8ppLyrI1Ry5FMKhxrPBWCFNXW9xFcs8cy4yOvt80dvEUAwEMUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnQKzg5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggbZZNGt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnQKzg5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggbZZNGt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D6eeTI1726771
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=; b=KnQKzg5PO/AE1V4+
	QF6+b1QaW7bta0qOMMFLorKldndyOANFfUlvhuG74+ReHIHWXOE2INSUpeGSllJ8
	/9cGD5V06bWm/BqkNfmsbJiyvcbOB8iWnl0EfDZiX55fMoNu26intlMIdadK0ham
	9SdO05E4yPv9LkEgCzfPXo0O/Qtdu/11Zx4zo34vDUCf/1YK1NsteFijOJ4+CP2T
	vkcjaYOM/9162o07GQUX4xGO47JxnLsovBJtSn9bZ/4hpo0X4AlOXeVElQrN5K6T
	gpFyPgXK2vs8SLgd/2KerRmrgzb3AkyAtMlYkw2MzGSwPNUlGtygKxM5X0djsgDs
	y9ffqA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9f8hgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:10:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84245e2bb00so1653033b3a.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781338213; x=1781943013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=;
        b=ggbZZNGt9ORmpDkW3lbY2Q0kVbmR/h93+Iy+ay2vKH/u1vikiZ8EwAMYMyDhGuCfQB
         bRolEUsQZOF3KQe9NmoP3KyYacAlRiM2gsYnbVYKbpFu3D3zKeZNYjOcTmbbchEeBGS5
         togMsNSDbnQhwSb/Lnid1z2MpES/lK2czm4nFvKOdFmViriFuwPwoUWrtUz0ZAJ2tZWy
         IVAp6kPVTYSAxj41b6br1zt/fgr4NXP5Hlx4xMmd0rL9wrLzcIkwKeii54ImZfzm9+wg
         WKcAyOdJpoVNmPt69LJ5Gpts0/DgOu9Ji9pMPeb6LHoCQsQbnxE9py1qp0ymj4V4bAog
         jCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338213; x=1781943013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=;
        b=mHH/BCtBfgOZGuGwMUkJtsMgt1xC4l6PwdkmwBBCEMkg/UHIgjTVof+yMsxeswyYU5
         TdwBfo7XHjh28WePfbIRsIKvFCdL9Nye4yNnwQGXUMbjaE6W8Da3y/A0S+3HsUkPZbvX
         pEgMI7s+PD8HtM4YeDpZDXOXZ86pZLtGTxm4ESXfdphS5b+k/hk2rIadNvR9hsQqEkHH
         3fpfqYubYCS1YzHbrjSAAp+B1JIPiRTePfp8BYvEHCc8UB3JEZCTHMVfXv0LMRnD3Eqz
         07CFaWsQYqElsy580k8CZfTFwz2KNzpg8bJesXZ3i2wW/QLP7fv/NEx87/GEWZA4YIAq
         N61Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Xqb3W8VqPS5CoTWDrc1Bad1P6kIUMoMPnKiW6efaO/eE4Su8r0GFPh/+wPm+oTevmHibJblsRNbgK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/pVfGTaefeRMFSbItngyu4KyJe607kdWEfjCUiliu5leK9OpC
	//AcGbZbIhKqawKsPCGmlZmVxs+ZM4PhDA2nIZDk8/TUKXd1RrNpTyjEJ6mjwrdSItWastKFHmL
	/tOW9n5S5ilGtuGU3XhOw7qhFMjxdCtlp3EjusIIIONCkFFqqCYROdgFHyTiJOdMn
X-Gm-Gg: Acq92OFA1e58f7J6e4wVtQUs4rAFu5vm2CxPZSSlESPjB2XobxGNL8Dyv1GXUptHMTl
	KMSLyZfkrPlNyTdPXZBpve08nWqlg5av5q4VeiNV7LPtnAn++uqE1mJo14Lzuhs46c/ESlRLnB8
	gurO5U+mmindaYlQZ3UNOwJmJloK7ZDJI92gf+Klr3bc/m5rsMhZgAW8mgTE/k9jRFhdC/TlI/W
	SY7yd//jbmCOsd5+i+HiHlv/G4uqfXDdZarSmvPTX8xfpyDrdEKdUB3rjE4OWUA4BZuCeotchxp
	0rKciy0QyG/BW51xVlfP4X2bXbpThhk+QS146ZpP7s1XHHfJfcSkpavhWJcZMnzXaFN4b8urN+Y
	cPJ47+V58+qUugez09KCK9SWcMwsharcZnBwt4P+6
X-Received: by 2002:a05:6a00:a214:b0:841:edb9:4ea2 with SMTP id d2e1a72fcca58-8434cf40b22mr6772617b3a.32.1781338212777;
        Sat, 13 Jun 2026 01:10:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:a214:b0:841:edb9:4ea2 with SMTP id d2e1a72fcca58-8434cf40b22mr6772597b3a.32.1781338212352;
        Sat, 13 Jun 2026 01:10:12 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc5esm3926647b3a.10.2026.06.13.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:10:11 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 13:39:24 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: Add PMIC thermal support for Shikra
 IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-shikra_adc_support-v1-4-57d5e6c7f47d@oss.qualcomm.com>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
In-Reply-To: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781338189; l=3374;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=bp5L5N4e5uX9KDVnsGLbH09fAwvEF/nOE8lPJ6RWh2Q=;
 b=nWtpNRJC/b9ocMTxw7wsE9LPeekBLfiAxalwfFC9YehFAM4cC+XUlyIGaMzgNBaPkOKYvk8nI
 SQaPYuHDcWDCkfF+mNixcGq5zUi62OX+6sti0h7WaStlEPTI0aIkhE5
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX4XWyFnGtX43s
 UArl/PqkVDQKda33HIRyqyJ54GIowMaLMi5f69s5J84TuO5LPgVNMm+a7GV4BKHUWv2CfcGvv+4
 851hueBbintNii8cKKiuhbUeE5Z3WQ8qUrdBhvu8YYqqRQ5gNyX9Q0jhF+kir5MaNA9FXVrQ8wg
 zHM4ukXVe6bFgd2SbeCqZGgx0X+/AKCcp1uCUixTk0K7whDEtXWrYcsSTA5uWg2ScwWLlnDk8Rv
 eEr20NbFnF4MWokpgGFb+voDz9NZDg50MhOsqsM2OtkGn0mHKI9z7bXbTeq/EVllPdF0N0sIcsW
 3zh/U+71gD77b/o6vZpzN5Bx2WvHjqRakcTYCCGkPUgLaV9I+ZiFFwconyhRlO8FRiVRO4BBM7H
 Y+5U34XqJ2tJkUKkIBDXfE/muVKYA7i1/KnyiT0Op6JgFOnQkCK44uLL0iFbdjaVjGe1UXKEUb5
 OEZpxKLeRPmpchbrZ/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX8s51IQ2uOPKw
 WJ/p/lbz6i1uK1IJ6jNuoGFf3q89sKamBoxg065NPgv0ifmddx6F8gaHFIVm4hCnZOxiHci+xg3
 X+QQQBvAkQ0+l8cBThLJmWR9UFdDOTc=
X-Proofpoint-GUID: YrCsR6fyDw0SBCdJeeNtoeT9NfMkmDWu
X-Proofpoint-ORIG-GUID: YrCsR6fyDw0SBCdJeeNtoeT9NfMkmDWu
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2d1065 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eSwfGQiZR0SxMorl76cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130081

Add ADC channels for system thermistors, used for thermal mitigation.
Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
for them.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 73945bf42112..9ab0b44b00be 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -26,9 +27,121 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	thermal-zones {
+		sys-1-thermal {
+			thermal-sensors = <&pm8150_adc_tm 0>;
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
+		sys-2-thermal {
+			thermal-sensors = <&pm8150_adc_tm 1>;
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
+		sys-3-thermal {
+			thermal-sensors = <&pm8150_adc_tm 2>;
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
+};
+
+&pm8150_adc {
+	pinctrl-0 = <&pm8150_adc_gpio2_default>, <&pm8150_adc_gpio3_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@52 {
+		reg = <ADC5_GPIO1_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "pa_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+};
+
+&pm8150_adc_tm {
+	status = "okay";
+
+	pa-therm@0 {
+		reg = <0>;
+		io-channels = <&pm8150_adc ADC5_GPIO4_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	quiet-therm@1 {
+		reg = <1>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	msm-therm@2 {
+		reg = <2>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
 };
 
 &pm8150_gpios {
+	pm8150_adc_gpio2_default: pm8150-adc-gpio2-state {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm8150_adc_gpio3_default: pm8150-adc-gpio3-state {
+		pins = "gpio3";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio6";
 		function = PMIC_GPIO_FUNC_NORMAL;

-- 
2.43.0

