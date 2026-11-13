Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538276;
	b=Z3migF5yIio6wed4P/ylUoiOGJwbK9eQn2iVTI2Sr8VdrcOP+1CF3W72L8wlbau9Ez1J
	 //eKwI5IZJ3MwkV/BikEQexRq9du+ed6Mx780vYR9cnanlZ599SP5CUyFqYjja9aalrWk
	 uXYU0A68JYnj4hJuqnd7QTh98tqmpmGV+/z6Nrxn67G1vzhckIM6u2O4NXPt+ShopIHRE
	 doUaDZ2b+/R9rAduq6BKG7/gPkOtRpAmzouIlidW2pbFlD9p69yz3x21WMEoKDKunENGN
	 Wc3YBCqgIsUurwjWycZ0q/C0+RS6oE3GAuhiovDhv9+wrZ/qsLWnjuGcWEcwUPxSbsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZEX8rSEpBWZdgcEf6WCVHcit9xfrDrlIB/7NImIOIto=;
	b=eWUIFxhpIV2/p6DWmFQZXc4rcNtPHZr6BnGgkOvDg/jzk4f/m8i6UqvFkkOQzF7mM1q3
	 nysEST+O1BfjjcL16csOcrj+19hCiSjpOacwFV3RNi5CqRUAox7uHem8qV/na0EMb5t9H
	 GzsJ8Qi5ajVLsx8pw8MDY7PSZ4m73sk9KM7ruR/haDEA2tW3ALLs0uhTCiLq1FqSG0TRC
	 8ak0iHZiyfzHYhSjLcerCn7YyJsyTbSKCU/n00qcNfqaX3j+nDgPka8dgZZpzdxYmrrQ8
	 8FCKiQUZhhH88uGdogqrMB1frvNlwev6iHw8EvscZxqoCwIY/y5MjMZkWdeYyZ9ysEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecZSEPjS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5e90wME;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C7C606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C7C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecZSEPjS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5e90wME
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K6a03179274
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZEX8rSEpBWZ
	dgcEf6WCVHcit9xfrDrlIB/7NImIOIto=; b=ecZSEPjSz+Xx0BcNkgH8GnW1yu5
	ECT+XMT4eRrppkCHaylXfZ8HE7OyDtMi2to2b5Ggp1dsYub4BhP0ldNltwlI/gMT
	p+Wim5SBpPWQzoJNZ2YGMXYAzntRk5WPFlM+8dUr4Vh4bm6bM+vEjq2fP+vakkPl
	WR7TnxGGDt4y5TBt3rMi3+ELAnqES+cAnwbzfWBkwQekBHWNDFqKAGUNRiwVkrvN
	AvZlhdrkZ9ztyp20HqNxUT+aeKso+8kgMoBHzqnqqAjYDG6iglv+EaVdmT8UvuhL
	OLNDx6lV+yYCl4JmqrKVeyaKYnKTAVNs7lRNvSV+G9ZIWr0SloZ/loMDBlQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0aht9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:51:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaae62796dso4658215ad.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538273; x=1795143073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEX8rSEpBWZdgcEf6WCVHcit9xfrDrlIB/7NImIOIto=;
        b=C5e90wMEhA6m13JcBnVN7yU2AovpjUc4+S5pQQ9sgQ/2mqzfoZyS3v299+SWJeqLin
         Xp3IQqCVlOqi2hmahpVsbhkwkBM7HHQKi5cHIG8AiuLsyJzf7R43NtbbqautMgmFJG24
         q25ahp3+Mt086JE7yZRRQFbW2Ma3AJrGyoKLOkN8OE0uj1z5qPLhEogu2OWkBm7cANVq
         55bd39e3eY8JVf/D7m+4fGMQiEdUyyL9YhwDLn75SztACIP+DSyjFcQBEo1H5J1ZKi4x
         8K5PAMcvfV3cxoNdrtG8KHXpNqq0yKJtDqMeLLjrKrXzxIsbK1DYANcuSV+aN5O16vWb
         dNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538273; x=1795143073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZEX8rSEpBWZdgcEf6WCVHcit9xfrDrlIB/7NImIOIto=;
        b=axXMQ8tJDdtt3DaS72UZVGvF++oEzvMh5H0lKf+vFX1cKIDwVga8TxIS1C/Gb+hqhN
         tdDlMTYff6kbzqEkJO7Bj6u/RFHmU6fxL1saBs4FDqUuAFX/yV2JkBjFgKpRP4krDYL9
         TmV4JW2ZEHWEdj+y68jLvTONxEbV4HZtE6GZwY9v2Twbjut0obQghi/Z9KOmGT48k7aW
         B8nWJhPDqLFMv/JLI4AB0QNRSJgEQu9bR5i/ohdCFmGOoE4g7Dq9PiWo1Ns1yKRPCxOT
         pBcS5LEOADHA17xrXM4GGqE4wMFODqe82eDDbsZ2lDJ7MWZ850e+6sL6ZlYoGMkYE7pK
         p5Hg==
X-Forwarded-Encrypted: i=1; AL+hErHlqUaNVwWKq8l+fgPo14Z/Ey6z0iu6ch+a5j9liQuLk5CuoOCyTGQhoIWRRIOaYqaBW9rK64GVNNhz@vger.kernel.org
X-Gm-Message-State: APuU4Z/L7n8X0R22zt2sdQSYNDOML0wdv3qQdHkZn0R75rHwE+Sv9UvF
	7nLuCbLECSixONLuxXJ5bgyXRDtlMi/zreLFt0yAH+9vCodI/MFdZE6h8TMfS6hp8IGQf1p+r6l
	z25qtMOw+R5ITvKoQUr8IWt79IymIosGoWiSFdn6We96jmHb3bOnjF2Q1B4tZ/Pfb
X-Gm-Gg: AYBFou2bIw8/TSdDc3gTVOzjG1Eegr/HxNfF9Ld0FCwPejfmyq7mrkGlli63usWH6kN
	hGaq7K9XiVTI8jLxxrcbv+imppZqBuy8IwsJcrWbpF6XrqYvGUxM9IA0M0gJLp8BDkKHg1SLo7P
	kr80xSjiibepMTU/kbAioOM2Z16potB/yW9gYGsJNDdcOjXCnZKfP6oD6zlfJ2Ayd5T6hMwg6SZ
	zjR8YfEiUHHeXAo8wdbGdqDBmZ3gUTc1bDyMiYikCTDeXsSmpG5g6q3OO229koUEQxZI8gVXpan
	G7fzZvtmaEQjezM2DE0JRL4aZF/vnN1TqY8hBKGbbG4ihyHx/6IkdGk/66mVaRKEMzn2FPb5H7V
	cGQBMGLOyDQgQnMTOfsD2PRTVVJsvFw+2eO5kdprStTzko2jOAHrBJsCTJR99agRSu2MbBwKjrI
	k9Vhl2h3M=
X-Received: by 2002:a17:903:1b47:b0:2e5:a355:56e4 with SMTP id d9443c01a7336-2ee0dc93fb2mr10638625ad.11.1794538273252;
        Thu, 12 Nov 2026 18:51:13 -0800 (PST)
X-Received: by 2002:a17:903:1b47:b0:2e5:a355:56e4 with SMTP id d9443c01a7336-2ee0dc93fb2mr10638285ad.11.1794538272687;
        Thu, 12 Nov 2026 18:51:12 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:51:12 -0800 (PST)
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
Subject: [PATCH v17 06/10] qcom-tgu: Add TGU decode support
Date: Fri, 13 Nov 2026 10:49:31 +0800
Message-Id: <20261113024935.3173715-7-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfXxhfEYwa3S/Cg
 WujZ9pxupLQQaSwqym1Ic/8XW2TU5i8Xwsc5x6lUBTa3q4Wn/ri7XgXzO7n0oMGltpqf8o/N64w
 8ZaN71EAMb1BdJP80l1vLFd+siyNpA4=
X-Proofpoint-GUID: yUPwmebMNh57p5yFKHwnEtuglvuJPLo5
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af67b22 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3nLtb9a6exle67ygz5gA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX/pc/W5stL5wF
 AGw/HbRWwhQANlKAVLbPGxHtfQw3ud4GdfQpRqCrJjPk541zICMubJsfaMN0zl1xb3FpGnkYF+e
 BTsN+DLbsgSNdYvA8AIznJmis8w/62cJJV79bFybQ6dyvd2ffSUtqiGDILGE47H+7KJyNhh5jS0
 NWBuAORXfsQBoSAajOy0m+/odr8x8ujTfVw9qzis2upj2YPt9l09LQ6Ys61dV9dW1QFyh6sFsOM
 zbGjWIjXgFM4FdsdTOdepaXDi6w3SaO95+UNVB5XPfwR0ZssRuYSrx1EI6z6++uDnILDkh96hZX
 1Uz9Ju3OHZ1GIz/2VGafcBWKAJ2fF0vi9GBp1co3piiLCRR6ADeblU69U+AgDam0AneBFQBcNFV
 bo6kOaPWWZypNdOAYkxs1xvQDnsou97Wh+9guY77iW5jmUtu9rmXW+qDNrcVVPRCZJ3ads33TPS
 dT5lufJELDhTsOYamew==
X-Proofpoint-ORIG-GUID: yUPwmebMNh57p5yFKHwnEtuglvuJPLo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

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
 drivers/hwtracing/qcom/tgu.c                  | 187 ++++++++++++++++--
 drivers/hwtracing/qcom/tgu.h                  |  35 +++-
 3 files changed, 207 insertions(+), 22 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 09370481758c..b94da9497243 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion:	7.5
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index c00e95e68214..72b98a96d7f2 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -18,8 +18,8 @@
 
 struct tgu_attribute {
 	struct device_attribute attr;
+	enum operation_index operation_index;
 	u8 step_index;
-	u8 priority;
 	u8 reg_num;
 };
 
@@ -27,11 +27,36 @@ struct tgu_attribute {
  * drvdata->priority is a flat [priority][step][reg] array.
  */
 static int calculate_array_location(struct tgu_drvdata *drvdata,
-				    int step_index, int priority,
+				    int step_index, int operation_index,
 				    int reg_index)
 {
-	return priority * (drvdata->num_step) * (drvdata->num_reg) +
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
@@ -42,9 +67,11 @@ static ssize_t tgu_dataset_show(struct device *dev,
 			container_of(attr, struct tgu_attribute, attr);
 	int index;
 
-	index = calculate_array_location(drvdata, tgu_attr->step_index,
-					 tgu_attr->priority,
-					 tgu_attr->reg_num);
+	index = check_array_location(drvdata, tgu_attr->step_index,
+			tgu_attr->operation_index, tgu_attr->reg_num);
+
+	if (index == -EINVAL)
+		return index;
 
 	/*
 	 * Serialise against tgu_dataset_store() and tgu_enable(), which read
@@ -53,7 +80,20 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	 */
 	guard(mutex)(&drvdata->lock);
 
-	return sysfs_emit(buf, "0x%x\n", drvdata->priority[index]);
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->priority[index]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->condition_decode[index]);
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_store(struct device *dev,
@@ -73,12 +113,30 @@ static ssize_t tgu_dataset_store(struct device *dev,
 
 	guard(mutex)(&tgu_drvdata->lock);
 	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
-					 tgu_attr->priority,
+					 tgu_attr->operation_index,
 					 tgu_attr->reg_num);
 
-	tgu_drvdata->priority[index] = val;
+	if (index == -EINVAL)
+		return index;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		tgu_drvdata->priority[index] = val;
+		ret = size;
+		break;
+	case TGU_CONDITION_DECODE:
+		tgu_drvdata->condition_decode[index] = val;
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
@@ -95,22 +153,41 @@ static umode_t tgu_node_visible(struct kobject *kobject,
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
 
 	CS_UNLOCK(drvdata->base);
 	for (i = 0; i < drvdata->num_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_reg; k++) {
-				index = calculate_array_location(
+				index = check_array_location(
 							drvdata, i, j, k);
+				if (index == -EINVAL)
+					goto exit;
 
 				writel(drvdata->priority[index],
 					drvdata->base +
@@ -118,14 +195,28 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
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
+			writel(drvdata->condition_decode[index],
+				drvdata->base + CONDITION_DECODE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
+exit:
 	CS_LOCK(drvdata->base);
+	return index >= 0 ? 0 : -EINVAL;
 }
 
 static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
-	int num_sense_input, num_reg, num_step;
+	int num_sense_input, num_reg, num_step, num_condition_decode;
 	u32 devid;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
@@ -153,12 +244,28 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 		num_step = TGU_MAX_STEPS;
 	}
 	drvdata->num_step = num_step;
+
+	num_condition_decode = TGU_DEVID_CONDITIONS(devid);
+
+	if (num_condition_decode > TGU_MAX_CONDITION_DECODE) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d condition decode regs, clamping to %d\n",
+			num_condition_decode, TGU_MAX_CONDITION_DECODE);
+		num_condition_decode = TGU_MAX_CONDITION_DECODE;
+	}
+	drvdata->num_condition_decode = num_condition_decode;
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
 }
 
 static void tgu_disable(struct tgu_drvdata *drvdata)
@@ -212,7 +319,11 @@ static ssize_t enable_tgu_store(struct device *dev,
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
@@ -280,6 +391,24 @@ static const struct attribute_group tgu_common_grp = {
 		.name = "step" #step "_priority" #priority \
 	})
 
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+
+#define STEP_DECODE_LIST(step_index) \
+	{STEP_DECODE(step_index, 0), \
+	 STEP_DECODE(step_index, 1), \
+	 STEP_DECODE(step_index, 2), \
+	 STEP_DECODE(step_index, 3), \
+	 NULL                        \
+	}
+
+#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_decode" \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
 	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
@@ -314,6 +443,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -321,6 +458,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
+	int i, j;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -340,6 +478,13 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_dev_caps(drvdata);
 
+	/* Initialize all condition decode registers to NOT */
+	for (i = 0; i < drvdata->num_step; i++)
+		for (j = 0; j < drvdata->num_condition_decode; j++)
+			drvdata->condition_decode[calculate_array_location(
+				drvdata, i, TGU_CONDITION_DECODE, j)] =
+				TGU_CONDITION_DECODE_NOT;
+
 	drvdata->enabled = false;
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index d769379b8421..7d88ad8e730f 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -16,7 +16,8 @@
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
 #define TGU_DEVID_STEPS(devid_val) \
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
-
+#define TGU_DEVID_CONDITIONS(devid_val) \
+	((int)FIELD_GET(GENMASK(2, 0), devid_val))
 #define TGU_BITS_PER_SIGNAL	4
 #define LENGTH_REGISTER		32
 
@@ -44,6 +45,7 @@
  */
 #define STEP_SIZE		0x1D8
 #define PRIORITY0_OFFSET	0x0074
+#define CONDITION_DECODE_OFFSET	0x0050
 #define PRIORITY_STRIDE		0x0060
 #define REG_SIZE		0x4
 
@@ -54,6 +56,7 @@
  *
  *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
  *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
+ *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
  *
  * Each priority level's block spans a full PRIORITY_STRIDE (0x60 bytes),
  * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them implemented.
@@ -61,15 +64,40 @@
 
 #define TGU_MAX_STEPS                  8
 #define TGU_MAX_PRIORITY_REGS          24
+#define TGU_MAX_CONDITION_DECODE       4
 
 /* Maximum priority that TGU supports */
 #define MAX_PRIORITY                   4
 
+/*
+ * Values for struct tgu_attribute.operation_index: TGU_PRIORITY0..
+ * TGU_PRIORITY3 select a priority level, TGU_CONDITION_DECODE selects the
+ * condition decode registers instead.
+ */
+enum operation_index {
+	TGU_PRIORITY0,
+	TGU_PRIORITY1,
+	TGU_PRIORITY2,
+	TGU_PRIORITY3,
+	TGU_CONDITION_DECODE,
+};
+
 /* Calculate compare step addresses */
 #define PRIORITY_REG_STEP(step, priority, reg)\
 	(PRIORITY0_OFFSET + PRIORITY_STRIDE * priority +\
 	 REG_SIZE * reg + STEP_SIZE * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(CONDITION_DECODE_OFFSET + REG_SIZE * decode + STEP_SIZE * step)
+
+/*
+ * Neutral ('NOT') value for the condition decode registers. This is the
+ * driver's default so that, before userspace programs a real decode, an
+ * enabled step does not spuriously match. Used both when seeding the shadow
+ * table at probe and when clearing it via reset_tgu.
+ */
+#define TGU_CONDITION_DECODE_NOT 0x1000000
+
 /**
  * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
  * @base: Memory-mapped base address of the TGU device
@@ -79,8 +107,11 @@
  * @enabled: Flag indicating whether the TGU device is enabled
  * @priority: Per-step, per-priority-level, per-register values staged by
  *            sysfs writes and flushed to hardware by tgu_enable()
+ * @condition_decode: Per-step, per-register decode values staged by sysfs
+ *                     writes and flushed to hardware by tgu_enable()
  * @num_reg: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
+ * @num_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -92,8 +123,10 @@ struct tgu_drvdata {
 	struct mutex lock;
 	bool enabled;
 	unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * TGU_MAX_PRIORITY_REGS];
+	unsigned int condition_decode[TGU_MAX_STEPS * TGU_MAX_CONDITION_DECODE];
 	int num_reg;
 	int num_step;
+	int num_condition_decode;
 };
 
 #endif
-- 
2.34.1

