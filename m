Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814933;
	b=n1FITaCxlJuFNDdPawsr3qL6k4ZEoodmn9juDTf/uskSGonHhOq05q35R6j1wYL2tTdQ
	 9oQutAY+mqhfY8Db05UbcOVOlyxIhVWnALAAn4e2V/jtbf1zYEYlG6Mx1NMDq2sLzNf8B
	 dRIEYQL05BzaXQvifPyV6DPZmCpVnrQtoB8qxIsqy+Bq1z1JtJxwBffAGYFAfbF+YvWne
	 j+b7P952p14up34Q0wy3evIas2b7mVx3SiNQo2juuLRSZawkwlDh0UcVhQcBz0XryrQkW
	 QUKNMuN0vV2VVHkAzXsAgdAybaFxgZAMiTLVjPiQQ0ICMphtin/heRGUsTWtH16QBSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eWCyBzOYdStcG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=;
	b=PsHM/11cpn4l4WaG6ugSMcX79/katqJarYY+ShNk9EDsCQYYDRMU0EvhyOpV7M+ni+rL
	 HicLg9PhUmEfTrsEr+JkBtAE1TqWSQeQ/Nsrj8HP/1K1nuJpWGTUOLhjQ7AEE6wK8f1Oq
	 M2ESSWWiKIeJ+/yF3Vg6N91ZOrulc1IC9z9MXkosNeSobK71ztV7ce4MPA1z5priBcwkf
	 bME3TkVIVrWuPJzBzpWOnlOevV894LL5jM7ygvO02/QDkpRpn7tfbD61I/SVQQ8ZIYIJr
	 QgOKil1KwyeRDY4fEyRS1VFgnIxEmdyC49OFZx4owk+8mRrr4clr58kLdyWc+H6q9rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJSyCS6Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RtstEKea;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F706606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F706606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJSyCS6Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RtstEKea
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7fN4U3490159
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eWCyBzOYdSt
	cG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=; b=OJSyCS6ZIk1LAcZ6YXwzEbiOnWV
	lWgAZwllEtsVjacTfHpBO0ER+CA0GH1Srxg1uCy/QkKsBPtiVU5dhw/CofqigE0m
	KZ4N/Y5NrAUeh5whhZiU80cWr4jJgmZZ3aNVZwAZd4mpYUCAaFbg+bGRsajV8sSG
	T20+TWL51dWMcpgC+KvRRRaCsVyB6VIczZXeYgkiLa0hQjixKKKIX+ddt4ETB2FV
	DeHkZ+4nKzkZMIlPL70Po/I3VnhBQpBu09rVNmtP3elkAyTGhJMj+v1Yawm3RPuZ
	6kW2c4IZi5kJQrqRBiprWAtHwHzdMxEFO4E0Iid0JZOgDgljqoVcIqPWS0A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcdb77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:42:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37628596fc9so8607900eec.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814932; x=1795419732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWCyBzOYdStcG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=;
        b=RtstEKeazqaVecfAjJrVmrjZQXe0ZzxUXQxwNEmUy2te0FaeNNsID6U8L6xgDUXMrb
         VIf3qSZ/4dNoUBr5ejIewZojgreyUCUGZmgvelz7hv0CDawGvQrXylh8R9W8GHeqYa40
         JOrP9vf+hIP00g3vVoirYP9Ekc/vy1jHcTxM5XJtPOxvs43YklpTEn1URypvJSBaog7G
         /3Hd88KewTlVFzRswnhneFsieZ0n/Q7pnIZGdg+FbeCXVj8uVWq718te5komtU9KfgC/
         LtQiXtNuOtzcE8ifZMPJeWrDDu4DXXVCc8/QegzmD3BVQ2VSkVdR+E/3cvGy3nfc1VDP
         IRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814932; x=1795419732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eWCyBzOYdStcG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=;
        b=xQlHoe54WKXH6dl6P+gaap9X9a6iebJBi55F+7ql81NBKWY5kiGwn/LqVJcTe1XeMv
         KgFm56TJi5zNcgI07c3zoagQxNFowtypYyE6EzBFsn7/aWnr8lyu376HLzWmj7mKb86S
         MJ+ARVChkXIUge6QYa4sgTintlRtMO/Wq7kFDVFRwZ+hgLhiOTSQoVyqkfIfbhy9pV1o
         2/HOYo8gGuLz+cz23/gLjfRvUaB9B4oXSEC1iq47cbiaEgU3pXBnXYYjyhfymw+uQhP1
         0SVDWPZWZTG+Pph/M8UGehEm7qrX8NQnjqR2VvqmPz8658ASVTRDm0t59wVjGF+y6a6K
         k/3g==
X-Forwarded-Encrypted: i=1; AL+hErG29zRlMQrLWzX3qEyYVOXPt5BiVdXk1HgxYT07k9RUbtBjNtJ+D+xw69+n8e6ovNOM7r61KCwfxJSK@vger.kernel.org
X-Gm-Message-State: APuU4Z8g9unUm06q3ABJrTFhHfpcEiEA25/Jzj0NEPczsBoPEKQpIsgM
	VGwfGBXV+TiJZjwXpjkDMscm/TsRHg6C/NEtfwEs8lwsWlhzlizCKBDRmTBXsyukTIxh02FQFmz
	+X54oezVjdVv4SLcwdNWTxWdxtL07rV7mFPRU7dTub9sIgn7Nq/jcGZhWEWql/PY8n8gMv3uoeB
	A=
X-Gm-Gg: AYBFou16Goe2zLWGXEy8C8nnDRRuXPjsM263t7+W4/qkmaoA/rFGDtxUYWY4f0CTF96
	GhE2A4Sw3Vo05e7q5NYh5ZsRm8WT3IX/L6IRR6gqhIn7q7X3urpDjHhzeCKRAlHaRHpK6LlfxfK
	G2xmgtheVp8WI4Nc0Hhqe/lhHF6c3MNbozmDeDyL9Y96u9GheBk7xGx8Xom/QjGaQaH2hjhocEF
	RkKCBR2QJQ+Sn9oOjaLkZ8dv5qVWSSgIDUoWKYB8ZXrOiKqpCCO1F1x9weh5W6gWkN6THnyw2yC
	IcuQLJB1986Uimy6Jb+qj7JbBNuPqIbjFu80D6ZVL4i1ulKhPHOVJyOxIuy+I5x7dS0ApdfC+t/
	thxkt5UMVkbN+4QJoqqGvZ5an1NsziI+hm7GVExBhr3AIHURWzJx5wxxzju5U92AyQ1f9nfi7/o
	xBFQAciDTBtMsgSv3EF+VQ8W5J8b/nkxM+Dw==
X-Received: by 2002:a05:693c:805c:b0:376:9323:22b8 with SMTP id 5a478bee46e88-37965da96e5mr11689164eec.10.1794814931408;
        Sun, 15 Nov 2026 23:42:11 -0800 (PST)
X-Received: by 2002:a05:693c:805c:b0:376:9323:22b8 with SMTP id 5a478bee46e88-37965da96e5mr11689124eec.10.1794814930711;
        Sun, 15 Nov 2026 23:42:10 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:42:10 -0800 (PST)
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
Subject: [PATCH v18 8/8] qcom-tgu: Add reset node to initialize
Date: Mon, 16 Nov 2026 15:41:18 +0800
Message-Id: <20261116074118.822731-9-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfXyG/dMrla/PcT
 ohCsyWTeBZeD63Er3K7+1TlPtAeztiEC0k7j7vAkSE762cT7o5dL7OBkND68Mj574OuE1+n+k3X
 5+OCZPdOA0QtrE8xbisDu1iHGaA2EWI=
X-Proofpoint-ORIG-GUID: tHy0kXBzTOlNWu2EevlQuSdqkzJgpphm
X-Proofpoint-GUID: tHy0kXBzTOlNWu2EevlQuSdqkzJgpphm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX+3blkH4pvPNE
 MsxLyYzv7oUi4tjTX84OEEk1V2PEvAfna8NsReSk38S5LP0KZdlluyk6FVVUR9secFUbYzAWxsh
 TzsaNs1+WKe5Qr5Uu6os/aRFGa+mBFEoHSkYcPB3LsF7yIEJtETb4QfyXuOeIjI8YPaW8EI7qpc
 VQNNxBQOFjV1Xdve+6YxdiMZJhGrPsh2RuLlyO6k/GnhCFGkOr8f/3Irp5jYwoIKLp9oB3U7eVa
 wzgvEv6gNxmas9oiOhr/ktgy7KJBuMZ3qTdT5uogMrNRdeoWRQ8ZvSEJ0vpAljnwVs22YhOdo6Q
 S8HlF4coUAN7pT286DatCPg8lc4UEyFIwxq7o3Vfdaw7/Gf4YsWd8uTdgJ2USwOYmfoojkdspzt
 2nlGEkm+Cn6zJAUiT6iWYmImDq36snjVD++yZR8W4JIXAEnZlIb/HAuplatrJtW0fG/QWF+9pJ1
 IAhC+1ndTfcG0QLhdqg==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afab3d4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=u6OCHy2KTxjFLSf8iyQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030

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
index aa7eaed0e738..6f76d4f83cc3 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -251,6 +251,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
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
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_reg; k++) {
@@ -470,8 +482,81 @@ static ssize_t tgu_enable_store(struct device *dev,
 }
 static DEVICE_ATTR(enable, 0644, tgu_enable_show, tgu_enable_store);
 
+/*
+ * Element counts for drvdata's shadow tables, shared so the reset path
+ * below can't drift from how each array is actually sized/indexed.
+ */
+#define TGU_PRIORITY_COUNT(drvdata) \
+	(MAX_PRIORITY * (drvdata)->num_step * (drvdata)->num_reg)
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

