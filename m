Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AD52E8DE3
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424339; cv=none; b=LRy8b3GhYk6hodSyBsTeifrezdrRIZtgV0FGI0LItbOjTKXF6qd1ZwYdupMhvkmn0oFJq5GSWArMjzH7GyrpU6LM5fd+RG5z3UujbNcOyEpHvpuXho/nxiL5vMKEkN2aC3GmXqf7Q9cu9n1aKCNVjI509lkwpnPBqQIWy4tuQfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424339; c=relaxed/simple;
	bh=lFu4IuT+IKrrc4jReWmTy3bMVs11TEshA6L6oqNRmmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pq4HPKQ/UBOm51058r/hsLBDFcjteYIpO6+LGhrWwXywYt+mhV2RPTWfvtSCynskpL/qr3waRmCAjtGbMuhRCYdMF2CHfEXYqeugmVHmUIFjRwRJUM+8AzuNrlp06J73RpBTgM5ZxdTMHEOenjaEn5xRgS8pi0On0CIKWI5KYig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dY8lWqd7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmNOCR4x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dY8lWqd7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmNOCR4x"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E49ikK128324
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rsDNvilbkWSuGFB5Vz1up8VosXQ3v31uCBXifvutb8=; b=dY8lWqd7bRgIQkI2
	HwbAb7r5idJ7e0h7wkTvxKGIffMZfGnRAwh/SId28RBSDHzlgnc7U/OiGVTmB7AJ
	TQctdTKcdn1yf7xA2YPb3nYzE2Ub2rMaLmc1VF4KqIweLbqwgjFO6lL+nwj+NKKp
	ydw4uZhzfWhFtdDQfNxymR+YjC+4j1aXeZf6ZhvTAOfmHHZiZ5WkOe5NwyEIVlTs
	+LbT5SNUXvn78OwcOo7bEhD7zPfkYMoy8OjX5SeJZjX6xdSJIgRRj8viGeRDbf/O
	FwnylusWVJMgGdhIzKK3nStiTM5PnYEAhaK1Cdq1KqlIYgWiw9yo2m7XkN4TzwoK
	plQB0Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye131q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0d0516ad7so24163055ad.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781424336; x=1782029136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rsDNvilbkWSuGFB5Vz1up8VosXQ3v31uCBXifvutb8=;
        b=UmNOCR4xhx648jDBkQR3y49IUf7LPJbFClx9TvjHNjafdYbhDwKE8+xtY2Y6sPwCKS
         SIMDjLDVqAjlWzI+iVnqjF9CJwQKyhmfcfb0tv9Kn2K4lcRvPurzuAPn1gE6MdiBhr3r
         hnoqTklcPGWZDhD+yghRuehDuMFYvq6vlJG1u/kVygR1DpvawKjc9aJth87Tc6PGxUP2
         hzyu27OPnk+sJHxZMrgaXoAbulWCLcAhRnSNQph/zT5ILAVNyx8Ag0Hv5JvD8dsAu3f1
         WEuaeN/w5G+ZlOLirwape9s3Uj+39Ht2xaoVcq36z4qZUVEo/pC3C4Lzsu04I0HlBvVw
         u1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424336; x=1782029136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rsDNvilbkWSuGFB5Vz1up8VosXQ3v31uCBXifvutb8=;
        b=ctu3reXKWllV2uniQkY7eQbShokC4QjYscBJRheSnChBjUvAb6qURFCaSFhFa+B1ur
         r8/lvDI/Fu/x3WS3twl1dbiRAnrfYCSCsDGdftoSLncrDgwXm58JxYq+xWX4fBlM9SoR
         5D/2NeM+QUCbTtRnZ7eyML3Vpc9d9ptTHybViTUpL5heNsFMeTE6FyPq5y78YfqSXBGn
         NRndwEK7AiBeQ4gfnH/mJCR/9XFqdOfpaZ0pwwSAnTTccxvTF4tTKOBI3hrdyXWcbZAu
         rY/blwQCNRA8z1YP0VKGwuGAo3hnOINYLd0pBJsMfE/xGAA8AAmkI+cyYAcrIyDgxdeo
         T6lA==
X-Forwarded-Encrypted: i=1; AFNElJ9CLbRy8SQHXerEInwPTdRszoVNUGDp/ZA1bFIT+lu3KQlTplzR7YNOXHSt+D+0fmoME9gHTbq5UGyX@vger.kernel.org
X-Gm-Message-State: AOJu0YxTPzoEks+aWCw9tCvjC0CP99fA4cHtx59dKFNg262unwnONK9s
	xYX4W6GnxqqBBbzKViUWVAMOMHm7dDBNn5AKaeOlAUVge5uWt4biJgszvz41Clw/CmX5ZsBu4fx
	UEIYMN8AEpTmvhpcMsARO25TVWwmKlUVzASgWJXi74xTTwM7u77P6maTdaVDt+qj0C/OBKlAC
X-Gm-Gg: Acq92OFSNQpbIVSb2M/NoV6dluKZOS6Wjyv8vtEpypSnfPjR5/QdiRAKX1EnezL/4/h
	6RMRs6b4lpZIRiy1impBqfsFUMHLVl7b2NMdfFSHfotGC5W+91/P+1aV8n2CQiDZlnbLKFBWcV6
	YV9s+0HJ/8yEi46LN1zEc2DlMetEutRWmvRpxG0835x1NPjk7LMLiHCigXLGaV8ODiqeTgJHXxk
	xnMdGB96KH6PdXmVLfYXFFTMGYCpx4OOIvAPze3jCaGMT08Py++Ahm1YkKxlzwJIzks0ZUSMvCY
	Z0rQt5CunDcxZg9SNuraBhLHnciHcbsehXqdpVHE65+UnBsU+06lP2DTYp/DjuFtIC9WxrB+dit
	8frIrDfBLTYcCqQkkVRn2AnGiw8Rzib2L5XNCefDV
X-Received: by 2002:a17:903:4407:b0:2bf:305a:310d with SMTP id d9443c01a7336-2c6641e9417mr64638265ad.24.1781424336390;
        Sun, 14 Jun 2026 01:05:36 -0700 (PDT)
X-Received: by 2002:a17:903:4407:b0:2bf:305a:310d with SMTP id d9443c01a7336-2c6641e9417mr64637995ad.24.1781424335975;
        Sun, 14 Jun 2026 01:05:35 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm67309225ad.55.2026.06.14.01.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:05:35 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 13:35:09 +0530
Subject: [PATCH v2 2/4] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-adc5_gen3_dt-v2-2-32ec576c5865@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781424323; l=4659;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=UveLLaFbt4LGcQy2FaHPB6oYAGE6xjTtc+YtJb8zYHk=;
 b=Io0epmYefdADI2VdcCRCt1uo6ovWUkhTS90y/SUbCxD3lS/YmNsewmRzXLmTU7t0NE3J6l8vV
 Rj369uvWYUIBXYmFiaRuoeQOgdOujTPxPUa5FSQfEyQDcN/FjXOjDbQ
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: To1yKe4nvNZYURt8EnNVYuV_eQ-8Lw7Y
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2e60d1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hbj8Sl73EW6utw1LywsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX2xXG5KZnFDVj
 PwXnwyJAeU722yQ/T0v8Cd3a7MgxK5zmlosEeMDFImNV8YSai0dcfqmDlZkZkOTZ8ct9itJrNx8
 u9qq3B9ku8uZK1fUtxzx6Cx+bHivW90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX4tShJCZwbGkW
 e1YNhgpQIe+Jzqdf2mo4qVMzBKs/Lo6k3YyrBLdLiReInHY2LeQoQyozXvVB16JI1+tHygp0VHQ
 O7UCTFSSfxRPMsAgdjEjQ6vd4YcaFA6OCBiRIJ0IRJSQ4oz1T+s2gV5Vu+0+gCEjH8LttkvH3PG
 hbDfu4g906md6CTN6VS3upwYbamxhCAPYqXVbtiyPeYGS5HodwAgaOB/+RPRiKm5mGiHc5RbO1n
 61xwbrUwqYbZe9wRQhghxYLa3xsH5ruEo7BHpJvdjDAxNcnmcftjmFQZa+xtiCMmCLy4uBMuZno
 NKa6VeSmF46zC6XYbp9mWYC6+i2DzuHWqnAdwaT4f75GbES3qxcBtT82Pw5tuor80QAgWUqVKLH
 JW8n8DNjAY6SfI1jf20egNNdNYZGgf6LsJA0/mY8XbjCV6Ewd91lclA3qtG+eOcDqjduDIdRiFT
 OqXLBQNOSRCEosxD62w==
X-Proofpoint-ORIG-GUID: To1yKe4nvNZYURt8EnNVYuV_eQ-8Lw7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140079

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
pmm8654au_3) on the Lemans platform.

Each ADC node exposes the following ADC channels:
- DIE_TEMP: PMIC die temperature channel
- VPH_PWR: Battery/supply voltage channel

Also add the io-channels and io-channel-names properties under
the temp-alarm nodes so that they can get temperature reading
from the ADC die_temp channels.

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 341119fc8244..6caec3e4df4b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 / {
 	thermal-zones {
@@ -110,6 +111,8 @@ pmm8654au_0_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x0 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_0_adc ADC5_GEN3_DIE_TEMP(0)>;
+			io-channel-names = "thermal";
 		};
 
 		pmm8654au_0_pon: pon@1200 {
@@ -141,6 +144,27 @@ pmm8654au_0_rtc: rtc@6100 {
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		pmm8654au_0_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmm8654au_0_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8e {
+				reg = <ADC5_GEN3_VPH_PWR(0)>;
+				label = "pmm8654au_0_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8654au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -176,6 +200,29 @@ pmm8654au_1_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_1_adc ADC5_GEN3_DIE_TEMP(2)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_1_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pmm8654au_1_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@28e {
+				reg = <ADC5_GEN3_VPH_PWR(2)>;
+				label = "pmm8654au_1_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_1_gpios: gpio@8800 {
@@ -200,6 +247,29 @@ pmm8654au_2_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_2_adc ADC5_GEN3_DIE_TEMP(4)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_2_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x4 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@403 {
+				reg = <ADC5_GEN3_DIE_TEMP(4)>;
+				label = "pmm8654au_2_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@48e {
+				reg = <ADC5_GEN3_VPH_PWR(4)>;
+				label = "pmm8654au_2_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_2_gpios: gpio@8800 {
@@ -224,6 +294,29 @@ pmm8654au_3_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_3_adc ADC5_GEN3_DIE_TEMP(6)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_3_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x6 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@603 {
+				reg = <ADC5_GEN3_DIE_TEMP(6)>;
+				label = "pmm8654au_3_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@68e {
+				reg = <ADC5_GEN3_VPH_PWR(6)>;
+				label = "pmm8654au_3_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_3_gpios: gpio@8800 {

-- 
2.43.0

