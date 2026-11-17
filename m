Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900844;
	b=Fp0bSLfDscv468JxqXLi8WtKuJb8zeuufCS63dy19n3O8lDZAtjXMImKMJ2GsWfdJvAQ
	 0a5v9WwXwSlibluIl7jrg3zBmUfMWs+EqwFmfdq9LTUg6IKsJef3Tt6CNJfP+c9y4O91b
	 UyfzEsydJNfa7Tv8wezvRJvGTwSXuXoqDseiVKCAkhSNKl3YTlYpd1K+/G3Uo2Ls8en1K
	 5Yp46GKOvraPOJi95z9qQg8b1yb5YdREXtKKBkfjherhqQN48HdjdfHU/SMsIX2elnsQl
	 2qOea2aSV7qy2jwGd27UwksB5+fZcnKP8s4DBeZHvsUiRiOePcz5UdUbI4okLgjx1Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C1U6sGJ1wofOSp0VAiQlaKb1uloa76oQfH+mRg/e3Uo=;
	b=OQ85K9hdeN1MtdjqY36/Vjm11wSj5A5a1rPUSEV6JdzCYucdbPItOpgeukUif3sTsJD2
	 kP5RlntbUzobVaNwdbI9HTsuGsf+mWuX6LxpmtY/YTGnOSPom7sd72oT2RVOG6Hz0JSbY
	 denjqABnZZHRzELO5OP4reC15ag9qQef4Jk5yBD1wBu0gfe2E8bXj6ELsM0K2kQ2g6jKa
	 zcAVng+OxaIiSVKwziC9PSM+n8GuiZuTsuebt70ltpcL+goKHxM4IbyG4cAcHY0ntheP2
	 Xz+QSctfpt5OnCAD0Lh1ChjvpZXG6QNF6c/tF8HQbi9OqKTvD3s5U9FU8+rnarOcpCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LuPxAYH5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TwL4z1UP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C51606A329
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C51606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LuPxAYH5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TwL4z1UP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aKQg1800820
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C1U6sGJ1wof
	OSp0VAiQlaKb1uloa76oQfH+mRg/e3Uo=; b=LuPxAYH5NJgQOpppiP1xJ6eD+Ha
	uGKcXWmiEqWBP9HMl77Z1m06AOijLxs+hlTG0FcEhaq6e//0IhtaKJ6pmTXgmKIJ
	NdCsB9XDnKQzv2hsycnW/4F5MMdl0OmVIeQiuivYIPCqRubnt729mpNx/xNgBP5e
	7R3whG3gXooQwLBJSsLnTPLtj9Yi3lB3lDcL3M4HZ1zdIniqthkT2a65ISO5qdCo
	XM6wMpEUhFSecf3WeQHnbSHzLgQ5eVvrPYwGIp94YYQAJdjUEd7mxEG4MKwPne8U
	YmNeT0k+d05DzZKQMjRShpAW6kBOxGk2v9ghw/ynIiGmHw09CJP/xsmIsEA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3nfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:34:02 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6e1fc036608so2158525eaf.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900842; x=1795505642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1U6sGJ1wofOSp0VAiQlaKb1uloa76oQfH+mRg/e3Uo=;
        b=TwL4z1UPOJ7N/+x8s/gf4sL4B9+FV0S5uC01PuWd3cD07jZ3p9ckZ40EmVYWsMyKqj
         gTZOI3aMlmB5q8o1NW5AdEFK4OksYa65exApYzDl/KHFddorVMMiTE2kWg/NXQJoQP8M
         nOwGBUojeyPWU4MaIDpOvPkSFGSV6wbRxr4/qVQ052g0JvAXsBgxmd2dWj0Cvt+Z1Urg
         vclmXS7wnNT+EQONZfazqWkMiKNcjIKQgL30mcXkMnkJ7Pi+CaYndwdg6XLxLKdFfSTB
         bF8442gWRYAM/oGD7iVs97zj7EfsBmydjxnapHk7wKm8o5+ohKmjhjnnW2A9ZmkC4iFK
         GKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900842; x=1795505642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C1U6sGJ1wofOSp0VAiQlaKb1uloa76oQfH+mRg/e3Uo=;
        b=uHnIKNtP+WEY8PufneC1NUpkXqAhxyWqEgqq+8ofGwTLj7l9MC6t2+qF+r85yw7vTD
         Rw4mqwDHI5xdHgEdK+/I8iKdZJS8zAiS2xd7fnvAdCK2D1U2WrRomcnCx2sw5r0yggU9
         jRzb1a+VsoF3NuyHQvu23XRSnuLDxhhasf4J8JAvv1/7x9SVMV4n0CPIADhwJ6LiC1Xl
         xatK9H0u2sest9/PCYd54ekTR22Xcb0JHmF61z5agn9z4sIjFo5SBunbgp0hUmx9C0oZ
         jsQR0dWL1/N3P6UkwTSLSbXpBm8q3SHaRLS8/aDeQ3algDkGB+5tGo4UxsztgsZ/DqKz
         ToGw==
X-Forwarded-Encrypted: i=1; AL+hErH4BePuh+IqyH+D5rwAUrhqHo8fzfKgRqprNSr6+fsJ2qcREE6oYST17LpL6C/kK+DsIomS5YIp7DCu@vger.kernel.org
X-Gm-Message-State: APuU4Z+mM9lvh/bE9/22oVmiL98QjtthLD21hFE4YVV9cgQ/5DdAmLYD
	2OXLHE+88B10PxFLyyVo9jLdCx3+qf47m1QJsHqTLbpfYj3opf40DmOsvf97JvkzwoZs9wIBOsS
	NWnRdotizpR52ion5nNH1awZ1mBkFiWp8xw0g8awpSXfDfjWqsHL4YeuovL9QNXH1
X-Gm-Gg: AYBFou3r3vpJ8NtIdbZ5eELIDGkWbon5ppZx869yKOEqdp50USqEv3G6CRMdq55xUwa
	RWY5EfjWS+fwCnfhv14Eg28Ed60/NWhCshCYKFaMl3FE4ytNmFhZl/ykUgAV49+lNDaxGQfNrAM
	U2ejr3tNOGCzAK4TgnJyYqnaWC3zy0YiaeiAEbURK+iYpSmfTZwOSCnDL29Td3exNS7r9HeAXs6
	qSWaWjuIVcaLZFy/fmM4+1HAxq3YnIfAHyv1CNM0xepaWUu0e5cWLctsKelT9JWzLKMqVGnAqtc
	4UbQmFmv/rI+fKiBWx19v+9RUXuUsIdTvJDd0u8pydcCLuL3RUjdlsz510WEQ3Fhzw774J7/9R+
	Is4Xal7c8Zgu8G+jWFiqLnX0dTL5yItxmXhUI2v9ckZiGztNqyQnDBcL96rSVNkS0FQqEt72Aof
	YJ1lC+ViNl9bAdBZTQB1JeNUDsBfLTHYGwkg==
X-Received: by 2002:a05:6820:1ca3:b0:71a:e9eb:6b94 with SMTP id 006d021491bc7-71b014fdaeamr1468369eaf.20.1794900841770;
        Mon, 16 Nov 2026 23:34:01 -0800 (PST)
X-Received: by 2002:a05:6820:1ca3:b0:71a:e9eb:6b94 with SMTP id 006d021491bc7-71b014fdaeamr1468362eaf.20.1794900841323;
        Mon, 16 Nov 2026 23:34:01 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:34:00 -0800 (PST)
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
Subject: [PATCH v19 8/8] qcom-tgu: Add reset node to initialize
Date: Tue, 17 Nov 2026 15:33:05 +0800
Message-Id: <20261117073305.3854951-9-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-GUID: k4qa4ynrJWCh_cuiIT3_JBOdfxe9JblY
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc036a cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=u6OCHy2KTxjFLSf8iyQA:9 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: k4qa4ynrJWCh_cuiIT3_JBOdfxe9JblY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXx7cIE4dAnJ/G
 pjevLxxjux2SNpcvHygDSA3KkCAzMJGByValjeUw5iJRYF3uD67TOKK7yj6HQZd6x7whoTq+7Xt
 oSKB05WWCO3FuLLpAa/kC7KdIQWLVKc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX6SEjNgk3DoKg
 yWvqS78EiINQ0Kw/+Xz6rZVJrJwbjeuz/qhR9yFJ47EyebGSwOXopoli6Et4SAZaAcwrTSEdt0T
 /ZxH1W4g7JLc3s+WKK86KLkphuE/ZlpuXrk04RGZCm9Br1tkpwCfbukNApdbWi4npt5PxpV8mYS
 iqgPDVzcBekAwdTcIq2dCxeHNWXBOvsiFf3Kc0UdVCPoPDTsVCVSjL3cZ6gakqe2O/7q7h6+wWX
 ZotoIHY7tPs3o+D98+qzViwmAeqvF12T+fxHRrQpFSLRBKEUqyqljENJxKM+F3tGUmyXyoYAYnT
 /Yabvdi9a/JmgRS7AXPS9iuubqaupXNXsqtBbrEZW1kYVu0HvYsr/5i+rfcfkATmTWD7ZNRAE/u
 1Yfh8P/OGi2iTUr+QzJI8zaRIS+MTixBjo9TfYszxpp4S5xK4haLc6QTrlXgEVymLmwxwefqmvY
 iByF9qTdR97v4QwM5sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 85 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 71187071cbc8..b3a2fb9cba6e 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -51,3 +51,10 @@ KernelVersion:	7.5
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 5045c0f344d0..dc8572628f57 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -241,6 +241,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 	int i, j, k, index = 0;
 
 	CS_UNLOCK(drvdata->base);
+
+	/*
+	 * Quiesce the detection engine before mutating any comparison input.
+	 * This function is also reached from reset_tgu_store() while the TGU is
+	 * already running (TGU_CONTROL == 1); rewriting the priority/condition/
+	 * timer/counter registers register-by-register on a live engine could
+	 * feed a transient, half-updated match into CTI/interrupt consumers.
+	 * Programming with CONTROL == 0 and only re-enabling at the end keeps the
+	 * program-then-enable ordering for every caller.
+	 */
+	writel(0, drvdata->base + TGU_CONTROL);
+
 	for (i = 0; i < drvdata->num_step; i++) {
 		for (j = 0; j < TGU_MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_prio_regs; k++) {
@@ -460,8 +472,81 @@ static ssize_t tgu_enable_store(struct device *dev,
 }
 static DEVICE_ATTR(enable, 0644, tgu_enable_show, tgu_enable_store);
 
+/*
+ * Element counts for drvdata's shadow tables, shared so the reset path
+ * below can't drift from how each array is actually sized/indexed.
+ */
+#define TGU_PRIORITY_COUNT(drvdata) \
+	(TGU_MAX_PRIORITY * (drvdata)->num_step * (drvdata)->num_prio_regs)
+#define TGU_CONDITION_DECODE_COUNT(drvdata) \
+	((drvdata)->num_step * (drvdata)->num_condition_decode)
+#define TGU_CONDITION_SELECT_COUNT(drvdata) \
+	((drvdata)->num_step * (drvdata)->num_condition_select)
+#define TGU_TIMER_COUNT(drvdata) \
+	((drvdata)->num_step * (drvdata)->num_timer)
+#define TGU_COUNTER_COUNT(drvdata) \
+	((drvdata)->num_step * (drvdata)->num_counter)
+
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long value;
+	int i, ret;
+
+	if (kstrtoul(buf, 0, &value) || value != 1)
+		return -EINVAL;
+
+	/*
+	 * Hold the mutex across the whole sequence so it cannot race with
+	 * enable_tgu_store()/tgu_dataset_store(): the enabled check and the
+	 * hardware access stay consistent. No PM reference is taken or dropped
+	 * here - the shadow tables are plain memory, and the hardware is only
+	 * touched when the device is already resumed via the enable reference.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	memset(drvdata->priority, 0,
+	       TGU_PRIORITY_COUNT(drvdata) * sizeof(*drvdata->priority));
+
+	/*
+	 * Every decode register is about to be overwritten with the neutral
+	 * 'NOT' value below, so there is nothing for a prior memset to zero;
+	 * calculate_array_location()'s step/reg indices for TGU_CONDITION_DECODE
+	 * densely cover the whole 0..TGU_CONDITION_DECODE_COUNT(drvdata)-1 range
+	 * with no gaps, so a flat loop over that range reaches every decode
+	 * register.
+	 */
+	for (i = 0; i < TGU_CONDITION_DECODE_COUNT(drvdata); i++)
+		drvdata->condition_decode[i] = TGU_CONDITION_DECODE_NOT;
+
+	memset(drvdata->condition_select, 0,
+	       TGU_CONDITION_SELECT_COUNT(drvdata) *
+		       sizeof(*drvdata->condition_select));
+
+	memset(drvdata->timer, 0,
+	       TGU_TIMER_COUNT(drvdata) * sizeof(*drvdata->timer));
+
+	memset(drvdata->counter, 0,
+	       TGU_COUNTER_COUNT(drvdata) * sizeof(*drvdata->counter));
+
+	/* If the TGU is running, apply the cleared configuration immediately. */
+	if (drvdata->enabled) {
+		ret = tgu_write_all_hw_regs(drvdata);
+		if (ret)
+			return ret;
+	}
+
+	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1

