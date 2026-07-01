Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0A3939A4
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 05:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885378; cv=none; b=rD8hO2Oi6/FTK8vwc3rGdWRSzhbICaQsXVWU0Cz/ZRd0M3Jvr4BxTXnoyySXMB3IMx0EK8XdfXY8RwdaNkXoPgqj74wEujocN9gmQ8HjxWcjl+6R4qzO4SiYMIv3BPeAzhSJD3lju11fgN4N7GWhqTgbSgkXbn/Up8VdnxUds+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885378; c=relaxed/simple;
	bh=rO1680jZtOI6hni5OVY8zVVBB9ABCBH7Xd4meyvXyz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TkNf/S5NcuvWFyI5I6x88ZWMesCJ45vYSjQd5SL0q3Ro+uI4rHa16JbqzY3KHcz2cltiWesa19lI4voFSCQGEyMtmNfvO0ky2xO7DVCwQtXMYXHNReN/FbV3fxqbCFb4TnDbh2jcdLfgfizOl9jhxs0MwyeLnWcvERtd4zImfyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWgk8PBU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+ltnX+k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWgk8PBU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+ltnX+k"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615m4eo126598
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 05:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MUf0NyAIldl
	G+omXNsLNYooLiKFeXObyleB0gNLxAbs=; b=kWgk8PBU7QmAldZL9uoCBLS3FDR
	oPKlZT1GJkQGSFooYyGnPRQ1a7tPiJ9Tde9755Ibyp2+KVodBSKN/GanwQkCH/fL
	NXEmpHpYCCFo1kwLa5oc87cbsWIsbpjBB3WpzDgYkhl6KNM76sftC1N/qwQUyfiy
	NTbaT481hHbnI1hD40DZiG106b1Ja1vxVvwfuAchrS39W6mPFHd2K8iqqk6FJO5x
	KQiosz7rbmNINQ2gunlKpFESvgUtDxRY8kmQqY06FkeIswCRxw0bnFnnMSvsJTHx
	O+wjRvmhxobI0Zojg20GYLxc53j85a3M+y41yOT4SZTxN8uo7ZtE9eJzgOQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc0bk4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:56:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c80f89b64bso5542875ad.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 22:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885374; x=1783490174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUf0NyAIldlG+omXNsLNYooLiKFeXObyleB0gNLxAbs=;
        b=U+ltnX+k+vUTkWraSHqepw2hDlVmyvpX9XLyIX2sEojcaDK/45tJVfNBuk7I/fTgiU
         XSvOUXi3ZbHfr9wNP1Rul7VzP0LlwWP+DCyyw26HzSHAwPCEF/eCKdPIEqJYZW1x9lBE
         jfZ37TuJoXQG+0zatxM0CHP84wzu8fECbuzJ/gmrTCr7ziI3SGi5H8cpL/VPXYtfqTVA
         FsqcCyo+wwzLQNE/JQSBZ6M6ghU8ZksyTHLy1Ynx/0ZsHqvVDOxT0fAXDklA+5AdHczl
         FZlGQXuh6lGf+CQdjC11mGLfDRIVXizPEd4gNeph79OcvJOCfmu0Oy+S9sexTLWPdZNw
         fT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885374; x=1783490174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MUf0NyAIldlG+omXNsLNYooLiKFeXObyleB0gNLxAbs=;
        b=kwdtcaFpsmZiRcAP0oHrTiZlXGQuZzRhN5h2YgeGz4BZ8sMLfQJGdsVTOiM7X1XQea
         eSwMXQs2cm1uOqPdFzHI3yaDKizQ2UxHiNck6MTDfxEhz7alSBljk8XIWDe6mI4Jd2/l
         9cZ8it/gPkTAfA3CTvz/giLbVTD76qgeciJxB7xskpbKa9wxPq2RSuw+ac2s5B2Yas1Y
         QeTV58VX+KrqUeaOimMKldCPgS2Sb+VHpnClBqlYhj3Km5Bf0668kmCUSR231dqpEbKw
         h/kvejPzjUbU+UWYL/97OxoYhc6KcToLbmxjynhGzDr4n2UlHahbWZyJfrg8Y1ZHq3Yl
         3YgA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Hlvp/IqS4h8+V2NyG1IU9R0+Pu98Qwnr81ponQmrL0G5i9vqaIuvn74wByYq3hkzKQawXo1qNMCI@vger.kernel.org
X-Gm-Message-State: AOJu0YznAcNhVT6mODyIKHT3P4/dn1THcIhLpFwzc6N35avrrQAkB2Oj
	gVj8u53R5urePf5DD3YguDuSCCPtV2W5cNUSuOZ05HZRa0ZiMJ1IWWmAzbDpwFt1l+EVh9Ojfh1
	OzdvnnWn3xUi62u4wn0SxkizW1rvbf2n6asTVPfNlUszsGWYzVn0lPjDAPQz67B/K
X-Gm-Gg: AfdE7cnudKwMGLCrZYdsNcgBdTqzQrBg/giOkVnWtZTp014bt1BfpS3FIM9jLmomDAK
	26fROgBAuMy/jHS9cn/CBTxvCdtzT358UXJPFl8MT4hNqraveSGOk/WqWKYfBWY6b0nnCoFYKiQ
	c4wJYnDwFwprfhQX7NjEdez8KFXbf0aLoz+7oYCWVCBriPGZM/eUphXzqpMXbOOH6UswZQ4NyDK
	1Znxz/M10T8Aj0k6/2pNiumN+9O7Vp6f+mQrM5wF5pfkgE0RKFxguZNv179B6/77ZX9AKJUC+2e
	zq63SuIiKGb8/LMJUKLb179QjcanYTwjeH9XwsKiqjP+G7lKjnykYbG6y57u41r90ZBq67NUKK5
	FOh5pq3lMbLMvRb5k3oPHBN+lBt/lfx23FdEkVA65TvRstgTUacL2xmuxZ/+davXaEg==
X-Received: by 2002:a17:903:1ce:b0:2ca:26:195d with SMTP id d9443c01a7336-2ca7e6a9f0cmr3874845ad.11.1782885373744;
        Tue, 30 Jun 2026 22:56:13 -0700 (PDT)
X-Received: by 2002:a17:903:1ce:b0:2ca:26:195d with SMTP id d9443c01a7336-2ca7e6a9f0cmr3874655ad.11.1782885373278;
        Tue, 30 Jun 2026 22:56:13 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:12 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v15 5/7] qcom-tgu: Add support to configure next action
Date: Tue, 30 Jun 2026 22:55:27 -0700
Message-Id: <20260701055529.445819-6-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX/LTDb0Rs1xwc
 HU/p+d/+ySpWnvFEoX3xGIE9FFmDBVwVQCZCI5iurXw8CFgYueR5UiZURKuyw0Whz4lLsLa68uk
 S/TIGjAPswobW6Oj0cNNa/CzShOCCLHh/pLyIogk/4IVqa6AuwA8l6oqj3y1oMvVEyuT0bxoo74
 iGhXs1PjDwVubrouQN9MTn6IVb5hWilh0aHckJf4E2IiO1jiYHAU7nYn3to4SNggQCxwvNqINX0
 SSGrjAW0dxLM/DK2M3RBlg2J2Qir1uCBwJFxQQD23qmg+nDCblOJRn5yv2MiJRzlrzJx733EvtN
 dt63Qx9KMm+a0sLoWfYpVMeQVpZkpChIHya9/gitItZHa2i2NoZQePlgQu6NxIhrPGzbEI8NqYE
 L2bl+c+p7pSMx0tF2NS0UqsvsriMd3QpInjXu6C/XoZ9E6rGFWnGn9XDrqumIPjufhAaZePBYEE
 jLQGHDOCPwRTMlONyvA==
X-Proofpoint-GUID: FQA7taw_GeMVnnpLc4mX9bG3BNXAQxlI
X-Proofpoint-ORIG-GUID: FQA7taw_GeMVnnpLc4mX9bG3BNXAQxlI
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a44abfe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=s623Ih-0px1LxcEVn60A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfXxB/gFlzwubvE
 T9js6PTAuW/t/MFeEK0Se77vxVaNvzVmPNUKyVxy4ZsOcS0FiCmEPJZdyuR66w6qdWb4tPf25S2
 JK4ueaxOugvOlij9lCCTsmhSHyyhQIs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010058

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 +++
 drivers/hwtracing/qcom/tgu.c                  | 53 ++++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 26 +++++++++
 3 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 81a4e6036b72..f8b4ea199faf 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		July 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 937211923d93..fefe932059cb 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -29,6 +29,9 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 	case TGU_CONDITION_DECODE:
 		return step_index * (drvdata->num_condition_decode) +
 			reg_index;
+	case TGU_CONDITION_SELECT:
+		return step_index * (drvdata->num_condition_select) +
+			reg_index;
 	default:
 		break;
 	}
@@ -71,6 +74,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->value_table->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->condition_select[index]);
 	default:
 		break;
 	}
@@ -112,6 +118,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
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
@@ -146,6 +156,13 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_decode)
 			return attr->mode;
 		break;
+	case TGU_CONDITION_SELECT:
+		/* 'default' register is at the end of 'select' region */
+		if (tgu_attr->reg_num == drvdata->num_condition_select - 1)
+			attr->name = "default";
+		if (tgu_attr->reg_num < drvdata->num_condition_select)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -184,6 +201,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
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
@@ -223,6 +252,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 
 	devid = readl(drvdata->base + TGU_DEVID);
 	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
+	/* select region has an additional 'default' register */
+	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
 }
 
 static int tgu_enable(struct device *dev)
@@ -366,6 +397,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -373,8 +412,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority, *condition;
-	size_t priority_size, condition_size;
+	unsigned int *priority, *condition, *select;
+	size_t priority_size, condition_size, select_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -425,6 +464,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->condition_decode = condition;
 
+	select_size = drvdata->num_condition_select * drvdata->num_step;
+
+	select = devm_kcalloc(dev, select_size,
+			     sizeof(*(drvdata->value_table->condition_select)),
+			     GFP_KERNEL);
+	if (!select)
+		return -ENOMEM;
+
+	drvdata->value_table->condition_select = select;
+
 	drvdata->enabled = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 56e4161a8bc2..c61aa8dc51b0 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -52,6 +52,7 @@
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
+#define CONDITION_SELECT_OFFSET 0x0060
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -63,6 +64,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -76,6 +80,8 @@
 			reg_num)
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -107,6 +113,15 @@
 	 NULL               \
 	}
 
+#define STEP_SELECT_LIST(n) \
+	{STEP_SELECT(n, 0), \
+	 STEP_SELECT(n, 1), \
+	 STEP_SELECT(n, 2), \
+	 STEP_SELECT(n, 3), \
+	 STEP_SELECT(n, 4), \
+	 NULL               \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -121,12 +136,20 @@
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
@@ -142,6 +165,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -172,6 +196,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
  * @num_condition_decode: Maximum number of condition_decode
+ * @num_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -187,6 +212,7 @@ struct tgu_drvdata {
 	int num_reg;
 	int num_step;
 	int num_condition_decode;
+	int num_condition_select;
 };
 
 #endif
-- 
2.34.1

