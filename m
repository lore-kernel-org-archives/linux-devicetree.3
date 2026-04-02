Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4403AA516
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122160; cv=none; b=FS+J2o4PXqWc/Bfg3QvtR6/xViqExZwbNyhdPmCJt5Jlt7UtTbfaXar2jmlroAQHbv6o+0FQQxwsO+Af8N8swBKD+K1N/x/7f4EX6oz06Vcuwi52KFilxJ31yVqA87L81rDjWaov7bXsfC/3KPTwgoEfYWqA2LjlO1DM4GjYVO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122160; c=relaxed/simple;
	bh=u0RTqoRtgeoqSCDkkz0FRCIn6kIQxtQe29l0ZLG4Yrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/1IHzPUwz4iweT/nz+9l/JYs0Gw7o0qxsqmzFbMG0Ow2YXPVtFrR4lOtgAmFqAUe6pLvgH5THA4HvvB3DnvzBPXiYbg1F9O9AvPUJBU0l63dWn3WYMYQFF6qm4hcQNo4bHwQes2iAsqL8rgOcslRQOhdEZTrU3u6rYgWo2L7BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLfps5bP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HCjoDj0j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLfps5bP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCjoDj0j"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63277iZS3044208
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 09:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4N7tIyw5iZL
	vzZnTOYoRHg1O5/XCBmsdPAKZlPxWO8A=; b=BLfps5bPumsutZTffiFBEqxm7TM
	UUcYeFGb/mzApNeLNCxDFtFi92twZx5gtyZ94VRfxwI5NFcORfdDvuf814YwUrgU
	v3DaVxR/6fORK7k8sr1lDYtXFI9F1o7knrLB8IaEL7Tv8gAZF6Cl12f1u1+vsSnX
	M+uDsQJIr8nWYN1RoJzgXrs78QIL/TiQKrjza+VEtQir9rSk0GljwgsxyqoYH5y1
	gbaZNbcAvtm4odW4glYdMRjP4hGxQDhY83/jkN+J6B/nwLdX3eX9duEIAn8AB/MQ
	GTcbFwLPOH6DeTSb6kSAkZLGS/4z3yHDmoTbZTm9iRavS/+dr/y6ijvz6XQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483v5rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 09:29:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so417047eec.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 02:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122146; x=1775726946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4N7tIyw5iZLvzZnTOYoRHg1O5/XCBmsdPAKZlPxWO8A=;
        b=HCjoDj0jkvHcWvjJTK4HGcMB6HlY69C8vOhBg+aT0mnZwV8F/p1zNieeWdahYk/blt
         on1nhXaLavCXcvFOboLBUvgIwPMtZe+IXCHcb/GZ8SHzVQ4BUyADIl68sVnA23r3cS6N
         jBnQ8rP+p/ShJ14Si1eW24tXdLIa7Ic2o2L51Cjkf3GcduR8aFZU+SSSVOyosuZbWEzy
         BAyaiNeLrUziZTXPjDbb6c2MtZxHa9a1xIWaWWrsGuS9MQKQiNcZM3ZZaDHNjCx2nJ8h
         ylWCW/vfT60XwV35cMXVQHeZ9ofnT5p5vTrq2XHk8/AxL+YdsMbNQ7LfUzAStIKh5ljv
         xvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122146; x=1775726946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4N7tIyw5iZLvzZnTOYoRHg1O5/XCBmsdPAKZlPxWO8A=;
        b=MugTuGkRngmqP9Wn2klQErjMSJC9mxbpv/r7aCcv27YOygHo1piTgrs0r6i/qSkQF9
         hBrA1LezAyqmPkoO6vIzoq6YlTYVL0+UqWDszStZEkit2+Z8c4NCR9VLcCcq5jlyHew0
         4TCR17i46ZkWKZUM15EBGvxECBUKKiOY98OXQPI0T461MWKmlPycRqc/EbZzwRQQZulI
         s2BoR276WlUhDD+zeswHERZfBEBRJgmGiwr1NuEIAKGiqK/7j1nJhJI/4A6jI6x9JeOk
         ajfMZWDtlB5QC1+AUUxn1X3h/LjvcWBcyENIvOwzIrKGDCDKy+RfcHTDSZKN7Yfh+jPb
         qg3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU20Gj0QbVUHoHEYdW0zY6LELLSNsU31DPV8GiPFPEZNFk5f1n6csM3KbopOmDlNGSX7wSKRhumfV/Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/vghQUnpQl3gSCYTYjS3b7fetMKm1Ks5U7Dekhp0LQAOI6eYv
	MvoAOU3OPkxSNrVePJ+Z3Ft4BX6HRynh6gBCW1Yp0UT9Rnzn+/I64J6Lh6v3WSlq/GFU5QvFlPf
	aosp+qNPvvWizdPjFMDUlSgJId62lm5thjX/LDdPDLH8bug20wNA/EPH9spQS5Q6yxGj5VP2R
X-Gm-Gg: ATEYQzw3Y9im4KMyUS3z9GSiU/k2+7l2nHEkjly6Q2j0FdNrolqRdGP7ierKSgyrhg7
	2j3O6P5t1EGB/OsvhSXLnF8wJAyvsHuNfxJajmk7eDV1nkGgSejMkkfc9M8W6xSI+kvL5wpnXp/
	L+bAdnz+9xOQz4x01RJS7AkybsbwKzb07/Ln+nTRYKtk22A9Oagl3weD86YQdyHZD8UQ84CDHKO
	PagtAyHkKTv6XAe9E16ucK53hZVuou2Bq9XguPTAh+jmym3MP/Fu6spGJAs50y2HGYfZQtjbGns
	iUrqilfR7iqr3aIpm65HkSdjBCJ5Wf1+VlIUHmsLfWOg7CxjL/pBhtQfeu05OZlYZvvwEPlM/Z4
	lwO2iNd4zYFM0GR/btxG1gkzRenljIKVVduUmgP8n63sNAMCy9eCxCLQKvFgFqROpO9C/U1ZUaI
	Pk
X-Received: by 2002:a05:7301:1007:b0:2be:9c19:b34b with SMTP id 5a478bee46e88-2cad64be0femr685517eec.4.1775122145387;
        Thu, 02 Apr 2026 02:29:05 -0700 (PDT)
X-Received: by 2002:a05:7301:1007:b0:2be:9c19:b34b with SMTP id 5a478bee46e88-2cad64be0femr685492eec.4.1775122144851;
        Thu, 02 Apr 2026 02:29:04 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cafd073194sm951094eec.28.2026.04.02.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:29:04 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v13 7/7] qcom-tgu: Add reset node to initialize
Date: Thu,  2 Apr 2026 02:28:38 -0700
Message-Id: <20260402092838.341295-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce36e2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NCBTYWx0ZWRfX9ylgIxjqYHzv
 gYf14vKzC2cas/3NoSeX6vl/zv/CW9WvNJdJsdc5J8y5jqRx8Oubq+kO7vZKd49hVaKBYZF3Bxr
 Hb2X7cNEbnR46S+52meCyYnJSdNoTj9bQ3tVGhRJrADjuWxFp64ll1hfRetescEhzIWjXpnSWrh
 3unDli3RpQ4L4Vo0T1JuImQGIRtVpSHAzEvbSqJnZtcWa5xiVeljW2dfyA66KrVYzEwY3xLY8dg
 C+oPKusxsNHstzkgDSu8RKnKnvmM8uVLbIu7EmORfcIN9+FQ36cLczYTJz3hE1mGnLlPZD2RJ9R
 dtalLPzFbGkFTpxnK95WFr8qf4ylTXobRwtx+as8FZgkQImineCJPzNsmAzhFx78iHUXc6Pcsuk
 jAll1T5V62QAbTwPvj4BEyTxGu+KVDTvaXAdbs7hO0V0Si7Qr1IpDqxxEgPglBcXYRzQGu/QNAE
 KEgwAg4oX0/3UfNJOeA==
X-Proofpoint-ORIG-GUID: Erw2dHWE53JmlMsn9poHAEO3hJy6fRBn
X-Proofpoint-GUID: Erw2dHWE53JmlMsn9poHAEO3hJy6fRBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020084

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 7a3573e03e27..a6b6019c8ef1 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion:	7.1
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 4a529520b428..752fcd2963e1 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -420,8 +420,82 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct value_table *vt = drvdata->value_table;
+	u32 *cond_decode = drvdata->value_table->condition_decode;
+	unsigned long value;
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value != 1)
+		return -EINVAL;
+
+	spin_lock(&drvdata->lock);
+	if (!drvdata->enabled) {
+		spin_unlock(&drvdata->lock);
+		ret = pm_runtime_resume_and_get(drvdata->dev);
+		if (ret)
+			return ret;
+		spin_lock(&drvdata->lock);
+	}
+
+	tgu_do_disable(drvdata);
+
+	if (vt->priority) {
+		size_t size = MAX_PRIORITY * drvdata->num_step *
+				drvdata->num_reg * sizeof(unsigned int);
+		memset(vt->priority, 0, size);
+	}
+
+	if (vt->condition_decode) {
+		size_t size = drvdata->num_condition_decode *
+			      drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_decode, 0, size);
+	}
+
+	/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			cond_decode[calculate_array_location(drvdata, i,
+			TGU_CONDITION_DECODE, j)] = 0x1000000;
+		}
+	}
+
+	if (vt->condition_select) {
+		size_t size = drvdata->num_condition_select *
+			      drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_select, 0, size);
+	}
+
+	if (vt->timer) {
+		size_t size = (drvdata->num_step) * (drvdata->num_timer) *
+				sizeof(unsigned int);
+		memset(vt->timer, 0, size);
+	}
+
+	if (vt->counter) {
+		size_t size = (drvdata->num_step) * (drvdata->num_counter) *
+			      sizeof(unsigned int);
+		memset(vt->counter, 0, size);
+	}
+
+	spin_unlock(&drvdata->lock);
+
+	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
+
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1

