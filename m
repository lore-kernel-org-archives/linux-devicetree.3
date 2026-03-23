Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5003876AE
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259407; cv=none; b=Srfe+jtWsYvNJfRNn0FldnbE+kPjm8+HRAbKMKZSTLYAr3BYaJXI5O3Vj+UMQkFnj5K1mEVhvdKNjWEHvOcJDGP2iMAGwHNnszWGL21wmP7bul4PUo87Dok5GacCUQDMEBrrEwF47EOaNbh+ha3HsD0EtenPFqAcCpV3Q5QGv8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259407; c=relaxed/simple;
	bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wj36Zro+3oxj47gxuNi71dG8pO+1iJofheSpWW0QbCb8XUm0vZy8rS/WK+pMohLTMivgxwW/AgvWWjTdWSuKyYPrvLrqJBwoUFZwktEGhPfC+9A1W8zXJyA5Vq+qsMtrLW+CT6iw0tquKPn6LnNpkzPfWV6YOeQziudda86TdaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bk0WrT8e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGTNvID3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bk0WrT8e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGTNvID3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7JuR0443182
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=; b=bk0WrT8eGYhDHQ/8
	kTp58Qqov/XMKk5Qvbh/+vkZ3MFovJvBlCrkXh/ssLFW79GgxvDhVT3pk55DEPn6
	87/pTCPXxC5naCzh+wB+wmFwDZvvW20cZAv/iYk38QTkqrj4knQI7DcD82MPz9Xh
	UE1Pir65UHTM2AyCaPy64Ag7yftkpSO/jLBjY3wYU7T8lADXS1iUqvuyoTd0n8zo
	KYlYUQVbehLFaIruIdjYQm391XRKZe5jueXGOvaPvFH/CIwyTsE0K5DnA2d5kzEh
	RCpYmZztnZcjZnS3TTopX0jMShQU+tYHGTUDG0QHsvTJ9HmSy7yi6ilqLNu1i1N7
	1vzN5Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4xc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7381a9a932so1593353a12.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259404; x=1774864204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=VGTNvID3+Wt6dm0sFUsx61s+l1OzXRhofzUU/WE0SlMe11onVG3tvQY5Wz6tQ2PxQD
         tL9RsSlwGeGx6zLXN1nVnkWyUzXXnp0IBpvWMG6TjnodErcIve/SF/N5G9VPDyGCA2R9
         XWk8fZDVbgiU1seZxtLdAScY1V2mCoxttWOEsGRMLHL+FV+BF3nHU4xZPGta67SxfEbn
         VBnDP570yF9lUHJYfNbF4ACqo+OGmal1d2KsxCZjxzqMj8z7v0UQoxhWOKIBS+EZlhtF
         4vPcj09OTAIBJC+8NpEzIJj5Lixp3UZGKiJMmrN8IP/5jll5t8euHp7QrJzUBLCFAF74
         FTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259404; x=1774864204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=QNdnN4yUTuU34qJ/9fbA732s7q/xPmwTAo7sN6JP7ujgPOgf4v0KFLdUvLZVuEYvfy
         Rdd4DMYPx5V7AnXQlexLK4HMob68GvanVeCXigISr/4EH9KGi1+pa/HBTIWteT6M+lYy
         06NeSbA6dP95ucJ5y4885KcHgYGOTMP+DAj8+wsqRa8J6AIVxdXQiQbSeUaXQmNeL6BD
         AftWUEJ2KMDQFRlh52Fc+HmYXWJKrLt97uH1yYHHYqz3YRIzzZm2JXGBp4eZW/PHqPpA
         0v7Q4CdM+q530XW8VtJ6D1NfZ5DN+fxzN9SSVHE4JDzS4FCwg4MayTtNx4YE7zxqbvMb
         N3ug==
X-Forwarded-Encrypted: i=1; AJvYcCX0ODnKCkvSZBCTYY0FrfdbUmVpmjf09s3wwBugS0ZikT+H9iy9PMb/tVG403IiB8biD6FNDZGLzXJ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5HICHbaCuC51CU78i7q0QIeoFVavuoyGWPMv3oKtl27iUMJ0s
	iagVCtb3HZijEdIOqJ34IbN0Tf0EdumpW6uJMnmgc4g2vdT1BmhBrBd6kf/QoB/JUOnd5dwzibX
	NfKs1BPElsnTYV0M2B8B6THQctinT2PRxEvQBHmxDyzYWJbwwSczu5RBs5P4bgAqf
X-Gm-Gg: ATEYQzyf9si/DH+XHokwRu42ObrWOakeFp+YLexnwo7OwfWDReePKNxzoRzkKeu2XRN
	NA3A7WwBLa9v5Hwfp5Xm9JL733uvqiyFLUF1tZpfC6om9fshHyqfol8Y5lk2Mg1WoUXIo6xu9hf
	UMId5sttowesb6BKzgZahs9tgwo4cTRs60VKH83dr9IXpKc43neM0wuX0xam/PYkF7hmT5YIsvg
	9VydgVbw05+34LkEryFU4Kh0mGXMphbkKr/WUQ98vdymLgA3PCazJCsvJ+fyJFGiXZ/NGcQlHSF
	890AkO2C/AeRKYrANFTet++ehyNU3liOfAvCEw0H1PjTtN4DqGT73mX8IzdpOxNEtJz2OxuizDa
	/Y0GEfXMganqVoVfPlR8bjeXusaQv7Fzb+vqWd6dx0YWFPsHZl7WWwnNupkyNNip3jDNpEAXlUV
	3aO1EWr+B3
X-Received: by 2002:a05:6a20:7f9f:b0:398:7765:29 with SMTP id adf61e73a8af0-39bceb4772bmr9781618637.34.1774259404268;
        Mon, 23 Mar 2026 02:50:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f9f:b0:398:7765:29 with SMTP id adf61e73a8af0-39bceb4772bmr9781586637.34.1774259403738;
        Mon, 23 Mar 2026 02:50:03 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:50:03 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:28 +0800
Subject: [PATCH v16 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-3-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259384; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
 b=wvKikvtR4w0c8IuBLQ6hNVCfOt4BETo1zTmLsmCQTrdtpNZ9EdNhVWueFq/22fodFb/JLm6r2
 a+mh0krKnULB0lmLnSI0Gdnj7S5cJ3qWLCjkDmSIZa5e8x1rjkIgcmT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: lPjJf4WtYmKSVaUB5zX-mjuA3rV7SdIL
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c10ccd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX4LSEI4qhO3k+
 P+q5/jQPF1r84hmqekYFqbWTGHzvT8hJLRaI4XuvesL+zzYW+MTkW6QDD86lRn5YmAeG2JMHE5R
 4ltHt4hgOyxHbe1mlzoT87m8V6cs3ad6SReOOm7XZcqLS2cl3nu4X4GQH7drjT1wdcyA0DMyQ71
 fX/iPKfqE3FaJwDyGNj6pcAyUJBCAzIzYps7Bfxa/0Lf1v8mBLKYaSWKUmEQ7OctqdJPaSGzv2E
 8aV/DVi1SmkI33pO/9Cb5E+/g9lIS6DQbw2O1JENhdIPkfv/zIPA9YKsF+xCQ+E4kEigd10oOIz
 T0LEaEtJ4nkV2WqPeekXpAqSzwKx0KXpGuvBDZ2ysIHq7sVG8Ogm/E+1Zt9qXP/YnLGdG2eTYoI
 X6PBVvjtf19ypXCHTlajdBINtV0xQfebhaQbDClsePej+w+6JWRJu3zDj8vcTOrVN8RQIaiSdpz
 vmYgXnEbLo6o/M2i5vw==
X-Proofpoint-GUID: lPjJf4WtYmKSVaUB5zX-mjuA3rV7SdIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075

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

