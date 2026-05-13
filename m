Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC34C3D75BF
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658091; cv=none; b=bgS0AeHpc0tVZS8NXnjcEvTPdSRnrj+DduLw1xHcHURlQuKLOzL33n/PDCVUOSMkn/gdKjMcVj/OBc6qqyMp4IXpIyoxr5+au4PSm4zxqsTfk5RogM25feoQ4UwhoppLX82TTv8uabf4jFz16uxcqC3FXGUQfMFizQTMJzQ443o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658091; c=relaxed/simple;
	bh=xCnf/imRGH4q1obkO1MlH19qzgxVocXERPbyCFIU7YU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/C9A00XDGJ+InMMccAYMkQHKOrx06wIHP+Q/gj1pS9kPS5msMVOerZeM/zUrCZ8CliXbFz+Sb4aDlG88wkwhyJANt9/IusB5DiF7r5lSZDwaELaO7ugEgf0LzBL4h47v6dTlpms2Io6K1lN4m/4vdE0huoRZRImEruiNaqHjXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3/bKa1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cbb6DZm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3/bKa1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cbb6DZm6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p64I2338782
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zyoxgNBhioj341juMXOOUmnwbSXVmNDzn9vYvf/i6bg=; b=D3/bKa1B442ssai5
	AqkS5xSuJcBHlAUbbi4UZdjo5MC0D+HwBn2iPQHwSy+qyrZlriTIbPIgqkCzZ1i+
	K+H8iql4MhBCrL2tEAOk09GG0L+AjfWAlrL/SlLKVtJt/BPG5KGYCRKxFNSY0R9y
	E7F/iNrNBbrKcnt1Tyq3oSqkSYGiYptpyY5qhJtRPdmNCGJpp0jboZaTVffzWpzS
	NdxhODG54McJ7aKSWH2ZOvBUNqkRpL891K7DFw/Dvw0/k9CGwOHWHoUWnphgCi0y
	paRkNdHmtw//lGnj3V/ZD1hhBDfip/IyzdlpjY2CSGMVoHn7IruHAPMpWObkmmnM
	wo+bhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxaae4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:41:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5147078691fso149554451cf.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778658087; x=1779262887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyoxgNBhioj341juMXOOUmnwbSXVmNDzn9vYvf/i6bg=;
        b=Cbb6DZm6UTTZkN+r95053f3cc+SF6DFXmaWEbLdIQuPpJk8p/RldpRwQ1s7ZZQiB+8
         sv5IHxcynFhRiUwf3PG3kvOC40vW9yuVXVuGfIc4Kgg5Gr06ReUglCcEIGA6RiEcKCkz
         eJTERY/oPKCDLpMuM2fGEZnghGwGW2jNzPLLb33StfaoWdI8GShMxafei3FRp3Q8HAKl
         YiengwZkhmeMWEXF4RWqHlJjZndAKgs+y80rRxXOgKoGzDL/cWLVCNGLBMPD4Up91+TQ
         CRwBBfoOmEOvxzAFNHZDl/Px3TP04VWiAI7uLWCJBPrtk3DSyVRzU+W7OUbbwDiChVzY
         0Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658087; x=1779262887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zyoxgNBhioj341juMXOOUmnwbSXVmNDzn9vYvf/i6bg=;
        b=UrX0BymXODQtspj9h8oNWYygBNlLyYeZA0sUlSaYqe8La64odRFFU8xWJSM6aA1spd
         hPm8/tVH4k+hxT+bfz5RxdpSrCsbLLKPfO0XL87ZEw1/DYQb7evfCo8YO6x1n01PVHDF
         NFRgkk6MKRoW4/R752sSSvwnvUNTRVSng5M7ozhepBb0pvFNqjGqpJa3WO0PO97DysKX
         GRmrOLIwwFflB/PKMjKCyovWBUUfLCxJjpF2go1w8FWED3joA9AwTgJXAiN4oQRgdinY
         +44dwb1uAB+qCtyIuB9HxUb8+NSlZ+0BSUi6vr79/bHJNh4i+VHvLxC4tUTYWRvwCGD6
         L/Dg==
X-Forwarded-Encrypted: i=1; AFNElJ90WHpzoJmHZS5WwoDCMExFfUXWwgMOJpqN9Tp8DXOHUx5yPjVRmkxIbQoeY6RkHeap3zVSVNlkoGtd@vger.kernel.org
X-Gm-Message-State: AOJu0YxwCvdjyqHVXOOBwQpqozK0xOHqgi8S5Z4kLtiDQsdx1OZ15tHK
	Rjj7wvq9f7C377e4pNrU+kRaOD7qHH0IofAu1byowyHwz9JfCSGhz1dyjxCU0PPoLfk4NNVYmcW
	/RJk20QQMZ92iZim7K9sHLL+61bsx0knbif0gbyeaEl82OVEwobvqpOyAIuQ+51e+
X-Gm-Gg: Acq92OEt6xPb5LWoPMIPcYhetEvDmyewX+oHuTY7rX5pIAAxgubZSpj1Y9twpstv7aC
	qBRxHgwf2vKNStbFv0w/B26NQqvm9ZSwWsB9ONDVv0FAS84mveykPbDoYh+0ndwsfDt4KSsfo3v
	b2m1OMSBKoRJQaQJ6a9Ahg/uG88qAji7akGj/cJz5hNaysymnEmc+UVORGZ1mZR89KRAxWg2hCd
	0HKhD6sKpxmyUlzR+aL/mBm0ScAX2A+hBE00dKL2agR7iI20FboKxJCKJSwNlzkjjhS+m2DIUW5
	HT9g6Q58JZIxJHdGrHi3VKYZteZrxvCygeh7VhhhuTOhxSYkOsXDZbZ6j/aVLML8reyh7YS2oQP
	p7nayOZ9rVEY8IgNA7q08VVCfa0kz/Q==
X-Received: by 2002:a05:622a:1e0f:b0:50e:631c:c38d with SMTP id d75a77b69052e-5162ff612e1mr23640521cf.46.1778658086924;
        Wed, 13 May 2026 00:41:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0f:b0:50e:631c:c38d with SMTP id d75a77b69052e-5162ff612e1mr23640181cf.46.1778658086437;
        Wed, 13 May 2026 00:41:26 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce05f41csm48999335e9.5.2026.05.13.00.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:41:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:41:08 +0300
Subject: [PATCH 2/2] pinctrl: qcom: eliza: Merge QUP1_SE4 lanes in groups
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-2-1babc6118829@oss.qualcomm.com>
References: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-0-1babc6118829@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-0-1babc6118829@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3320;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=xCnf/imRGH4q1obkO1MlH19qzgxVocXERPbyCFIU7YU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBCsfh0M/fgXqonPVUSzN4prfKfvyhj0SvnfmG
 2uhBBL3vIGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagQrHwAKCRAbX0TJAJUV
 VqG/D/0R4MeiQ0lvgO1/2GtI7WBaFNHLKrktCuAG+oEZtVk79yd3t4bIR7JP/lvmnpFlMKG9uAw
 H3wY+j00vwVhLDu0Sw/ONuWIQqW9EZvss51OOVTXt1orD/LoSzwDEFVdvOCD2FdwYPwECgeiYMk
 hYtwwRGJNLgbuSKycmHIyq7ViJDRxD6rkG6LMqau+6m/sV+I3bSNeoJ9CPIMBiU2k3yLc7pQuXO
 z4Cuf28Les4FIR22DNhcq2HvgYhHpkMUo15rdOVKmBE6k9RJBzACS5DGlIc8Y0zw/uzIRhty1GY
 sQ2Lpse6RVOFQ6PxRGoKXea4+/SD+ncgD2FxHDyvgm2VyD+T5LRmo1qeitwoJ0uZv1sJstiGLJN
 6u0SaElIoKlxBrhKXbsidZgZ5XSOvrNL84J8GOMUnUTDai5+PUnaZBYk6I5jUwNICjL9Y2x7Wbo
 an9L3VQd8YFIQ0BrABx0omw2TyUWAjjcZfkWJku9RRX4D5L3UxHyFYbvE2Vs/Xk4nqRIHEhOzt6
 uLAL5AI7BbkY/VYzKRaySRT8jZmuhdGgywWfDMLMhHOD4tYbHhCrcD4ceib3Rx9YPjd/Nb57rUt
 dSqfNIMGQNygonO2qqBWnpQzD1WXjFMYuaJTDruIQO7qc4Gmyc5wzZBtalmJzFDyXSoJJb6ZVQk
 n04U+xoxzFMO/4g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: RUrAyHL_NMQx6m0JMaerfNV09a2iAqpz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NyBTYWx0ZWRfX1W4/Z+sUvApm
 A51RorDwkEy8lGPkId5GWZVRkknIp18MUxRsWp32I4JzdL6vkjtr2AkV/8xFMgSoaxun4FKb8hM
 lZxaCYsH9Y9bjyYky5R3LHrk5zu52bdVlXSUocp7QRqAvp8xh8cc3WutktaZ0VB9Paxa8Tf5vTD
 259KFdwafMz2MaIoRkzRtiWhoEPjwsDXnkaYiObbv3Lyi2JYo5HBwhA2Zc8E/LQKPUQMMt7B0Qu
 MpCFExAbjxmW78vl+R6/U9e14LnNR7TDm3oxmeumDx0q0V2GKzl3mZ1VMf1Xciw/xK71hW+7UK6
 RtNiuldY0uMNW57kWXU9rDgU97VJbaz279/OFdgT4U3e+WuMUUGTN6QWWd1Yl4MoQ/tidDTPIQ4
 1499JmzhSqWuSy7jtNgoxGt3PxJZLWf3nl/YpS0T8fFMJfaV2eEJeQJCG0j1yKdoETqKfW6w4kq
 CI2vbJ11ZMYiZ91AwVg==
X-Proofpoint-GUID: RUrAyHL_NMQx6m0JMaerfNV09a2iAqpz
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a042b27 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OwIBgurHg3-afsiYUj8A:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130077

QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs. The
current driver exposes lanes 0, 1, 2 and 3 as independent functions.
However, since these are usually configured in pairs in devicetree,
it makes more sense to merge them into groups.

So merge the per-lane functions into qup1_se4_01 and qup1_se4_23, and list
both GPIO36 and GPIO37 in each function group.

Fixes: 4f5b1f4e770b ("pinctrl: qcom: eliza: Split QUP1_SE4 lanes")
Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index 636442d0afed..da2fead23aa1 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -544,10 +544,8 @@ enum eliza_functions {
 	msm_mux_qup1_se2_l3_mira,
 	msm_mux_qup1_se2_l3_mirb,
 	msm_mux_qup1_se3,
-	msm_mux_qup1_se4_l0,
-	msm_mux_qup1_se4_l1,
-	msm_mux_qup1_se4_l2,
-	msm_mux_qup1_se4_l3,
+	msm_mux_qup1_se4_01,
+	msm_mux_qup1_se4_23,
 	msm_mux_qup1_se5,
 	msm_mux_qup1_se6,
 	msm_mux_qup1_se6_l1_mira,
@@ -996,20 +994,12 @@ static const char *const qup1_se3_groups[] = {
 	"gpio44", "gpio45", "gpio46", "gpio47",
 };
 
-static const char *const qup1_se4_l0_groups[] = {
-	"gpio36",
+static const char *const qup1_se4_01_groups[] = {
+	"gpio36", "gpio37",
 };
 
-static const char *const qup1_se4_l1_groups[] = {
-	"gpio37",
-};
-
-static const char *const qup1_se4_l2_groups[] = {
-	"gpio37",
-};
-
-static const char *const qup1_se4_l3_groups[] = {
-	"gpio36",
+static const char *const qup1_se4_23_groups[] = {
+	"gpio36", "gpio37",
 };
 
 static const char *const qup1_se5_groups[] = {
@@ -1312,10 +1302,8 @@ static const struct pinfunction eliza_functions[] = {
 	MSM_PIN_FUNCTION(qup1_se2_l3_mira),
 	MSM_PIN_FUNCTION(qup1_se2_l3_mirb),
 	MSM_PIN_FUNCTION(qup1_se3),
-	MSM_PIN_FUNCTION(qup1_se4_l0),
-	MSM_PIN_FUNCTION(qup1_se4_l1),
-	MSM_PIN_FUNCTION(qup1_se4_l2),
-	MSM_PIN_FUNCTION(qup1_se4_l3),
+	MSM_PIN_FUNCTION(qup1_se4_01),
+	MSM_PIN_FUNCTION(qup1_se4_23),
 	MSM_PIN_FUNCTION(qup1_se5),
 	MSM_PIN_FUNCTION(qup1_se6),
 	MSM_PIN_FUNCTION(qup1_se6_l1_mira),
@@ -1412,8 +1400,8 @@ static const struct msm_pingroup eliza_groups[] = {
 	[33] = PINGROUP(33, qup1_se1, ibi_i3c, host2wlan_sol, gcc_gp3, _, _, _, _, _, _, _),
 	[34] = PINGROUP(34, qup1_se1, qup1_se5, tb_trig_sdc1, ddr_bist_start, qdss_gpio_tracedata, _, _, _, _, _, _),
 	[35] = PINGROUP(35, qup1_se1, qup1_se5, tb_trig_sdc2, gcc_gp2, qdss_gpio_tracedata, _, _, _, _, _, _),
-	[36] = PINGROUP(36, qup1_se4_l0, qup1_se4_l3, ibi_i3c, _, _, _, _, _, _, _, _),
-	[37] = PINGROUP(37, qup1_se4_l1, qup1_se4_l2, ibi_i3c, _, _, _, _, _, _, _, _),
+	[36] = PINGROUP(36, qup1_se4_01, qup1_se4_23, ibi_i3c, _, _, _, _, _, _, _, _),
+	[37] = PINGROUP(37, qup1_se4_01, qup1_se4_23, ibi_i3c, _, _, _, _, _, _, _, _),
 	[38] = PINGROUP(38, _, _, _, _, _, _, _, _, _, _, _),
 	[39] = PINGROUP(39, _, _, _, _, _, _, _, _, _, _, _),
 	[40] = PINGROUP(40, qup1_se6, qup1_se2, qup1_se6_l3_mira, _, qdss_gpio_tracedata, gnss_adc1, ddr_pxi1, _, _, _, _),

-- 
2.54.0

