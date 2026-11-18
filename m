Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988987;
	b=cuCfX4vExh9uFKdhPwRzjlY4pS+48tcWLuN/Jt1/461fzaY0LrUZzNFUXnyxB8InMmvo
	 1X/jytj/ZalS6Tyjs/NisNwtgFPf353uEooOSjOfN2F7ZNZdyCiB5kJLbg5pgNGRDNViA
	 oc3UOarJeJ4n6/lYzotJKHh0silyQ7Rlit6z6CYbsk9y1Ozlw9L+dbpy3qxCjLjhJL/sc
	 yE52pcOfljEuJSS5ZU7xDGl9Ox4roaNxXNrkRM664r6RkkNUQeABXcj/gKUqbFSEdK6q/
	 XesQLero4uevbNbyFK+pkqhXf6oI011Iqt5eBmCPPR+ufgRpccGJa34Br6S+LRwurqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988987;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
	b=Qz2gaxLfQ8qGJ6ujfHrw0nMFOIreGx4iN08b8mlEMK+/7H4xlaSA7tE1AgDEL2mOTUTv
	 SZLHkLMaEhC2KWmOG4/DzPfUObmKw4X/eCt7nZJhUqubh+0xHfisX44uHG5ZjdwTQSSMe
	 gVLaVVwnr6QNArnZawEhcVjNjSwUW78VSbWKK3ArTpaqU9SsPdbJQDWHKWXAU5i5bfqqB
	 S1lmtt6D/nMMur9WnmXNDYFgHaeUaAgqvFBq2xH6BX4yGW4X0ByynGO9ZrXTlQcXkCpZc
	 TDrvqBwWbC4h1ZWDrRIJi55atBcp44Z3Pzbkry1bEWzR8cQ6mD99mTiDqQ//qN2MEKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SehWkOYm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KyLpHxpS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6159E606A331
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6159E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SehWkOYm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KyLpHxpS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VBh9472838
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=; b=SehWkOYmoajt8tEw
	4veZXGFfEZMpD+ItYPe41I4Fbc4E2QyfIfSZfedALy2uhobckkKevMcFExwRS7iH
	bJ1OxNFkMsNtteu76odrZK7K35E9J4G3OyhSbROpYqwWIwbdTSzgzmRpS2xizOHK
	v7CCIA/CjOWvgVjCEaBMB7JSr/us/l3/1H7RtiHcPbE2vZc1G/TF0noNfM6uPi9u
	sgTGRijbIyMvAVx4J53DIkOsUAGQ1Z562A1eHAmk+vAxRRVbWq0Oe6TbxH/QyIgn
	Ao8Rcaf9PXFlOzZ2WH+kyvfYoJ/9ruDiH7NbGVh3/HXgyr4vAEO2R3rcs8bw/oZo
	5yXx/A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89w1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so515532a91.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988985; x=1795593785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
        b=KyLpHxpSfYmJVbogIGukzWNgYR/S1FnB5zfjNJoIbXE/pGDYl/9MxjOUEA8AvPAtSy
         k1AC+yeaE5TuYJGco3DqAzaDJyd+LZcfonDCPWS60QnYKPKPTbbV/lhst51ib4Yt2iOB
         026JJov7XxgdBGRjoxGzE+xjlP2RJU1jHH1PARp0x3totJ1L2plEYEXAZzj2LyvJvnKE
         1smLtHB0y58EmkfnX5QKkQvhyYG3Nzs/speGjy0sXacedwhEYCeetjQ7XvKBJ2EE5aez
         SvnfbcP3HF0wvlq6uvF8/IMYwWNFZvDIizG5sfAvs6AAfADY7wpKqOMCCDCQj1wvars9
         8+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988985; x=1795593785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AicMQPr7DICojSK0EEjtOMxxtnE5F3Tky/GQRrj+5sk=;
        b=UyzPNpsfCFBRa7lLe7NaVQPzadxYxRtGurntInFZKYryiJafApqQv5G2U4mzEyJcTV
         vXvaE2dfpYwh+uE9OzB8ZlsE+FYQgXicaAXWQCv1xcm9NbxJTkOfn+Cfr8GcMDVH+cMi
         +V4Ks14jQORjUjlqJLqn248dcBUh07822m7ruBhhnRssmtq/iiDS17czS3ZWsHkrb4TF
         gMy6TCfAmipd7VGzFcU/HDg1UwYqUORAtp6e7U9ES0BaVF7r1EsU5pQ+qt30s43cOeJ+
         1na+Ri5504x1slHxnLJcspNFhw0HIbkaxACjgbDYxYzkXVzaF3Fc8PwwcX0apjj2P5sL
         cYvg==
X-Forwarded-Encrypted: i=1; AL+hErGBHfbV4Z1Cm42OKnqSTaOd6AZkTDwxWRVhvWkIPURmLZnOeD8t/XoqYLovR0wDpQBun1q7SkTpEbHe@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ctl6nLXTgg69cxbHmnUJ8s5gCTjEfkZAQNOAsJls+SSmB/SHD
	82raQpzJpq/5vXKlcQq9/X7VjYeG0mMefXmNhl0OmAL1dJQJV0Rc1KgzbGR4qsqBhy7jMkA2xqF
	Pmi0aN2ZM7eTQ2Wd6dC0onr/4Zdu3wkXTyl9DWHcJVJ/Lc9S/Dhc2sK9diCFknjt3
X-Gm-Gg: AZFdTZdxAAFczohXjzffhCbdd4RNg13C2RvKbTk1lcRJJfevgvzjDc8H9sdALICKH0q
	rDpJDCTpLVDVlqUY3PWToR7ePMkwjs5xKNRYHU/6z1k4k7VZ7WNoaQ6jBRKXxBWwiCVvWnzDcln
	d+aEdBTwyR0vOvikYUrPXJzdXrLLS4Sr0/VxI0cSEYcUCoOxEUHPtwBVWbAUX0gFxSX53woBzKW
	8KZl4N/iYAj2H05SJ4TVxtgMv8RqBslWPMLlKvEcD+wiotGTBBN07T96Bf4L9vk7ZM8QSZgoDQE
	bDlq/E/izhOINc0Qi8CwEygmz5zZMPwhle4y0NxRvDAJyYBpAGNWQQIZSw7XO+i++L+8uILpqtS
	HU68P1LY+VkTv3CHYVm29+plx078FvE8F7DWDjsvvXUTzyyNBb7Vfn67fXQQYTB4lOPlSMHDkdA
	lpBHyZ1qGXiS0wjetKL71I1qtzxg2MkVLK77Js
X-Received: by 2002:a17:90b:3888:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b3d07e3b43mr1977330a91.61.1794988985100;
        Wed, 18 Nov 2026 00:03:05 -0800 (PST)
X-Received: by 2002:a17:90b:3888:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b3d07e3b43mr1977275a91.61.1794988984413;
        Wed, 18 Nov 2026 00:03:04 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:24 +0800
Subject: [PATCH v23 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-3-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988960; l=4507;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=PnAggtb/hoPMxGkHLkimiPJx33tOJTrsVEFsbWRzHrM=;
 b=kvEbku2KDnvoJLBsObLlNuF1g/Oz7j2QHJyBoax56i1IV6LPPWoPLveh724YxNNEmDFo9Kg+x
 QwGjkAhsSVkCO+wEPUF+4BtDr1nqjHBDAvTRovfhxme0L9Cd/eJgXWV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: bswkjf2RF0MVYwSI8M_VOYxDPYObLG6E
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd5bba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TPt5YZYWydgKV8fuSqQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX35A8jcnwEkXv
 g7/MNxaYdq2taj/uK1lMNDFsbSXODxj8IZMihIzx4/ajx3zFWDbiTPedh/IzSOURg8YxNfzwKu4
 cxaNmB6Y6LVX1Hq/axn2D34DFvyCNyLJcxJvr2NqifYLX58SVqPGCswlwET2QglqwNewOwLz55w
 fsjlQJQ7GE2HOlnfT9clm2akuY1dVLk6lAxqhtYpE8sZl2BwpJrQIGuDmBvW/DubWf/YIf44ER+
 jKYKwkd5UI8VPwG5RN+PFwhEcvuWpzmiFCo3XuDen9IANyTQw/v2ms6V/A4BTBsQkciUFi7YEEy
 HgTEofl+w2ErpSy+lQ0yF2WZfels9OvrjGh0Fz//5L5IYjY3Ero1jRCAvfDeKTw8unOkPtqkABy
 DboG4Wbo2iaZukfS726fxsFJwAPdf8lx2QbIyb+cv7Zr3+6XuDlcnwWtgnP6rTTTZjCoozPinmI
 CSxhxJ08ZTfcqTL/dOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX5m4KTwWnaw7m
 iawDq2sO3rrOxjZi+Wzm7Eth9bMtVfEaYUxOHRtvzBJOPGpVz9e+BE1DqfbFAryB1YnGGoTAiAF
 s6GmUlOnT9BrEKzmpSQvoTrcZwIwLWg=
X-Proofpoint-GUID: bswkjf2RF0MVYwSI8M_VOYxDPYObLG6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
etr_buf_list without disabling the sink. It returns the node of the
switched out etr_buf, so its synced data can be read while the ETR keeps
tracing into the new one.

Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
done in one critical section. Otherwise tmc_disable_etr_sink() can run
in between and leave drvdata->etr_buf out of sync with the hardware.
Provide the sequence as a TMC helper, so callers don't need to know
about the locking of the ETR state.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index e9213f456834..5032f5598e15 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	u32 sts;
+
+	CS_UNLOCK(drvdata->base);
+	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
+	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
+	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
+	writel_relaxed(sts, drvdata->base + TMC_STS);
+	CS_LOCK(drvdata->base);
+}
+
+/**
+ * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_buf_list.
+ * @drvdata:	drvdata of the TMC device.
+ *
+ * Stop the ETR, hand over the current buffer for reading, switch to a free
+ * buffer and restart the ETR. All of this is done with @drvdata->spinlock held,
+ * so it can't race with the sink disable path.
+ *
+ * Return: the node of the switched out buffer, or NULL if the sink isn't in
+ * sysfs mode or there is no free buffer. The ETR is left untouched in both
+ * cases.
+ */
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		goto out;
+
+	list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf)
+			curr_node = nd;
+		else if (!picked_node && nd->is_free && !nd->reading)
+			picked_node = nd;
+	}
+
+	if (!curr_node || !picked_node) {
+		curr_node = NULL;
+		goto out;
+	}
+
+	__tmc_etr_disable_hw(drvdata);
+
+	/* The switched out buffer is free again once it has been read */
+	curr_node->is_free = true;
+	curr_node->pos = 0;
+	curr_node->reading = true;
+	picked_node->is_free = false;
+	drvdata->sysfs_buf = picked_node->sysfs_buf;
+	drvdata->etr_buf = picked_node->sysfs_buf;
+
+	tmc_etr_reset_sysfs_buf(drvdata);
+	if (__tmc_etr_enable_hw(drvdata))
+		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	return curr_node;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 7c604b9f92e5..30b15c38b080 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -212,12 +212,15 @@ struct tmc_resrv_buf {
  * struct etr_buf_node - node of the etr_buf_list
  * @sysfs_buf:	Allocated sysfs_buf.
  * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates the buffer attached to the node is being read by
+ *		the user.
  * @pos:	Offset to the start of the buffer.
  * @link:	list_head of the node.
  */
 struct etr_buf_node {
 	struct etr_buf		*sysfs_buf;
 	bool			is_free;
+	bool			reading;
 	loff_t			pos;
 	struct list_head	link;
 };
@@ -465,5 +468,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
 
 #endif

-- 
2.34.1

