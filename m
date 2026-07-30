Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06E63ACA59
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398874; cv=none; b=L+O+g7dRepuGHFab7LKVbOOT0pqp9WBNospD/RuGaM55/cwfmXEyB8OU5vGpSjBI9fD/tFpXAngxcqiXdSIpisOzhZkT187GP+PVqaGZSA7xDDJ6ki7BBE0hxHm+33zeRzn/ZdJFo/dPbSVDEpswKMWZcfKxiDa0m71jEaTlpic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398874; c=relaxed/simple;
	bh=+skwlTCke8vYH6FeJ/UFBgabRjaACVuRFQ830cdYCXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hTOeEqUx7/FZY2CYX49+GcUV4uuVwNEKv0YmBIDlVKW9OsuLQjWvdTMwlbNQrYNe9VrvkVe5ESl7Hkc67ybd/oTL4I0X5CorK3nMK9ICWt7PvckkMyfW3jmU5l0o3rb4yBiy40Q7aakvDSAvS57r3gdTfREkl498MoBWcyWDKb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1Lhs74V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CkJ/Oh12; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1Lhs74V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CkJ/Oh12"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U7xoi1395610
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aAz9Rtu2zYb
	+J22X9MI4UNKE36YjdvyEjAhDmovlVZs=; b=V1Lhs74Ve7Jj0ABM7V57N7naJgY
	NMRFvvX3X9cEGMg13QNkFYZ/laVcbfV9ZJGO+kifJQxWvojHMbes9ddfy5KbXWkd
	HwrDGNZ7G/XRwhUgzccpoqjyy91hvx1u8rymm/ydhrPubpXhk/syyZRdsibOgkg5
	AKmiLldpQBaChmUA6rb7XzftSsv980oIpm6TDf2aiKVqXy2E7ORPwTcppczhAg0W
	kn2s8CYphWkWwkQJQk67F7sfRDCe/JUEHjgoHdkzI5qgqp5Z2oYu1SNhG74LMB7G
	MaZC4UYx6xXDz/Iu1ncvPXfldsZryW8WmsDWbvr6ViJRMkwY2P23Sn38f/A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2qbg178-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:07:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811279d51aso3319961a91.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 01:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398867; x=1786003667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAz9Rtu2zYb+J22X9MI4UNKE36YjdvyEjAhDmovlVZs=;
        b=CkJ/Oh12d7/RLg7THs5x1YCFKS6kN0SFodfm7/8mNzLqzjdZiunRdvcdZ7w2301bvI
         k3nPrAqsJ5DurP65fR1iCDZAW8jHqsd+z6ZEDUMA1B7aS1QYU9thjBtxyuWGJEAXUUw3
         V1z7XgrvN+up2f5KyCJUSsT4f7aVW8EABKeUqwmun+pcN2ehuA735VbkBBmCJgfp2q8r
         LqsW5vL/VDuenqhvjnxc3C2bSRhxKgtn8DKzgZoS24F4Jmp/9PYbQQk4nqm312irIBts
         7UNBP/ZQaJtxNKvRnezv3JtRD9GM6PN6W2PfKva0gLkw45PHF5E51kpF3jADFNtnEqxo
         qOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398867; x=1786003667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aAz9Rtu2zYb+J22X9MI4UNKE36YjdvyEjAhDmovlVZs=;
        b=BHrHKxjGR7nijILaVAiTzZWFQKy8L8NlyIFUVjeyi13xkbMnvZVM3C1F37etOxsmVm
         HBLiINL+2Ue4a6PgSjbZ908nlUWWAfYojnedFlHZXkQYF1i+QJtkb8/jxOwAFsHiOfAc
         lvZYArGMbMVK7hUCTpPPWdLcJzG6Tuz8wSr33x+CIZ7XS6+TDcfstfzG8lspzC42mY46
         a8M78Eub1otB3CVSu8R4qxHng2oDasuSX3vfQ2+qKG0Zecx6PZmJ4lnPfJEZNIWFnvsm
         7fCXBC315wuhpVJqmGUCKLiP3q2F4Yq6r4zFIygkkpeo10FLZwkG4CxZka5b+beLAXQD
         Yi1w==
X-Forwarded-Encrypted: i=1; AHgh+Rqpqyuk193ARqceD89dj0FsZfFLBKFZvNtrVhvazEYww1I3v8Usb/LnbisTbi830AfeTAw7ELsW6VQg@vger.kernel.org
X-Gm-Message-State: AOJu0YzasKZunpdegKnWnoX0gIa1P2EtVxbjS52UCqVYSAHc66+KZfrc
	g+MK5DKSHrG0Vbh0h4OqNwKcz8m3pzAF9HujdRHafljGMDFU9NtciSko3SSJroZa5oggKNvnYIO
	7NX2N+SAQqHiEuOk6UqGx2Fm8yKH3hXtgOLUS9GMBZ5GQ6iqcH9JPi8hrxPLMUm8x
X-Gm-Gg: AR+sD11oSCyG4APh4C2RAr7FZhfaJX4o5U0xlfqxfWGfWT9SWzO1Tr03gUd1k0U34F1
	RJ0aNE2PGP/4t3fo2hEQHgLzE/KWF1Y64uHHe8yxPQaGk0ZKyfZzNoHUHr7j4T+bf/e0gFvwIte
	yT9SazV12ocfScv+LkZ8borppiVpI3QvHTfNsJPeI9isBvotrkA/kYGQURYVvEsy9Kdi49V+u+L
	INPBG5CKVoN/Jo0D4tbd1sKfA5DsATG+kOP9NzUKGcGZVIvxKqsyy3Fn6Ct23jcPfPCopjZv7H5
	2CmJsNfFyOVZlzp+2crukGCWs+2RXzmzPNHPuNRXl3ml6t/1Pblqugxv73xGWxPIZOPgggMe6u5
	MrD+riA/XG+uUk9dRulB1pgLk+GvHuGnHe60BAzJNhYx3MTkgvGgSgTw=
X-Received: by 2002:a17:90b:3c8c:b0:38d:a8be:a597 with SMTP id 98e67ed59e1d1-38f9c0815c9mr1635523a91.37.1785398867167;
        Thu, 30 Jul 2026 01:07:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:38d:a8be:a597 with SMTP id 98e67ed59e1d1-38f9c0815c9mr1635476a91.37.1785398866681;
        Thu, 30 Jul 2026 01:07:46 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9bab61desm619516a91.13.2026.07.30.01.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:07:46 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songchai@qti.qualcomm.com>, songwei.chai@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v16 4/7] qcom-tgu: Add TGU decode support
Date: Thu, 30 Jul 2026 01:07:01 -0700
Message-Id: <20260730080704.2903540-5-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CqcGm-a5rr283Np7WLRFunmRK7pg4YwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NiBTYWx0ZWRfX/0brHwwB2YBg
 grvxZir344arBxaUdKGoliz7mALPjUdE8z9r2XMob7X6gXjWSAa35DAwKqrqifSjJZT7PdURGoi
 0rZ7WGriETikUfSJ8ZjKe5L+pBX+aCzJqGKz/HXAdh91pPveP8ke8bv2pCcWhKf00o85BxxaPhV
 9/06SH0SwEIL+/fn6+hvZaSo6K3/QnC/2KRfmEJGM0HSsxz2wPKY7eAdKHCHV9W1WIT8OrPZBnJ
 g1xorywLJNe2qE6wNpidO2L4Yi+gVQQJJX7R+h1frnoXVWO4mDsB+xBWt5cFjKnVNAlSdKt3338
 /2mUoxmYfSjEidmj1esVgcb4uTqljp+NycAfFnSqilE/vI3jMU3ulYFlWFlXCm7tyso+AboBre7
 eeS1a04LBPNqmxt//khbXSrFJt/koRK5MKtM8eUc060ZrysZWKSePFB1HnnQJh+TNHjqHuZAlY9
 Xs33qPO+lQXsaHf4rOQ==
X-Proofpoint-ORIG-GUID: CqcGm-a5rr283Np7WLRFunmRK7pg4YwM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NiBTYWx0ZWRfX/kjpUOKv6L88
 eTwF8UkiSD1t9tagBnvQdMFpRH5PJ0FLIO/lpkayGK5fkhVlyF0vKnVdGawheVfNmTIeQvD93TL
 5Idpb1TRwrsoQgjqB7c//OKs5fvl3n0=
X-Authority-Analysis: v=2.4 cv=SoigLvO0 c=1 sm=1 tr=0 ts=6a6b0653 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-Xdq57HJl2SVtTrRoKoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300056

From: Songwei Chai <songchai@qti.qualcomm.com>

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. Example - there may be a
counter keeping track of some occurrences and a priority-group that
is being used to detect a pattern on the sense inputs. These 2
inputs to condition_decode must be programmed, for a given step,
to establish the condition for the trigger, or movement to another
steps.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songchai@qti.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 182 ++++++++++++++++--
 drivers/hwtracing/qcom/tgu.h                  |  37 ++++
 3 files changed, 206 insertions(+), 20 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 7dd24314592d..705e75c776d4 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 0e88b437f191..e83295217e7a 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -19,8 +19,33 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
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
@@ -31,9 +56,11 @@ static ssize_t tgu_dataset_show(struct device *dev,
 			container_of(attr, struct tgu_attribute, attr);
 	int index;
 
-	index = calculate_array_location(drvdata, tgu_attr->step_index,
-					 tgu_attr->operation_index,
-					 tgu_attr->reg_num);
+	index = check_array_location(drvdata, tgu_attr->step_index,
+			tgu_attr->operation_index, tgu_attr->reg_num);
+
+	if (index == -EINVAL)
+		return index;
 
 	/*
 	 * Serialise against tgu_dataset_store() and tgu_enable(), which read
@@ -42,8 +69,20 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	 */
 	guard(mutex)(&drvdata->lock);
 
-	return sysfs_emit(buf, "0x%x\n",
-			  drvdata->value_table->priority[index]);
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
@@ -66,9 +105,27 @@ static ssize_t tgu_dataset_store(struct device *dev,
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
@@ -85,22 +142,41 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 	if (tgu_attr->step_index >= drvdata->num_step)
 		return SYSFS_GROUP_INVISIBLE;
 
-	if (tgu_attr->reg_num >= drvdata->num_reg)
-		return 0;
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		if (!drvdata->num_reg)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_reg)
+			return attr->mode;
+		break;
+	case TGU_CONDITION_DECODE:
+		if (!drvdata->num_condition_decode)
+			return SYSFS_GROUP_INVISIBLE;
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
-	int i, j, k, index;
+	int i, j, k, index = 0;
 
 	TGU_UNLOCK(drvdata->base);
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
@@ -108,9 +184,23 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
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
@@ -153,10 +243,31 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
 	}
 }
 
-static void tgu_enable(struct tgu_drvdata *drvdata)
+static int tgu_enable(struct tgu_drvdata *drvdata)
 {
-	tgu_write_all_hw_regs(drvdata);
+	int ret;
+
+	ret = tgu_write_all_hw_regs(drvdata);
+	if (ret)
+		return ret;
+
 	drvdata->enabled = true;
+	return 0;
+}
+
+static void tgu_set_conditions(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
+
+	if (drvdata->num_condition_decode > TGU_MAX_CONDITION_DECODE) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d condition decode regs, clamping to %d\n",
+			drvdata->num_condition_decode, TGU_MAX_CONDITION_DECODE);
+		drvdata->num_condition_decode = TGU_MAX_CONDITION_DECODE;
+	}
 }
 
 static void tgu_disable(struct tgu_drvdata *drvdata)
@@ -210,7 +321,11 @@ static ssize_t enable_tgu_store(struct device *dev,
 		if (ret)
 			return ret;
 
-		tgu_enable(drvdata);
+		ret = tgu_enable(drvdata);
+		if (ret) {
+			pm_runtime_put(dev);
+			return ret;
+		}
 	} else {
 		if (!drvdata->enabled)
 			return -EINVAL;
@@ -266,6 +381,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -273,8 +396,9 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority;
-	size_t priority_size;
+	unsigned int *priority, *condition;
+	size_t priority_size, condition_size;
+	int i, j;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -294,6 +418,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
+	tgu_set_conditions(drvdata);
 
 	drvdata->value_table =
 		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
@@ -310,6 +435,23 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
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
+	/* Initialize all condition decode registers to NOT */
+	for (i = 0; i < drvdata->num_step; i++)
+		for (j = 0; j < drvdata->num_condition_decode; j++)
+			condition[calculate_array_location(
+				drvdata, i, TGU_CONDITION_DECODE, j)] =
+				TGU_CONDITION_DECODE_NOT;
+
 	drvdata->enabled = false;
 	/*
 	 * Create the sysfs groups only after the backing storage is fully
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 7a3e1161c4cf..8b6a46995a5f 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -19,6 +19,8 @@
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
 #define TGU_DEVID_STEPS(devid_val) \
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
+#define TGU_DEVID_CONDITIONS(devid_val) \
+	((int)FIELD_GET(GENMASK(2, 0), devid_val))
 #define TGU_BITS_PER_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -52,6 +54,7 @@
  */
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
+#define CONDITION_DECODE_OFFSET 0x0050
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -63,6 +66,7 @@
  *
  *   TGU_MAX_STEPS            static tables define step0..step7
  *   TGU_MAX_PRIORITY_REGS    STEP_PRIORITY_LIST defines reg0..reg17
+ *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
  *
  * A device whose DEVID reports counts above these bounds is clamped, so writes
  * never fall outside the ioremap()'d window or spill into an adjacent region.
@@ -70,12 +74,16 @@
 
 #define TGU_MAX_STEPS                  8
 #define TGU_MAX_PRIORITY_REGS          18
+#define TGU_MAX_CONDITION_DECODE       4
 
 /* Calculate compare step addresses */
 #define PRIORITY_REG_STEP(step, priority, reg)\
 	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
 	 REG_OFFSET * reg + STEP_OFFSET * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -87,6 +95,8 @@
 #define STEP_PRIORITY(step_index, reg_num, priority)                     \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
 			reg_num)
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -110,6 +120,14 @@
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
@@ -117,16 +135,32 @@
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
 #define MAX_PRIORITY 4
 
+/*
+ * Neutral ('NOT') value for the condition decode registers. This is the
+ * driver's default so that, before userspace programs a real decode, an
+ * enabled step does not spuriously match. Used both when seeding the shadow
+ * table at probe and when clearing it via reset_tgu.
+ */
+#define TGU_CONDITION_DECODE_NOT 0x1000000
+
 struct tgu_attribute {
 	struct device_attribute attr;
 	u32 step_index;
@@ -136,6 +170,7 @@ struct tgu_attribute {
 
 struct value_table {
 	unsigned int *priority;
+	unsigned int *condition_decode;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -166,6 +201,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @value_table: Store given value based on relevant parameters
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
+ * @num_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -179,6 +215,7 @@ struct tgu_drvdata {
 	struct value_table *value_table;
 	int num_reg;
 	int num_step;
+	int num_condition_decode;
 };
 
 #endif
-- 
2.34.1

