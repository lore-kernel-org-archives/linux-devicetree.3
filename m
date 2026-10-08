Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7460248124E
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450913; cv=none; b=Z7RNktgyLi58yCZgufY1ue2/IbiYbQrNOt3lTbtVX8zaVsdv3bdj50hwWaf2ZtoEX6huTgtKn0l1ygkZJpxQMzcer+vyhVAA5TItAEbiZ4/sY66C15UKx6Uf1AMHtxexvPV7xGW2dq3Ybc8g+zpEQm36KY5t9wsPVQ/Y9nzRpC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450913; c=relaxed/simple;
	bh=vuyua48vGGvQ4MxAOjhCqLsnnDg3yPVH+Wq4eUpmj/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0CirYSGO35IPP911a7Fzo2DWovhZEZvI6WQvWe3VeEPX068UZwTOO/lxoCT/xFub3X52gPaQcp5sv/jT+NXIB8ybSw0JVTeJpPMVcWQwsELgr/SB2dWdLxRnTmZNdWd7Jj2SV/I0uru68IPxvOD4nVqePXQzr5xqiR9oBrvUYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrVCE/vu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Brsj2Th0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrVCE/vu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Brsj2Th0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KMNY1845748
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JxDO2hqHzKm71Fhn9zcRRHeljUxVYTK9oflkaZT0noc=; b=BrVCE/vuoUZtV7JY
	8YKRQphQFIS4BQm66cEJ3g2ZemjYIc+ViEOJ6QiqmDC68hBwo7q1F87fIBG0cAOE
	r2gUTIhrYf+pmwTVBFlHpXE9z542k/OvKZ7Hmt/9dovkj2FXqO6nARcQQyMcQHTk
	yywEhYnBewsNXx5QZySZszKGVylYjgUdo5WvhoLMXA2Z9mcQPSukZ2zfy4tBLe5W
	/mrKYyx7Qm72r4pJTvfXZ9i2+1lJIAYNHu6jhgVKx01zB2CtoB06cR/F0BFN2zGC
	UxnwhM/JMPfvX7rRI+72tkGm2QPISFbY/tqozY8o4WRRIZ2kyChDvvF9LjQoXG9c
	qFpwmg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3j6vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:15:06 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so17671626c88.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450905; x=1792055705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxDO2hqHzKm71Fhn9zcRRHeljUxVYTK9oflkaZT0noc=;
        b=Brsj2Th0app4vtC54Z5Jz1W6rh0oFYcxbJ9TAZqnzh7WxR48hjPqRchJX+jjc6ptd5
         XNTlNk7PBBzbvZ6kGZMTw/j2PjwoaTI4V/sxMOPglRxKIIkAuR1/bd9o25PKpMB+uJfB
         ycDe4zo2d8XXRQLsfXRHUEQBepFKu0+6xs2iXg1niqy5QNmyK4KhFEM5FN7yl6YVGA7Q
         rlhh6AUNeSvGOaU8WIlYGdeL7Sif/i+txQGXAnbBdru8Kn0mohQyA8TLiUPtAiT1jwSr
         BFo40IJEj9mPLhCPmmHQ842zgVfBaT4hy+ZYpqLsP+8tDgLYyN1+bGLu7rD7zqR/+5Pl
         8d8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450905; x=1792055705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxDO2hqHzKm71Fhn9zcRRHeljUxVYTK9oflkaZT0noc=;
        b=bMYHVQvOsnEZFH6sawKzamJkBbEVd5WZEQzmIXQxE5EUt2pDep5clgeWSKUS8gOGgy
         WIvUCxpQtkFZkPyawasyFoysKlB4+svtSefMMFPFH8gc0xO5Gzp2eHEJ0kkl45BNbwW0
         XbKfL7VrWvPX48c+Q372AHBExZUY+MwQoopUu334Zn5A5cqOLN9Sg93KsOnEndqMEeGQ
         eOaYu72FnzBsu05Id7hppMmHQY7cEB8s/PFHLeoFbPBGfehVPmAx/tEgG3u5FTuAraH6
         gs01HUPcXOcQh2jDKwO9aWnh0hnh+AH+lBiV95+FfwB316+ePbqV2HwL0fhg6kumTSAJ
         iCaA==
X-Forwarded-Encrypted: i=1; AKwUvBzuWXmx8DrZAWkw+KWcJ/0fZdJ832MrBxyX+lW2CjKjnVv3P8WRHmRhd8RQa8pp3aAUxBntvcLnOXcX@vger.kernel.org
X-Gm-Message-State: AFuF++koECzHqir7OZ7E2Zkvguxb4HG8U7Q251wSj4IXY2rtJaNU+mQj
	11lZNuIAZ4LoO6w7xRtkmWvpTd7saseBBPUjUh/jQAOOON+ftknuiMhc/Ms1nFH/S/Y2KUHg2Eq
	apntLjTYM2K3MyjdOSZmumVfI36122a7y5kvthjYTZCTxcwQDRA5kZJxSnG9IhtJD
X-Gm-Gg: AYBFou16Mc8iP4hhG4d7R0PbXOez3IyBMoZp5GfbsMTM4FjLRpA02rfYJMi3FP6F6H8
	+6n94sNSvjKGvwfdUPV0qTFVVtoIJsrYLA0CDiKOa45eJnswvbatQKypXNeSXXyA4ExUlNGFGKI
	WzAjba/SXOY+cSCkqdIljSqd26AE39dAwlxZOBQlV7iFx12NLo8JDoQVSqhtiif1MDKSr/2e2t/
	s2ew710+5URD0/Y1gBvcYbMc3Jd684S7nzWw8zcmLfQbE6/Bbvwy2MaaJR4tNc7q+p6xvUkNKX5
	An81Ws1ljEskEK5wukds/SAl0nQge3nJNRFcbPNetPO6P6YMuVvMKlaDOSUYaSUP7ieYqgLpLdV
	C0kU3w5YNoPji+UccYXtXDYOOWaFvPwILB+7/qn0x2pkClDkGPomkcXl2gqSGzz07Wy8MoKDHtY
	4L9UrsG10QgNZ/cmOSoiCsqDMPj7Q3
X-Received: by 2002:a05:701b:450c:20b0:143:5266:48ee with SMTP id a92af1059eb24-16208be0162mr5607205c88.42.1791450904922;
        Thu, 08 Oct 2026 02:15:04 -0700 (PDT)
X-Received: by 2002:a05:701b:450c:20b0:143:5266:48ee with SMTP id a92af1059eb24-16208be0162mr5607168c88.42.1791450904210;
        Thu, 08 Oct 2026 02:15:04 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:15:03 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:28 +0530
Subject: [PATCH v6 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-8-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX+9+ueWyD/3sZ
 /BZGRGsOb8KExAUiKry6WylG9boVDGMjlNn8CniofNzmHmkdJVtyjDY1q5L+IKE/leNxNq4hWXn
 xgWn1eBvGQ+Yj+oHd2MtjEp2kykwybk=
X-Proofpoint-ORIG-GUID: _7vNnTbu3CJMfu2WaQFAGTIVRBLVw7RO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX1ysrxHhHJ3JM
 SADM8UK/IbO7+yD0/aij++Ybqj4ZjSSYPIkO9rL5ncRS8BgbBST2MKC1HS+1wUwuEvYmD1dRuTH
 l1hNQgWozbBCczUaqkEjeDwqovlT99Dlywq4S1dvjb1XUhV2ykeKcIyOyvajhyMolNpIL1yPvZg
 4lD+qf+p+bl2YwCCCdwJ5vbCYJXSZWodnH3+qJxZgkdeyhnvV4si7s4rguz9sGJqldRJBzZJgMI
 DwrQGEKnyV3zPZuvBSHz4N3aDXYxEvM0itX/fQGObHg8KUXFeNZLYECRbhFIK4em7HOFyevogh4
 /8Rjgu0IyfUW44fd8RETEB5lyUMgd6vFGcD3t8IaoVLkRmiBYw3FHcZSx3ON8SV/v0v+sna0MSe
 X4eFBvW2FkpAJvFsCo35aPv+gldNBfQ5WD/8GzB8KXQEomiTNyhzT7rI1LCufS6+RaB7lk9cg3U
 bef5QYA1/x5B1OlcixA==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac75f1a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: _7vNnTbu3CJMfu2WaQFAGTIVRBLVw7RO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Describe and enable the PWM block on IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi               | 10 ++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 9f493561037c..eceb6e0ca6fe 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -89,6 +89,13 @@ &pcie1_port0 {
 	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
 };
 
+&pwm {
+	pinctrl-0 = <&pwm_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &qpic_bam {
 	status = "okay";
 };
@@ -158,6 +165,13 @@ pcie0_default_state: pcie0-default-state {
 		bias-pull-down;
 	};
 
+	pwm_default_state: pwm-default-state {
+		pins = "gpio11";
+		function = "pwm0";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
 	qpic_snand_default_state: qpic-snand-default-state {
 		data-pins {
 			pins = "gpio0", "gpio1", "gpio2", "gpio3";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 9b6ebc9f59d3..6440853da8c3 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -398,6 +398,16 @@ tcsr: syscon@1937000 {
 			reg = <0x0 0x01937000 0x0 0x2b000>;
 		};
 
+		pwm: pwm@1941010 {
+			compatible = "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
+			reg = <0x0 0x01941010 0x0 0x20>;
+			clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clock-rates = <100000000>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

