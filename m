Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900838;
	b=3RWu+tji7/GjfhlmUbJmmE1P/BjHGuJ7nyQ8S+R4nZMUS4jVtwarGTcEPGnfcXLbUxcA
	 g7QAOwAEFejtw9wNPGRKead26F2Vi2BhKvZilxe7+pk3Ok6tCQgqyXauPquRC2hWmaw2d
	 spLg2gMd1bpy4ermSosC9VJx9KtqeD3/2FHHxIdbf2axxx0ajNYccnJ/2Ytwer8fNdITB
	 2LwUZsV6zkQ7a6tS1qoJRRInGn1omVqtOoZ0bjNp/JQq0NSvTr2i2uJGTex0z0Cha8E1r
	 eXW9Jl6gQwDgqg62M1S5vbG5jQO7wr/u5zXpmhfQm+3cNseJyWvqZLKqGGIpPXOdhsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1/fBRI3pieXAuTyyYb+E3JIOfhMoIV8YX+Ub3Q+F2cQ=;
	b=X+6LMMELDQ4KFV7Xvka0C8LjmykdOmlQ/bT9P77lIiYOamvs5s5pCm/EXw+QHAnKQFyA
	 6QHPulsI2f4T0I/G3Vq9AXI3FdMEWuqad234HB1edTOeqGMlYfRdrLMpFECxOccyTVep8
	 Xs5cmFu4U//FCCahRCU2bbfieUZ6//tf3MEE+YrpD9YW1LUOO5fI2zeoKU9CnnySZwwH8
	 LJ/IAmO0mDsbNtra1X4pPRf03b4s/9hen5N9i3HUTh+MRoe8ZIOjifaVXy9S0cOGaMzR8
	 pMi9iQcoZiBJhyk6+cGe3vKqcy+L2I3Uz07wI25l934hoozGJjib5taxrmXdbcsqSIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwjPPGUI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bPl4YHhH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2137D606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2137D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwjPPGUI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bPl4YHhH
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6f3Et2998662
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1/fBRI3pieX
	AuTyyYb+E3JIOfhMoIV8YX+Ub3Q+F2cQ=; b=NwjPPGUIK/KNnFUG8i12jWoI4Cy
	wQDUBpY0kzWDXQAOKfqSUXfM40sQ+iJYmDVfpfAGKWbXDWHXprQpsY0NQMg/5sPP
	KGrYnmcCoqbebnvalgc+LWplle8cwV1fwkzSzClF6dEWs/JzoHBNqvPuuNTSvRfl
	ya5pz5P6CiGocOlLg8uzTHD9DJv23e3xCWv3uPGoFpYRMftm8QYPP5JKHKJ0wzxz
	21LWfZpVW7LjpRetHKkru5XcWgMGeu726/4AIXkQ3HcqyxHTjSxwvg7qlGVXFFcK
	dVdBMbWncQ+QYc9qFX4iPUwhf6PoJYxtGGG7N49EbmPEefEZgluWI7iK+wA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve06by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:33:57 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-862ab20625eso1251865a34.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900836; x=1795505636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/fBRI3pieXAuTyyYb+E3JIOfhMoIV8YX+Ub3Q+F2cQ=;
        b=bPl4YHhHYmH+GlKmNZOpuaZd+2hgOtxbdag7aoCEveq0yRdMbW8ax7JGeayhnTjjqV
         XvcJnTFRXtfOoH3sUVEeWRN0kryUjqipjtGl5MtiFgwxSUNscOsZIsu0bJ1dTytkx6Kl
         639YoTidRjGXNpMBAeWuryNJFYUa+Gsw7c/trgQQjVdVOy4R1XpJUuGz1L9knN4C4Fi1
         CdQdfU56xfdx2wm47qJP7IsTKQ+1urzfmrAKypKzRdwMWx3vV6n8FZH8kTy9v42ohTS5
         UNGnFb3ESzphFUfW0VBdDr2Kd9nfhPqCWdluVO5pw06yFzdBcLcOcWK1hTMqC/be/RZi
         GXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900836; x=1795505636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1/fBRI3pieXAuTyyYb+E3JIOfhMoIV8YX+Ub3Q+F2cQ=;
        b=c9LIxE3MGhwpX7Q+tG8B1HlKeXau3B54oNAQChku2hSOgubi6XdmwyKbmRFygjPRdA
         1ObenWZSH70NPqRgrjRGRhQYU81QTVjsviOlnK8CcbGg/SbRuL8/P4qGRcRSur87imTy
         EYFPJ/QIsb3Lzuoxe5YWp92cLacG5F538BXWq3knkH7+a7W/rqFT5CDF4BfmIalG/msx
         5D4y7ytAJp0DX9RrhyHAnKWHgF9fez1tnYPEOyA2rDsOz3b50i4KbfcIUwM923pEEBTw
         pDHPO1XWYTSj3wPquekvvwLgq/hcKQ9c3VCo9IK071SH+dH51gD2HcP0NSsq3mZe1Yen
         PcdQ==
X-Forwarded-Encrypted: i=1; AL+hErFV7gHB/v7VRewXZQEjdvMsbYY8YE2883OB7YKNbE8KTMlUrdcxUWxnwjUtEzS2w2SuLHbTgX3cb3nB@vger.kernel.org
X-Gm-Message-State: APuU4Z90mDaslXPS99DXa/IKYX0w3krcmq061V8GKjelhgp5a1Iyapx5
	0iS+zatbbQoB1aJ4pF1ochaWxia02tYzoJ/iwoJ+qto4qBVKhqjEPvjrixcRFhDX15J/CCkjZ/C
	oI7qLH5VQzJ8H79sjg7dTB9YMOcXytnMD2/pzYeXw0ncLVObrYRSOMiwPUrxcaSy2
X-Gm-Gg: AYBFou3er7SP9zCP09eSVWFpbpKtWqfwB6ysfMYIyc6UzAN3QzSAkyORvlzh1eF2ilx
	MjafHXn3U4KDsah9gd2QJAXZGqqwAO8vOJGBAxJRqpl6r1722ImvNyvSLTpf936MDnn495ZSc16
	A400lrRSCq5Cl6PuEUEwcwR/bannRZ503qjGFPc4ENlfkJ7IFdDSX7Vg6ceJ4QWxyfHGSfzG0Jb
	0r39ytp3VO0ebvr7KlvJEXuio0IfnEbvnLlBFQGDxyy9yE26PESc7JrLVOh75JUwYzzNhsbhmWg
	PAzzL6y8YjayliHdijAWJRoDFkrF6QLNzU0Ufwm5ofoa8wET2iXmP/rCfepZp+/U+mFiA1XwkpI
	JYXBpEsUMMKxzHbkx0z4q8PlROYzGzdAAkRSZMvOrb9giBN8VRo4IRGP/COBAUYCm4mhBc7qakD
	rpv+yU1vaC39hJH9kYvaEbmevOQJ9qbpPduw==
X-Received: by 2002:a05:6830:3911:b0:7fa:ab72:9e04 with SMTP id 46e09a7af769-86289962855mr12925763a34.28.1794900836362;
        Mon, 16 Nov 2026 23:33:56 -0800 (PST)
X-Received: by 2002:a05:6830:3911:b0:7fa:ab72:9e04 with SMTP id 46e09a7af769-86289962855mr12925743a34.28.1794900835877;
        Mon, 16 Nov 2026 23:33:55 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:55 -0800 (PST)
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
Subject: [PATCH v19 7/8] qcom-tgu: Add timer/counter functionality for TGU
Date: Tue, 17 Nov 2026 15:33:04 +0800
Message-Id: <20261117073305.3854951-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXxGoEQmMJPZOy
 11TF5aGkhPuETpFXjMI83awmZ9dpqtKJF1MyLalhjxU9xnqAKnZnxq53b89fEzxMydEIRdFzUcI
 BD1IMXzfsJ3qZPXwX/rM9Ntfx4doIA4=
X-Proofpoint-GUID: hMRmKy-NdqCvvsqZ_SQ41fUpmHEnyW15
X-Proofpoint-ORIG-GUID: hMRmKy-NdqCvvsqZ_SQ41fUpmHEnyW15
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc0365 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=uUgUC8Xt-bfeVmmxO7MA:9 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX4P3pAslbEncf
 3QBbJiQJpFKFnjDvJwLq7WvPzJcfBbzZHdzhI21t/M4hKLuncYucHRvn9HJ7qMY3kK6ui1mqa5j
 8JCBPk29BxnFOF3Ix4mbmoxK0KN7Xc9dFrWzLvcTaWnuZKnOdg/SmEj3yx6bGpSMd0i0PX3+J5G
 KyTbfkC5o2KlwOqB/Alnm0RwZtfwDWJrc+GQKTeaO0xaPRRPMDiu4HHqygqovwRP2khJ+59/eTW
 Mc4iA0rVy8t8VDmCIfyfxqp27qdzbJT12zGJnWmcaELeKaJjlE77KPtFZskTeQaCOOp4OmYjH23
 BnrXaaNR/7QJ/maPubZR6nGb8srL0hOOTiXGtsgx10mguzEwudHB4F9HyMx6Jco9ixc597GOMUI
 PJH/g6iYe6udG2dASUgSuUfmPqp8rt21N8a4iMcUdJK7dvq6ro2Sv61Ww+KUDwUSeplNHvT2ItL
 2/uabbXavkHmcDRSuhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029

Add counter and timer node for each step which could be
programed if they are to be utilized in trigger event/sequence.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 ++
 drivers/hwtracing/qcom/tgu.c                  | 120 +++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  |  39 ++++++
 3 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index c30b58166a0f..71187071cbc8 100644
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
index dc4e60380565..5045c0f344d0 100644
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
@@ -105,6 +109,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
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
@@ -150,6 +160,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
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
@@ -199,6 +217,18 @@ static umode_t tgu_node_visible(struct kobject *kobject,
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
@@ -249,6 +279,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_SELECT_OFFSET(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_timer; j++) {
+			index = calculate_array_location(drvdata, i, TGU_TIMER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->timer[index],
+				drvdata->base + TIMER_OFFSET(i, j));
+		}
+	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_counter; j++) {
+			index = calculate_array_location(drvdata, i, TGU_COUNTER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->counter[index],
+				drvdata->base + COUNTER_OFFSET(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -260,7 +314,8 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
 	int num_sense_input, num_prio_regs, num_step;
 	int num_condition_decode, num_condition_select;
-	u32 devid;
+	int num_timers = 0, num_counters = 0;
+	u32 devid, devid2;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
 
@@ -308,6 +363,21 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
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
@@ -487,6 +557,38 @@ static const struct attribute_group tgu_common_grp = {
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
@@ -537,6 +639,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
index b51bc47637e5..b5bf9a301a6a 100644
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
 
@@ -56,6 +64,9 @@
 
 #define CONDITION_SELECT_BASE	0x0020
 
+#define TIMER_BASE		0x0000
+#define COUNTER_BASE		0x0008
+
 #define REG_SIZE		0x4
 
 #define STEP_OFFSET(s)		(STEP0_BASE + STEP_SIZE * (s))
@@ -71,6 +82,8 @@
  *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
  *   TGU_MAX_CONDITION_SELECT select region 0x60..0x73 holds 5 u32 registers
  *                            (the last one being the 'default' next-action)
+ *   TGU_MAX_TIMER   timer region 0x40..0x47 holds 2 u32 registers
+ *   TGU_MAX_COUNTER counter region 0x48..0x4F holds 2 u32 registers
  *
  * Each priority level's block spans a full PRIORITY_SIZE (0x60 bytes),
  * i.e. PRIORITY_SIZE / REG_SIZE = 24 registers, all of them implemented.
@@ -80,6 +93,8 @@
 #define TGU_MAX_PRIORITY_REGS          24
 #define TGU_MAX_CONDITION_DECODE       4
 #define TGU_MAX_CONDITION_SELECT       5
+#define TGU_MAX_TIMER                  2
+#define TGU_MAX_COUNTER                2
 
 /* Maximum priority that TGU supports */
 #define TGU_MAX_PRIORITY               4
@@ -93,6 +108,12 @@
 #define TGU_MAX_CONDITION_SELECT_SIZE \
 	(TGU_MAX_STEPS * TGU_MAX_CONDITION_SELECT)
 
+#define TGU_MAX_TIMER_SIZE \
+	(TGU_MAX_STEPS * TGU_MAX_TIMER)
+
+#define TGU_MAX_COUNTER_SIZE \
+	(TGU_MAX_STEPS * TGU_MAX_COUNTER)
+
 /*
  * Values for struct tgu_attribute.operation_index: TGU_PRIORITY0..
  * TGU_PRIORITY3 select a priority level, TGU_CONDITION_DECODE selects the
@@ -106,6 +127,8 @@ enum operation_index {
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
 	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER,
 };
 
 /* Calculate compare step addresses */
@@ -118,6 +141,12 @@ enum operation_index {
 #define CONDITION_SELECT_OFFSET(step, select) \
 	(STEP_OFFSET(step) + CONDITION_SELECT_BASE + REG_SIZE * (select))
 
+#define TIMER_OFFSET(step, timer) \
+	(STEP_OFFSET(step) + TIMER_BASE + REG_SIZE * (timer))
+
+#define COUNTER_OFFSET(step, counter) \
+	(STEP_OFFSET(step) + COUNTER_BASE + REG_SIZE * (counter))
+
 /*
  * Neutral ('NOT') value for the condition decode registers. This is the
  * driver's default so that, before userspace programs a real decode, an
@@ -140,10 +169,16 @@ enum operation_index {
  * @condition_select: Per-step, per-register select values (including the
  *                     trailing 'default' next-action register) staged by
  *                     sysfs writes and flushed to hardware by tgu_enable()
+ * @timer: Per-step, per-register timer values staged by sysfs writes and
+ *         flushed to hardware by tgu_enable()
+ * @counter: Per-step, per-register counter values staged by sysfs writes
+ *           and flushed to hardware by tgu_enable()
  * @num_prio_regs: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
  * @num_condition_decode: Maximum number of condition_decode
  * @num_condition_select: Maximum number of condition_select
+ * @num_timer: Maximum number of timers
+ * @num_counter: Maximum number of counters
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -157,10 +192,14 @@ struct tgu_drvdata {
 	unsigned int priority[TGU_MAX_PRIORITY_REG_SIZE];
 	unsigned int condition_decode[TGU_MAX_CONDITION_DECODE_SIZE];
 	unsigned int condition_select[TGU_MAX_CONDITION_SELECT_SIZE];
+	unsigned int timer[TGU_MAX_TIMER_SIZE];
+	unsigned int counter[TGU_MAX_COUNTER_SIZE];
 	int num_prio_regs;
 	int num_step;
 	int num_condition_decode;
 	int num_condition_select;
+	int num_timer;
+	int num_counter;
 };
 
 #endif
-- 
2.34.1

