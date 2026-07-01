Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995B3394490
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 05:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885376; cv=none; b=Ju4RUrRGnZp7uU3ewuJoCTz72gdaE7an/EmCBNXAFi9SmyUGq3/6xJsaalG3G2UasNabHu45F9w4f3xly2HY6nWWQSW8po1ftJ+hr9fBNPBPoRS5f6HACbZvBWNGrUBaOwJKbJ5Db58to16eMcSSl7sIaf9OdQE2rSgLHCsZPWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885376; c=relaxed/simple;
	bh=pLxejR0tn3mlHWxtZc8XgC6QDHNfBiPGM63fj3puZxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jQc8cmzSwnRWzPa2o573fGORzVG03GT1gRjfpqrF/SG8J5lM2iucpt+M7odFYMmYY5qMFJ7KvBMeHftX2fQGBuZD2tIbjdoqr7s2jo9B6Kmhfw88dSt5d6KZ1ZNLQndcKwgI7md+BZSGwrbw72lAcuZ+wiWtZP+4cMq+HIZtnDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HRS0Uu6e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ba9Cba6O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HRS0Uu6e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ba9Cba6O"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lkXv145254
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 05:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3G1tgsT0hbj
	GK1zhexqlcCJTqqA2n77FRNmbYoAGmpE=; b=HRS0Uu6eJHvmX6oBFZ0xcJnkC7Q
	89lz4WWyxaIlT6td6c8FpttX4FRKcEARZ9LwC65v16hTaezsOVKfWd/OfjEDZ9uZ
	+oo14dTgBwTX5vhTg9eJl8Bsb6onWy6hGSDF+wt9QEjWbGLsf7hM9FI9t23oddZ/
	sji/JELP6zDX8tB1/ZGwIhWyaiAp4AkYqOjsWue3VRG9HlGf8KueeiAOR20d8aRg
	6yq0XxLKzeyWdKHRiDArBkANttL0Z3YecUhiVooZ3QQcvzJaD3GrxjJunFRvyreV
	4AxPYbjHIZfE/KsbPPLsHetXDtGnKP2SHRyilCnSmsyddMx352GxDG3JXTQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktad3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:56:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88e0f04e51so206034a12.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 22:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885371; x=1783490171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3G1tgsT0hbjGK1zhexqlcCJTqqA2n77FRNmbYoAGmpE=;
        b=Ba9Cba6OtwlYkpVZrZm+7xcQNiH9nB61wN9R23J00zJYH4QnwnjIdVu9iqTZ/kzx7k
         yj2CFXhP5BIlpufeRjuOFnQtvZ0MAjIsmLkh5b68HWMf0I0Uh0NmQ/g7YLfo1e9ynLvR
         Od7Zon2Y70C+Qu+g/2s11AFJMtOG4amVWw1fJcdLSQAldyfO+5GuRg/rpWskLQg8Hc+9
         ze/+9mGLEDOV3OVH7XJJ4mIKc1zP+vQHg4fNZ6FDZs8CCV5SN0k8PqVyUVFKnAeSk4cu
         s2ZO/rLvRSSogUX+O5vcn34I+FFEGbhvNEcZbdysMevUcn6KJVsFlhmTD3IxyPGgE2Vc
         7uKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885371; x=1783490171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3G1tgsT0hbjGK1zhexqlcCJTqqA2n77FRNmbYoAGmpE=;
        b=kjkFYyzYj0WzbOO5LWn79cILMcfzGQToAnAj+5slMbnN8FHXrg2AQTHOGL4gGjTEZO
         YqgXzFcg5hk1FuBr8WnZKYbHlo53lxLAF80FCkMYLizl8Ai8w+km794H0TE2RG1GtBXF
         aGYHyDFEf9197oaiPnTI6n00WIQ9Q0IqPk26mZxzwaIf1txh2XjhSxy/ibNdBj4UOshu
         8wqZVo68cJ9mRxZWYtQphZnEvqXv0rYe7bnrkacHras6zP4T4CkZOgppPvuRNb715WKR
         LSTQZk0pugU7qOpL/Ggq+DtUCVduJOlecBc66vpK5QFSaCvPj+/bpDFQxsNRTmnlrlyi
         DRqg==
X-Forwarded-Encrypted: i=1; AHgh+RoxuKxoESOYn7J8Sutp0BY2cf9PaM9OL3Wdo4OjzJzO8SYUb4WBQI+npo+xQ+3dcfF5D4m9UDbQ7veY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ZSS71npPUTTZ8h2cGcpEPUvBfT7ApqRlIUr5Fg3hNl1PuHJF
	oglCSU7Oj7UY6mHFDA6vOGwpa5fxbcR+gbW1QHG+fKaf7VNkbp/U5JpAup45XeFFzxsDGLE4kiu
	t7USv93PwtGbupkDDpwRlz7CoQKEWoJAMF48d0G8h8kZs1n3t0jVZNPJlO7NtxU4k
X-Gm-Gg: AfdE7clALu6pySRZ/ezH9FkkRF9zibPdqprihrq6RJG5g/NWboblGHMErTVV8SPGPHg
	AtAy9eZylrsnXbC7SreZSTsiLt1ytNMMcAzvUG405TBlV3i7aOon6l8l2NWhTN69bYDzOHp3PIj
	BRYehlNHJrUA4eQkfsG533+xlzU3tr5Yu1jpMCNAQYfwj7Llp6vgPzyhT9AhfDXFa03hr0Ou5ZX
	8LqpTIlJ6Pa940Yt79fY/zmgvHJvmh5I7cP0yaeZfjXYY1fDOhVnC+HQqV7QLRfr5zqIl2UeHnD
	b0Qmxs2ycX6i23bPA8DfvxrohtNcrujd26iQCvxrVhPvySAGK9Rxofv9uXoCW7Elqhcu3Qiu57h
	8qUuNJUKcNbzoFOEiAriyC0BKCEglGhiwxTuf2ggadX4x2BjgCfoX5yrUapzhIU6fPw==
X-Received: by 2002:a17:902:fc43:b0:2c9:aae1:a61c with SMTP id d9443c01a7336-2ca7e705ddcmr4054505ad.20.1782885371154;
        Tue, 30 Jun 2026 22:56:11 -0700 (PDT)
X-Received: by 2002:a17:902:fc43:b0:2c9:aae1:a61c with SMTP id d9443c01a7336-2ca7e705ddcmr4054175ad.20.1782885370547;
        Tue, 30 Jun 2026 22:56:10 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:10 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v15 4/7] qcom-tgu: Add TGU decode support
Date: Tue, 30 Jun 2026 22:55:26 -0700
Message-Id: <20260701055529.445819-5-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfXwa2RkOzmCNmB
 aH/uChBvfJjvdMjOp4A2ZRfGrm386N15gxshzlIo5dGtsuO/KsmFpFtVjrlqhoLkWpVyIpCIkBq
 gcM937fi3i+7JMMmoNKQEf/gli1Bv2g=
X-Proofpoint-GUID: H2uDQhvK6jQSpx2jHsJAwJqvCsOQaYbI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX19jEcKFUzOII
 KUVmrIA3WHVORBJK2nkk81w5cBbzSaegM3BdWu5MWvGpKtZ66REYhl6j3k+BIUtm6laTFXq8CZB
 /YMbyf7Oj7XS7EuYmUeczDITdK7M0w6+TYWN3VpX+H0VAW4tacPNj9xRW03uAMQPTsS5H/6MszP
 r9A5RYA+JMjbRqX1M9hKn0Ma/NqdL5bsZoW7aECGFcTJH5oAnIhvHGBS0F0KHnh0uHj/wkHuYnM
 Kc2R6BkaHKIjUditFK1D3QWNIwfOnutT4BPJrNSrDUMlLqgwq/7u/uU7VGXB9cHMp/kknTFGvSR
 AIDgoVR9JhrzAvK/VkC2rxrSwOyCUaPCmiRkD0CkGA3Sf24rC0A4WWO6XiDFj2cVxw5k6NLRiJR
 qQ/m2fGu2xvoudzxCEpXKo1WtYP8L69eC6nvcSacAfuFFiKW+gFNpPslwcllLwj8FgqQFs9sJ3M
 it1uVRG/V2+Z6N8OENg==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44abfc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=p0PFFVR7nGJo5X-0Br8A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: H2uDQhvK6jQSpx2jHsJAwJqvCsOQaYbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010058

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. Example - there may be a
counter keeping track of some occurrences and a priority-group that
is being used to detect a pattern on the sense inputs. These 2
inputs to condition_decode must be programmed, for a given step,
to establish the condition for the trigger, or movement to another
steps.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 157 +++++++++++++++---
 drivers/hwtracing/qcom/tgu.h                  |  27 +++
 3 files changed, 170 insertions(+), 21 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 2f1d4ecaf76b..81a4e6036b72 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		July 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 7d69986c3e3d..937211923d93 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -18,8 +18,33 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 				    int step_index, int operation_index,
 				    int reg_index)
 {
-	return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
-		step_index * (drvdata->num_reg) + reg_index;
+	switch (operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return operation_index * (drvdata->num_step) *
+			(drvdata->num_reg) +
+			step_index * (drvdata->num_reg) + reg_index;
+	case TGU_CONDITION_DECODE:
+		return step_index * (drvdata->num_condition_decode) +
+			reg_index;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int check_array_location(struct tgu_drvdata *drvdata, int step,
+				int ops, int reg)
+{
+	int result = calculate_array_location(drvdata, step, ops, reg);
+
+	if (result == -EINVAL)
+		dev_err(drvdata->dev, "check array location - Fail\n");
+
+	return result;
 }
 
 static ssize_t tgu_dataset_show(struct device *dev,
@@ -30,12 +55,26 @@ static ssize_t tgu_dataset_show(struct device *dev,
 			container_of(attr, struct tgu_attribute, attr);
 	int index;
 
-	index = calculate_array_location(drvdata, tgu_attr->step_index,
-					 tgu_attr->operation_index,
-					 tgu_attr->reg_num);
-
-	return sysfs_emit(buf, "0x%x\n",
-			  drvdata->value_table->priority[index]);
+	index = check_array_location(drvdata, tgu_attr->step_index,
+			tgu_attr->operation_index, tgu_attr->reg_num);
+
+	if (index == -EINVAL)
+		return index;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->priority[index]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->condition_decode[index]);
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_store(struct device *dev,
@@ -54,13 +93,31 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		return ret;
 
 	guard(spinlock)(&tgu_drvdata->lock);
-	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+	index = check_array_location(tgu_drvdata, tgu_attr->step_index,
 					 tgu_attr->operation_index,
 					 tgu_attr->reg_num);
 
-	tgu_drvdata->value_table->priority[index] = val;
+	if (index == -EINVAL)
+		return index;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		tgu_drvdata->value_table->priority[index] = val;
+		ret = size;
+		break;
+	case TGU_CONDITION_DECODE:
+		tgu_drvdata->value_table->condition_decode[index] = val;
+		ret = size;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
 
-	return size;
+	return ret;
 }
 
 static umode_t tgu_node_visible(struct kobject *kobject,
@@ -77,13 +134,26 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 	if (tgu_attr->step_index >= drvdata->num_step)
 		return SYSFS_GROUP_INVISIBLE;
 
-	if (tgu_attr->reg_num >= drvdata->num_reg)
-		return 0;
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		if (tgu_attr->reg_num < drvdata->num_reg)
+			return attr->mode;
+		break;
+	case TGU_CONDITION_DECODE:
+		if (tgu_attr->reg_num < drvdata->num_condition_decode)
+			return attr->mode;
+		break;
+	default:
+		break;
+	}
 
-	return attr->mode;
+	return 0;
 }
 
-static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
 	int i, j, k, index;
 
@@ -91,8 +161,10 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 	for (i = 0; i < drvdata->num_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_reg; k++) {
-				index = calculate_array_location(
+				index = check_array_location(
 							drvdata, i, j, k);
+				if (index == -EINVAL)
+					goto exit;
 
 				writel(drvdata->value_table->priority[index],
 					drvdata->base +
@@ -100,9 +172,23 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 			}
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_DECODE, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->condition_decode[index],
+				drvdata->base + CONDITION_DECODE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
+exit:
 	TGU_LOCK(drvdata->base);
+	return index >= 0 ? 0 : -EINVAL;
 }
 
 static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
@@ -131,16 +217,26 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
 	drvdata->num_step = TGU_DEVID_STEPS(devid);
 }
 
+static void tgu_set_conditions(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
+}
+
 static int tgu_enable(struct device *dev)
 {
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
 
 	guard(spinlock)(&drvdata->lock);
-	drvdata->enabled = true;
 
-	tgu_write_all_hw_regs(drvdata);
+	ret = tgu_write_all_hw_regs(drvdata);
+	if (!ret)
+		drvdata->enabled = true;
 
-	return 0;
+	return ret;
 }
 
 static void tgu_do_disable(struct tgu_drvdata *drvdata)
@@ -262,6 +358,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -269,8 +373,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority;
-	size_t priority_size;
+	unsigned int *priority, *condition;
+	size_t priority_size, condition_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -288,6 +392,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
+	tgu_set_conditions(drvdata);
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
@@ -310,6 +415,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->priority = priority;
 
+	condition_size = drvdata->num_condition_decode * drvdata->num_step;
+
+	condition = devm_kcalloc(dev, condition_size,
+				sizeof(*(drvdata->value_table->condition_decode)),
+				GFP_KERNEL);
+	if (!condition)
+		return -ENOMEM;
+
+	drvdata->value_table->condition_decode = condition;
+
 	drvdata->enabled = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index f994d83acb1d..56e4161a8bc2 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -16,6 +16,8 @@
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
 #define TGU_DEVID_STEPS(devid_val) \
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
+#define TGU_DEVID_CONDITIONS(devid_val) \
+	((int)FIELD_GET(GENMASK(2, 0), devid_val))
 #define TGU_BITS_PER_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -49,6 +51,7 @@
  */
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
+#define CONDITION_DECODE_OFFSET 0x0050
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -57,6 +60,9 @@
 	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
 	 REG_OFFSET * reg + STEP_OFFSET * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -68,6 +74,8 @@
 #define STEP_PRIORITY(step_index, reg_num, priority)                     \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
 			reg_num)
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -91,6 +99,14 @@
 	 NULL                   \
 	}
 
+#define STEP_DECODE_LIST(n) \
+	{STEP_DECODE(n, 0), \
+	 STEP_DECODE(n, 1), \
+	 STEP_DECODE(n, 2), \
+	 STEP_DECODE(n, 3), \
+	 NULL               \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -98,11 +114,19 @@
 		.name = "step" #step "_priority" #priority \
 	})
 
+#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_decode" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
+	TGU_CONDITION_DECODE,
 };
 
 /* Maximum priority that TGU supports */
@@ -117,6 +141,7 @@ struct tgu_attribute {
 
 struct value_table {
 	unsigned int *priority;
+	unsigned int *condition_decode;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -146,6 +171,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @value_table: Store given value based on relevant parameters
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
+ * @num_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -160,6 +186,7 @@ struct tgu_drvdata {
 	struct value_table *value_table;
 	int num_reg;
 	int num_step;
+	int num_condition_decode;
 };
 
 #endif
-- 
2.34.1

