Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114B7481FD8
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845721; cv=none; b=X1GvvndgFwf6ax8coNaLn1AtcCIclcoiqMSxzeJbURodSporxDJ0OtKQlpdQ2jl1vV1c/k99sJxVDIjSGfgx75Ogzm0N4rLtGQ+XcRemMJHZ1+vQa3nxqmnxRjqI/MbKgROfU6OgMpO/LZR2mdEs5QSCTUj2gulBG7ACGufEpao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845721; c=relaxed/simple;
	bh=1U+PXG9nLo9qUltBrYaeNctURowSep0vzQMqJImDlE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvkaE8yXnQDVzywM7ab6Fq8ir+bck2xmVdZk57GYKXo4b9qMkK9CRiSKqFcTJmDBuYVLoskaGMUDKGvXw7em3VfNGPaZkLQlLZX6Ce4BoHMLoS9LqUfqVgNexV0QsAZtXsxaz+J55pndSXr2kGdKouFQDqZR0x+flmaijgx55Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5hgCahE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTHQZ83E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5hgCahE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTHQZ83E"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBWF5i3513372
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g9e6GbuUhCkLq7seP1dGvQXz0WTCfnuMhV6Ul6jJ9rE=; b=E5hgCahEDoP6SxvM
	/01IvCLjZzgvraKWJKFAZJvrlS07BhkPER9mvqRq7hsAzR1Qv88QPBfrd7yfjPAb
	hLD5qxWW7VAe5KxRBwaoATWmh5vp1XsIw9NhG6t3dKVheDonQHsPyhAQvyv3VpwS
	9pKt7dKfRVFPWC3PFAFDeazDQYYohYHpUVcPVeqwc/9UAqzTou113WY5ojGJkCf6
	mzrdy8GBeLBhfyY3nOAWI5pkqq1dMY0j2mDIGWJ6NMqyWOHA9X1FgTQoP/dpJPKd
	1DMrLmGy0n2/AhTRguvLP6mFju6ofAQ65wo+eFyIVH7GaGQ+eAGSjYGOCvNkz8CB
	UbJnxQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vb3qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso217228491cf.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845717; x=1779450517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9e6GbuUhCkLq7seP1dGvQXz0WTCfnuMhV6Ul6jJ9rE=;
        b=gTHQZ83E4ITa8wVrw75bYjVnU+dmvT0CDEIJBurbiDrVcJu0R7fTF8FgeIxRceiCPX
         2H8o498a7WJH4G6e343ERyjvCqHpQwT+FRIwsE5I9z3bapEdGpe1SMfRyPFCAMF1ub0J
         rahA7Z9CRb8wMY2B5nFVcnR0LaLYj6G+6FVcaC+skEDFlWgzS6Ix17I0P1rAQk10swW1
         CjRnPhJvwU+q/YGttYEDGpHOR7enbPZW9P/n4jio0SJV4DZJmhAgSJQ2f63nViQxqkRs
         oq3H34wktYBgK+bNlgtf/kfXzDyl7l6j6HAFEsYaA4Bn/I6SErsa3FAGC5FLJRDB3lfd
         bS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845717; x=1779450517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g9e6GbuUhCkLq7seP1dGvQXz0WTCfnuMhV6Ul6jJ9rE=;
        b=B/D9jPGRqGxCyB4317ENncZw2BRBlVQqmfUaFBk8+mwdMJcGXUyy5kLHPSKLSPa9Bo
         Kiz7siPlgZSglf0AhE/ibjJfKdLiUU0C7oPOe705BEUXUUE3jGhJgERhUZofJFmOfe0+
         y8eW0myOGDUOb8QiuCyEEHcAd7mn8lA6LfBOh2c7B68mHTHW1lOxv6xb0tdONSHUyrVr
         wpa2SQSqz3NX8Oq7LmmXww135JVeybPyYSJJymA/6A8L1LYkLfBPx162AQq8+oeb0IPH
         I8LvhSTARVMNaE+yiGq2V5wZAu3ffclqZcb8v5NFq+2ff32YhFa80fa6pKGJB4CNyXXj
         95rg==
X-Forwarded-Encrypted: i=1; AFNElJ+tOxfjnU2f/guqdv9GQNwa4KvIwJmz5ER7W1H3q0tzpGby/6xXaHZqK/irTxFii/xwm7v1wNmaJJ2K@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHiBcLcI+zkGH+dxvEcx9HYyMUpZfR2t04v1KltXvJv1XNf6j
	1EpE6w0ggUXAZbHMaiyDSJeVPDnXZF1zX2VR5X7EVuTdh6p673qbidkRUx/syLF8Tty2NrQ0Sxg
	5l2iPd+8IaClqdvdunj6+3qFq166uenTaEOlmH+qLT4b2hrE9zdVE5S5nT7Vc04rT
X-Gm-Gg: Acq92OGUosQj688lO1H0JuWr4AeV6KY1+qQ6JmoTMci/96TtJMghb1E3A0UNn90pZ5H
	UN6Vb75BZWVP0gK8I+jrwPxVMgWa1bPjyzPkVbvR8QkndaNBqoApEanypjAbDZig5CA9jQ73OOe
	byl4EIngY/PKOlIPnv0EuJLX1CEqzsdRmOSLPhEvbpBtas7iKzsQ7LDMjAyVVig4hynypbHa38z
	IGNhy8FWYuzRaCmQ/lsIyhvd3M7ndj3lsuLLXMQyiYtq1KwBUDdQNAaxvBYrAlofCPRYajWMWGh
	5sE9sHihmSPs4wr09E6ao5VvSDG89EmT3qcdjZUHXR3ODIU07RWLtnYNkO9cTgPHJwqj3008Itk
	iVKHKdL3dMLPVh66fAW9iJkHsE3ovCQ/j8uXsdgdyeKmHOvgpbBPPQz5v7RQxXhyjmCUn/xA9yg
	+Qwv+EHntTIbXvE5wU0Uz2/IOA586nSu4rnio=
X-Received: by 2002:a05:622a:a6cd:b0:4f0:131f:66fe with SMTP id d75a77b69052e-5165a285292mr38859571cf.59.1778845717149;
        Fri, 15 May 2026 04:48:37 -0700 (PDT)
X-Received: by 2002:a05:622a:a6cd:b0:4f0:131f:66fe with SMTP id d75a77b69052e-5165a285292mr38858911cf.59.1778845716408;
        Fri, 15 May 2026 04:48:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:15 +0300
Subject: [PATCH v3 16/16] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-16-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1U+PXG9nLo9qUltBrYaeNctURowSep0vzQMqJImDlE0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf2j3t0gdyFILDLQFigdxHWQCUaLnsGxp4QO
 ByqT0M/weSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9gAKCRCLPIo+Aiko
 1VOOB/9nmtxijHAo4UEcjqs7xFv/rQMeeSy7v1tyrf71rjd+Gl+sXsx7+Z7hpP20zkoW5frewGr
 bP3o08iyC/7h685GKwAM1K5FIEan1ORH9FDFYI9KEuXiKFyaekiWhekrm6bsn/4bs7wtjPXSbxH
 GpXv8mAK7NlOYvfCO9lID5dJJyaL+yJdMAXSyRM4HjjgcsKZ90qmIMrK7wNlPPlY+PNJzys3Ka2
 JpL3OL6NegAcwygTifvw8tMfjOUUr7RPGfBLvxu6nrHbUXzPVYAhV/dtyiOl4J+119TWRCJo4s2
 wUJsWy3V7oIpeGTCJLeDomY3Q5ZrVuEIah8TMvi37T3JKanB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX8eDBSeiMnN9+
 JRuiE5bnc4GHtPTmUqTSSIwKo0eJ5+lQ7TD67D0T23rhFXHrNrgrjWcgKDtLOurFoFePXoBP04k
 RPYTSl7DbeR9gKZkn+Aa97t9GPPIf53G4IC+F2R0lAGxmbIdi/i3ODqSCGXrSgEBQ0sEzoPw7fT
 +GKRbnX2HiNfUOy/ltGy6pbLtRSi5HqFy5Q02N/NccbyLS5peg0a35hHnMMMECLZUEgxDIfNA/v
 oP8QZB5ZWtkxVYyiHjF/021ZPn/OZOye46h7IgY3i6Nzol10A5qSVN9sbgOFRw3RaiE1VzAn2Jy
 lXW55S3jR4MrOxPmB4bDAsiWkIR6Q7/c8+gNp6pyE3ptTjdDDhJH73QtbFU7R5hU+d2ruKTy03X
 jA5opo65qebz72u6eqtF6imr0wPrB9DZPe3pIY1MVgY1qjB1DKzY1aNr89uZRL6eTtRPuJpPqsv
 NrbKCt96P0PlpiEldlg==
X-Proofpoint-GUID: YgXeqKDC_P7QOrYNNUiY5qWGhCtwjqgO
X-Proofpoint-ORIG-GUID: YgXeqKDC_P7QOrYNNUiY5qWGhCtwjqgO
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a070815 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 39e88d5dd6d5..6ec5ecfc7759 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3

