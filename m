Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E392359A68
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105104; cv=none; b=O2U1wj0SzgtbvpK1ugGtbXgC21nu7cUWHt7IuhKaiToPboESNm5GZhyxpbVIvxHLihLZKbs8CB/TmTfEoeYloGGJ5/onN3eX6M+zwEnT10gVikVZRTaXu6mijSe2rBWERteelBew6SdlMNqcvhoW/L9CJf6JUU4ScC2suRzkANg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105104; c=relaxed/simple;
	bh=9FZHk8D4zHs6knN/tvir728/vX0PR2DvuCRo3y6q31w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvY+/7Qaq9owG86exd2hlgOGQByfQPn08lF1J5SHwSOF/TJVq02N7epTYGgv4j08wV6+bbtC/n5LbnwW34vnwojjTkOQGQiM57IM78bgoQT1teAEhbMfHzzsUby74znpZg431K2Sm0EeI/peefagu8y/t71v6GZPBYBOSDC2vFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3nUAXpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKiHHsKa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3nUAXpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKiHHsKa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59F4J2427850
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=; b=B3nUAXpxydDkHzpj
	RpCvPkge1uhUj7xpIHU1B0XRIhW3oMEwZ6O4lE21BuGpeTjMejldgEjQiZPvqtgP
	zDasn0O3wV96sOiHamKhME0i2ypK+uv7Ga3smZmcVeLJch1SbeCfAV44pJIZ0e7S
	q10rzDvqRpdJ0ZJjphaHS1eA/V75cHIp4gUtzk/lOFq6aqRlIVYX8NromM3zRThY
	fXHHnN4L7wTJkzxU8MId0Iehe6WeQrBd8MfUcOJU2ofBZ0Qywlv9n7YAGGAGr06G
	Dr4HT4b1zb2Qt0C+Xeqt3gHS0Etsnicc110LFBc4jOXKakxye7QqP01AKiP5eCVR
	oW1fVA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhtscxd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c17bc96afso1053282eec.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 22:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105102; x=1782709902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=;
        b=VKiHHsKa/UnN7ZQd5S+W8NJqtNehClKGhbBHh55Hn1AEugIUDcLxL2bXQ5ZWtjVvkx
         8EIOpoDSGhVCmgIylzV6DdPPMSyoPYgPzWXf95DbsQDKqRpJPzJkODSDMIZqsAoH3WBR
         LQgZ1y2610u5NyQ0N9UT6sYvVnUCKxdpg+WTRcKVj/QRPPKf4n65Sl5WDo8j6kEq+4Fx
         Gc+3Mtd0tqP3F2XcFqgOx5TwvecwtHZd218n6h3rJ48bXk1kW6N8H1rRYNA5SgH+gQ3y
         x6w17UkZ1nDk1GSPUFLMT/ODPfKGtHrZiQ2BOeE7L1ObYArDNM7ApxPhqarrOyo3rS+U
         YE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105102; x=1782709902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=;
        b=GLUGzSDS8tbD46tKaGxt+F6Y3yHqJ5PK+xwYUmtqam3x1PtX4iTfzAVLWBptBBf56I
         GiGj0u/Fo034eGYjiI4CicHgkYQPzlr8TQ7tAKwUXqYgIvo8NWl5cVXmCaNbEr4PvOHV
         KtfvQdw/ffK8bqR2WU17xn0qX72pTotGnOT/k3yuMkVPwHVq/URSy+/aTSqizLQ1mnYh
         DhhVL48MfyD48NkSoJ6rJdtgPkCh820oQFxH72L+qeeIrb53+gUbPL+YQ6hLoEKePMlu
         lyymlKuXoG6nzbBeJ+xfN4/EHjazbBoMSOTLhB2M7pyQeKNzBrOixEB5+z1iuJaHfbK0
         kUeg==
X-Forwarded-Encrypted: i=1; AHgh+RrAIag+9ANfWSmeyL13dhCa1eqvZlxO7zgAB/UTfdxJhm6QlQ9PzVRNNn/LfI9S5EVLP7yFPNYgc9l6@vger.kernel.org
X-Gm-Message-State: AOJu0YyHPDdGEBs29VQupvgIUx4giScZgLhhHs4vUFHcamv6cA0sxWBN
	prGygtzie3Vo1njS0PCzg/XyKXKw7x19vMBALLHifV5axRO2xmmgF0GFW5liv9QSeBg8B+Ey8VB
	8fr7HUfUsYfHnz2hGakTyGBGDR3H1C1XOPl5IfOZGBsTs2VmxCKjJUzExLqNImsYkor9VlD0M
X-Gm-Gg: AfdE7ckGmBZtClhTjImeyWGnj37hu/nEXgCVMRDDmzrYGf63mILtooEVjQnIOUXnhQ5
	nhp+hnsu3WJI2uDXFXFV1BTWSfh173i1IM69s2wx+nq5lH1DuGUeTh+F6ioRUwXrWS3Zb5tB8sZ
	I6haUKPMADMlRMJ1SNSTjVA4v4dpSo2O6QmJbZwgHiSPch6LZAz0pXKa25hhqTJGE5E5et3o9GR
	sQsoLPgEo0G8SirvL5xtdOEuRiKE9zmW++aOQFinYGqONNpFpvpREeA0phMGVauKOV5Ozw0yMFB
	VA7Xl/PtEhJ0vOqh6+YCqLVjuZ0V5LM7QsOYX4kzuOct0LPdaNDfXcqlqthILCxyt//+xfxERvL
	/b9v0uVJDgctN96q0nC93tw4Pmz1Sb50xduCiMr5geCgL0ci1dp9+X9PoAg==
X-Received: by 2002:a05:7300:4312:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-30c0cd3d93cmr7984348eec.4.1782105101740;
        Sun, 21 Jun 2026 22:11:41 -0700 (PDT)
X-Received: by 2002:a05:7300:4312:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-30c0cd3d93cmr7984313eec.4.1782105100879;
        Sun, 21 Jun 2026 22:11:40 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:40 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:30 -0700
Subject: [PATCH v6 7/8] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=1791;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9FZHk8D4zHs6knN/tvir728/vX0PR2DvuCRo3y6q31w=;
 b=o8zhv90rMwkk5gvr1tqt+A1b/RfYAUkUASnkVqcALhDSLOzedDXOtf4lsXoasOHu251v7vjky
 9QGVIcTEt39ANOBxAprxOiFrwOdVShbXn0CnWXDO2x4I02M74r0htz9
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: QB4LIeIprWMLd7W9ZJFT0VVkB95uTLVV
X-Proofpoint-ORIG-GUID: QB4LIeIprWMLd7W9ZJFT0VVkB95uTLVV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX/ruc8UX1ry9x
 ZT4iaYo7zwzZbSDvrDNubiYAe6AS00bcqDFTju4gNaAHK1xPeZfX9KKhKmAkfzr1lK0FYIRahEw
 AmOVaATaAbJaGHeTykTLzP2SKtWndVyrM1zYTpMMM5HCHy+yLZOZiXbTKq64AvSyoFby/JZaHR3
 sZSkqL6uW3YTag8i+Cm/GFabsGuzbDvLVe+Tk/VoYr4I+RBpXgBys1IJNKDxn/2ZuZXvXdsAhLx
 PN+MX5oKH5etlAQU++Vmb4BGAshhPWJMPFbku6ODD8dG+Sr1ntsW2t/QS0hdO1nuIYisDnVyErM
 i2nQMt+lQ9z8Ds/13mUSroWXvr0jBXfBXqah/JqP/EMU/PqqYPluQkrCTcHu7PySvm7r+U2Ppmk
 8TMkoY62B9TXzGBHvzB//X7YNrHB7VI1DEAIOQ3NF4hGIl/wGL3lqSXFUFL5aZFd9pdy6zvaB0+
 2aR9tyumYfqEQb9SjZQ==
X-Authority-Analysis: v=2.4 cv=bcRbluPB c=1 sm=1 tr=0 ts=6a38c40e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXzBipnXibOisa
 ii2mdvcuoI4pnbn+9/9siigUJjbt26/F5RmAH1kZBEIROBMeAdRsm4npFJzgDgSqdAbTyvFoFm6
 W5lAuwduHx0dMUsZKdbmT3KZh/ulmTI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

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

