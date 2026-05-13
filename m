Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD2C47ECC2
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676586; cv=none; b=aaH/aF9U7hjZnicwU5MhlwDPNuOlu9K7Ql8RQWqDKSsnKGdaTOz9fgRt9yaSTVI9mWhzvacuZ/b6xZvcQPMYza2kg4Fz5yOyXR/b8lr9WpeE++0owGlhi3RDrwBrBKBWTJOQ64moYO/DXTYw2lWresrTR0gEc6bicthcY3XEfbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676586; c=relaxed/simple;
	bh=1U+PXG9nLo9qUltBrYaeNctURowSep0vzQMqJImDlE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drgVpBiDBn27NgzA07eGaFsRi+sXkntvs2/HpvM/+zQHZVr5wBqn5Jtx1UMUMDu60ZI+BuCVY0tJE2yRrOkksc6YZo9aOXoSrBJC9gqmQTxaOGSMnnTQOKni57FT4Lc6+oXmGTpnVcqiRVVwx96KAUz5ZEycL9WZSrC5aBLg9Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPk7rL4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMoT1NQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPk7rL4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMoT1NQX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8n8j52887813
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g9e6GbuUhCkLq7seP1dGvQXz0WTCfnuMhV6Ul6jJ9rE=; b=iPk7rL4RjmgTK43W
	+K8XRj2OlaTyPRuoNYCZ5ngeVFAX+WI7UvClRyhdmhlR1K6936UXKcO4nSAhVbM1
	NpdfwcDyi35uiqSUCNtuVLheLA11Y8+mnSLyQxX9UdN1GJSMayHlWXXbdEKyJW0Y
	zGf/Z3dJkRcOIQQ3hBEiOOx0iR6NsCkd1F5FYVXO/A44Dc6d/cTbkMPoezmncrGp
	AuhhtVnz3B0LATVlmCYHhau3uh/jRcd/Ken4lbEtTe8wvlLa3QLHF8C3GdknNbtH
	w2LpIkp3dajw6BeeKMqvdIBeX6kUBKXXXTRQhFaRANj2vZXirfTe0Te9YHE4Y6Jy
	a49o9g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ggv7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51605cf3c60so39908841cf.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676579; x=1779281379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9e6GbuUhCkLq7seP1dGvQXz0WTCfnuMhV6Ul6jJ9rE=;
        b=DMoT1NQXLXUt/UXYPKLaLiS9uQzb1Z0bm035ENLeW6N6TFr7z0fPFxlkM31uKb5bmx
         gJfaBo4fir121829VLkXgZGZIEfWUYFdXOKnpwk89w/ffe+I3lZd64n6WvYrYG0VfZ5h
         86Zhvm6eFaesiZeETyGHtt3anlvG3z1cXTUAXVIvSg0XqqT6Jp8eZt5sE+2t9KooZyY9
         11mS9YcZv563CHRhH7aXsobc5Tof3XcbPlX3ogT7Y6ICEwMCLq63dpnkh12ES/5mXLc+
         XncNvoZ9bfB/sjbMGZ1wLGvyUBhdcrJkqanJhCde4lsCbLVf2LglUiU0WBXxZXIQlSnB
         EG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676579; x=1779281379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g9e6GbuUhCkLq7seP1dGvQXz0WTCfnuMhV6Ul6jJ9rE=;
        b=DBCIVMUHTUsck8pCqEQgRTQFxQtCaTy03H5WvrbiA4CX/5MovRII9FaeAE1X69gULt
         JQAKaQN2FhwZMFcWVPZbuBHLYqraUOpo4Lpz48+uLnf+XGxNc0Vkp9l9OEirlub7KfAY
         elp68HNEkMUvO7AQd4jERr35K1igO0SywBuKHmxkHhHHwR4cNFdQdj8ruBTW9/jYOBPW
         koldS5e6yldSMZ0fbB43jJk66ENTaPTTo8dX+9iRy7wMjc83oegWz7cVEZhtqbtfKZMQ
         XIA26oHY5nzdzGUeteLKdRb3TCr85lwFMFtesYsh06vI+I+ftLVfEGw/naBxWcpOSFy8
         T/LQ==
X-Forwarded-Encrypted: i=1; AFNElJ9cURawzUPY2P7BzDt7RVcnuPOuQ5cRHocf7BGxceLSPQadtOdRZ4uDXb5XH/6DCfAMRh1yEKCIc1b5@vger.kernel.org
X-Gm-Message-State: AOJu0YyzQ4z5nG5R3l39+o6eTfK2LfoT2e2NwmzIZJ8yAkL0i+jc1Df9
	w8RNjBHBF4EjNLHsnLiBefEMGUxIXtdqs96+tAkovVYUmXpdUoXMgDY7b6YeCSf0GYB2f1CwXNK
	bmp6wXmgUIAmI5V/2JhAmW2L+qrjpHiEHaPgOU0UeJiOt+nd3jx1/6AqTt+Obr2e/
X-Gm-Gg: Acq92OGGb8xcwzVH+P1aQ7nNt0JQRVFczgC4y6Mv0PbgrYx8aLzWPHOmcEj5lXa/3nX
	Euf92PFv1YaAI8Tvls6OUHoBtnPBhOI16K62O3QQqdBFU+OxHW5wMvaO2/T7248OdZIhhj6nKX4
	uq6apV/y92I/GGq1P+XumgGHSK0Cl2NcSMJemdF9EOOryjyMBG5H/oc/8seeaMAPJ2Z+EVhX4Qo
	FDBfCyn4v7hnTNZ5vV2IHVuAKWKH7jV+DDX/iuXZTI+71/dmYpLvMLRE0wD5iG0Syg4NY65QKP+
	gsFtoVdndwHp8ush7LHA3AbBOpdvJzWp/CrqkmYpvRov99NQjufU9QU2HaduRd5cr6wWQwZPwHp
	BzuFwVh/XIk8Hh70bTH3Lp2hKKW0FLJVv7uQ6DkuDDio8kjrZEHBG9jppeV3eWiwfR2Q4yBDeFy
	43wvQ/iWITd0ZX/of4sXr3cEiFEceD1L6gHf8=
X-Received: by 2002:ac8:7d8a:0:b0:50d:7cd4:4a73 with SMTP id d75a77b69052e-5162f677033mr38466691cf.60.1778676578897;
        Wed, 13 May 2026 05:49:38 -0700 (PDT)
X-Received: by 2002:ac8:7d8a:0:b0:50d:7cd4:4a73 with SMTP id d75a77b69052e-5162f677033mr38466311cf.60.1778676578426;
        Wed, 13 May 2026 05:49:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:50 +0300
Subject: [PATCH v2 16/16] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-16-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNCHQRAsw3WNId6oX4eo2629HpyjMUF/fqZ8
 9bN/XFdmqyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQgAKCRCLPIo+Aiko
 1eA4CACd8eaQW0JAUbIUttqp0LI+zsoIaH2rHKQ/AQY1ipn5xmRH2Bp4F2ve1+nIif4/EbJ23Lc
 NbBof2z4o3hPEOHOjzR51QsRzUgluKE+NKUTY/tzrZ7fvQTNnDJJhHane1osAtZysLmZv2eYHh5
 nHN1pmYRu4aciD7mOU9GxSdZYQcA0P16PbRTysHARauVkLaQ45o/wkOt9RJB9QPE58OTiEVXW7F
 DmUeoWN7CcPopXSpBcW9vzVlrEWSznl/ie2EziAgD0NSKhNk32zNC3V6so7L5ucFPFSDl/1ubAl
 oLbg1Olu2Xepaf8mN+Hma1HuO8DlnFE5HaPjQtAUooJ91h0c
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: d0H4j7ZivM4xdo_wJcTU0B1bPy0_6WGQ
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a047363 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: d0H4j7ZivM4xdo_wJcTU0B1bPy0_6WGQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX6WlCRGfzvUC5
 tFowqVhnB5eiCL3c1ao3nr+kP9z8eDtgdhRV+lxFlWorcoXam3FeeepGFGvrdvg2JKnRNdqPUOX
 7/CjQM3CYjiCGMWzK8bjYZs1jWN1ExJw1udtczCVy9nG8C5+pJYbUcaO3fGaCaktBI7O1nlU2GA
 OcWj5kJAhpXgZnAi3nD1OhVinxKjyVLiEZIXa9GkrDRH2stvwjmZJ2laUIcDz0SrFQ2MBnXEEP+
 sU8VR0aVg63XGTTSx9N3Sy56bX6fK5fAdpeMS2i0HtCSoggeGRHts8PygMkcR9jMcTpQVQGrO+S
 DnOnbcxPAYnZmnaHdgHMxvJMojTr4vCLyieHcqYRFNYZH8kf3ZQdHJoeQHD0rpIvm4sh2U/dzpw
 PgE0LRw7HABiT3GyEgGfTyQmLdxPWF+NKb5tyj88cqG5ccgu53AyDbJrNFQ9y4y7XkDD2MJGNn4
 zw24ieeCAqFOV8FU6tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132

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

