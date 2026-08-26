Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E900C3C3F5F
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740101; cv=none; b=SGcmXi6IvNIn2diS7JFql5LTwUKc51CojRb+Y/Kfaj5IjgcV3DOzp6r6UJ8txcBiAyyaCytAsnAzcIqcy+1i2ByplqjmRL9a22X/fgpTf7vjQFlxi+aS4r9s0jrw5pdC28ml5R4Wxt5vg1N5ZBBsKWhoqvTDeV22HRbw8Jwzm04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740101; c=relaxed/simple;
	bh=otEHI81H4WDn9tOnr9Q2d2YY3f98Ld2GqVk/KVLqC6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srQxTlJG1FckZQ8CuzOc4O90U9VuRTbIKaZ4RhHZB72HJQt2EAyY5PzBiK/wyPE+egitKIu3x3S1r7MEBBUHg0J2PFyqEucqFgr67JkTQmpoY2ltuuFRFCTtjCMe1fmDvNzKcAjcieSwk2DX6Ong7/TG6TCDbZeRZNS0L1RqGnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hT52z4/i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AsnkKdT1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hT52z4/i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsnkKdT1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGVCP3732386
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H8h1GEu+Qlj
	UORh54PMZRj2icU0G1P+PhnZ9VWrNixE=; b=hT52z4/inV1EHjsNenqVbTsZZl3
	b3WiMz0ZzKr5KUFaxO+N6QtWAlve08+JQHFXiuH/u7rxdcEkqjhzTDAqSWF1lMeb
	lnSyzHOuQzTQLx3DHGV0XrlErYUhwQxdSzfHucRkq+EhHNlch2kF4xO+S56jd83F
	xkRVDJQEEgWRRnRB5RxfafLwmbKxZAjJYZW72Hw8d6BM3FB8SKfBVggbjXy0Kigm
	Zi8WdbqlEpUGWzWWA9VExvzi+C4xNUdQ+Fqtp3ggbkjIXYLj54IY0WjmgdyeETh1
	z8WwXe7dOI53oEWxLJSXKm0LU9+AFz9jgo/+iW8IuskT27LDwPdppS/X/2w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqr72b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:28:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so1062707a12.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740099; x=1788344899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8h1GEu+QljUORh54PMZRj2icU0G1P+PhnZ9VWrNixE=;
        b=AsnkKdT1jjTNoHAOWwKPqocOIFXqfdaJwwFwvpCjkttjKzLOnzGB8wQoUMHE/DJPOL
         s3Pa+/NPKtsZBcpz5f3LCDUXMHiTMfAkDqdBMMQuVet8hD7OjMzQ2xU0ADfoGUTItdhB
         2T8m/h/j17o2T72HDYGtf7gvYyC0UTJ/4p5eFBdKCMQs7BpFVCSYG1USKmTOK62240Dr
         9OtK/zCiwVPjnMwDmWEpCNafeWIWOfBtYr3NuPktWH4VTxXvx9W1/FLjO6YTtyahKpt6
         pjV8hGeOTmWczPvLcRdWIrzDZfeBQ6/LKrZp3Ai/2vrd3l6PmikMJ0g9wBurOyHFsljy
         Rkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740099; x=1788344899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8h1GEu+QljUORh54PMZRj2icU0G1P+PhnZ9VWrNixE=;
        b=LLqjJjd0eYUpGZtdG/2eGDZ7Os2xiXPxGkqoO3+OJxQBI/VPpBJq7fpBS03kmNDw8g
         2iITRyEwvRsG8NipaHH+Y0PtA14LirbHGk2qkKhiLqjph3hx1FAX/W+L7xmRSet5Wt7P
         iInubRFQ+IHoLA4+VDwU5yiKEdDF3k72mfIDQR34qqw8KrB0K2L60YxMFWK150Au00Dy
         VDRKGGmRPKDteiRHY976VOaN7NpTVxpKzNzqVnIuPkWLmZX8RX9s/NgFe2sZ//ztMraI
         rUE2xgSzcI14N3hLilNRBBnftVav0iI21w1KVQ4c+NSzaY9uT1aX3eOqXL5aMcB0eS2q
         LSTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcFxDBDJ6E2I+YJXhs24RiH4c2O6BSAP59dM+Neuw+iN0J0M8fvTyiet8X3hizM0N1Y9cSGPM57Uf7@vger.kernel.org
X-Gm-Message-State: AFuF++nZEKzPnm+7scSpWmMtSoMS8mizBVAIENPj1lDN8r9v8Wq8j34w
	ylsYYjvJNnPHLJhg1+5aVYWreGlY9ZmGifi6rlQKkhtag1jJ3OYPsbVDHjZPw0rt0BbXROW1Cq5
	wcXUjFw03ruEQkU+rQaDa/VEfSh7H5T8kzPEQd1s9i0HuOohrQbeUZd2eX8iCNVIS
X-Gm-Gg: AR+sD11AKc0P0Fr2/b1T5lCv6swn8THPSU2/W2CgmTit9If7scah+/AWM1r++qwCkbS
	B0rdMr1EyFWjUHlHgho5wmjDetPacGD642kWSoOOp4bUImJ5XqzvKD0olKesgNeYWZJgd1Xjywd
	iEHl5FcujSHdqaC5ti1lvvhtl1O4vL8XriTMFyxxI3GryMO+QOX44shFuLGyhYBVVCVjFzE1WMU
	sSlLqCeH5ErmcDSFGzw2eoEUhll0LTRTlbe8Lk2Fcl4YNlp8xJkw3VL5xb0Br1qH7gaKTM4dknZ
	Mjdn8X1zPTDGH1k+s9BqD7RmH+4w0C2vbEloHQJjqx/xWfsQ6gfBUVk19v1++h0Ne6Bfg8SDPQ3
	V0HA6CT8WWWG4XLIEPiSQqJfK5dSlN8e7K+KgS0EzIRme2S/bjG3gdEacnApv
X-Received: by 2002:a05:6a20:a110:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3cf7596a65cmr10578917637.1.1787740098639;
        Wed, 26 Aug 2026 03:28:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:a110:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3cf7596a65cmr10578819637.1.1787740098114;
        Wed, 26 Aug 2026 03:28:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm12935669eec.6.2026.08.26.03.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:28:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
Date: Wed, 26 Aug 2026 18:27:43 +0800
Message-ID: <20260826102746.633076-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX7dMLO1nzE3OS
 VISOYTz6J0SnY4jqNcq2TWswaaAPzbnrV12f50YXybcLOpPhX+2YgMn2bMfRzo2IL97UowcDJ32
 LcaX9HEVkxtETo8X2cQ9PAqb/Lq/rfw=
X-Proofpoint-ORIG-GUID: iWxvo4AF9AbxqM81OshVg5uBjbsZ20XT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfXwPj2X2cWJD4H
 +ulaTGgROLe3MXa8MWxfCqs9TU8mpcqEox5hD+vHi4T4JbvuZFMtFOL+lRcrIMfF3A6dRMpszhT
 auIpGEihsCjEm9IAmuV5LlvY54aA7ATPXZUlUdB7CZ6wit4EOJjh4ECaue7PSQyLXCF5mUEVnAv
 or1fwQXlujwSftbQXCYsvI8nKw8hU6UuON1NPZDwGW3bM8LYmfKebqTDd1UCUjibTIvGNlrV3ZM
 7sowh3+3Gizd39HPEngimZGq9WZc9KlKbLxIhRdmy/xvbeN4wEgm2BcvoN7HdUalqKhTrnt3mFi
 5zgE6trlRmnQ78n7PCJfFi0kevd7e3Y5hKLSAz/DiDWFXTgjYuWU3nmBdl3GK1caehB5XWJxnsE
 Gd1pIw5WEztTdsm3nuerqmfgUAX5Rd5FK6bZQgMw7gRhLHmfxU1bnRHQ8zkUC0oNpTyKe3uFbNf
 aJQ9QF63pSu8VijEOsg==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8ebfc3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8T9gEdC4W5p8owDaN-wA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: iWxvo4AF9AbxqM81OshVg5uBjbsZ20XT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Nord routes the NSP (compute DSP) memory rail through a dedicated NMXC
resource instead of the shared MX rail. Add the index so device trees can
reference it.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom,rpmhpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom,rpmhpd.h b/include/dt-bindings/power/qcom,rpmhpd.h
index 07bd2a7b0150..92c8408dbc57 100644
--- a/include/dt-bindings/power/qcom,rpmhpd.h
+++ b/include/dt-bindings/power/qcom,rpmhpd.h
@@ -32,6 +32,7 @@
 #define RPMHPD_GBX		22
 #define RPMHPD_NSP3		23
 #define RPMHPD_GFX1		24
+#define RPMHPD_NMXC		25
 
 /* RPMh Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION		16
-- 
2.43.0

