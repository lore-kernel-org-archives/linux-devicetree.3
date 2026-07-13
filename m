Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB6F357CF7
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971468; cv=none; b=m/iUPNavVvaVRmfOI80uSum5QkoEuCiTEKPIZIv/bHZNbckOn7k1wxigkaRZ1Tx9G1ANvMLRVLYA9FICFpnKJr5X9eLy8TYEix+1h8I0rQaUh5XFSQ05utrGCCm6Hfq3znCO60yDnYDEdzC3t3WNfO64uVa+VlbhGugNkhlVqfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971468; c=relaxed/simple;
	bh=gGOcOClOufbjsAy34iXb++FNQ29HyxuzrB0+WRNoYEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eFDE2SlciSB1q/oTRxXrIjTZzXWBeRxj8ROlVQ2r4NKzQeBTrKd+6yAypiZZi3i/dXb5ZFrv3MlsVsY4HGiqYr3uonf3nRAq6PHjWxCyEt7j+vTqlOQzo3WDiY1tW9pop2lgwSI5sx6d3oP3hiV5e8C688PhXDuE44u0LL4giM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2N/0XDD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXPYv3wx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2N/0XDD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXPYv3wx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9YGC2356013
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjX3LlHlsVHojRvPM71du9cKmTiXYa777UZyKZrMZ7g=; b=V2N/0XDD80lZO/66
	SdfLlwRdTFKTY04fzpB1fNsGIZCJGT8WTLZOH50jB0oqPR+jIT8VlN2Fsb38wpld
	w3DeRK6JUzfJHIB0ktfYMPQTZmuWKCiQXMAl7QhWLJ/Nt9ep2YnNBy9mFJJM6lIx
	UXUe8fD+TpEHLUgHdYGg+WlZbeRT/baItgA2H9LK//GoxUp5YiY5KFb3bgvSaKPn
	JJXl6ZxeqwgAlkDCJ2Ww2Scg31I9fQreeLs2OObNNTKeLQ2jfC5E9RC6fXBzsRCq
	MJQ6YP3CxDjXHpoEK7pBNL7csk+njtfEzVlnyfo/sEQVB8Jcac8fqpBiCbp27nWH
	0cnB3g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4t9m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848544a8496so246496b3a.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783971465; x=1784576265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjX3LlHlsVHojRvPM71du9cKmTiXYa777UZyKZrMZ7g=;
        b=RXPYv3wxQduS4Y3CU+w/NzGLdePBWP/xWBgt7arCB6jMpK6Hbfnk0IXbRtuoJdskMd
         MkkwfrLAwMm1x6APJzj8a1Ac7chlC+QQ7IASM8f3AjM1xs6ZsRMaKGpprqDUjyeUhy2y
         IaabsSu9RSLT8QvoqVJpwTwGC8aJHwGZJnsBrjZR1l7tXpHoouFu/uy3JfwkgLvH+M+M
         aYfYYAwgEKlr0gSOSVB2MhFpP/m1Y5qJdNE1tPzFj9oewspwbdugif8iMy4GtdS1godP
         9R43565SKztEVRmZUafMDJG7zbr8u/v8Dx9SbYCkyM9ri2LIb983AxUV11jOWxTGyO1R
         OS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971465; x=1784576265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjX3LlHlsVHojRvPM71du9cKmTiXYa777UZyKZrMZ7g=;
        b=YP29HJRRHLG3pZNy32QHBLTZuMcpX5ZDQxsINBUjDDRpY490/ol4bxqXPm3ynHJE3f
         SeaT2OAHHDK7mPsuMzOBxRIWdjJCWUFJ/Uw9pXiaAiYWKP9fB4boCZVyKQs3Q779cwHC
         xqhi1y4k0qSghMeTdC8jx5BxzAELNbNYxzdwlUoX1tABwHLU+oja1tnRNSM93YsXrDTf
         syyJMAXOmYBfVNl1ArHHUFAMk38Di+uetM2a7v6Uyce06OnbrxCIIzNUbAF5rsjFHHL7
         YHTicW7a+pD05m1kWkX1XTaWBr2wcjFSMjvCOHxyOfBX/yas0jdXQ0++aDzjqzes8ri5
         hhaA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8WB99l/BSS9cRT4VSAre6IeIz6hcIw7vKoMlibvJSK+KmD8nnDK9R2N+AlxZTZL2XAmj/gbiZkXvK@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+AAfn4Ji1Q2ebXeFeDIpLbq9KJrMvvrsM94slOH2PuWNCv7o
	AmzljnmHvRs/yguNvwdkF/AnquC7YMdu3gMcb5FTQqTKWu8HxB7gJP1PLbPUDLmbp8gDveeQ6ri
	DCzcU6QN+OVyAG4Ikvrt1XoFU+8Cxnhq6v4GTyhHsVSd3tLi3a3JnrLdtZ5MQOWbE
X-Gm-Gg: AfdE7clkThO1HPol/42ZUTowT4XHvH4uzPwkpZ8MmJDoKO7SgnLOf2TdOKHdQVekS28
	CgkX9K/38ae6EGpd8jZATc7PRU+h32NKIMYNndo6q2q1kxGjH0Eme6gYlU8ac7HGVNaO7qJwCYN
	eMXvaBvuTD706ffpTRLKjyJKv5qZMJD1ue+8L1kpVQJXa0PEJDU3qyxE8l5PYw6rmag6Q1X7amE
	KHY4ohLfyji7JCQypAhp3BxOtCYARbGQyR8dzaYYgkFvRd3ovU3tNTWAEVa1OyrF6TuZ96OgXOH
	57OGsJJ1XJBYuJ9Tzg60gUuJSgnxtpwOtrl4P2RCx2+ywy6Pae25E0ZL1MJ7qVq64a1trXM4goo
	yXr2nsDneKX6lldOkepyOTWP8IQ==
X-Received: by 2002:a05:6a21:3418:b0:3bf:b755:ce6a with SMTP id adf61e73a8af0-3c110777342mr11660213637.12.1783971464534;
        Mon, 13 Jul 2026 12:37:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:3418:b0:3bf:b755:ce6a with SMTP id adf61e73a8af0-3c110777342mr11660194637.12.1783971464065;
        Mon, 13 Jul 2026 12:37:44 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313f3ea883asm207540eec.29.2026.07.13.12.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:37:43 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:06:55 +0530
Subject: [PATCH v6 06/11] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-shikra-dt-m1-v6-6-bee265d3499b@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783971418; l=5353;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=cwo48c3pu62HWaDduZIiYL7P/xZdyoCCNEnXn+MP1vA=;
 b=xh/NzwtPwpi0s1CpprXxqoqtZfh2k22liV1dm2iUaoAyuzO4uFmwaoZ3cmr79ZFyiaES5+hA9
 ZhApcesxb0xDOZYrIHhVccpKQWc6wDQu4ODD6TPeWrv0V2tD4tQC8LQ
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a553e89 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PL06LPxOd80rETEQ2XQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwMiBTYWx0ZWRfX+LSDFEc3PDOe
 FAZGGZcFDDSreF6IrpW6wrpRF5Rz2VpM8wf2rx6MUUx0i8zfDx7gmXqYLURGUgE+pfTNfZ4WJPo
 ATMZrvi0ROo0YOs+TrI96ZbsZv50VDk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwMiBTYWx0ZWRfX6QuYRhAo+8oc
 9NUh7jXTaU0VPfqx+HxJfl8F0c/7fbMw/61OYyr9J70ICL7vxV8Z+vYSv5DR2cv/6vfrXIgczp4
 pfwlakqZ8cEJXtJxXiAg3m170ZsUj1OxrE5sRScitAFq4i4tNp2aarq2wPdw9o/ywvyOdtV36NL
 cHdwkkxDQAqy9MvoZN2AwrzIwF7e8WL2VljhUSjuXrPW/jC/3eXivoHLrO/v8cpmZLrxqq4xY7m
 smdNOxmRO3TikSEI6M8O8woM3+GbGNlN8epJBnWgMWLaRTWBmS5pARTBcK8dVgwBbT+A9RjQRC2
 Ndx4HKapwsN/ZvCKDQYGq3nHRk6KP8HX8RFzE4Ib3sofJXHiCkT+N90fTBdgqd/n0L60f90Hk2z
 rF++hbMTiJjii2pmoRScDYTjMAWTU8VwioHPS75VY5jkt8kBafvIJW/lFM005GeMfHYbCGIxrVi
 IJni8bAB7QeiZ5mf0dA==
X-Proofpoint-ORIG-GUID: vjfJ6QUah5v0-CR9-iKzgBWolDXQRjQR
X-Proofpoint-GUID: vjfJ6QUah5v0-CR9-iKzgBWolDXQRjQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130202

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 53dddf35963e..12e4281f7b35 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1813,6 +1813,170 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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

