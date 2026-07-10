Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AB0379C36
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666366; cv=none; b=iuvUa0yedNArEQqlUj98VRlv1A/3KkdYOGZePmPQxoOLBhznyjkM/p0oi3GQ63uMu5un3GFjkZFc5cXRxBBmH+42L5Lt6nsBniryW+lEO9Oy4qEiflM7erwdZ8+WJ62sVjXVKCtg1svOoKqFZOrUZPugIxaTxjVRqK5Gk+6WVjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666366; c=relaxed/simple;
	bh=bp5L5N4e5uX9KDVnsGLbH09fAwvEF/nOE8lPJ6RWh2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8714tsfJf9TZaDLlxPitisgj9yKkBgmgKum3CI04DkXhc+tevSWYCc2K0ozvAyu52J4nyNpEP6xQufftuLnJCozy7ynb8raJX6fNIRqRPIFD9rTLn3qvkzXkgUnYQSH4GnacpJo2VAeiJeMSsjV0msIh4cTNph4yLQkossRsWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTwHgtFx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eV/98kfl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTwHgtFx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eV/98kfl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3nOeZ3753137
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=; b=HTwHgtFxCX6gKC3r
	r2HwkCAStEX8sKnDrjE19y18ucPIx0p8hx9GGWmvEQGGu/f4g/6PbwCIWmcz/DMY
	+7SZMFRkzxoS7hpupctdOhkFlIobg6M/P1E3OksnvvHjClvr/9C6IqNCNdEwh6+Y
	LfwOytiW56En4tzgrXaozQ3bxRHqwdsO/H1bioSU/0s6RbhKgcoB2quCzHvoCtaG
	1z8YuC9u3EPyAmRDoOMFCpiLJIBBHapwwnsLR5O7KQi2oOv8SDxfC7F/MQ8vsJfe
	u7A/+KK4WUVwH7xYOZ0HLq3kjZn32kisjJGxUY0/cJfebUc6ACMB5EkqQovJjRN8
	fnVsgQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjbdkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso1087719a12.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 23:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783666361; x=1784271161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=;
        b=eV/98kflNS5qsz0Ua+cZB/7MNOrddMird0I+seGevcKB58+rOzbp2x9R9WzZJU4RAT
         iSfEW3vGqgvlv2FcVw9OyVOr2FR70dCGiC1BN5MO2fmtu1GEUnx3NpSPG+I60dhE3SDj
         0KbfsVBdWkdiYhJ/pzn1VXlWQBB4oiC7vBECGH9swC5g1iYeJSJjat/53+egK3uUP2U+
         +hkv2FlvoPB7cbxnT3plWIQy56TibMN6ugqgnhD/SZ+tTBah06cR1pxuW8/UUrSDAA03
         RNeFK8a30x3AnDhVZUw41algvIsZgco4rf68t0QyjVlf0Pn4NZJuxbTL/fFwXglap2qU
         yUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666361; x=1784271161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=;
        b=nAoURu7R0H35DQLabs1xGajSVqYYUHeLBEEGbQL5XU4hG7pfGvyM4VD0q1/4wte4fE
         5upnCu4lBU1GWyZ89iFGeCywn4TAC4Em9ZZ3XmZEKPofvZAScCipXSAhWUnbt6Cxjsuk
         jmwSxMg/RtPbGxMq7zESzjSjRqbVWzelLqM1ZF7k/lwFeHMVDrlEBHakFb+0DRa4QTwE
         yGNee2gV/XUve9ro8pqeKdAZFAB7gGSC+ccc1pHkC6xqFRGlNpx/nDKtvCaN2LVC3yS2
         bsigPA5b1G0HrTvV3fkXrL02z3zkl2/U9kvJrzBCYYrknBUbzsHSVKTT8MxBu9jz80P5
         RPxQ==
X-Forwarded-Encrypted: i=1; AHgh+RoD3JPJwR8RHl3KTKamlGyzRwmHQ8F9r8bK6fD+5ZEcopIRU61D1wiGjt/MJMmBNCQuhH3gUz0aIkUR@vger.kernel.org
X-Gm-Message-State: AOJu0YyjCP4lf2pDRtu6X+x4U2iwieTrJ4sWSZcaWUwr8MAXTVsvyF9Y
	KG/rkpBo2WSZjrHYUDoX09r793abQQag6/pjP7ghfIvmJRk60vymle2GN7NvkRQ/kYBLVy+Xy87
	ZBZackGHYNLoLSFCUXnlc/bolh+9Y2xLtI5DQHw6HNbyFZr1rGF1K+vGNAWmQW2tP
X-Gm-Gg: AfdE7clC1U8Z8jDiXIOvV5VblZFDsxZmHUZQiv3mDUWDOtJFcDCUXhxS45t1unBOTuY
	tE0X6flxKRDAB76HMOAXAamFt/ue3nxsS0S5GnRbxsZDSSqeNYWli2Q0W5rNrK7u7x3cGAbXVpa
	vVXpg4IUHjV+2sMYMJslMqwE8DYM/ZS9ZnKP9AmOFyApgHvv/7Gl7qoEzpSwdMjeCk798XW73cO
	4pbYz0zwLK4L69akySBmNtT3sKxPNMR5kS0bbcbOsMZOBDvGvC3lTAaUzHgEourgHx9FA7ifV8Q
	g/5kNyAPHRaYIEEXEvQWmAa4nst/BJ8oT/QfbLHMfEuoj2BD0VAh75mILh37iqd3i+0KfhtWgtI
	V61IDqS/jFtnvaETaUoHbXUaT2+1cdQ==
X-Received: by 2002:a05:6300:2207:b0:3bf:7f0b:2f70 with SMTP id adf61e73a8af0-3c0bcf4ffe9mr12318672637.34.1783666360692;
        Thu, 09 Jul 2026 23:52:40 -0700 (PDT)
X-Received: by 2002:a05:6300:2207:b0:3bf:7f0b:2f70 with SMTP id adf61e73a8af0-3c0bcf4ffe9mr12318595637.34.1783666359634;
        Thu, 09 Jul 2026 23:52:39 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm31618301eec.21.2026.07.09.23.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:52:39 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:22:11 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra_adc_support-v3-4-ddc840fca0a0@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783666340; l=3374;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=bp5L5N4e5uX9KDVnsGLbH09fAwvEF/nOE8lPJ6RWh2Q=;
 b=Hn9V7hRuGe4fwsCkL/1z8dZh3uS6vQr2sYmISXUQdjIaWrBOml0Tl7QsoSSv2iDX4y/2gph3i
 dSJM3+NriQuDQ3yf4A6T2JCOx0LFRw619CtHnZIf30d+vLTWF/pkjDp
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfXyjKJP9Sp0j1O
 IMb1MDb1IprhaFf/N0c/rUyHSLOAlUl63eDEsur4H02PTtWLpMxjJkmNEfREuuVEIVSQkYB/un4
 U8tjavS1TZRUT2kUd9XU6prheUIvbTtFcIw1SDlENEIdZUXJaBZ2K/6mdnV1dlfeuMYrw/IdvHe
 BJ9D1VH1avlToLBJdr0G559Q/d2+VzrdKzfpHxth2lkoSlGMXInaiWlolYvIKoEl8gKQ0knREgG
 1npWa5iK6U/yl+bIOglIomRE1v/0nNKkRbR/pC//IUDZwl4ROFw7Bvff73PgkeiHuS5TA9BSj4v
 FXHihaS3fUs6FQcgS7bgqYtIAfp0cxz0s+ZbSalvdQ82vXRQSh0LxDgiQEACNiAbLKe2g5o4hCA
 Z1EJk7tMcCYRXucQ15D9LP8kGh/A8H2dYEr8H7C6q6i9uKmuF0mXrmbJsfh6sw5BMS93oId7AQ6
 yg1Z1dyQZl8kLHBgXeg==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a5096b9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eSwfGQiZR0SxMorl76cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: LYLlLTPlTRG985WspbYT_zMvDflcEjDn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfX8+88O1T44C9m
 /6x7nANVJMMW/nDqH3JjfvZdy1frSHy+HsHZD4xc8xgN5S8ZehQT/XyOrNjzKxFn45cvqndnarj
 B641t+PHEovL2QJnqK9Ylq3pQNA76YY=
X-Proofpoint-ORIG-GUID: LYLlLTPlTRG985WspbYT_zMvDflcEjDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100063

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

