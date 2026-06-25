Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9B232E696
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384400; cv=none; b=iE+PLg8XEG7cjZoHqcYvn47mkTI3Ozf4Woauq/oPN6iJrHC/rlNW21VjFn+5uWoJ/sYqftxXbgbRl1mKq9d/+ETo7x0iRs0J3CN6YnlSCgoN5mHmKMCV4AZdW+wr135hW//lpGmmroPksy8NN4VUPFvNGFCM3MfmaN/8WrT/p2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384400; c=relaxed/simple;
	bh=tijaxrXD7Cb53GGSRhRGBOVQmb2AQTa3/Hi3VM9v7z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDAN3UphWc+ZbKV3De8CRj82yTwZIhE7zeOccOX4bf7n5bu8N4pZFl5O3omxPENuJzOjJJWFjVXdr7hb0OUDdxqsovVVFYkvEEaikknUkPsgbF7wuNlzqXFKoBnX2pV/6KceyWaGqgl4qc/qqDAfptmLsmTzacTunsjYFhej870=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAWvewx+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkUPkpo2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAWvewx+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkUPkpo2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jv1F026140
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=; b=IAWvewx+UfFggX59
	QOup+8YviA4zd/pUe1HoM5Fhuq/KDSaOgDuQK3BbyKjQINnZD5SkKQt7DcZkf3CW
	DpzjOVpK7H/JK8Dhz5haHq62lXo5C1uJs17KOZVkjYqgJ18MJx54o2GI94IDLRW8
	9L4XU2YPW8E7F0znMLhZ832Y6QAs44OmKjmLBx+Cl1tLSgMLDaUMMX6nkXMNZNWl
	iTT7I2GyBFvSX0Nk0sgWxN1F1G/XpiNPV6Q95Zmf57cV2jaoEZMZrylR1NNvuS7C
	WpCsijJYDgtgPk60aB1T/dt8PA7/hnOHH7EZCwqGn6um8U6Bq1c/JPCqwFJbVTX1
	LGv4jA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0tspt04n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:46:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6a9bbcc53so20711165ad.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 03:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384398; x=1782989198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
        b=fkUPkpo2K2mXN5rUvdtewRoPj3KHl7vHZvgBNDFJKjhRYm9jBCK3lnBmZQO/ex30TD
         aGBJqNQEzBHHlknA0hfdweTGYf9vKDaqGJxrFJVpWzFRendCKp5BZrtElb9NRj1a+/Kd
         jvwr0JuPV3fw/6V2VYplroNLFCaLwuoenHgz+DhoRRTqy7h+BV91Ms/2DeWgTWN7VQYm
         ExDmJbFLLPETaR/imYpQvujvWgzwYmVWo2EpkGepx50TB/+nkughBIoun1m3Un6TBNd4
         fMpEn4Mj99JKUGc80yTQoLHff5g+S5yGgRjeEInqKYvnEYrvs/3dULOMS58qB4Mhh9ua
         JQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384398; x=1782989198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
        b=OmEDGUNbCeayM73mrFMF/seQhx+enbNo85/qheTtNP+LrpDcNT8hm+i8pnvvn3ukFK
         MZZB7N9ImvetoLzgPmrqxHUybpPxTRhTKi6nyksbDwLUiqFZjZnwe/3SvBhq1eBmOHjN
         0iIwskHtbYQpBGlDcC8gq8anXyVs78EtP2WFvKOauPp4Q4CN7Gjj9NsrJfE84Dqd475v
         M2/WMXlQZNpXYukC2VUcahKqTFxQV8WHKdsQxQ3j+aKdxwF1F9Ex/hTQDsxyAxGtURGu
         gSJ7YfHowfqskgPHMkCVVMPoUvv9VQ1Jzy/uOGDELLI4ZvpjEsRtnGHudQN1KkHUhEHI
         9sOA==
X-Forwarded-Encrypted: i=1; AHgh+Ro99PWN9KnpwRGlGlxjl6BgnjqDft76x7PXJ8kfdKDdj7w3KAOyfnS/5N5w9g95K587D1k8T3q/zx5G@vger.kernel.org
X-Gm-Message-State: AOJu0YzVR9WJyUebcZTu6EANXMYUuUVXlViDuR5DTf4haBVotH4oyZ2s
	5dhhadyxfGq0nxLcresiVxlpKQRFXBioM1elLNGUVqX7ue9/ASNDwlxw7pUmqolVaknQR1+5caf
	NTx+pk78cCC0Noh1hQBmE8c7/z3eXYRyLZp/DcvleRBfcPDND3lx7Dq54RhC4sFK4
X-Gm-Gg: AfdE7clh1P0dngszcIonIKBeuTxBWwkOygcvoj8nj+31jLZ7LhOnjgYGhf89+Aopu1t
	sEvY3ICb9FjktuD+9likCZrOlewTubKjApo13M7ksGvi+YCjM62TLlwgASdIOl/mDK9AfjlIXxL
	0xu+SBI5J/I2X73tjusVJlcrDXdP77z72wlqDvsc3VW+i9U3fsBClDu9Hy0BlIL4fLuyC1+/Ddf
	RHm6pXP/GxbVOL66Ob+NQX9vVcwyAzSWGjIa4BxVXoPWFZgGsvjtRgLkd7Ps5or4eef/KXDveM9
	qDBIo9GGR610zoxr4kcjiMWKkm0RAGZfLPcN0CO+BGc+0mZtwjRQk324dnenKDWRqXivDY4xOWS
	JYKfQU5q/1VP55WDuoGyeH1iTBlw4+9GOHRnSemHfF9r2tjBoA37n9qBsuwCBGO7ilZcROzLduw
	==
X-Received: by 2002:a17:902:ffcb:b0:2c2:245a:3360 with SMTP id d9443c01a7336-2c7fc75a023mr22142835ad.6.1782384397646;
        Thu, 25 Jun 2026 03:46:37 -0700 (PDT)
X-Received: by 2002:a17:902:ffcb:b0:2c2:245a:3360 with SMTP id d9443c01a7336-2c7fc75a023mr22142505ad.6.1782384397066;
        Thu, 25 Jun 2026 03:46:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:36 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:53 +0800
Subject: [PATCH v19 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-3-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384372; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tijaxrXD7Cb53GGSRhRGBOVQmb2AQTa3/Hi3VM9v7z0=;
 b=mAH0BMPCvVpUPe3fys7XXrZMV0kBBjHQcALCqQixnnQY8J3MudGkw+q7Jh1fOiIi8sQK8Cp9/
 AMvYYPUBqEUAsYKHF9x4A/F4a7D8MfQQEHmUBcguH4mjbIrcBpdaSPI
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=OL8XGyaB c=1 sm=1 tr=0 ts=6a3d070e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX5lpamS2sj0Zv
 Mc9T8h2DSFtJdtc1R+bIFFf6B1d7ZbnziROWWwepnUtT7yExCUYH1SUfX9DHZN3sMTlSvtjoKzj
 EErsAZbqTo58tJaJgN+M72GGJYDVxPs8IJo+9+i0KyMLgp2KsXEH844F22RgQ8IzkeDTS7NeYxi
 8HyReeD63VNABW3UehrFLf+sBLh0FZ2VYFK0s2NOYn3+sU3EnkQt6k0KBRYBj+wqAjuWNs3tbLt
 3Zsf6ybmdSUgelHdHuB4IZDLNs/C3wZkzK0JUJKuCM7+Pltz34xFMIJHO5/pDBsfWIPngfFC850
 MmXK5nwsMHvKtmKuT39tyknuIMjeZvPFf2yA+NGgbvHav5BlE0s0cL4EF4YQy7EcciPpaghpnAx
 WMt6yhEpgXYDyeDIidnTibl8K5oVuYC2M/WQIkWBn9gWdeK54+ofbYWwo/Zqa8mHswbLjs7Uzwe
 rcmLKw3WHY1Vxwor9xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX2v0dre3MbMia
 77RCRQThARLq/M/eCv8IKvTP6bMJDSA6A11W90GHLm/H5t/dQ1thxGYw5vr/mamXrI5nSWVio1L
 ZeCIiDlz2hzugLd19iPyDnwQ4owcyxo=
X-Proofpoint-ORIG-GUID: z94731T5sndKrtfLwN5xMIPPdi3zljX6
X-Proofpoint-GUID: z94731T5sndKrtfLwN5xMIPPdi3zljX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250092

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc7dd676da47..4b40b692be4d 100644
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

