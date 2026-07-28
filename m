Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2FD45D5D7
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253818; cv=none; b=m4Miw7B2uWH8wTiHfnM7pgORTIk6U7jjGDUqRcUfXWiyjPlpmajlAFgiJ0FHgyqroh4JKNSAQmXFeAg1YGD7UiRaSO2x91avTuugqr1/5sYJE10IcfGvDzWo9dqq+rr3GXMyIYdCuRYZm0aEGvaVtjTLJfvJu2NueOzqf4/X73g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253818; c=relaxed/simple;
	bh=t0JADh5rQL/dD2qzNT/1zVD/Dmq8n7CefHidi+F6erg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cvo5d2GdXWWdoSN6qi9iM7X0yz20t+Fmh0y4aES1sOztBizdectCNK9LWK5m11tNRHEEYOK/HfPE4/C05qCeY3rJweKPLLWhuHiD0prDnfLlHhD8JW6YzMsyHBeZa/dgxyOhThNnTzrIoIOzI3rfUqJvTT+qlT5UF26A+UM6YcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6khnyeS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hU3v0x62; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6khnyeS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hU3v0x62"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcfm83412733
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fe6EBY8XOMJJ1yXmrLmeHyVfFc0r89RDiXPBVEk9/Vw=; b=N6khnyeS2Dxh6VN8
	zNZG2r99WJdoF/f9X9IwoRwXXkYtQUSUsfsGz3gBSE2cvDoQSHAopnS47UPYCZ1T
	POgN8e61V3IpmgwektXXhSK6UXlid/ehnBcG0XsMfZrJ4pbeyqnXSVnxOZEjZAoz
	AQBps2QXWhqLh8jD0RgzMqREp0l1dcL2SzxoKG1jYO5+VeX0teLgGBuJYlldXXqV
	g4sZP9ey14fxobKdG5gm+IQ52RS9AqCTfVXqalDKpO+mhpsOncXVOPTdJLKwjS3v
	MYRRnu7DpiAvZp3VfwfPnRm81sqGZKZeyZ14j7uf22px3iwSjcylsusla4NXhi9a
	/rMyOA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy13auk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:50:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so365585ad.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785253815; x=1785858615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fe6EBY8XOMJJ1yXmrLmeHyVfFc0r89RDiXPBVEk9/Vw=;
        b=hU3v0x62pi7i885jDmtqSCDnzHt5bzRUEda7rkSZf8/6hi4iRCDBpY4GEL1IDQisOG
         Ts0hWW0g1d+Abo3rWG7x2VxCjCRnAFSKHIRfVpRaqeA6ddmZgEUVicxf0nwxYU6JXX/s
         jO2qQ2pkv2Eoiv3/ewCPOU2oYvxS3fckVwvipcYGfxnr0en/AmiSMDKW+3/rJtC7K9tJ
         ZjOrwKtlxxb5vY/UyMMKBfMenhATfzEzTteQoQ33+EPebJRVAF6WjYJ8eogNNItx0Lg2
         kbIRa5VvMHBqaaBZtvWxUGD+AoMVsMkoFpaKdkPevNGTc+c2b9x2AnW9+9tEGsADZoj+
         kcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253815; x=1785858615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe6EBY8XOMJJ1yXmrLmeHyVfFc0r89RDiXPBVEk9/Vw=;
        b=iufcW4ElPlHurnDpMWgwIg4iceH8n3TkrdOGl4LQXNHILIdgXCPwEHdfs+2bmvBb2n
         vmaGQms+Cat91VCywVZXuSoiiAlwJ+gXEw31B0/JuGOtl8FjILnt0wmBsyM61IVZrM5A
         hln8LcfxiBPFvLnrQoxWaDHsCuYhZqQ8cu+gpiGzY2SzyCgIToBDS9YHQUSOJkwh6GeE
         EJjWEQuJ7wiZgsGPi/yz9I18Gonk2X3wc0I+UJnVDxUGlHQLEsS3fhEaCl6ANBLSyRzm
         7lKsYG4OvPRRykLa0b0+/jhfRWdmhkhscNyn/ogkfMrUGzOOfxd73gs/Wn9SEFvZ2WV1
         gaBA==
X-Forwarded-Encrypted: i=1; AHgh+RrmLtNR7Vgk9lNgH5MIA5T7f6QhZhOqYnaNBBgE0o2amiDQj+v8aL18C0oWjUyHkj+MKMSRavfY+j/N@vger.kernel.org
X-Gm-Message-State: AOJu0YzprW7wp6t58g69Wlk64cby3p7b1gMDhetpMjV+z3W+pOSyqokB
	gTmA0Cxldkkb7rpZlpzm7f2SWfq+aGq1zWetyIFdivfN/lnlNbr0vC/kcZUGUpCjzGMjah5q4gs
	0p/S8tBBRl2/Na9MmuqXw+condEG/IakFg12l7/O4I2Ksygwyt+afxFdaZMswSlT3
X-Gm-Gg: AR+sD10ooOUUeo66/N2eyczCmoxIFcZ4OsAQ52Qo/WNBfLuAr1v+RGepDSGythMdgBe
	j2UwVXBHMDGocjAC/Y1Scqwf/QfZQzLKeAMsOKfVQbD3HBhJrVgFT+1m1PBrQ0hoHvnohyaOs7K
	rJd2BiqVSOsa660jO2KsYZHIit08Yjg+5SGahAb5BQoAs6cIqEZ38xdjuHu0L5t/nabGFk5/SVQ
	VOCF1Rv7k4rzpe4xtBOrQfHQ2Jdk1zMOY55qApnBN52KgkcRBKiQrfxQy097382lqh3stxlH1AE
	32tjY428Cca3wM66hlWRJkuCXGRI+EDM3zs8JxzZ5637YtAEMtfi+8AxMNnRen+SslgdBpPPPeR
	jtNFdMYu+LYdKDcFrugo=
X-Received: by 2002:a17:902:d483:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2d015ae7bd4mr36498205ad.19.1785253814858;
        Tue, 28 Jul 2026 08:50:14 -0700 (PDT)
X-Received: by 2002:a17:902:d483:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2d015ae7bd4mr36497815ad.19.1785253814371;
        Tue, 28 Jul 2026 08:50:14 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7eea52sm55688695ad.61.2026.07.28.08.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:50:14 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 21:19:44 +0530
Subject: [PATCH v4 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-adc5_gen3_dt-v4-4-355f0edece77@oss.qualcomm.com>
References: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
In-Reply-To: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785253792; l=10469;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=WAiiD76RQMexLqkKulCw1SnNLWCGooliicmwQ4NoiyA=;
 b=oQyX/mOBA0tbSJHTDd57VCNudm+JSCvwLbE7cbzQZpu9ernLZbQdvAPjS1UiIH8JWfCAU1vmq
 4VOGPSfak3xB8oNTue+FvTJoft+8KcD4rMvQjNakBZe9CEzYOj+7ltl
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: y7Oxz6wwdVgtYzidxLWulNOWOmHd6eY9
X-Proofpoint-ORIG-GUID: y7Oxz6wwdVgtYzidxLWulNOWOmHd6eY9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0MCBTYWx0ZWRfX8PgPt7Jhtnjm
 HdWz/2hEud4h8SYOEjHHGkvJr2TLtvi7FJ+4KMl9CrhXf2bTDQ7yk/V+7YGsA9b84NFznQGv4lp
 3WK3WfCJvxD8AQOdXMu4QIAzCjPkT1+gJMMcu1CDN/a55y3ppbNcEwhUv+ieJBzgB0AcCNtEvyA
 i4NLVWqum3+B8buDxeuUEdfOLHT04/sKs8PO4cuMzTQSKa2NSoU2Z73AFvrl7dv1PaJHZcA+hwJ
 WY/z4+Yl/lQge3V5ZQ2K9Js+UaLhtDKAjbyaB+9XOgtWYj5fAbBn0N/HSV7AO4lP5ooEEJBHIoz
 OSRDmP9nQVBqh+t1GKhAmQkCcHVvdbSWJWcSAidZgGhkjBpnQZsdhnat742fJ9v9+eZnkEfQ1O/
 yFBMpOUtpY+k2A+Tmx883J7dO1G39GB/XV9HKN88PdLf1jKgIZ43nlerN1q5/+xsF02DMk2unTf
 /hxaRUtV/ZchHY1BHlg==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a68cfb7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=43omsC6mbmG0p7PtmyUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0MCBTYWx0ZWRfX6lnzLu3upUyi
 m2o0my+A3IW+aPP/XjacZEz56iyq/rjjSXg9BJ0eCP1rpL4VEULpTHA0eccLM8DAzlfvB7sGYck
 NUAJ798XT6V/Uk+zPJWfseXs1iL2dWM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280140

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC node and define channels for:
- Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
- PM8550: Die temperature, VPH power, and system thermistors.

Add io-channels and io-channel-names properties to the
temp_alarm nodes so that they can get temperature reading
from the ADC die_temp channels.

Remove die_temp channel of PMC8380_6 for Purwa boards where
this PMIC is not present.

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          | 158 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |   1 +
 .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   |   1 +
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   |   1 +
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   1 +
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |   1 +
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |   1 +
 7 files changed, 164 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 6a31a0adf8be..17d754d57e18 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -6,7 +6,9 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 / {
 	thermal-zones {
@@ -277,6 +279,134 @@ pmk8550_pwm: pwm {
 
 			status = "disabled";
 		};
+
+		pmk8550_vadc: adc@9000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x9000>, <0x9100>;
+			interrupts-extended = <&spmi_bus0 0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
+					      <&spmi_bus0 0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			pinctrl-0 = <&sys_therm_0_gpio3>, <&sys_therm_1_gpio4>;
+			pinctrl-names = "default";
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmk8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@103 {
+				reg = <ADC5_GEN3_DIE_TEMP(1)>;
+				label = "pm8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@144 {
+				reg = <ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+				label = "pm8550_therm_2";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@145 {
+				reg = <ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+				label = "pm8550_therm_3";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@146 {
+				reg = <ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+				label = "pm8550_therm_4";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@147 {
+				reg = <ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+				label = "pm8550_therm_5";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@148 {
+				reg = <ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+				label = "pm8550_therm_6";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@14a {
+				reg = <ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+				label = "pm8550_gpio_01";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@14b {
+				reg = <ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+				label = "pm8550_gpio_02";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@18e {
+				reg = <ADC5_GEN3_VPH_PWR(1)>;
+				label = "pm8550_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pm8550ve_2_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@303 {
+				reg = <ADC5_GEN3_DIE_TEMP(3)>;
+				label = "pmc8380_3_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@403 {
+				reg = <ADC5_GEN3_DIE_TEMP(4)>;
+				label = "pmc8380_4_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@503 {
+				reg = <ADC5_GEN3_DIE_TEMP(5)>;
+				label = "pmc8380_5_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			pmc8380_6_die_temp: channel@603 {
+				reg = <ADC5_GEN3_DIE_TEMP(6)>;
+				label = "pmc8380_6_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@803 {
+				reg = <ADC5_GEN3_DIE_TEMP(8)>;
+				label = "pm8550ve_8_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@903 {
+				reg = <ADC5_GEN3_DIE_TEMP(9)>;
+				label = "pm8550ve_9_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
 	};
 
 	/* PMC8380C */
@@ -291,6 +421,8 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(1)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550_gpios: gpio@8800 {
@@ -301,6 +433,18 @@ pm8550_gpios: gpio@8800 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+
+			sys_therm_0_gpio3: sys-therm-0-gpio3-state {
+				pins = "gpio3";
+				function = PMIC_GPIO_FUNC_NORMAL;
+				bias-high-impedance;
+			};
+
+			sys_therm_1_gpio4: sys-therm-1-gpio4-state {
+				pins = "gpio4";
+				function = PMIC_GPIO_FUNC_NORMAL;
+				bias-high-impedance;
+			};
 		};
 
 		pm8550_flash: led-controller@ee00 {
@@ -329,6 +473,8 @@ pm8550ve_2_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(2)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550ve_2_gpios: gpio@8800 {
@@ -354,6 +500,8 @@ pmc8380_3_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(3)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_3_gpios: gpio@8800 {
@@ -378,6 +526,8 @@ pmc8380_4_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(4)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_4_gpios: gpio@8800 {
@@ -402,6 +552,8 @@ pmc8380_5_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x5 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(5)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_5_gpios: gpio@8800 {
@@ -426,6 +578,8 @@ pmc8380_6_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(6)>;
+			io-channel-names = "thermal";
 		};
 
 		pmc8380_6_gpios: gpio@8800 {
@@ -451,6 +605,8 @@ pm8550ve_8_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x8 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(8)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550ve_8_gpios: gpio@8800 {
@@ -476,6 +632,8 @@ pm8550ve_9_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts = <0x9 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(9)>;
+			io-channel-names = "thermal";
 		};
 
 		pm8550ve_9_gpios: gpio@8800 {
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5..661dca4fbee3 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -10,6 +10,7 @@
 
 /delete-node/ &pmc8380_6;
 /delete-node/ &pmc8380_6_thermal;
+/delete-node/ &pmc8380_6_die_temp;
 
 / {
 	reserved-memory {
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
index 63e29d2cc4ab..c754104adac7 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
@@ -11,6 +11,7 @@
 
 /delete-node/ &pmc8380_6;
 /delete-node/ &pmc8380_6_thermal;
+/delete-node/ &pmc8380_6_die_temp;
 
 / {
 	model = "ASUS Vivobook S 15 X1P-42-100";
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
index 7f5860d2b6cc..b5226c1ae370 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
@@ -11,6 +11,7 @@
 
 /delete-node/ &pmc8380_6;
 /delete-node/ &pmc8380_6_thermal;
+/delete-node/ &pmc8380_6_die_temp;
 
 / {
 	wcn6855-pmu {
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
index 7ed4116b9590..5de91bca3fd5 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
@@ -10,6 +10,7 @@
 
 /delete-node/ &pmc8380_6;
 /delete-node/ &pmc8380_6_thermal;
+/delete-node/ &pmc8380_6_die_temp;
 
 / {
 	model = "Qualcomm Technologies, Inc. X1P42100 CRD";
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
index 0f338e457abd..0e4dfb0f0a2a 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
@@ -7,6 +7,7 @@
 #include "x1-hp-omnibook-x14.dtsi"
 /delete-node/ &pmc8380_6;
 /delete-node/ &pmc8380_6_thermal;
+/delete-node/ &pmc8380_6_die_temp;
 
 / {
 	model = "HP Omnibook X 14-fe1";
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index 500809772097..9e6f679758a9 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -18,6 +18,7 @@
 
 /delete-node/ &pmc8380_6;
 /delete-node/ &pmc8380_6_thermal;
+/delete-node/ &pmc8380_6_die_temp;
 
 / {
 	model = "Lenovo ThinkBook 16 Gen 7 QOY";

-- 
2.43.0

