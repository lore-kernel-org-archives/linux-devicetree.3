Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4711E4C9574
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463424; cv=none; b=nNUNj5+elQS5mOSP4caPNgPJEs4TKZBYX19YNDKCKSoZHdOuxdZaKwuYiO4p39bqPwT8p9zp5OJoghu4E3LzvIfXy4KdhAfdhOOGGSUVUl4ud2QzNeekpaT/dScTxDvaa+HxIqqCNjLKf44co5vxPK/6sMb0tWqhh+CB4ywhJLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463424; c=relaxed/simple;
	bh=p/LOewU4HM57xRHatWVxjBN/11NXUxDntkVtHhHnu9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tw8ytjhe86yRJRnCgwpCR+HGgVC15684Sb4bf57cUFGFptMuMNa1H6e1BpB4iGlHTWQv82Ih1q6oDtujOWPIosmAWKneMZbLutrCbjmSitU1J6ZYBw+W22EFQwz+I64MCL5mQGUhFZKRDV1XRt0KRb33PEjRPn1JgfH8tat1dwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ME1QU8q4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HanCJcmt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ME1QU8q4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HanCJcmt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5DlU518084
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 22:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSFYY1NUdhh/cah7gXpWItwODtYkskUZKQCjJtgwtIU=; b=ME1QU8q4eLcaessS
	Az0OOXu96wbWYa4PGt6RBRb6sOQca7wtsZCzOqCABvWcr3oQpjAeecaKGXFp/QHo
	QgVszdtSKWuQMFLLtunUQKGRFfFIjSsvNkDL0BAltY4Eeq3f7lWak1p1n2Cu7TcC
	62BoJKGgXIiQYUuuvscuwcr/9J1fBSCH4Zhhe/skPgBbfdb9uidHB417DOFHhY/c
	9DMU8M336/znVwbNWEBN/7x4Ku2pu5zJGvnbG2/sBwoITnv1gUBnN7A+D+/KxJPX
	fHQ2gyVk93sTXxRGWdNUsGtEkBfQGi4lNC5QLyiyF2fMqLp02d34z6ZGbXJ3FK45
	+6XRgA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5sfa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:30:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738b76cfe03so28771137.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 15:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463421; x=1784068221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSFYY1NUdhh/cah7gXpWItwODtYkskUZKQCjJtgwtIU=;
        b=HanCJcmtye0/2sXDg3GITi8siZJyVXAqP7Q3l0WGZNVaxwZBYDZUpvelJ/ZSgdB4N2
         wE45ZL6QPSB9dnN6NioxTtb3ZKhzNIHQAbcW92QanqT6avQkNeby/57dxDFs3ICjrHZn
         DkcqNrRkT+H4SZe2vR3YiZBSWHoJuPx/IrZ90saqxvoVtaEG8a84TL7npwcVrWwaC8Em
         P7d1GUcM5ZC1u5ZAMWldDfAfCYMiZtfprM7+lsWL0DDKVDAri6e87aBFpgxkkrhXLGbl
         FTSbXCMX0/BxYgxHT75Py0NtDYCYOpdfrbG/s8TT6tZmflFiD8ffkE7GVak3d69bV698
         TeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463421; x=1784068221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSFYY1NUdhh/cah7gXpWItwODtYkskUZKQCjJtgwtIU=;
        b=tKrQIrK9lF4E8bQT0375IfZ/EnacZqqWpcnTWGr9YyQc3P44j1zZCryACm3FBcv9sa
         zjIvMuENUESU5cCwA4/8OawSjB2ru6Z3y675gWVNwCoFFsPALPxpsnoQuwtPowPToal3
         jx4o9oXnMrNi0Y5XCIROCMc+xDtNSW/wMOBMv9idWX0j7FyUEe0aH1Aqrs7wG0NJywDP
         4YONyxIqQ+yplRiWQ2sdbFr9djgbh28PWEUPFuoobLJQwSTaBwEGUIkdzPi09LqPn10E
         GqrI+Tcg6npCX9MtRPPLqpQZtRHXoMmy+2sO6bQfVEjMm3VnGEVR/fB2zLz9D08KdxcK
         g6ng==
X-Forwarded-Encrypted: i=1; AHgh+RqAEqyrSWwCMzL49m3mLf9wpJHn9x0q8EMIMtnpSOdXpF37JoqK/7edgA9yRIhLHNEKtlKwd4+bfSM3@vger.kernel.org
X-Gm-Message-State: AOJu0YzXtcc6xgl+x+sVcXVLRGwVpnKWewsNMVfI3hucAtply/lJRfpu
	Xh3FpiVwDloIWhDZ9I5wNJlUn+hPqKq+K1jhoQJq4pxHg0rVvq8ltQxqjf9YEFYCIcki6o/Za/p
	Wr3ijcb4eXEGKSsv8pVv2vCK1bpLb8gBnPcKiPuHnSmclte1anWb7OeA93ds4tmMh
X-Gm-Gg: AfdE7cnYj4Z+KvZOTPEY/GFedGAuXG+m9esYJf0KDel7w9sN1LtQjCQsAyr0VLah4FV
	biOLruaQWOjknwmRmMukp9T05XkU2CGjEvp90PdDYiYud/WW19vJSuDcO813UaaWm8VFECdkDcW
	kEXcX2oT/WASbjBRDYTnE7js6HpkaEWfBSEqEuvU+MlU/IRwyWt3xPfzDj4Asyc8gc2KmyY/8QS
	cdS90mTGavDu1CRxp8agN2LZ1nvqyBKMCM+Wh616/HC5m/suRo49pQgCLn+Q0m2ZjJg4XC5+S8R
	1EgpbCBNUnwLPvBdqNt+zv6EKu12GuZVPmIQm1+HTB340Rnp0N11DBH1VDdxJz7GWEm53E/r1fS
	9PW28vnSwyH3vRDtXyu1yq9nqPKek7u+jVyfCP2zDUhzMTHNb9VM3C99kPQuz3bBYx1bysAtIks
	0ZNdqlDloDjah8Q2n0PUySBnUw
X-Received: by 2002:a05:6102:914:b0:633:d7ec:153c with SMTP id ada2fe7eead31-744b7b48488mr4747025137.3.1783463421490;
        Tue, 07 Jul 2026 15:30:21 -0700 (PDT)
X-Received: by 2002:a05:6102:914:b0:633:d7ec:153c with SMTP id ada2fe7eead31-744b7b48488mr4747009137.3.1783463421073;
        Tue, 07 Jul 2026 15:30:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:30:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:29:01 +0300
Subject: [PATCH v6 18/18] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-18-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=p/LOewU4HM57xRHatWVxjBN/11NXUxDntkVtHhHnu9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2rTQpQBBYFFqiGAUi+BUKhPXN8E8Y1WviYU
 LLnI9gJoU2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qwAKCRCLPIo+Aiko
 1auHB/9i7uOFW7TTC4aUhG7RzrG9W44Uj4yNxgGCLPCnkES9ZoZ3lVwkwZ7aejvxWvJH0YCPxcg
 vR9nQW4dHF+QmBRh1H1PcrPO/zOoRe6Vx96X1KBdIcFCaR9lW+h3aLyVC4cI24diOkJRSfJ96ns
 Uiy8ZNo8TML5PsD/4bVhAkPFmLm+AzgH9ynDe8QiF3v5nWQ6tN0qMbTLnG+MjwNfeMhDx66WvRj
 xzdkxCyHqIGAaCCy7N6+8mrcim8mXC9r+Zo0ZmxmVpnHKSxaRUGMmw+OpCpfMH9pk/oXXOjgksL
 8OSz3FtRoYoWB+h7IaIEfQCmkQr/XsJRqhJD4D+Wxi3UD6s2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: kLpaeMuCpeN9ogFOqRNbk7Lvl0in6zUf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXyft796aaQrgn
 HI0dQIQgM34+kg/gbMCcZrpPNmBfbgNA8dzaEOoQ6uPC21lpUk46kNYcANsoasEJgw0du9VbeAq
 abvH6VWMz/fyTnGrkdCVr0Hj2REKp9M=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4d7dfe cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: kLpaeMuCpeN9ogFOqRNbk7Lvl0in6zUf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXxcMQCK4A9JaT
 fBrVIbhMkHBT2VuB9bhVgor8Kiv2aMXstYsu07LstUyJKU0Im9L1m5o7Vfa3XvsmZLrCuofrlIB
 m+UZIomd5SoOL5KOXlARXRbFDYnXR/XEqC993C5bkl+wmIlj2B37XxVYA/20XcNyMPASKMmZNYY
 ujefmPBi2xJgDRs+kaZfNlDZe4W0tCw33eB4FgMiApG/Yk9OG054ZiFmH/l+JcARRlcxYTb8SiH
 /UpUAmFeru+HxycDqOjbvI5n1T3B9DpIgrXxjLJ8VnOil7kC1yq1EIm40ggmzCD1LAyKEwQu5nt
 jbIDudDC42E1Px0h1oaPE99DKSanOFlZnnCZ1ooG1EdV5VWWliuUU2T7m7SU76LWRhGbTndRl7t
 gXHejKMxReQGYy58tC0451qDEk1yCLZdOH06byGVPtCXpu/ZzNB1ApnddXLKLwuVCyVeSwXagof
 ynvIH9s1hYYn0xr4shA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 4e2f1804ca66..ce73e0efed50 100644
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

