Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC5C3AFD06
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398877; cv=none; b=StW5rx6ewjPmbQGRq8PQjQJNlv5prR+tuQfu2YCeCBakAakCSHlHkIXjmjtZ1K6N52bBxufsuLp53KXx7Vl2EjREc/BblPWffV0gVMoNshnchplE0qCz4guGTAtnWg4weaPBnXq/Gw1HBTOJ8JpMt7oFjiApo1jZQgs7zrrJvOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398877; c=relaxed/simple;
	bh=clgs6/xQ1qYVoxEKVQu9ieeGxlp7EHfRgnQ+Y7xMjjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YMXuIRGrqYmR0zoHOhi6F9heELDZvSYtGvONVxto7ojbRYckNxp5eFQSMPclnAsu3eVjtdmBan+TkT6Ut/YROK/fJBvGDXqPNOliGf18zCzRCEEZyqX3rsWeJIdAsqMokNGfKsVsRIGWaWTdnrvRZwqC2mwcxm1I6sudXAMBCxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBVwFDwB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTP0RORT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBVwFDwB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTP0RORT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6axJY4140869
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DfH1Ck28PN3
	WVuajMVN8VUNzgsO8gPW7AD8bgfNeufU=; b=lBVwFDwBiexPCUDBOKjEJXHp8tg
	mXgWWlgWVwuwhk/6oWoSCW41J9fINEea6wrjjQGgQNWpeZ8j+DR2vSltfDX1D8j3
	yhZZrHNVXk0EhMhY6wfM2xmRWTiFD4Xc+p4Qd/3hk22Vul6AeK2Tl3a3MpFm1m4K
	RMqHpQUroBabBZ5w6i9A06i2VcY7kEbeFUnrt95QaSuOMQ1QdEl0tkEPauVZ5jju
	FytY1/+CjjHuhY/6gMRmyymiI3Z8GMMolXcoOBUfIJPm9uO3mjxeN9lB0bNrKJl7
	A4pVr+S3WloTBBxh+Q4nEjZEv9CShlPWqj0OV2563/gY6vdBG76IVhRZ3uA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr19grf3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:07:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa55c9430so16888205ad.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 01:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398869; x=1786003669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfH1Ck28PN3WVuajMVN8VUNzgsO8gPW7AD8bgfNeufU=;
        b=DTP0RORTXsdySbSjWJiMqhYi2MKcNDgjrcLNxpl/RfAbc3du7dYnaqOBzN/DMJZwC3
         NSj05ZXgIw1/s8yteGPPN//UNa6++U+2FQJvsId+u51p6tU8i0jNMekzardH8nO+nx66
         7OB/WqHcm/lGzj/SkXqVqp0WnCC5IUlOBudlFb3oCMrbuO8imSM7yZnU95/HGervdq+a
         Uvw+YZuF7mYNK8kmmHQbUP1gFc7Blykl/7hmVYzgHJsKtGAZOcSQjdWf7kQr6N7fngRS
         vaCZegBHy25+SVJ9hmfqHeeY/1S0iaDU116nbqjufKKDMOgdF5bVeqVePV4o460LMhpc
         o9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398869; x=1786003669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfH1Ck28PN3WVuajMVN8VUNzgsO8gPW7AD8bgfNeufU=;
        b=XXabOV8ZCkprtU350ASy9Id4aZx4jju9l+bfhe7I9IF245P1f24RFnYF75m8BKH+s6
         LNh4Ww+rvTiyVisiQNby1NKSHPNDYq5n2j52mvbPBKSiHpE9xGOgUff2puHc3brarK1w
         9xNtJcV1bp477In8jizW+xTyj2+rhxXa3wBYBXMZQpirA8bR9/U32neQOQDZH5pVe/im
         1kGovJxlxK5gjsged7dnf5DuPDp486J33I2J2Ugl7f/ldJPavGF6tu+zko0ivdx4olLz
         HbHzzZjHvCFJSTk1ndRacvtncKfb9MBNM5JcROtUgcyrYFa/SXImnasWfrc9ltDlADCJ
         SDmg==
X-Forwarded-Encrypted: i=1; AHgh+RpG3AZULo+yquewVw/bS2JjfDxL+J6Midbr+Eo+7BgeIq6IYQc6aA+wns+Dpx9wjfLmZ1mCyAHuH7oE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8wxMgPaAYQ/r/5Oa2a98RfVBreuyj1rZF55TWUBUN90egw5Tx
	3obYL9aedv4PLRZc7O06Xg+4/WqsLzr00DtGLVMTD+lRom+z5uQnX/SsPdCKceGhwyKBoIwoYOv
	Y7cEiXW3aldSFPe01nr61t1vjetVmj/F88fNZQJ1o6F/VS3Q1AvUe2btT01iVJTxW
X-Gm-Gg: AR+sD10vrgLW2XEZgLxRqjrnjzXKd1/tNHiUz3BRBMADZ7fszA9yaIhozi+hSnk8oCz
	S9F0AUVWBFLzktFj73Fn278LS3Mfp8fpzD7ptidHatcAWSiGEjMKnsNUtPkLa9sNrJf9OV64pyi
	kIeQpA2Eq/CLPFzQpDkDF5w6T/U+aJJ9/KZ+xciJkKFS30yR7mNe8JYzaol+1/Sz1jgk/wlVnHz
	yiAU+tl6Qf36UDvOOnE3ngyKOGhHnXqYx+ciqEpQtBYNhLnrYd8xDzwP8KkUVAIOE2GaggikqRS
	s5PlwegKUYmlLrvRuJ1zhAWEQrdaCtlpS3Cfz2pIVR8Iy6yLn9H+EqtyGXwxNm1eaU+R7rOIzRu
	EcjqUNULivPhvcozujUZBB4gtA4KKIm6eQE36/l6GQGpdVivwqX4Abcc=
X-Received: by 2002:a17:90b:1e41:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38f9bd692c0mr1274843a91.7.1785398869216;
        Thu, 30 Jul 2026 01:07:49 -0700 (PDT)
X-Received: by 2002:a17:90b:1e41:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38f9bd692c0mr1274810a91.7.1785398868613;
        Thu, 30 Jul 2026 01:07:48 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9bab61desm619516a91.13.2026.07.30.01.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:07:48 -0700 (PDT)
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
Subject: [PATCH v16 5/7] qcom-tgu: Add support to configure next action
Date: Thu, 30 Jul 2026 01:07:02 -0700
Message-Id: <20260730080704.2903540-6-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX1/Oo1RFDrFhc
 OOD8BiYivNl0XixhBFaGXnLPgKXvUM5Q0pRll/wDNeRe1Q7+sbkkLE8346cF0s7GAj2fZ8TFdYv
 /k9r5vyNTqgbiQYtoVcFpKFML1ZuXF6aCrbczy6CGCo9Bj+6v0tyuV+s4BdbiXV26FGnGNoI6A0
 2e38lwDQnTBNSZQPdoe1Y7QdpR8WMyQvEMABPJDg4TlnFo02gsgfAG8oU8vXnw4/DKckv/LEAiQ
 xGN4W4RViOv7H4irpX8MxqpGX08lcY81/MJqRsdaAFLshbewzk5kego5qJx3e+aLQh1Pih8T6SP
 wdB4zHOqxdhW/bwhqbMdokvFlrrPpXrWe6d1SLtN0BQM/IepH09Hc3Z/u6xhcTtABQMVuLUFCLF
 6Zuw6L8Tnh2ysmLk57LpgfiWIisar/hB4ynJSgiAODIiCRY5geA+LV4UciCTf/4Y1hw+ZzO0etO
 sPFKL3cYqHU2Oop7t8A==
X-Proofpoint-ORIG-GUID: iRXqrYPTeQmBkJOcrGsEWXY5GjhgcN16
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX5i5hk5MFnSXr
 LvrnLcdilL+lqPt34+PVM8C5W5Q0P8DqcMRwDP9GmxtQNfKH4XhP/YxsknykS3609jOgk/Vvoyo
 igY4XzGy1a3fX8pVl1wRInIpxPimC9Q=
X-Proofpoint-GUID: iRXqrYPTeQmBkJOcrGsEWXY5GjhgcN16
X-Authority-Analysis: v=2.4 cv=d7bFDxjE c=1 sm=1 tr=0 ts=6a6b0655 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=M6CtMt7H_-T_vrAemPkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300057

From: Songwei Chai <songchai@qti.qualcomm.com>

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songchai@qti.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    | 16 +++++
 drivers/hwtracing/qcom/tgu.c                  | 68 ++++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 41 +++++++++++
 3 files changed, 123 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 705e75c776d4..fa9e9083065e 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,19 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/default
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the default next action for a specific step of the
+		TGU. This is the last register of the condition select region
+		and is applied when none of the numbered select registers match.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index e83295217e7a..7f0a74514e40 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -30,6 +30,16 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 	case TGU_CONDITION_DECODE:
 		return step_index * (drvdata->num_condition_decode) +
 			reg_index;
+	case TGU_CONDITION_SELECT:
+		/*
+		 * The 'default' register is the last one in the select region;
+		 * it is exposed with a sentinel reg number, translated here to
+		 * its actual position.
+		 */
+		if (reg_index == TGU_SELECT_DEFAULT_REG)
+			reg_index = drvdata->num_condition_select - 1;
+		return step_index * (drvdata->num_condition_select) +
+			reg_index;
 	default:
 		break;
 	}
@@ -79,6 +89,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->value_table->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->condition_select[index]);
 	default:
 		break;
 	}
@@ -120,6 +133,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->value_table->condition_decode[index] = val;
 		ret = size;
 		break;
+	case TGU_CONDITION_SELECT:
+		tgu_drvdata->value_table->condition_select[index] = val;
+		ret = size;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -158,6 +175,17 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_decode)
 			return attr->mode;
 		break;
+	case TGU_CONDITION_SELECT:
+		/*
+		 * The next-action ('default') register is exposed as its own
+		 * statically named attribute and is always present. The numbered
+		 * data registers occupy the positions before it.
+		 */
+		if (tgu_attr->reg_num == TGU_SELECT_DEFAULT_REG)
+			return attr->mode;
+		if (tgu_attr->reg_num < drvdata->num_condition_select - 1)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -196,6 +224,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_DECODE_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_select; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_SELECT, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->condition_select[index],
+				drvdata->base + CONDITION_SELECT_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -268,6 +308,12 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 			drvdata->num_condition_decode, TGU_MAX_CONDITION_DECODE);
 		drvdata->num_condition_decode = TGU_MAX_CONDITION_DECODE;
 	}
+
+	/* select region has an additional 'default' register */
+	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
+
+	if (drvdata->num_condition_select > TGU_MAX_CONDITION_SELECT)
+		drvdata->num_condition_select = TGU_MAX_CONDITION_SELECT;
 }
 
 static void tgu_disable(struct tgu_drvdata *drvdata)
@@ -389,6 +435,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -396,8 +450,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority, *condition;
-	size_t priority_size, condition_size;
+	unsigned int *priority, *condition, *select;
+	size_t priority_size, condition_size, select_size;
 	int i, j;
 	int ret;
 
@@ -452,6 +506,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 				drvdata, i, TGU_CONDITION_DECODE, j)] =
 				TGU_CONDITION_DECODE_NOT;
 
+	select_size = drvdata->num_condition_select * drvdata->num_step;
+
+	select = devm_kcalloc(dev, select_size,
+				sizeof(*(drvdata->value_table->condition_select)),
+				GFP_KERNEL);
+	if (!select)
+		return -ENOMEM;
+
+	drvdata->value_table->condition_select = select;
+
 	drvdata->enabled = false;
 	/*
 	 * Create the sysfs groups only after the backing storage is fully
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 8b6a46995a5f..cee55f66f629 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -55,6 +55,7 @@
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
+#define CONDITION_SELECT_OFFSET 0x0060
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -67,6 +68,8 @@
  *   TGU_MAX_STEPS            static tables define step0..step7
  *   TGU_MAX_PRIORITY_REGS    STEP_PRIORITY_LIST defines reg0..reg17
  *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
+ *   TGU_MAX_CONDITION_SELECT select region 0x60..0x73 holds 5 u32 registers
+ *                            (the last one being the 'default' next-action)
  *
  * A device whose DEVID reports counts above these bounds is clamped, so writes
  * never fall outside the ioremap()'d window or spill into an adjacent region.
@@ -75,6 +78,7 @@
 #define TGU_MAX_STEPS                  8
 #define TGU_MAX_PRIORITY_REGS          18
 #define TGU_MAX_CONDITION_DECODE       4
+#define TGU_MAX_CONDITION_SELECT       5
 
 /* Calculate compare step addresses */
 #define PRIORITY_REG_STEP(step, priority, reg)\
@@ -84,6 +88,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -97,6 +104,20 @@
 			reg_num)
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+
+/*
+ * The last register of the 'condition select' region is the next-action
+ * ('default') register. Its position depends on the runtime value of
+ * num_condition_select, so it is exposed as a dedicated statically named
+ * "default" attribute carrying a sentinel reg number, rather than renaming
+ * a shared static attribute at runtime.
+ */
+#define TGU_SELECT_DEFAULT_REG 0xffff
+#define STEP_SELECT_DEFAULT(step_index) \
+	tgu_dataset_rw(default, step_index, TGU_CONDITION_SELECT, \
+			TGU_SELECT_DEFAULT_REG)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -128,6 +149,15 @@
 	 NULL               \
 	}
 
+#define STEP_SELECT_LIST(n) \
+	{STEP_SELECT(n, 0), \
+	 STEP_SELECT(n, 1), \
+	 STEP_SELECT(n, 2), \
+	 STEP_SELECT(n, 3), \
+	 STEP_SELECT_DEFAULT(n), \
+	 NULL               \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -142,12 +172,20 @@
 		.name = "step" #step "_condition_decode" \
 	})
 
+#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_select" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
+	TGU_CONDITION_SELECT,
 };
 
 /* Maximum priority that TGU supports */
@@ -171,6 +209,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -202,6 +241,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
  * @num_condition_decode: Maximum number of condition_decode
+ * @num_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -216,6 +256,7 @@ struct tgu_drvdata {
 	int num_reg;
 	int num_step;
 	int num_condition_decode;
+	int num_condition_select;
 };
 
 #endif
-- 
2.34.1

