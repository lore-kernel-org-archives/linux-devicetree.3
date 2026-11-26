Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687003;
	b=QsX0GoyelJAbqp/kHTOHwkXm/jZXVsW3fOgYhdxYsw2+vkPErRM7skMhTjwMnjT3J/Hl
	 O/0AtYvk8+KsHHarNErrVuU1quEuPYonJS+r//RJ9vvHzU00lVmow2Zfrbb44Fs62vi89
	 AXQroWntjUEjxGpWZqghgkro7o+JtnwlBxNI2LP4s0nDlwVQ6bl4UAWtTmj8m7VeKFmdq
	 U3SrLtxi5qz655K+pkQaorE9Ebci8vnrsgfrsDD579J208TXfWGVrh9Obv//8xeEAjDKR
	 nGw/fR/IhsAbPXOItIfulnsIytkPOzm6hYuZh+c4MmXK0v22jQTKp7nvOppDI2f45tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687003;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0gHqynCP1e/J7pOrFVX3MzwomvRnH0tjhE7JkzjKmx8=;
	b=bpwJKHIURmcvleXfI36NPdeQjXrKMDpbrw6ahA2+SAXqHW1XufXFKyJuOxS3E9vaDVZ2
	 9m0lsYuyZvj4kI1AEsG7cc5apjr8oylnTLazYxeJlI4W2DH8geWBJzsE6YzFaD0hthFIw
	 qHVLX9HyL7cTXJLtamT8hmbQXPQGPusZduuZ39bzISSwxDO0LZWkAosdCIo/hl6Gysn3w
	 kaMVQEudriHFaaARC1yoqSPcWf5XgIwtlqi9Ej5NEWNqINcAdLPJYxVvGbs2mpiaLn92r
	 9fq8Y2x9pAKB64ZdMjoWVBTC9JVDNFBHQuxpJns/2sNmOI2LsA9r7xaLp/ZxlQ9aFaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Wx+w/Vj1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="c/NfOX7B";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83299606A32C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83299606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wx+w/Vj1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c/NfOX7B
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Aw4t695029
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0gHqynCP1e/
	J7pOrFVX3MzwomvRnH0tjhE7JkzjKmx8=; b=Wx+w/Vj1CQ+HgczuYa67jq3cnDg
	W0Q4nXuvO4KyynlqUJHw9o4Ge5t5PCqPW7x14Y5O5KIGTnGzrvzbjrFYuTpfJqQj
	woa0r7aRQcDfLemnS37AmxHpcyD1ESXb1jLB8ymonMIov5H0zJ3Wp6Khz9P8vask
	0dzu6UwOTxwIxpsaQ+vxSaKVKejJOurrTlXzm09bM+PLHunBQjOGZyq37hxhRJCZ
	7Wc0QLp/A+8ok5UPtIUjQcQC/IyvNqla2r2qU0TNu/j14yusQW0sDQrce6Wc37Bv
	CMI3Ns1xqylb0qIcU8Br1D9InQ7AZ3HMc9s6Q7inwuOqxfe55fgIC3MJCig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7rqds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so6557729a91.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687000; x=1796291800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gHqynCP1e/J7pOrFVX3MzwomvRnH0tjhE7JkzjKmx8=;
        b=c/NfOX7B6pZrolwqKs+LslfUpA0F9mHFwGa0yw0PFwlMZlWT/UgfSjvdqYJswWoTTI
         XRGbf5iIh2PhAtP9FNFSvdQi0XNMhLI4VTL6JUGpEjhPvZoiTTeeycHgGSdnJOo7qru5
         zb9e+2bDADvMERQDByP7SHgdCs9JKvnu3emmZs0eupAFEXp9nMEd3hl53UkkzcDqQHZd
         bnkaIQPRTirniUczyNF0w3iYauMZvcjOlItuaSTZPrfz7vCHskBTaM3E5EdcvBAqLIrM
         8k2ZY4c+JQJy246AGeUdHG7ePS2cwB+AZolhT3pCvY/ZKYbTRW0ynJ3MGTVNObS1PAeG
         H5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687000; x=1796291800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0gHqynCP1e/J7pOrFVX3MzwomvRnH0tjhE7JkzjKmx8=;
        b=VhSUQKqoUABzjgyRbtAEYnoUXwEd+i9EA3yxINWStY7tiRtTYeZOwCbfvPhOiqHv4u
         Ag95l4E1nylaL7f7KBCJeTPnJDQaxRmsO9EmKhpglrfe6YDm21OLCB3LxrOD5SfBcbZ+
         o31oUq6W6yAZ+cQXfCMC6gRev43ygeXONwe3ek7E/mxGhGREKpxuOFUFVWvlbBJHMdWx
         HFzYArrN3CxwD5hKV72eB9A38XuhcoDYN5UUTOpMzS4OxsBj3uiz4dNPUPyNtxMyRvcy
         8j2JMbeFd/wWzKMxKgESIVGhPHgZmN36DlAroMnR9rREeTd5+BraaZGeuC+hvay78zDh
         K6AA==
X-Forwarded-Encrypted: i=1; AL+hErGwjHDtCjU1fowjaX5fC84M+bvIXK1wBeaPE9itUWcBJKGAEUUJyOBHYnnaOPscaceB+gEmsye2PzV5@vger.kernel.org
X-Gm-Message-State: APuU4Z8ncebq27WxFWpxmrb7+5tK8QyEioH1RfcXJYJ3UZ+5fS8kqO4j
	kVyWTLJKxv71vqmpOMisefcOP3Lt/MfHvbU1vpdrOkk9/3PlmuSeDaBn8DbjohdRjSid0J+fE0X
	9XqCE3mZiTSurkOgr7sbahQgHOj/tqhswic03PJ+mvSekrR1dOCAGXUmkoeGeOerJ
X-Gm-Gg: AZFdTZdv+JoiQyd+ngryyxRohmozmMkuvRTZJqdH/EJa3Pe4b1gROPXZzEmr5ZQ5x1l
	FM6YC5lQu4M/uW6jbr6VOLuBuwAjbmp5aq1s5kPXg4XBj0/WaxZsK6xddjPW9FbJYQ03MT/DcBq
	Ad3eSZe3Lg1H+Yx/b8KTwym4du9y7Y/Bu/H2xKJHGQpkjiAcgSbLa87KFGQVDUs3+HUhWQ4lGNk
	cJQ6zpuaguyPUDx4DgEDRtawnVBBWF0wvIQ3aaWyRQ5X4FBxkTKkvt66LKUvAy/eTWwsHs/ocLd
	o4lLf+v6/nnCnxmTd6ZZS9iMUrhEUyD7KugHki6T95wJJ2UGIaHpWpA481ts5/qFEFWrzNcXw7y
	It42NB+0JPxTqfaS5y+HGYkSetFQMmuHKS8nUnl1N6ddcs59COGKBDJIscNqvoyQGt2Ms0SypzX
	hBeVeZNImTpP6/TBDsE7hVWTy6n7Ff+HRJUKvZMAObhCRLTNAV1Cw0ug9b1IGzdPTmL6javdO1n
	Q==
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr13282823a91.0.1795686999559;
        Thu, 26 Nov 2026 01:56:39 -0800 (PST)
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr13282809a91.0.1795686999021;
        Thu, 26 Nov 2026 01:56:39 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:38 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 05/14] gtrace: Add functions to start/stop tracing on a component path
Date: Thu, 26 Nov 2026 15:25:26 +0530
Message-ID: <6fcdae2ebe6a263f872357b2aff272f9cf7ebe32.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX2lUhXG1IvDUo
 HQ4ELeR5H3jFUIYhaHIMzu3zdQp2aoxOCkAbzWo+Ly7TapU4+3+raEGV2SnF02zuHLwr0H1dZAg
 xUwp6/LLPbFBpImK/Nki94tyfoE+e0o=
X-Proofpoint-GUID: fRF4jUoHsQzNWlLmPuHsDhx3Lk70vxGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX8dwDXW6ql0F1
 ytlQ/t8ZWMTK54acN7Hk77+X74Z9n7Igak75lH7uKE2wIbL8lcNFh54OKBOUyaKPxg2RG1W1xsL
 8AuFiRl5j7FWeJTMLah3M1Of1vln2ZR3GSe57S7BfRG7uTzHentJX2sv+UfBDkmDRzaXCRr7gB6
 mFoiU3xbXQhmc19WncZIblJ0Ph31jSChL7D/Q5yNy4PMEaX9uFT5MnkJeGAR1cVVsVVFuWN+rBU
 SdfAxcolCeID8OSH5EQfbSZZinAmW6hE0mvGn2TANQET7wpezGnny2t7yVt+sXqnSCPhmGVWTMj
 unVK5Bv7Z8LPJ7zo0QnEXTuLMjbT6nLxnMNCYvNq40MfZyJO2gfgqwJ0O6RJeUZ31ZbR5/1ciPT
 9bMh2ftEMrGhTbVwqIVmspbOO0r0kF4kYVo9QNdJP+AJmFkOmFucdhWEEhHhEvi38UnE0saKh0J
 jEgJgCsVuMrWnahZVtw==
X-Proofpoint-ORIG-GUID: fRF4jUoHsQzNWlLmPuHsDhx3Lk70vxGV
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b080259 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kiQ-iWSZUmGuUuZfK6oA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260038

The perf driver framework needs to be able to start / stop all components
in a trace component path during its operation. Add gtrace_path_start()
and gtrace_path_stop() functions for this purpose.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 128 ++++++++++++++++++++++++-
 include/linux/gtrace.h                 |   7 ++
 2 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 728235fc9bfe..754c5f71168b 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/percpu.h>
+#include <linux/spinlock.h>
 #include <linux/xarray.h>
 #include <linux/gtrace.h>
 
@@ -24,7 +25,16 @@ static DEFINE_PER_CPU(struct gtrace_component *, gtrace_cpu_source_comp);
 /* gtrace comp specific data, to be used by core functions only */
 struct gtrace_comp_priv {
 	struct gtrace_component comp;
+	/*
+	 * Protects ready, start_count and owner. Serializes start/stop against other
+	 * paths sharing this component and against driver removal. For a sink, also
+	 * serializes against gtrace_path_copyto_auxbuf().
+	 * Raw because the PMU start/stop callbacks are called with the rq_lock held.
+	 */
+	raw_spinlock_t lock;
 	u32 type_idx;
+	u32 start_count;
+	pid_t owner;
 	bool ready;
 	bool visited;
 };
@@ -121,13 +131,17 @@ static int gtrace_probe(struct device *dev)
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(dev->driver);
 	struct gtrace_component *comp = to_gtrace_component(dev);
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	unsigned long flags;
 	int ret = 0;
 
 	if (gtdrv->probe)
 		ret = gtdrv->probe(comp);
 
-	if (!ret)
+	if (!ret) {
+		raw_spin_lock_irqsave(&cpriv->lock, flags);
 		cpriv->ready = true;
+		raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	}
 
 	return ret;
 }
@@ -137,8 +151,11 @@ static void gtrace_remove(struct device *dev)
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(dev->driver);
 	struct gtrace_component *comp = to_gtrace_component(dev);
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	unsigned long flags;
 
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
 	cpriv->ready = false;
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
 	if (gtdrv->remove)
 		gtdrv->remove(comp);
 }
@@ -481,6 +498,7 @@ struct gtrace_component *gtrace_register_component(struct gtrace_component_id *i
 		ret = -ENOMEM;
 		goto err_out;
 	}
+	raw_spin_lock_init(&cpriv->lock);
 	comp = &cpriv->comp;
 	comp->pdata = pdata;
 	comp->id = *id;
@@ -692,6 +710,114 @@ static void gtrace_release_path_nodes(struct gtrace_path *path)
 	}
 }
 
+static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owner)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	const struct gtrace_driver *gtdrv;
+	unsigned long flags;
+	int ret = 0;
+
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
+	if (!cpriv->ready) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	gtdrv = to_gtrace_driver(comp->dev.driver);
+	if (!gtdrv) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (cpriv->start_count) {
+		if (cpriv->owner != owner) {
+			ret = -EBUSY;
+			goto out;
+		}
+	} else {
+		if (gtdrv->start) {
+			ret = gtdrv->start(comp);
+			if (ret)
+				goto out;
+		}
+		cpriv->owner = owner;
+	}
+
+	cpriv->start_count++;
+out:
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	return ret;
+}
+
+static int __gtrace_comp_stop(struct gtrace_component *comp)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	const struct gtrace_driver *gtdrv;
+	unsigned long flags;
+	int ret = 0;
+
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
+	if (!cpriv->start_count) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	cpriv->start_count--;
+	if (!cpriv->start_count) {
+		if (!cpriv->ready) {
+			ret = -ENODEV;
+			goto out;
+		}
+
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+		if (!gtdrv) {
+			ret = -ENODEV;
+			goto out;
+		}
+
+		if (gtdrv->stop)
+			ret = gtdrv->stop(comp);
+	}
+out:
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	return ret;
+}
+
+int gtrace_path_start(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+	int ret = 0;
+
+	list_for_each_entry_reverse(node, &path->comp_list, head) {
+		ret = __gtrace_comp_start(node->comp, path->owner);
+		if (ret)
+			break;
+	}
+
+	/* If a component failed to start, stop all the components that were started before it */
+	if (ret)
+		list_for_each_entry_continue(node, &path->comp_list, head)
+			__gtrace_comp_stop(node->comp);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_start);
+
+int gtrace_path_stop(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+	int ret = 0, err;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		err = __gtrace_comp_stop(node->comp);
+		if (err && !ret)
+			ret = err;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_stop);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 562cd1eca162..77b2835c1647 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -295,6 +295,7 @@ struct gtrace_path {
 	enum gtrace_component_mode	mode;
 	u32				trace_id;
 #define GTRACE_INVALID_TRACE_ID	U32_MAX
+	pid_t				owner;
 };
 
 struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
@@ -303,11 +304,15 @@ struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode);
 void gtrace_destroy_path(struct gtrace_path *path);
+int gtrace_path_start(struct gtrace_path *path);
+int gtrace_path_stop(struct gtrace_path *path);
 
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver, terminated
  *                 by GTRACE_COMPONENT_TYPE_NONE.
+ * @start:         Callback to start tracing.
+ * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
  * @remove:        Driver remove() function.
  * @get_trace_id:  Get/allocate a trace ID. Returns a nonnegative ID, -ENODATA
@@ -317,6 +322,8 @@ void gtrace_destroy_path(struct gtrace_path *path);
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	int			(*start)(struct gtrace_component *comp);
+	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
 	void			(*remove)(struct gtrace_component *comp);
 	int			(*get_trace_id)(struct gtrace_component *comp,
-- 
2.43.0

