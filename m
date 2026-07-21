Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1FB3D3CE2
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609870; cv=none; b=OqDcMGMCYReHQnYf6UTOzl9Qxo1Tecq65+XufKmcMZs/1qjtcwUUUt5Y3cMkaS6i62lj0WbdYn5j3lh8L5SaDprgaxlOk4J1wFZuT9dppX698pPl6M4iuQSx3p0XFF92/HzMSMCqZjlfYQ1GkWrESCvVtuXJ5lRNMKUjF0AhdTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609870; c=relaxed/simple;
	bh=IteoMfGjbeqEJGrWmwtqWMVhnwfUXO2qdRB5FGs48O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvLRNhdvq1SWLgy6bDtRnZzuLCkQEuUDGxfOghB/ZTIdetylBa349FASI6uKm99VYVlq4cj6jlAsujIDibCn4Yc1sdte7M6H0j9zosgexCc8yxuzfY+6SmCpYO9jUCfNAscg7OvPTyxmd+2KGOx5kwe+1tm8OA/fbSCaMah6IEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYsL7LCg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0QIuPp6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYsL7LCg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0QIuPp6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4047t569835
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QPw6DyYFy7X0/NpUd4qPJ3Lfh/rFDYfjwyxK57Y9PHc=; b=TYsL7LCgLDbRXlNn
	isE5bB94o9DUZ47r31PvHQbokfDqJJqmGKStOuXIT8ex50dU3HnEHGV8XmJ9Zwdi
	PILCQcYqzBW/DzLFfrDE8ssn+SZ+IM2mtF24fJyiVrCa2LK0SWOlE1MESNPAfXW8
	xTUV7ssMCO4kft8bH6HGKVieKlg+bbKubW9qZ3VgIy3R5MPrJRzRM0+p9+iIZOWh
	HgybCrd5iQlV9EDEH+L23p5C8L71hZKIWfbBmZ7c6wlC5VTUz/T+EMcG38Imk0JG
	e+6qxedzrUiCoUY0rQTqq/xaHsUX9FC8HNHNsmGAb9DY0b+hvyS5ERzX6jBSCk4e
	3yaWFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvr5w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cea6a46766so167862625ad.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609866; x=1785214666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPw6DyYFy7X0/NpUd4qPJ3Lfh/rFDYfjwyxK57Y9PHc=;
        b=B0QIuPp6vUIWSKcLomFkYz+6WUjgo0t5JmEIArDrMWybilvPKmXEJZW7euONn9I1vA
         zaqDElEdPEwuYAN8uf0C1x1Fo6ikzZU1FGHoOCnAp+4So8I4VbfVMSFJa0OKag/CRMBD
         7jT/Q+0TBqPAI9/LZPoMGwiUcO419yPAwJ24XIlRUMGLR3MTNHCOENXGoR/ikl65x2xu
         +6fVHbF67HaFsQRtlRWRlYptSQJH/wS8YwLjfZkfTTjE9YTkh4WGEbkO+i5tJ0+xGZcX
         jjALJALV0xw6OrautscpKEF36d7QwiXTnaVWiaL+r2OgrUllJnVQ8bo08OJUe0UDtQ9o
         +sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609866; x=1785214666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPw6DyYFy7X0/NpUd4qPJ3Lfh/rFDYfjwyxK57Y9PHc=;
        b=OWnD1PbT3ORchnABMpqDG8Rgd6l2gWFs4cKQp7zHnxnmHCZ69JbTykQ4tzs2hRcGav
         xeIw8sucW7lMM1JtHjmsGUhPruc3w3whNUTnRLFX5NjUBUdRksgwggAtg8/BxNK+OZY6
         b7dh5nzlLllNSkoM9ghfzwcFRm1MDGFEYCCyFqL4aRKc92IySJu5okynZ++08PqcvwyX
         QN+/uXdXXAzdoZ8Gym01sgGnZSu63YpOYUibq1NMav4Ta6qrhjZVVtJjMLF4jgd/8Rxb
         cNB1PB+u0jIAILRpoEuFw2i9egzzzRF9ZIBtmLiQqXh4uIRy5BN9dkJKi+sq0XYFU5xT
         qi1w==
X-Forwarded-Encrypted: i=1; AHgh+Rozr1GezTmjsy2vvSJwzGEgRmTqx/9NE1T2+avv8b5vYSntMSyP03dueDURsocWyJTC2eAJ1ATBD57N@vger.kernel.org
X-Gm-Message-State: AOJu0YwDg9sFDu+rvN9Y2/Zrpkqn+j5Lt9LN6evUVgLiU3BzmJAiS8DE
	rNrWe01KCbJd7/+iKHwiCRTBUYamMCLIb0AhGSiYGG2CzXkSoh4iC7exm7g4/hPdL6q4j+9Y3ug
	KJNxrRViFBWReXoiPu6m/SQrI9lzeGsnhkFLTdjVI2LZXtD04pHAFfKa/rsA/gcNg8Z/EZWpwGS
	M=
X-Gm-Gg: AR+sD1031SNlCEjs0t3U3ko6xKWTFf6cTwNS84Az3gGj8+sOskBiY8arklXore6xeCv
	Tp+y9OyUMyzxogjH8ZmkMLMaXq92pFAVVfu5F+DhTS5J1a4DXxSxqihZLfdR2fCeagdo7lWt/8X
	J+eXsaSH61D9W+Sam6tInRXd91IUdrjFDL1fF3KheIpCmtnMK/s8mIRwknKddOmwRs/sd7cu29Z
	EFZoQIW+JAlwaUPHqna9S21FpmOXfmVhJhkPtRCxmBPMZvyg7S9BIwA3MI006DTN6TIC9sb9jZT
	x5pPZW2w3HlXr1XfKxepysHUeFqw8bnKbm4A+XJEDwqKCQsLVdtZLOWFSk69DWX1QfgIrp8DXH3
	35t7zYqi826lHUSQ3WoLHuDupOLRPbQhHc/sFHYvFZsFCmugedgaGD6A=
X-Received: by 2002:a17:903:2b06:b0:2cf:8363:5ab7 with SMTP id d9443c01a7336-2cf83635d95mr11107195ad.26.1784609866117;
        Mon, 20 Jul 2026 21:57:46 -0700 (PDT)
X-Received: by 2002:a17:903:2b06:b0:2cf:8363:5ab7 with SMTP id d9443c01a7336-2cf83635d95mr11106885ad.26.1784609865604;
        Mon, 20 Jul 2026 21:57:45 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm42110862eec.24.2026.07.20.21.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:57:44 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:57:35 -0700
Subject: [PATCH v2 2/4] arm64: dts: qcom: kaanapali: Add CCI definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-knp-camera-v2-2-a21c3f0ecd55@oss.qualcomm.com>
References: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
In-Reply-To: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: PfL4_hxvVoLCF8dDudftxm3R6cUe_Yt3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfXwwDcsTf0Rfmn
 ZwV/yfhB2jEEhCeM36DSlkAi7qYS6Y9PTEwp4pIR0+dDYV5jZwovf7LvRsxrwEPRKzhBHOjlrK7
 jesg30R10ge8GQ0OIX7UdiimvTiEhjc=
X-Proofpoint-GUID: PfL4_hxvVoLCF8dDudftxm3R6cUe_Yt3
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5efc4b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qJXDg8zzmFl7OFIyJIYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfXwMorTBKLtVAH
 wEOX/6NdFk+4zukvbNJr7y8xcluPYpfysLZYuD7+zkQYdmwXSL57UYweKJdMJaARFCZcpIrPljo
 igtsKkNs8rbtzqaYx874YG3qO6FkK9lT6eQDMaAh5kL+gz/aaK9Ovfgm7Kigrn6bvng7R07N1Gn
 tLszag6W/GCXB7ElVlFbq6V5p8pcYtwC9M62r0SO5/NUwSyoM17YzqIvGWiM/yPwfeaDqbGHdJB
 r4rqQNWe8uzPHqETfTPvyRddG2fi+QJEu4MNbBlhr6wV2o8W4qoknBPX7k1jPu86QW+Uvrkvk+C
 QXIUvZcNf3FcbCTCpL75gg9mJltD5+1TVKOA5hq9RPL6K2ubblqNM6mCsf39kDioH0aT5Xm8LDk
 9+1GXDKJ+m/z3m9xGb3Mg4QQ6E+O37tFSdGVRgAEGvth30xOnNBpfh3tepLnfdI27x6ySVHnMxI
 /0ypD3U6Mo94ndVzeYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210048

Qualcomm Kaanapali SoC has three Camera Control Interface (CCI). Each
controller contains two I2C hosts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 282 ++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 81246faf45a4..6cc7b32386c4 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3698,6 +3698,96 @@ opp-480000000 {
 			};
 		};
 
+		cci0: cci@941b000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@941c000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941c000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@941d000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941d000 0x0 0x1000>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
+			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@956d000 {
 			compatible = "qcom,kaanapali-camcc";
 			reg = <0x0 0x0956d000 0x0 0x80000>;
@@ -4258,6 +4348,198 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_0_default: cci2-0-default-state {
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_0_sleep: cci2-0-sleep-state {
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_1_default: cci2-1-default-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_1_sleep: cci2-1-sleep-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio66", "gpio67";

-- 
2.34.1

