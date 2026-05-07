Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553E63D1CD7
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 22:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194218; cv=none; b=tejlCScF2N+svD/BS4QkagK7ZAAodhN2e5QPX+oXcIZsDOcvaD3ihrC+YUPiQx+Yipdiwyi9qtavXVxFZxXrGH7fu3kucyyJ1HM+DKR/29fO8KupWTLNr13Og0v6GGnZh3KwHPJtjIfpTuwwZP8gd1PwfCIUuYDeT8sa8JofC2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194218; c=relaxed/simple;
	bh=d6sTldzr20rxqyeexiCHog1RigxMQcbtDegyP5w3YpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLhIdd0hJ3Xqn0iIXi8/ABO4VFtW66GpPixBwSOAytxALiVoeZk1UqU0c3CIcPafRVv3KF1ZDKO5p/TpiUt3381lQ5/HWUFvW5Qb2ZE7Ty0PYeLc30Bnjimvl9GWhfvkweVF5asz2xbqtd7S2HlmzWg5dxzjgA6SqOjJdQQxfqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mi5j+ZlJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArQpPrT2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mi5j+ZlJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArQpPrT2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647JDAiK2183134
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 22:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQvxefKofl/MWew8drQPijHpKnkbQHmoKvevMGmHYPQ=; b=mi5j+ZlJdbfKBhd1
	Y6dLOtI2uozcHYMzVfe/0bwdeUBpGEvTuBh1uFUtEEdXlr0kkxbSjrZ0MbxG/Wc/
	2WiCDHULMGVuZe9n6J+HPk+eD1WZ4ycoo3v5d/bGEpJAmQbITKQb4hfRUYsrvfWA
	WYSkjH+OMJNTAfz/V5sjF1flMIS66yv1a06AWW5tTeimaa7FbUZxhubAmwWBbisq
	BEC8Xhipbp2t50SYtGzCtcJ/JgzuG8mF5ZFoPcW+2KPBYcJqaRl9zAhKnz5hUk3P
	Bq64Mit6uPyOUgzklRt6mkfNf6O7U+jDAzXrzMIStmfqAH+79bnQKQsd5g+D6Zz2
	UPJlZQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10py8m54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:50:14 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d434f3356so1327685241.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194214; x=1778799014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQvxefKofl/MWew8drQPijHpKnkbQHmoKvevMGmHYPQ=;
        b=ArQpPrT2oMGZeCYJKXVyrIkUPhB6yI7Qm/Sze8dFw7bFuc/7albtp+Sj2JtJgjVhSJ
         FKTdh/ouj9RcIL/x95DsDVTNgRW6H+NO11ZVGfHwNC5NEheAqxxico7ws9SsL7/OzJAW
         xglhmxEgxuq2xu3WwhSOJk5BEEM9OV96yxQQ3nAKRBUNWpNgccWTjnVPsAwhQ02HKgjV
         P/koEXgJ28DdCVQYBUkUHl/sQuBGbnTfB1I8NDXOXjqNqDbz0RqlHqkKG4L6PsVoYoWP
         V1Ef8bxPL+3T+4jgxGAu6pZG+N+MzBJG3HM6wuP8CvXtGlLgaY3Tv+A/+ugJqsUQxHBE
         VfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194214; x=1778799014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQvxefKofl/MWew8drQPijHpKnkbQHmoKvevMGmHYPQ=;
        b=NEqZ4/L9etKjdkMjM0Sux1FwVOqb3HGXE1KPbDVYNWxHc6Ej/bTYxcC6zNTHu3Z7IK
         QCP6ow2bNjK7fJaA1o7POJoYAcpcWmK6H/79KawbJ/MyMNMcN+SkK7tSn9kojORJBAUn
         PzJMefDsrme84KEaAp6In3z5nFtq49cOtOcWrq7QWAP9ufDchHrhHSWZnuik2BfVGG8Z
         kjmn9TKbP4ekQ1Pmc4zdWQ5G66n8m7wY4EvTouReuwpPdLuqSBHDujjJFXERtxCXYQ9e
         WffRirfNRMGVHWCtEpIOzwMCUyXIKr2oQ6JErFMcKjXUQqMZiQaAUL8cyEPe7JNN2fyD
         EJGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RdIScuzBLcac2Lryu+PwHAYYJ+ehEj0dJcmr3YK9o9LAPaVBSIuc6GArjVA7Z1+h7wNHhPjV432Pr@vger.kernel.org
X-Gm-Message-State: AOJu0YwVOgDx8w4N6FUXYMoVAwMHDfsWhAqEPRmmz4fSvEpmlPX3tRVG
	QfufCmDEbxWldOBJaDHvAvKf1RVoUn8DXezbuIERIK21KSmz3AyJDBKQlVVdO8cvnPqMSyXoco0
	aUaROAXSa1Ez7nJ/EWumAFmcChlTWCYBFHzzFv41BxWmEpFXsIDb1d8HxwSluqBGa
X-Gm-Gg: AeBDietYgYGHF4OCbOFKhHQGw1ZnrqXaVUQG6Vwn7tW/2YeQ81jWayTvjFiRzKxHGaI
	lcWr29TZZ0sro2NZl9Uqnj+tjH+LzOcETgPAiR3BtnAh8isS/yyi5rHWxu1q5CMdY6dEzWyjJZZ
	2PyO5ZvznUzdF6f16UJEn8mDddsMK4/Rlnx7xgN3gAc1VCqc8TFrUL6/n6JJk2Ym4/wh/piioig
	HQyHzYL/L+iB+R9nJUDFCRi260LYKlxzJ0mMp4nqqNs4m5xqM3pEy5yg8GNKIZt6i6IqJP9m4Mp
	4jjspm2izJB9mJCLo5KxWLo1v8UjYUs0xxIvI53j/tCTUD1WLWjCxgBy6KdUlx+B2btHFn2VrN/
	HM7D8K58V7bnQ4L8SBEOIge+UXzRKXW58wVL7kb+zFBinEBHZFZZ1ycIayQFWQxP8N+nIucCOht
	UdXxdQTytDqHYWx+ZU
X-Received: by 2002:a05:6102:b01:b0:631:3b92:9dcc with SMTP id ada2fe7eead31-6313b92aa4emr424427137.27.1778194213797;
        Thu, 07 May 2026 15:50:13 -0700 (PDT)
X-Received: by 2002:a05:6102:b01:b0:631:3b92:9dcc with SMTP id ada2fe7eead31-6313b92aa4emr424408137.27.1778194213371;
        Thu, 07 May 2026 15:50:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:18 +0200
Subject: [PATCH v3 03/15] media: qcom: camss: Drop top_ahb/axi from QCM2290
 subdevice clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-3-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fd1726 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=yFrQIQtVvbDJ7NVWecMA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: _nezgKW25Qt5sO8a23HyGtK6hx2n5WtX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfXz9KPi/tfm1Ns
 56V5vLIixFLJNSXIgGvr39yk2d5+JYNCcnCR2gly7z0n3D70WpfpmYsMQPDQWYD5tPKFitzWvWM
 heg2/Uozpz7XLm8lZj7sK2UE4yaORaGMm6Mtnj736HCG1D4kqFd42HXSgOSiJZF2BpMAjZAsKAp
 fhmGVdvMzPG0y4g/pNosxmNvWlgLuKbRcnsNTL3RoKl9Q4//Ps1fH5Qa4mITnQULS2gd03SUkIz
 MV66X2QHHp4nMGBUUu2wzx8DZFJAq2+GZeaBOqGZxPuPhzzRq5vCFfK+wfuCISB6HQGFOA+owYk
 Eb0nWBWV25wvn2UdKFqnzb08XWgpeXFFUvdWoIkyZDJcF/oHbmst28p6p74SkSdGilvMzmAAvUD
 DJqmpvkeqxRyUtqXhySwvqqWSiLXjfU9YvDUmRcvnXcjgBLLW0xT5nbuFS70QsNPXwkAd/ZGQJN
 8xRDfX3jVXPvZyBkpVA==
X-Proofpoint-ORIG-GUID: _nezgKW25Qt5sO8a23HyGtK6hx2n5WtX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070231

Remove the top_ahb/axi clocks from QCM2290 subdevice clock lists.
These clocks are now handled centrally as a global CAMSS PM clock
and are automatically enabled when any CAMSS child is active.

This avoids redundant clock references in individual subdevices and
ensures consistent clock management across the CAMSS pipeline.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3bde26c4750ea932ea69fdbf5c5da9f959e5e5e2..0ceab12d573ee7521d44b77d23ee563930d6aac3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -663,9 +663,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 	/* CSIPHY0 */
 	{
 		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
-		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
+		.clock = { "ahb", "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 0 },
-				{ 0 },
 				{ 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy0" },
@@ -680,9 +679,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 	/* CSIPHY1 */
 	{
 		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
-		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
+		.clock = { "ahb", "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 0 },
-				{ 0 },
 				{ 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy1" },
@@ -699,9 +697,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock = { "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
 		.clock_rate = { { 0 },
-				{ 0 },
 				{ 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
@@ -717,9 +714,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
-		.clock_rate = { { 0 },
-				{ 0 },
+		.clock = { "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = {	{ 0 },
 				{ 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
@@ -737,10 +733,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock = { "ahb", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
 		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
 				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
@@ -757,10 +751,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock = { "ahb", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
 		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
 				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },

-- 
2.34.1

