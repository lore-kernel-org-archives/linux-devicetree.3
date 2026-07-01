Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7981A33C53F
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 05:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885373; cv=none; b=lE6V1xFIInSfu/z1Rb1JcZJiRGZx79J5QYnbqUQo9v1NGgNor+cODE45hWU0Slgja2kjraw00WrOz325uH+vSh2/Mck4JDBm9w48v5otkT5GmExYDWZVPiyt+uei2/OZxN1D+OrhLQsO4dv/Lc4hPHf9bmbVbjispDUw70acIOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885373; c=relaxed/simple;
	bh=m9ClUkn5/nPsKmCI+g0pTzisbpFvdYlvZhQ7/90h8cI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hMEf+NU+mm2qRdMikw6T7Xx5Aiu8zCtE0zvQKyRpi/2u6nDN/2Kg2oSkFwxUE8xPXqAfL1a6V448D9cdAm21bUAqC0NlkyjYGTDf4Ws4z+6MmJb9huQMZOfICB8w1iZ1WBd3tQtGDyzsh+inybHtoOFEHeeQShKYYgmnhPs+yIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXYx56d/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNrvpEvJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXYx56d/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNrvpEvJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lO6d133217
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 05:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wsHI8h4U4LF
	j7FwqQoPIER9lHeUmcLIVhcMCnpdbFLE=; b=AXYx56d/0DltL5DjLdTzkiL8DGb
	pggLmxI+9YmqA1tjdtZ6k8smENPDrdT3tmhGqy+IwO3Pb82TgJ90KpPR0yWtcdX5
	P4phMfeEgYUSuTqCNe3yOnElJDtwMh0n8DUv7DwzPakmL02X5b6P/Ra83CoZy7uw
	Fbz8JW7KsDsWMdX9+UbXHpzskkookUX1Utg1sINRZbUsZTtfddSZaUj9ZW7kaVwA
	OlnPlf3qlY7er949sWe86rSo87bEPuEdpYzOlhpSneFnARepuu1Z1fLDBgNyroDF
	FFkiAwc4m9/c5p736jD1yB4/HurhYkZ9zayjGhnTMDu+3vakcYP2PUGD7Bg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy0x64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:56:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7f385887bso8650115ad.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 22:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885369; x=1783490169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsHI8h4U4LFj7FwqQoPIER9lHeUmcLIVhcMCnpdbFLE=;
        b=YNrvpEvJpcI0OIakAZJDGFLPlGv13wLc0Q146FbMM26JZPAuy+33qk97p1Gzr5w+Bd
         wmNUFFQG4kzLwRKA4ZLNEmRVFTfH/9fuW2jiuB88aFIW7bnuy8rIZfM0jgVAj3k5aDH6
         ZfQ0vCxCYwrqHKAnzaKxKeuOfHDWX6917dVvbfAXycUBFUoMF7Xzx87/GCEVDcR/CRvC
         tggI1T/8s3iWVDCv7ObGos9X6V7xJBw8yMLVhRJs6PPRQlgTSWD8Qutu5+q22GvWJ6Wm
         j/zBdIgR+iHedhXcfN7v/dettU+Solr3KXJCcLK4MHBjz8ZDziWYhP2Uz8knDUHEkZ/v
         dgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885369; x=1783490169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wsHI8h4U4LFj7FwqQoPIER9lHeUmcLIVhcMCnpdbFLE=;
        b=NHo8zvc9+Z63zNP922thcgHHlPArd76r7IzgCmtGOEbtbkxIBZTkaVESNB4qZViwIN
         RcIv65jxQSAt7ZInOUj53l0vI8Z/DZzD+LHcqYYOPzZj68DrWDqQMSsAu/lCdxd4ARaF
         SpC3vhTmgKSoxPiOPsYjgeY5yRLgcwPkOOrVVkoeB9ez7GoczNvSm8CHx2QYNniXAMAk
         mPBkOypdtbXXRl2lltwyakCkJ6G7qJvSKKO4BCPioxqobkByfrJag+7VKHPVxUuVDTWo
         Cb/mvz+B0sIZyUS9AVNXg/OIeeEJIHnW0jURLajUf3iuyTt9FNoBEg34U2tBkb+jaiih
         n6DQ==
X-Forwarded-Encrypted: i=1; AHgh+RqoYGS307aiXBuaA1Z71+z/k/Jebw/OmGzTw0Q9myaUmHqZP/BmgwYi7peGSwFTQFzY4lexR4nUTmS5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe+L7eiADcqbwjsKrYuqzJzP4tXl4UHYxbP5SiEip+lHSXOTmi
	Ni3jFAkJxck7QNmCExFttFC1gg0w1yhDq5nW/KUmLN8RT3t0ybZyiJH6alHaNbXYcNuifXaZfMn
	hUCr/OEg92W5C0DWycxpYUIV84j4rw8MzhglUfskFr7YmFvXBRjQPoyk/xnBcEiSs
X-Gm-Gg: AfdE7ck6TZfzuenOVlZje4pGD5YWu8jPYNmIQbpeH1knFxrNjoGwXCaziZ/2VBh4VHB
	ry4GiiuZ2wKmYm92omRA04sP0pX0LmE9BMS033cD0sGrjUFAL+BRcryX70Q2jvnzExwCwOTVzv5
	ytWJ/yUpnyQNvpTBNyiPXsP9T4b2jIoAY+Sb3fNPHkUhQ1MFslWCK+8ECjZMBhF4zDDkB5fh4ek
	iREuIQEjdQQN6Apenpwk9jnRxSc8FWaJsn1tLu8G4tZEUAA3fb8HiTq2BUvQ1xPMmo0FdlbN8s/
	3XS4dtLtkV/QAJHp8drgL7RYjUBai4MmWfK88X4kWf+BYdelHjjZ678CmqCvH8WTQVvhF9MqPoQ
	+J8mrRh5SZ4wQxXAFoXG6I14SF4lHBw06CC5Ozm3whJVrP30cpGDZz8BEMilOv/pnZQ==
X-Received: by 2002:a17:902:e88b:b0:2ca:eeb:cf64 with SMTP id d9443c01a7336-2ca7e673dbamr4455775ad.9.1782885369084;
        Tue, 30 Jun 2026 22:56:09 -0700 (PDT)
X-Received: by 2002:a17:902:e88b:b0:2ca:eeb:cf64 with SMTP id d9443c01a7336-2ca7e673dbamr4455495ad.9.1782885368555;
        Tue, 30 Jun 2026 22:56:08 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:08 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v15 3/7] qcom-tgu: Add signal priority support
Date: Tue, 30 Jun 2026 22:55:25 -0700
Message-Id: <20260701055529.445819-4-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-GUID: z9OuYkRbAh6z7L_avSd4P378PfZnHcgi
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44abfa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=aHbVEu0FunmFpxPyS6YA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX9LmlMu0zasRR
 JH2C80TnzFQTIcEdfCI79KdZzO4XsLPc+BzeNnYdkU8s6GeJ9UXkpIGy+2GQ2DvkZpoTuOLl4vp
 B1GrKiA6Z9E2V45hGGNviSsbMABkC+bqHK/E+x0X7XMLKc2Xvjik4eyhWw8Max3ujDour40fBw6
 xWqiQWX8F7vSssVoft9Oof6qNbzRpMK7RLeGEhR6cv66ANcC2Gu1d4ds3H/JgzSZD0bci6xyND8
 /CrNzUms4O3gGqMGF+HtrPVj/CaEdX4LAYAdZdHdH6mi4JHs4erVCS62HI3/CSC5LmJyTBLbrrK
 RB203v3rRZqKwse+CoQj/NOYSyUqXoDfFqP8m5ZChi8MbvCipSFniS4Zc4Csu49zSTr2eDZFiR6
 27/6VK1rJvALCvgsEhxJLY/uXdgX+SCFcjO17t89k4XX9yV4pYGYvgbPS3ZkD5ofN0F/dF5c+ta
 RRTKc90RMcMSeGUKE5g==
X-Proofpoint-ORIG-GUID: z9OuYkRbAh6z7L_avSd4P378PfZnHcgi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX6Wl2dP3xLmOT
 12evpnU5UWMKh7pOraTy/cMihwGlO13Q6LUDnylJkT81j06GogmBeBQARKLZ4PO+Q6imkxrleAW
 a3KYEeN97C7c4QsPSDvhQlIMC/O5qdI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010058

Like circuit of a Logic analyzer, in TGU, the requirement could be
configured in each step and the trigger will be created once the
requirements are met. Add priority functionality here to sort the
signals into different priorities. The signal which is wanted could
be configured in each step's priority node, the larger number means
the higher priority and the signal with higher priority will be sensed
more preferentially.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 161 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  | 114 +++++++++++++
 3 files changed, 282 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 8eddcf3bb5fe..2f1d4ecaf76b 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -7,3 +7,10 @@ Description:
 		Accepts only one of the 2 values -  0 or 1.
 		0 : disable TGU.
 		1 : enable TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
+Date:		July 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the sensed signal with specific step and priority for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 49c8f710b931..7d69986c3e3d 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -14,14 +14,123 @@
 
 #include "tgu.h"
 
+static int calculate_array_location(struct tgu_drvdata *drvdata,
+				    int step_index, int operation_index,
+				    int reg_index)
+{
+	return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
+		step_index * (drvdata->num_reg) + reg_index;
+}
+
+static ssize_t tgu_dataset_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct tgu_attribute *tgu_attr =
+			container_of(attr, struct tgu_attribute, attr);
+	int index;
+
+	index = calculate_array_location(drvdata, tgu_attr->step_index,
+					 tgu_attr->operation_index,
+					 tgu_attr->reg_num);
+
+	return sysfs_emit(buf, "0x%x\n",
+			  drvdata->value_table->priority[index]);
+}
+
+static ssize_t tgu_dataset_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
+	struct tgu_attribute *tgu_attr =
+		container_of(attr, struct tgu_attribute, attr);
+	unsigned long val;
+	int index;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	guard(spinlock)(&tgu_drvdata->lock);
+	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+					 tgu_attr->operation_index,
+					 tgu_attr->reg_num);
+
+	tgu_drvdata->value_table->priority[index] = val;
+
+	return size;
+}
+
+static umode_t tgu_node_visible(struct kobject *kobject,
+				struct attribute *attr,
+				int n)
+{
+	struct device *dev = kobj_to_dev(kobject);
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct tgu_attribute *tgu_attr =
+		container_of(dev_attr, struct tgu_attribute, attr);
+
+	if (tgu_attr->step_index >= drvdata->num_step)
+		return SYSFS_GROUP_INVISIBLE;
+
+	if (tgu_attr->reg_num >= drvdata->num_reg)
+		return 0;
+
+	return attr->mode;
+}
+
 static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
+	int i, j, k, index;
+
 	TGU_UNLOCK(drvdata->base);
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < MAX_PRIORITY; j++) {
+			for (k = 0; k < drvdata->num_reg; k++) {
+				index = calculate_array_location(
+							drvdata, i, j, k);
+
+				writel(drvdata->value_table->priority[index],
+					drvdata->base +
+					PRIORITY_REG_STEP(i, j, k));
+			}
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 	TGU_LOCK(drvdata->base);
 }
 
+static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
+{
+	int num_sense_input;
+	int num_reg;
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+
+	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
+	num_reg = (num_sense_input * TGU_BITS_PER_SIGNAL) / LENGTH_REGISTER;
+
+	if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
+		num_reg++;
+
+	drvdata->num_reg = num_reg;
+}
+
+static void tgu_set_steps(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+
+	drvdata->num_step = TGU_DEVID_STEPS(devid);
+}
+
 static int tgu_enable(struct device *dev)
 {
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
@@ -121,6 +230,38 @@ static const struct attribute_group tgu_common_grp = {
 
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
 	NULL,
 };
 
@@ -128,6 +269,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
+	unsigned int *priority;
+	size_t priority_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -143,12 +286,30 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	spin_lock_init(&drvdata->lock);
 
+	tgu_set_reg_number(drvdata);
+	tgu_set_steps(drvdata);
+
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
 		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
 		return ret;
 	}
 
+	drvdata->value_table =
+		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
+	if (!drvdata->value_table)
+		return -ENOMEM;
+
+	priority_size = MAX_PRIORITY * drvdata->num_reg * drvdata->num_step;
+
+	priority = devm_kcalloc(dev, priority_size,
+				sizeof(*drvdata->value_table->priority),
+				GFP_KERNEL);
+	if (!priority)
+		return -ENOMEM;
+
+	drvdata->value_table->priority = priority;
+
 	drvdata->enabled = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index dd7533b9d735..f994d83acb1d 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -10,6 +10,114 @@
 #define TGU_CONTROL		0x0000
 #define TGU_LAR		0xfb0
 #define TGU_UNLOCK_OFFSET	0xc5acce55
+#define TGU_DEVID		0xfc8
+
+#define TGU_DEVID_SENSE_INPUT(devid_val) \
+	((int)FIELD_GET(GENMASK(17, 10), devid_val))
+#define TGU_DEVID_STEPS(devid_val) \
+	((int)FIELD_GET(GENMASK(6, 3), devid_val))
+#define TGU_BITS_PER_SIGNAL 4
+#define LENGTH_REGISTER 32
+
+/*
+ *  TGU configuration space                              Step configuration
+ *  offset table                                         space layout
+ * x-------------------------x$                          x-------------x$
+ * |                         |$                          |             |$
+ * |                         |                           |   reserve   |$
+ * |                         |                           |             |$
+ * |coresight management     |                           |-------------|base+n*0x1D8+0x1F4$
+ * |     registers           |                     |---> |priority[3]  |$
+ * |                         |                     |     |-------------|base+n*0x1D8+0x194$
+ * |                         |                     |     |priority[2]  |$
+ * |-------------------------|                     |     |-------------|base+n*0x1D8+0x134$
+ * |                         |                     |     |priority[1]  |$
+ * |         step[7]         |                     |     |-------------|base+n*0x1D8+0xD4$
+ * |-------------------------|->base+0x40+7*0x1D8  |     |priority[0]  |$
+ * |                         |                     |     |-------------|base+n*0x1D8+0x74$
+ * |         ...             |                     |     |  condition  |$
+ * |                         |                     |     |   select    |$
+ * |-------------------------|->base+0x40+1*0x1D8  |     |-------------|base+n*0x1D8+0x60$
+ * |                         |                     |     |  condition  |$
+ * |         step[0]         |-------------------->      |   decode    |$
+ * |-------------------------|-> base+0x40               |-------------|base+n*0x1D8+0x50$
+ * |                         |                           |             |$
+ * | Control and status space|                           |Timer/Counter|$
+ * |        space            |                           |             |$
+ * x-------------------------x->base                     x-------------x base+n*0x1D8+0x40$
+ *
+ */
+#define STEP_OFFSET 0x1D8
+#define PRIORITY_START_OFFSET 0x0074
+#define PRIORITY_OFFSET 0x60
+#define REG_OFFSET 0x4
+
+/* Calculate compare step addresses */
+#define PRIORITY_REG_STEP(step, priority, reg)\
+	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
+	 REG_OFFSET * reg + STEP_OFFSET * step)
+
+#define tgu_dataset_rw(name, step_index, type, reg_num)                  \
+	(&((struct tgu_attribute[]){ {                                   \
+		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
+		step_index,                                              \
+		type,                                                    \
+		reg_num,                                                 \
+	} })[0].attr.attr)
+
+#define STEP_PRIORITY(step_index, reg_num, priority)                     \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
+			reg_num)
+
+#define STEP_PRIORITY_LIST(step_index, priority) \
+	{STEP_PRIORITY(step_index, 0, priority), \
+	 STEP_PRIORITY(step_index, 1, priority),  \
+	 STEP_PRIORITY(step_index, 2, priority),	 \
+	 STEP_PRIORITY(step_index, 3, priority),  \
+	 STEP_PRIORITY(step_index, 4, priority),  \
+	 STEP_PRIORITY(step_index, 5, priority),  \
+	 STEP_PRIORITY(step_index, 6, priority),  \
+	 STEP_PRIORITY(step_index, 7, priority),  \
+	 STEP_PRIORITY(step_index, 8, priority),  \
+	 STEP_PRIORITY(step_index, 9, priority),  \
+	 STEP_PRIORITY(step_index, 10, priority), \
+	 STEP_PRIORITY(step_index, 11, priority), \
+	 STEP_PRIORITY(step_index, 12, priority), \
+	 STEP_PRIORITY(step_index, 13, priority), \
+	 STEP_PRIORITY(step_index, 14, priority), \
+	 STEP_PRIORITY(step_index, 15, priority), \
+	 STEP_PRIORITY(step_index, 16, priority), \
+	 STEP_PRIORITY(step_index, 17, priority), \
+	 NULL                   \
+	}
+
+#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_priority" #priority \
+	})
+
+enum operation_index {
+	TGU_PRIORITY0,
+	TGU_PRIORITY1,
+	TGU_PRIORITY2,
+	TGU_PRIORITY3,
+};
+
+/* Maximum priority that TGU supports */
+#define MAX_PRIORITY 4
+
+struct tgu_attribute {
+	struct device_attribute attr;
+	u32 step_index;
+	enum operation_index operation_index;
+	u32 reg_num;
+};
+
+struct value_table {
+	unsigned int *priority;
+};
 
 static inline void TGU_LOCK(void __iomem *addr)
 {
@@ -35,6 +143,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @dev: Pointer to the associated device structure
  * @lock: Spinlock for handling concurrent access to private data
  * @enabled: Flag indicating whether the TGU device is enabled
+ * @value_table: Store given value based on relevant parameters
+ * @num_reg: Maximum number of registers
+ * @num_step: Maximum step size
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -46,6 +157,9 @@ struct tgu_drvdata {
 	struct device *dev;
 	spinlock_t lock;
 	bool enabled;
+	struct value_table *value_table;
+	int num_reg;
+	int num_step;
 };
 
 #endif
-- 
2.34.1

