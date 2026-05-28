Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178CB2F8E91
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935373; cv=none; b=LhUVNDOJz2Rk+KmVY5JA0DqCL0r63FtLcriYSWkjPvHCrFrii/rLy2i2pxzdC7MTr8Ew7FmFGFzobzERVO8wt8sAwzzzpyCByXY5HVZwUBqe08Ehp5vU50tu1IdXTnYSgRER1w346jc3eH8YdU6e6fa2sdV1QQAJF97DTVOAVuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935373; c=relaxed/simple;
	bh=9FZHk8D4zHs6knN/tvir728/vX0PR2DvuCRo3y6q31w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pf0RIokgGBoMs1+QJdzpOh89xSH8z59STH0HxC4FBAP7Vr0RiLEroHFgRL7kFzv3W3rnwDML4ICaZb/LPZjI7nNJPTlPqKje6cWwI992QH+VhDxYo6EK0G2p9x61J3OgcvUTcbppVulr7YDmXSIT4bIwn3IKYUiNylz5ZGsAxPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpNKy7Ls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3UDR4HH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpNKy7Ls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3UDR4HH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKlgnY4188843
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=; b=CpNKy7LsBQy70RHr
	Sr9oeufRQjLPz14Uh58H2MUt9x7ilPTalznpNKLBQXC7u0ScyOOElFP+LFI6Mlkl
	NHIs9VUYuvqGTpSQrCSYnlWbv4Da0ltHUWkitP/+ORCanavYb8uOdBuSBZ4QGilZ
	ksll/JCJt3CBqRvcycxRqyUYkw3l12L73kXaamqnwa7mL7/gkUBStII8f/UHIHd2
	xIrCCQkDhSTcmKeR5JR/ARb4NYlHtAbIc/1HxvgHLmTznwsFQREbRSLSbq3UPs7Z
	6q2bNt2pDFbUTUVTP5PB7GT1VF/HT0LKZ3DLYhjz8dx+BJIwDdMbjkQl/d9eq0YR
	t2zMKA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y2rxxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304448ab58cso7227100eec.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 19:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935371; x=1780540171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=;
        b=a3UDR4HH4+HTq49M2rfm6DImXfxXeSKpsShthGTVo7kK9Z38UfE8PpV4HsJLZaeadg
         ombZGHEGc/LrPgQU8tDRfRBz723aBhCMb8jIjAIrPDQOaQe/xb1srneqAevolMmd/8rs
         tBfMD9QRwubReQ9nIQEo6MhZnJc2dB6h9jiKOapRET/OXuOawU493eblZUCXy4PF4GeP
         MheOMOG+rMPoxB6rAvY/wTVTb8StPVViGjkWlF/iU4CBXp1aO3px5SFZMNb29KkC6iKi
         Q5F12arbPsR9qJjE5xqYHhMTQmI9yClwb1aISi88Xtn4X55MZQhfQdhgHpIUcva53L+2
         4Pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935371; x=1780540171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=;
        b=ROEyb0DFX98jqQSKs2OAK/9LtDQEeIi05H5MPRBSLpfudOcLB4B2lediNSFW7bvF/p
         E8cHkhn0GSCyo5Ot9OzMy20zUZvnUneSAbJc4Tj9d/gppDX3NS2IQ/U7GPK7eSi+gjk7
         ZGAKwoy2q4jO2lBlEPraCL7MdGRnSqo5h/qcMA/7hxQAPqepXCLPbgAmmmHamVN6Cb9D
         b0BAaWyZA1r+wXfkyaoUjcGgNocW6kitBRWxIo1jmNKOKNHFeU/lw44gGTfgFoflYIxC
         UrYKrGVE2u450hhrzb82NWAviLVs6VMHST6c/CkIyNG6hsHgj5s/NR+zFpK8Ekn8r9c8
         Qo7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+aJbjq6mSvYBS8Yr6QEq8CV4qwDKJvIEaCCEJ8/t9WLG66m1VFs11OYErGkBMGnFxauyl14badYnOI@vger.kernel.org
X-Gm-Message-State: AOJu0YyHt8WL+cyedcT6t8KxmCLRmLhM/IFesp+WCBviOSmKARxN8JEI
	zGNPrdZnHyKyzHwsu3HJHjKo8I11eBDvvLbdEgszc4tN6Y904YgRGWp7ln9OAnBVYNFjLaCUj/o
	pZKw9ldRTNbTVkgGPtYUWUGFM/7ewIrrNlRYXNyYIyWJlWKDj8DANwgy4Q9vEoN61
X-Gm-Gg: Acq92OEq3gjjQCJwXMDcPdRZPIzB7ysnMJs1QBc186rDWe2gv2kYv8jq7jbbzgzAy6A
	71LgGsnXxdPpB9HzC/zOtF2rz9bmcTWtuPPaJn+DPN4tNHAcmqTf0CeHD+4r71RL9S/1o0l7GLu
	45KulokSUPDJSlCODDXzBf9D87VvtYEI3u/4iUZSWN/xA/pLp2s6LaaVtqaC1Xf3BZ6mw+Pi07J
	OxX2Y8ir/ZiqFc4xEpfR6wXrCD39tEbDk9V9i8LxDHQOFm0Tvfhzwox7YebwFPHbPbUcmyipM2/
	QQOM/Mg9hgV4HuFFou/CvN0NNZ5hTUsAZ1cZbO9ghTc7sh0s55h34sWKr7U62CF5kXm/0mbcJNW
	Ro8boinvX6bzVTa5lxifYDIKdSxesSpysMRTCh1ZfHj/2FYmvdtsLDCDSVgvlJ4ICAeYeuLIxZc
	zHuH4=
X-Received: by 2002:a05:693c:63c9:b0:304:705f:e4e8 with SMTP id 5a478bee46e88-304705fe96emr4415256eec.32.1779935370666;
        Wed, 27 May 2026 19:29:30 -0700 (PDT)
X-Received: by 2002:a05:693c:63c9:b0:304:705f:e4e8 with SMTP id 5a478bee46e88-304705fe96emr4415246eec.32.1779935370137;
        Wed, 27 May 2026 19:29:30 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:29 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:17 -0700
Subject: [PATCH v4 6/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-6-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=1791;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9FZHk8D4zHs6knN/tvir728/vX0PR2DvuCRo3y6q31w=;
 b=eYyn85cRgwDDB/YpWyAJfuJjduiRtwbqwZMpnEsTKvCOI3RVwRimdZ0bP1dbxHouGIYQ2qeVZ
 R/P3sr11VDcBmNvu/Qzj4kCqikqo50jdnj2dEOFvPGXkSYgQ6gxQVAx
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=VeXH+lp9 c=1 sm=1 tr=0 ts=6a17a88b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX8T0lK4S6d+zd
 YNCPn0EdiP9M9jHUJrF6irgIORQyxGlGfGlbMeI/mgWotmWy5WF0yyLZVQ3VI0aWQB5MiJ+lF3O
 0HDieX0Ics6qbI8tuUdbv4Z2JTQK9y6PvHKKsrjxMBP75ew0FDWXGeqoXuiYf0/Z5o4ugBI7yrm
 m/0R5RpSWuygiFKJA1Q3CPzkqfGErp3o483xXsh/uHjs78mmn6JeBqOD7Mc4j+R/55TcnLiAu8S
 lJkiAhfJZrigWTCH683Vd4KFVOtTUPwPzFKRSJF8nEVT3NhCGgtsx/+T9XlLXpDoWpLLUgawJIs
 PGnODczmzN0cJ6oXxSsIA02ZskfpYMTmRNhR4m4pPYhBNEVBkTi/cKsf7xDd3nSxFmtzukTzxWA
 wofGfZsXS4ZaokxnfmFEHg0vgtA9tCRmny+hJPty+lWxQy7aEa4ItqI0/D0hBD1Afsburlo9ggn
 bk7NHWiBvs7pMSULVSg==
X-Proofpoint-GUID: fQWAypEpLuD_sBQ7G4rxnOw8fJfdS8Rj
X-Proofpoint-ORIG-GUID: fQWAypEpLuD_sBQ7G4rxnOw8fJfdS8Rj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021

Mahua has a different PCIe QREF topology from glymur. Override the TCSR
compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
LDO supplies for the PCIe clkref paths on the CRD board.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..8b42f5174b31 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,18 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..eb45adc8a0a2 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -286,6 +286,10 @@ gpuss-4-critical {
 	};
 };
 
+&tcsr {
+	compatible = "qcom,mahua-tcsr", "syscon";
+};
+
 &tlmm {
 	compatible = "qcom,mahua-tlmm";
 };

-- 
2.34.1

