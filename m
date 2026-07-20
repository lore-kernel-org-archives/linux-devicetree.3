Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A2039C01E
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544668; cv=none; b=etQXLWFYhQb97jAfqElDABB/gI/L74P2oS0/D3oZ9y4E6DV5/zV87sRKC9tbewv5jSab+kI2U267v+MRWvZnbbeMHmIS8fxEdhGmA6Yaei/x+jonFalXU6JBtbl/XB4lCW5UGULkSXJscg8PI7EGfykesUWQi4PyP9BDQ88tx14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544668; c=relaxed/simple;
	bh=W+J47DLyzKHe2QopLDHxTslHmL997c14k/yofWkF6Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CNEbxlBmqs1W5DQhXY1dOuN1ZG0VPHzZIqrblw6B8Ri40dkY/N1Bz//TxbhZgoclmtRDtEv7//UatMMyIXOxBek5AHAM65hNz1F0Kx/ZBwoNey42On//6NKheoWoqbyKvSP6cEJyCJbgYCPiCw5+jeUIcXJwD4unqkXBiEFITvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQoB52MY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erDZzWVN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQoB52MY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erDZzWVN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vr9e2046210
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=; b=TQoB52MYxPUPNtpB
	CjZsdSV7vUtw0GHJbQYdXNcheLXvDcneoAw8Yqx/j7Tx7hfJJFcN5Dak5V27e5r3
	+l9K5qtq7b7ax85iw5SOs1G7TxQwjIcUoYXCuw9l6klnqXpt/2k22IboQlXQWr/+
	gbagWrfpg45mLCedLOJccGqdKzkkQsSu2Bjwqebzep+xPduAebWXQsQJmkcLGACD
	W9QMaEbxCZ8LaM7nWRIayXluj07rQqe4hoN0tAtGTaGyrSqj7trHqoKYGZiFPz3F
	p1R2wLTpjFVfWTeR7jz+Pb31XWgiNRnQtJNO9wGAsOtwIhliU8zUM5vVh23WAra4
	UXoIEw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg8kpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:50:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8483e038efeso7193048b3a.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544653; x=1785149453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=erDZzWVNIiMNxamrPpOi6mgrpM5nS2A8Ob+oErNFN0YPa3srmMcmPhcVs5vvTB+HO3
         51Dj/7d+bBVhdX3vzsx2dxBGBXK4ipoE7yoQ2ZudvwTA344greavnKSgn2wTBW4stP++
         4uejvrINRhb7Q21RoY1wUDbCqrNT0PWudIs50cG2oiYLdhfA2sLcNbHzWyJAacLWwj+D
         vf7ao6vaV7bA0QrhReGEMI5mZB6cPY9as8Y5fIInvvstOBbBp8cE0Si/zxn8b2ZZToqm
         OhlRMpYo71jI8ki3W4pmbzrf9UcQyACAGYg7j34Jjxg+S7eiP6/Gtl29aff0ghGSelrt
         2qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544653; x=1785149453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=jRkkS/Lsy2oHzx4PVAtIP7FkSxTraBrEWHTE16IMbF5JFYx+Xy+e5NJgGvoioOk7Dd
         WKwlq1YSvXFtfoyNF4bHJuExznECb1sHXuCZfM9HGkfKJJ/01ELDI5vq/zYYM1dTXskq
         th9uOhwcy30BFfV5Hx2U8oPxgmMwg3ymgCv5vAcqJwCeqpw4nckYxYv+Uyxv/EYm6MHq
         lMbog7a/rnZ36YJrt/XJKxbXtSOKJii0FjuMV2pnHcV073lj7Mu/vgPLGw0NcdFFcIh7
         OIVkVO/EAZURbZFZRZAdNf6bBF89PJ4YSd+AT4PKxAfyfUWWQ7e3iRVag1btZnzPzBv+
         90FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrg/KDk4RXauDbBmzAxqXCwMiguvT4L9Sdo432iLJFtQzMxecIrZdMsQ0k9ofVwKeTt1UZyoXPjDuxS@vger.kernel.org
X-Gm-Message-State: AOJu0YzwSy4NyLqT96n9r4oWASoqFxxUTMEyNwcTobN0iNo+L6nTqlTR
	EK7CCYnlHhq+ewca/GnOp0zHWVYGY6Jwnvwq4KoS/ThmpBLDBzHOfLpY1n3sxWbiHL5ZMLETkg9
	GztMjYtRKasVypIzDMHa8wco3saJ0J+4puLUa7iQRFHjKR/EDlmPRDbF8oVoc0B0+
X-Gm-Gg: AfdE7clSMuZar3IsG54wJSEonNRWfAhsbBNtD0Asdv+ZoRJ+hA9OOfRQAneA3ZZyw+y
	bkd9uQXgqcPb23+rrvs2KrwUxwyVkPPGg2bFSYAB26Q2nyBPHdnr4BT/va77oYuhLssobdZMzry
	s0hNHwpQT6Rs6qMNSkrnuzfSqA772pHuiIy8X2q5mrw5U9J0YH7tUvL5eJlKPSycS/GFiD4bRIo
	i9siGez1zp2MM0U6kG+VJ99y9TW2n3WkU1Cn+0qojsyFt1W8mJA0pB2d0U3+s9ha+WNTycL/tBh
	VafuFVaqn2XtjNzG35oAprJ3Is9owRfMYd4xkgmz8chc1qPZ8+9g3dNybq7zCNeB/puWHwpOksC
	jc86HTnBdhjA6JYY=
X-Received: by 2002:a05:6a00:94c6:b0:848:6ef9:f5df with SMTP id d2e1a72fcca58-84c2954ed4dmr13883301b3a.64.1784544653352;
        Mon, 20 Jul 2026 03:50:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:94c6:b0:848:6ef9:f5df with SMTP id d2e1a72fcca58-84c2954ed4dmr13883269b3a.64.1784544652872;
        Mon, 20 Jul 2026 03:50:52 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:50:52 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:19:22 +0530
Subject: [PATCH v7 06/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP and
 MPSS on EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-shikra-dt-m1-v7-6-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
In-Reply-To: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=2699;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=B2Dpn2axDYIMHLk1wigFR9Q2p/KX8LBdfSSHhm53znE=;
 b=hSEXl+yjQSMLpcZtTvfp44qFT5sxqRAQoE/kRQ6Mic+5t0jaEs6S2o9ncqL5KgISLfsyCWLvf
 8b8h11VqAXgCnkekf6hCNQmjCwpVTvjAA+eHbTmNMz/24/S1zHi/VXO
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: F01L1yzSGGqxszJ_fgO17y6NF0BLXPAj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX2TLi/GcfwyVy
 +trz9GRNGf03W5H8ly8F0dMfmN1IIwtg1AetIOChxDaDDvV8FRmCPvlPIWYUEW1QUDMa7hCnsLS
 wAyKCjKkM3TlhylH19Z+88M+7XDo0DWyjygTvEq21iJhl29bsDTzFj94/7xgYsFWSAYyt2QmHqJ
 X1vnER7lGiNSbawPAR+1k/m4Hq/SO5BJnRxVcNkR2ZHlWZnjdhRXwQKvp+38X7cm+Z90L9bpyJO
 4S/yWARo16Q19wgEA8nigUKnVGrnvxKeDBUZM2I3BhWPhmjA2wW0wqbHJeeC5NNMLCYUWAfLh14
 7vcDeju6fkAf8TwV02QJx6deRhyxTTn3UFMz2K9XeUiFiydjDCNsaVPCJsogymSgio+9gsiIslv
 hWDGezrMP2G5f7GhUN59JS/GK+EzUjsJtL3K6R62Al+wLkQutqnT2V8rSdL5RjULCGmnM1OOmId
 9i/XuuQtWi60valUBnw==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5dfd8e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nu3v8zf0uA-Bo5sjUnsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: F01L1yzSGGqxszJ_fgO17y6NF0BLXPAj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX1yuzey+VoOTt
 VfhnW7E9I0Ct3WhnROFDbHh4YPc4JxnVekVZ7J7cBaP1vWS7yucxC5+pLesVxEZjPLaa4EuRAc1
 ETxMnq1yoYXsmmDKRjYig7mPSe76RNE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200120

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..b112b21b1d79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e62ba5aef71f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..727809430fd1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.34.1

