Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B6C429034
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380762; cv=none; b=fHnxboGH3Z6QW5Ssnutr1Kjad4Z/be1RgJVomkWfAyYcx1O1LeiZFCr1fMoleswagUFORAmU7DvY3ZTqRYOO1jkokUNtTphzcbAUiD5W+OgfVykqlfY9nVr3D7Ba6kSL4Qb8ihHV5H9hAAtqBpJ9c+6emBHAVGCd8LPJ1SBuyN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380762; c=relaxed/simple;
	bh=xMKmHqMcglrB3TIoMDCTsttljBJ4YRnwsHlG80WRnOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RAdWscTJkHGDG6K7iF7EQCt/7FXzJBVyvwP8Lg4wbJGwC0vLxqbKMs3/tilQ/nZBc5rTcy7DOxzbSWC37U+FIeG2IXmqNGVpPbvAVwW451TasLtkqgQnfT+VaBRdpBr+C4xFVL12Rue3aRDAZkNrRoNaoAN1eDWK0ybfxm7zYAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnFzaD1C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IamWcE7S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnFzaD1C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IamWcE7S"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9njoa184589
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vv4XagzbZdZ
	hSWJsSg+y0oxFZOrv+wkNDQPzcVNomso=; b=DnFzaD1CCSGYvCn1JIhbi2v2fuc
	+hwxu3uq1vzsfnmYE299KWK8S36Lb4H3cfTS2Wz9GW5AgUgLZ3HHfnRqDpgSUAN7
	He2/I10OznQPOZ2twJPoWl0yZFEuZoZVsaoaNPwRsHKYWYod66cgpSXra8Wug2Pd
	o8ghEZhdvzraH2o3bnGdurK5u46gPvgBulYjoQG3kDD+YJE5j2axXA3675ZdGTb9
	kUleZPQpE+7BylT6k95+USOBn5bDQqGAj51dttWd86vLEnYsgUsWnVHMoLTHASSb
	pTf6c79cZ0p341d4lG4aMkE4jLJE4hF7K9LwTHkgjHj5+rYmqgklsx/9Pig==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c63dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:12:40 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1ac969b92so3709630eaf.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380759; x=1789985559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vv4XagzbZdZhSWJsSg+y0oxFZOrv+wkNDQPzcVNomso=;
        b=IamWcE7S1f7FiIILEcWwX/OvH9CUk5bMTQ4aMUSjbBqd6GErDSdO5KYzj83G7lZHbv
         A7rzpLzunHUEoXdOhxgaAwPA4oXzlhBs4VqsznlUnGy1kDCin8QV/GhbK+clCB5I2GUw
         6WnKGSRVOMXnhaWZIlNQlyUSGZp0/Qt3WiV8QpKS0+0tA9IBbqJ7eAKUHjR/j1h+MM9a
         bibivVcNgcyX5jUCOUN3PQOcroatSkgtKTKlCrsBovq+ugR4lIkNmKwNPkdHKnxoSCBz
         sJJnj3mntN7ag08/DaozzzLxoipCN2ujgpYsD5MLWovfTEW8odAM19hCwlyS86cVCj+5
         4J0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380759; x=1789985559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vv4XagzbZdZhSWJsSg+y0oxFZOrv+wkNDQPzcVNomso=;
        b=IyRdntjBDuCtUi6tjF7yEhwQsom/b03GGfzq1BNMWhcVZ2SpTTV97KuFiQDbCbBtNT
         HIRqheL4JF2TLrO9Nh69O8NbmVumbZBkjVDh3OwA6Zn9HK5f3W2lpBL3McKStbz9I65S
         5446v0Ddv1WFu/8oVom/d+zZdUP2iykqTf6bvmY7MAijWY/lSc9SjYS9qXceDeF6bAk8
         49SSMRH062a/fcMfgZFw5bVSReF3XRWgI+YxFuunWAQ/8MzVs78GOwj0THrZcTH+Skme
         arimM5OeDI6dQqu1iE7ZSUQoN4sOc2BZ1YOFOLS7bpNNaNjMlAwdoXAQ/GtgjkDCZKW6
         ce7g==
X-Forwarded-Encrypted: i=1; AKwUvBwrI49RFLgXVo37kZih2i8IBq6jq7clXlSF6jffEXPl0sFGkP5l90C6O8NQri813mrHMO+VL/7j+OyD@vger.kernel.org
X-Gm-Message-State: AFuF++lhzIkhHg7lPPKMO/qyW+KOGSR6e4+y5Sv7vuOyud100uOaddGG
	YVpAjSkTBNL95SHZ+B/8A0aua2NvNPoH4PBsKHbZ5vS4DOPd94Er2EbwAKiA5olinLrxN0/PnCB
	2TdNrfYzIrwRJ8LAudkXSAnUug7TUfh6bHsNmYKRZYfrfoK0OTkbo9JJQLaRcs11A
X-Gm-Gg: AYBFou2GvzsN2C32IcGrntx6rO4wcrTXfmgztm5bvSZIXgf2pWcLGdzl/xrB2gk1kyJ
	CnveqauEp7F7JHcC3jSFfolEcpS5kJo9/5Zujmls1Rz6hxz5+g0n6qKzhzmoN7rTJGppPUFTjCm
	tqOVHbqjegI7r9Ht3Sn1+FMGdrL/WPmoBLvlM1p3+EfbD4m7r0RTjzs495zwBAWlEsrqxXvAbyH
	I6bKfDQXc51nAk/rf94uynLf6NXLYWrvFaCy6sGjq6KG7bOgGui2eIQu+onrJ+m98W0KSoPkVGr
	27rPjJ+vkjCDwO4CMMiYiJQPQLrRvm12Evs7Ffp0cZmmYdAsxawLczWMf09T1vJRggeh8nd2Q7n
	620kI1uBtxTvDAgoLHkvaZ5wBmWymijyzOcsZf86ROs0yqQ==
X-Received: by 2002:a05:6820:f00b:b0:6b1:445d:aaef with SMTP id 006d021491bc7-6c53f74ba04mr881775eaf.2.1789380759410;
        Mon, 14 Sep 2026 03:12:39 -0700 (PDT)
X-Received: by 2002:a05:6820:f00b:b0:6b1:445d:aaef with SMTP id 006d021491bc7-6c53f74ba04mr881758eaf.2.1789380759015;
        Mon, 14 Sep 2026 03:12:39 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm29020697eec.16.2026.09.14.03.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:12:38 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, xin.liu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        guodong.xu@oss.qualcomm.com
Subject: [PATCH v3 2/3] arm64: dts: qcom: hamoa-iot-evk: use on-board crystal for PS8830 retimers
Date: Mon, 14 Sep 2026 03:12:29 -0700
Message-ID: <20260914101233.981643-3-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9Aphfy30C2GJ2zN-KaOUJG-7uy1PiFei
X-Proofpoint-GUID: 9Aphfy30C2GJ2zN-KaOUJG-7uy1PiFei
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7c898 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=A6pafLX9Xm4MMD3TR8UA:9 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX8ATrO/iZqys/
 Kv18eQ8SCPis5hp4KCml1vpJ4SPYX+2Se4WYyCDhYF/2u4SWuasyBt/3w91bMkyEHQGcNv8Xec6
 yjiJufnam6ZF/RmwR/qSufE0Y3/Z7BI8f/qdUf8z7qcozX8QkDnjomNyHvTDG4Z5ywwZalu5yQX
 L6hquWwudUwoLuH0OZAoX0XdWqSFO6mssIjnZw2VeW3CxFmUFpMN6EpEnUDde2+K2MVKWRBYGKG
 pkh0Dl+zkXapbfv4raur22jAfJB6BdfJKKYhEh1I8cQ2aB5jCx2lccPhJRlef6Ah+/JkHABmQMw
 N59ysBjFS+PpZBJp92ELoh2HShc6aCHaEboFz8FxqmB8LNQmmrQ5Kw9t9DevUjZrlk/1UT4oWtB
 9cEhAd3ilFP2LTm+Yx+gbrBf9cdJsdT8BMgmhvb+yyujDasVS2mR+RerQ0Gl6GAi+9dIvfYpagp
 syQDF/JW2c44PTqQJeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXwFXl9hkbrnD3
 o/bcOX4MQcF/71i/PBT1LEOqCOBlukGGlXnZN9duzdH0Uc+KtDs9X+cvrsMTAhZ0ORd6IBOLvXc
 A466a5ZZJRp20vlLMEpeg+tmHFJNPto=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140145

On the Hamoa IoT EVK, each of the two existing PS8830 retimers has its
own 25 MHz crystal wired to the retimer's XI/XO pins. The reference
clock does not come from the PMIC, so the RPMH_RF_CLK4/5 references in
the retimer nodes are wrong: they keep those RF clocks enabled for
nothing and describe a connection that does not exist on the board.

Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
v3: New patch.
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 776bded3a312..57c8ae2e7d4c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -35,6 +35,18 @@ mcp2518fd_osc: clock-40000000 {
 			clock-frequency = <40000000>;
 			#clock-cells = <0>;
 		};
+
+		clk_rtmr1_xo: clock-rtmr1-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+
+		clk_rtmr2_xo: clock-rtmr2-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
 	};
 
 	wcd938x: audio-codec {
@@ -699,7 +711,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x08>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK5>;
+		clocks = <&clk_rtmr2_xo>;
 
 		vdd-supply = <&vreg_rtmr2_1p15>;
 		vdd33-supply = <&vreg_rtmr2_3p3>;
@@ -814,7 +826,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x8>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK4>;
+		clocks = <&clk_rtmr1_xo>;
 
 		vdd-supply = <&vreg_rtmr1_1p15>;
 		vdd33-supply = <&vreg_rtmr1_3p3>;
-- 
2.43.0

