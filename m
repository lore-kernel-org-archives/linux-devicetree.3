Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD4447CC91
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844126; cv=none; b=KROhtm2xkB4p6D2ulU/DMZ3vknvwFwuAN9llPVj84bWNHezak7XqtFJRCTQZjlho4h5714vrLNeb+d/R2QxiFYnaO50dHp6siS+ZU1Kmv0NfEw5OMZ309halgsGqy6xet5r1xhsr4KW9bT1u1rH/aUNc6SZUf0ezMUHUUxod8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844126; c=relaxed/simple;
	bh=xCnf/imRGH4q1obkO1MlH19qzgxVocXERPbyCFIU7YU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAVE7Xjo9L80Y0r//wHbHKBIDxTjmaIQ1qvKxpEkXcoMBE3t8QpzOs/i8P3Rb4ifqis/2yD8VjnYtqGbHMAHPla1SWvteCh4A9r9Xn0+qiCWd9AFaZD0D9MASa/n0KETsT9H6wd2O7ItalVRzO7VgZwD4Y3Kpl/hCxe7Fcowztw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXevwvcU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKry+WqF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXevwvcU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKry+WqF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5TCmU3220018
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zyoxgNBhioj341juMXOOUmnwbSXVmNDzn9vYvf/i6bg=; b=JXevwvcU/a/uiVmc
	DVZ8xYhbcNXnI00mRDW84wF1yM9SjrPg2Tzp/pA0JhKPm7+U7FVraZ2B9RENBKuR
	aZWCsikYwJbe5EJDV+/b3k4A3VXB3kD2NXJ99bEZHYGcqBQpiFLag9Nu2Fw9DF7w
	N5O9uJo7y2Af0ZSPM/wqp+vhyDqF7Yl+WKEkn2bSlRPiWiw+vNGxA7xzwrpJNtfl
	bgTtkIqdEU4cTLm5TqYXm8L27n39z/KwIUyyMHduuMlENY5f0PuKVtxbomW0QQ35
	AQn+PT84qa592BDm96Wz7YwCxxxJnqvdUXfx8k2/ArSo5OQjIsoqpIk2lEFQP2S8
	uPxBiA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s30ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:22:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5156c85538cso86246701cf.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844124; x=1779448924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyoxgNBhioj341juMXOOUmnwbSXVmNDzn9vYvf/i6bg=;
        b=QKry+WqF+AKscedlO8tQ46CiHrvrkeg0WXM4yjsjcyclJ7TI2OgWhvT427f3jtV2+p
         IIlZVkkHKg3G0Mu04co5UsF2PR8uCSbNt0zyOQsversJe9ogkMbe1RnQ6P5pHytdn/L4
         D7viPIcQ/pHTCzyQDiOS0Hkh758MKH9bNzV5LPr/LgPPZszYtYWFoFiw0VoAX9Yllwcc
         V8h1EkClzfbauBX6U4xPRshu+h22gipbF71sla8OD9qwLQa2rVLr4g4jWFaNiERLalJx
         7BRZsgAqAzyrrhIvpubUmx82mDDmKaDLKjRx++mEdkXTQFdpETFm1cwNFX3yr5OMZJMZ
         1dIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844124; x=1779448924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zyoxgNBhioj341juMXOOUmnwbSXVmNDzn9vYvf/i6bg=;
        b=SEjmqMk6+ZA37MX3Ftb9it0H45UJSYfNwgKkINWtTbaDQalJujWw2WyaezdSWVasxb
         pZa8GpF2HhDu/Bu47iPkIYw3Qg5ZwFdNaPuoIGGwSlqOovYtazFYGRGmtAt1QHId81W5
         9weaUdMviEW/8CEjbCf07VTu6ENMo0MMeJKd7yR/ETvgAAN0ZXIv2J0nzyFXZAql3MuF
         P230z7gp8MS7pE2Ndkn+U9wjp1cpkrXK+OixdUY6DuMxt840uj6BDSdUKHLJIL1cPWrz
         Ss/zTb1vwSSfN2hvaIHkqrzI1pJ//CI2Ai8T4v27QjyEN3FiD/8nY3s0UFpZBX8aDm80
         5oGg==
X-Forwarded-Encrypted: i=1; AFNElJ/EP8vOiQaAapcBP81f4EJmrIIVae7Bk01nGY204VO6wufL+IVLkiZ8P/xERVBEI4/gx2z2q07X8YFt@vger.kernel.org
X-Gm-Message-State: AOJu0YzlKi92TQ4AVKv70hvi9ZTMZ0zFT9aK3eSEMKcMxvkPbiAj3YY+
	6VJGo4nnTCsWwM3defEXBoUHxhONxrPsim8VAAaWJVlbUilyOixEoqifdFX3Pl6i6yQAW8dXe6Q
	TeQeeX1u8qvBJBJcbibf+VPJPL6DV+oraWJfJ8Jqviu0JD9FLn5G0bLA3LZwoDhMA
X-Gm-Gg: Acq92OFVqReL5PSYkliinT/8Np46NoWnkty2j8n9NWBu1NF1T4+rrPrImqi3CjnkRSd
	rSpGncqtbzQS8uzBz9RP7ihHze/03kHWOrRtaC+xAN0XxjTeoQduqRtePEfqHmn1iXryI32HtkF
	mLbr2MdUOfmlBNOKvScahVlkQyp7gF3euBZOiIMvAwM7v1tIwJ74nAu2eJX176hAhK/geTh03pk
	FMgyTTXQThHljpmWnaS6+weWeg438d313ZI8Tx7F6n6cdFFYuENRGRFXLwbSxeC25vu1R0FL+5L
	5HbvpBe1lwBPmqnTK7zYnyeAOla7z/LQVuWBnJnt9mdv136l4BmZXVqskEb/c1HuxIXg2G9hn49
	9BmwRgq4/2zEG2y7x2xnCy08i2MyrLRVEUb/0H+0=
X-Received: by 2002:a05:622a:1917:b0:50f:c1d4:d9e1 with SMTP id d75a77b69052e-5165a0bfc91mr47473241cf.38.1778844123334;
        Fri, 15 May 2026 04:22:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1917:b0:50f:c1d4:d9e1 with SMTP id d75a77b69052e-5165a0bfc91mr47471491cf.38.1778844122125;
        Fri, 15 May 2026 04:22:02 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm14059726f8f.20.2026.05.15.04.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:22:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:21:52 +0300
Subject: [PATCH v2 2/2] pinctrl: qcom: eliza: Merge QUP1_SE4 lanes in
 groups
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-2-ebb630de0dcf@oss.qualcomm.com>
References: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBwHTQTG92SMvtQi5D2AyNXmCilm82J9XnKKaj
 wwcG01ghCmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagcB0wAKCRAbX0TJAJUV
 Vh7KD/4u47D1Lu7IT9pIAhxVQKibloVMJoQ0OQFBIH3lmYXuMglx2r/r+yKNPakQQzXvXJ+jfuU
 Cxgrszvy8ld6dBgOfTjntuxznEmJ+RSCdxkX2yndqYIclToptq7BnEZvpc0Occp8mCM62jQ/0yo
 4bXsYr/Rxb65HKkdLNR5fni6OvxF5gjbjSvksx1NyTeRMgEajBODLX9sZWetqj1G1GCC2L5UmAG
 gqdhqf2yK4Mq7JLPlpGyswHQrc4wDvjIPWrTQ95bXg+qtj60XLsp/PeHVIsrKrGwcdlE/Gj+7Lq
 0j8qUTDpuzy8psBF8kVTVMgG9y1xZGolKsP+HkJTmVTkmpVO0sJKnkjiJqIUdAMc6vwf55tB/iZ
 JzpMr8nZC79OMcnVfjYtGqacP+ScHmcJlRovFwu2L5twhMrqUDZskHyfoRBzM352SA5Su//ClHW
 eMtn7aCRC2voHGv22tlAWWuzA2rm05F4xdFQKYMB/ADOaxLAiGv86854uhsx+Mlcg3Zoh4MMcXd
 wF3TXGsCurwnNGCeLc3kNIXD4OOpt/urm/gzFfRtZ1YJk4vRJmMhQARqQ2iIUE4D0EDnO1n8EFS
 KB1Jqz95fcpfBcYiVmPi0FCsUVPGP8AzSrKSNCtHjzEK2SJsu8iPNxTA4W2xde4J7TeZk24XmMF
 GFkzhIvhsfkjhFg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX8f+avIEVztJ0
 9l3C4gLjncsPyesnsRpMQZq2uerkuz3M+Kh+WWO80GmT5ztMT/zwRneC3cQSZsJRfxtvP3QRNUI
 axMc9sSMthjfxX2NxOa5qswS5Z1Rv6jxpVBRiDMvqy3bGCyAZKq8jdUZKBl5NGmjKxbFcHE/+Cb
 Bsa7q1njZCFw7WuExKmyF5srKhrMOJenWzXe7Y4XQwgnqAgn8UN0VWdd/nZ02U87qivRwOqyoyz
 yryW7TrOrf5zhOkB/Rhf3YMZG4veyk+reQ48AfexTqmiRgfvJeZ3B1/4hXauZ3ylm0QZ45jYo6S
 v4Nleja2tBQTIk89zOnxuXWm88lrbzOlrfEwABv4t/5A6yh4pNDYbi+i6NC15BpsY3WOWaq8SDh
 4kFUhYEo5HqhbODvd6BWzZKpcNsvGrPcgPvgZbPtHVvfP0fmXQ9gzqjfIre3h2fDUzjpPln5z/T
 yPU0Xp0T6UTd76mrY/Q==
X-Proofpoint-GUID: nH3prtYbArev4F2TLEoXtaKYx--BGmQH
X-Proofpoint-ORIG-GUID: nH3prtYbArev4F2TLEoXtaKYx--BGmQH
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a0701dc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OwIBgurHg3-afsiYUj8A:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115

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

