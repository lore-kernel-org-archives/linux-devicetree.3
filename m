Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DFD456DF9
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775690; cv=none; b=TZdw6CXufVxKCGl8PJmB/Qf4Spyk/5iDtOVu1F1tvEyGyJBkLKzyGd0vL7lshFkl+JrquGgWE2vCkOvI7J1jNfvcYxUl2OSjwO/sgMzGi/Wsw444vJ/9CYUb3hczz2zrrtY3/2JXLIEAuTrlV+TojkKydLBNOIIau7r1OxxfwWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775690; c=relaxed/simple;
	bh=XUtqXwyAv7y+q7jdJ2N1lPBjojXnko8HRmMf0Xs+VqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=liVfixMdVvUWh2s64bvvsP9ZcmxzpN2R9WcyFq8S1MhiIhQZBcEFsGwXgKRAlZAi/WdV/Pbf1qv0XDdKGFr1iKedIp0Yy/FOy42unb38RBWdMc9Gmse0JV09N1hviqpd9qYgGR6zhh4L+twygEA9SRbc7r2v5n94hMPP0W5Im6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ac0o53Mp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3G/MJRY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ac0o53Mp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3G/MJRY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bXSR3189588
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FL0MVUWBY1Gls3buauXsjpNLqJ6uT7ZgJugOpqe6pJg=; b=Ac0o53MpSM+cDuaV
	/Vm9u0nnJm22aA1dT1nSVVSjmUrtCxY1cJNZVIKrxXjI7qK7gTl9U77zDKX88Jmf
	NwsVM+kevX5qHKbCMgjzVe6iV1x+5W5oFHsCcnoxddJVXwbXnRFl1seEwQw9tJVO
	MUlGGvfNzpTv14gp8R+JaDphSAOZx11ST0XhswSrI7G+yqBGH8ALzkepGOmxV0y9
	+Ez7FBkhxiBpaRiMqpcd3lMIj7Zk2eclfykctOH7yVGKjvnCQ0dWrlMTwRGsI7OH
	D+IdYZgvJGxpehP1fFz4gu4gAvKOKr3TfXpH2naDZ0WDQ+i9zuwuqFOBoLGnV+7J
	PuAfLw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx08f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:08:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so5941560a91.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775686; x=1789380486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FL0MVUWBY1Gls3buauXsjpNLqJ6uT7ZgJugOpqe6pJg=;
        b=T3G/MJRYTNlmyMcaskeOvlR4oLSTosDKiqdwplQvRzkNp5cvED+8iRJNRY70NxeP46
         vK9Nk2ioEEWZwCwZvtgU9Qq6Mi4yYUtx//xrjBMrnOrPkDVyEN+Vw7aatgc0Me5OCwZa
         fOQLu6rsAv0tMtiD1QZ2G4oR9x7W0JIjSNLC1kdjUIWjpjNdTufM9H+UIoIVoFDHZUhV
         IzZIc8+ax9If3RSYw7Ji+lLpe2FOVBUHirfpkJJOnm2zkAb/xeyUAH5Bmw5Q7ZR3kcKL
         oyZ2RRwUkVDEEuRrkJ3+D/6wR6DKI4wVwTYuqwDuI37P73O8Xd2cEJOmSseqbQ23ThQF
         jxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775686; x=1789380486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FL0MVUWBY1Gls3buauXsjpNLqJ6uT7ZgJugOpqe6pJg=;
        b=W+1Q+yvTcMzTKqoJiOvtlr7TUWgAqy+O/9vivr3TZTu/RAITKTKv41PmwvM/dXs8Yo
         gx7Jly5V1s23cxWcyzWvucM+X49o2uDH3uiTLNTOhY8nczvUWrGhsPS4SXSvUUSQEGOW
         30hW1N/3NKJIL2+vAc8sFSUSF+NoWM/VwWwoxWm2pIgguvs7eo127wJ4dqrQRlZpBC1y
         p/JNbNJ1P9Z67vBIp2CLaaHMMMjmjX5CFKfSJltsTO/bm4PEbRpj5cEDWpbEvREIcumE
         T2scLA2+KS3WgbQ7S37qsr5QR88B7HPfCPLh3qLJMCBQN2Sy4sw0Go1NM2PbJ2Qi2PQ6
         KazA==
X-Forwarded-Encrypted: i=1; AKwUvBxyr72kU82qYwtGZ8xyrDsdYj6NwlSgUDdS5I0UNoL3Mc/w/YzK+ZwuhERQbVMvINVz5aEqLG8rmqL8@vger.kernel.org
X-Gm-Message-State: AFuF++l1+NMvGorFPEXlVvASMhBtWL/3rMKTAZ87vfSADIfFtGq8z0H6
	s7t/cGcf7RuRhVTBNRh5tL5XQfKwgokvcHAY3fdRRIMQUM3TkiT+G+nYWit43bNJMFAgLaVBmH0
	q0MSCnGYbNVv3HK98SZFrp0lX4RBrB/pECumP5DCm2fsibfFNHdLE3q8A5yC0PnmD
X-Gm-Gg: AYBFou0JH3G74gCl6RJWrdtUToRcO7nnDunIwvqXosrv42RBaPiEYj3F9amoehX8LCd
	46Tge4WYl+lUV8zndMqtU/Me2R/2KxUqepnDk8mopJAKKQG50YP41+PjPIbxfa1P2jwWYgoWEel
	MP7DGZwBF3siu1Lj6kIRigxutLSU2Wc8pO+NF0520RhtDoJEN1UuN8i/0dpm0mbPIhpyhWP5e1G
	4DQya91lAA7ZziG7jF9/fvfZcrv+324/CW9bnxVBhbE3KL39YSTMSQt7Fb5HOiQruy9LWTmPW5/
	nzDPyB7MvePTd1nkIbHFtH3jxsxkJpUTYbvs7MRruqe+mG4hGhsQ9iXl1G8M4rw0J2lU1XiUNvk
	BLGkJc6aroRAqBKg2uDiOh8Cl2hoAYEk=
X-Received: by 2002:a17:90b:5705:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39b2617ed3bmr36834198a91.8.1788775685742;
        Mon, 07 Sep 2026 03:08:05 -0700 (PDT)
X-Received: by 2002:a17:90b:5705:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39b2617ed3bmr36834112a91.8.1788775685270;
        Mon, 07 Sep 2026 03:08:05 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:04 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:45 +0530
Subject: [PATCH 2/6] arm64: dts: qcom: glymur: Add CCI definitions for
 Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-2-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=5356;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=XUtqXwyAv7y+q7jdJ2N1lPBjojXnko8HRmMf0Xs+VqU=;
 b=ybMq2fFnkl9fEfJREjUGfIkUsY3hJR7LXF5HPhr9gSyo8Cwja0+R5ySGo0scViKoYPV5KlAuL
 1aPfEzuQbj2AZm46AEdxJ6YudrohBkQ+hM1BF9Tpv1oefKg6uAmrGQN
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e8d06 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=A0RmKLMI9YBSO-DC9s0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: aH2sG98pJvihgGcbpq-X6ahk4Js_j_Q4
X-Proofpoint-ORIG-GUID: aH2sG98pJvihgGcbpq-X6ahk4Js_j_Q4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX497cqBvleN87
 gVpbBHNTM2EpEFaUqxepr+ZGMzIW66+N7kV8QzgPYGNeBgENg1U8XeIdOSjCndNk8Hv38wxEVBM
 P1C53JuZxiwfjaUIkGRr/Ueem5JPbtE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX9OnWwLxbWppe
 wPs9sLAwcePvb5zjcIqSznVIXEIYebiAAtGVt8d4hPOOXcXl7MZ+qMwWOgBT5j2EQ4OT83UCC7r
 pv2uLPASF/W1MR2TDJbY+a2w7h4/U+G0fzz87/LWqVeeKs6HnKbmNJyvFgG+/GSKv90hq2XP31J
 OvIwyS1pS45nWU18o+so3Iwyg6KR2OxMo5xp+32Sbpg3jl/weKcv0n46ImxSX+JqQlwBodOt7+H
 96jVKC5yT9NUVPtAIwXBWeQxvhUc8LDmUvbMq02TBxdGykYHxzm1QHLmh1JYPIbp/7LdMV4QaTp
 TCpk4k+8W7OtdyEXZD8mARtOkD3ubXOrsJLFfIlN7tK191B+z9z80ahvHN/DPf0ocTn623JTYPT
 /FDpCP3g+wIqi6evzSIg5aEaI8ffl7eubp6G96oVqp73q7+1HsDu0Q/orw527XXaOxlO74n/ypl
 T1BpNjgEQ+1vr90+xPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

Qualcomm Glymur SoC has two Camera Control Interface (CCI)
controllers. Each controller contains two I2C hosts.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 202 +++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index c463cde46cc41acd7b8091616657bf49b38b7f9f..4c48df593d1834a6ee7d97c9981965f557cad16c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -1886,6 +1886,80 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,glymur-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac15000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 456 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_0_default>, <&cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep>, <&cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,glymur-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac16000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 859 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_0_default>, <&cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep>, <&cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb6000 {
 			compatible = "qcom,glymur-camss";
 
@@ -7015,6 +7089,134 @@ rx-pins {
 					bias-disable;
 				};
 			};
+
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio101";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio102";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio101";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio102";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio103";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio104";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio103";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio104";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio105";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio106";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio105";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio106";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio235";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio236";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio235";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio236";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
 		};
 
 		ctcu@10001000 {

-- 
2.34.1

