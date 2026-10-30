Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340123;
	b=FHqhTPh1Kd12bCKtC51oqdNm+HOkBSySHo7upNAIlYTQ2gUTc6+8THf+ZaD8NEfaoAES
	 LCFamMI24s4ezcJ8maEFK4yYPYBw4GI/nNBEET0qEi77We9Pj1K4kO2bX0asgXvLwdd2V
	 X/QMytbpwFGfib5vjROzdzTnwODYsPA64adL+rMAYG2w0AhH8C3VMr8zA5WfqfDwK4VgV
	 DuQzSXca/3GHGdfdbkVfiPMPyDsB71I7cK4+jR4U1WuAmSthayb2gQO++kZNXkx2ICmeQ
	 H0ibNgHbn/1ocjRLUv2/Ar+DPbKR1c3Bl3cRKFW2/BraXnFCeMeLCW52sQsZShbNBjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m3aHSOocIMbx7ke74vhowuEwfUZkhB4jI3OUR/wq9lo=;
	b=eX2mrvSvisEnNMnLbZjW/nmunzylMM+KDTByKpr3jegoPLmJcXmNnn7Y2Y3WYDMTS6d9
	 kLiS/SS7uSxSxY+V/V8Iw07d77kacbyO5j+KaHMc1CT+EoFLiiDJR1JmBzrH61uIAY+wl
	 kmRL6xRiDWSXvpyFiLgM6SdurnVssZPJiXWmLQ9OpZvxlCrtwN49CgIzSKDbc3Yh2XjTO
	 my4Ew+fRGXFkdyNH6vAIom2K1KPbJc1Is53wbnPM0mg0Q2J7e62IVV5S5vC95m+OTFkjM
	 qlVrT3BJjmjgHlKadgDs/orzaS8SBlQxXdXF4ZZXU000bZ0ewg3Z7oh1ACirDdnuGJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jTZPeFtq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZH04PZnP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A514606A332
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A514606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jTZPeFtq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZH04PZnP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FItQ1980403
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3aHSOocIMbx7ke74vhowuEwfUZkhB4jI3OUR/wq9lo=; b=jTZPeFtqIIFti4hc
	kFw/qpQdLDHkIgj2giFqnchDKcB6MjUmBzMWa8kRqDSKEugnQSHpBYZVgt5AXmZD
	Ywyo0dXkrHevUpnLk2sHfsZa3PXHO1DF6E9fY6+6Pn9yPQ2qoN3wkoVo+ESbfZUb
	oy5WgCM1TMkXec6qsfz9ftv1hrOt4MlrtG58/+PwLRM4kMqZz6SP7sKTuu0Ejs0U
	zw+E5cDmRtefdmVzfjhoFW1VIaxhVmwHwu/ZBEslGEFamhsyejtb3OIIEtU3CkPD
	Ecfw47lu1asiz6kc78jEMagK+0Jn70IUMTPzS43PQ7Q8/fzxfkjfDqgyhYHEzy9O
	fJPqLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhf7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:02:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so437381a91.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340120; x=1793944920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3aHSOocIMbx7ke74vhowuEwfUZkhB4jI3OUR/wq9lo=;
        b=ZH04PZnP4HcIdFOqNb4v88ugPkLMi5kwXe7SIbmIL09L1AYfPTy007VYBqSiSV1JEO
         CR3k9IzjJuFe7+2LFnx/07zon0jMKVgZfQLvFJ7NlrT7luFmHpq+XqiZ29AuyPI8DF/1
         TKFTO4U1TifUYkM10oq3s3WMjp5dLIVkqWOgUvTpr212X/kspiL3Mswk6T4CbHe/OPQB
         NRLM8xSv9qT1srugsp+OofqwpPWMs1gZIBYq09NCpCsqS2K70v7Ms0cDgCAVTge28MjR
         cfN3jUtu421Y8fjVRVirT/9YBf7smildUJ4SbkyXia32pqOyHcWv7jnRCxLSnQ8bm36B
         w80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340120; x=1793944920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3aHSOocIMbx7ke74vhowuEwfUZkhB4jI3OUR/wq9lo=;
        b=EYYYb58Rb/GuSCXm8PPCrjbH2qWiqOmrjSH2IY7Jy4QzboiiDr37kvEuLmoJTeA7KP
         BAxiQVKdRFoArOdVXrMnt0lXGKnRjjwSfNnrbwGVU8TwL6Qr+50LFfEQSoOc08iBFSBi
         salgWe3+IbKYoYjlW9qwUZFnYoT4MPEhk14yCiQF5HbzqII5OBXWdsvrFffW237TvPl6
         BCuMz8zAKs6ocB1rTxvvnZhx+NjTUFI4QAZ0xZuDPo6JAZOlQidxXOapJ2zLYLNE/Jy7
         I/5aIvwBvT+PC3zYELHWDzcu960DE4oNyiedjcCIek16Vv44dlL1UZMRX6LIIKbjZ6A4
         RgoA==
X-Forwarded-Encrypted: i=1; AKwUvBz58HpaUQQ8H2P6DcMW2wAiW1CrRKjOTVYU7o5qqahrNBpNDGSJ5oZBp4m7Nsh45f3g4+7SsWmBVpsc@vger.kernel.org
X-Gm-Message-State: AFq9FYIfJSRxVYlYcwAe9ZJoxMEqVzUkeVDj6iiqj7h1n5ddtMu2ihvB
	RXKNudZRVxmstX7TfkU+vHc8moiwW5aC7gpD4ybqeb5DXOPWY/3J/SZVXTSO30/S/oAk0Zmpk2s
	/9NScxCCAp4gf2h+bs7zmdpVPLS2+pDxU+dshemmvNX1/+np1/+ebBZxDQ3SE8xih
X-Gm-Gg: AYBFou16wNlu3TRf9psrQPHK7lzDdp9g4tJceh1YpBbXB8rGTApuLgVtRBW9iqT6PUI
	xNzOQkpBc62WdHNUleC3bLSp0nAphaJqWQZRsw9yNi0i1c3HSV+OpZOn845THjh7EHYm+hlGwCE
	IIIxd8ML9UUKlO0fmSHrXbLCdfk/Wn4YZpqIHK85i5BHrINXhbmZsc1djDmCnlB4KsSSVwM7t3+
	J6Hhub/IvIenbVSpgk9mJz2CNLzr2NaRkrUDsR4lOCjgpL1HPVxO4De5PMDkDFKYZuD4KKLB66V
	dGMSmP4DKzGizqjAFc9sx7qtWwh8G6YkX07AhhXcmb+UUL5/wc43yoGXHgx4J+Pn3kN6OEj0zX5
	7HU3H3cXKbn5llnZrCE7wi6dXn6wf36S+d4uVepcG8hkcctti06Z1N/w8ur8DWqb4isVApzEaEF
	qzJ/6nQJeQEJS9NyHVlt+ioccy/+gsiM03G00r
X-Received: by 2002:a17:90a:ec83:b0:3ac:9e5e:d19d with SMTP id 98e67ed59e1d1-3ae6f028d97mr3336678a91.46.1793340119503;
        Thu, 29 Oct 2026 23:01:59 -0700 (PDT)
X-Received: by 2002:a17:90a:ec83:b0:3ac:9e5e:d19d with SMTP id 98e67ed59e1d1-3ae6f028d97mr3336634a91.46.1793340118669;
        Thu, 29 Oct 2026 23:01:58 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:58 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:30 +0800
Subject: [PATCH v20 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-6-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340077; l=34484;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=1w2bALRhPpbhwA10Th9XiqpP+DtMT47ehKfn2xyBZH0=;
 b=I3Un3jj+G+KTTka2gLuoUg0BYlJOMRF6i6cZkLvuHFQvNooYbpBWsg0q6lCqVTtWPV/+cKzG0
 Tk+LifYyXZfAyYiKLbMZ+onfAPEot89kC0hIg2SMTmVN4Zsid/tBbRl
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae432d9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XjKv5uM7SgSNu1ZRucMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: UiaOlWbWtCiVbDxCXbkyV44_VNetRAc0
X-Proofpoint-GUID: UiaOlWbWtCiVbDxCXbkyV44_VNetRAc0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX6t5W0s+D/BoY
 IyS2YKMXb3Fii0X5NE58S77RBnwpBOAgCnjFQE8L4utk6UuooGLJK352qdBnr08i0TBe9o9UvdA
 0SmqN0dd+Y0uui669RegrdELdMfOy0tZmbnRkW1V/fQa/ZWS/qCp0rpyxxk1JlsA+tf3+nRbdnM
 LtJOPLa7B15yQZ7p9/CprG4SDpSRQh8A9AtDjcJgxfgu4Zq9UO9ay1Lky1Euza+o3QzkSDaCZVd
 JI7kFA74L6N4uIha+1X04ADN2yKYXddQ3QTDOZLnPs0U8veWMuXK5+YnkVZUb6SP+tPdSyZCHzn
 qnBM/b0ZgZ40J8rXmEuAUzLix9tZHGD49xumjREqqHMLxmkfCWEOli2TiVmg5Nk4imvresIM6Si
 dk6kKK5104KBJ5+kHZgdxC48pchcJojN8gZf45+M7r6UEzHNaC2Np62BrwtHs423E7OR1pRAh+0
 0P1Dgd+Tp0PjyqVoRkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXxXgSOIp2X7ak
 PTKu5M7ho51jDIFVXjb10qtm9HrK293bPCaZjkRK2DA4kiujHLWMXDtGJWlrrGg/+8LS72WSH2G
 qhu6FT7jDOvPHF6oyW1I6YJBqhl3XHo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023

The byte-cntr function provided by the CTCU device is used to transfer data
from the ETR buffer to the userspace. An interrupt is triggered if the data
size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions and the read function
will read the data from the synced ETR buffer.

Switching the sysfs_buf when current buffer is full or the timeout is
triggered and resets rrp and rwp registers after switched the buffer.
The synced buffer will become available for reading after the switch.

Byte-cntr workflow:
start -> ctcu_enable(ctcu_byte_cntr_start) -> tmc_enable_etr_sink ->
tmc_read_prepare_etr(jump to tmc_read_prepare_byte_cntr) ->
tmc_etr_get_sysfs_trace(jump to tmc_byte_cntr_get_data) ->
tmc_disable_etr_sink -> ctcu_disable(ctcu_byte_cntr_stop) ->
tmc_read_unprepare_etr(jump to tmc_read_unprepare_byte_cntr) -> finish

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 392 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 137 ++++++-
 drivers/hwtracing/coresight/coresight-ctcu.h       |  81 ++++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   3 +-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 129 ++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |   9 +
 8 files changed, 736 insertions(+), 26 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
new file mode 100644
index 000000000000..08dbc8e6b2ec
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
@@ -0,0 +1,9 @@
+What:           /sys/bus/coresight/devices/<ctcu-name>/irq_enabled[0:1]
+Date:           October 2026
+KernelVersion:  7.5
+Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the flag to enable interrupt to count data during CTCU enablement.
+		An interrupt is generated when the data size exceeds the value set in the IRQ register.
+		0 : disable
+		1 : enable
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a5..821a1b06b20c 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -55,5 +55,5 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
-coresight-ctcu-y := coresight-ctcu-core.o
+coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
 obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
new file mode 100644
index 000000000000..f10f8897d280
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
@@ -0,0 +1,392 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/of_irq.h>
+#include <linux/uaccess.h>
+
+#include "coresight-ctcu.h"
+#include "coresight-priv.h"
+#include "coresight-tmc.h"
+
+/*
+ * The byte-cntr sysfs ops are shared by all the CTCU devices, so they are
+ * registered by the first CTCU with byte-cntr and removed with the last one.
+ */
+static DEFINE_MUTEX(byte_cntr_ops_lock);
+static int byte_cntr_ops_users;
+
+static void ctcu_byte_cntr_put_ops(void *data)
+{
+	guard(mutex)(&byte_cntr_ops_lock);
+	if (!--byte_cntr_ops_users)
+		tmc_etr_reset_byte_cntr_sysfs_ops();
+}
+
+static irqreturn_t byte_cntr_handler(int irq, void *data)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = data;
+
+	atomic_inc(&byte_cntr_data->irq_cnt);
+	wake_up(&byte_cntr_data->wq);
+
+	return IRQ_HANDLED;
+}
+
+static void ctcu_cfg_byte_cntr_reg(struct ctcu_drvdata *drvdata, u32 val,
+				   u32 offset)
+{
+	/* A one value for IRQCTRL register represents 8 bytes */
+	ctcu_program_register(drvdata, val / 8, offset);
+}
+
+static struct ctcu_byte_cntr *ctcu_get_byte_cntr(struct coresight_device *ctcu,
+						 struct coresight_device *etr)
+{
+	struct ctcu_drvdata *drvdata;
+	int port;
+
+	/* The ETR may not be connected to a CTCU device */
+	if (!ctcu)
+		return NULL;
+
+	drvdata = dev_get_drvdata(ctcu->dev.parent);
+	port = coresight_get_in_port(etr, ctcu);
+	if (port < 0 || port > 1)
+		return NULL;
+
+	return &drvdata->byte_cntr_data[port];
+}
+
+static bool ctcu_byte_cntr_switch_buffer(struct tmc_drvdata *etr_drvdata,
+					 struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct etr_buf_node *nd, *next, *curr_node = NULL, *picked_node = NULL;
+	struct etr_buf *curr_buf;
+	bool found_free_buf = false;
+	unsigned long flags;
+
+	if (WARN_ON(!etr_drvdata || !byte_cntr_data))
+		return false;
+
+	/* Stop the ETR before initiating the switch */
+	tmc_etr_enable_disable_hw(etr_drvdata, false);
+
+	/*
+	 * Serialise the sysfs_buf/etr_buf swap against the ETR sink
+	 * enable/disable paths which also touch these fields under the
+	 * spinlock. tmc_etr_enable_disable_hw() takes the same lock, so it
+	 * must be called outside this critical section.
+	 */
+	raw_spin_lock_irqsave(&etr_drvdata->spinlock, flags);
+	curr_buf = etr_drvdata->sysfs_buf;
+	list_for_each_entry_safe(nd, next, &etr_drvdata->etr_buf_list, link) {
+		/* curr_buf is free for next round */
+		if (nd->sysfs_buf == curr_buf) {
+			nd->is_free = true;
+			curr_node = nd;
+		} else if (!found_free_buf && nd->is_free) {
+			picked_node = nd;
+			found_free_buf = true;
+		}
+	}
+
+	/* The live buffer has to be in the list to be switched out */
+	if (!curr_node)
+		found_free_buf = false;
+
+	if (found_free_buf) {
+		curr_node->pos = 0;
+		curr_node->reading = true;
+		byte_cntr_data->buf_node = curr_node;
+		etr_drvdata->sysfs_buf = picked_node->sysfs_buf;
+		etr_drvdata->etr_buf = picked_node->sysfs_buf;
+		picked_node->is_free = false;
+		/* Reset irq_cnt for next etr_buf */
+		atomic_set(&byte_cntr_data->irq_cnt, 0);
+	}
+	raw_spin_unlock_irqrestore(&etr_drvdata->spinlock, flags);
+
+	/* Restart the ETR once a free buffer is available */
+	if (found_free_buf)
+		tmc_etr_enable_disable_hw(etr_drvdata, true);
+
+	return found_free_buf;
+}
+
+/*
+ * ctcu_byte_cntr_get_data() - reads data from the deactivated and filled buffer.
+ * The byte-cntr reading work reads data from the deactivated and filled buffer.
+ * The read operation waits for a buffer to become available, either filled or
+ * upon timeout, and then reads trace data from the synced buffer.
+ */
+static ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *etr_drvdata, loff_t pos,
+				      size_t len, char **bufpp)
+{
+	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
+	struct device *dev = &etr_drvdata->csdev->dev;
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct etr_buf *sysfs_buf;
+	atomic_t *irq_cnt;
+	ssize_t actual;
+	int ret;
+
+	/* No byte-cntr read session, let the caller use the generic read */
+	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
+	if (!byte_cntr_data || !byte_cntr_data->irq_enabled ||
+	    !byte_cntr_data->reading)
+		return -EINVAL;
+
+	irq_cnt = &byte_cntr_data->irq_cnt;
+
+wait_buffer:
+	if (!byte_cntr_data->buf_node) {
+		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
+				(atomic_read(irq_cnt) >= MAX_IRQ_CNT - 1) ||
+				!byte_cntr_data->enable,
+				BYTE_CNTR_TIMEOUT);
+		if (ret < 0)
+			return ret;
+		/*
+		 * The current etr_buf is almost full or timeout is triggered,
+		 * so switch the buffer and mark the switched buffer as reading.
+		 */
+		if (byte_cntr_data->enable) {
+			if (!ctcu_byte_cntr_switch_buffer(etr_drvdata, byte_cntr_data)) {
+				dev_err(dev, "Switch buffer failed for the byte-cntr\n");
+				return -ENOMEM;
+			}
+		} else {
+			/* Exit byte-cntr reading */
+			return 0;
+		}
+	}
+
+	/* Check the status of current etr_buf */
+	if (atomic_read(irq_cnt) >= MAX_IRQ_CNT)
+		dev_warn(dev, "Data overwrite happened\n");
+
+	pos = byte_cntr_data->buf_node->pos;
+	sysfs_buf = byte_cntr_data->buf_node->sysfs_buf;
+	actual = tmc_etr_read_sysfs_buf(sysfs_buf, pos, len, bufpp);
+	if (actual <= 0) {
+		/* Reset buf_node upon reading is finished or failed */
+		byte_cntr_data->buf_node->reading = false;
+		byte_cntr_data->buf_node = NULL;
+
+		/*
+		 * Nothing in the buffer, waiting for the next buffer
+		 * to be filled.
+		 */
+		if (actual == 0)
+			goto wait_buffer;
+	}
+
+	return actual;
+}
+
+static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
+{
+	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	unsigned long flags;
+	int ret = 0;
+
+	/* byte-cntr is operating with SYSFS mode being enabled only */
+	if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
+		return -EINVAL;
+
+	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
+	if (!byte_cntr_data)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
+	/*
+	 * irq_enabled can only be changed with the lock held and reading
+	 * cleared, so check it here to keep it stable once reading is set.
+	 */
+	if (!byte_cntr_data->irq_enabled) {
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		return -EINVAL;
+	}
+
+	if (byte_cntr_data->reading) {
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		return -EBUSY;
+	}
+
+	/* byte_cntr_data->enable may race with ctcu_platform_remove() */
+	if (!byte_cntr_data->enable) {
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		return -ENODEV;
+	}
+
+	/*
+	 * Pin the module for the whole read session, so that rmmod fails with
+	 * -EBUSY instead of blocking in ctcu_platform_remove() until the file
+	 * is closed.
+	 */
+	if (!try_module_get(THIS_MODULE)) {
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		return -ENODEV;
+	}
+
+	byte_cntr_data->reading = true;
+	raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+	/* Setup an available etr_buf_list for byte-cntr */
+	ret = tmc_create_etr_buf_list(etr_drvdata, 2);
+	if (ret) {
+		scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock)
+			byte_cntr_data->reading = false;
+
+		module_put(THIS_MODULE);
+		/* ctcu_platform_remove() may be waiting for reading to be cleared */
+		wake_up(&byte_cntr_data->wq);
+		return ret;
+	}
+
+	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
+		atomic_set(&byte_cntr_data->irq_cnt, 0);
+		/*
+		 * Configure the byte-cntr register to enable IRQ. The
+		 * configured size is 5% of the buffer_size.
+		 */
+		ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata,
+				       etr_drvdata->size / MAX_IRQ_CNT,
+				       byte_cntr_data->irq_ctrl_offset);
+		byte_cntr_data->buf_node = NULL;
+	}
+	/* enable_irq_wake() may sleep on slow-bus irqchips, call it unlocked */
+	enable_irq_wake(byte_cntr_data->irq);
+
+	return 0;
+}
+
+static int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
+{
+	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
+	struct ctcu_byte_cntr *byte_cntr_data;
+
+	/*
+	 * Do the unprepare operation only when the byte_cntr_data->reading
+	 * is truly set
+	 */
+	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
+	if (!byte_cntr_data || !byte_cntr_data->irq_enabled ||
+	    !byte_cntr_data->reading)
+		return -EINVAL;
+
+	tmc_clean_etr_buf_list(etr_drvdata);
+	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
+		/* Configure the byte-cntr register to disable IRQ */
+		ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata, 0,
+				       byte_cntr_data->irq_ctrl_offset);
+		byte_cntr_data->buf_node = NULL;
+		byte_cntr_data->reading = false;
+	}
+	/*
+	 * The threshold IRQ is already disabled by the register write above,
+	 * so no wake event can arrive here. disable_irq_wake() may sleep on
+	 * slow-bus irqchips, so call it outside the spin_lock.
+	 */
+	disable_irq_wake(byte_cntr_data->irq);
+	wake_up(&byte_cntr_data->wq);
+	module_put(THIS_MODULE);
+
+	return 0;
+}
+
+const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_byte_cntr,
+	.read_unprepare	= tmc_read_unprepare_byte_cntr,
+	.get_trace_data	= tmc_byte_cntr_get_data,
+};
+
+/* Start the byte-cntr function when the path is enabled. */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+
+	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
+	if (!byte_cntr_data)
+		return;
+
+	/* Don't start byte-cntr function when irq_enabled is not set. */
+	if (!byte_cntr_data->irq_enabled || byte_cntr_data->enable)
+		return;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	byte_cntr_data->enable = true;
+}
+
+/* Stop the byte-cntr function when the path is disabled. */
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+
+	if (coresight_get_mode(sink) == CS_MODE_SYSFS)
+		return;
+
+	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
+	if (!byte_cntr_data)
+		return;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	byte_cntr_data->enable = false;
+}
+
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct device_node *nd = dev->of_node;
+	int irq_num, ret, i, irq_registered = 0;
+
+	for (i = 0; i < etr_num; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		/*
+		 * Initialize the lock and the waitqueue before requesting the
+		 * IRQ, and for every port as ctcu_platform_remove() uses them
+		 * even if the IRQ of the port is not registered.
+		 */
+		byte_cntr_data->ctcu_drvdata = drvdata;
+		init_waitqueue_head(&byte_cntr_data->wq);
+		raw_spin_lock_init(&byte_cntr_data->spin_lock);
+
+		irq_num = of_irq_get(nd, i);
+		if (irq_num < 0) {
+			dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
+			continue;
+		}
+
+		ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
+				       IRQF_TRIGGER_RISING,
+				       dev_name(dev), byte_cntr_data);
+		if (ret) {
+			dev_err(dev, "Failed to register IRQ for port%d\n", i);
+			continue;
+		}
+
+		byte_cntr_data->irq = irq_num;
+		irq_registered++;
+	}
+
+	if (!irq_registered)
+		return;
+
+	scoped_guard(mutex, &byte_cntr_ops_lock) {
+		tmc_etr_set_byte_cntr_sysfs_ops(&byte_cntr_sysfs_ops);
+		byte_cntr_ops_users++;
+	}
+
+	/* Drop the ops user when the CTCU device is removed or probe fails */
+	if (devm_add_action_or_reset(dev, ctcu_byte_cntr_put_ops, NULL))
+		dev_err(dev, "Failed to add the byte-cntr devm action\n");
+}
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 739105acb0a1..7738ae4fbf14 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk.h>
@@ -18,6 +19,7 @@
 
 #include "coresight-ctcu.h"
 #include "coresight-priv.h"
+#include "coresight-tmc.h"
 
 #define ctcu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
 #define ctcu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
@@ -43,17 +45,21 @@
 
 #define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
 #define CTCU_ATID_REG_SIZE		0x10
+#define CTCU_ETR0_IRQCTRL               0x6c
+#define CTCU_ETR1_IRQCTRL               0x70
 #define CTCU_ETR0_ATID0			0xf8
 #define CTCU_ETR1_ATID0			0x108
 
 static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
 	{
-		.atid_offset	= CTCU_ETR0_ATID0,
-		.port_num	= 0,
+		.atid_offset		= CTCU_ETR0_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR0_IRQCTRL,
+		.port_num		= 0,
 	},
 	{
-		.atid_offset	= CTCU_ETR1_ATID0,
-		.port_num	= 1,
+		.atid_offset		= CTCU_ETR1_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR1_IRQCTRL,
+		.port_num		= 1,
 	},
 };
 
@@ -62,6 +68,87 @@ static const struct ctcu_config sa8775p_cfgs = {
 	.num_etr_config	= ARRAY_SIZE(sa8775p_etr_cfgs),
 };
 
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
+{
+	CS_UNLOCK(drvdata->base);
+	ctcu_writel(drvdata, val, offset);
+	CS_LOCK(drvdata->base);
+}
+
+static ssize_t irq_enabled_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%u\n",
+			(unsigned int)drvdata->byte_cntr_data[port].irq_enabled);
+}
+
+static ssize_t irq_enabled_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf,
+				 size_t size)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(raw_spinlock_irqsave)(&drvdata->byte_cntr_data[port].spin_lock);
+	if (drvdata->byte_cntr_data[port].reading)
+		return -EBUSY;
+	else if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		drvdata->byte_cntr_data[port].irq_enabled = !!val;
+
+	return size;
+}
+
+static umode_t irq_enabled_is_visible(struct kobject *kobj,
+				      struct attribute *attr, int n)
+{
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct device *dev = kobj_to_dev(kobj);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	/* Expose irq_enabled only for the ports with a registered IRQ */
+	if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset &&
+	    drvdata->byte_cntr_data[port].irq)
+		return attr->mode;
+
+	return 0;
+}
+
+static struct attribute *ctcu_attrs[] = {
+	ctcu_byte_cntr_irq_rw(0),
+	ctcu_byte_cntr_irq_rw(1),
+	NULL,
+};
+
+static struct attribute_group ctcu_attr_grp = {
+	.attrs = ctcu_attrs,
+	.is_visible = irq_enabled_is_visible,
+};
+
+static const struct attribute_group *ctcu_attr_grps[] = {
+	&ctcu_attr_grp,
+	NULL,
+};
+
 static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
 				       u8 bit, bool enable)
 {
@@ -140,11 +227,15 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       struct coresight_path *path)
 {
+	ctcu_byte_cntr_start(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, true);
 }
 
 static int ctcu_disable(struct coresight_device *csdev, struct coresight_path *path)
 {
+	ctcu_byte_cntr_stop(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, false);
 }
 
@@ -195,7 +286,10 @@ static int ctcu_probe(struct platform_device *pdev)
 			for (i = 0; i < cfgs->num_etr_config; i++) {
 				etr_cfg = &cfgs->etr_cfgs[i];
 				drvdata->atid_offset[i] = etr_cfg->atid_offset;
+				drvdata->byte_cntr_data[i].irq_ctrl_offset =
+					etr_cfg->irq_ctrl_offset;
 			}
+			ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
 		}
 	}
 
@@ -209,6 +303,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.dev = dev;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.groups = ctcu_attr_grps;
 	raw_spin_lock_init(&drvdata->spin_lock);
 
 	drvdata->csdev = coresight_register(&desc);
@@ -244,10 +339,42 @@ static int ctcu_platform_probe(struct platform_device *pdev)
 static void ctcu_platform_remove(struct platform_device *pdev)
 {
 	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	unsigned long flags;
+	int i;
 
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Signal all active byte-cntr readers to exit, then wait for them to
+	 * finish before resetting the ops pointer and freeing driver data.
+	 * Without this, a reader blocked in wait_event_interruptible_timeout()
+	 * would access the freed ctcu_drvdata wait-queue head (use-after-free).
+	 *
+	 * The wait ends only when the userspace closes the tmc_etr file, so an
+	 * unbind with the file left open blocks until then. Unloading the module
+	 * is rejected with -EBUSY while a read session is open, so only a manual
+	 * unbind can block here.
+	 */
+	for (i = 0; i < ETR_MAX_NUM; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		/* The port was not initialized by ctcu_byte_cntr_init() */
+		if (!byte_cntr_data->irq)
+			continue;
+
+		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
+		/* Set enable=false for all ports to signal teardown to racing readers */
+		byte_cntr_data->enable = false;
+		if (!byte_cntr_data->reading) {
+			raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+			continue;
+		}
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		wake_up_all(&byte_cntr_data->wq);
+		wait_event(byte_cntr_data->wq, !byte_cntr_data->reading);
+	}
+
 	ctcu_remove(pdev);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
index e9594c38dd91..a2ae0a0d91d0 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu.h
+++ b/drivers/hwtracing/coresight/coresight-ctcu.h
@@ -1,23 +1,31 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _CORESIGHT_CTCU_H
 #define _CORESIGHT_CTCU_H
+
+#include <linux/time.h>
 #include "coresight-trace-id.h"
 
 /* Maximum number of supported ETR devices for a single CTCU. */
 #define ETR_MAX_NUM	2
 
+#define BYTE_CNTR_TIMEOUT	(3 * HZ)
+#define MAX_IRQ_CNT		20
+
 /**
  * struct ctcu_etr_config
  * @atid_offset:	offset to the ATID0 Register.
- * @port_num:		in-port number of CTCU device that connected to ETR.
+ * @port_num:		in-port number of the CTCU device that connected to ETR.
+ * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
  */
 struct ctcu_etr_config {
 	const u32 atid_offset;
 	const u32 port_num;
+	const u32 irq_ctrl_offset;
 };
 
 struct ctcu_config {
@@ -25,15 +33,68 @@ struct ctcu_config {
 	int num_etr_config;
 };
 
-struct ctcu_drvdata {
-	void __iomem		*base;
-	struct clk		*apb_clk;
-	struct device		*dev;
-	struct coresight_device	*csdev;
+/**
+ * struct ctcu_byte_cntr
+ * @enable:		indicates that byte_cntr function is enabled or not.
+ * @irq_enabled:	indicates that the interruption is enabled.
+ * @reading:		indicates that byte_cntr is reading.
+ * @irq:		allocated number of the IRQ.
+ * @irq_cnt:		IRQ count number of the triggered interruptions.
+ * @wq:			waitqueue for reading data from ETR buffer.
+ * @spin_lock:		spinlock of the byte_cntr_data.
+ * @irq_ctrl_offset:	offset to the BYTECNTVAL Register.
+ * @ctcu_drvdata:	drvdata of the CTCU device.
+ * @buf_node:		etr_buf_node for reading.
+ */
+struct ctcu_byte_cntr {
+	bool			enable;
+	bool			irq_enabled;
+	bool			reading;
+	int			irq;
+	atomic_t		irq_cnt;
+	wait_queue_head_t	wq;
 	raw_spinlock_t		spin_lock;
-	u32			atid_offset[ETR_MAX_NUM];
-	/* refcnt for each traceid of each sink */
-	u8			traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+	u32			irq_ctrl_offset;
+	struct ctcu_drvdata	*ctcu_drvdata;
+	struct etr_buf_node	*buf_node;
 };
 
+struct ctcu_drvdata {
+	void __iomem			*base;
+	struct clk			*apb_clk;
+	struct device			*dev;
+	struct coresight_device		*csdev;
+	struct ctcu_byte_cntr		byte_cntr_data[ETR_MAX_NUM];
+	raw_spinlock_t			spin_lock;
+	u32				atid_offset[ETR_MAX_NUM];
+	/* refcnt for each traceid of each sink */
+	u8				traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+};
+
+/**
+ * struct ctcu_byte_cntr_irq_attribute
+ * @attr:	The device attribute.
+ * @port:	port number.
+ */
+struct ctcu_byte_cntr_irq_attribute {
+	struct device_attribute	attr;
+	u8			port;
+};
+
+#define ctcu_byte_cntr_irq_rw(port)					\
+	(&((struct ctcu_byte_cntr_irq_attribute[]) {			\
+	   {								\
+		__ATTR(irq_enabled##port, 0644, irq_enabled_show,	\
+		irq_enabled_store),					\
+		port,							\
+	   }								\
+	})[0].attr.attr)
+
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset);
+
+/* Byte-cntr functions */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
+
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 4b40b692be4d..6ad09995ba87 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -293,7 +293,8 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (!tmc_etr_update_buf_node_pos(drvdata, actual))
+		*ppos += actual;
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 7d41fdf83c5b..253fe8eb6cbe 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1168,6 +1168,9 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
 	return rc;
 }
 
+/* Shared by the CTCU devices, set by the first one and reset by the last one. */
+static const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
+
 /*
  * Return the available trace data in the buffer (starts at etr_buf->offset,
  * limited by etr_buf->len) from @pos, with a maximum limit of @len,
@@ -1178,23 +1181,43 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
  * We are protected here by drvdata->reading != 0, which ensures the
  * sysfs_buf stays alive.
  */
-ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
-				loff_t pos, size_t len, char **bufpp)
+ssize_t tmc_etr_read_sysfs_buf(struct etr_buf *sysfs_buf, loff_t pos,
+			       size_t len, char **bufpp)
 {
 	s64 offset;
 	ssize_t actual = len;
-	struct etr_buf *etr_buf = drvdata->sysfs_buf;
 
-	if (pos + actual > etr_buf->len)
-		actual = etr_buf->len - pos;
+	if (pos + actual > sysfs_buf->len)
+		actual = sysfs_buf->len - pos;
 	if (actual <= 0)
 		return actual;
 
 	/* Compute the offset from which we read the data */
-	offset = etr_buf->offset + pos;
-	if (offset >= etr_buf->size)
-		offset -= etr_buf->size;
-	return tmc_etr_buf_get_data(etr_buf, offset, actual, bufpp);
+	offset = sysfs_buf->offset + pos;
+	if (offset >= sysfs_buf->size)
+		offset -= sysfs_buf->size;
+	return tmc_etr_buf_get_data(sysfs_buf, offset, actual, bufpp);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_read_sysfs_buf);
+
+ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
+				loff_t pos, size_t len, char **bufpp)
+{
+	ssize_t ret;
+	const struct tmc_sysfs_ops *byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
+
+	if (byte_cntr_ops) {
+		ret = byte_cntr_ops->get_trace_data(drvdata, pos, len, bufpp);
+		/*
+		 * -EINVAL means byte-cntr has no active read session, fall back
+		 * to the generic read. Anything else, including EOF (0) and
+		 * -ERESTARTSYS, is the result of the byte-cntr session.
+		 */
+		if (ret != -EINVAL)
+			return ret;
+	}
+
+	return tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp);
 }
 
 static struct etr_buf *
@@ -1248,6 +1271,49 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
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
+ * tmc_etr_enable_disable_hw - enable/disable the ETR hw.
+ * @drvdata:	drvdata of the TMC device.
+ * @enable:	indicates enable/disable.
+ *
+ * The hardware is touched only when the sink is still in sysfs mode. The mode
+ * is checked with @drvdata->spinlock held, which serialises against the sink
+ * disable path, so the hardware is never restarted after the sink has been
+ * disabled.
+ */
+void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS) {
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		return;
+	}
+
+	if (enable) {
+		tmc_etr_reset_sysfs_buf(drvdata);
+		__tmc_etr_enable_hw(drvdata);
+	} else {
+		__tmc_etr_disable_hw(drvdata);
+	}
+
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_enable_disable_hw);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
@@ -2076,15 +2142,54 @@ int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
 }
 EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
 
+void tmc_etr_set_byte_cntr_sysfs_ops(const struct tmc_sysfs_ops *sysfs_ops)
+{
+	WRITE_ONCE(byte_cntr_sysfs_ops, sysfs_ops);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_set_byte_cntr_sysfs_ops);
+
+void tmc_etr_reset_byte_cntr_sysfs_ops(void)
+{
+	WRITE_ONCE(byte_cntr_sysfs_ops, NULL);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_reset_byte_cntr_sysfs_ops);
+
+bool tmc_etr_update_buf_node_pos(struct tmc_drvdata *drvdata, ssize_t size)
+{
+	struct etr_buf_node *nd, *next;
+
+	if (drvdata->config_type != TMC_CONFIG_TYPE_ETR)
+		return false;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		if (nd && nd->reading) {
+			nd->pos += size;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 	unsigned long flags;
+	const struct tmc_sysfs_ops *byte_cntr_ops;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
 		return -EINVAL;
 
+	byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
+	if (byte_cntr_ops) {
+		ret = byte_cntr_ops->read_prepare(drvdata);
+		if (!ret || ret == -EBUSY)
+			return ret;
+
+		ret = 0;
+	}
+
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	if (drvdata->reading) {
 		ret = -EBUSY;
@@ -2116,11 +2221,17 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 {
 	unsigned long flags;
 	struct etr_buf *sysfs_buf = NULL;
+	const struct tmc_sysfs_ops *byte_cntr_ops;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
 		return -EINVAL;
 
+	byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
+	if (byte_cntr_ops)
+		if (!byte_cntr_ops->read_unprepare(drvdata))
+			return 0;
+
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
 	/* RE-enable the TMC if need be */
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index fbb015079872..a15e2f93f16a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -211,12 +211,15 @@ struct tmc_resrv_buf {
 /**
  * @sysfs_buf:	Allocated sysfs_buf.
  * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates byte_cntr is reading the buffer attached to
+ *		the node.
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
@@ -480,5 +483,11 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+void tmc_etr_set_byte_cntr_sysfs_ops(const struct tmc_sysfs_ops *sysfs_ops);
+void tmc_etr_reset_byte_cntr_sysfs_ops(void);
+void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable);
+bool tmc_etr_update_buf_node_pos(struct tmc_drvdata *drvdata, ssize_t size);
+ssize_t tmc_etr_read_sysfs_buf(struct etr_buf *sysfs_buf, loff_t pos,
+			       size_t len, char **bufpp);
 
 #endif

-- 
2.34.1

