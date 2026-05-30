Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6AE3AB285
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165717; cv=none; b=qqbbGCqcsMmyLCkrWNXVbAUbdnHNoIVO49HZyNGkTg3BFYjG0zxRJ5jNmO+KvG6okZqmEyCtehbj/6xhez+Y6DQl76bpgDKdX/ghRRQ0zuMYf0EQBzprkxcQOjE2MlfPY7L+4ASAbYzPjas3sKtjc0db3OEbzibt68SqumOs+sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165717; c=relaxed/simple;
	bh=oss1AbFlJjJbPFMAGAr7Uw+fsc5hDCEahi8e9MXUcUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tG1k/ev66LS1yEqokj8DWjtsyed3ZAQxrZXcCZc5iQKUtSCsFbfIcaEX/Y6pFUOK5Mj5OovXKpxBzxYpWtamghTlgjoL2VetTQyHzzZWYFsdZNd8ZO5KLzzuIgBxW25MrSriqmIiSP06juQlbDWMcCyLRZNmSl64nAvHdPATRE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkdSD2tq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsCwnpI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkdSD2tq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsCwnpI3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOwIA3354031
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bH+gIPsCKk/nJTFnyZErSz7Q6U91uzeLCAr7o+pT6dw=; b=RkdSD2tqGpV7b5Pl
	o6cKqdJG+urywZMAVXFPFf0afLHmvqKNVg4T8ljunsS820TSZNvNoAciOjX77S1Z
	vULSOCgVJ+eBUBLOe0n4zHuYLzVNDfJZlzKMiMPBk0/MEu5MD0MLuq2lUCGbr5nd
	4uIeLXnA4NL0dop79zsqR4tg9am9g91dDkEbPRDQ8n9/gIt98EjLnN6LAB8rP2NW
	VLPEDsNVtsO+xKmPh/oAxbk9xfWkH6npnldT3Xym8eAyNGnaYnPJ6hb6e5x2xkSp
	sfl9DNUA8FkMRBSOtAdiiVGcRgaKFm2cZMtx4H4CpmcgZ8W8UnsBs1uLrVN+17rK
	zw64Zw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2h9jp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf3636d6c0so9893535ad.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 11:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165713; x=1780770513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bH+gIPsCKk/nJTFnyZErSz7Q6U91uzeLCAr7o+pT6dw=;
        b=BsCwnpI3kMdC4C6YRjAtQYS65er0/3omQDR40hrLsJoa0OhJ7ShQNQJ7kfhZbZgxRa
         bip5FIiZYCOo1JtSADhtUt1fx/jJQrLPChiGmFbfznRtPVCohAWYblLVFvxxmJA0q8pL
         6Cj1UqKE2XUxT8zMPKxEBsY5BdCbw8ju9Bf2f2xTDkksSwjCMLJimA0chKzNLnATK60G
         iaQ4/dn5hpl6IzbEAwThM7XfQzpYaeJNfajmm74ZCA5nnbkA67oJ2RMQmP7sb3iX/ObI
         1Y6fusYhMlmyN0UN+B5FRfYW/ZevrRYadDE3KJ1tgD3Qf8U1jqBVQwWI+EOHOScfVhdM
         Io6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165713; x=1780770513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bH+gIPsCKk/nJTFnyZErSz7Q6U91uzeLCAr7o+pT6dw=;
        b=JXSdBR7msWi7uADzj8ST1LBQhPVyMlDDjtRsXY5+hNp4DYIU5LcleGk4HHvCE25rHq
         ys79WpgDtPp4iMWntyizy1Z3WyYoGqrjmeDqyQHOj/xNU0OkPnvr4/pNEIWzWuz/ugUf
         zHtyM+J7WvmJqJfnE2G6nC03tsV26PawWjXH64OTBEbts3erDaO0Xm/Kczy2+lBT+UhT
         MkUFdr0VsVShlqOAeEEBBEN+yB7qnY+fq/PCC8ObgvpvnXLNqun6MHHEaiqXB5kijZ+m
         /8fB+koKwas1KfaTtPPanRbZVCrpEYVUk2DEOZczh+5glAMa3l2GpsDNjqps7Z2hAyRd
         9sfw==
X-Forwarded-Encrypted: i=1; AFNElJ/bgYeaQ15gz1FgrTh7uQdBE/oMUGboGuW8D5oUxWt6f3v8NrZdGmebZ3dk4WuSTkdjPyFhjjZQ2UdN@vger.kernel.org
X-Gm-Message-State: AOJu0YwqGIl6mWLi0j7izhPIdF7VA4hglhh1lKv569+cxwYussm8LQzN
	GBlT2mTllrZqvaSgOouan9kL6J745qumU8OEou9j0n1xQ2iBgy3yVf7kxkwZ+r15RN8TpdDjBpP
	LcxaGFwVGYMIREPRo0d7KWTvkFkfqZ9a3gLcd4eNyS8/o6/C2uZ4JntHsmIwTNVzj
X-Gm-Gg: Acq92OERCSriBlzbiL0rgBRSw1v3mSHNDqiNE0VP1pmgxNnkAx8QP4oA1ZRpp5HHjKE
	7k5BUGbTwPkEz9/ciIHo8Rn0YYJkORNyXZvcHH1nHP/V2bnSSDJgqjibwdkaWcNeXPBOAISIVHS
	Ng1Uq/bk+h1mYapq0MlKICjHs+WJOcBrvJWCddY3aJmcFAQ/ajU2q5Yh5XC5wDB+k73OM4Mbusl
	kv9XFmTxGlM1XvvGzVI6YHR5zUD/lx+gXC4C0joJXsS3uHhR6D00xUEtNrW551oXA0vCQuDj9mr
	Z+75vmpfvqXFeHCvPsKmCdvwSipXxl1P5+15f/bwGid6Q3g+GQIswmPf1lfzaCIjzTDMoHXxRPd
	ML2IjndSvjADZ4wJNfSPZkyH/PLLT9tawcrRYeiyJpOsVphs=
X-Received: by 2002:a17:903:2f85:b0:2be:3626:dd49 with SMTP id d9443c01a7336-2bf367938eemr52641445ad.8.1780165713235;
        Sat, 30 May 2026 11:28:33 -0700 (PDT)
X-Received: by 2002:a17:903:2f85:b0:2be:3626:dd49 with SMTP id d9443c01a7336-2bf367938eemr52641295ad.8.1780165712739;
        Sat, 30 May 2026 11:28:32 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf28973335sm51702635ad.63.2026.05.30.11.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:31 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:57:25 +0530
Subject: [PATCH v2 07/10] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-shikra-dt-m1-v2-7-6bb581035d13@oss.qualcomm.com>
References: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
In-Reply-To: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165667; l=5225;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1fh1aHI11+QB91jAsPzkCHohWd1ShL+ruDzWZEwaklY=;
 b=jkexY4H/VhsA0FT/YAUnimWweeds4hhgaM+7ZPRYNmmJyJ46fWpb/M8dupPhcFAMGyxrMt1hb
 U3+Osf2QNkBCNSrZDihs6WpptjZlX9hmD8hK+FTUR48CwZMktCpOG5q
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX/sEm5e23MjeV
 i5v/HGgHuAiS5wE2dzJcp/ZoboX/73c/dSMHcWs+To/DFukpIbVedyVS6abNSIrveSZMXMcpoQo
 xHKil6UJfRH4z280u3qCd85UG/zOZmhIXAs/W8IwpvIrjkljCV5qWAnMVvyTuA91rNpieKPvHLi
 wDINx3UWSn1DqKxJ07BixuasZedoTxX8WXfWEw8mRHzfkFPeXq85TbcHYx2cRd9sOdLX8C23vl4
 338gn1vz1WWKI+4OcboX++KKRwMiCqnC8ObNBmnlLwHlrBvEoVr7iqAkqWhYdkJkRkjU/9e2KKR
 PFHz2J5gjg4dVOTTlA7sa07Hj96ASDvrZMtVuOoBaMlBZtyxjizLmAX1bO+LVQCOgaUnlUqq70g
 fywjqV+YBglOSz/0Z3bGE39ZbiSlKaCHZD07/ymryb5prSIeOQEeryYY3GhT2e4cFpHbUgbmyM4
 YCFlyjm/udqGPQTVdyg==
X-Proofpoint-ORIG-GUID: 9h3dRsCynDk6PSOZ-pHJBaVPJiA0KYeY
X-Proofpoint-GUID: 9h3dRsCynDk6PSOZ-pHJBaVPJiA0KYeY
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1b2c51 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PL06LPxOd80rETEQ2XQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 10a6e9f3b5a2..eaed7c53d4cb 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1798,6 +1798,170 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		remoteproc_mpss: remoteproc@6080000 {
+			compatible = "qcom,shikra-mpss-pas";
+			reg = <0x0 0x06080000 0x0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING 0>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+			power-domains = <&rpmpd RPMHPD_CX>;
+
+			memory-region = <&mpss_wlan_mem>;
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 12>;
+				qcom,remote-pid = <1>;
+				label = "mpss";
+			};
+		};
+
+		remoteproc_cdsp: remoteproc@b300000 {
+			compatible = "qcom,shikra-cdsp-pas";
+			reg = <0x0 0x0b300000 0x0 0x100000>;
+
+			interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING 0>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+			power-domains = <&rpmpd RPMHPD_CX>;
+
+			memory-region = <&cdsp_mem>;
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 4>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					label = "cdsp";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0201 0x0000>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0202 0x0000>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0203 0x0000>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0204 0x0000>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0205 0x0000>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0206 0x0000>;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x0209 0x0000>;
+					};
+				};
+			};
+		};
+
+		remoteproc_lpaicp: remoteproc@b800000 {
+			compatible = "qcom,shikra-lpaicp-pas";
+			reg = <0x0 0x0b800000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
+					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
+
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
+
+			qcom,smem-states = <&lmcu_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 9>;
+				qcom,remote-pid = <26>;
+				label = "lpaicp";
+			};
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

