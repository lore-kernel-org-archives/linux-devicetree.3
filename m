Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3B83EF65D
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784250; cv=none; b=Y/iWDvIz0KbwGAuCe/ihRHU8DmQQHhxehrt7JG8DR+ubx7MoW0iwf1bgqn/HxfrkX0E5m/e6cYYSp1skT89j2I4SIFnKKqhju6RzGh23ihr+ecTLk9zs0nqBUc7c7HIqRdbaX+dnVY21hcZYPTEwQT/FJ9O8oSClblhqg/eqn/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784250; c=relaxed/simple;
	bh=00FOeZwcOWo8orogma5CHcMkmqsjukdxheBUupv/Bg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IWlWofbiH/UV0vmm2GKweQYAqoltiwlpL8+F2tWD1wON/NJWHKqiqLOv9+ViuH8/epHwzrqmZDFzmcD9r8Uq0z5qDee5W9bYcW3YV970vddsGeAdrjgjYAEDvo1ScsRTTBj48liQXNFMgBAehAdcDX+WgK3kijC53/lC1a8mBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gReaOszg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kU94MMX2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gReaOszg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kU94MMX2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IArf86936323
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBt4T5ztL+37XoZG4IqKuKFLXZvdRDr6EzRefwCHBo4=; b=gReaOszge1ayGzZo
	YaMH5+M5DJoslZ0Ud5nixq1WaVQcttIuc3NXt7uqnefODZbaEaUkM1E8g8yEGTZT
	VMDCG7q+DhHL+o216OnVacsYKs9gCcEY0gnDYM7KSI7UabC12JNHdYezb93IHeVN
	4yVPwgRu4NSvPmJGsYLHjMy2/6Tq5gWv4emXJIs2C5KUE8u6isXG9RN3A8tDXLmW
	KfFUQgRzzRuWENCBVjscVAwgDGb9PqdF64eWUsob5upxvWYXKfnphf/bKvta91xD
	QGid+Ly1L/N1BBjp89RAuJUVH8lEKD/5qynSsySkwy0EbnZx82sCJDCnYHP7Fyju
	EqJSWw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt543sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:04:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ba395b047so3363096eec.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781784247; x=1782389047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBt4T5ztL+37XoZG4IqKuKFLXZvdRDr6EzRefwCHBo4=;
        b=kU94MMX288RVToT9a3MQKYIyRYow61xckoY57WGPF5KepEQyQo9Tq+sQO1ffvVCbev
         B1evXU24SIWgtawfoWU3cXoT46e1ZWWlj1qWSVMOySIg0PWqzmOLtu5hHwUBb7J4ExXO
         UhyNrIj6wFrYY83EqiNl9qcuLPuDPR2UJF+68NcSHJudEaMqWHbJcl1E7diu79xiO/Bw
         VWZ3ZHY/TRjJ6pDkaoq8JZKlfX/QagxloKlNFy0SAV89OSuMIBH9QSjeLjubRPdZqC3Q
         mRQx1RV5Mbhe5YDnvujxCvSGvPiXk/OzaTdCvFOH9LyR6pi8PRYLDTF7DKF/jFcLlVX8
         bxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784247; x=1782389047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fBt4T5ztL+37XoZG4IqKuKFLXZvdRDr6EzRefwCHBo4=;
        b=dgLZn9ES9wiod2g+VgkZK8zTyBX+g8/bQAca84bEoX76nAwWIRm4w7+HAbSwnX77UL
         MEjtgu8GOfacooUnMIxbp+zpKeYHK82cj+drtk1ME+6/PZymC9UhmpsLQ5G1QWdl20Ia
         MOj/gvc8/W+o7/n/rFTv7ASm1VNdg8thSnNO1li/NJvlIJwKVOUG+W8z5IRn9aThueXZ
         +fFPpl/5wmeXi66vAP/OdkOxJmwfFlbkLAIOr6dfZcfmD3x5OUwV3b36HSXJiISB9Hr4
         FjW4lGWckBervV6EPK2mFv744EZyfjmQVIoKxXnWp0YF8fSVN0VSY/bzXej8xcvb7Kxw
         z1Gw==
X-Forwarded-Encrypted: i=1; AFNElJ+e3mdqAh6zTtx9Gxqe1y9vGbgMX1A5kHlu9K14GGotj6YLuRogFCTzMSyBOtUemHpgfF1kPMTMYROK@vger.kernel.org
X-Gm-Message-State: AOJu0YzoqSzv6FhU2BiQTOEL2lnwQpHW4kbePMb7cHl2e/OSmTPpvzNJ
	lc1kOLDyFQHTNm5iviPtuCRlkd597XpsUcUGfBcHd18ElAaExS6JYoqnHXCKPVtOxOT9uAHsUtp
	kRe7zW01uEb00SilhljSepyY5+W7zMHGgPkLSI64IPubHtMjgb+Yvgq1ANq2oozOhL6RJQ3eVgm
	o=
X-Gm-Gg: AfdE7cktxJtN3TjGqI7K9fCkv6ZuqsfnhYBIIqgJq3nFAhPmt/SO/zbupSMg43BeYLe
	0a/xNMjtqLzpIs1W8K3aeezh90XlqCL23oVTArNwTK/nTWzfYs08GBRzRtHxyIBS7VXWd4yfUH2
	BOA67kum4A74Fhmm3Txs+Li1Mgx1GoX3SvMOEJt4R6jZ0urJqMGjpOF29IGy3Bf6JByTLbPOgb3
	3vMKsOwu4Qo5OeHPU4XFwMic+0gB5o1Nb9kyUGNalnlLPhf4Yj6EaGV00mfRkfu24027609fxsD
	5Ab7J9sQjWr2K1/AZef7KoHUrjM4hSS2U36usPq4oXoD4+jBwem0V12e1AWFId93pjh1DVnbR5b
	hP5tgDERWiuwu4vt22BDkGdYcXe4UwTB5rE8j8XKCKrlU+bLFPZ5xzEiOWgkwE9Qv2w==
X-Received: by 2002:a05:7300:e68b:b0:30b:e540:4260 with SMTP id 5a478bee46e88-30bf0948038mr2457618eec.19.1781784247131;
        Thu, 18 Jun 2026 05:04:07 -0700 (PDT)
X-Received: by 2002:a05:7300:e68b:b0:30b:e540:4260 with SMTP id 5a478bee46e88-30bf0948038mr2457565eec.19.1781784246488;
        Thu, 18 Jun 2026 05:04:06 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30be0c45a16sm4177713eec.14.2026.06.18.05.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:04:03 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 05:03:51 -0700
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8750: Add CCI definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-pakala-camera-v2-2-9fbb729fd242@oss.qualcomm.com>
References: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
In-Reply-To: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: n-N4hoK86ijqsHOdSEqg51qEHlBHMwyL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX5Y3mH7IF8v2D
 T1MsilEKcfttwaDw5qJtl8/Fp12Kq4MSezWWimG8kwsV6X0MZdbPad6pDMYGrUp7sH1B5+2sDB3
 hIFDayt7JQ8iwq8/8t6vHdkWBwrXvLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX3ykNLNu9holM
 KBirKfQP9NuprPNt2zPf/bxy0y+Qu9OEF0ySiJVnrdqvSONsoHh/RZTj3e4/mHFq4lWkMuGLkOK
 4QoLeplipuulsu26yenB7zrcKmLDbeGm1T3uE1XsYYYVFcRpwXgfhHKMw7Lb4ifY0pwL7PIplbY
 Bw03NQDT3LE5v0fd4k1kplkWLHtPOJ/H9k7Cl4wAuojG7urWiY6yTBOrtn3L0O2wQCsb83b2DgE
 katrJprFiEUBcOFBY0mOoa44mTrFXq5vyU2i/HMnfIlUEc3hp9lpE4ZGhxYcCBCXoHJg51vdxif
 WuYdFHzdpYbqkg7tuMa5NdanfImbf94HeVkuITgTQ7Vywz61g8Ac9RkzDIkknjlEvHqj0IkETNC
 SkmDJ4KCrf3p5DbNYYbbBqm3j1mnOz3hhrDjj6UnLPAHKMddeYzWgrj1Xehf/V5ZBRGVoyWeHW1
 iINWn/+e8I2ISP2y6sw==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a33deb8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=--cV21oE9J2x1QxDxCAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: n-N4hoK86ijqsHOdSEqg51qEHlBHMwyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180112

Qualcomm SM8750 SoC has three Camera Control Interface (CCI). Each
controller contains two I2C hosts.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 282 +++++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 15eb588acafb..7dda8408c6d1 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3037,6 +3037,96 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac7b000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7b000 0x0 0x1000>;
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
+		cci1: cci@ac7c000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7c000 0x0 0x1000>;
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
+		cci2: cci@ac7d000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7d000 0x0 0x1000>;
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
 		camss: isp@ad27000 {
 			compatible = "qcom,sm8750-camss";
 
@@ -3809,6 +3899,198 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			cci0_0_default: cci0-0-default-state {
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
+			cci0_0_sleep: cci0-0-sleep-state {
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
+			cci0_1_default: cci0-1-default-state {
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
+			cci0_1_sleep: cci0-1-sleep-state {
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
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio164";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio164";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_0_default: cci2-0-default-state {
+				sda-pins {
+					pins = "gpio112";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio153";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_0_sleep: cci2-0-sleep-state {
+				sda-pins {
+					pins = "gpio112";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio153";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_1_default: cci2-1-default-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_1_sleep: cci2-1-sleep-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio64", "gpio65";

-- 
2.34.1

