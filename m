Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EA33998BF
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591700; cv=none; b=ht8rGNkzWfzZa1VmpaEhJ/RysoKls4EdrnK3QGdFmGma+Xz0KkS7BnBpTlg4ZDI9eYKgfDOsTjaZU2b+zCKIOpiyaNsUVWLn6DlQelz9L+l/dKTqKnhA/AtjZiANogt9avTHo9oXGODF9KzZ5ZucYUYmnFWcRGFrbrs1kGQk9/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591700; c=relaxed/simple;
	bh=wXEQdSaGgvvhyTZjCrPo1di1ubN2oQfPidI6Nv5ympY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ztu6EnMGN14ZdYOXVX00Wdd2iY5Y69S02nunQCSQ1fdQJK+XPNxpHa9D0RidCS3lD24uc/W62I1HDpVxlvlxng6EE/11Pd24aUHihbvtivVizrMxz7P2POw5tslwDZZQnx78qOQ082v/wSGfAUesvVKL0WrMdDc0v+FSaF3e1cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxuarqHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3IeANYN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxuarqHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3IeANYN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB2JJw2518581
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDUShvlFUbelpVH62uTctBCJSsxe3CkA10mFD4Q5XSE=; b=pxuarqHaLncNCyB8
	csJZQJr10cTRRjezO6EfKVdqXv1TvwnJ1M6o7CJd2jF4+5Que3FusbIkwkA+oZ7i
	M1p1Q/1pgAMH/vVaqVwEa/3EouDwR8uwfrvcpSP32Cudz9akVa1SADbdyXfWY30B
	fp5/7xKGVQPz6+yx7gf87QPEnz6WPqqA21mgmxU+2y/uFek6H1G7Veawc0klE3ie
	/CIFU2DAvhgERYqlLJ93bhxAK7JErNWbM9kzv+aHUv5f6EwiI8Ed9JsV/DMqlSzE
	rXmcLkxItmNmMK8EYWRWReSiOQEkyaREK4mLiZvp6hz7p38o2K5wC0ZNWrh9roud
	FZZQmQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1kehs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:14:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56aa6d6bb5bso5706645e0c.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591696; x=1779196496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDUShvlFUbelpVH62uTctBCJSsxe3CkA10mFD4Q5XSE=;
        b=M3IeANYNJS10tUSEwdtKhI8nQUuCUMGkAYccgEIJD1Yh1z5YRGAql+7XakSZSiiUds
         YF/vOyzB8WN+AOdmIHGQpUuVfOfLRPQ6FPXyACoHyavoMksyf3qqkr66fcIGvw6XxLPh
         rFws0JwubNpQcA9G6gohNDvZA0F/+T6HgAxSYe4J7t6q4TCiPUM2njRmy8kwaGgcU57s
         mWYZ4SqOXzi9XnW8gVrhNmQQfG6PbTC2gm/isnksAviFlph45yhIypuateBeWHinfsG2
         PCGSj1nyWFE2ZvALxR3t7mlQA58znpjP/mvF1CC7it06yOY8mO3O90LG8NPs43D4KgXt
         hCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591696; x=1779196496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kDUShvlFUbelpVH62uTctBCJSsxe3CkA10mFD4Q5XSE=;
        b=Q7hH0gt7lsN37q/NArrNCe+Wv+kfqMvR/HUVHvraTi6VXTz220fEtTzygNiw2vAcO4
         PhdmwlbvcTb+EX3ARzjs5eP1LguKv+TXsSaGDh4GgVWEvAyqtiUvw8Yjq85H5RvFDSbm
         Jo6qsE2zYzRR73oJWzhkBxp2bvfU9lKWkS0U47nc2vTjlpSwjhL8UvHMrnccjFsLkIP2
         CmbtCST5XqFyb0FinEN8/6QK7gxQQkM5eu74YznmBUzUe6NCbBUL7Cs+s3LEvia8jOzK
         mwJFIb4uWR2ZHszU7E6h2FJuV9daJLLfR0cJEHjONSdh8nxjjufPd8vUtUATFhBfbbQ1
         J12Q==
X-Forwarded-Encrypted: i=1; AFNElJ9SmCXxw9uYIIG2kg5I1yuLdf4yCDzTPgBRopdRWAlZlz0RXvHTZYkjh/asUFMwCfBW/F0CqxSrZQ76@vger.kernel.org
X-Gm-Message-State: AOJu0YztZ607DrAphmBxoR7QX6i4frUX8diltAiWmf4et7PDcmPL8bg6
	qTUC7edDCKFkueql707TWHG0mSZrT5nh41F6/paOIOi5r9anqUownIWfx0tldEpH29xlII41SLM
	i/ecu0DffgMcWboFc1sugcotWWZq4VQdSpTY3SzIIt9vdss5cvC2XVyFMkDswdIPQ
X-Gm-Gg: Acq92OGgTlTFaqgFQ+kIAkKVJ4DKzxdaCqDXpbJYeQ8Ojz0y6Mr1G/SAleEvRupIsLY
	MWg+ZyvQ+JlSELOfciAPZ08mlCzSYa1uO1LiprR98GeKNb+s2Gf6ZGO1tZMYe9KpEznnCEvbuhh
	X0O8Uzf8TN4LazPo995WktQ0Uow5VCF7+Pe8qqfc6XgVXNW+xPMCsqwIutXXdOqYFdplXM0RLPX
	ZyT6uEQl0Vnk8114g9mAj9u6wL/Dons6D6t1NTHIHOU6qBWXL79LZNHas+3GpfnlmqukguNHbKv
	1wJS8iQ5f7iYYih5gvSlsx+ZVYOjMUKoziF70tc13GoeqbPi6/FOxOL6xt1DhjwjsmDSg97iHDo
	lQhejcnX2mtlggq+SUTaxQ2GgpfHjfp8RH9RuWy0/2n+PvYrcxrUyA8IGMAm1dJ5gf/buLeYj3S
	+A80pnNbc1YTmf9Gv5Jb1qfNw4iQewCOez0g8=
X-Received: by 2002:a05:6102:2ad1:b0:631:487a:238f with SMTP id ada2fe7eead31-63613ca7c06mr1105043137.4.1778591696562;
        Tue, 12 May 2026 06:14:56 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad1:b0:631:487a:238f with SMTP id ada2fe7eead31-63613ca7c06mr1104996137.4.1778591696092;
        Tue, 12 May 2026 06:14:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f395d5sm35163281fa.10.2026.05.12.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:14:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:14:50 +0300
Subject: [PATCH v6 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-venus-fix-sm8250-v6-1-51856dbef83c@oss.qualcomm.com>
References: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
In-Reply-To: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2181;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wXEQdSaGgvvhyTZjCrPo1di1ubN2oQfPidI6Nv5ympY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyfM06MHkt0moDhI5mKTZW7jOm76u1NtvyfO5
 84Rk9+KImCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMnzAAKCRCLPIo+Aiko
 1YAsCACDBh7fPyk71x4p9J3O7KsF5Ma/aNnd8AazJcSXJuqQ2wrw+jfoBVedICMuvvHdqO/Alb7
 YGZmgsEwA2h8UNCsjEruM/GXZCv+mDwHSs5ceaRdMTaaKYrIi8qNj0pq+VIXTiExhpzc3NI++7y
 M8pqCaeue/6PVtwq689utB9Q/pI+68nACq1KKhZXm+sWtZbuZ//FrhAcgPybUzmk0zZ1rhxQF5X
 n/0dUz/WvOJZ0T23YTlnUcRGcLqnphKo/AvhnM7d/9COjTR+xUsfWvsL5DluNtVv8rjOrc93/9Y
 HX3cyLuTBVzqgpDbAOqNhM9s2i55fIFr6Rls5AahdkgXOO9I
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Tm4XvgpCrO_fxBq7xGwNP7PALOXfin4m
X-Proofpoint-ORIG-GUID: Tm4XvgpCrO_fxBq7xGwNP7PALOXfin4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX43pDJKWuAl0q
 FcC3uc4E39tfPhCZTrvb/qiEFH+u22XUjXXeyqvhbdf5XsD6joyAIi4dlhSqJFZYj7Reu0ouOTC
 ybGRTekYxxAixGjdYdemuQhA2gfdvYHA8G+D21NJRj8i1rxSZeq8F3Xe6oRHdwXmQX4UTJbogRj
 s+3NR6/XqacaT4JPSZARe50fyIuY9u7g+VYJc+3WfuAEdSDAdchMuO+ocl5oFFj70ss/L9qqIq+
 RONXvMDMNPuhK46ldwOO7YPPKUWRS4FkK4KFEuu/Cc0iz1+ZaMEN8C8Pelz/ZWTJGuARddYdM8m
 FLPkFE9E0I7ILqV+YBr4+Do4EULcrM9LCwNeFt+E8DcOB3cDYBAcGpENqDdljPSC/GUjshjH1fF
 GwPYuEsUG3Ajm3xduHLh1VwE7eHX+8+zXsY/BLWsAeLDf+ljNUG/zVSPGfPrEM37OKWPKG/WKBA
 5TXUjBiJhV802kjWnKw==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a0327d1 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rGr7YpdD5vYbGY1z0rMA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
MMCX voltage levels.

Add MMCX domain to the Iris device node.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..1fcbd400a3be 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4353,22 +4357,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3

