Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687009;
	b=jHX1C9XBm2/pWShHj0MEjZRAnsbja9df3sZ7UhXb7hhJPxFnR+uGIC8YFZNg6zN8hbGF
	 JOev7Sh1i6BeLjzBTGyNi8z1B6BsGDCpgMxyRvqcEYkcJuf96vEmPO5G7i6TuL21iGLPh
	 IyCoD+JiwURm+gvvPWl8HaQsRISN4K/ejd2KLJ40xmhf471agM5ul8KoEyhzNvQHPevZJ
	 xcFIaeP6N3IV0hVQkzD9JmLydkxBa3kW2KpFFZcw/WCunKPtDQw59ukCWUb8BuQbheOGD
	 id6m/SZ88dgKPRCy2SsckxFXNVW6BWHSK3TryLaMreBQtVJsH2hEunOrtDy+rj3/Mgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HgBx16XBHaJoctyQ5sr1y8uJL3DO8PouYXzM4cXEFkI=;
	b=tLestR+I8L4Nq7iEhzNj9gpCmHeEE5yewU+y4WPKaioCQ2I3PSM7WzdsDxW/FXuOugSV
	 HMtGCDJaw9cWCcMgDeSoaI6MB3HJuYCMWUQJwb8b4P8qCUlYSLONWtO8gporZbrpMpi1q
	 BH0npqg5a4T1qbQABRgelO1V7Zoam5L8EDF6fRu/wfa89aYXdFAsEpFtZpG12BXzUsJVh
	 mEfILBlEcOH8IvgQ1sPAyssKcS8mJ1Fpryl4fzC+OxRrzoQglOVVNLCbGtNNyaNs0hh29
	 B90a4B3+Y8FkMIuWh7DxPOHjHBCek4N0Vr0IY81P2nfx1HR5Cv7fCsD4QU68qZuPAJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aGkC60DF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XRwzfflF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6223D606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6223D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aGkC60DF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XRwzfflF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B9Ct919557
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HgBx16XBHaJ
	octyQ5sr1y8uJL3DO8PouYXzM4cXEFkI=; b=aGkC60DFYejd+1ly9Fe9fb6rayy
	8cDAo6Kmn0UYX8EkQmMRgGOfhLcP1e1Y4nCORTSwSg83B7Ivlz++kgD98ndYP67j
	8lPSm++000gUxt+hOPrcLILeFioLWWPsSqDADT//Wm9zUEhReYMTVq0FqwOsi5Y8
	KVJ0zea8zIt7TB5GpZl4ZkkZfiJeFYccTnoWnXNptrZN/3KRl47vho9nSNGF7I47
	lPbrJbgqQw+E+xEteLzmFYZJULRE2GfvktMkKi0V5R3MCeM8FPvZV/1Y6fv76bZX
	E9sYaxyel8tYtnp5ADPUzZdU6o3K+pb/tBes7/rO8KM61f54m9WBMOTwb9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2hj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b456fee3b2so4618583a91.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687008; x=1796291808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgBx16XBHaJoctyQ5sr1y8uJL3DO8PouYXzM4cXEFkI=;
        b=XRwzfflFX9b/fZV9EDhbFe4xpCzo4xerj/r24YJgUfaBFr0C2ZeIN6NE8SfcowUOGo
         /loIFHTV6zxWKYjrP0INAKrzWO0r7lUL8zHt5ZBfdPyvh99Z+nJR8uaZOPoFZgES1hbe
         h+MxIupPM+5Hlp9JSMYaSjhNJk8s+ZS15YY1N5IIc1BO+5ST73jniawxYPra+n0ih4au
         mJAFRmu6nZszyEfv8M3KtFxVJJTUDNnY9ZuiK+cIcZgYHm7ajErmeUMKtSu/qapyLEfS
         s+e57SyFifO9I30O10SA/GTKTnmL1pUMe5mH6hH8LSsDGrP7AJJtptoyBsNEGC+GAlzf
         nSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687008; x=1796291808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HgBx16XBHaJoctyQ5sr1y8uJL3DO8PouYXzM4cXEFkI=;
        b=d7knDzWlA3V6Ec48peMj9vnrZuFzGkNVZHP2VeYnqO2FXAHdq/LqLPg3E4hwHdkUUT
         iNvsBEtF3zTHxDxcuohMu5bAsbH0P2aY3F0T+Ty0cuor4lKpx/DvY+XMk57hqabg2LyB
         GXNMGGqCjWbymgP7jTXDE1d7X3Sdzi5222qtOURT4DNwk4SY6rIoDVpLNp9YZ985wLD+
         3/Sg5eO6Mk7Ffp9zXukfN2yLRRQeUu20a1HzDWT0BAkFj6Jky061HcPz3B7o7tHsK1Nx
         DwcFGYqHNPalhC18H9wKSOl3pHJXPgV0Cy010UjDA3KvVwwndFKe1ILfZwc7uxyclsnX
         oGoA==
X-Forwarded-Encrypted: i=1; AL+hErFqGuX1BcYqDviBmiZwqiDgeuShzfg/6bO72UIdXgTU3RCM2LuOEhhEE7oMOyklirmv0cfu3728AL8l@vger.kernel.org
X-Gm-Message-State: APuU4Z81k1oQSYIzSjaU53chKFYcsq1UnzIU4/nPSgwhF7cTfAKWgsXm
	rF88e/1N5Dl1JNTuFiDFgNkAVHKVfgJmO86//nlY8RRd92SJ/2Yy0hLmwqAIDMA7I8W6thZ08i+
	B6CeM9Y6E2TRM8BfkIuMCWuPyCZadoGtjIuZAtIbZXP5XEl7Py0m9jYBZpKaOiLdw
X-Gm-Gg: AZFdTZeQaeepdA3I/D84/GgFhdCIVj+gjmKtWW3HpYNBMLyEgAeCaQRX/49c8m9ZXvW
	QNvXhuTeLekf5DWXKrRpMFd8WtD6GdlersGNr2COmtdd5q5BGvq3iDUdvMTARLtw4fYqnOFbVIx
	19a+ELP/zKp2HQpbtfrW1fuxe2QPGD96YNQoldI8zISqD1Iw+IkpNYQQOFOUe5USa9haCbQV3st
	+lo+OdsITECDi1+hn3QPu9WGrP8ffRyXg0RQe/sJIAXumBafP/K4W34tPotOAqxxeDOrLtIdOm8
	w8ax6UfVRcnGY1ScyF3eWbsAbH1wW7vSOMSYpMqUUSZybmiNUWM5I8mBqniyd+al3+w+p5B4xrR
	X0/Imr+IDvEseWOCdG+KJBrwZCqlMaWuQjrdMRBy0LJ331BdfEsAz6G5nBgyf2nTfPtmwG08e7w
	0xWbrLzTLoxAzNrRpezDnSSMiCjEZhwo8OdsqDQT+OZwRvIfokihXDjYbK52gDvZpMRYnE1kqQL
	Q==
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr17904013a91.1.1795687007764;
        Thu, 26 Nov 2026 01:56:47 -0800 (PST)
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr17903983a91.1.1795687007212;
        Thu, 26 Nov 2026 01:56:47 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:46 -0800 (PST)
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
Subject: [PATCH v7 06/14] gtrace: Add RISC-V Trace encoder driver
Date: Thu, 26 Nov 2026 15:25:27 +0530
Message-ID: <7c08bb0d199c3a8cf0ec0b875d5a42165ec164eb.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX5nwLNi388awX
 aYXVaaoyyYdaZ+gYEwYgAYs4uspi6EPmInThfzYM2gehXe2XAvzK48rq7jmI3Zu9kUD4fMzjExB
 wSoT7pbrfyKXq1wlrJagYQeBCOoLn4d4x4vqasGxVp3oRvGLuZ0+lmzang4bNDdUYcfW9Pp/tPT
 fRI8CKqpWdL0ZMHh7mxcmQVoz5ki6S90/aZ+5rnjJanKC71ObtliR4zhFNw0Dv4KYsOGUSOv5kb
 hRY2j+xjmdsnt7fxMPEbHl7PdKw0sLcxHP6Ld7djDegdHxb/FeAIcXzcsfdeeSN5VwzVn/xe5k8
 XwujtyGSSJzqKhYTysW8XEeuyi0GPyrPggPKHUqdA9CKLTp3kV0cSScZBPfjC8Mm6UX2hv3DW89
 tOmXbDWd81/UcRiVBojkSyiXxeLxdqTZ7scM14QrAUICgOuxk+lQVPpRSQBfpLzU1/NkIlWca6O
 oHi0ttp5310U5y7V0Kw==
X-Proofpoint-GUID: wyK3dI9cayzBfT7r1K5ikgj07sDzMPNi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX39HLoMtnn9Lo
 oqQmz+N2Qavir1RW/GQ9QjCKsuxYZAXG9HtxlecqZATMSrVWBY8RqUAo5n5yWv0c7bi/KjVxr9C
 quLtzELaMpb/pIKSNCnxZD5ps9dluso=
X-Proofpoint-ORIG-GUID: wyK3dI9cayzBfT7r1K5ikgj07sDzMPNi
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b080260 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=lv0vYI88AAAA:8
 a=EUspDBNiAAAA:8 a=8cX3ZGdeUJnqEQj61ccA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

Add initial implementation of RISC-V E-Trace encoder driver. The encoder
is defined in the RISC-V Trace Control Interface specification.

Suggested-by: Zane Leung <liangzhen@linux.spacemit.com>
Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig           |  13 +
 drivers/hwtracing/gtrace/Makefile          |   1 +
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 274 +++++++++++++++++++++
 3 files changed, 288 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index 04986f216549..e3a621b59913 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -28,3 +28,16 @@ config RVTRACE
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace.
+
+config RVTRACE_ENCODER
+	tristate "RISC-V Trace Encoder driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for the RISC-V trace encoder component
+	  which is defined by the RISC-V Trace Control Interface specification.
+	  The encoder is bound to a CPU and generates the trace data for that
+	  CPU.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-encoder.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 20f67a78b8ab..2660fcaa332b 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -5,3 +5,4 @@ gtrace-y := gtrace-core.o
 gtrace-$(CONFIG_OF) += gtrace-of.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
+obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
new file mode 100644
index 000000000000..f528a6af42e1
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cpumask.h>
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/log2.h>
+#include <linux/minmax.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+
+#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	0x7
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
+#define RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT	15
+#define RVTRACE_COMPONENT_CTRL_FORMAT_MASK	0x7
+#define RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT	24
+#define RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE	0x0
+#define RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE	0x1
+
+#define RVTRACE_ENCODER_INSTFEAT_OFFSET		0x8
+#define RVTRACE_ENCODER_INSTFEAT_SRCID_MASK	0xfff
+#define RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT	16
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK	GENMASK(31, 28)
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX	12
+
+struct rvtrace_encoder_priv {
+	u32 srcbits;
+};
+
+/*
+ * Set the srcid and clear trTeInhibitSrc bit so that the emitted trace messages carry
+ * the source id
+ */
+static void rvtrace_encoder_set_srcid(struct gtrace_platform_data *pdata, u32 srcbits)
+{
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+	val &= ~(RVTRACE_ENCODER_INSTFEAT_SRCID_MASK << RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT);
+	val &= ~RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK;
+	val |= pdata->bound_cpu << RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT;
+	val |= FIELD_PREP(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, srcbits);
+	gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+}
+
+static int rvtrace_encoder_get_trace_id(struct gtrace_component *comp,
+					enum gtrace_component_mode mode)
+{
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+	u32 val;
+
+	if (!priv->srcbits)
+		return -ENODATA;
+
+	val = gtrace_read32(comp->pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+	return (val >> RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT) &
+	       RVTRACE_ENCODER_INSTFEAT_SRCID_MASK;
+}
+
+/* Request the preferred trace format and store the accepted hardware format. */
+static int rvtrace_encoder_set_format(struct gtrace_platform_data *pdata)
+{
+	u32 val, fmt;
+
+	switch (pdata->format) {
+	case GTRACE_FORMAT_ETRACE:
+		fmt = RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE;
+		break;
+	case GTRACE_FORMAT_NTRACE:
+		fmt = RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~(RVTRACE_COMPONENT_CTRL_FORMAT_MASK << RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT);
+	val |= fmt << RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT;
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val = (val >> RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT) & RVTRACE_COMPONENT_CTRL_FORMAT_MASK;
+	switch (val) {
+	case RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE:
+		pdata->format = GTRACE_FORMAT_ETRACE;
+		break;
+	case RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE:
+		pdata->format = GTRACE_FORMAT_NTRACE;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int rvtrace_encoder_probe(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_encoder_priv *priv;
+	u32 val, hw_srcbits, srcbits;
+	int ret;
+
+	if (pdata->bound_cpu < 0) {
+		dev_err(&comp->dev, "cpu property missing. Please fix firmware.\n");
+		return -EINVAL;
+	}
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = rvtrace_encoder_set_format(pdata);
+	if (ret) {
+		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
+		return ret;
+	}
+
+	/* Check if trTeInhibitSrc is hardwired to 1 */
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	if (!(val & BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT))) {
+		/* Probe how many bits can trTeSrcID span in the emitted Trace messages */
+		val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+		hw_srcbits = RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX;
+		do {
+			val &= ~RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK;
+			val |= FIELD_PREP(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, hw_srcbits);
+			gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+			val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+			if (FIELD_GET(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, val) == hw_srcbits)
+				break;
+		} while (--hw_srcbits);
+		/* Determine if there are sufficient bits to hold max cpus */
+		srcbits = min_t(u32, hw_srcbits, order_base_2(nr_cpu_ids));
+		if (srcbits && pdata->bound_cpu < BIT(srcbits)) {
+			rvtrace_encoder_set_srcid(pdata, srcbits);
+			val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+			if (FIELD_GET(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, val) == srcbits)
+				priv->srcbits = srcbits;
+		}
+	}
+	if (!priv->srcbits) {
+		dev_warn(&comp->dev, "cpu %d trace will not carry source id\n",
+			 pdata->bound_cpu);
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	}
+	dev_set_drvdata(&comp->dev, priv);
+	dev_dbg(&comp->dev, "%pfwP: cpu %d, srcbits %u\n",
+		dev_fwnode(pdata->dev), pdata->bound_cpu, priv->srcbits);
+	return 0;
+}
+
+static int rvtrace_encoder_start(struct gtrace_component *comp)
+{
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int ret;
+	u32 val;
+
+	if (priv->srcbits) {
+		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
+	} else {
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	}
+
+	ret = rvtrace_encoder_set_format(pdata);
+	if (ret) {
+		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
+		return ret;
+	}
+
+	ret = gtrace_enable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to enable encoder.\n");
+		return ret;
+	}
+
+	/* set mode */
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~(RVTRACE_COMPONENT_CTRL_INSTMODE_MASK << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
+			      pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to enable tracing.\n");
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+		gtrace_disable_component(comp);
+	}
+
+	return ret;
+}
+
+static int rvtrace_encoder_stop(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int ret, err;
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
+			      pdata->control_poll_timeout_usecs);
+	if (ret)
+		dev_err(&comp->dev, "failed to stop tracing.\n");
+
+	err = gtrace_disable_component(comp);
+	if (err)
+		dev_err(&comp->dev, "failed to disable encoder.\n");
+
+	return ret ?: err;
+}
+
+static const struct gtrace_component_id rvtrace_encoder_ids[] = {
+	{ .type = GTRACE_RVTRACE_ENCODER,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_encoder_driver = {
+	.id_table = rvtrace_encoder_ids,
+	.probe = rvtrace_encoder_probe,
+	.get_trace_id = rvtrace_encoder_get_trace_id,
+	.start = rvtrace_encoder_start,
+	.stop = rvtrace_encoder_stop,
+	.driver = {
+		.name = "rvtrace-encoder",
+	},
+};
+
+static int __init rvtrace_encoder_init(void)
+{
+	return gtrace_register_driver(&rvtrace_encoder_driver);
+}
+
+static void __exit rvtrace_encoder_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_encoder_driver);
+}
+
+module_init(rvtrace_encoder_init);
+module_exit(rvtrace_encoder_exit);
+
+/* Module information */
+MODULE_AUTHOR("Mayuresh Chitale");
+MODULE_DESCRIPTION("RISC-V Trace Encoder Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

