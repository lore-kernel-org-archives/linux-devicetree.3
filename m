Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03621402B8B
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163171; cv=none; b=Z6NjVzQRD8tQc841tD4ZYGIznjnrYIp2/2iPJjRXyUlbQ/c+DzpaoJr63cfk3giUMu8Elw1GRRxk6lTrLGVZAd9vxgwjCrdvK0xpC6+sAIGIHoe+gxcW5PYbI1UW+Pq2TvRawYI4pOkmx6asVLBftG1D6+RFkVSaSVm9mC37/hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163171; c=relaxed/simple;
	bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yb+1xx2posmnwpUtUTOG3TtjdjeNTDibr7VLSg/1fP9wtu7haCf818d/IyTxdXGh1bYudhuJzY5mgxM2Zk1RB307J5OwaC4riQTNEq+fP73Knp4Pm3Q6lQZDjNM/CM+p6N7GDrwXYYxATtsM4MRv8gbz4R0zIHxzLwgcyv/G4yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jitw2C6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awD4VXD3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jitw2C6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awD4VXD3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479v2SO1669567
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 14:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=; b=jitw2C6hr89DuaRB
	h9houTJjaGIp7/rZdVggYv59en0kXLhQ4Iflw9unHxSsn8pqRg4CSBlRDyxVgYvu
	dSmxXyaYq01/84Ech3GGoNpYRECMU1MwuCTha0UtUeIIZQi1PmLhlNOe1ltpzkRO
	8gwF1FQF3kOphNH7V7g6XhyiGe4cYXV5qvlJxXMXQGDlaQQEE5RdPFpW74b+pPsg
	IAQkkVNSYKooGi8D+tH1ED/ooXojJFVbyCRZxC2Vn2kjf+ywtGleio7oOUhHlX/E
	Tz79hCjqykDnCxeMdgBQ8JOOk/PgEhTWWztIily5xSbLFXdKWI9E8aS7GC3+pUVp
	JnHpSA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p27m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 14:12:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adc527eaf5so8104095ad.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163169; x=1778767969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=awD4VXD3VXWiVxsC5CxbE1NOWfmhZVoRlFe68wpIL2sGWI4eot1eDnkghghIQwTPYc
         oK2e+PRSgjTZAuTEF80jCbaNWViHqMl0AiqmlBpzz0DW2/NM6av3UAB4cBJqO+jhqJH2
         Q4MKNZwE2xI0GVeiXBDQCLO6UmKyb80wjolHPZCsf+KseAe6ZoDCfw+jft30ogeNX9xp
         98xTtb/9C40Ddqj+ROfb7cUU9iziQZSQjfy5IrDeboO9JV/W5236cvf/vOUpLMYUHHWX
         FBwtQo4IHEFS23WxdOgkcvi9MEsJ10tRIJpurhrA8Ias6Vr+h8TkOfeHMUnhL6+fKkT4
         fiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163169; x=1778767969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=eaQaBZGtwM7J4hQ3m/4vV283J/cMUbfPLWw8d/1Vr8fG65ifEV6VYOgOYibjgjX+rB
         FcpalCSPL+6dKItabKey62M7IgS+jjMP4sEUs8MC/j47W9hAKckBpTIvX/xg79rPGRyM
         bo8V8kKTH3xvvwJIhEbsnuh/OxmKaVGKUHo5SFgmyp1/pV354AwP+alEWSU7/gpyR4TI
         U/aTNTzmTa/3c8WfFvoGhITfjwA3+YZ7k1YkSBhbQeNZqXLuAQU1F6PJWKzJUX1njncC
         qCcWrRSMepQ6dt1F6K9jGzRUUuWNdAtyfKkFgAJKeyJdwd4rg7q6SKVEsXZD6f1YzHlG
         H7YA==
X-Forwarded-Encrypted: i=1; AFNElJ8668F8P8xNinq371Y5Lehr/sy229pK6SkIVf/n0b4+b+Y2AZ6AV5Ar2QCcdwWBQxS3vg5TEWKFE7rg@vger.kernel.org
X-Gm-Message-State: AOJu0YxTW3qRR6SHxbyNO4AELoJUat14uLHfYOFvxCPE64/tNEgmyywK
	DEsGRapxnJV2tm6d49ire+LnFJiKD1woCddrlID8jzoMJXEDU7y0HQRPp5/twRkBl9ah+gyl6TR
	6qP71HDJTaGxZvsYAUN4dTF9h2+gJYwZKgDIsNCqoTAAQju35fVjb8wx0eOIuXVld
X-Gm-Gg: AeBDieuq9RaIzwtouJ1dKEZVWVMavHdjq5rgMs/vLyITdzH3TqreeQOm4KXNXBzIWII
	WjMgGJkmIZi6BqvpZ68s9ALwHNnZfl97ovARn86MGVZdQcePd6ek+HwlY07cryjs/ySFZg9eJVE
	N122q4jV96aCLRXWzYHKFT0mTuQiDvH6kaRw1rntedXvGqOGAWzEwO/pi6yy+SXfmEYS1ptG8ao
	WFHISAsP0aziKlq9ceMBL8M3eBI7OBg/ecaPU+uDtuV2eckADr6YzmEpSZr2G5ihp98oFiIyRtz
	1R9voAdutm2sZx+IQ28XoS6nERZCPS2uneE9QFP6jw2KykN8QekgVpn/0WPSdBCXc9f35q1ZVFI
	OGnrfLjX2g+H37h4zmIf0qhEGyBNMxLg9ZMxGXL8dd3Sp4ROSDNZCYOpc94ohV0379wi9mW7N0M
	mSfN9kRQ70UGG0h1y97CU=
X-Received: by 2002:a05:6300:218b:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3aa5a70d15fmr9272537637.17.1778163168475;
        Thu, 07 May 2026 07:12:48 -0700 (PDT)
X-Received: by 2002:a05:6300:218b:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3aa5a70d15fmr9272497637.17.1778163167982;
        Thu, 07 May 2026 07:12:47 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:11:59 +0800
Subject: [PATCH v18 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-3-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
 b=J8K9AyTEoZRr/lTm4JvkvJEyM/VdCHv91RJsmSKJjhYdn5mAM1Y43UtdsxcX4p4+yrTPUWy6r
 lhvv8Slq1ZTB5x4tKb8J5ayczH2e34PcL56K7HA6InlzqfnNW2Zch9d
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfXw0iXImDWClox
 6lSGhiaxJypK/Hrg0zy7bFckWuxISOOVpS0dSO2B6fNz7ozP+JlP9xqWTjrwS6S/H6+muQi2yTm
 JKYhzrXkHVgTdpvbraxymdRZfPnbvIDoFrlh+CW969NbaPjSxj2Dbi8I/VRCttnsI9h6Ncs6GnM
 4Xb2D+8lOJHsAQSY6JcslXYWf+lwWz0T8SqYYFBOvFeTXqJCd+8PgFL1nE/IBzQXg3riZ3S+H0U
 IAenmQ4O9xfNvoDNcHk8YXsdd2fzgperqnk13BT21b7jR0ApB5/KfFvgVlRtaZDXgYhqOootsEA
 c720JHEnkAL2iVOJpxCsDva2Jwn/Stw09XKHfve+XR6LNy6gU7QnezNf7aXVKg6qyFPmbXEY2Ui
 P4RppoC6gSA1pHZdWZ2U0SbgjPC0vwgwZxDPQ+Ivfqei6Yr0aRk+W8Wl/bizAHsWdMs2mbc4r0y
 mLFMoY1d3Ey8j+BgBsQ==
X-Proofpoint-GUID: tbnUB8XQY88YthB3bLcKLK3VjpZbPdaJ
X-Proofpoint-ORIG-GUID: tbnUB8XQY88YthB3bLcKLK3VjpZbPdaJ
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc9de1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142

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

