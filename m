Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C884530100E
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786284527; cv=none; b=Dbz0LHzfO26f315JL0vacYVNEhv0uTfq7ywrBhU1Pot5vzBex4zWZze+mh4SBfnQB3k4iWPHXpK3pyxuh7GzgHrDgwyb4XjSlVqJ7cylDpUekYJD92Z2MIVMP5pczaCswG4crUd1tP3GKEkRHRlX5rB4uNCSbpxAV+LTpkEfD9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786284527; c=relaxed/simple;
	bh=uGmKrvtx3eojEbMqMZz70xixmIf2HPpWeVEnTSYKvok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vBU+v8hN6gDb908VWLvmggEpet42a83dj6loLYb/z02j2BtQdZ71bz5uEjzVBuwpK51Rlb+7Zo8ngbh3stnwNzaX/DF2gjkjob2gfO9Rh56SI02cQ5ClwFkHlR6GXyFNVt3gv57IweR7567WG555xpr9uHYQ/om6YeOrmZljwjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhhcExyH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7T6kR79; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhhcExyH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7T6kR79"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1XI13228355
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 14:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjIX82XQNtHd9Zd6TazlW9jA6rkSkyIlqGkdwP6zTE8=; b=hhhcExyH8Wtv1xRW
	63855AYgxGJXuBzhGynpcc2wzyqejiWDSms9O3sWAjKYL9/yqjyIT/jKE3bD5j0H
	BKqv5kfjBZDjySrB+M9H30gI4bwIbQmsHj68m+vhyThzN2h5i7WAkvQBThUObbJY
	WMIcjhLPyE8a6cZcLcwvKBjWn3A3WKpUUEsPpzXIZfiqC0F/+8CeIzaPZ2QgOVXb
	1sEaYcO/zqiQa5FqRSxSyxhKYhCOKGvN+1UW78asjaOBPcXgWAtH/TjRrM7sQamZ
	65+VAkOhx8h1CdwT0zK4n6oYUANQVLGoZRhxurVcfvw+nuEFEJRkI066K9P1kUiw
	Ps924w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqk2qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 14:08:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso1884533a91.3
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 07:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786284524; x=1786889324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DjIX82XQNtHd9Zd6TazlW9jA6rkSkyIlqGkdwP6zTE8=;
        b=a7T6kR79UYUU6nOgNBlkQSWpF1v18W5SVuGc0oGvqP8ixiFeh3eXOCQ8wcEGQpIZQs
         seUdFwDBvmXjfPVosf+exegW1jt0Gb282WKYcVizowmsngWyIzIUxAHPDlR8YtCcg8pl
         s+SNL0/uYzbE90sNYvQrsDsrOwc+c6sdCWtl6OeE0HEOGHmhbo2Ptv7JMMJuMRpBeKSA
         J+D7aRQ4xQFMAwtJLpkxCkWJtQ34wQjUuPg5F3FLF3gxjD6MveA0zjz7EfYOIMeH7mmN
         OXEZ+J1JXIaVx7d2LNVJut7foNpmMSCtbfonqVGAzDaOlZ8yP+lyPVkZwazlkFraSK7s
         CemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786284524; x=1786889324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DjIX82XQNtHd9Zd6TazlW9jA6rkSkyIlqGkdwP6zTE8=;
        b=hsKyKJ/OPKZ/nKiCZULG/j7AMdiJKHQlWQJsBpPEw56Bee95CW9S8ZQr+ZHS3ayjTp
         WNwUwZFimOmPXSx7n5TlEGWvGI3JUH8K8XEg0MyG+tc1mg3i2kd+MHSKAILTqehDHx1F
         eOJJJ3ZP45ePIDnBABnaXsVdZNyKcPz+S8G0JNP3tYtroX0Z16H+HoGvWI6Sg9wInqRm
         Bf/5HUeJkSqcYn0oqP1P2BAQysuCqotC10j0UH7EvWQoUAgV/sUYBiC5mX7/WYtcr0tx
         dY9+2JPb/o2WLEvYQdbko3KsGoA0mhN4WLpdNQvGO4LSRUYtuhk9bl06jrYWMabSf/DQ
         YKVA==
X-Forwarded-Encrypted: i=1; AHgh+RqrKlSCM3dOsCGJXJhQZP6leSxUajJMg9q0WDci4q2U7DSVDyr6NqdR+sZHBNuQ1zVn00acajB1hniu@vger.kernel.org
X-Gm-Message-State: AOJu0YzutnBmoOflskG0X33/2urFUcSL7Pel3a+B1WTi6YbA6AGFbfGK
	qW/wfrX7d33Ej3ULcaS740d1JZ5z/RigEcCwbmoXFSbpf9hxbJNoKkN/EzDXpd3H/sz+TB4DqEy
	hobZzcUhikmnAabMIA0xo/4P5alW/k9xfUWOWvTT5GwF8EGKkhHhz2Ax6rcYy4ycI
X-Gm-Gg: AR+sD11r8/rYZIVw1L2fBpczmGDc/W01eQInlH6/ITFMseje3d63yJd7yC6PBnJRZe/
	jsaxE8QLeuJtBEt1kjQB9pQBn9by0k7te4CDaEiuvsLrSmFqjpQOP/dqqFzsLrpYd0E10l5co2g
	PLiFdCBl45f7cJAT7lR43C6x9Su2ktCJRX3CJHWTA9UJF1/xs7aDHbMM4g3hd8D0PPo1KtbgZrN
	maU+rP79HPwhQCm2NGqjJUfx2QJ/2Z70e02asxSUxiCsDBgM1w5Da+66n6HKRfqM4L+mcXuokct
	3hlZJq1Ncd7Mzy0kvJyuFyq1oxMo+c1eNoSqaT5vJsx1JQqCnWe7A/tQMuv77kRsHX5U0VtL0D3
	N9RvmjE4/lcWNuqAvoio=
X-Received: by 2002:a05:6a21:6e92:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cb85df2778mr48914102637.14.1786284524349;
        Sun, 09 Aug 2026 07:08:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e92:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cb85df2778mr48914052637.14.1786284523910;
        Sun, 09 Aug 2026 07:08:43 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm25489437c88.6.2026.08.09.07.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 07:08:43 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 19:37:54 +0530
Subject: [PATCH v5 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-shikra_adc_support-v5-4-bf6882d18bad@oss.qualcomm.com>
References: <20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com>
In-Reply-To: <20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786284499; l=3566;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=uGmKrvtx3eojEbMqMZz70xixmIf2HPpWeVEnTSYKvok=;
 b=E9jqrwTa5UsHBjeDUvifslVA6kx9K/v5ad2S1TcP2CBB0caqx3MmTQLf0cpSyINLzdwjh1BBF
 kPQ55JHMefkBJq7hI04xqWDnwEEL9lUmvVxJuhU4NEEkDHC2gI1OaD3
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfX+CBQ6BEDe4y9
 QRpBG8LaAfvCoWPmpcuS5nwQG372RhT2UepOGLYmN6CqKEuHucGYQjTqG0GVlH77zWXGrPTgWg4
 he58lmG9O/ICeSBE+bhFqWNgiHCiwLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfX5oOAdeEAauhf
 sHWMNtPdzquDJTroE/UqW9KyLA1O3McVrknaYwGdNzoEWGHD9ocX9z1vFfv3/Xmp7lhsUrRarlC
 MIJko6D7enwqPk/aVMkvk5Yl3iOFsYJza1VEttRq2Vk9NE0JZFFlpej3XcwLf/j8XnbJb6Ay7p/
 VuKEh+Pvc+djR8GE+ZeftH56WHjM5JT11HXUsrrURKImUadqs2hhAO5DcqDw0AIB6KbvxQPg47y
 IkYA7qVZatkybodt+X5GIR20HM1vUxrhY3WOq9xjz+BQ+3dhHGazZrySk/gXix16r14ek6qWIgW
 dgM9xbzz3hBOoIgQsS+dzOXCSJyUsarCNBCdQ1aZdBeVruS1iP8BVYxAU5RzQLm/+WSUaLzEYDm
 Xg38G4au64VcfRFELxOw/HJPG2rPUdpWzQOWHdabbOCQsB6wX1nHWeaQ5/N+OgCW5MQoL2h1iEC
 jS+aNH6yQLdKDdaxD8g==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a7889ed cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eSwfGQiZR0SxMorl76cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: xxulOcYHv73fMeE9JkUlQMrd0xnMI7A7
X-Proofpoint-GUID: xxulOcYHv73fMeE9JkUlQMrd0xnMI7A7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090125

Add ADC channels for system thermistors, used for thermal mitigation.
Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
for them.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..ede34d82de76 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -31,6 +32,44 @@ key-volume-up {
 		};
 	};
 
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
+
 	vreg_wcn_3p3: regulator-wcn-3p3 {
 		compatible = "regulator-fixed";
 		regulator-name = "wcn_3p3";
@@ -76,7 +115,81 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
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
+};
+
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

