Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E3E3FCB38
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 14:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163167; cv=none; b=lWbl8wa1+7B9lW2OaTUYCBm7fbEJrH7OSisjrCnh91rlgbZAZyDL8YPaoNYF1e+S/EMXpfhkP3eFnT2aC95EWLtWICchWMsjdC6AoAoSH/zUmiY5G1HJPruU8qDN2lSsIm68nYQMweWVtvi5kKLauZnOH/zvgT1eX18QinxMPr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163167; c=relaxed/simple;
	bh=hixjNT1jMkq758zZZ1hEzrAx1L8FCxRRm5D2VujRxWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QV7/xYbqFVplz+FSdHzKDKCkQuSqv6UAHeqssi5HOZRBqnGVSqqI8zAP2iZOMK1aqZN8NCDJSy4Q3VJ0LE+kP0dGpcaokvdnaTMPcU5MS9Ek6khv+8TT5kOi1Y9gl0lXZ7d8N6GjxW1cW6GTPlYYH+z3/MfnCx8W39aVu45Bevg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mD8BaHm3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MsFHm51g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mD8BaHm3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MsFHm51g"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647ANViA152860
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 14:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNjLWVZN9ymVqqwg7nxMwcVKTOzZb6j0YCHbt9QKnGM=; b=mD8BaHm3MLAwaIZP
	u5sZcxhdOeMzMDqeR3i7XG2l4WBe3m/MAZ3GdiI2Uv07+VsclECVbd2OMo4M4l2C
	6zgVu7Odiu8kYnvRjcGdfBNcssTZcNPx096Py3UrVl1VAdRWnO9y3fYCl7qNlpLc
	7LhexuBoU1AhXZeR6Rp03CbUHuJFIiFRy2HoURxx/c3Xx162GGaRX065LCUQp+St
	5RTK5bGy7iJJz3RImUKMj1MvCPt1KAO+DpdI++mOcHK1jjxx/PooEGFx9OZdyEOA
	Zxl5MxHKQjHfpHdHyiL8oTDkcNfeQ3m2H3T73jEaM6AolNyNYICo8knZBqBFmYIw
	AheKKQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctt66h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 14:12:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba3245a43dso10165895ad.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163163; x=1778767963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNjLWVZN9ymVqqwg7nxMwcVKTOzZb6j0YCHbt9QKnGM=;
        b=MsFHm51gK+wYb/kI+jIdsRx1izMweCjUSQFZ+ZNATk3gmSk69Bo86VClCl0JVaC7Mg
         2hRI5EdL1Mh5REjLRSBLwOwWfwEcC//EX7eKO/b4S6H9eLcY0tw9HXNHDHxbXbwwt0E7
         zcuNWv1qUKRDHtlt30u0ZqPxIsdXm2Rox3cR6TPH2pPN1p7fz6SPx21KbYX5+zfcLY+S
         skFlbhF1LeXH7ABEhe89NpNvJbG1nJhDw5gWC/MSPVdv9AZkNeGcXXGtgRhclCqvhapH
         5bL2hrozxItVQ2vlRLXAyEbDSqFoll+iXl+mgkDVQsBQNMfdoGG/xoUExdBHXoS5A/QY
         CsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163163; x=1778767963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dNjLWVZN9ymVqqwg7nxMwcVKTOzZb6j0YCHbt9QKnGM=;
        b=O8GI3WaBGQiWeqqKKa8UG/yLEPg1hd6KaLudFA2sfNKGic7l1G0Pb/OfKBu0FVAsyB
         Db70O9HAl02qdm9FdDABiugMkpM6ROjvPmMyPxXMBX9XuBBBKawlHF5GIsFnJGp0II9E
         1JgtKvjQi3YZsEvN/lzYmjzT9Uw4ujCT3RQTgbaexnIliTTwVObFXkPLPYYhP8LfPpmt
         lWhAD4ibrGVaFSe7ZKBvjSY0eixMIdCXPtCBoQa/odqTojichx6HF5xU/hxA8tb/ZXsL
         fZtjfSjmO8gHmw7DJDOk2rf97ztkbsDSb3QYE5zY92cS2gHC1TAm1ErBLvR7m9yl3nIT
         2tcw==
X-Forwarded-Encrypted: i=1; AFNElJ/uoPOsggksvY5u2X8jj6wriKtRfsA0C0t/pxOzmno8NAwZqzBBIqOOatEhk3sbLSEGYrTRKktmY2Hp@vger.kernel.org
X-Gm-Message-State: AOJu0YwL6MfzivBMBkhb1nVXTY91YXHJeZv5Oohoa7zczCFjdA3B6vXm
	NuiTfRSkAAGxw5i2QrDwu2chjRY3iERm0CZXAqPPjfTRoYAI+ZzuwWYmK1LLgLKqtWlTVq7zgte
	/NmV/Q0qb2M9Q2FESpg5U8LtFq/qQUe+MH90/UDmA7Wp0uC36HJARDTb0coFkZwdO
X-Gm-Gg: AeBDietH2OzV4ZsR68VqIkLVVAHw6HQ6mlyM75wrVBoNyZC5eaA9Nw/pKQaDNt9FVEl
	1Jh4OXrLZQgkDLFceM/pUaMZlhl4Mb4g31Q4/+OJvTJS5QFe0WjHdxOvTR5e0r2nN1bc0/DYe5u
	oK/NNthu6eQOP8JHGIZvKEPfaoRAW6u52YTyiiarYg64IvtthuA68mI/LU0BkdPvgCUaoTFL4AB
	eCaOotruGwembBBEJ9IBvRF8aU3S/o32WCEe8e4Mw3gqp8BUwjwoYMJ26VU6LZgpzvp/48OGkF3
	LemXkgDmISIc5z16LoKhPqivVkWhtjIjpzpd8D0S7sv2d1y/YIPLx0MZ4K9fq85r6UIOHZAYplr
	iA2mK3wWCs8hm0FXbLjCY7ExMSu+hKFlMf2lUE84BNuBXnjbOfaLjPrsAvkNf0C0bY5rf9lXO+z
	FqMgFmByTdZsb3340zJbE=
X-Received: by 2002:a05:6a21:3395:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3aa5ab5e038mr9423433637.27.1778163163400;
        Thu, 07 May 2026 07:12:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:3395:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3aa5ab5e038mr9423372637.27.1778163162865;
        Thu, 07 May 2026 07:12:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:11:58 +0800
Subject: [PATCH v18 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-2-2b2d590463a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=6615;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=hixjNT1jMkq758zZZ1hEzrAx1L8FCxRRm5D2VujRxWk=;
 b=wGzEsqp85TWlVQzZ2kT7yOm4VW8XctBS4r24DeLT9H9rJAFZwpFrzKLX95JGw4H0LaxRm6k/N
 cSprM1HBNr4DALEpeUXrliKZmBhBMgBLMIIqZgfySpjxbxG0MpK7T94
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc9ddc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SmiEMI61MywFhWxRikMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: G1hMqtmvETCD4Efdx30RWretLqXSDFS7
X-Proofpoint-ORIG-GUID: G1hMqtmvETCD4Efdx30RWretLqXSDFS7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX3B19cUwth8EL
 qHvUUI33be+p1ZaPT8U51hflFI+sP+r6X3MVNfUDPDBWJFzfMGbuFFf8P05iodB2wIB1SSS72ET
 7QcBOmLPrUil8KRctBNyz104kDgmy4izo/00Zt6qtw+kE6LSyhz/eKvEY9WfXajZAg2HCqhSc1+
 HId8023FVA0Y6WLTxUni5DT4Gm+PVDNTX2loOHaQM68bq2V5YUNTwnnHeJcHrzH/plaYWODPVhv
 4Td5mLcy5LTtCm2+6080CWqaytmjDDJYA+hGCeC4OM2hdDo1gBo5RexVE6AwzIykMJ9MqxrNouw
 DwQ0sq1YCEe81TgG3/h3CjVf2BnnR+hwIyMTjAcJbu48C6AZW7aGuA/DOdW6UJ9WCpxRY7FQPTQ
 xIHHhOhauIo+xBRfol/n79DGpbr8fKquZofYuGDlgH6Xo2zoP60t2rCZFsT8DvGofzO0fHyal8z
 U3x+1yhpReSEcEeLW4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 105 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      |  17 ++++
 3 files changed, 123 insertions(+)

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
index 4dc1defe27a5..779d9e479aab 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,111 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove all nodes from @drvdata->etr_buf_list and free their buffers.
+ * If a node holds the live sysfs_buf and the device is active, the node is
+ * removed but the buffer is not freed; ownership stays with drvdata->sysfs_buf.
+ *
+ * Locking: caller must guarantee exclusive access to @drvdata->etr_buf_list,
+ * either by holding byte_cntr_data->reading (byte-cntr read path) or by being
+ * in a single-threaded prepare/teardown context.
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
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(sysfs_buf);
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

