Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA953BD226
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768996; cv=none; b=XXiy/SxctZYt/gO+wFbEaMi/CVS34DbxRdnsc+/g+j1oYRntz4YqFkrns8Lr0gzOK6TVN3NeWLQhKCXtlpZOle/FOvpm/cG9zH0Eyi7fvpURW3356wmYNrBYIf9rdeULTs3IikYKdE4D61wQQHIm183oGxoE6jUidpXVYuVfzqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768996; c=relaxed/simple;
	bh=Pfl2LKxPOQb/ac7N9QZFTXlGhGaac/cCYyoTMz4qpIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1EcKq6F3PwSpCDTSPAdGwQtnSsUOVJh/N4QWGIHp6ZJsNpPOb+7kHszF0l734sKBR7g+oSaXP546WATZAASGcATmohCI09pJGIBBth3zz9hGlybz0CE2ZjBWF7Oe7soWTDhMk0zAA7JAw4Mw0ZYMY7TKAATdOM9XKnihWfMN+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6hYDJHL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/pWOU2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6hYDJHL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/pWOU2A"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA3iw51085887
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJZM/77i0yGGMCL2KJnRcbvCvNEOZWU+yEvuuZpru7k=; b=l6hYDJHLkmNNE+GS
	g6KaCPFJsgaUkgjl1iwwY33LEpG44Ya8nAkMOTJBme2Y2zwIU5CPLQN3kG3l8Rog
	lw4DfXTIQT0PjJKVAsmYmjS+p7NZgHP/z2Lk9E0XzKWAyomTZQrGCeLJQL8sjfXA
	E3NtkgtlghVXhkBEK4ckgyAMhlYTkO3WnPBa2p0BSQ75CyqXiwtlZ7saArV3bQ7U
	OSXtJXOPhA1fN4Od3ElbA3LjTSbACWEU5ApWa2xuZWB3WiEvkf7gUN751hCE+QmN
	XYvpSnSlOVY772splMdLMERUfni8G4RYE7lPvony3LEygDMOrL2vnhJpxdvtbSBU
	OLQV0Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp75a85d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7973e22399so1480082a12.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768993; x=1777373793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJZM/77i0yGGMCL2KJnRcbvCvNEOZWU+yEvuuZpru7k=;
        b=H/pWOU2Aec2uYF5y1F0hxxZakzxapHEGmC21vzvyRfmtSYpi5yNHLn5CqwZKsF4tcM
         tH9RIDhKgkDzhl760sVdlwPLlamMW7tNTkwRSFx3zzO7V5G6yQmCC8CoLpQwo01UjwCW
         FjfP3ApKS4m0tJB64c9F3w9sZEIg/o6LUXm6Rwbz8Uboaj1dRIEl+2rzjy5jQxAs3zeV
         NtPxLu6y1HT99XBjCx4rBkuN4jHOCSPAPar/Go/riicdwiqtcmE54ZwLWRy11aNZz4CN
         3kKenaQ1rT1VeXuYhdYEwDj+MStHD97JNQ3aghZk9nAYCFlWTMQJ5ILNjVaOq1ZYcScU
         7qDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768993; x=1777373793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DJZM/77i0yGGMCL2KJnRcbvCvNEOZWU+yEvuuZpru7k=;
        b=Yl81w6uRrxPMbvh/DCDLF1jB/07F5H1pOATsmHlSwJMuP0tj1yXzZhWVyKWTMvZaQT
         RvPMy7eOi6JqmHwQrGwUTIh9MDZusyo4Ro0o/3isxp4Y1XGQLJQAcyTRJAJm03W3A+yO
         j68rM2LTgEHIcKkMVnNo1ZGxrYxHNQi0ZW0iD+NGK0Sgh/qqHW9ibomosGb8jnV6f+pp
         aTxUCCIXHR09FkV5cQMD4FrOrzOAaQftJOVRiBajMOEk4YQkniMnY8nozpLrl1aQcE4h
         eYPo423L+lcKXLWrFTPDFAVLxmUThbx52ccrfT2PH+A4ZJdUtC4e77PVtW5MuNpc2OMu
         7+kQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MkoirwwG1UMBd6EqDRQHaHf2+dKh0Tw6XRdnAyjg0mWxgYcM2sLQU4xKkJtQiSUaH5Gyxhwdaofvf@vger.kernel.org
X-Gm-Message-State: AOJu0YzqnCuD9cVXNBGeufyYV9q3n2ihjJnq9YHRP0Rybburv5ikFNJo
	EeC478dIO1KktNmpbDofodsLmW/ttZ27kvIj1TiBR7raoQzkwGBpdjNsEGe58NoI+Pral8UEPpo
	5QOmIa1zu/Lj07ItSvsXLkuV3S8F1V2eVDsEYKTqxndSegX61zHCWXaBnAKHnJZRC
X-Gm-Gg: AeBDieu3VszxNvHbXFg+/rrdV3QTgzYsvXVEWgEaLc9K4YMLvLnIULI20l7U2n6GwLL
	fKTIvdhJyYR3jgsZVrpR/IZ3+2zYnJeWZX9qK9uCY0cToOnACG6Z3dlpde25SMSHrpJBNmCIESr
	wmMHFuXK9NKJjJ4ItVhz6l9UymaTj33WI3K2isVzigwAgH9KeqMINEeGIePRDnfNSH23T2VTU5a
	a1T2OnIdiKBdg90p5cABAk3qj01lJLPdtoth2YIb0jscmj5BHYivDTgVYjOrD8tKmVDo1G1f9xK
	iYm8SXslsWIxKZLOSexT17jNmx+v9rXMyvNBLFsGP1dWsICRzzoWw6LE2o9mvXJ/ZSGr5O7Lwrl
	BT+C4LFiyeImXwe9VvMCOpHbzT8Ci+kfZh7eYptoC2EemFHfaokldRPWPw55vyZfzeyGolodm0H
	LuPv6f6M9oYvjdb2NJICE=
X-Received: by 2002:a05:6a00:340a:b0:82c:ae0e:dea with SMTP id d2e1a72fcca58-82f8c8c39b8mr15944378b3a.32.1776768993167;
        Tue, 21 Apr 2026 03:56:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:340a:b0:82c:ae0e:dea with SMTP id d2e1a72fcca58-82f8c8c39b8mr15944343b3a.32.1776768992628;
        Tue, 21 Apr 2026 03:56:32 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:32 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:51 +0800
Subject: [PATCH v17 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-2-9cf36ff55fc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768975; l=6212;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Pfl2LKxPOQb/ac7N9QZFTXlGhGaac/cCYyoTMz4qpIo=;
 b=DgDOejqKQhCI2nwimlAlmoNygLDk2TZVQ29ul84szOehWNh96uLe+mHzGpAcgz5HP0r4TksCu
 /bm0DZ7g1uDC6NaKIk1GMN8vB2kMPqEdGI/CdBi6njNx9wEMhQbUrCz
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: Wu5Daw0bcI9iouKr8QSnwfykGFyjOr3s
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=69e757e2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Wu5Daw0bcI9iouKr8QSnwfykGFyjOr3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX2j3gfvXgwPT9
 iBJyTfcpzFeIrdCuoWiqAO0bq47c1tOddcJs5McQulx1uRJLy4cZ4OPhrERmXsYhqrTb+LOPa+A
 9yKbFR+UFglwPnI3CaJKxRzosK8eEy0ZOwEAEbzVXbirzoUcMTpkAKUrsbF/clc3GkK0fZRsuZD
 sVoYZXG7U+FaoKC3p5lIFfaubo45VZ4ySQfHY4ibpePwoYjw+EvR450VyHI5Q/uFzReDtVsKC0Z
 Z3jUwgBysOViXjnu1tR/Ldml1tbNQN1ILDRqXpm2X5WsKWRtN7eWjps+TzvraaHXDl2eaVewdvR
 Oy7CirUfylolKsJk4ztu7RdWsCVUmL9tlAJvsRnQ9+U9Dm9Hgxl2VgG6eU8mkv6qmng5dKV655w
 soaKettEz+lTp+KG4bc26jPc/nB2D9kEELYJDOPPCXf33k80mYmQkIsO20Cu0dDkg9wB/mS8Prr
 /1X3vQWGLwaGi0WgUKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210108

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
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 99 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++
 3 files changed, 117 insertions(+)

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
index 4dc1defe27a5..ac704617097c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,105 @@ const struct coresight_ops tmc_etr_cs_ops = {
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
+		} else {
+			new_node->is_free = true;
+		}
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

