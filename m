Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935503947B0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 05:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885383; cv=none; b=tkaCULJKdOH9eWFtUo68ebczrs+yBYWo+NJrIufGzxNe7OHGC3Ih8PNIectd/dQ8s4YfkqjvsfxSMzRD85dbu6AZBvBEOw73+Ji2hb5HLNTfcf9uNsgpFsz4kW9SpY5gv6SjcwbJVXEt9+/qGBoJb7yICjhh7VLZF/qEHReMsCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885383; c=relaxed/simple;
	bh=ncoQ2cfYtWnzIY8gFtSR8fGUuzOhKe8thmsWYryWtaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p3j0XZ6dUT7DaZh3ucDAHkvFaOT0jPDhVITk+XzdRzbQmEntyzFK/k/oPgKmsAisUGeZDdA9kTui5WCSbXMj1qQLzcT8yBLKZABxNJLa6+DQVDA2UV1d3+ifGKkUMzbg8SzL+N/TOzPzQKaUblGYzI3Jl5IkKTmeHk2O5aKNw/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Up4mXx6v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRW8ARC+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Up4mXx6v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRW8ARC+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lOBX102899
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 05:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NjlH2n0Y7dL
	EZ/GZ6FO/PlPMn7f9rV+JPlftsjUFv94=; b=Up4mXx6vU5m7peDfWMiHM7UgayS
	VIDNPj/TywOf3r832SWR7boTbFnWkDyFI2jtfcxeqPBIjXHyNY1HuyFe4XIyg8xX
	rLEaUhWnc6xgonZpvV/0moMOV2HMarF1Z0OUqYuyAikgJPVLaf7JOgXzn+1eX016
	OOsdC2qP8V8XP+EJJy5aS21YDhXMhwSFaAoL7Hl78fPFnwqKpyFpBAc8njeVtfaE
	3HTPKCMOpghBagtPvTborTJPnETgl5TNbLglQNC7nnrkI1Ok0zCGcOlEmXc699GX
	I5pqO9Ltl+/cBT9yhX5BuWRikM8HOaeSorrtCKgzPBU2Xx8RB9YxzfKc+zQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwa9bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:56:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9e994869aso3690925ad.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 22:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885379; x=1783490179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjlH2n0Y7dLEZ/GZ6FO/PlPMn7f9rV+JPlftsjUFv94=;
        b=KRW8ARC+j+3WktrpDJDhzMfOZ+nIHiKQWZxdZU6yf7JBjoiuOXYM59n8VsL1Zurog9
         8TOVvl//NGRJjVgfrS2sn92jPMrLf/f1kqacsgMcOtHMq/95vb4dgZtJNqRhWs/Bh5d1
         ajJiEby7MywtIw6CnK8cy80lvXuyGjRv5sbKqXWdBOejN5XZIrF8Gs34jhUNT8EpwQY8
         cuHsoCG5HR3JyMgkNJk1ofjP8zCAJh5ho+TGEkT4TZk4Z/ctiHNZcmabc5jQQ5suyRLw
         7QT/Ndv8lFDwOc9kLPMwK1Jds207/FOvmSJ5BumcPaQdZ+GoRvQwlpOPv97Bu0ZMcU9/
         KuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885379; x=1783490179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NjlH2n0Y7dLEZ/GZ6FO/PlPMn7f9rV+JPlftsjUFv94=;
        b=sWPsQZ5lVFKli7lAC3RTirnuYCBO0Nin5LsUIKxbx7oB1gaIrogp9hBuvx2E9UpP9K
         mdx9RcdEps6jg4kGsmelzFKrVjw9XIgSSfB6CSfnRoZCOaQ7Q2hjFBl4c//utJw9OM/u
         P7s03ZYDzKYdWmhXtsSrTjbLrRfNRccn5+/9ZUyKypNU+u09ZYispgJ4aQC9Niq+gv2D
         vRKgNhh831u5HtmVgcOiWnZlfCNEbIKEXGeJjC6eQjysNvEHD6+dcbsexNwHozUj+hAK
         DK1wu/0bGgUDVyJnu+EqKoQyAspP8t/cCQ4TchXcns37WAfNCrGwTOGKBO5WlkbnlDyL
         BYTg==
X-Forwarded-Encrypted: i=1; AHgh+RqFam1/26+nWRjRdkMGoYXQvCg9nOWms/UaiPr3GyueBznn2ZTCYC3DtCsgNHVTgggp9W4qlldxMTjE@vger.kernel.org
X-Gm-Message-State: AOJu0YwdaySOEhFNDitO7ci8fnPyRUMYDBTAGIGhrulG75/71RWfOD8T
	JELTPWlOnKtmEyzqnsRgljkS6YZeLSYAUSy2NJl6OULjBsJzFKbS02V23ELo1lpwAe/u6Ty3X24
	98NuEpiWxIcG/DoNmdvXpBxczgxFxu5aUn8nk9No6VAx8wqFVfMoAp5yYOsI6QuhJ
X-Gm-Gg: AfdE7ckKDVUOx/W37kzR8mlZ9+/OVFTzMDg9cayP1POqJIvdCR67MevSfjUI8LBEwba
	pSLz+MiBrhRfPtlCe0AKpKfJChD0TWQOz+ZU0fXm04ayRj4loq7Py4qx4s2hajHbvOwQRVvbljt
	aWEdLtCMWw1kj2sMrU+yDE1BnZWqfPCZiGHjaBFSsBQxqUcNziV3L35wRyCT0yTdXHai0git/gg
	Wp871/b2MBTa3W+sUkIIzn3Zvl7TUq2m/LAvAxW0vbNH2Hj6+W61XCEu5fcK+cwuyOBY8cPkriS
	awWBYsQFQPsuVgwk2L9t2sqLvxAl57pLpou6jqr6Uzmp/2pGvGszhTfu4YOZry1wHnShft/Jk48
	GLYW9t450sDpywVHOGSS+hRTICKoNFX/zv08AV2t+zUKDi3QE3hlGU2Feu8tijFQG+Q==
X-Received: by 2002:a17:902:f685:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2ca7e65408cmr4281995ad.9.1782885379495;
        Tue, 30 Jun 2026 22:56:19 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2ca7e65408cmr4281675ad.9.1782885379038;
        Tue, 30 Jun 2026 22:56:19 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:18 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v15 7/7] qcom-tgu: Add reset node to initialize
Date: Tue, 30 Jun 2026 22:55:29 -0700
Message-Id: <20260701055529.445819-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sncW7NUfJ9DFmnhAyoaCIozEzaP2EPBx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX91jOm16sK76j
 II/CcpuTkUtzgCBRfGWar3tJS7HYYez/gglKqFDtLGl4BtKDHk859pOFj80ntqVsYIJH+T0Fufq
 eV5UAV4gTesapsTZ/ful0kenApjdAwA=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44ac04 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: sncW7NUfJ9DFmnhAyoaCIozEzaP2EPBx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfXyHO5/mU9jmpF
 WoZCYOICC8GtzUArXnNMIiI6MLxZDigcdaD/73biQMo2etgFhXuiocEs3RqnND+tbmczPRK2rTk
 WL0ykWWo5ByBvVYG+CJfrvaZd/tVON0hRqpIZjVe2oqTCS1C7OaTce6oOGYqlKxA7Qcdgsx8eEC
 khDRLGep58tw9zFeBYwkdRdNoPmWPY/AGMx0eRl5FuOH4MtjnqRB0vPOZE3a7aVcTaoXI3u1MNj
 jpOir2nIv3fqemruOlr2Fz+UHvElkv2dHnzPtVqS8pd+9VDfod1Mos/whwddrQ5Pw71Lrz1Vs8S
 HkCGZGDtimeLG9jKzfJkGr2WeFQCSORE/QSOrUpOw4D3Ma0foV/FKid0Fsc/+67VZ4B3K+xBln5
 PSr2msUbw0cxf/91P8CmOjQCQpVKy4KCO65T04rXM9EIvsAurOpRaLzBPoWvlANkdFpiCZQZ5y/
 iT3o6fwNmMU4MC94QqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010058

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 7fad11eb759c..cb0710fea9c7 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		July 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 6d5bf2621cb0..9fb51f2a912f 100644
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

