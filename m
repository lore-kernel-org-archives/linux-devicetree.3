Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1033DD857
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 18:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338188; cv=none; b=RaVRXEIB2LHcXLTMgmydxnhuuDMjIUjoaaLhplqPew/1o0ymruWtMHMN1+bljWmEE4SUlscucoOFlIMU6zxdGBb6kGxPE1aqS3pe2YcvTxSHwVYSH8zs7iK1isxLVfy3gEirKZ8oeraaCE5gmQ8s6rstGgxZBNmdoMGWfG7gLyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338188; c=relaxed/simple;
	bh=jFgECGOc2on3Y6/jQdflAVXWBUYw8TvKJBBoRvGtuV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mf27YrAYDx4Sh7Brh8ZwBOB0i+7DlxR8/852NlTO3qpKeqkEYPSqX9SYTvtaxK+j2IhujWi+I6Td/R1f7GAHN1254fkfanxrFSLpbV0eBO2VUAhSR97lrUTweBL6rFeBHIzVrCJ/un5S+mRvsnvQayskLTeOxaBXqNlTKWB6IyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVpih0gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YeP+XHoB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVpih0gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YeP+XHoB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651Ehxeq2740432
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 18:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1KLv90Wjpb0X0k9PHELOtYP3UsUCkMTevPPBD8PoQc=; b=KVpih0ghoQ4vEN1S
	QyKVXtlXAtFH5Jbq0ckBzHJnt1y5TAatz1TB57WUZtBt7srITbu9O3hLUBXsTD7w
	9V6xaq9FAPs2JrHfHy6QH9mba4/ohdN5nZULRWuiWW+1JjLqCCVvAOki2kjKmDh2
	SOxrJ3ZLaPHsC0mouKCA1NH8oHS2NnCzCEoj9j/gInKKVn7UPS3pdU/M6hvCWDCt
	48WP7L5DmLlcaCasLBydH596TbwRlx1XD8WgPxcQFsdSYFjgYnsZdwr6gxxBI05r
	N3+h5E2Gokts2HQp6d11b7DZb1tt9OywbbFGJHDlyhQIGLbeovhkcAREdKr13gEv
	odLoeg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqjg20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 18:23:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a2cda4d0so827132a12.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338185; x=1780942985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1KLv90Wjpb0X0k9PHELOtYP3UsUCkMTevPPBD8PoQc=;
        b=YeP+XHoBnev2j+b+1bu9eMNRNgppc8hgY3S8QyinfgVMgmS+GEhvro13yOjDgDzLa0
         NCRXzUWLGGrTE7Bi7rXrhsiA7dwdcqdNnuIn+32x8FLNFxe0ZZTZ5lqvxxQSlPy5yRZJ
         TxwGil09hpkqL/oq1coGkwieDow8VgGbmp2JfUZC7i17dekj2rkojkDDGAsI3KOeDdLr
         jZEOBrzCLyy0l6Ub/7MQiqG5Op9/X+NevVIYCmj2SaJdkyu4IXIL3LWmBhSl2Yun9JTF
         sofy0cO8Hchgec+Rrb4xKrPko7hTzdc4K/Hb6w+vcTJzDfH809EZKPWCE0YhJ+fl31nI
         HLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338185; x=1780942985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O1KLv90Wjpb0X0k9PHELOtYP3UsUCkMTevPPBD8PoQc=;
        b=ALAh1AFtxfY5jY0BEJB04AkDflOX8Imey01Yvu8Z9ynZQRBFb0nYf7h/oAjW44TICG
         nPz0gSSs068VJWbCAuGI4XBGZQkx5J6pZP+lhe/0MmSgzfKwvuTzsFn8Rs4s7RDfUnbN
         EguVhS9238YqdYPkCm9SEIR9RfawMfKryG2G9uiRs+aOKmG3UARRq7jiSisWLnN+BW03
         YJHbctn+f2pkrj/KdTi6UABNf70jOKNvdAR0zO3lyAkKBScKKdI4YjNNbcIRyQo3BpQr
         +9tARPG6iQGIeY8UBonn296pGaHoraobGSdCyXxecowb05H2mGvqpHVdMuXh85fJ2Jln
         sdAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8pOn+2cg6Y96NHOaheEF5EuAbVYa0yl5hdEfH+vSC2hQX78lSFOCVJrmepIf4pIPGQqlGEId+RFYd@vger.kernel.org
X-Gm-Message-State: AOJu0YxrXzYMbGgChSy0wtRI4saZT93DGWKCqX+Xw9EVhjumS7EWN0nF
	rncJW6mI0VS97u+EHJtG6j0RJ4ojikdfl/KpT2TFPG4wavtl5Mu7ytCIt3n0o9LzuIitfMfHRCE
	XR4mS/gUl0HconLlRxz0eGn/RSfPIAbz0oL4ki76BIGGsQ/AAqHenjx+eAJEGiSRT
X-Gm-Gg: Acq92OG0Y7Gu4F8Fxr1YM9Jou1qRLRdjVETmXeg4MHITusMzHnKo6i2NyemcrnBOdDn
	RuhWQTC1fsvoH0ORO3ecYg62RTDIl/lPtlch+tLeBvf8lvr6S7I02ii0HHKaeQvJm+9M/EmADIy
	rlEhAl5el82HrUnh28DUyzVJcVZh3ooPKHHP+sWT04ilHMcVCnKRaP36uO+MdYRkIRDcCMjmL0w
	ro4uTCI6FutOcicYpHPg68prqok3zgORNiwSxcDr40ycjI5caL9SR34J3j0UHrtW6ammWrUxYHq
	le7A3CMlvHUZLVuW4H5IWem6aTHQU61OVR2i60E4Ktaojep4FZOj+I6HHXDvwB4bLYEh3v79dRL
	84WguEM+zaOJj4SqKJOD7EUF8v0b+GmSzByitl5enjFecJkcqc9RkjzCECRDXFkA=
X-Received: by 2002:a17:90b:590f:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-36c501ec093mr9724220a91.14.1780338184783;
        Mon, 01 Jun 2026 11:23:04 -0700 (PDT)
X-Received: by 2002:a17:90b:590f:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-36c501ec093mr9724178a91.14.1780338184303;
        Mon, 01 Jun 2026 11:23:04 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:23:03 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:34 +0530
Subject: [PATCH v3 12/12] arm64: dts: qcom: agatti: Add DSI1 PHY and sleep
 clocks to DISPCC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-12-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: dXu43aCRXr4wFwPmezU17dBuv5aAbI7a
X-Proofpoint-GUID: dXu43aCRXr4wFwPmezU17dBuv5aAbI7a
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1dce09 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Gd0QNvzNEKi-DX6Kg7cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX4uJQMVfyouMh
 DVRSPT58tSyTA1SjKteNwA2d5u0lvLVFT8DYswE2gMGvWvkv0SP1D+VtMICFkIllOgphXfkaas7
 RQZ3nMi58fbMX1wQ8egm7aNSN24+lcWgnPnZKi11hb2nQVJk9vn5vgADi8zOh9XBrPTME1lYaEk
 rhrRg58r31fRBU7R2+vcYSJOEV9lB+PmIIkbaZMANpu/RDPo42P7CG7PXLWHXktoHr8HZ0YJpQf
 u/okp3D45/Jn9/jWpN22H9aghe2IxfEEK17+93PPw32pzqtR7pL7LbxzxV4XYlWIOhTFU6HyrKC
 23romXtc3YE87/qV2Yg9c/KnTZg6zvgDtmTy8ybAsSc79aJHChfTrfGd3mTOdAY885PYvKjmn9B
 MUff/HQUrjDXsa4GNabMfrHfFCGobCc/lqznM+oG382yrJIiOTT1jlh+VO9quSLKs7m80JbrCCm
 hI9o/AfOyuVr42U4SEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181

Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
bindings changes, which adds support for the DSI1 PHY and sleep clocks.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1ebe2c40d64ed670752a680085b871..d8b07db81ace41f6fe2c7139ef283bea0d0c3da9 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2137,13 +2137,19 @@ dispcc: clock-controller@5f00000 {
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
 				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
-				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <0>,
+				 <0>,
+				 <&sleep_clk>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "gcc_disp_gpll0_clk_src",
 				      "gcc_disp_gpll0_div_clk_src",
 				      "dsi0_phy_pll_out_byteclk",
-				      "dsi0_phy_pll_out_dsiclk";
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "sleep_clk";
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1

