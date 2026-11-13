Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538330;
	b=F++W3yuQcd+VQZwpDBBJiYF3/+8oCf0NOAYS6UKgQsLMgBMkbrS6coF6Ow/zssysalLa
	 /wNdLi1an10DYO0H/7R5OeIVmMYBJvsJJ0pU9w1H7DuH3hwz8ErvHRhWyqv1s9/bBBBIR
	 GhWaXxJWi9Gf5bJO7ZiA9nyULouLwgBvgdyLXbOOwrYPQ5UMR8mzAxs2Ub36Z6f/y85+b
	 7xqmos0aBOB/WPnr3O15pEzcM1q5zFVM09waHdYFwndcQ3TWgKlsAq+0hns3EsCliIR8G
	 MpNNtpvewKP4Tv9rkO3v2eNmBX5ACph0s6azWM2mVKziUiUCs7eRyIo0ZmqJzQo+gbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rt+yswoVsddFJ0hASYpGEoIJR4zGJNL72Q627p6RiSk=;
	b=LTkEi8D3G8sDILZUlfcr4V+Sr3+K174cjlAmw7B2QnTbQgSomWDHdmsKeOnnLZLHAtCU
	 ulF/N7IvBMcDEqSYhBTkrfTWgpf523Gp2YE0vSoUi5EZRM4fUpelGak48pt279crChaS9
	 vT56W+GGHOYKwZeyztyW3d55PM0NY6KufjtXfxKSxTB1uXFqakutvYDBZZwoMUva1Bi6U
	 by+RGkPJ5sh/w84bjdg+JMsBL67XIWnH1YROXENY2x5YVY7ps4Cy2D8rtnjSqqZY6TvpW
	 GJTsv6FZJR81oVj4iGz6e4cRvGbm42Q7yIpItF2gTo5a4xVGBoPMSwwN85vsnNYGgew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oesadp/a";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEaO7U3m;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C59660A3828
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C59660A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oesadp/a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEaO7U3m
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KJPf1534473
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rt+yswoVsdd
	FJ0hASYpGEoIJR4zGJNL72Q627p6RiSk=; b=oesadp/aIgilEB2ORnD6RTq/FPY
	pS0VobryYoTvZHCM0jepLmf3NXT7PoaXDKoQ9bAbg5Snd9gUF5z/Il2VZJtyYtXH
	BkMXmAVJpSISsIXolrXHB+knTpD84I/0ny8+7tOkk+3tsqfgZNI4zkTxahESZ63p
	pjTXledm7yMsiUu5LXiCYdTavpNx9RTy+EyiTheDECqjmRL+7r5g8F2PaW83q3UK
	TtXkxPsPG6cdI7OMZc6nuxSXdVNTQbRvQ7mLWIm/Hou0yBHvYMTAOiXfrtJ6IVjK
	ibdp0BojXT6emcjpmc1wVqkrx9SULm5KS73IEaSN7AhQUTZ+B5pHvZizAnA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1ba5b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:52:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed077a15c3so4276025ad.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538328; x=1795143128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rt+yswoVsddFJ0hASYpGEoIJR4zGJNL72Q627p6RiSk=;
        b=UEaO7U3m14FDVuXIvEgK834VP2K+6uq1WbEWzuGMFcj3orU2C5X4gEeVDV8Dj4koas
         7EwRURsiA2rJELBx30+amqgLybRx80+jBrWu3opp3F948lc9Hp229MyQHPW1Vj2VJxSm
         ZnvJhT7U/xwp9VulV+xUnGvAr8eIJbX18Lo5YyepMzZc8vnjdnSmOWP0N4dlobMQdsw0
         spb1OMAObNcsFmJwCgrbEQSNTOt5mjpl4uZaEHXK6yRvb2rqAyvhSETsLM8xJbejOHRQ
         uqA7tI8WnzybCaaGFpWXWbgOpGnokQMZi8LVNKCWBBf3IJUr5oI8RrSxoUz7wt6SwNJ8
         i3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538328; x=1795143128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rt+yswoVsddFJ0hASYpGEoIJR4zGJNL72Q627p6RiSk=;
        b=LnyHJmPd+dYea3vNL+21uPRfFzBZNYjqdhQAtDXoE4QdrJLL4g+2CBwejbvhcMsBVU
         jBVc0yteKj1trrverebjD1fkdJj3Vm/YyXULaqcLLqIldXqbQO+j77fr+nPcVvijnqkh
         afAduN9cSM7oOy0St8lJCE2QNCxivsOJiNIBbMc+gSEdw7Io9lbVi61Fkioz3rNqCs12
         nvTjxpMs/jxEf3Tb1aPSlFGANSqRGvjRtwo2VoPXly4+XCLIwfA8sMIkHQu5lwgLNihd
         bpX7puYNpWauBSiQsRHCmTEAIr/iqkwOi28/0xWS3BbMxS1HUM93oBxgtDt23bvLmSeT
         KrNw==
X-Forwarded-Encrypted: i=1; AL+hErGHEjXSYP7PKMr0nfdBfJxjoI4zf2t9b+fFWeHUOIzPpu4nnKcjQvrvEPHHMzUUdA693KfRPB6EOYfH@vger.kernel.org
X-Gm-Message-State: APuU4Z9u8vYUjJheNfSOvPcY+///3RBznW4xcx0J4oeJCiBodkZZTJVw
	Ny5KuZULPVMY/ao9IC59b8nHk2NFDBdtrQiiM1uv2OCDt+FgFWXR4ai5HU1FXIBt7lGVdVYcbgK
	shsHzoCGcUNALZGI6+ITkLHXz5xv8kXkeAGd+PgcRMBxiTT4V/5e+Q4dGBCzOAn0E
X-Gm-Gg: AYBFou2Yo5rfb3KVWdUIdEixz9X31D+wOSXdMXY8tSGUchwJRmBvwH6xpz80a72+aow
	9wXrzfnklLSoubGsvfSDBHZCpt4inYVd1JYpLZVHjMMArPGt/7lH5MUNQNwHWm+p9R3PNiFqeh0
	HhtUseyjeAxY9Cclc7+Oi3cLiPsAgInjTTm9zP7rhtivM4UHZr1ogWEZOawcLvcBRRyyU54rUa+
	U5C5f4YMMnPmWMskSBNiF5KTPkBmHBXCzEMfIEEcGFD07Th0uR+slbr06W3kHe7l5T6jr0PHYAJ
	U3l/l4uBaR9GPVASe/2qWYDi+ZSHmXyLk75FsJmL9NNgE2THls/DfHZEqRnEzdnNDpWeqehPY5o
	FYo7mgEmzwxzjZx7IgFNbS9ZpvWmfGjUo/il5DKZ+xzrQbpsP0gQnhMsSmv4Z5CC2uAtTJrDoCz
	RJS5HWhqk=
X-Received: by 2002:a17:903:3c64:b0:2ec:ff7f:6f1 with SMTP id d9443c01a7336-2ee0da7bf4dmr11494435ad.11.1794538327438;
        Thu, 12 Nov 2026 18:52:07 -0800 (PST)
X-Received: by 2002:a17:903:3c64:b0:2ec:ff7f:6f1 with SMTP id d9443c01a7336-2ee0da7bf4dmr11494245ad.11.1794538326918;
        Thu, 12 Nov 2026 18:52:06 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:52:06 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v17 09/10] qcom-tgu: Add timer/counter functionality for TGU
Date: Fri, 13 Nov 2026 10:49:34 +0800
Message-Id: <20261113024935.3173715-10-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af67b58 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=dL9TNO4Ss2-3uZuT038A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: CzHDUQG6Fxp9helVo3nrj83c_LEbNwh1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX3thMQ7uySWXk
 7Z64sqAEjBP3wrCpOXhM6z5bFtuLl63B81xZShEaLjrOUONmXfvKL19Q3qLbNV6VVJGr/RUQ1uD
 FjyWyksQjhpYRBeDhRopSGn6Ri1w1XIvS/erhelmfZg3FtjRttZje4DMg+nBeLFS7E7wWABcFud
 Ot+pwUnGYsMd+JeeEEBXUvkXObu0Z3tMzrBsrL8K4HS6Vcfyot4oLClsO68HUYYCuUtEeIKEuYv
 VsOeIPnmz4LpYprAsL8xZUINypeHQ35iVXJNRnLA2m3m8TxVLMTbr3wegy6PIRkXKgze6FioA+t
 tVcl9035xf5lcI3PUlWFO1KCxalQtP59jOKcewggJQr+9NJL8eGLPJp2nq9fCUqbmiiZey+sQ6C
 jV4wg0RGZwby424+ofQoM302burPfLkKQkQUlHzJy3+XlS9j63lcNVGqyxynPfvj2cnjd80c6GK
 MCOdQlttEyIgyPtKtlQ==
X-Proofpoint-ORIG-GUID: CzHDUQG6Fxp9helVo3nrj83c_LEbNwh1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfXz23b3n20WJMx
 CF2rulpAytA79pxTkVRddHJXINgyPL7/Zmmb2xOe9iZwU3SzETT0odGoeV9Nlj004bGqKdCXNN/
 3vg2qrCUtN24fhkHnMm0krlj+B1aJ88=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

Add counter and timer node for each step which could be
programed if they are to be utilized in trigger event/sequence.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 ++
 drivers/hwtracing/qcom/tgu.c                  | 120 +++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  |  32 +++++
 3 files changed, 165 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index f487881b7def..e0ea5419188e 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -37,3 +37,17 @@ Description:
 		(RW) Set/Get the default next action for a specific step of the
 		TGU. This is the last register of the condition select region
 		and is applied when none of the numbered select registers match.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the timer value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the counter value with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 6e66752a7b8d..1cb131a3c521 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -63,6 +63,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 			reg_index = drvdata->num_condition_select - 1;
 		return step_index * (drvdata->num_condition_select) +
 			reg_index;
+	case TGU_COUNTER:
+		return step_index * (drvdata->num_counter) + reg_index;
+	case TGU_TIMER:
+		return step_index * (drvdata->num_timer) + reg_index;
 	default:
 		break;
 	}
@@ -115,6 +119,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_SELECT:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->condition_select[index]);
+	case TGU_TIMER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->timer[index]);
+	case TGU_COUNTER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->counter[index]);
 	default:
 		break;
 	}
@@ -160,6 +170,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->condition_select[index] = val;
 		ret = size;
 		break;
+	case TGU_TIMER:
+		tgu_drvdata->timer[index] = val;
+		ret = size;
+		break;
+	case TGU_COUNTER:
+		tgu_drvdata->counter[index] = val;
+		ret = size;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -209,6 +227,18 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_select - 1)
 			return attr->mode;
 		break;
+	case TGU_COUNTER:
+		if (!drvdata->num_counter)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_counter)
+			return attr->mode;
+		break;
+	case TGU_TIMER:
+		if (!drvdata->num_timer)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_timer)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -259,6 +289,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_SELECT_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_timer; j++) {
+			index = check_array_location(drvdata, i, TGU_TIMER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->timer[index],
+				drvdata->base + TIMER_COMPARE_STEP(i, j));
+		}
+	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_counter; j++) {
+			index = check_array_location(drvdata, i, TGU_COUNTER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->counter[index],
+				drvdata->base + COUNTER_COMPARE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -270,7 +324,8 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
 	int num_sense_input, num_reg, num_step;
 	int num_condition_decode, num_condition_select;
-	u32 devid;
+	int num_timers = 0, num_counters = 0;
+	u32 devid, devid2;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
 
@@ -318,6 +373,21 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 		num_condition_select = TGU_MAX_CONDITION_SELECT;
 	}
 	drvdata->num_condition_select = num_condition_select;
+
+	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
+
+	if (TGU_DEVID2_TIMER0(devid2))
+		num_timers++;
+	if (TGU_DEVID2_TIMER1(devid2))
+		num_timers++;
+
+	if (TGU_DEVID2_COUNTER0(devid2))
+		num_counters++;
+	if (TGU_DEVID2_COUNTER1(devid2))
+		num_counters++;
+
+	drvdata->num_timer = num_timers;
+	drvdata->num_counter = num_counters;
 }
 
 static int tgu_enable(struct tgu_drvdata *drvdata)
@@ -496,6 +566,38 @@ static const struct attribute_group tgu_common_grp = {
 		.name = "step" #step "_condition_select" \
 	})
 
+#define STEP_TIMER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
+
+#define STEP_TIMER_LIST(step_index) \
+	{STEP_TIMER(step_index, 0), \
+	 STEP_TIMER(step_index, 1), \
+	 NULL                       \
+	}
+
+#define TIMER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_TIMER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_timer" \
+	})
+
+#define STEP_COUNTER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
+
+#define STEP_COUNTER_LIST(step_index) \
+	{STEP_COUNTER(step_index, 0), \
+	 STEP_COUNTER(step_index, 1), \
+	 NULL                         \
+	}
+
+#define COUNTER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_COUNTER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_counter" \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
 	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
@@ -546,6 +648,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
+	TIMER_ATTRIBUTE_GROUP_INIT(0),
+	TIMER_ATTRIBUTE_GROUP_INIT(1),
+	TIMER_ATTRIBUTE_GROUP_INIT(2),
+	TIMER_ATTRIBUTE_GROUP_INIT(3),
+	TIMER_ATTRIBUTE_GROUP_INIT(4),
+	TIMER_ATTRIBUTE_GROUP_INIT(5),
+	TIMER_ATTRIBUTE_GROUP_INIT(6),
+	TIMER_ATTRIBUTE_GROUP_INIT(7),
+	COUNTER_ATTRIBUTE_GROUP_INIT(0),
+	COUNTER_ATTRIBUTE_GROUP_INIT(1),
+	COUNTER_ATTRIBUTE_GROUP_INIT(2),
+	COUNTER_ATTRIBUTE_GROUP_INIT(3),
+	COUNTER_ATTRIBUTE_GROUP_INIT(4),
+	COUNTER_ATTRIBUTE_GROUP_INIT(5),
+	COUNTER_ATTRIBUTE_GROUP_INIT(6),
+	COUNTER_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 27eb1f81effa..3b103a399815 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -18,6 +18,14 @@
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
 #define TGU_DEVID_CONDITIONS(devid_val) \
 	((int)FIELD_GET(GENMASK(2, 0), devid_val))
+#define TGU_DEVID2_TIMER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(23, 18), devid_val))
+#define TGU_DEVID2_TIMER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(17, 12), devid_val))
+#define TGU_DEVID2_COUNTER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(11, 6), devid_val))
+#define TGU_DEVID2_COUNTER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(5, 0), devid_val))
 #define TGU_BITS_PER_SIGNAL	4
 #define LENGTH_REGISTER		32
 
@@ -47,6 +55,8 @@
 #define PRIORITY0_OFFSET	0x0074
 #define CONDITION_DECODE_OFFSET	0x0050
 #define CONDITION_SELECT_OFFSET	0x0060
+#define TIMER_START_OFFSET	0x0040
+#define COUNTER_START_OFFSET	0x0048
 #define PRIORITY_STRIDE		0x0060
 #define REG_SIZE		0x4
 
@@ -60,6 +70,8 @@
  *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
  *   TGU_MAX_CONDITION_SELECT select region 0x60..0x73 holds 5 u32 registers
  *                            (the last one being the 'default' next-action)
+ *   TGU_MAX_TIMER   timer region 0x40..0x47 holds 2 u32 registers
+ *   TGU_MAX_COUNTER counter region 0x48..0x4F holds 2 u32 registers
  *
  * Each priority level's block spans a full PRIORITY_STRIDE (0x60 bytes),
  * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them implemented.
@@ -69,6 +81,8 @@
 #define TGU_MAX_PRIORITY_REGS          24
 #define TGU_MAX_CONDITION_DECODE       4
 #define TGU_MAX_CONDITION_SELECT       5
+#define TGU_MAX_TIMER                  2
+#define TGU_MAX_COUNTER                2
 
 /* Maximum priority that TGU supports */
 #define MAX_PRIORITY                   4
@@ -86,6 +100,8 @@ enum operation_index {
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
 	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER,
 };
 
 /* Calculate compare step addresses */
@@ -99,6 +115,12 @@ enum operation_index {
 #define CONDITION_SELECT_STEP(step, select) \
 	(CONDITION_SELECT_OFFSET + REG_SIZE * select + STEP_SIZE * step)
 
+#define TIMER_COMPARE_STEP(step, timer) \
+	(TIMER_START_OFFSET + REG_SIZE * timer + STEP_SIZE * step)
+
+#define COUNTER_COMPARE_STEP(step, counter) \
+	(COUNTER_START_OFFSET + REG_SIZE * counter + STEP_SIZE * step)
+
 /*
  * Neutral ('NOT') value for the condition decode registers. This is the
  * driver's default so that, before userspace programs a real decode, an
@@ -121,10 +143,16 @@ enum operation_index {
  * @condition_select: Per-step, per-register select values (including the
  *                     trailing 'default' next-action register) staged by
  *                     sysfs writes and flushed to hardware by tgu_enable()
+ * @timer: Per-step, per-register timer values staged by sysfs writes and
+ *         flushed to hardware by tgu_enable()
+ * @counter: Per-step, per-register counter values staged by sysfs writes
+ *           and flushed to hardware by tgu_enable()
  * @num_reg: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
  * @num_condition_decode: Maximum number of condition_decode
  * @num_condition_select: Maximum number of condition_select
+ * @num_timer: Maximum number of timers
+ * @num_counter: Maximum number of counters
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -138,10 +166,14 @@ struct tgu_drvdata {
 	unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * TGU_MAX_PRIORITY_REGS];
 	unsigned int condition_decode[TGU_MAX_STEPS * TGU_MAX_CONDITION_DECODE];
 	unsigned int condition_select[TGU_MAX_STEPS * TGU_MAX_CONDITION_SELECT];
+	unsigned int timer[TGU_MAX_STEPS * TGU_MAX_TIMER];
+	unsigned int counter[TGU_MAX_STEPS * TGU_MAX_COUNTER];
 	int num_reg;
 	int num_step;
 	int num_condition_decode;
 	int num_condition_select;
+	int num_timer;
+	int num_counter;
 };
 
 #endif
-- 
2.34.1

