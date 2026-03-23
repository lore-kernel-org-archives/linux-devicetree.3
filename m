Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0247A387587
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259402; cv=none; b=ity7BNvaZCDGH5C+4ea6ajWZlg0E3N9NwdSfzDc8b8cfTS1qMx5CKKnSDiGzfWAAictnPu35Z72IEgLlJRBomsYXSXTApefEqXpK8hXca6Fhd7IKcmFfg4ocEtcSrOlPrKv70OcWXSgJS9pjtrhBx0YHgZYOsewOJRAgM6PLURo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259402; c=relaxed/simple;
	bh=FFceOaqM6wu7CDdoDhopkNKARk15nwOEHek364eGNLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1SpfngfjrRqzCkjXcI6X1C2xiqAnu2REWEtFwEu/Fv2PabD0ZrsG+XUROlHZIGnZ7L4J8N6kgMbdREYzstSa+AmbgIUO0FGLqSe4jqB7XZ7KbtRqQ/olqwtWP30QT3c4w6llCENXH50tOt0AVK3Iirl61S3ILBOCE/WHNLaGqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/v5HfO7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dp/O4fWx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/v5HfO7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dp/O4fWx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7ttKJ3468155
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTJDJgY9ATjCAHRG1W16e0NWqYe38EB68qyE9RQn52c=; b=F/v5HfO705xH/vJB
	SbtOD/UJD6A0luaLs8qQTTMKjZK1pZymr3FST00FbGEerxLOcogUuB589xEbPphy
	hrAzmP6O6dDKAMp3OcGbsxNmhBpF0YLOi4upryTxgS2vcq2d/Osa8xVHsXOC4/g5
	R5XnMphB3DXKvtFYtNAViMlOsDexgm4/EdVWfbetedbeKkGvA6GFsBJrj0lPySmn
	pNThk9WcWGCKOdX0ZOom/OxX9TYiOAuoD5XNaxfA1JcEbAEoTs1GpKbXTLn0l3yU
	sf+OLw8kG+lDgrbj0jr+niLuH9wr8xliur61mwAbQ5VVGzFxIBYE9+W1Xcjtbvew
	jm0H3w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jggdrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a032cdd78so2831156a91.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259400; x=1774864200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTJDJgY9ATjCAHRG1W16e0NWqYe38EB68qyE9RQn52c=;
        b=Dp/O4fWx2DnGVDRs5IKFLRZUpVXeakcisK8LdU4ohaklkeqxaoen89Ivp0ME3elx+8
         79IETGf4LtPBLfDSnJjPAFwiBRiWjDwhxSdubktaaM69vmIAe1sZLj4YpDkIFvUKmMdR
         dZpoiV6wur3xRKVNA/x14hW92dwg1q8TvGwURuhi38pJl9M0VifeXjASeT19BT4yLkN9
         Uq+0IFKYPVWxW0CFJq6oAtq1GEqnmn/lnVmtiQiu9g+F7LdABKe7wiL2YK6fp3woNwHh
         D93bJnZRbfL0e0Ju9uhiHbo3s4XbvSwOaPBu3lDR5urizPvRN+98rz3Qj6/fwAY7vqlu
         /XTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259400; x=1774864200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTJDJgY9ATjCAHRG1W16e0NWqYe38EB68qyE9RQn52c=;
        b=GdZ0dpDmAsaH/ySfjHIwawI3PTobKLzxXx5g5PHmBhApw4+4erPz0PXFDhFQkTwGqv
         /Wf5AvO+jarkZIEEVRV+WQ38CUfRxXWvYZjq1kieubw5gf9H6GBY9j6Y5t84E6tdBnyY
         9nsP3d7QzB2QlQhK2jYESkcbJBu4K0MQha5I1TBdOIFjzDdZGLvi0PKKzL37rK/RAz7l
         3r3fixhMaWQBkVqaFby+UpH0GpjFGMKe+OZwYlHnEXq28iW01NX+bti5tk9XxV5CjO+J
         fyxUhaqJgkOcV7+wSoAyu3R7Oa7Dk1t1PNxKC/Jox9IKYvpjsewggiBB0TQNCZcwCcNf
         FcMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2FSPrIO3TKNyAbi32WyJcFnB3XFvsYnHkJn4fJ1OJpKo81rSS7RX6ZkrnTJGA3MsWRaV2Kc+EBFmG@vger.kernel.org
X-Gm-Message-State: AOJu0YxyTUXG3QmhoeWlWFL7G2dQUkb8rCa3ZYgBDey7XDd9ls8YOp1V
	Eqnw+SxiifGy+RRSR4BOsJxkQ9MmqT7tQh5DJ0Kc7sX0dpsr6WLViR1xFYk8ejIRfyEPj0fGt/5
	RWFXAc8COH+C8ym9hArNfG28IkrM9+b8XIGJUr3K7CYwYX80mELtYnMQzjIab4apc
X-Gm-Gg: ATEYQzx2d3/1qw8n0NyFcJN9RMfxstMtsmybTa5ZRQMQBls2NlHCAAJV5709Lx/8u8p
	OWje20NZ+EbznccOFXEZ1gq74p03DZeFQbGXdd5mKpPynje1RGL8Gn9aflBlPmbGs69OEexyS0O
	tOtnglSgTXrqG0OHz3sQYptuTMnEItM6+AV2OWbaHDcDOPENjDTqsLk55PfYdFDgG16if5NNnN4
	FEvZi3DSzwV9o4uhFjhi8rhDTErLFZ9g24S/3yP9OY4abMFRmTXaA4evIzthrXZWV2jo7F5JK4T
	WLQ2QFNEWm3g0iV+lzZE0B1hK0ZI/L/IkeUQhBDSwjcTU8ZRl1UCP417up7seMj3VhfsHZ+ryAP
	7wbHoO+kqh02Pu7GglGSO/qM2aV/0m2q3M2XDzisTTcaXx6hKoCzAZgyoSI2LGGqFcTYgbWYygR
	ctvq4o92c5
X-Received: by 2002:a17:90b:4a84:b0:359:ff8a:ee4f with SMTP id 98e67ed59e1d1-35bd2bd8b5cmr10355272a91.7.1774259399444;
        Mon, 23 Mar 2026 02:49:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4a84:b0:359:ff8a:ee4f with SMTP id 98e67ed59e1d1-35bd2bd8b5cmr10355240a91.7.1774259398986;
        Mon, 23 Mar 2026 02:49:58 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:49:58 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:27 +0800
Subject: [PATCH v16 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-2-7a413d211b8d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259383; l=6204;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=FFceOaqM6wu7CDdoDhopkNKARk15nwOEHek364eGNLA=;
 b=IxYt/7EWVEDsCF4b7tnmVPQ9RVLcT/lR15WOFzdR6hqbCMhYuQEXRluud+4FVD3Lk5YXocrsX
 oWbe/GW9qWtB6KsrbrOt6MFOi22gzWTP6IOOljrd0am8sPMzK69IDG0
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: M_N1vqtDwD2XhheTPmdH3SY7rq1YEvnv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX+yPByWcswgOi
 TWZuHPBu0iE4LGu/+SgF0P3ngaA6uGFlpgGwAoFmDGB8k4WPeW3JLwEboNDl7FLfcYAmCC0tbUG
 hbUMmmHCHzIDMOTNo3tEGNtB8b3hv4bXg1pt9JD4BeiDttWi9mNB4JY8As6wD8oiUi+kQA+5ubu
 +kUJblDJyVCTfLuL3zSFUOy2GzANX+ALzlZqui9FCY1ieD3diA6bjqnhegAUJ6q2bbQnr5oLb4j
 3t/bZnMX/+67A3CfdgAgN90Oav5Szj4y32IIwU8Cxwz7zIygj6g2ojJAoY30XPafsIOfQV84G5X
 9zlyhp1nCkxbujXaqRhmJGR0KO424cuCn/4q4iGOAVJdpFP8ewQrP1Uo9nduWXw1AyRRX68zAvc
 /RrkhQlyCIgrypk0bUOuHBHmfXBIGFUsL9fsTzCTe0yOY5SQiveUUp7ZL+hw1EHo9AiGXQ54r7Q
 FAi30QTA1BVCer3Adlg==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c10cc8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: M_N1vqtDwD2XhheTPmdH3SY7rq1YEvnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 98 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++
 3 files changed, 116 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index c89fe996af23..bac3278ef4dd 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 4dc1defe27a5..306982e88dbb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,104 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove unused buffers from @drvdata->etr_buf_list and free them.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED) {
+				/*
+				 * Dont free the sysfs_buf, just remove it from the list.
+				 * drvdata->sysfs_buf will hold the buffer and free it later.
+				 */
+				nd->sysfs_buf = NULL;
+				list_del(&nd->link);
+				kfree(nd);
+				continue;
+			}
+			/* Free the sysfs_buf in coming steps through nd->sysfs_buf */
+			drvdata->sysfs_buf = NULL;
+		}
+		/* Free allocated buffers which are not utilized by ETR */
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+		nd->sysfs_buf = NULL;
+		list_del(&nd->link);
+		kfree(nd);
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf;
+	int i = 0, ret = 0;
+
+	/* We dont need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/* We expect that sysfs_buf in drvdata has already been allocated. */
+	if (drvdata->sysfs_buf) {
+		/* Directly insert the allocated sysfs_buf into the list first */
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node)
+			return -ENOMEM;
+
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (!sysfs_buf) {
+			kfree(new_node);
+			ret = -ENOMEM;
+			break;
+		}
+
+		/* We dont have a available sysfs_buf in drvdata, setup one */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else
+			new_node->is_free = true;
+
+		new_node->sysfs_buf = sysfs_buf;
+		list_add_tail(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..6e994678f926 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Offset to the start of the buffer.
+ * @link:	list_head of the node.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	link;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +258,7 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +289,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
 };
 
 struct etr_buf_operations {
@@ -447,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1

