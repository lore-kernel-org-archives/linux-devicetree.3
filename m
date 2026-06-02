Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E14F3C4576
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387709; cv=none; b=o8u6LBkezi3QqZltyZ+ZXgXR4HArhXZTQLf4SMUs4xcUSRgCVIts1qgOtCbGrBCKA3NAzMszT2VhUA4eSseQ+zUpNkIeEj24BxEF1jtqlTgUwCiQZhMwvbQ4xyx1wtO0Ar4Q655l0J3HLfqm9/1rQrBPXilZtgYUxsheeehvnCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387709; c=relaxed/simple;
	bh=87z1o4XyGauYHYE1QVaxn8pz2zob1D2UjTKFIy1fTD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWCDLgTcnl5uaoGlZmI1j/nbBVtuhRmdHqoGnA+OaVNC5ePmsG7vlmYwAR3MDbzpF45c6HqJCcyU2eDPcu3OxNozGl30Dv30VTqFn2Fu194sdIHachgJQ9OI91PuX27Wv0PpjDYpJviB8t9IGnT9aaz23rFDmdyHd9u22u8PH1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYpYAAWt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iX5vZbKS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYpYAAWt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iX5vZbKS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525iovv1316237
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 08:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=; b=XYpYAAWtnkPjDxQo
	hBKdovVf8zA6Snv9NxqOUo2EcwJV6/HdPZS9c59ODm786IVm3YFJqkt1W29ixVj+
	uLjH54JTHQVRb6PFHv7KnBM5+czeAo6V0MHEdNkdr0gdVpSmp5HlJJOwO7WOgJUH
	4kaglDo/QpL5SC5ZgwOWDKXwxjOZc/D4QFkyg/oyoC4gFsEX9H6WEPsEYjU1EHfn
	1nxvB5Gnh603+sFHIBWYunrqqskBWjCNlUh6sr+oZNkmN/hqUOQIi3/IjiAYkuMI
	SOUXdrEF8sHP44DJZjbLst+YR6oFA+HG6+mdugmTb5Co4qvsfTTAFx8JeiVZ6S4E
	lysDGw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vrjct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 08:08:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-305fe3b697cso1856661eec.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387704; x=1780992504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=;
        b=iX5vZbKS0GZh27zjYr80/RAvfXMwJ7b2X5qnCQZHjlKo4g1F5KLCUJsBJeGatXXEJx
         tnZlF+2WoSb3kRVZ+qpCUljB82ACMOCNBheloKk1K5bwiGMLAFWl+QnV9qVpnkdF9ibV
         81w+0LytbcdrHmAV9XPFW2TBAqSRNENU37ZhRJfJDyYuiavBA7DIzOvRPeXvBWYcb55U
         4N8fVyFAtaqnMFCBuYEPl8RmeP2LRYAEPkUPts+gjSN2Bu+7MPIlmZnlD1wxkB09Epxa
         CRGQ0oCXX847N7QWdPLw+kS34CiEEddsBUZ9q/shcYkZyP3aV0EU9b5kDLTKYl7ZmA1r
         +zUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387704; x=1780992504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=;
        b=PeS9GPadCTn8hdgO8rVxEwa/jTrn/Iux1RW5SVjLTp5k8r7ifEIlfu9CrHB25I9ozH
         VKsuLntpX0eTRLiyDQeUYV+7msRTaVAdjCO4SccAOQqcdHkvy5wdLAo/mwO40I7iZR6s
         xNoCNGjGLhNXt6WMDJwfg6tlQkitz5nx4CsAUps1zT1/jmh6wMLiTqvvCOe2NUN5mHDw
         AYM3rxkLNQcYV/9ddZWjMr0aJKzaTUO6b7+QXUxTQHJtdk3qYNw6kyfzKU+VX7Tj/Kzj
         /Pu/Xp7M2ptXtubLLoKOSLIygBCey3s/tWd8yA5hgXHnBr5AHPbglcCXXi2jHaMquOeu
         9svw==
X-Forwarded-Encrypted: i=1; AFNElJ9TzXeW7UKyqoLdnaheTbWuuhJquOj3Nm0K17PxOaZbouWXvpGbHnNFaWLFh72HzgRRadaEAnzzXsoa@vger.kernel.org
X-Gm-Message-State: AOJu0YxZSaijrotrBKZ9iGpByyoOaUUd3lzYPAIcHGUgNc8bADkzomS+
	FEgMuEvpR44OB2fXjNTw2XT0ny9uDZ6VCysKps0wsuNBEwUelK5rfHfiuLy+Y1QeOK25+yRRzbD
	kY9r1ZKgK3NE4GcSIUyjnoCjmNyji5/1k6aHGGSQKsETAbJd6ZGjbBHVCFhDtjAoE
X-Gm-Gg: Acq92OFFeWtY7/y9+3DmgjI/gYEzRMAsKTTWBwVtMyT3wGytcp4PXUv41czRtuL2iup
	n/rynCJPVj1tUooHbzT4Fwb0Sat1OQdsfQHq7HOLHcX7UGlWXq4N0Zf3k6iE+yq+W6FcjhKOK9J
	T7rOlNPAznwfyutvrb5Tonb5jIsNpoGG5FGxMtFtu7ZCg2xQmqduBZCxo7rhSZqAvzmncIo8LU+
	3PFEnwUWCCL49qD9EuVUQ7t1Qp3ESBzlAqjjWJ7tSxYFYUPSm2bWckLvYRJL+NzEXuMGUd/hFvJ
	iGXQPYiQC7AkJaDDKgGV959mDJzqrWXZ+LG0uE3tJ+sWklIILaBveyUu2p2SPoSqbUCsKzmLJnr
	m1UxVzaoZkfsgYMKz6SHAgJZCanJwa0MODwQiNs7mHqX4A4E9sFGn0omQB+P9MgpoCBoxMM7bTK
	h9hCw=
X-Received: by 2002:a05:7022:e982:b0:136:e639:9c05 with SMTP id a92af1059eb24-137d428d1c9mr6030484c88.31.1780387704104;
        Tue, 02 Jun 2026 01:08:24 -0700 (PDT)
X-Received: by 2002:a05:7022:e982:b0:136:e639:9c05 with SMTP id a92af1059eb24-137d428d1c9mr6030466c88.31.1780387703446;
        Tue, 02 Jun 2026 01:08:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm8006025c88.15.2026.06.02.01.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:08:22 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 01:02:21 -0700
Subject: [PATCH v5 5/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tcsr_qref_0527-v5-5-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
In-Reply-To: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780387692; l=1625;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=87z1o4XyGauYHYE1QVaxn8pz2zob1D2UjTKFIy1fTD4=;
 b=UPCq94NTXyAjj/8Kr/J51oXt8zn3kwg2mLwcEXLnSiq66MrMPu/0BH8qk4i8skP69x6wkbnln
 MlG8QA+8IKvBgXxaxr/ppuPWtrMaq+B/x85wAKv16QoQAsssLJ+wiDR
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: -bAIQwC2T7r1k1hsdxPtoBr_dA7JuY1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NSBTYWx0ZWRfX82IQb7IYgtiO
 d0mGtGUYq8YWI2F3xO8heCpkE+JKWSZdlK1Fkbu0qmiHTmgZf3B5sFgVGsYu2E7/4HjqXtOtniE
 jI7tRBdywAS4MnbhK1oeTuUVnrzBNTB7HueR8vgpPpcG8z4vZUatgr2/fGkdWHPu/LptVaIFeSk
 NDw+i6hEto6fk/1fZjAKZVKzbhP9ThIqo4ULRO0996zj52FMtY1Ob2uuK1E+NVkQM2dof7pU72h
 dksi0p2QVnk2lR0FuRflYHJsUV5asOwV65G0Q+mkevpm08y5o/sp7H+vSW2wgQEBzaGKZobqJOZ
 wA1IBvbORCJjM5dl4tm227K740cQT9KoRpMY/rRWNS4MJvCnRXM89VreGlRPxoX2UyzNjkB0qRj
 liURuozO+ICIW+nPhg2IVBwD2U02rt3+u1WiqZEEmVpfty8M9i740rtN/Ijpm7k/+5mZBfpKSHC
 9QBvxXurJ7YBcr4pyRg==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1e8f78 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: -bAIQwC2T7r1k1hsdxPtoBr_dA7JuY1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020075

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..92b929ee3448 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
 &tlmm {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";

-- 
2.34.1

