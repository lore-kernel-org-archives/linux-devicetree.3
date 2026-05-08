Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA202382393
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229413; cv=none; b=D6NQo3TGycHTLDI5Jh1g22LCTcHIWeeIkHvMf5+gEFHhTHNvrAbqiu7zS1zRUk1nfAYQtTgM+XMvgL0WWHudFmjEvI+aj6dl6Eg5KwctXpSMQM5VOXNH+wtTgyG+IwiZ5EjCM3qIN0G8vAgBxrqmJC/8HRvuWRrwHvNh3iAh7DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229413; c=relaxed/simple;
	bh=YR6rhccRBHjsTyWTNAinQvnECy1lv493QOGvguteHHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwGWRaGx1S8v+gPyGR9CorJOefOP4NF5uyoe5FO4fZWSPdup4TDpiuoYk4+9r52Dk4bNCdkhRiyDhxiWLCcSg/vKtW8Sou96TIi7Pgm0hs2uiwvCCCPkja4y1MpsacybWWCBQ16KxQmHZYd7oNgMm7y+wUGiYJaIzKgQRwg3mzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drcF1n9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NqIugRbv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drcF1n9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NqIugRbv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64880CUh2384389
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 08:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSi4MEqlPFrmWIrio6/uw6S9i82cQl59Nwngogapr6I=; b=drcF1n9H9JgX+u8d
	C/sCHpYchfpSbwqzG3TwYDNetFya7SuyDn2szBKSeqCsJi8+QRIE7mPfy83d66le
	mZg3XYiiNd/19HVP1I2Rx2+s526iyublGk/IaB4Rnod9VsmeKQQk78KLhXa67u5C
	3y81S05ZYJOjUHVhseifuI0y8TGfWIiivPe5o7SQTWHia0r69ZoixnSI3RPQq0dB
	Yay2sZ2BV/nvtgJtGgdLjKLrA65ToRuq+BgRofn+mVl0wNv9hVjn2yNUb7RZ9TVh
	WsjDEw9lAi0+XDvUdAk4rBuxlkONxTC780peEgsdFJN3Ta9M53TFqN5BSxTbqTfa
	EQ3Gtw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwuk7u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:36:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee34588671so2517823eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778229410; x=1778834210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSi4MEqlPFrmWIrio6/uw6S9i82cQl59Nwngogapr6I=;
        b=NqIugRbvoxCeOF+zgNoY+61EX6N+SufEJLwAUyhkiw7kr8nkF4ktv+0cRzVfFNN+NN
         rKRaadORENEavnNutXOaWF8wn2OZCLclTwA849iVuRNy0ov2T5hOcV1AChBPvmnxddLQ
         BogxcFnzWb+yaQdmPROvx/dTN8Ehe1Djl+P9GabNoKpEYDCbLlCc/cQl1BX1jtT9UMQO
         7kQCsjV/r3Vub6T8wlwoxFWoAPVBWGBdNGKb+V/1tLzUA9pu3YG+B2j7Q1hM6KcfhNgh
         1bF3h3JAXb89xdyjSoLgpXNEZa2qlT/EBGN1Uyf70rxp5jGPcneNq/9duPkedJWglJdQ
         82OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229410; x=1778834210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oSi4MEqlPFrmWIrio6/uw6S9i82cQl59Nwngogapr6I=;
        b=sMA8fAwDpiA3K0FMiuGRF+BebWjq+JRIK/+heE2B7G+K8TpuZ0LmO6xWGrIlCIAIyn
         xhZIPNxZsAHgI1USNwvQfrzGpLvT26d4NmoxvIj0FmkkCEuSxQ6nOd2IdMatgez2GpEV
         /ExhRKSn51CWHNEkoOyHOd31sM0q+JXGozQpVRLkBGDLp+kijrzA5+ONOGGPhxm58XQR
         gM6sYrIXiKkLLYJI6Wx2+EnONric83ZKy2HsjrtFjPAqj6KBMKa5FoJYSbnh43Fui63C
         5ezzrHKY9SEsd6ZsES0QngUZRBOOOV9CKZlLVubYmmemGJDpm7kLT9OJuvycsHm2njHX
         8CZw==
X-Forwarded-Encrypted: i=1; AFNElJ/7iqTG+5HUCnmNVZHe/xh4O4DBUWjOmiq+jNWClz/1CXnLwFRWNPOiNPhwEVOVUZl2mkp762qFa/Gk@vger.kernel.org
X-Gm-Message-State: AOJu0YxmHEvU0O8l+lGmFXXhZmLIvYgUT3anwewyCXtvhe52cg0ZNhDb
	saWDHUZeFyFyVNfFcvxITTKEVu6n+JulvVzGcCoiEvo38nEG5Ebl4259zGznj6EaQWQNYt6EaIk
	IZAyPXKXGHG4H9G9IStwTwA6GPRDuoaHaJFKVHtsXs9N14qYhDtf87cHEHlMaBXl/
X-Gm-Gg: Acq92OEZjd7A52WrD93YeDlFUrjPRCVWhxuGcAHNDbgGLsw07oturf+02ogXYl2yUPD
	/r8DRg4H6/pNazT5lCMJvsLRoiMlpyERH40nf08YCJjqyV0ojdllTf3hGbWMN5h1GTJVsEh+sP5
	5zr0TxJElyDF34FeNKk9T0HEoes2JVHeyIXRycyfN4vBrpLhvkSa1wc2I/zWQagrSilNhRkBYwh
	FvEszsbVrofwWRR2NV4WY28ejSCxO8NKgVA7iOsYAMtdVtYPs2+UWgmacHy584qSLHT4Lb8JHuN
	2FNRHBjcr/eeRpK0vPJOe8KrvGhzrDO+4A1OnhuVWHKnTDc8C3wPVWv7EtR9XH9rsJ8E9LIEJC3
	YLWj5TQJvykJmlpnu4VqG2uSfh7AYIp96HkQctcfhas3mEdD+FEuUld+AYH1M/scZGO+j0Vsa8J
	6s
X-Received: by 2002:a05:7300:a987:b0:2dd:144b:6c2 with SMTP id 5a478bee46e88-2f54aa7825fmr5201088eec.27.1778229409409;
        Fri, 08 May 2026 01:36:49 -0700 (PDT)
X-Received: by 2002:a05:7300:a987:b0:2dd:144b:6c2 with SMTP id 5a478bee46e88-2f54aa7825fmr5201069eec.27.1778229408818;
        Fri, 08 May 2026 01:36:48 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c3b301sm1504922eec.23.2026.05.08.01.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:36:48 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 08 May 2026 01:36:46 -0700
Subject: [PATCH 2/3] arm64: dts: qcom: kaanapali: Add CCI definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-knp-camera-v1-2-a18e289163fd@oss.qualcomm.com>
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
In-Reply-To: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: AtgKRiUwF7FDFEplJqkt7CWe-wBGd2j0
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fda0a2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=H9Jx_t70CELBktSlaNIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4NyBTYWx0ZWRfX+VDflsoHGYud
 gcdpCR26JO2yJQ6lAj37vL9nDxh3xuPInq8pxXW3kP6gHnx60Owu/3VfL2n30C/+nz6TgeV6p1H
 bNjeiX3OF6hXao8jdKPcxP1wkoy+nsz/A8xdW/CCyfzmCKI2HLinVGNpbYLuZqjsDeEdEZxq/gl
 dpAL1tpdord0KlAMlf4unR45uAyJGPGHbY587O6kEZEaTNpoOFHgoz7mmtC6iaOvaIECyH0Jgmh
 iK2EOSGCgo4mSxwpg3GV2ZWP7xaQRJePT47NiFtIUQpO8/hDrqc2ZaXHWMLrDyy+R9WRDiqAohO
 1cfh4NQ4ZKmYujPv7Phj46rMPHz/s/gCFnTWxD0qaEbnKbc8fpHU/tBmDyhNkAKJJomj9hPtbQF
 gI9UOoffxlLd+56vDqMXOzXsBopURgqUG0gV69fbH+WzLP3Ep6rlr8i3v8IE5WZ8Po1tiueOj5D
 k/meuq3GypmcksRy8tQ==
X-Proofpoint-GUID: AtgKRiUwF7FDFEplJqkt7CWe-wBGd2j0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080087

Qualcomm Kaanapali SoC has three Camera Control Interface (CCI). Each
controller contains two I2C hosts.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 282 ++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9d8aee202797..ed7b7af6c43f 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3339,6 +3339,96 @@ port@5 {
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
@@ -3813,6 +3903,198 @@ tlmm: pinctrl@f100000 {
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

