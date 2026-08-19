Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568723CAA5F;
	Wed, 19 Aug 2026 05:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118144; cv=none; b=mhCpRQFx0mwhVLWZW55nTXFW3HJNPc5/qfqd0Ag8tl3PKonv2u2vSSMbmB8Jaf/DleFr/hawpACaqD6dHaeImJ1YQGCoM7jSymaJaGLBcLhRXmZhk93UB57IUG+61YZOvWGg28UVKs9lYmcgeYcnGmtgt98SJzlCcWYjbV+TQjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118144; c=relaxed/simple;
	bh=D8xKIppiQYfFU8WrVlXh6/yEYix++FeVu5t+x6YWFYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MAXMYhIsTKFx1PeRzO90TpANpS82Df6KW7aagwB+2qoTYHh8D3oVi/tXLtOTg2hsfEwP8pswMPx1zGJ3eVVfylzNk4lkPFfFBaZHHGHYxezq8kJeBY0z5vLefoO+k8vjjJtWyVhWx1NOxsp2kl5rR0EVZkTDQfiVcO/qlCeyYUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJjjqPGc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJjjqPGc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5I3Xc3419189;
	Wed, 19 Aug 2026 05:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5LFbvTuRZOD
	9XkcPqqHhAhPUU1t3xctDdxnD0k+GQ40=; b=ZJjjqPGcVbZlmHS6CBelrTzGrkz
	RvzBAf8vX6p2oXtR5jokf/fyAe2usZxZONgmYNb0TRxOg7Qf78X21hdaWtTZiPS3
	W3JsCHPar46pnB5CnwJ9QyxRYlRaZXTbDAwf45b5Q8dy2CIzWPgEUFUUYAUjzYUl
	gGLGi+2LUXHaZ95rvrp5D4l3PYqv8A1oCWszAVMDnOnsN1zSnRKZCO1HW23Wg1wr
	8Z2fzymAAit5FCZd1BMYo1TLrE8dOHNcH4lnPW1CzPBvybrtBoVxqQ9wu1idWQLs
	2PBbbCwOcwtOmN6tXguJJ7RZaoR0d67cesbGdzL8GtItGsXdOSQ4n/C0pnQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfn9g5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 05:42:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67J5gHle016092;
	Wed, 19 Aug 2026 05:42:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g2h6k4vwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 05:42:17 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67J5gGYr016065;
	Wed, 19 Aug 2026 05:42:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67J5gGjo016050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 05:42:16 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id EAA47643; Wed, 19 Aug 2026 11:12:15 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v1 2/2] soc: qcom: pd-mapper: Add support for Maili SoC
Date: Wed, 19 Aug 2026 11:12:03 +0530
Message-Id: <20260819054203.61385-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a85423c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=GZwwcC8q3W0PmOCLCToA:9
X-Proofpoint-ORIG-GUID: DzBmpNs-0NkZK6U8nuPwcckE1k4N6xhK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfX9Ro6UKP56fo+
 RoRuF+4IEFbYwPk0MoxqrPjMafgYl5LIr5N/wzzXosz+0SQ96J127M+IOqqOQvg+wh+3P5t0dgZ
 hLtgdKGAwNhI/vi3BfqqCdVllHnF7DU=
X-Proofpoint-GUID: DzBmpNs-0NkZK6U8nuPwcckE1k4N6xhK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfX/Si0dq/T/6S+
 CKe7QZNR7BpOnXZFa08OWsZ6vfgJUK6k5Dw7k504ODo1UYDNP9s8PTRZApdg5ZGaZqB02LTeA2k
 NXQM8AwAO3m1mueMiL6y1CvAisC83ZGZflRrFLjpWkd97pg/4iUYEJwXG9sEMgqHsJPO+V/UmLi
 dsUprsoYfnuPobhaSUFk5eALRVEEs+CkMibCrGrDyShY/Kk/l3LdKez2Qkqky7piBVtpWm4e2Iz
 KJumUmTyZfQahGXQ7cLDWny4nAiVhb2XK3BOrZgHQzbm9acuevUZteVZo37rTN3y49Edd/oe6BT
 ohkI44IHCbsO84f4ERQqvuLpth3t0cImlgF2XZz0NncOQ65XYh/c1oNJxbHJX6rQ8tzP0tu2+rh
 1VkZv5OpFyK4kQ/sGPfGbSBAYguMnGRSZRc4Y0OQpZ0ON7BLTgD+zUMMi7WMDRe67oc7TsdmnQR
 YMzyqLWZi26mDJoiUaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190041

Add support for the Qualcomm Maili SoC to the protection
domain mapper. Maili shares the same protection domain
configuration as Kaanapali, so reuse the existing
Kaanapali domain data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 64ca99d7fad9..3376423d237f 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -626,6 +626,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,hawi", .data = kaanapali_domains, },
 	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },
 	{ .compatible = "qcom,mahua", .data = glymur_domains, },
+	{ .compatible = "qcom,maili", .data = kaanapali_domains, },
 	{ .compatible = "qcom,milos", .data = sm8550_domains, },
 	{ .compatible = "qcom,msm8226", .data = NULL, },
 	{ .compatible = "qcom,msm8909", .data = NULL, },
-- 
2.34.1

