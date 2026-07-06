Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141BD30C17C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321445; cv=none; b=tc7mG5+AR9nQjxwRJyFmEpuyH11wQWrzHSw9mkEePeFnF15Kuo1vZ+HhkNONXlpGWD+J/KljFinc5zw2RmyPWiko8Maighib31u9GXDO2gd5MMibhEL/TVKTtrCldQsz2RRVVRPOEGELi/mM5xKvsSqOnhE5E8jZpYjd4FzTl+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321445; c=relaxed/simple;
	bh=iE0p3m86EJTrb6GqrKDa8eaAPKZ7vdR2SC5L5azGsC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDECj+OrnG/LpNf8tdBogU/3mLCL0ehKYxXRjpp6M43kvHlbq22Cv9UM7HgCqhQL9h1jUmgbIdax9w+1PFPXrcULqU2rstY2m/zx5Q+GrOjAFPwVj8ol2Xq/EqYLGEV0dVNjoAIjR5PQ/kss27gbCShxc3D5ak9+wARku4ZxBgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RP9GVnXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdiyK0sa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RP9GVnXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdiyK0sa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641RS03459034
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TmrNZ68RhmJrfmHBy4Qdh4iOieMjnDMu7QiHUaw4LEM=; b=RP9GVnXu+PNB/dg8
	RhsbgXwi277JqF+XAVYmWc3SbJ3G1FWiyG+doRa2QzloQAV5bHPbpQUuc2dJG7VI
	ULjRNrLJsvtBUesBOlrzyhL/fKiDviQ7TaEXPL2c0H0xcVvLwCGd8F5m2S9zSob3
	Zw12R29U0tsKfQ2PymLgAnAkpU8v3zT6t0yooJi8qK/PxZ1Q61dZgRwlFkPU3Z4w
	XQB+e4z2twSQskHOShxvW8uk7CFZqXJV5nBGPprjUiK0nTFPRMPUsKfIRUYMMapM
	qTSaJ6qkSrOwkZZb8yN4asFofOw17Jh9/Egox9XfnLHFgUxFA6SLBcVnUd77eCY2
	9YZIUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf84sup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:03:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91931144870so212535785a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321428; x=1783926228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmrNZ68RhmJrfmHBy4Qdh4iOieMjnDMu7QiHUaw4LEM=;
        b=NdiyK0saacKE5ySaVoj7Jm4npM4tYbYhcXt+pkPnxWqe0hSAJLSXSS3zUza6rITlkC
         /hDir2n74loQ1m6JKQt3Cc6vDFIsUeBlUn9jywN6HZSv0hZy0JobAd8oOzxCq3nXZhiA
         xJ9U5Xs7nVPKG5KG1QLCSq0xJmYqQT3rC4uBmZl2soYdGAWADE8r2lC822pZ4SBlMIvQ
         +WuZgT2BgC7WEPwE0O2UNkSRe/kAuPHUtMri/JHvK+z3YAt63XkNBUUrVKSrvTSGSBHp
         bZkQkJ+UP8D8peTErwCaIjKCVRmCOaQa6j1Bvzb5T5aLaym9zUc0yT+/rX7przf+kKUA
         C5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321428; x=1783926228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TmrNZ68RhmJrfmHBy4Qdh4iOieMjnDMu7QiHUaw4LEM=;
        b=bH9Dnt8oOKxr0426kWzbbiJeowEVWC70kLxr50ywuMo96c34kugDc60CwdmxyXdh+1
         xsswcYjWKRlPCSwHQmWXPRujCdmo2ZM0aHlZ0f9aOG3h6GT8nHOhavUHchFED/549j4h
         gNBFkHtj+UnyPaf7XJMqMkq8Pf3WHmaTBp9sbDXFMgLeJjoIB94k16qBU/i1ujd6Zfre
         EAHXlEho8thWHr7mIeyiKbx0ewsxQcrdDOGzVYA086+J2Ygt9I+9ApzwfwruVubipJO8
         jpCn2tYn2w/cac998Icrf/ZG4x/htdOAboJII03F+cZkD050mzqH5xr7EOuD8GHVicF8
         v4rw==
X-Forwarded-Encrypted: i=1; AHgh+RrwhpVLdxPk6cILo/3rDZ2WSOjoyS4Xm/nM326bjGBNNqrcLlVTBi8JYnpiQFYKHrrEiuSmd3EuiVCB@vger.kernel.org
X-Gm-Message-State: AOJu0YwCTr1U2322zSDKhY094qTEmr5OgOdNcj5ERGiD0MMetfV6C130
	ZdIDTuDy1rvrv1O8ZxS1rdN81Es+84uxRC2+1tn+gLW8JybYYGWl5lnyUzz10YOxxmRcFthr8W3
	qya6UilXvHeyZx7AzIYqqztzkRe+dimz6qPz+7WDM41YTJ+N2pEg6z27KPAs9DQ+G
X-Gm-Gg: AfdE7cmbZ0Ql0RiOMT7Eecm9VcK0vxWNVW+RqIV4cayzAGljvWgkdVI4baV5PxL+qiy
	yuCYxrWLdreHPLsCQ+vMcrtRudvtISg/sM49NIJUGcm2yJ7+W0QC8HqFi19HLKxf2Y9HoER3egO
	4V4rGju/gtbI/+A+4g7fizuqHKCjQxvQsn5e2e2sjE/1bbHqeZZTOipA1gp3wMZLsUTQj1O4FMm
	/Vr9zvJjQOTR79I8U7WOm4klciDeLor063M99DqdaoxhYN1xSEX3qHeIP6OZbNlnaozovSjzJPw
	axRvK2DUy9WpVUUSOc0e2563aCiMlEMZHPpPDlnHichntEk11ehmlrqFWydWdWWBHBeCd02dlbA
	A6vXVG53y+ear+Ue8RuXyfESVX7/OIf+oy1U=
X-Received: by 2002:a05:620a:28c7:b0:92e:8405:7ad2 with SMTP id af79cd13be357-92e9a4a75aamr1221840985a.41.1783321427679;
        Mon, 06 Jul 2026 00:03:47 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:92e:8405:7ad2 with SMTP id af79cd13be357-92e9a4a75aamr1221839485a.41.1783321427200;
        Mon, 06 Jul 2026 00:03:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm397143455e9.15.2026.07.06.00.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:03:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 09:03:29 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: Correct whitespace around '='
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v1-4-16ce82a2bcfd@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iE0p3m86EJTrb6GqrKDa8eaAPKZ7vdR2SC5L5azGsC8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS1NH6YOkWCR3P1g2Vg/baHUyq+J1VYay+WgOO
 kMKgyY/pNiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaktTRwAKCRDBN2bmhouD
 10JQD/wOjavtSohtI1UzqbpCj5oY84nIajAbGZggDJPclCXKgtd8aQbICAv6Nd5wR1eEfeTXK26
 /9ADke8X0bWKhMYgvxy6Y4PxwNGNRivEEdnkyPfuNUT7nNBEILSwhB9HWd8HsrR9yx2WSQlo+JW
 VbYUOW3DY4lQLgLL3HKX9leLcPeAJJLcRBPtBZLHg87E+51GnIJmFA3L28FEplUHQ8uwMzOF1nb
 daHovVv3badE6IiMXx6DMU+JKG0ZQJ497nT6dCqHtKfrEPgyjyYPww4ahQwAnc9b/1bYy5XKX5/
 NUHaTc4Vxh/B8czStZMkR1iu8diTJlEhbvHRWWhkJAzLkGZxP+NP3wN9aGRnT2vgXcoieEWWF31
 DjOAM0JM3ohrj2AkeUW0JoTGj9sUCCODzZjVyXutJIeSSdgALqJrFLe38SLjtyhQ73MLfjG83Sy
 jb6ZHRhQMsgDSEPQxar003vp4xkHHbHrATESxeZJsk5ts3Tsf4THZ1nCcVWPomim6nv2BVWSgB1
 bKqDKGlHuiGClU3WlS9iEoufQzmZGCTdVV8C/zUTYciS4JGiT9ltVYDfDnx1TT4zKqTP73ntGTy
 97NlfDMS5gWKYTz8WA+AzHnjRBH+sFjjloGrbTp2wvZrdblUwtx63Rll94VuD2ABwcU1A5hJuET
 6bxNkG/sMq4bM0Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: VLnehFe4-GveAJHSEyK3jRMQYVf9Or6H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX1yRGAwlbuAhP
 TaJ1Yw5EnpBbsKXAJ5b+7JYvci7JwiWTrMDeWWjA41dpLP/62gD/Fu/1+RGn+ewrT6Y0wfK1HeS
 UfAuyOVOBKbThHa5spGyxUtJ4qhkQBs=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4b5354 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uWOkq5aS2IRcaOVXy10A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: VLnehFe4-GveAJHSEyK3jRMQYVf9Or6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX/edWGcdq9SNM
 LKzDBzbH+2m5IH7fJomkixzVNPtHQJKo+IZGH+B6Pa+jzZikGXcgYUt7tQvx6b7YVEbyJNRcehu
 NiRzV9xZ412Sn9xQ/J5PR4gDUPG1Pehkc1HZdB7pk0arWaSbjrh+94FvnEyg5RPBoTtedlYIdHT
 UKn7SaFFx9I3jr1q4hnUR51sE63KG4sTma5ALgV/iCLbgVQfC5294Gv/MnFD/Jc735n0UV8cYRy
 EkTX94ag0zJJ1KGw4cpZnjOWHVGVqPixI7dl18dV3IQWNI1ejDPRPa6+PQAyskm20Y9AFLcaAbT
 R7ST4Bxrlk4i6STcDSrotDhRtz/kOqX149vwkAienlcgOBz4Wri7PBbmRmmJbViKXFhRZiX/b3J
 R5B6b2yuONkkAzm/Be0rMQHQ6Obi2cbnZQ6fkUo0xxVVil2kkE47QgVGXmolL3di4EChvayKFuI
 OFzoGoMM7ovjAqxyClQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069

Coding convention asks that equal character '=' in property assignment
is preceded and followed by a space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 20 ++++++++++----------
 arch/arm64/boot/dts/qcom/sm8750.dtsi             |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index ebdca0e2d2f3..0c90c886b2c3 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -449,16 +449,16 @@ vreg_l2c: ldo2 {
 	regulators-2 {
 		compatible = "qcom,pmr735b-rpmh-regulators";
 
-		vdd-l1-l2-supply= <&vreg_s3b>;
-		vdd-l3-supply= <&vreg_s3b>;
-		vdd-l4-supply= <&vreg_s1b>;
-		vdd-l5-supply= <&vreg_s2b>;
-		vdd-l6-supply= <&vreg_s2b>;
-		vdd-l7-l8-supply= <&vreg_s2b>;
-		vdd-l9-supply= <&vreg_s3b>;
-		vdd-l10-supply= <&vreg_s1b>;
-		vdd-l11-supply= <&vreg_s3b>;
-		vdd-l12-supply= <&vreg_s3b>;
+		vdd-l1-l2-supply = <&vreg_s3b>;
+		vdd-l3-supply = <&vreg_s3b>;
+		vdd-l4-supply = <&vreg_s1b>;
+		vdd-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-l8-supply = <&vreg_s2b>;
+		vdd-l9-supply = <&vreg_s3b>;
+		vdd-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s3b>;
+		vdd-l12-supply = <&vreg_s3b>;
 
 		qcom,pmic-id = "f";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 71a70d051283..d5f3ffff0600 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4938,7 +4938,7 @@ port@4 {
 					reg = <4>;
 
 					tpda_aoss_in4: endpoint {
-						remote-endpoint =<&tpdm_swao_out>;
+						remote-endpoint = <&tpdm_swao_out>;
 					};
 				};
 			};

-- 
2.53.0

