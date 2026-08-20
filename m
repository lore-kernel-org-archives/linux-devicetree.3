Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6E740F8EB
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220576; cv=none; b=Xfvhd0fJl7vQldscX4KjByYHMHDy34Pq83dM+2XHa0kW2A9ggb3zUt15n+KFocwRIUF4EQdQtKpJMmTqit+ULZAxjSSWPCxB8H6CBWcIj6mU+Qdc8l2vkW9K9x+YX6XgarD8meNFnXpw5umutgn3iWscjiF+eKKOI380tM23tDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220576; c=relaxed/simple;
	bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DyDTQWYhW6ZGDUXNCIuAy0n7m9kknI8W0DPoF1QkIkmIU2/+4ObT+TVTkDM5dTWY+15P4rqFrYsWoAB1ZdDwx+Orvu/r0NYVqVXpooxs9b9JEPeh55ILjPDWxcMXniL5xWrH+9bRlV4DtECSK8hdzerULswkiinC9D58uK8XI3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTYCS6ek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R5sUg6XX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTYCS6ek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R5sUg6XX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6edSX2161218
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=; b=hTYCS6ekRs2Wf3bL
	5LE/NBWyl2jXbwfPyq6zGRL1GLmco7Mt27qYhxLaV5U0GuSW9zDk33igxqyV1QDT
	FeKKDoAwQU/lUf0SirEU56hL+VvViP+VxM/oXXIv2idLM7rS63WQvC9UalpMVzwd
	iIuK7P0DF69/90Le1ew4wdcrRdw/m/ssqiZMKxVHDeG8mZmgYKGz3LHBDyIGBvEg
	8mCCKwp3vxHVRR5j37SOwYT+SCBRaM4Hvvp6HsCSG9aNJZARByt0dj3WsKSly/hn
	5wODmj0pVOBoMf2Eb6Ih2ndlNgHpYYLMtlpO3gXey9cONtTYhgALCQGkJdzqx8Oc
	1c+t6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rrxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so219067585a.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220560; x=1787825360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=R5sUg6XXtIOPs1lLkEcuPxNu8cl3Nw4RkkgFBmeapI7Dla6E8MpcSNFZv1QYBoUWI5
         QoteaDRKJgaXAzA0SWCrhBDzw27/XsVMBa9+wZGG2GBu+iX03M8crs6x00nwWnH2Wlow
         BCgC6oi0zOniT3ShZyMjvnzuGiEfcecjpF1uATJvOgK/tTah7/gOp1LD8bE92EE7CdJI
         6CMQ27w4STKsBnLQ8wFE4HY5ErKTGuE3+xnAQbCilKxJvdXs06cxsdhJubeP98zp/jz/
         YEDFVJGcBDFgRY+30kwxCooO514eHFU35EK03NwBAUVi/dTBhkKapjbZ5M+V42Z2jBKh
         H+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220560; x=1787825360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=EiDEz0LZIma9oRamCgNhiD8LW+DVbS4f+yK/hJ3kI1RWQ9ecJtTuaD5FzV4PYlRzns
         yjKRpzB+oDbaTca3OBG+VoK6dXnL/NhTDgvFbHGijgESpZw+ZjNcH+dWjHEpmZ+E/LDX
         gmEPUkrhZdx2AWRI693VAXSGSn6HOzhRH0NqFzKJSAIr7XKDHtWz5zSWhjyPNuOe+Sp9
         CYIsFj8m2hb/+Tkbd8lsdzC2Kuby1d2f9rEldD3YMmG5YS0JYs2rX2mk5tI3YsW1dZDK
         biPAkCbeNEV9KKUpSci8lVrW+Q+RegkjdRZUpGSR1c+yPE+q4FuT+8jNrrP1ywFN9TVN
         Dgkw==
X-Forwarded-Encrypted: i=1; AHgh+Roldk80q9sECCgaFgs/xx+FFqLTbjhbzWU6bGNInkgj66E4KLHbdk7FmpISDOM9yBOzC6wO//bN6zJs@vger.kernel.org
X-Gm-Message-State: AOJu0YxwzUcQ0VEshf5rPNI9IsZ3MK39lndMW6Hs5/FlzWBYLUeLbq8u
	WVaCo6SOVEssQO2yFTGx9ikryk+ukiSR7138wWSaJ5KL/rQHI7ercmBFWib89UoxNDFAtDTVs10
	rp6/zl3cqIO2XvKl7mtLsJjri0BIsw91Jw0IRwH4PudUpR3IWJhD+z8R9STfxU3W9
X-Gm-Gg: AR+sD13pwgZl9cXAkyBtk05NFiaTiQf8FQVdblLz84/mCkpMUSUUststTN1zOmNijeq
	W6XbArda1d7alqAfFY1ibtcQCGTLjGcHMcDvtVrTvRsID1gvXnCFuJ4sWkzgZROY3fatQUYxe+/
	WVeoAW2BTEKfMHk9y1CXbVTONwvnsHQpI8PjMEDPaGmh+HTtSlDtbdSJCkBRM1m5HtlssWQMHob
	mBtvRVkKxekO2/sdIUpTW3DoWgsZt4K6zJ5qk4MCtVyaA184JzCJ+VDJTZddc7e4GWdeRjMQ/6x
	CGo/RSuzuVK+xwXnau12pvYAlFyJzgLb0+jAM2DYt6qiC06hQeSrpt4aqM/m4O1l7v5CEtNdqRd
	xun9Z0qgS
X-Received: by 2002:a05:620a:268a:b0:933:9e3:b95d with SMTP id af79cd13be357-9371e678ffamr1103474985a.43.1787220560215;
        Thu, 20 Aug 2026 03:09:20 -0700 (PDT)
X-Received: by 2002:a05:620a:268a:b0:933:9e3:b95d with SMTP id af79cd13be357-9371e678ffamr1103467485a.43.1787220559658;
        Thu, 20 Aug 2026 03:09:19 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:18 +0300
Subject: [PATCH v2 15/16] arm64: dts: qcom: kaanapali: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-15-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIa/SIZ0NS+nHdM7xal6S4OevHHLPbpYNQML
 gS1ais01liJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSGgAKCRAbX0TJAJUV
 VkYyEAC0t8E39ZVmi4u+QxiT6JfygWGW6UPX8hbAAW+qVv2WMCakTbvE6mXOxuvNlVoILQH0NCM
 2fpFRaXOQQDCu+K7a82WEiyjn6yoObk//l6U5ausMqmNGvOwGIsg/d98FLKj/XuQnj5QqD/KGBo
 RjkFb+ghT6w4zrDVAJT93oUS3V4QDQvJX6HsyxXa65UJO1fcgUz6CNjtZOIZcnZPGLzfC6+svMU
 k7a7jOyKb8HxKf7bwvRdTnFE5LIaIWO5+Q5UStLSM9s1Yd1t0MUbEdn8/f2H2uMllh5L6InoKZQ
 kf7FKwE6ZfTPDXWhvIl73IME1p0F15/knrP4Qc9An8cR5emoE4Wx7wgULTQ2bNwDJfH2flrPtYM
 AQ8UspSeDo8M+QJApAQRBUyL7VAYdv5CArLZZ2D3KbUBid7MhM+0O386xgYWynfqI6GrShd6tXk
 VzN8ZajyM1kNA1ALClBpbEEB24Ch9vvkTfQVyNpGgGL8b0dGxPuT41jDXg3fYO6D2wQQ3/4HZ4a
 mvJlasekMMl2a+MZZymUfuqqo3IhgByz71f7xwqrkb+5j7GbjEHLLUKYaNS1kH/vNi3il7UinTW
 AwySIrsNpQcO1QGSAHClIMcRPGdChZBxNzMnhg26e3dudvvscZynU5YGKp0NVpnDcqfRj/PZdQq
 Z5ojos1UYdmIU7A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX4dd1fqkXkgY7
 HTjqNPdf9+gpPRdBXr703YIqQ9Dg5ZHyskx5j0sHTEmSuBvZ0MF3uMtUAKpReT0yIlnJQlqDvI3
 USyOKjZ1bMS/625imFo5c/tsDpuF4EjZMb9K7KIkY9/9sOWDLbHoc+2GQgJEmPVWHpmbkReNKdG
 E1NXe74kcemQJjg05IrzeFCuqHVD7Q7rwcKffXkNngjGBKopPFYIAUiaTYiK6o/u0nD5vnRcSse
 7yXaHLce73FmOatXo/+QN7soq8+rfgTaDUQGFl33sTdLZWMiVrq2D6u6VA3H0UJm1raJpSlS4IY
 gO7KAxbHiUz/kPBApqlTdayHN49wbgeYP5SSiHIakZ+mNxA4y6cuISxlagC+mdT/o9bPHI3Z1OS
 oRjvFh899HWZKSXixn5z5wRg4zyeewEeWnOKZoRXqiUTRKke4BVT/uoZkkCs1aHIl1ZOBhCFrMg
 odHISLFxy1AFur7lBpA==
X-Proofpoint-ORIG-GUID: Afl4tl-mGtfzE0Tu8AsqREr4ZC2pwbJS
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86d251 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3K_yQeBcBf-sZL04j2EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX2NxCCHRaN0ep
 xPu/zC5KSsM3vXPoo6KLeF4FwfWZaabAIAN6rS0wmPCiqy/rw6JY3qHzzSKQSi+Csco58/YRf5J
 WeDkME9ttfHLE5rYK14yL+tBJHydAf8=
X-Proofpoint-GUID: Afl4tl-mGtfzE0Tu8AsqREr4ZC2pwbJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..c1528cc8b7b3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -552,6 +552,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

