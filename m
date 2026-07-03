Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2723BBFD1
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077243; cv=none; b=iFuPesV2AsLHy424AFUavmiIQB8X6aJ5nV9dkKEkcwzVuZSxaXaZFCoKNvw13qOiTZDVKyhVUZhO40+530z+qvAmjkTWnWzVjYrjpj7vUEmaMto0inA+9NhuHnrL5u68dvO7oUtNpLNvyFBYm0UzP43T4C9e7sCJHUUhHWp+D64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077243; c=relaxed/simple;
	bh=jgXcpjbDSDiYM2j8SMXtXfJmjeOAt7TDNTcEYRT5SuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RAmxt8kwioJqJLcaaO239Bd5BrpRSchbXWC1+L1s9hajmTteRhTTXwcGpyReYGCL2rr9RNJ9jj39bp8U0UU2TCBtpCzHL2rhJkA3w4D9n44MK50di6drOTlyu1/4dQwwVyZsjlIxMZmziUkj8zD3LDLNPJ0PUSrAN5AWaRqf8WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fiy+3sYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+ftBDvK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fiy+3sYJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+ftBDvK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6639BopN3694364
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 11:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hc3pHFnXxHDFWcSnu+aCSp6MZ+FCUOvJzOmXLiQZnZ8=; b=Fiy+3sYJLs39S8iM
	3/C1JbMin7ZxwH7k2NZZdwrxrnR0pRGz3aTvIAIDHhyGMciKYQ2Toypc9Sl47StO
	z3lOk8MonBk9h1xm3I4mz3+GDQIKDVT6jmRKT8G25vi7yRPlE5MLVVHygV82tOI6
	lRK8cedzfheJBTZDAfbVxtlbX9J/m03+wCb9kHw8xajxQPrFp4BtqYqrcYmRM7nQ
	5GiCsFMOQKJud7JkKZaV85TLfXsImMBfLTx8R6FYiUh5abP7hdlYKEqCrca+ztGO
	qIvzCFK0JAzFnT7rGkP1Nj0Yj4M38lY/UHqXb5ShTIjVxrGY0OvmztGiH+I7odBJ
	EAGTug==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a848drt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 11:14:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so853192a12.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077240; x=1783682040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hc3pHFnXxHDFWcSnu+aCSp6MZ+FCUOvJzOmXLiQZnZ8=;
        b=g+ftBDvKSjqLERR2GPjMhgZlAFN+QjZ6T7u7JUHQKOa90mCQBNq8kb9LtF5BhcolnT
         84eZwgJypV3h6kxSQKlXhk+HswDlHfsPLT6IVYX1DEjScBKf+Zgnsyeo0U085u3RxCmX
         vvjDPbwPKHXHE04lL17GfHqSpdj26t3/JMesKgFYr0+1zHfTXJq/cmEEd4aTthTxYdP4
         rP/jTPxV4gtElm5T0zZhCWMg3mh4mqg1AiAQQnT1odePTAVJ2lb3uacct2rkrdWPT1M9
         2J3FcCM8ECyo6eXhc2+l9QukoH6YwEIMoIQ8RJFhJVMz1uu34KOhcymvI3EwRrPSpK9r
         fXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077240; x=1783682040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hc3pHFnXxHDFWcSnu+aCSp6MZ+FCUOvJzOmXLiQZnZ8=;
        b=Ooaa79sJU1JYPhDeeG4J/H0aYymLxg0s3XVIA5jUUUkrkMiPMpXlDjUcnuL8U4Dib6
         bgzL2P1wIA+aHLk59dPT37cepf7qqdQ5rXrVxSXUlfwjzt99BUPwN+jH/WCehrNENxEb
         jCcCh0J1kp35dgjjwbwctougUTtU0d4+qLGnQOkJ83yQiD6uMAT+D7h4Rrc7Vl4iyw9l
         lzdHOlOVlFIctYDg7WM1AUT6EZipZrwWRM34gugd+B0+nJsUPKabdDvQOVYMCsPfxsG/
         fa3D5fwNWfD8i2mIsPjLJPfYicqxyXsY9E1x6IWx7jSQ29qJ5nRdvy2SCzAaq5ILI56I
         ke9g==
X-Forwarded-Encrypted: i=1; AFNElJ+bcNMFuu5y/mlN4DOT2K5LC/9/TPZ9A+BaSLUxxOLW7ke+SZPoGSoiyLjQUuVMHb88PEKOM11bY9hF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0Ojq1zisWXHfTHz/KoMjcbSgMPHSU2tf+qA+smi+t7G6gLJO
	kHHf1f5WpIX7gf2m9CdgddQSAsrVAkR7txwYNdsw1CbNWky5qBQzKaWY5J20TayZfg91OHOziqz
	thCCYkbqcDYZlKLcq75bbxTUrzwqiKiTaS9dwWjBso8zylPRgxffgSm2vwHCUHuxtsi2LLfyr
X-Gm-Gg: AfdE7claQ3lJdG3oXwGLiw/mf+1wrcmJhspsYFsT+N5invJ/5wAhjO+3JlynafyAqnx
	lhP0hQkI/Xlg3/Zyo7tGUIazeWKhRMVBkrejdu/XnEiMaw+yxLiR/IDBg5mfevH6oU1Ef3VmpMl
	YJyXORLUwnpao0ADv1wcb6ovFRV3w5Emb5pl04RjwlDkc47SYlytsnchH5rqfzYwYPouD9ACe98
	LrLBVtFLvFg2HCjs5LSDuNerS2sj4nrklJ+SZsL77OrnGYxu7S1Knz0jx4V2C2PnHMml4WksfDI
	4OccL9J5+ixSu2CuIn6JeQCAbGiADaBuLOvXZhr3tAukQyh0QDyGkJ4fRJVAn77voX81LzhBUHg
	KqeDS7DTfCrqM30Xfe/KJNhdXZG7KZKA9RpM0Vk9U
X-Received: by 2002:a05:6a00:8d1:b0:845:dedd:89b1 with SMTP id d2e1a72fcca58-847c082cc4amr10323107b3a.34.1783077239715;
        Fri, 03 Jul 2026 04:13:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d1:b0:845:dedd:89b1 with SMTP id d2e1a72fcca58-847c082cc4amr10323077b3a.34.1783077239196;
        Fri, 03 Jul 2026 04:13:59 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2729490b3a.33.2026.07.03.04.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:13:58 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 16:43:42 +0530
Subject: [PATCH 2/3] soc: qcom: stats: Add stats compatible and config for
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra_stats-v1-2-0aa0ec1fa83e@oss.qualcomm.com>
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783077228; l=3101;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=jgXcpjbDSDiYM2j8SMXtXfJmjeOAt7TDNTcEYRT5SuE=;
 b=Wxlzf2ipWyji6rBsDVJfGMgAEbf2eSOZlPI807vKnwHyDOfrW6MvCH8+zTGEnVjF7vyiGmDTG
 8OJCSvbAxdaCKuMLg8jB5PjCSpMsBWLceirOgIcY+LgLNMlKLsb07Xw
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: fYHTMnQtPwQSPt14jdfy7pg63LKPCr-4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX39WcFMy+V7A+
 Fj8c/RPH3HhlpvHuJmSu2GUY9QbhdjwJJMWLm1QDnXwqAlZhZ5SIOZiTGECRKGc2jjLs/MSD55k
 7wQ+EAQyjRxKp25RYXf6smpQ4NvM7yM=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a479978 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8CqzcAHETZK6sRVTLr0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX+1SidxPA/L6W
 ql/PwXFpS5+y4Gyxo1wkjK/zmUvABMMiWVNMGIz6x7D/c24KGoNMRN6c/6HVaJfyHAV9c0VVna2
 AzbfX2KhDgogxXa9//eOH5Bd1wLIF06c4fJCKpK+Av/ssTcBLpe16fY+UWp+8/NavGopVXWLt2h
 uC2Y+ipYY8OG2hVEx3Cr3+6GC11VxVC+wDQRQFTSJU2Jskl3eUbWzRTlUHYYI+yAZCojqdbNSl/
 cMGGyHSUvarWr+uN/NvOEh/uwKXM7FXlU5kPVv6BtCthOaYupgJ+Bt1HbkB5ooN/Xe372OEVzd/
 yxKWPbYQqpIYJj06TAZ4HSp3ZM6EBipwUpOdtnbziQXL8JPnveW80mrAtYtVFlT0o9q/HytQfO5
 1eIO71epChs23neHy2V2U983Dtwt1nNDEhUGagIRRPOa4EU3iF4Vo0uK3XDyXrUqeLr5nbLqavS
 pdlqhgk8xBRuTCo0yDg==
X-Proofpoint-ORIG-GUID: fYHTMnQtPwQSPt14jdfy7pg63LKPCr-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030109

SoC sleep stats are present in RPM message RAM and subsystem sleep
stats are present in SMEM for Shikra.

For earlier targets using RPM processor like msm8974, rpm_master_stat.c
was used for subsystem sleep stats since those stats were populated in
RPM MSGRAM.

Here is a brief summary of previous targets and their stats
configuration, along with the drivers used to display them.

+---------------|----------------------------|---------------------------+
| SoC           | subsystem sleep stats      | SoC sleep stats           |
|---------------|----------------------------|---------------------------|
| msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
| msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
| sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
|               | (qcom_stats.c)             | (qcom_stats.c)            |
+---------------|----------------------------|---------------------------+

qcom_stats.c supports both the configurations for shikra, reading
subsystem sleep stats from SMEM and reading SoC sleep stats from RPM
MSGRAM.

A generic "qcom,rpm-stats" compatible only reads SoC sleep stats like vmin
and vlow. Add shikra rpm compatible and config to read subsystem sleep
stats too along with SoC sleep stats.

Below is an example showing sleep stats for "apss" subsystem with this
change:

cat /sys/kernel/debug/qcom_stats/apss
Count: 2192
Last Entered At: 5498618336
Last Exited At: 5498708046
Accumulated Duration: 2046572620.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 2e380faf9080354fae120e74f0b9bd1f3786d3e5..2f1615e583bbc6ea596d8b73d9bb0a2a00953cfb 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -376,6 +376,14 @@ static const struct stats_config rpm_data_dba0 = {
 	.subsystem_stats_in_smem = false,
 };
 
+static const struct stats_config rpm_data_shikra = {
+	.stats_offset = 0,
+	.num_records = 2,
+	.appended_stats_avail = true,
+	.dynamic_offset = true,
+	.subsystem_stats_in_smem = true,
+};
+
 static const struct stats_config rpmh_data_sdm845 = {
 	.stats_offset = 0x48,
 	.num_records = 2,
@@ -401,6 +409,7 @@ static const struct of_device_id qcom_stats_table[] = {
 	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
 	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
 	{ .compatible = "qcom,sdm845-rpmh-stats", .data = &rpmh_data_sdm845 },
+	{ .compatible = "qcom,shikra-rpm-stats", .data = &rpm_data_shikra },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_stats_table);

-- 
2.34.1

