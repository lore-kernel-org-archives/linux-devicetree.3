Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AE33CCFAE
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896852; cv=none; b=OVEHPbEupw6JnUwGLpC/Q1EksTXhqQqhTMPxYj0QkXOdQLyQDfHKhv9DybhqfUKhDi2bd/8h33P1F1kZ9N9ivaDQp7upzLBRwF6v4WV+rLtxJOt4lTjmjbAJqjMBzQ4irCSyyJDnNADSpix98qcD7wR9iYAetiOtimRaWLYiFK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896852; c=relaxed/simple;
	bh=+zdu2cxP8YznBKROeajXYhCB3Wu23IRXkP3hcEUlxDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tR2GoMxc+OrXMRqOoFM6G0PiUdXVKRATrdRR1w8elyPW4Qd73ROiZWd01RFHOcZRlJ4e2ZLmKwmVKpkcHt9pvgdZ0dDvr2JBQQzlhv++PnRdYgkh8THdvNzDFm8I9r9MapdJB5nKfsVH4LrNjHlZFEZQtbGcm+mI0wh5I35OJT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGrB3WDT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1IHsjGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGrB3WDT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1IHsjGA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3K0cn1811921
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7bF8sP5tCcak9NvrWHtYdebgTLnc+ftwl110vSI7SE=; b=LGrB3WDTJUc972p4
	7H0bOLQDOMgL6tf3/tLKdKcE7WAi6LbU/hp4ul8XreZzespa3bbJHPiN9eA0MwEF
	xZWQAN8PG/LpDXl8SXMWB6zp94bku+7QfriiEvthqn52oYXDPlm1i5Q878Ojr+5e
	W74h6YYwpnEaw86R1YGbau/R6uNQD7KimbGAXj8Q4FBvb27xyfVQzWQuNgvu9H0O
	C/KExXnn8SIhAGm2qpLIpo731Vte1Kz0oQHOICtUXtbPvN7IazRV0gtCqsDkXPgw
	VYJUez/wfqT+m2UijHRk99gbJuWw9sxtYFxMTo58JnrDkSW7Pk7myvIw1AtU7YxQ
	NHlD5g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee3ckx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:00:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39640eebc57so1705609a91.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 23:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787896846; x=1788501646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7bF8sP5tCcak9NvrWHtYdebgTLnc+ftwl110vSI7SE=;
        b=V1IHsjGAZS18i5DYdcUm4OAAhJjxA1qntnPX6p8L65YKDwcnFais8rpNJm3bLan8CV
         YqcmrMkplcMR9lDEaY5bLVBY3hVojd4KsXnFYjOnMo/bXH4NQIyBOE50gPLMUoQuITMK
         OsdjUnBJBvf4HTkr3Nm8njGrkjlxqSeBSHxvcuszgVo/ez+fBkWkoEXZNreTw9AzL3qR
         viFY43nHLjv4KSwzNnVrBpl8rd4XU81CRgM9dMw8tasEjIVvZMCuttSqhoYypCK5Icpn
         ov3UYO3b2qL0qF3F5gDribsi8maMvr4MO8gq1P/deh+ueIMi8KZFx+sXfDDXfShhbcGL
         a+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896846; x=1788501646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7bF8sP5tCcak9NvrWHtYdebgTLnc+ftwl110vSI7SE=;
        b=Blga2qLVTc4rpec5Tv9QVbkS63UCXIP5rWgS+L6lZnETI7hYP6TkpfdWJMtxIXRfYT
         KIZu9VzAhcnvlKdtlOwtgnAjsLsCKJT9ey6VbHajylKKU/HYugJnB/PNKuGViMQ10rsr
         NFVt1IkTftJgSgl5ObJprcbwcLPnywrrHFt8gJ4HTL7sLKk9Sl3kMZA/sxtt+lH4T3/U
         JyeonSHFjnkgAkJ825I7wXEExgtTbsr4SU+aOEDdz9w6BdQ1zCq3UlSZwWHIQH700R9O
         t1RZQnF7BT+HQTxSByS4+d8ysoCcW0QkrpxgnMhC5ixFtPlTaMiVGh2fjihgyQShhimH
         NdlQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLDbgWYYpmHbnovsi+V71+LPHAwnVF0aTZIlMcqKa5sDh6+SAcdQhoRozu5Q7PdZQCqVoVCv2YbKKC@vger.kernel.org
X-Gm-Message-State: AFuF++nCT5QiuJiwMSb4KZxEc5Uf3j4hczPv7w3qZ3dzTzWGPf81Lwk/
	l55JF5wMGtGDqKrVd1znNCCJKbJK5ptqyEkqEgx/E9YYxd+r2/KHOkl5rub7u81rkexn6vw4JRo
	QHj+AOc8sT9f9k6w0pgpl76rYch3leDaNWNWJCS203cG2StNPQD/1yqyOtNkeizR4
X-Gm-Gg: AR+sD13fRf2hPwDVyVyMczBGhzC63sunnMe7nbzJil3wlvBkHHQqh/V3nMOb/3tb7pj
	+7UngpsBNwfDPKXHg6QTeh8Atxff5Imt5iocciSkITkwb62d1/P1oCYyxouCdZIveQqm2BOOxT2
	9Uj2WHRWW9/JQnZrroMX4NKdu3Sa5Yea84B87hEWlU6i3SmW1XKZ0rfRYQnw/O9XFSK2rPA8c9u
	j/hEchzMYOYrDU3g+KQtQ8Ko46pM/TUlzxd2LcnrWOT/SbBph7gbL84Xy7o56hjEbRq+1MSH4/U
	dDOeGnUyDtGmqQ/Hi66NH6Pr7Fq3GDxDOxdd33V+9t70UUel/p16LbUrw+UpmiN80ImNPkkKS6B
	aSNA+eSreRoFSlzxuwTOH8p4GhCzKF4pCOuMohMAmng27a9s=
X-Received: by 2002:a05:6a20:c784:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3d265330cdemr9406883637.1.1787896845667;
        Thu, 27 Aug 2026 23:00:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:c784:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3d265330cdemr9406693637.1.1787896845031;
        Thu, 27 Aug 2026 23:00:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm1759033eec.16.2026.08.27.23.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:00:44 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:00:36 -0700
Subject: [PATCH v4 4/4] arm64: dts: qcom: hamoa/purwa: Add QREF regulator
 supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-hamoa_tcsr_qref_0826-v4-4-663c9d30468d@oss.qualcomm.com>
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787896837; l=26299;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=+zdu2cxP8YznBKROeajXYhCB3Wu23IRXkP3hcEUlxDM=;
 b=kuVKs1k5HsU7FedLsM8n4IGvUI7PoL1yM/Am+xEXWzehChGg19ngwaxOXl1MlUMTPXAm6kIhE
 +TPEvpuMJwjCR1afG1EX2CFUCl5n+D2a69iZtjR/qOWwtYIgux9jk/F
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA0OSBTYWx0ZWRfX2Fa2FW/CZ0cy
 riE6QY1hJLOG7hTs4/cWdlSRe/VNlQqHlMuwddBnXYmGAbmEUvFjw2gBjRsM21rwq5RMvM4vSmh
 KtYxk1QVIjGe6hxcjtNxS6DLrA9mHYaKSViqR6MmySz3SMA+c3m6eEriBqzuQpibpxMNOcksoKK
 MjyVRKPc/3SkSAWgB+Ytq2qg4fOQ2pzLErWRJWJfVCipzo18c6MaYRkdZKmQZkBE33yyYPE7nza
 fg0Trog0s1GTOqC698D5NKwE+ct83C3G2Oj2rqoMvjhvQDuyohHoMH3X4+vs+hXJipChKBAtsEt
 IrPuWORP+7ZLJ2sn3TSVJfCBd3BL9EYRj4ozpKfQV6NiWfXK7lw1vssaUK12TNBJhKgi0aMnIAA
 CqQvfBlia5hIu12IXS078sFdh64euXxERhTslhVRA5uzvsK3uT78gU0LhXEvXuOM8u4epq5PSTm
 5qfFliH6WrWnDrFTAcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA0OSBTYWx0ZWRfX7uAwV4XcQ+06
 XEnDv1lNdCgy6ZMsfOCI/v30ByOc3fQCk+kf/Qpv1XL76JVchY+QJtLliSYHxATBDFS4v4cxJuu
 BTac7T/MArBcmOeFAWyUvTyvmtJcAlI=
X-Proofpoint-ORIG-GUID: 4ABcYQI_BKauAVPAoGiDxwO1HAfXnSwE
X-Proofpoint-GUID: 4ABcYQI_BKauAVPAoGiDxwO1HAfXnSwE
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a91240e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4vDcivUYQOVtOqHL04gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280049

Wire up the LDO supplies required by the QREF and refgen blocks on Purwa
and Hamoa boards. Purwa's QREF topology is same as Hamoa's, so it reuses
the same qcom,x1e80100-tcsr compatible and supply set rather than needing
a dedicated one.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi         | 21 +++++++++++++++++++++
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi         | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi  | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi                | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi         | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi    | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts        | 21 +++++++++++++++++++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi     | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts      | 21 +++++++++++++++++++++
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts    | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 21 +++++++++++++++++++++
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts     | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts           | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts  | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts     | 21 +++++++++++++++++++++
 19 files changed, 399 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index bc70fe5db96f..f139f3adb933 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -478,6 +478,27 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
 
diff --git a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
index 284825008389..75ce8b0c94d2 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
@@ -902,6 +902,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 488e98413c3a..4ef3a5407ce8 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -476,6 +476,27 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
 
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
index 0dc7c1b5a14a..6bf12d8f0431 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
@@ -1036,6 +1036,27 @@ &smb2360_1_eusb2_repeater {
 	vdd3-supply = <&vreg_l14b_3p0>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 59cbbfbce490..7b1486469730 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1272,6 +1272,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
 			       <90 1>;	/* Unknown, TZ Protected */
diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 60db83b8985f..ef9c8836c33a 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1528,6 +1528,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 4cda708455d8..2ebb42906c9b 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1301,6 +1301,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index dba8cee43e29..6b4b17acc069 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1284,6 +1284,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index ce7d958ca687..db4bffe486c0 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -1107,6 +1107,27 @@ right_spkr: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index be1a8ac8c699..21303340a530 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1193,6 +1193,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>; /* SPI (TPM) */
 
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 0bee2a3d6e7a..75ad74bcb042 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1382,6 +1382,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 2be5a37c00cc..ad62350ba670 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1069,6 +1069,27 @@ &smb2360_1_eusb2_repeater {
 	vdd3-supply = <&vreg_l14b_3p0>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
index b70c1e094bbf..603f6d7717f3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
@@ -1066,6 +1066,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>; /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 9eb2dfd99f20..2692e48537aa 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1347,6 +1347,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index e4a0b86847cd..039f68807376 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -1248,6 +1248,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 13d0f09e0c2a..9f45ad9305e8 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1322,6 +1322,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 78380fec8839..9d4fa442d158 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1177,6 +1177,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index c2f21fcb1b09..8891ad6188ed 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1325,6 +1325,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <72 2>; /* Secure EC I2C connection (?) */
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
index 0314b2246cdb..edcb6b99a384 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
@@ -968,6 +968,27 @@ right_spkr: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>; /* SPI (TPM) */

-- 
2.34.1

