Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D661CD1E4
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774581650; cv=none; b=gT9t+Gg1YbMFSrCvRteQ50sN0mze9rvEiPRL3+Jiz97dg59aNY5vXNgKS3J1yjAb2ms9IiiOXQR3CJvebFpxPdc1X74XZty1NQcOiTNSBQP1xLEGyn5ula6kyWpI+lQZFcQUqrNRJ2xTbFZ7PZlykXtJFTD3uBY/vuPuLrJfqCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774581650; c=relaxed/simple;
	bh=OjJnMS4bKp1KFIgbbWANuCkzgNHaE+QzZ2HuSliU8Rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CR7C7FcvTLdUAQPXM/8WnLyp0/qTYsJz0ILmWqDDDpNiU9Uo4VBJBw/P4qwyLuUcst/gTOJNJcNS795axz6aOqLXY8F+jL1oolPjOSEWdIaIjWwDtGawp6y5ZgSPCBv9j+yeYPJxUO5QcXaQ50xkoNrJkPbakdQsIcDiGZOQr0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/SDd3Js; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8WrkcpB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/SDd3Js";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8WrkcpB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QMCouE2583850
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3Yl8WaU4/FMJSPNlXJQyMAwOK04CQipc1xWtL05tKU=; b=k/SDd3Jsl4YsPPdK
	ZHhbaSTD0kqlsio0abidNGgsy1EV47orpxIQV9b8AX2fBmIPdIxmBoJWZXmwTkPk
	yIQXs3UCcUL15ApDbQ8dzeh4/XV7X6AnvduhJ6CwG4jze860mq5So5b0cTyc4p2+
	mWtpDyqRtlLhw0rCUajmGYMIn3t7hKb+ZhK019iVNX48q5Nio6k22ECbtvuOCNQw
	lINNSMP2duep1xpVrR3socqvj9Zs6K3awlTx3PDGIy7qPkJSOhouIsDk9p/TPkwt
	MuWlKYWLKjROv2FvQXrC8xJJsoBKkX9gL8/YMjyY+HdSXgW0P8AFshJIDmMrM1mS
	lYQ6zA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6grsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:20:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso1733926eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 20:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774581647; x=1775186447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3Yl8WaU4/FMJSPNlXJQyMAwOK04CQipc1xWtL05tKU=;
        b=d8WrkcpBgCv2dLymTqlP8Dn2CfFIrOd+9dh1EzMKfSujgkZsHyuZJKulMiDFIDxoU6
         l+apGJeVKWktozAHdA+biKC5y1xx92f22DfJ9qtz4R0EYyhk1d9blWE0+yPsHMv5QUlu
         RIjOTaXa7uy5geivWWwEv6f5lWLpswP+saW5Cfx6dMvYq73vRblIDeFxkULtmTFhyZ5W
         /jkIU0AOSm9qqOVDjos6LFjBOhoWaYTibSZNxGo7m3HaiJNsCUYl5e5cUfhWxSkvogAF
         V4gDOqYYqPuKKvCv3SUmNqhzM8fLW5qn3sWseE2VtnaxEc9hoUTb2Ticw59tMV7VUjJw
         pTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774581647; x=1775186447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R3Yl8WaU4/FMJSPNlXJQyMAwOK04CQipc1xWtL05tKU=;
        b=iWoyMw5bwi36q+W7ZYlPMu4XZMcUhM7rfjuGmpykgGaTSaRfVGbJouP7wd1FH2gaZ7
         AyiylvljXm1MW1bcVexgUTL2LjGNwqLEVJRVzvCgcEwLQxMO5m9TOcIZF/saIuIK6Z8L
         GEjAERRFI4syHrmzzZ+uvLmraGaDT8L0ekec80FIfhcPRqdCMfjO6xwr4Bru901Sa7L5
         b5uWCHVu+ReJJvpc2zpBCKt/B6AQzD0iwRqivPrzrzva7xTR8EHR9HSWgsdzFc+hFyZz
         lNe+TVty747S3GieiBYSUS++NOQIRgHVTrobdVHcenNuIuB4nDLmBDPuXS19fOMyIP8y
         3JgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+Or3PNx2e3ByQlxLjpETh6kF/vRqFpgnd0wCSqX3NzUjsqNx/ZHkjuEMxmoh0MhjdDOcdLTOHe/PA@vger.kernel.org
X-Gm-Message-State: AOJu0YyqI1cZ8/75rMRgJp6j2QIv65egk+jXQZTMWA+qhr8RrEE9lqY2
	fQebDLA5xccZtFjd0V32CzT/Hzxm8ODiSEK2R3B+Iz6rosQgKF5br3fdYmPtItrPLsIHp4XgxoI
	jWx785cc3M10SVy12j/hrOe4Ig3FmF4RhyUTqnIZGEv4KJh+LFzrSobJ9S7T3n2mJ
X-Gm-Gg: ATEYQzwxnb9ba8IGibBq97Xcf4HUZRCOYwt0DqhDeowjs8JcXUiMoxLPsP9KUGRsh6H
	2wbJcIJKILWahdykBoCHtvqU/5VunxgIevE2dVxUSb0BVMxgknr3hOQZEk2wu/v2DFHykUKUd5B
	2FZYLuZPtDisBH5xB0hkJxm30nL8rDiLcDr/yspsyLwadtwQOTQuB1Sh7B4TCXYPBgAa3bDvMIZ
	tFMHoP9YQnIDjrHhN6/tbnYni1Y0HyTyNrv+vTvq0Rb8L1Z02kXZLP2Dz5UuiLsyy9Jz9NP6K0T
	h0uyzGzhHpUin/XB2w4Zpw7BGRpVGextutE9pL4SgR2m8GCZIwXc8uQKaSmP3CverZNSvv+Z4Sz
	3tHNivu5GKMb5RdEIL4V/fUp01/2f4UtTJApBicrjazWM7yZIXc3BIpD0FhxDY8kucY5qBH07
X-Received: by 2002:a05:7300:a584:b0:2be:833c:149d with SMTP id 5a478bee46e88-2c185ef43abmr553396eec.28.1774581647364;
        Thu, 26 Mar 2026 20:20:47 -0700 (PDT)
X-Received: by 2002:a05:7300:a584:b0:2be:833c:149d with SMTP id 5a478bee46e88-2c185ef43abmr553384eec.28.1774581646850;
        Thu, 26 Mar 2026 20:20:46 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edde435sm4361337eec.25.2026.03.26.20.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 20:20:46 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 20:20:29 -0700
Subject: [PATCH 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-knp-soccp-dt-v1-2-a60c2ae36e9b@oss.qualcomm.com>
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
In-Reply-To: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774581644; l=730;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=OjJnMS4bKp1KFIgbbWANuCkzgNHaE+QzZ2HuSliU8Rc=;
 b=W7s0JCIsk/Lpq2wGPDA+4G6PSb4kIW20/yHLPHCJhFZ7lyF7Xy3kocymi0IRQqyxYPPVpqNue
 9DeFuI4gphJCKPkb/7ONmTWheQjDZf2N/Nn0lEV/Gg04IqYe4lDB9OW
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c5f790 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GxBrWPNX935TnGObzP8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: NfiLRbl1WHvJgTvZOk5Z4HXnWH-UvxSr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAyNCBTYWx0ZWRfX+0HYhtBqYdUc
 8uj6X6ScfCkKn0yAvCJimFUPa784Pklkwc9Of+Lz7VxUmM7yH8/oZuj3rJvBjWcoCi6exQMlvEp
 BggDqGEqcsCeJi2mlB3tJgDU0454F1IXysCWd9heDWo3nvQ+pv7GSbRR28lVY8vX0cUqDMSpYTe
 fBrawTa+2vgEC3jKnZNhkAl2OIXSnbMx0BOKihXJuhUfW/tkQyTbalQbP5q9iGiiBPBSW2x3NLj
 cJvKbI2bGjwEaUIFv3uxitDwKxCjuPd9C4+PqeNGY+qeZWz6GEuLHHwpndPnyFQsY12mzFlYjSI
 HGmx5kCCCd6m08ZwUHfXkOqlFhsAZ7yORTMt0lIHhhRSin6O9yV6fi2y0tnCjPnD2Cs3hJRfNTY
 r11LzmKqJclpA62ajU0IPSODCX8FlASrwyjP70wAAx0mNKvW4GV6KKWP4N8FCuGLzAuGCDWMQHN
 1+ho1yMpWBKzgeUqlqA==
X-Proofpoint-ORIG-GUID: NfiLRbl1WHvJgTvZOk5Z4HXnWH-UvxSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270024

Add SoCCP node on Kaanapali QRD board.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index da0e8f9091c3..6a7eb7f4050a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -781,6 +781,11 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/kaanapali/soccp.mbn",
+			"qcom/kaanapali/soccp_dtb.mbn";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <36 4>, /* NFC eSE SPI */
 			       <74 1>, /* eSE */

-- 
2.25.1

