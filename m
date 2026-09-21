Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9679B368964
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971619; cv=none; b=gQ//P/5UQN92qzpw6cplq+5DmxuG44GDioM2dsSzGJl7jKiWPm4xIAfawFW1NzldXwPwVuXkYb08r69HI3fA8Mn9RBtMNvL1zQhFBDLwlquvu25wKwc/zfd8B9emCi87c+wMKm//mlVqayD85Bdz6n0PXFchHhJTQblsX4NjCeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971619; c=relaxed/simple;
	bh=yQBFMi0V1Q/34XT7l2xkr/OPRTO8ErCo82SZzAZN8PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ui0E6Cli3UrEvIuPrtZ+q6Ueu8/gZ6EPO24vvsO0uO3odwHP4mgc2iOtrPcZBCpZ5ozeuSEI1DOUMAKZ+2aLWdevbFsk2w4Pi4pObJc6I4F2YcYnDynLiFlQB4BSvGl/Meh/dbgqbXQM2tnD7tBDhUmSFNq8s5PsRH2/Zafuh4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFBULBpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxbVDTzA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFBULBpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxbVDTzA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z6LH3550344
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TMnVyIqj4oCOoXs32jIk9PhLPoRy53h9I9OmzdXVzE=; b=JFBULBpDRvWijOZu
	nK5Ju9lbxSXz/Oyo+REGLyqeKRSpKZYiCdg88TLy1wsg+wY6+FSeD/84976D7owH
	Yu8o54Vl2TtHtiAZ3h3DqrJCgEtZxb8951653I/TLSNFZirvz0IVXcO4yLVzDbEM
	iaphkMCFg4o9K4ROlFPaZH8XJzxGVf1y5/gdOVrZ9mf/N3E6D7quOf0IDfe19MCK
	6bvQbP3mzBCTq5jzhml/u67n5KOmZmm+9OdfjVrHA5z/Oa00UiVvFh/O4s8IOTeI
	Mo9W7dyyQeEesPcya5lSE18R3oPHBdPrCKnuZ+hh20UScrbVeBk/jIRsYVj6acmw
	vC6UQQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs84xg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so37421715ad.3
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 23:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971615; x=1790576415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TMnVyIqj4oCOoXs32jIk9PhLPoRy53h9I9OmzdXVzE=;
        b=TxbVDTzAXUU3N0vprDEv6wpbyRHmH45ma6SWMMpVAPg7FCIe9oyjcrm8TV88YdutLS
         O9OOUnE3VgB2wp2rv69i3eBjtyq1tt4iT77vBf3095G2YeiCEQApCka1rPeGFBFMrPdw
         n5BB4QcyxcF+lkv1+WO2tiUBgsDYz3uUoZeTwLgaiEFaa264KjGXRNedGmWWsyPF2Z0G
         TbOvz4M5cdk0+ywTE34Q2Q+kQgDtJmNXRzn0gOIZw1L8qFBKT9WsHw5DTEjT5tKzV0wE
         gw8nuvOqIi8BjCOOkZs+6R4KHGeOJCVZpQ7POk5RsrgjIDB13MNtqdcsHaFrKuUeKPKv
         sMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971615; x=1790576415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TMnVyIqj4oCOoXs32jIk9PhLPoRy53h9I9OmzdXVzE=;
        b=u7W3oPZCKb5KhG8/BSFRPt8HI9OPzune0EQqkTgvJBBP8Wu3885ytNBmOd+E7sYo1L
         X42XvTk7kU/+hCTz464t4GPo33ffHRG+mmx0H6jgv3XXEgGQVe5/k242iRR6f9waZXOB
         WwSUUxMFSjf/wpp+54Zj3Dp0DoNc7oy8KiY7njdmjskLHOglxBn2ozhkyZ0l1gTbww2W
         1fAKOCvYMxocxGbkfYhEIuXzrGAW2xoBnhYU6wOGgd4MnVdgBNzV4RsKuHKsqryCTMMV
         nX4O/xOhbhPGhm1lKnRrfhzNqY0Xa4RLahlDCvtOTIwwlf0gnucb92MtE0nWq0Yu4+PI
         n1kw==
X-Forwarded-Encrypted: i=1; AKwUvBxwlEjGt7pGk3glWClP/ZUKqTWQubwpWSmmU/nvJub1xvvuAHjF4DkZYxsyVhwfw9mRoGyB36f3ScnB@vger.kernel.org
X-Gm-Message-State: AFuF++lhZqEWT8Ufv8ByMgpiCcL5EtP3CknmNxII1XW8u7Ac+PjaHeTB
	vF/mIVDy+UZMRYTIFdeqvDkrsbj6qMnWb39J1VpgnkVM87GHoIQ++kE6/wcpWXZ6ZTXPxHdt9VC
	98XA8pYgTSbRJGT7Yrxkr1mXSkMWgwmclC5yKPAssUiBnVHxlwqizcmwiTZTcF/Zt
X-Gm-Gg: AYBFou1LjX7KZFFrjK9zKcOfT6fx2NoNEyv8IwyZcQWbfZOck5wFhlsFVvAhB7nzHCM
	YUMct6VzyZslHtPl9WdXZ8+7bkbt9Dv/S/ASQ43Bet3k0fJ2Y70q2G33ueidnyVtOj4V8jAiHZf
	lJ9TwKocc341Nti8MP8IzfWhW1ckoxZlyCnlbRUuJc/cso4n8NLH+23YD5ByAHPIX+Jbn9h2dFR
	Nm/EUTFCNruu9xU1gdu8ZHTT3jzKRa+pTUSrUi7DSXA0+52aGLWr4OlpoboNqWUZ8mqEgJhsd7I
	3+DRUY0aPrrS2JaL+VXTkFsBUx8GS3czejv4ybEIVbwnVQ4vcbWKu/Lo4kKhjfz23Lgj0V2Rcbx
	o1urFWVTbmsdRP7zzhXJcMIb8szn8BI1s8NuN0Qad829B9mxPxx1PTUUPWx4XHbR/GvBg4V1D54
	nUGXbqIdbE3GyNtnu/SD/T+7+Jb+RkuO5Lbw==
X-Received: by 2002:a17:903:19f0:b0:2dd:7593:8634 with SMTP id d9443c01a7336-2ddb1b0f7efmr138780425ad.13.1789971615496;
        Sun, 20 Sep 2026 23:20:15 -0700 (PDT)
X-Received: by 2002:a17:903:19f0:b0:2dd:7593:8634 with SMTP id d9443c01a7336-2ddb1b0f7efmr138780115ad.13.1789971615035;
        Sun, 20 Sep 2026 23:20:15 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:14 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:37 +0530
Subject: [PATCH 04/11] arm64: dts: qcom: ipq9574: Wire up USB3 PHY PIPE
 clock to GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-4-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: tFShDmenJeq_iHrMiF1NFSiJolVQQ6D4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX1uKvOA1/X+0H
 wKnzg0Ckz130ohtyRcxN/1AjcjtD3BGoSpNIO84BMh/FrsKt4B3rvHPYUrbgeUWIqys7UJ7PMvA
 tz1xf7qO75KeHLs6zNBaUCpw3IYBxik=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6ab0cca0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3OI4E87EZh46DsEagTIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX6Mhvgo2meWaz
 KE0XwiQpGMPQI7k87We7TRVEOLo6SgzcpExpW4cLPhJBg3RuzxpHI/TYPeu9MXggsdYKfygnx1y
 G2NObycVwRPWwPlawVrAxJotBZNrExondotN4axsgdkwn4REClYqqn8cuMSJAsb9CtJ40sBrfNe
 zl83DkobIspLmc+1pPmHht4NfA/PTGgctV6C3KNni/sUFCGIVRncAyZ30vvSibNAqd5fNGpq4Ww
 0/riBM0iTF32RD6Rs1EhWj9cXiVmO7UzH4uX1ye7mFh9GC7ugCL+UmmCV9r/Nyu1VuXGNkIxRGt
 +D+LwuqikVaEZI7TrLfhiAO2gobugHkOpMW/saMUsyrzOpG3xH6BugFydhUcz9V8qODM039T4qY
 I8xc9kNmoD9YIjkV2KUr9hjZSZ1hGxIgTVYvyRrmDuBkT52YjRFks+39Tw6cIaDHePIMLl6hYEQ
 Z74T+s1erQ09ZvplO2g==
X-Proofpoint-GUID: tFShDmenJeq_iHrMiF1NFSiJolVQQ6D4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
propagate to the USB controller.

Cc: stable@vger.kernel.org
Fixes: a98bfb31f676 ("arm64: dts: qcom: ipq9574: Add USB related nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 5a5bda5f21a1..dd1dcd955c95 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -428,7 +428,7 @@ gcc: clock-controller@1800000 {
 				 <&pcie1_phy>,
 				 <&pcie2_phy>,
 				 <&pcie3_phy>,
-				 <0>;
+				 <&usb_0_qmpphy>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#interconnect-cells = <1>;

-- 
2.34.1

