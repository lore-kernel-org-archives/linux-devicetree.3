Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6968F48CD68
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338669; cv=none; b=XpJm/us/orr9hKw2IS+OvgFMukj5ll9c/VBMnnBtCSVvW4L5Pxlpq+M15cMfmaPTfnSqaDBXZLT6NT8NikA/JAVESr41EsqJwQ5DUHzMDMexvQcf10o76EG2nAI9f6PHTB/Vwa2bfwz9rY/AJFYSWRim8iT6ZFbpWQ9uiLrch2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338669; c=relaxed/simple;
	bh=6y11BTORF5a5B8XEX+nCUcIHAu2HCGWP0l45g5yBfLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhGopwyR9dGsLX6i7HRQlnb+beY7lV5BTwX1nGdG0aHvqRwnI9wFksAuBVrK5L+vvU7AK98IeJ2l7IyFF1SWxg3vtu8ODlG3RBf/Z4El4PiLFQXGsIxDu5NRt+uZk06l6Oo055u0JpWQg0gOD9aoCf2Ny2PHAanxmoscxP97gI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8dvHU7U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kb0m9oOf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8dvHU7U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kb0m9oOf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2IxY2193079
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m6OdGfuZ95J5zSzuGomqbiR/H94kXzWZ589aWq8ar3o=; b=W8dvHU7U5gyQObnd
	Npk0Q2vBJXiXxWUUfpjBRhQP2pPN4hGS/9w65z8/x/y7bZuow0c0aUk24IYWDkAh
	8RcDrUxWKWhny5Vm5IyVUK6giK8T2pnHmx2yfMlSowjJVwarWn7NekqIh1yATrML
	CxKkLmU2cgFQxbdrUqrcdS03M5QPuVyxPrGI8taxv1iI8a6BPkjNHpa2FBMka8Rq
	NY80J7OI7YJh/Xcyz+IMeKS+eMWt5ss+qkfroa1PjobXdvDY7y2VnFmxs7aN4oj2
	s3RPElrr6qLo+sAEVKiVVDMjGDggUGLxn6rpuw979GTK0BSTE5Ax76q55hQfo/l0
	Bgb/2A==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkfm89q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:24:27 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81eb7dc4e28so39882787b3.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338667; x=1785943467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6OdGfuZ95J5zSzuGomqbiR/H94kXzWZ589aWq8ar3o=;
        b=kb0m9oOfBFSp7CFkGYwbl/4KPSm7dzhg2llO/75pTNmbc66kRkxqLzA2LH5KbaaLO+
         /kyHaLWToCFfLS7r+US0H0Jo+1dq8kpdHJFIsBGXs8QIC42tuiFSHhpmwAxW9tWJp1Gp
         MgWnY20Cu21c731EDYMe8y/fjdZnpGL/TEtspJSGUc6LnkBVI7dseWoepNeymN49xZQM
         LxKYwfSV+VAJ7kiJCInzRMYvSSudS1dTJsQWQS9cxiuc+2UqSNW34vn3/ky7BK27/TKs
         QZFZcqkT4EqWGzGjYb0VMPaT8Ddz7SBO3ElLeQLMqI8uw91E0+0whCI+glejgAdQfaPT
         mGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338667; x=1785943467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6OdGfuZ95J5zSzuGomqbiR/H94kXzWZ589aWq8ar3o=;
        b=F+75y66xIrP7guUWhNp4zU2DXQulRWGgsh68VAEP3c0X2pL72yGIc1qfR6xDnpq9PW
         HH+r1qYz7fBOpTz9DLLpbnbH4q3rs5aaTGOnUS+H9cKT2uK2x0GEl1VVliwUhHETkZ9R
         +SGRlzG7DrFL7/BFvLVbr+g/8WawzFdIMogNt45y3+9b0LusqBmqRe6Vv2rM/RnjpQQm
         AYT56AxpYo5+qFOrI1eixLUp07aSB7goLY6XS9rNtbWptBlb5bryc3dPxzjyb5kLk3VT
         ckBw+qJ4clRReoh9/3Fgcl4N7EoPzlMI44nWjqKBV7WYVeS94Awoz5W8cogpZRJsA/wj
         BLsw==
X-Forwarded-Encrypted: i=1; AHgh+Rp66xB9ez2Qh2XRXQmprVRNxVzlpsIoxUsRUaTwAdT1G+VIrdJb3LCKT9Oo4l5W0ZtG8FTHDnmlQnt/@vger.kernel.org
X-Gm-Message-State: AOJu0YxPB1QZxm7byex/XKECTj7/mrgbCeiaXrfvHxdNSIUAom35hBTo
	v7DrVZzMOq4A3S18r/Bhs+TP/fYwOA4qQgaHI/+JpPJrhBMhNMNWHq/TU8IFHmATL9Y+BvnW76g
	1F+RMm/3rSrAc47yxq7BXSsv4PmrkUwNTTB2D6qMWLmdJbvQ3LWViAnOvO28HHYr4
X-Gm-Gg: AR+sD10iC16z2/faCWmj8yQCealaeklrPmx87sOfGyswMCyDGw4XsG4VpkIxeMHbvlF
	QNZZOnBwj2qPdapmBtscWuaYRlnZeLTjWgh4wwDYmKkwq4DEntJrCyekL6ox+WnmK4vMxSKs3YB
	oxcWj0kDbY4s1GmoHbn3E046pm/spz6U6vPEmXvQaziu1V5gRcdJx4qrtRGbHmGiOWH33nOwZaw
	rs4ql7nRO0p2A14cQPjhWsKlfZOxArhdNL9Wj9cjpzX06azhemuYcS7WbERT7Dwk8tHPOlNX0zv
	YqYtwhhVl0Ij0njLzydyH2y7I8SSFncGmC3iOdN8gd9isPoYun+04WUDfykDCfL9RA3yswzKyYo
	6/b8yolh40TkkBBiNJnrNwoKvg6roTbVyWkl7t4COaDFW4rXd5aUioxTOX7IU3Tlpg1TjWg==
X-Received: by 2002:a53:900b:0:b0:660:877f:a5bb with SMTP id 956f58d0204a3-66905818347mr2417007d50.51.1785338666682;
        Wed, 29 Jul 2026 08:24:26 -0700 (PDT)
X-Received: by 2002:a53:900b:0:b0:660:877f:a5bb with SMTP id 956f58d0204a3-66905818347mr2416955d50.51.1785338665531;
        Wed, 29 Jul 2026 08:24:25 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-669125fbbecsm2050937d50.12.2026.07.29.08.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:24:25 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 20:54:05 +0530
Subject: [PATCH v6 2/2] arm64: dts: qcom: Enable USB controllers on Shikra
 platforms
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-shikra-usb-v6-dt-v6-2-72ffb4796a08@oss.qualcomm.com>
References: <20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com>
In-Reply-To: <20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785338652; l=3411;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=6y11BTORF5a5B8XEX+nCUcIHAu2HCGWP0l45g5yBfLI=;
 b=xth1vr8iqgdIQQyjNXI8mFjIFzAFZax4+QCwuFkm+6oM9Ty7sXV3DdbT5PZPK+DMWTeLOasUr
 TnkDTlBkmYfAsASUNDvX+SH0Pn5BfMrvZvN+SY2qLfjAgqDObrOY9Gm
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=D6p37PRj c=1 sm=1 tr=0 ts=6a6a1b2b cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FkkohYrtMfa57bRYlNMA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: IlPhZCxhVcXG7eSGN0GuibwtCFPipB65
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfXxFod0aKfySeQ
 HyWn801Ply/9eEcMYWmE0CeNr78/HQx0gUpCZPW874A2UtvV5RqV/KS6kBJVyXcg1E3wizzRbw/
 UMWuqweSMAPxPgObc3p5ww3hx5q32d4=
X-Proofpoint-ORIG-GUID: IlPhZCxhVcXG7eSGN0GuibwtCFPipB65
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX87+NgASo09tA
 Ucz34f9skblXOcD/8J9/6lAcMQ8/eQj6XDq6pZYK6g6BxHm9a/h9ULH0OF1pwlw9PGvsLmxbJEa
 Mdve+KIJpz5cXasvYdFD+LuzSzabI1v4oOCOUqUZQQOInz1YeStqsoGlDEOA4KKbE0wWxSyzXAO
 0nsfBSGS/DOzGTPhoOcRna3y91iG99zC7pvDieIL4AgQiNq1OrmrJA4G2SS4d41pg5mFiQs+v/c
 V2iVrTu/Pe5byoQQmX5m9FlXLsLyJe69tInzpO4om/KE0cm2nNgKZ6tCHHZrFY43Nx7K66AiZAy
 kNJxk7jlVujuBMuQM27afNm7GwONO/GV/ObduCDaB4VefHbevGVicI0DjFieXbEVeA5acnMrfGY
 U7+CqJVNuG6jj797pSlnl+AHlsYjiHGXVQg7SLvcidg0qR//iQIm6wyeGHnsLh73X8B3Ov9IrKS
 FFkiTy1sYIUf8RjQMAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290124

On Shikra CQS/CQM  platforms, usb-role-switch is handled by PM4125 on
primary Type-C port and Cypress PD controller CYPD6129 on second Type-C
port. On Shikra IQS platform, usb-role-switch is handled by Cypress PD
controller CYPD6129 on both Type-C ports.

Since those changes are not yet present, enabling both USB controllers
in device mode.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 23 +++++++++++++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..225f36005794 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -38,3 +38,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e4908d6516ab 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -38,3 +38,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f7642..8ad0819c9520 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -12,3 +12,15 @@ &qupv3_0 {
 &uart0 {
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..631827af0f2a 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -38,3 +38,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};

-- 
2.34.1

