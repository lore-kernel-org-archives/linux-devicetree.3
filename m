Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4720037A84F
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740117; cv=none; b=WKRI9IjPqrGW9JpqOn6KjaRk1tOMkQpw9Mqk8hLXuWKIGy0z7YWdGNgnNySl4JrFnvHaWaB7CTyzB7qff3FgpXEbLxNHiVGZxJTOjnB3hAzZiaFhpKm4CGiLwHrmbb8j8/RTifd3jN+Nq6cZyZ3LofN8SSvJ4yFug1pB3gSE98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740117; c=relaxed/simple;
	bh=DOrShS5Fw9vASx3hDYSvjTUK0Jh5D8pXnuu6PUkXK8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tu/oqCC+lPrBq1PwNsaSiZU61NeAdziw1DH7FVjcpS+F/VQ9RIa3fEeNoL7vLYzPXCtIYONY3oHLgQcG2KFniK7av9/7CzDFNrQY3U70IawuQFHA+L/+XN+qlatkzdoSyzFgxYgp6cMGsBnV3BqVTS/MwNJqk3jn79HBzGuSRRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgsebSlE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GCMiy/Dk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgsebSlE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GCMiy/Dk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGpiY972270
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V81GetfDZGr
	aM3UzapUPoHJT/LXOGeWlsYECpijykio=; b=IgsebSlE6+wokvA7azwz642K0gh
	yb3fgHH3xjr8XylZOskYMWopkQSb7d/NSd40YQXK7MiQbQQZElLNLKSpOh8qfCWL
	gz7zkaWynQ6yyj6vBxq/GuleYuvkdx71jrlusRR0Wv97/nwEkTv9SdnZN5kwgJ1L
	kkDRwbQYfpjxeqIVrxDYfn6+KpY9DfWXwU52wCIAjZJ5V4Alylvo3Xv2x2wzQMuW
	ZM3U3Pol6bG2U0RRh4+cXuevN4cxndN+eGjg3EfGxQV6viZ1q51zJE4A2rtLHbAv
	2Q3XZxF70vKyVCG5sxsi1Km0E3lZTzZE6Ku69saGNp3Vcq+2TlKVRTy0DnQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghkfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:28:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso11605225ad.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740114; x=1788344914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V81GetfDZGraM3UzapUPoHJT/LXOGeWlsYECpijykio=;
        b=GCMiy/DkYYlvWNC1InqPGsOIOK7t4rq8IvJn+E/8V3RD4Q632g85UCwEs/lcaPfnv+
         DdVhKWvwwI0JSjN5O+64KPnHu0ix1UDsphJVrXrxOglLq+L0qx7VXFNCDj/t3Q6jHQXE
         3QA8HO933zacceNuwgey8lU65STA5w2/lf4uQLQnIOHdlzgKWDTDC8IfCDtgFvvwLgaY
         4BATNf4huPeh1J5GV+ahPX67r5kw4zNDX2QV4WxR5NEZ0nwESxj+idg55rDuEMq8y41T
         xG/wWDwv2ypS8oyd7BpMSIoqjox/EAa3slYixdc+STQah9n3Ms443FzsRGzAnCi64oMk
         SVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740114; x=1788344914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V81GetfDZGraM3UzapUPoHJT/LXOGeWlsYECpijykio=;
        b=CYNHFPNs/BVAJMJZEVCmnQ+BWyGkHLaM4eJLBXKGzhGK9AxygLk/FSB+iditnLhsO4
         1gtz5bDtyi4uXgm996Qm37DcvJnL3iSdBh0wRPhnSXytqh55t5LNpQQqC2aPglCOYADI
         MOqW3OJk2WeWl3hJSag/OivK0y8uO5INLp8siT0nhuuFEI+FaG/XSJG6SnzYUQwtiwbT
         tecYFY0d00u7w73EAW3Uyv1jK2a2s9GeVpfoDZBWMqPpgAuxSttZLGHIHSYwwzQ+MRgR
         ElWte0phAOMWdAcxew9KvSGCSgjYsKb2/5hHg2MvkUkA6qv24GOub5vrtxk2csnXf6V0
         QTNA==
X-Forwarded-Encrypted: i=1; AHgh+RoXtyXfI9BUGVr3ccphDUXtZqdtk/WwQvSQI/8+cCS5X2HiBpQzyHGGkoN4pSMrDVOUUNjQWEIbusMf@vger.kernel.org
X-Gm-Message-State: AFuF++nUfNraqroi11BNvupFFXB4c6F9RmBFOJCjcAVCcZacRq0UtgbD
	SOZfQW7uqD8Z1N1hGcMsSkdIclKek92K7VaPc8yTwGHG2CqQmOpP+uHod3Kq6VGOixSQ6osqnf/
	IK2ffabI5zaav6J98mOUG/rlMBb+ih2fL6wS8p7n7CKuRyywQlWN0z/TDbepIwZ3j
X-Gm-Gg: AR+sD11xPgft/SaYKbQcWVMeTu99Tzq5LrjFdxEnuAxisr1oTEkD0ZGwVXVIGG2QeWH
	eMgj2bmIO0+u7y2hWKPZZ+9G2psI/u2a9G00mxFYuW/FizrpVKGfVl/y/4Y/0LmfdpqawoqvDGb
	a5q2pINVPGPDiXmhA4nMWLjkAiVbWMl1cHFkr8n6hDSPoNslLDJu7tILSuTwXQHmteMbHRxgE/g
	x5+XjXMQld0yHVVbYK+yvLEQlGbNF+mvDmxHDNtFa6nsY610bkXhdofBr2ALXDV3xscfE/hEPgZ
	iUgdmJo9Y/OmHLtACoWPl0h2XQBLEHYWviRq2w8lxh7xOq81+pmTSQs0eiIfve29l42dZ5XsG9G
	P9llyzg7zc1A3xZy9L7Fu2wOTNHpgH/6mMnDAm7ynapa4OvVmYmenvl7BLRZd
X-Received: by 2002:a17:902:e549:b0:2d6:fec3:bd51 with SMTP id d9443c01a7336-2d707a069c4mr83279495ad.5.1787740113564;
        Wed, 26 Aug 2026 03:28:33 -0700 (PDT)
X-Received: by 2002:a17:902:e549:b0:2d6:fec3:bd51 with SMTP id d9443c01a7336-2d707a069c4mr83278655ad.5.1787740113162;
        Wed, 26 Aug 2026 03:28:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm12935669eec.6.2026.08.26.03.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:28:32 -0700 (PDT)
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
Subject: [PATCH 4/4] remoteproc: qcom: pas: Switch Nord CDSPs from MX to NMXC
Date: Wed, 26 Aug 2026 18:27:46 +0800
Message-ID: <20260826102746.633076-5-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: jz0rmPBh5tmniQCwUO9NcR3iT8enjPfd
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ebfd2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=DpeyPZAO3b19OXZAH4MA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX4dIfJ6Qnr7v0
 7uR9odB6uB0Cex9kbOs/rCPpiabrhZw+jT4bisGJ/qZNzDW8pYJ9WSkQ2jjMH7IjskkYKIKzzOp
 8wZhx5Ua51Iu8Bkfg4Dird4dC3SUdfs=
X-Proofpoint-ORIG-GUID: jz0rmPBh5tmniQCwUO9NcR3iT8enjPfd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX29MIG4v4rJWt
 fFyOWoOxoXVkCioPya4qGzb2vaE6kZbGtDW2kGaSYiHY9WGrqG33YOhUzxSjy0En0MlPEuj7Roo
 jmHG0PZ8GK1fbrVDihX3PrIT/eixfH9Apj1r6p47AYDUMwnHwkluu+p8GqmF4HZkrsSqKaypF1U
 XDAjIhL8LLoYiICTXHQ3BqrYwzqP4biwEd/GBy9tmz8hnqshkgsGi8BqX8InI8bjeStl8j2VhUK
 A6oXN0qDvmwNI6XpJqWyTBdZUnTX+99QbA4rQ0aZR4EsvydmWgoJk8VAkmbERHqDCi7oWs8fCeQ
 o+USDI5FfrBs7zuldLURMwARHJA7z1xWkiVOuoaKsoLwZ5K3mHuoY5S7FBryCQBYQT4A4P7zI7J
 pQeXY+GXEd3TJT/AkP0le8trWn5P1xbdGHelLy8O6Vpwh2eta8xnSLf4arlNakCAqPos0hQAUPu
 KbStBfVxKYiiwoLJ1eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260087

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

The Nord CDSP subsystems keep their memory rail on the dedicated NMXC
resource, not on the shared MX rail. Replace "mx" with "nmxc" in the proxy
power domain list of all four CDSP resources so the correct rail is held
during PAS authentication and boot.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..5dd954b57852 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1469,7 +1469,7 @@ static const struct qcom_pas_data nord_cdsp0_resource = {
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
-		"mx",
+		"nmxc",
 		"nsp",
 		NULL
 	},
@@ -1490,7 +1490,7 @@ static const struct qcom_pas_data nord_cdsp1_resource = {
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
-		"mx",
+		"nmxc",
 		"nsp",
 		NULL
 	},
@@ -1511,7 +1511,7 @@ static const struct qcom_pas_data nord_cdsp2_resource = {
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
-		"mx",
+		"nmxc",
 		"nsp",
 		NULL
 	},
@@ -1532,7 +1532,7 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
-		"mx",
+		"nmxc",
 		"nsp",
 		NULL
 	},
-- 
2.43.0

