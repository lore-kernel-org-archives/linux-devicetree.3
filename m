Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900822;
	b=c/GtB/Oyba5EOZzim5plPZJD8jJv2IMixKaT7TXAaibs+j9sXwUjOUjHvs332FI4H3dI
	 IBhWPP92A+rSb+3PgPJcIak9P54LHYrAqhKaWmF7tNiNOLpt6/6BnMBqkJT296fG7S0Lw
	 6d+Up+WxN3jchravN3QLh2JFcFzAwcuVb/gHq33zGKDPWFm0TIopgsoS8kcTU0cd3sRow
	 lNCelIjmnTs3bvPsz2T612ywK8L3PxqMj7P5/rLfrj9sNnKJToBiQYvVOfyyOPfC7bIJj
	 C0Yg7ELu4jSS35a4J90cul1iN3HZLQR1K6d2/LeZuwT6LvwifTUCHw18sozMeMEpC8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ou8c3GKALOpVB9WjoKV7/Opzk8K9y02+qmjXo4Hlt+o=;
	b=mGaLeJer2evdahBv6L1LG0iIpIU5fhQ6yVUA2/h8YzV2TbEPuwtC73DFo0KVXh/5UQhO
	 zi6vGExUlmA/UYtIqDFh727OpYaV6fjX0BDpXN5YVKxpztZ+5MO5l+071ae+lWY0TeTrM
	 XeDIUuD4mLDLrSXctEqf5nlFPUsWVqBfH6btLEMdf1nh8oi2+sI9cNR2YwZfoBN+7QkyT
	 GsmaSbgJ+2pB7x/arCiFN8c/7GHVb/NcKZBQfpBjgSenEjaAx7kbE0FWF+Ds+b+Y3EEC3
	 pJQDIDNyMWL95ct9Jcr6qj1VHD0pWWUR0Cg/jsgQev8PDa8f5wgNnnb2aItRZCJyW5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j8bgN+1K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a1AYPE7E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56698606A338
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56698606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j8bgN+1K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a1AYPE7E
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2a7hT2934249
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ou8c3GKALOp
	VB9WjoKV7/Opzk8K9y02+qmjXo4Hlt+o=; b=j8bgN+1K0m063g9qjG+0U9wESwK
	P+9yG5Tsw1EMsVlPFqLGgXj/pNb+A7YoMtFLr5g0xdjnbZj0YjwDmYjY1toXT6Lg
	a6Y3yQ21rBZo4iDLyrsI3eZUFe6Qq5Hdd/X+gEi9mo7WH0sWqintsELg/m4DtlKT
	EAwINpVPfMx54HdwIULJLdS8ZCnXgkHqvPTU4KwuVruER8b8oAA5M19S8ENy27t/
	gKoKUQ5p7fC3BwIdjTADtPEDo4pRIO+Z54gIfWhFHCl63L7EL7GOs1ubhXDTexmz
	5ck+GUr2Xjw/8hKB3yY615TIEx/2eqIw6mA7dt6yB7fN6iRBa/0ndvInWfA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m09wjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:33:40 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-860e65f42a5so4920293a34.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900819; x=1795505619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ou8c3GKALOpVB9WjoKV7/Opzk8K9y02+qmjXo4Hlt+o=;
        b=a1AYPE7EKZlsR9Ek92w32OyzYgYkBNvDsi1Qvcpn53oLJsheLpZKHaBV+xUhYoWU7J
         YeDEf0AwLVfz2CeoilMb4ZLbTkR3aP6D8EjGG3WXMlV4enDKZ6Wy+cZ2uwhYj8NHCRv9
         8lllTDikOeTEyCZ5AZ7AOQNC0tXLH1DEqq53YeOZG+vgrIBgH+2JOfuKD2B0OXgUmqGr
         +0b5YY8ayPqmqwMi5yusGWfe9+hsBYuDiowenhPsC9epvQ80aAiodzL0WKSUVPhRGZlF
         OsS3dMrTJZEhA8DWGEr4J+I9bfRmQtE8Ylwf9V2M9PE4c6VZ/LZcajXSwFhBhDhZFI4X
         Idng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900819; x=1795505619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ou8c3GKALOpVB9WjoKV7/Opzk8K9y02+qmjXo4Hlt+o=;
        b=Q7Qax/ascBJsQuBncEoKdfQFGxPujtbcPFP8piId5/sI6+wuo3kylk5Cnab9kF/GRo
         thybcqo2/XOIswHee9/6eMOL0IAR1phY+KeaODa2pdPlfXbUQKLOMYZjDZY59eXfZ8ag
         E6JDTvERiMib3A+SS5qGyEdk/r0MzvTljkh5uDW6W8S5xaw8zJ8Cp/RKQT1lIYQYpsG2
         bR7IDjnCPjXUEO42HEivHYYDrw+nBKEcP1J3vc6yx7mHFoTclX8kIN0fIL3LzmTEbpf+
         Of98Zkfi2pS50y0S0XjUSCQq6//wbFt9k4qRxZiMLcewwzskhRzmeXaVRrx0PGHSJXZ8
         sGug==
X-Forwarded-Encrypted: i=1; AL+hErGlIIXjLMD7m3Na/1iR/tDwWygYwkttPG59ZDnPLZDSMZqkADnzJff8NWj/GPACehfUGkKkct05xTNa@vger.kernel.org
X-Gm-Message-State: APuU4Z/XNFARLP0bObOoQ/R42VAD65Ytd7AK3t8qe1W9eccOt81df2Hd
	ytc6iqacQojMLgMO04hKQ8BvyRsMzUe1cjXhwZx6bR/EvXvfz0NFHOq5JcJYjGw4B7xHKHGTO2d
	uQxOxx/KaL8Fnkk/jXlCFh1njt6TDLa3OmiCLdj4+YpXQ3awdqG4UnNtVPnikf/Bw
X-Gm-Gg: AYBFou1qXpT2RP6SL4Zl0JNsWGuvvQhb2/MavES988ZDbQwhNQCLb1jPHYfvnZ1ltQK
	b5tTwJOsH222t4I/nRcnEQMUvM6DWdzpFLDIyz0d33BZ34NPE97cuP/29cyfWAFiONcKMCC9Tp9
	meGz1mquJSYo8ZIvP/80ghKWpa5/byn6K3g6Vt9JmEoEAi3NoOxcn8ROCkJM1Ohn0Y2aeWMJMdk
	rJkOWObqZHAl6TRvFaslULLZHkyICrBIdOirhbd0AkZ5vR5WNj+ZuZeBvXicemXkh2mWWRPXUEv
	xDXtlw1h4Wqgz9KohYx/RoFvOokP+gXHcMRkBVrEEf0/ainbQ9tP2mlWT3fKy9euxx9maM0cMXM
	OdYWg6VhBUX/fwaUdU60XB4TPfgshb4AhRTlQRyp7Of63VU2FFICNUbR4cE0/AMtXVFAFUz42Fg
	g6uQq8ScwH/31YaMt4HIiC2FjaBtD//YgnDA==
X-Received: by 2002:a05:6830:4429:b0:862:a48e:24df with SMTP id 46e09a7af769-862a48e25d7mr8054146a34.15.1794900819172;
        Mon, 16 Nov 2026 23:33:39 -0800 (PST)
X-Received: by 2002:a05:6830:4429:b0:862:a48e:24df with SMTP id 46e09a7af769-862a48e25d7mr8054128a34.15.1794900818694;
        Mon, 16 Nov 2026 23:33:38 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:38 -0800 (PST)
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
Subject: [PATCH v19 4/8] qcom-tgu: Add signal priority support
Date: Tue, 17 Nov 2026 15:33:01 +0800
Message-Id: <20261117073305.3854951-5-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX5LS5/aHtzssR
 O6NjaB//1eYBfx1v1fNuxw/1tDlF4rPoBd2rIzhWisBFiYTWQuTsy+Di5QokRFVmOO1xq4VSJd1
 6X8UyUpPESmy+I3kAOW1MWzYLRBFnGg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX6cmM60euR8t8
 QrhldtdlTVGj7CX88otDQDBuS8BBTZO79nvzWys7BEFlWzzVCWFRiEMGJDCsHbJKoLe/0wHiTDT
 kKBqyuo44qTt70R0u9YoI1Nqx4CdXLcL8RNQQ7YrEluCWFlqHH5We4fF6HFipmaQwTVx+qHVex5
 nUrr2k0WZzeGNjZThDUC13AkzlGY2MWdfiIK13ykrvcVTsXA9teninpblJI2u8+IelBSF5TvqJf
 gbki9oJ3smRmYGjTaMLwe5kRH0tflGWV0+2m5GUqbB+gdQ/sctXT6PEoa8RqyvDGbrKS8GkFda7
 Smw2rOOgp4V7Fx4exer4SC4KEEzbfzhtdxOcBe5s+0YMaRKXtFBqc3I14x6aReiir57e6HObH7y
 DK0c/gjyzPDdMqfdg0tg1r9bgHz7lSk+dSlDL3oWODKm3Ysyj+Dd4vpr57XNEH5GWVr4cHs65Pe
 9EN6gl8h+3HtGADXt+Q==
X-Proofpoint-GUID: RjjbHnquf_I_rUj-hlDt0M7doEQTcPWV
X-Proofpoint-ORIG-GUID: RjjbHnquf_I_rUj-hlDt0M7doEQTcPWV
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc0354 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1rXoQJKsMvXEZDCkVBMA:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029

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
 drivers/hwtracing/qcom/tgu.c                  | 211 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  79 +++++++
 3 files changed, 297 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 798a0e51e27a..3be0b912c937 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -7,3 +7,10 @@ Description:
 		Accepts only one of the 2 values -  0 or 1.
 		0 : disable TGU.
 		1 : enable TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:23]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the sensed signal with specific step and priority for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 5bae46db4f8c..c876b98e43e2 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -16,14 +16,145 @@
 
 #include "tgu.h"
 
+struct tgu_attribute {
+	struct device_attribute attr;
+	u8 step_index;
+	u8 priority;
+	u8 reg_num;
+};
+
+/*
+ * drvdata->priority is a flat [priority][step][reg] array.
+ */
+static int calculate_array_location(struct tgu_drvdata *drvdata,
+				    int step_index, int priority,
+				    int reg_index)
+{
+	return priority * (drvdata->num_step) * (drvdata->num_prio_regs) +
+		step_index * (drvdata->num_prio_regs) + reg_index;
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
+					 tgu_attr->priority,
+					 tgu_attr->reg_num);
+
+	/*
+	 * Serialise against tgu_dataset_store() and tgu_enable(), which read
+	 * and write the same priority array, so the value is not observed
+	 * while being updated concurrently.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	return sysfs_emit(buf, "0x%x\n", drvdata->priority[index]);
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
+	guard(mutex)(&tgu_drvdata->lock);
+	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+					 tgu_attr->priority,
+					 tgu_attr->reg_num);
+
+	tgu_drvdata->priority[index] = val;
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
+	if (tgu_attr->reg_num >= drvdata->num_prio_regs)
+		return 0;
+
+	return attr->mode;
+}
+
 static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
+	int i, j, k, index;
+
 	CS_UNLOCK(drvdata->base);
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < TGU_MAX_PRIORITY; j++) {
+			for (k = 0; k < drvdata->num_prio_regs; k++) {
+				index = calculate_array_location(
+							drvdata, i, j, k);
+
+				writel(drvdata->priority[index],
+					drvdata->base +
+					PRIORITY_REG_OFFSET(i, j, k));
+			}
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 	CS_LOCK(drvdata->base);
 }
 
+static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
+{
+	int num_sense_input, num_prio_regs, num_step;
+	u32 devid;
+
+	devid = readl(drvdata->base + CORESIGHT_DEVID);
+
+	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
+	num_prio_regs = (num_sense_input * TGU_BITS_PER_SIGNAL) / LENGTH_REGISTER;
+
+	if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
+		num_prio_regs++;
+
+	if (num_prio_regs > TGU_MAX_PRIORITY_REGS) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d priority regs, clamping to %d\n",
+			num_prio_regs, TGU_MAX_PRIORITY_REGS);
+		num_prio_regs = TGU_MAX_PRIORITY_REGS;
+	}
+	drvdata->num_prio_regs = num_prio_regs;
+
+	num_step = TGU_DEVID_STEPS(devid);
+
+	if (num_step > TGU_MAX_STEPS) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d steps, clamping to %d\n",
+			num_step, TGU_MAX_STEPS);
+		num_step = TGU_MAX_STEPS;
+	}
+	drvdata->num_step = num_step;
+}
+
 static void tgu_enable(struct tgu_drvdata *drvdata)
 {
 	tgu_write_all_hw_regs(drvdata);
@@ -103,8 +234,86 @@ static const struct attribute_group tgu_common_grp = {
 	.attrs = tgu_common_attrs,
 };
 
+#define tgu_dataset_rw(name, step_index, priority, reg_num)              \
+	(&((struct tgu_attribute[]){ {                                   \
+		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
+		step_index,                                              \
+		priority,                                                \
+		reg_num,                                                 \
+	} })[0].attr.attr)
+
+#define STEP_PRIORITY(step_index, reg_num, priority)              \
+	tgu_dataset_rw(reg##reg_num, step_index, priority, reg_num)
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
+	 STEP_PRIORITY(step_index, 18, priority), \
+	 STEP_PRIORITY(step_index, 19, priority), \
+	 STEP_PRIORITY(step_index, 20, priority), \
+	 STEP_PRIORITY(step_index, 21, priority), \
+	 STEP_PRIORITY(step_index, 22, priority), \
+	 STEP_PRIORITY(step_index, 23, priority), \
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
 
@@ -129,6 +338,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (ret)
 		return ret;
 
+	tgu_set_dev_caps(drvdata);
+
 	drvdata->enabled = false;
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index c6426b4e3617..4a443475c156 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -6,9 +6,81 @@
 #ifndef _QCOM_TGU_H
 #define _QCOM_TGU_H
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
 /* Register addresses */
 #define TGU_CONTROL		0x0000
 
+#define TGU_DEVID_SENSE_INPUT(devid_val) \
+	((int)FIELD_GET(GENMASK(17, 10), devid_val))
+#define TGU_DEVID_STEPS(devid_val) \
+	((int)FIELD_GET(GENMASK(6, 3), devid_val))
+
+#define TGU_BITS_PER_SIGNAL	4
+#define LENGTH_REGISTER		32
+
+/*
+ * TGU configuration space                              Per-step register layout.
+ * (one step occupies STEP_SIZE bytes)                  Offsets below are relative to
+ *                                                      the start of that step's block,
+ *                                                      i.e. step[0]'s block starts at 0x0
+ *                                                      here, not at base+STEP0_BASE.
+ *
+ * x-------------------------x                          x-----------------x
+ * |   coresight management  |                          |     reserved    |
+ * |        registers        |                          |-----------------| +0x1B4
+ * |                         |                          |   priority[3]   |
+ * |-------------------------|                     ---> |-----------------| +0x154
+ * |         step[7]         |                     |    |   priority[2]   |
+ * |-------------------------| STEP_OFFSET(7)      |    |-----------------| +0xF4
+ * |           ...           |                     |    |   priority[1]   |
+ * |-------------------------| STEP_OFFSET(1)      |    |-----------------| +0x94
+ * |         step[0]         | --------------------|    |   priority[0]   |
+ * |-------------------------| STEP_OFFSET(0)           |-----------------| +0x34
+ * |    Control and status   | (base+STEP0_BASE)        | condition select|
+ * |          space          |                          |-----------------| +0x20
+ * x-------------------------x base                     | condition decode|
+ *                                                      |-----------------| +0x10
+ *                                                      |  Timer/Counter  |
+ *                                                      x-----------------x +0x0
+ */
+#define STEP0_BASE		0x0040
+#define STEP_SIZE		0x01D8
+
+#define PRIORITY0_BASE		0x0034
+#define PRIORITY_SIZE		0x0060
+
+#define REG_SIZE		0x4
+
+#define STEP_OFFSET(s)		(STEP0_BASE + STEP_SIZE * (s))
+#define PRIORITY_OFFSET(p)	(PRIORITY0_BASE + PRIORITY_SIZE * (p))
+
+/*
+ * Upper bounds on the DEVID-derived per-region counts, used to clamp
+ * whatever the hardware reports so writes never fall outside the
+ * ioremap()'d window or spill into an adjacent region.
+ *
+ *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
+ *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
+ *
+ * Each priority level's block spans a full PRIORITY_SIZE (0x60 bytes),
+ * i.e. PRIORITY_SIZE / REG_SIZE = 24 registers, all of them implemented.
+ */
+
+#define TGU_MAX_STEPS                  8
+#define TGU_MAX_PRIORITY_REGS          24
+
+/* Maximum priority that TGU supports */
+#define TGU_MAX_PRIORITY               4
+
+#define TGU_MAX_PRIORITY_REG_SIZE \
+	(TGU_MAX_STEPS * TGU_MAX_PRIORITY * TGU_MAX_PRIORITY_REGS)
+
+/* Calculate compare step addresses */
+#define PRIORITY_REG_OFFSET(step, priority, reg) \
+	(STEP_OFFSET(step) + PRIORITY_OFFSET(priority) + REG_SIZE * (reg))
+
 /**
  * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
  * @base: Memory-mapped base address of the TGU device
@@ -16,6 +88,10 @@
  * @lock: Mutex serialising enable/disable and the associated PM runtime
  *        reference counting against concurrent sysfs access
  * @enabled: Flag indicating whether the TGU device is enabled
+ * @priority: Per-step, per-priority-level, per-register values staged by
+ *            sysfs writes and flushed to hardware by tgu_enable()
+ * @num_prio_regs: Number of priority registers implemented per priority level
+ * @num_step: Number of steps implemented
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -26,6 +102,9 @@ struct tgu_drvdata {
 	struct device *dev;
 	struct mutex lock;
 	bool enabled;
+	unsigned int priority[TGU_MAX_PRIORITY_REG_SIZE];
+	int num_prio_regs;
+	int num_step;
 };
 
 #endif
-- 
2.34.1

