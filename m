Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964A242E8C6
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172837; cv=none; b=lFnOBzYas272elb5wQzNVAUstiV5DOvJArA+CSkh8aivpScsjOeT40JjKeUdw3iL939ie8C4gKMYp1s4Ldv4PgwigbFCuNnWlmvTXabuqXN3w2L16srGWPkwr9NbqDb2MkgSZCqtfEkc3FZ+kV9lMMcPYDhWiXmyYjzwz/iU8tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172837; c=relaxed/simple;
	bh=BL6j5H5m37TzqcudsoCQpnU2bvwoR+kGsvfjqpq6Z5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwfSC+HpgnHbp4jNjRo+I5AjOfMZ5FFDjqgidy2yCqYvh4igz2ZHz0v4Fl6JgUH62Cu2ZPixdHzy+TQqzurlPynN2qxYQqviDzb0C4Do/UmFWAy4NZ3QAlrpSVT5/9/2oEqYUlzs4pdbk2RhMnp/raoTrkMc1EWsbfp4OSw77rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyZI4mrA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j67GpY/C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyZI4mrA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j67GpY/C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlZcC4115070
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e90gAsgCeZ6RUGKM9of9HPgicOqZqYMoZfyrIu7uCDc=; b=eyZI4mrAacHgO2AL
	ExKJDLzQr7TwJv4fgxAmLmg7AiJtCcbb7twQAeSAoo0wAqUQjCgk01QcJF/lrNJZ
	F+0EfJ8QwKDADaZTuXPUlZIRzSJFjhNdAYWTSd3fGC82Prg9WMoVElQINYZVs+Ah
	3wRSyiK0Azre1TcV+wosUlqW/5wUQIgyhxmj1WbKP58oAEyGssUIwiAB0D+ziq1Y
	GldCONyESuduCK0GiNnW3jEuk0tlq+GzXYNxMN9tyoCVFtB9muyYJHqwv3HteQIk
	zzat1STQMgyqio9Pjkme7BC05Sqt0u4eKGyWSoF9xJf6ajsb7JUGRPtGZZcuHl7U
	PRaH/Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrt0tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:20:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso1854926a12.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785172825; x=1785777625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e90gAsgCeZ6RUGKM9of9HPgicOqZqYMoZfyrIu7uCDc=;
        b=j67GpY/CsPQSVeMRyLFoQRsW0Qbe0b64D5gykhknMRjhB4WwF3omK4AJAbgb2kmTb8
         owk0J7ZsK+FE3UlGCtuEKUxycSPX5W2cl/+k9prNH64wuT3Nyqun/8xo2KkyeMk1CRtr
         8fFq/EeJVqRfG7Ev4/GGLtzzg3qI7PrGSZPczIVsQP73dnhUfofkbVvdNQ3YilxiZcux
         SojEyDljVWaIRRkbRMrOOLd/GrpBS5POvcis4OKZQC6kFcIi3pcpiD2CT76k+tcAyRqY
         fm+IBF7yR1ROwdonkXVNHWSOyqDzi9O80wLzttrfDHa79KQ2/VUkAdCvf0TmiwnlTU3n
         bPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785172825; x=1785777625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e90gAsgCeZ6RUGKM9of9HPgicOqZqYMoZfyrIu7uCDc=;
        b=ntUFSYB/gHBo+M07Wp4jCHqRQi6Ldtltd6jmScbV4+obl8IXVA1zqeFUZ9x8aErZ8q
         kMBMRhcVItkN4mGFCwkY6B7qUhqTh3+IBwqMrDyo7O37Egu9o9hA476tQEYvNtS+1bTI
         G626XpqHaNYjaNE0eNfpNTSZ/Av7MQUnhT70k7vED1li5dpX2UDhzebotAUY5KAsJ8+i
         dt95XyIpczhY/6Tlpg9+c3TtruDjEH/dRHkpJ0vaoV107xyq33a+uJtqy5jVxQa/0b/x
         PheDbUAnC5IlZ4CAVpFp1The7tSAZF45YLBYe5VQT0GzWHSumYTrWthF9WlL6guJe1ME
         PXRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHJl5dJmUuGvXy9nC2Y5eNGMnNe8Zl9kP6Mc8OfY+xMkPCrcffjDGEn5/H1P0ROhDakxDgTDm+OY3y@vger.kernel.org
X-Gm-Message-State: AOJu0Yysw1pHH8vTdL85cQgwW6OmrELyk2yPkBstrEBpowGXpSUFqDqM
	1kbBQMkxIlMtKlRMo7XzOx9j2GK+KNSSxVisZSsi3D/QsiP7DMLdrU+c56Q7TDnRiHZf6OMCbq6
	Vp6Wgb942cQM+UPhqQU/oaIxKLBveJN1AKSOZOgLDW8ydp4UcRp3KKLCAEgCv+zGl
X-Gm-Gg: AR+sD11cjB0elYBlNHAbI9RhkzIksqpKrubgfW6O74+m2/pFWsdOSv7pOstlZaTdSD/
	i0bq6aZschkSZREjWYiPzbVF364Rq85oZmUpFxvGRp+rRpfTCEYJcG23Q2zdu4lTr8NW1qI5B1Z
	fKXjnexzbpZLvNhXL/BIXbKmw10DTCvIeeiJOZYH5S8x+7uPjH1HqKJF6Lb/lCFGe+9qklfZ9ss
	OSkSNPnmjdskBRkyNPTjfcMsMk/6bKarrg1+v5x5WjxUVWq8lGWRC0RfsP/i67udDbOSMVOpsKS
	v8e/+vnrl0JAvBTI1W2hMwrfTTHsBDeP5DtHWiMszuu+EEhQJ2y36n+N5GzXmN0hAf/cjQdqyr+
	Z83JNA9oS9OXbtKAksOs=
X-Received: by 2002:a05:6a21:6e86:b0:3c3:af85:85e7 with SMTP id adf61e73a8af0-3c6c7bc8d39mr444186637.34.1785172825101;
        Mon, 27 Jul 2026 10:20:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e86:b0:3c3:af85:85e7 with SMTP id adf61e73a8af0-3c6c7bc8d39mr444163637.34.1785172824648;
        Mon, 27 Jul 2026 10:20:24 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm55892988eec.13.2026.07.27.10.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:20:24 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 22:49:12 +0530
Subject: [PATCH v3 2/4] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adc5_gen3_dt-v3-2-bc00223648f3@oss.qualcomm.com>
References: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
In-Reply-To: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785172810; l=4796;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=YDR7Fzf7/23vJ6lUmAOe24RMDWg4KghZNkREwSOpJBc=;
 b=J3maEZNLif7pK0Me08k0jbdeb7u/Pbi1ESVFO1zaNx4tQm/t6G0+3ypUtxqxjLLknGE6neyPp
 +7uIsCPw1uMBAb+vahs5wa+FDtyuCNZO5WxXrgfTNiA5flPkQyEVnuE
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfX66S4K1tRCaSc
 6dBXc/hg8YLxbLA6RW3ZcRBPyzxLklTkI7Tb8PWi+/JS6SkJ5a7n9yAPpxeRjYQOXilog3tMRTK
 NjqFaMn7Z/HRUoZz6KBp2VWE9bmvvY0=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a67935a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hbj8Sl73EW6utw1LywsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: HOBb3J4Na41HWYRMcSC8kynAEX3jVEtB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfX7D1x5ntsLuwt
 aoyeLexuTDfM+tuZ9wUpIzyZq4BTVJ2y/ZMW2GZwK7Tz4j/1sZNxA/FBvMq7krNT1q22GuDf44I
 wGJSsshmzAUyjxzTRv0w4/UJG5Flj3z2hIBljsS/cYiMEHRaSBByJq1Z7zEcBkT+rEso/21882S
 Py9ASDzd5c4B+SSWYEEAjtifdq+XuqN4df3s1415cn4zWzO+J/jZAQTFXygRHf4fisdiTG/+fhp
 84etioIVpA/uHfm/fNCLZIunWl+rueQ0AA+UcnOxGWDKUQP97v8eeFSv9RJf0PJ+0dB5jUf65Wl
 +7/5Po//stJ6TidN5VG0EoQ/p0F+uJlGEn0Ow65y7iorEqy+S/NaTeirk6Xrxku33BdPWNmopbC
 k6fYtrB87CTNUYxZWYXIdwd8rXtGL2VSh72Gv3nM5vl/mHNMe9g1K45BUBhmPsE3qHnyFgiGj5H
 SrNITy9LBlPLUYbEXCg==
X-Proofpoint-ORIG-GUID: HOBb3J4Na41HWYRMcSC8kynAEX3jVEtB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270160

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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 341119fc8244..500f715931aa 100644
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
+			interrupts-extended = <&spmi_bus 0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+			interrupts-extended = <&spmi_bus 0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+			interrupts-extended = <&spmi_bus 0x4 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+			interrupts-extended = <&spmi_bus 0x6 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
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

