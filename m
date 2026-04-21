Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5433B6379
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769001; cv=none; b=nnPQubIVW97gKBdYblWt150eued2BmzL3IPUEOuux4svXNmJc9lnQSZA6DOo+YwOAmXv661O7BRxMtOSGXfyLcIHV+cgNWSTljZhsYbksW7cROlkeIBZ1ytaIdzrr+ucGwde4ElmGu6VN/ebyHio10zWRHCDzPjSZz56wpREOsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769001; c=relaxed/simple;
	bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s18e8B28/qWe+WajfaPzAaWmhtr8Xmsv9K414snFn3zwX7vu4aR8LSWSdnGZAqYkVO5Yrn2GYJPAVeOGpqEa2FOotPUp2oxNl0woVdwno/cbWQJpPkKmsacAEgHErQuUJFlR5ozksKCE7BqeyDVQKpRWaCjK3iZ5Yh4ltINXpVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeoJybME; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPQfqIzM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeoJybME";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPQfqIzM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9XVX83164709
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=; b=GeoJybMEmBngamUt
	0Apgufr0QpAMNtezGVorcHVZMx/CMveSithnwQp5Taz5ZGaRDRZxeBXKMJ4JlVQV
	RxVh4hAWCkQtUwD0xtKobM/XeTESt4qoPETKECWp1Vue9gY4ZLdkHQ3lhargy8Jy
	sz+cQmlsxknJ9B7qqtvcmDI4IHG7kOX4Z+cTOtKZz3X/cHizEGlgqd9JyanIny5g
	MuNmVxeImrzdj0cFBHfQvbw15ovHItmMWJDB9PGqy+RhtviurV43MYKRPCST64O4
	X/wH3y1I6u/ODq5nF4s9AKt1tgFvFHqKgQxTgADqcJ4VEB0bWnQOZM9B/P6vP84u
	Yys9AA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp6q8099n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so1910293a12.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768998; x=1777373798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=TPQfqIzMsK+M1TWaXWZZScuE2jq8jVy76GT2J+r85HQ+tDNDiTSzycLqX6s9rHmsrZ
         mG+ZhGW/kTqVoAdK/KIdxLlP6TALyqEh3m1zoYwLVF5oWXxxzE6q2u0KIUddCxxH0rGh
         e4XK4I+u2P27i4P1KobpzicxVVadAAkIEoCKx+WzjCrCcsa1IJroZTAchqddiLSsuITy
         BuwOVimOwCJU+3MriwMuPFnpeHOdyelKQC4fK7sQrLdB3haDYKqp+hBIaF0VRzOtKtYi
         ncd389JzXW1yguFGGh5RO4Y42r+4kNIreDGMjOQIZl4G2tEpdtEgEtKveyJ4NqkUAfAb
         8S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768998; x=1777373798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=BG05FZdOgmXFpjiMlZEQ7Pcg5rxIN24/BnDcuYynIhjQFeKFUSIf6JOxLoAZ3a/au+
         NaAZ7pkawa49Lu4do44yNRhXAJf8dJTSpCf2k2hIQWxHh4sbfQdTmwuPw4+zfo0JVbN1
         VDlAWkbflsX+V+62sTRyRJLp1sY5p8P97mQW7JgiSjQuo8Jb3Tbmhbb/TH9Rz82YkfSV
         YH3c+dknu1AaT4nqs0wN0jNVXe1BAUM1H4IDwew8iHjjr+3XdL/ONdZ17J9eHdHaN7O5
         kaT0OxlIjRyQ18KH6i2jeNsx6thy9Tr+3TD0pSZprneGnKvmtfjgK/Oi1etP/ou/c5Ei
         H4yA==
X-Forwarded-Encrypted: i=1; AFNElJ93zKwAd8zYFYmU+PPwR9pem9Gwb93vr0fSURa5UY+FSlgBiV1hCAqM05uG6wc85ohbzbnT8WtSHK99@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc/DjdOma1orQ1raYkiFwjCQk6LjmQskKBXmCS3jxTT7ok39eo
	FyPGpTHdGiVBkzc7HXGz9f1jPqb8YHkqViPQBiEMJj78mO0SvFC4D69i77NdEvfKW26nYCOWcWi
	dIF/oQgjvTMCjRZPMr4TpwBGl5DD8L9yRBUsPcGG5tGMJr40eSgT95f4H0SR8S5K9
X-Gm-Gg: AeBDiesAZA8Y0jdkmOUHaRTV/X7E4taWG7Noo4CRMSw0N7KbKJ6FJO/5V5YnIoAt4GO
	azi2pOd0uTayDjaPRoA4LCzYGXtY+ra475Juih6iN/nSaul3luxliAsEX3n6Qf3R+PUnZQF4gwD
	NOZEhSgtHXAlJrnjdw2ETtkNDZiVy395ujTmw6Q3ruqyth5OxCVEjHgw8kbCt+CDU5Bfm6iy+1k
	0N6dF/ATQiRHgvf3zdGXWrQ590BHuJsIqkY0hb9ahUrXn1g3LrDjq3sryJ8NiSmtjmyMFO6CJxk
	C3WrR4tjPGzOwkauvdIapSAQTVm7GcIGKScFINiyJaqmzby+eC+v3BAwPCxwc1WRnoeXx97MMTK
	OILugPSvIumqbQt+v1NnNvp4kcrmrPCCm1Tlo5r+KshAKxdQIShb98/VHze9W2No5kWCVK8sB57
	LyD/aIZCPvOqk9lbBvA3w=
X-Received: by 2002:a05:6a00:a83:b0:82f:4bcb:a9d5 with SMTP id d2e1a72fcca58-82f8b387e8cmr15135278b3a.14.1776768998200;
        Tue, 21 Apr 2026 03:56:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:a83:b0:82f:4bcb:a9d5 with SMTP id d2e1a72fcca58-82f8b387e8cmr15135238b3a.14.1776768997708;
        Tue, 21 Apr 2026 03:56:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:52 +0800
Subject: [PATCH v17 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-3-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768976; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
 b=IfNyRA3MMtWPKSKkwi7v4iWcTDh/I/aVtZaIZtDxu2SqhaxcEJ5RqWM4Ax2oW/BsjCTcVEh56
 z6g3vcJa1twAvsV0woaMVwt9aqWa+lI1iWBnQUvc68LzdDBLo3azEbC
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfXz+qpeiaWybjn
 OhjWzXauXlj8Qafy7kHiII8qsH5C8gs8MQ2/nOwKKbsWJgtQMRZE+jvPhOpC9fvEAFDQ1fX3QYX
 dHEUoBQj/D/ytpzIk6dvKBczDUYqDASCWWQvspxWjmtfAlDdKFNSx8+C8GkdfhDcG1dO5uUJD4D
 Iof8GYvFOE5Wqp3rDzZb5DnzI99OTu8HY5XcH1/HKdYiK5zMrt5qdCd9+rl+f6iQwvRsWxEPq+6
 DTk0y0pEQw/z1J4UQNgdpQ3XhteVtJ+EKQ0Cj7OCMf28wdm7xCtLzJMD9UBacYSG8oImczOhZep
 u2/CRgodGPPGb4XYvF7Xm8m2ojsS4k+/1aFf27hdK3m3IpxmksUFjdlPpQ/xlo9wDc50v49OX0v
 anpHCPaQmVPLytilbriKxKqzKSd9heGBP16yGUYAlWUoWeahljOib+qSDsjMP4HS54ddHJjWhc3
 e7x6ATZW8rhKw4cpjxA==
X-Proofpoint-ORIG-GUID: HCgmaiznVDIfNN0BqJiRvgFbjQEfLsCp
X-Authority-Analysis: v=2.4 cv=eOYjSnp1 c=1 sm=1 tr=0 ts=69e757e7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HCgmaiznVDIfNN0BqJiRvgFbjQEfLsCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210108

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bac3278ef4dd..110eedde077f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6e994678f926..a14645b04624 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1

