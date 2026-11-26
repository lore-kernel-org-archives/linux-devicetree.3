Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686977;
	b=D0ghAXmCR1Zsa9VnQxV11CO4tQDdYAPbiNXqgnA7Hquqh+Fn/plOq1yaAHvqLB4vZIH6
	 ui9C9zNeB8mW76RfERMYtAtiGk+4WA3xIvq9BTmqAmJL9IVZfjpMj7/sa3RTjrg28+Xb/
	 rkbcw3DfJdSHNiRW0dWaRHVeADMRJ9n6amO6W9WFELvWRZTJXFBDV7PIlzZ36PM/CLhtH
	 nfgagkziKjb7OhR/LarMcTK8ZS9daQcF4x8aYyq0qeIE+NF8+wLo66FVQcx5KAaAhAcSz
	 1i54ou0NqpQGTBk2Z9nP6N5rpnOiF7v61CbMqIadN+0rbxpdDs/PWe5WebFpTmdD0rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qaAVVIcohJrDi2KgEHY7jswg3SBGVepgZruK51y69KE=;
	b=vi2pSNWHNm4sb/9d+2cDYV2VXgwad2fY67pwC3IeDQ6l9Iwd0FgFEI7D1cVC1ceTdNlP
	 TGAd5q+FgJN2tbhZRKGyOVLf6b/esYo38rHGUaR8NIQe15y58Fh9lgTV2F2AXnDNuCqAs
	 i26CSY9YucV+Nu50YSZ3E/C82kVyVfTP+0w6253vZ8G4n3ZjZz8MIpTTe/aCr1ZjAd9Rz
	 F/EANqv4kyG3miW3i+m8+fMUyd3M9ReY5pNK87Pw9Eimz+nZc2JSDHKU2BD5YT9XLlVRd
	 e1ZDjNMJr3JthZKgkON8/fo9bKJvCQ3Etx28JRnqlszE8k62UiHkROxEH1gH3rwVKFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bBoWro9n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IOggg0tX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E434606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E434606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bBoWro9n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IOggg0tX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8NZbb2860295
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qaAVVIcohJr
	Di2KgEHY7jswg3SBGVepgZruK51y69KE=; b=bBoWro9nmxOoNl2pweQGBPEY0we
	DMGg8TmBvxpJP7lBvYDatfKHBHuWXM3T6tnWuUfpO/DYyIDkg5WoCUs9GpYNJdxE
	xm2u7WD9EcV3SBLbn4M/p744ECxMTne2tQkM3tYGHHI0kW5P9yqs65JxbyqrLZIx
	P92cQPii7n7i+jHGWefvXh1IE5UUZqx3lisPbnewG8umL7ozbKWVVcIgATeGKAk4
	tvwmS7TpfK7P4oWnmnAGVd0AuhMnKb96EihxJNe7BNjhiSJBubI+b9fajGI5MZ+q
	8TA2UptU8NtaEED7LOUAUWRgP5130pTNSmRscmZoCQGnds0D2ceg7PVitKw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g8ctb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb869327e7so5290820a12.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686974; x=1796291774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaAVVIcohJrDi2KgEHY7jswg3SBGVepgZruK51y69KE=;
        b=IOggg0tXhHOSsNGY+UGCDeXtMY1yI/JEY8W3vtrxDZxEBrqA4VjXAX5udp/4qO7uKw
         8FKsoZNec56R085H1IKK6ANu+ZNFzftDGpJzx1alTyc3IhR//4PS1/cOpjq40JCu0fp9
         HUFpA74vPIvaXok+djZk5T1jcVHd9hD6NLIlhmG3NSYwOSOxloVLDCZ/8YwXKWWJGEzf
         HwWPVIb/YSbohZAdxJvQ1QZ42y0BmMaZUTYiOpW83c28Y5BPSuk4p1yqbsZQoi9wo96/
         ZGYsYdQhSfhkEhFUiYeKedwbyxodh9i6W9s2UoV7uCOMaZ1hdHh7yi2d7v457XfTSwNp
         FTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686974; x=1796291774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qaAVVIcohJrDi2KgEHY7jswg3SBGVepgZruK51y69KE=;
        b=B8xgOTpvXxVWW0XTmhe9g6k2n5RLKzPSD620oLuPNtN6hvNLMpBWRSCMfe0ghCXDzH
         yUzRc4Iv/wlv+68ud3t0sRAT1oXcvBDo+KZrxdTVFXTZIeJeuKCm3zOf7eOmKGpkB00s
         QcWRJvAHvdg8N1WXk1X5+dfDj9s9pZxQbZ7+qlnc7zdVLqTUGV7aOol1F704fqMd/f1a
         RMn1H6VEN7rkdKQucvQv1cmetehOyCNR3UVc14GRPgzZLt+LdAjD79esVAYwQBr5QmwG
         umHLVWx0OnmDJykA0zTAKhXsuPzU0GW4YqTP4T8d0C7IzFeTtXJlQ/PO4yJplZ+Ho/S1
         AUXA==
X-Forwarded-Encrypted: i=1; AL+hErHVSNAeQD7MgqSr6QjrwrTfRTOlE1EmqRHY54KGPWhGQ3LvwdkvKcrAsqde7jI1CyEsk6EGPPl34zAJ@vger.kernel.org
X-Gm-Message-State: APuU4Z9DlpNkYspSLOAeO8U95VLbUIqNMPxDcoIgwI1R+dUsyZTtP84F
	eFrR1J8L10l5J4lGv5CE/PHBooXOaclUdMaBhKUqkw5GdbJyD5g5j8RTf71zrjbALEryiRyCZjy
	v/cx6Gyi9vpn0SiEm9R9pWy0TZ29s9OcCMfaLPCAeIIWod4AAODU7uRKLr9TzwD5n
X-Gm-Gg: AZFdTZf4EUoAiqJi9pepJ6N0b6SccW0YvT7wVGKki9xxsFIZy9fQyIfcxkDZBjnRib2
	N+RVymiwRcEnvCzP87f+fM5O/j7h/SFeUmjups2AHdX05xhwftdPZ/UQ8AWFL3vTJ7L6DzmWNA8
	UlxbckdsCL34opXZDk7/IOo9J0VXQrgP1zaatvBxePV9vutAWuuDgqxjZP2jnZHy0KLTpvziaTH
	mCl0P89+1U02xt8rOwoW2J0TjuR2PTa4DVofHIY0KJgqELIifX9+kXI1JiQZAzYmDeHAj2l79Pe
	zQ3e/2m9XF4dKieKiIFyCTL/0An97M8SKvpHWjACcMR0ow+NnW/eDSmoiM3Jv2UCuMZBf4tkSoE
	tqJiMfEfn+uMUYMdCrYSXIrxd2X6oEf1AeeNuf0dLMM9eGTo1D4gOKrfUIsqfa86nPP9Dpzq2lu
	r7rO7Wi18kVqAZmCtebHynCLHiohNbmbONrib+oOkXIOIk9EjqjuYKEZ3Le+aN1bjgMVFjrUqAy
	w==
X-Received: by 2002:a17:90b:2701:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3b41c8d9224mr19321305a91.10.1795686973803;
        Thu, 26 Nov 2026 01:56:13 -0800 (PST)
X-Received: by 2002:a17:90b:2701:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3b41c8d9224mr19321265a91.10.1795686973195;
        Thu, 26 Nov 2026 01:56:13 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:12 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 02/14] hwtracing: gtrace: Initial implementation of gtrace framework
Date: Thu, 26 Nov 2026 15:25:23 +0530
Message-ID: <50c430c6adecd57e4637c643ee3cf78309608d34.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ruEUbYg0bhNyku6helH7i5AlUmMFQpd0
X-Proofpoint-GUID: ruEUbYg0bhNyku6helH7i5AlUmMFQpd0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX5Cai76Pt5V0/
 9C1cbPawSplNYMooY0AonywIkSlUCmpF8DIlFJu8Z4deCxXH25taoPd1c5FdioZ28uvj0y3dkNO
 5hFRU2u9CRlmuUqzK0yMKIb2mS2cJiLHDeS5RYmS2P9lvT+rRo1euBHkA8kCKZ8KP1X989inkWU
 dgAlPqwN3Eq9LGg3CoJMRILU0kOqe0U04vslN3vccmh2nOFWFRwQfWIRKWwjrRSOgc6f3Z3M4Y0
 jS306NviGD0sod1neWA106sHEycu8oslZ40Zr7hnqFWd52jE8ivfayt0GKcfdIeLpBv4Qoj3zmt
 K9rzjldJvOCGUhqyvBIbwfdEGSThCMO00RcPHYVKZix3EzWqVuoXUSDhRm0vkYqngI+jHTmEJZp
 2/zGTe8tECdM6PFHRk7TYZJM+RrMpyNN/Zdu1TNcTJK+pmT16ta5dxU2JOVRaWvSOhQ3N5BnJUa
 UU/crvg8idODpYeXrwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX9NB/pUpJsZ/E
 64Yyu+GbZ23UPuOpYfh1RDyAOu0gIwvlt/Zr92LGy8ZedqT9FQ2lZXGejqPBVfkuPBDE+gVuuO7
 nbepABzTz3AAPOFugVQj/6BjO3Qy8k8=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b08023f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lv0vYI88AAAA:8 a=I1eV8P8gT3B3wm-nklIA:9 a=bFCP_H2QrGi7Okbo017w:22
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

From: Anup Patel <anup.patel@oss.qualcomm.com>

Implement a generic and architecture neutral trace framework (gtrace)
in which trace components are organized in a graph-like topology. The
framework provides a bus for the trace components along with helpers to
register components, build the topology and access the hardware registers.

Suggested-by: Zane Leung <liangzhen@linux.spacemit.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/Makefile                       |   1 +
 drivers/hwtracing/Kconfig              |   2 +
 drivers/hwtracing/gtrace/Kconfig       |  15 +
 drivers/hwtracing/gtrace/Makefile      |   4 +
 drivers/hwtracing/gtrace/gtrace-core.c | 524 +++++++++++++++++++++++++
 include/linux/gtrace.h                 | 313 +++++++++++++++
 6 files changed, 859 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/Kconfig
 create mode 100644 drivers/hwtracing/gtrace/Makefile
 create mode 100644 drivers/hwtracing/gtrace/gtrace-core.c
 create mode 100644 include/linux/gtrace.h

diff --git a/drivers/Makefile b/drivers/Makefile
index 0841ea851847..e018cc915f62 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -178,6 +178,7 @@ obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
+obj-$(CONFIG_GTRACE)		+= hwtracing/gtrace/
 obj-y				+= android/
 obj-$(CONFIG_NVMEM)		+= nvmem/
 obj-$(CONFIG_FPGA)		+= fpga/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..ef53f5c8429f 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/gtrace/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
new file mode 100644
index 000000000000..bcc3b4169a76
--- /dev/null
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menuconfig GTRACE
+	tristate "Generic Hardware Trace Support"
+	depends on OF
+	help
+	  This framework provides an architecture-neutral kernel interface
+	  for hardware trace drivers. It builds a topological view of the
+	  trace components and configures the correct series of components
+	  when trace is enabled. It is intended to be shared across RISC-V
+	  and ARM trace components so that a single trace path may span
+	  components of different architectures.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called gtrace.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
new file mode 100644
index 000000000000..3f90fb99c514
--- /dev/null
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_GTRACE) += gtrace.o
+gtrace-y := gtrace-core.o
diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
new file mode 100644
index 000000000000..57554d5eb98d
--- /dev/null
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -0,0 +1,524 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ *
+ */
+
+#include <linux/cpumask.h>
+#include <linux/export.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/percpu.h>
+#include <linux/xarray.h>
+#include <linux/gtrace.h>
+
+#define GTRACE_POLL_TIMEOUT_US_DEFAULT	10
+
+/* Mutex to serialize component registration/unregistration */
+static DEFINE_MUTEX(gtrace_mutex);
+
+/* Per-CPU source instances */
+static DEFINE_PER_CPU(struct gtrace_component *, gtrace_cpu_source_comp);
+
+/* gtrace comp specific data, to be used by core functions only */
+struct gtrace_comp_priv {
+	struct gtrace_component comp;
+	u32 type_idx;
+	bool ready;
+};
+
+#define to_gtrace_comp_priv(__comp)	\
+	container_of_const(__comp, struct gtrace_comp_priv, comp)
+
+/* Component type based id generator */
+struct gtrace_type_idx {
+	/* Lock to protect the type ID generator */
+	struct mutex lock;
+	struct xarray xa;
+};
+
+/* Array of component type based id generator */
+static struct gtrace_type_idx gtrace_type_idx_array[GTRACE_COMPONENT_TYPE_MAX];
+
+static int gtrace_alloc_type_idx(struct gtrace_component *comp)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	struct gtrace_type_idx *gidx;
+	u32 idx;
+	int ret;
+
+	if (comp->id.type >= GTRACE_COMPONENT_TYPE_MAX)
+		return -EINVAL;
+
+	gidx = &gtrace_type_idx_array[comp->id.type];
+	mutex_lock(&gidx->lock);
+	ret = xa_alloc(&gidx->xa, &idx, comp, xa_limit_32b, GFP_KERNEL);
+	mutex_unlock(&gidx->lock);
+	if (ret)
+		return ret;
+
+	cpriv->type_idx = idx;
+	return 0;
+}
+
+static void gtrace_free_type_idx(struct gtrace_component *comp)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	struct gtrace_type_idx *gidx;
+
+	if (comp->id.type >= GTRACE_COMPONENT_TYPE_MAX)
+		return;
+
+	gidx = &gtrace_type_idx_array[comp->id.type];
+	mutex_lock(&gidx->lock);
+	xa_erase(&gidx->xa, cpriv->type_idx);
+	mutex_unlock(&gidx->lock);
+}
+
+static void __init gtrace_init_type_idx(void)
+{
+	struct gtrace_type_idx *gidx;
+	int i;
+
+	for (i = 0; i < GTRACE_COMPONENT_TYPE_MAX; i++) {
+		gidx = &gtrace_type_idx_array[i];
+		mutex_init(&gidx->lock);
+		xa_init_flags(&gidx->xa, XA_FLAGS_ALLOC);
+	}
+}
+
+const struct gtrace_component_id *gtrace_match_id(struct gtrace_component *comp,
+						  const struct gtrace_component_id *ids)
+{
+	const struct gtrace_component_id *id;
+
+	if (!ids)
+		return NULL;
+
+	for (id = ids; id->type != GTRACE_COMPONENT_TYPE_NONE; id++) {
+		if (comp->id.type != id->type)
+			continue;
+
+		return id;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(gtrace_match_id);
+
+static int gtrace_match_device(struct device *dev, const struct device_driver *drv)
+{
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(drv);
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	return gtrace_match_id(comp, gtdrv->id_table) ? 1 : 0;
+}
+
+static int gtrace_probe(struct device *dev)
+{
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(dev->driver);
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	int ret = 0;
+
+	if (gtdrv->probe)
+		ret = gtdrv->probe(comp);
+
+	if (!ret)
+		cpriv->ready = true;
+
+	return ret;
+}
+
+static void gtrace_remove(struct device *dev)
+{
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(dev->driver);
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+
+	cpriv->ready = false;
+	if (gtdrv->remove)
+		gtdrv->remove(comp);
+}
+
+static const struct bus_type gtrace_bustype = {
+	.name	= "gtrace",
+	.match	= gtrace_match_device,
+	.probe	= gtrace_probe,
+	.remove	= gtrace_remove,
+};
+
+struct gtrace_fwnode_match_data {
+	struct fwnode_handle *fwnode;
+	struct gtrace_component *match;
+};
+
+static int gtrace_match_fwnode(struct device *dev, void *data)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_fwnode_match_data *d = data;
+
+	if (device_match_fwnode(&comp->dev, d->fwnode)) {
+		gtrace_get_component(comp);
+		d->match = comp;
+		return 1;
+	}
+
+	return 0;
+}
+
+struct gtrace_component *gtrace_find_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct gtrace_fwnode_match_data d = { .fwnode = fwnode, .match = NULL };
+	int ret;
+
+	mutex_lock(&gtrace_mutex);
+	ret = bus_for_each_dev(&gtrace_bustype, NULL, &d, gtrace_match_fwnode);
+	mutex_unlock(&gtrace_mutex);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return d.match;
+}
+EXPORT_SYMBOL_GPL(gtrace_find_by_fwnode);
+
+int gtrace_poll_bit(struct gtrace_platform_data *pdata, int offset,
+		    int bit, int bitval, int timeout)
+{
+	u32 val;
+
+	if (timeout <= 0)
+		timeout = GTRACE_POLL_TIMEOUT_US_DEFAULT;
+
+	return read_poll_timeout_atomic(gtrace_read32, val,
+					((val >> bit) & 0x1) == bitval,
+					1, timeout, false, pdata, offset);
+}
+EXPORT_SYMBOL_GPL(gtrace_poll_bit);
+
+int gtrace_enable_component(struct gtrace_component *comp)
+{
+	const struct gtrace_hw_ops *ops = comp->pdata->hw_ops;
+
+	if (!ops || !ops->enable)
+		return -EOPNOTSUPP;
+
+	return ops->enable(comp->pdata);
+}
+EXPORT_SYMBOL_GPL(gtrace_enable_component);
+
+int gtrace_disable_component(struct gtrace_component *comp)
+{
+	const struct gtrace_hw_ops *ops = comp->pdata->hw_ops;
+
+	if (!ops || !ops->disable)
+		return -EOPNOTSUPP;
+
+	return ops->disable(comp->pdata);
+}
+EXPORT_SYMBOL_GPL(gtrace_disable_component);
+
+int gtrace_reset_component(struct gtrace_component *comp)
+{
+	const struct gtrace_hw_ops *ops = comp->pdata->hw_ops;
+
+	if (!ops || !ops->reset)
+		return -EOPNOTSUPP;
+
+	return ops->reset(comp->pdata);
+}
+EXPORT_SYMBOL_GPL(gtrace_reset_component);
+
+struct gtrace_component *gtrace_cpu_source(unsigned int cpu)
+{
+	struct gtrace_component *comp;
+
+	if (!cpu_present(cpu))
+		return NULL;
+
+	mutex_lock(&gtrace_mutex);
+	comp = per_cpu(gtrace_cpu_source_comp, cpu);
+	if (comp)
+		gtrace_get_component(comp);
+	mutex_unlock(&gtrace_mutex);
+
+	return comp;
+}
+EXPORT_SYMBOL_GPL(gtrace_cpu_source);
+
+/* NULL target removes all input connections; otherwise remove only the chosen input connection. */
+static int gtrace_cleanup_inconns(struct gtrace_component *comp,
+				  struct gtrace_connection *target)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn;
+	int i;
+
+	lockdep_assert_held(&gtrace_mutex);
+
+	for (i = 0; i < pdata->nr_inconns; i++) {
+		conn = pdata->inconns[i];
+		if (!conn || (target && conn != target))
+			continue;
+		pdata->inconns[i] = NULL;
+		conn->dest_comp = NULL;
+		gtrace_put_component(comp);
+		if (target)
+			return 1;
+	}
+
+	return 0;
+}
+
+static int gtrace_cleanup_inconn(struct device *dev, void *data)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_connection *conn = data;
+
+	if (!device_match_fwnode(&comp->dev, conn->dest_fwnode))
+		return 0;
+
+	return gtrace_cleanup_inconns(comp, conn);
+}
+
+static void gtrace_cleanup_inconns_from_outconns(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn;
+	int i;
+
+	lockdep_assert_held(&gtrace_mutex);
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		conn->src_comp = NULL;
+		bus_for_each_dev(&gtrace_bustype, NULL, conn, gtrace_cleanup_inconn);
+	}
+}
+
+static int gtrace_setup_inconn(struct device *dev, void *data)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn = data;
+	int i;
+
+	if (device_match_fwnode(&comp->dev, conn->dest_fwnode)) {
+		for (i = 0; i < pdata->nr_inconns; i++) {
+			if (pdata->inconns[i])
+				continue;
+			pdata->inconns[i] = conn;
+			return 1;
+		}
+		return -ENOSPC;
+	}
+
+	return 0;
+}
+
+static int gtrace_setup_inconns_from_outconns(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn;
+	int i, ret;
+
+	lockdep_assert_held(&gtrace_mutex);
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		ret = bus_for_each_dev(&gtrace_bustype, NULL, conn, gtrace_setup_inconn);
+		if (ret < 0) {
+			gtrace_cleanup_inconns_from_outconns(comp);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * gtrace_release_outconns - Release references owned by output connections.
+ * @pdata: Platform data containing detached or unregistered connections.
+ *
+ * Use on probe failure before registration, or after detaching the topology
+ * during unregistration.
+ */
+void gtrace_release_outconns(struct gtrace_platform_data *pdata)
+{
+	struct gtrace_connection *conn;
+	int i;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (!conn)
+			continue;
+		if (conn->dest_comp) {
+			gtrace_put_component(conn->dest_comp);
+			conn->dest_comp = NULL;
+		}
+		fwnode_handle_put(conn->dest_fwnode);
+		conn->dest_fwnode = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(gtrace_release_outconns);
+
+static void gtrace_component_release(struct device *dev)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+
+	fwnode_handle_put(comp->dev.fwnode);
+	gtrace_free_type_idx(comp);
+	kfree(cpriv);
+}
+
+struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
+						   const char *name,
+						   struct gtrace_platform_data *pdata)
+{
+	struct gtrace_connection *conn;
+	struct gtrace_component *comp;
+	struct gtrace_comp_priv *cpriv;
+	bool is_source;
+	int bound_cpu, i, ret = 0;
+
+	if (!id || id->type <= GTRACE_COMPONENT_TYPE_NONE ||
+	    id->type >= GTRACE_COMPONENT_TYPE_MAX) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	if (!pdata || !pdata->dev) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	bound_cpu = pdata->bound_cpu;
+	is_source = gtrace_is_source(pdata);
+
+	for (i = 0; i < pdata->nr_inconns; i++) {
+		if (pdata->inconns[i]) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+	}
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (!conn || conn->src_port < 0 || conn->src_comp ||
+		    !device_match_fwnode(pdata->dev, conn->src_fwnode) ||
+		    conn->dest_port < 0 || !conn->dest_fwnode || !conn->dest_comp) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+	}
+
+	if (bound_cpu >= 0 && !cpu_present(bound_cpu)) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
+	if (!cpriv) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+	comp = &cpriv->comp;
+	comp->pdata = pdata;
+	comp->id = *id;
+	ret = gtrace_alloc_type_idx(comp);
+	if (ret) {
+		kfree(cpriv);
+		goto err_out;
+	}
+
+	comp->dev.parent = pdata->dev;
+	comp->dev.coherent_dma_mask = pdata->dev->coherent_dma_mask;
+	comp->dev.release = gtrace_component_release;
+	comp->dev.bus = &gtrace_bustype;
+	comp->dev.fwnode = fwnode_handle_get(dev_fwnode(pdata->dev));
+	dev_set_name(&comp->dev, "%s-%u", name ? name : "comp", cpriv->type_idx);
+
+	mutex_lock(&gtrace_mutex);
+
+	ret = device_register(&comp->dev);
+	if (ret) {
+		put_device(&comp->dev);
+		goto err_out_unlock;
+	}
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		conn->src_comp = comp;
+	}
+
+	ret = gtrace_setup_inconns_from_outconns(comp);
+	if (ret < 0) {
+		device_unregister(&comp->dev);
+		goto err_out_unlock;
+	}
+
+	if (bound_cpu >= 0 && is_source) {
+		gtrace_get_component(comp);
+		per_cpu(gtrace_cpu_source_comp, bound_cpu) = comp;
+	}
+
+	mutex_unlock(&gtrace_mutex);
+
+	return comp;
+
+err_out_unlock:
+	mutex_unlock(&gtrace_mutex);
+err_out:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(gtrace_register_component);
+
+void gtrace_unregister_component(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+
+	mutex_lock(&gtrace_mutex);
+
+	if (pdata->bound_cpu >= 0 &&
+	    per_cpu(gtrace_cpu_source_comp, pdata->bound_cpu) == comp) {
+		per_cpu(gtrace_cpu_source_comp, pdata->bound_cpu) = NULL;
+		gtrace_put_component(comp);
+	}
+
+	gtrace_cleanup_inconns(comp, NULL);
+	gtrace_cleanup_inconns_from_outconns(comp);
+	gtrace_release_outconns(pdata);
+	device_unregister(&comp->dev);
+
+	mutex_unlock(&gtrace_mutex);
+}
+EXPORT_SYMBOL_GPL(gtrace_unregister_component);
+
+int __gtrace_register_driver(struct module *owner, struct gtrace_driver *gtdrv)
+{
+	gtdrv->driver.owner = owner;
+	gtdrv->driver.bus = &gtrace_bustype;
+
+	return driver_register(&gtdrv->driver);
+}
+EXPORT_SYMBOL_GPL(__gtrace_register_driver);
+
+static int __init gtrace_init(void)
+{
+	gtrace_init_type_idx();
+
+	return bus_register(&gtrace_bustype);
+}
+
+static void __exit gtrace_exit(void)
+{
+	bus_unregister(&gtrace_bustype);
+}
+
+subsys_initcall(gtrace_init);
+module_exit(gtrace_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Generic hardware trace (gtrace) framework core");
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
new file mode 100644
index 000000000000..6d223e26875b
--- /dev/null
+++ b/include/linux/gtrace.h
@@ -0,0 +1,313 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#ifndef __LINUX_GTRACE_H__
+#define __LINUX_GTRACE_H__
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/limits.h>
+#include <linux/list.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/types.h>
+#include <linux/wordpart.h>
+
+/*
+ * Global list of trace component types across all architectures. Each backend
+ * uses the entries relevant to it.
+ */
+enum gtrace_component_type {
+	GTRACE_COMPONENT_TYPE_NONE, /* ID table terminator */
+	GTRACE_RVTRACE_ENCODER,
+	GTRACE_RVTRACE_FUNNEL,
+	GTRACE_RVTRACE_RAMSINK,
+	GTRACE_RVTRACE_PIBSINK,
+	GTRACE_RVTRACE_ATBBRIDGE,
+	GTRACE_COMPONENT_TYPE_MAX
+};
+
+/* Supported usage modes for trace components */
+enum gtrace_component_mode {
+	GTRACE_COMPONENT_MODE_PERF,
+	GTRACE_COMPONENT_MODE_MAX
+};
+
+/* Supported trace protocol formats */
+enum gtrace_format {
+	GTRACE_FORMAT_ETRACE,
+	GTRACE_FORMAT_NTRACE,
+};
+
+/**
+ * struct gtrace_connection - Physical connection between two trace components.
+ * @src_port:    A connection's source port number.
+ * @src_fwnode:  Source component's fwnode handle.
+ * @src_comp:    Source component's pointer.
+ * @dest_port:   A connection's destination port number.
+ * @dest_fwnode: Destination component's fwnode handle.
+ * @dest_comp:   Destination component's pointer.
+ */
+struct gtrace_connection {
+	int src_port;
+	struct fwnode_handle *src_fwnode;
+	int dest_port;
+	struct fwnode_handle *dest_fwnode;
+	struct gtrace_component *src_comp;
+	struct gtrace_component *dest_comp;
+};
+
+struct gtrace_platform_data;
+
+/**
+ * struct gtrace_hw_ops - Architecture-specific low level control of a component.
+ * @enable:  Enable the component's hardware block.
+ * @disable: Disable the component's hardware block.
+ * @reset:   Reset the component's hardware block.
+ *
+ * These operate on the component's platform data rather than a full
+ * gtrace_component so that they can be invoked before the component is
+ * registered with the gtrace core (e.g. to reset the hardware during probe).
+ *
+ * These abstract the register-level programming that differs between
+ * architectures (RISC-V Trace Control registers vs ARM CoreSight, etc.). The
+ * core never touches component registers directly; it invokes these ops.
+ */
+struct gtrace_hw_ops {
+	int (*enable)(struct gtrace_platform_data *pdata);
+	int (*disable)(struct gtrace_platform_data *pdata);
+	int (*reset)(struct gtrace_platform_data *pdata);
+};
+
+/**
+ * struct gtrace_platform_data - Platform-level data for a trace component
+ * discovered from DT or ACPI.
+ * @dev:         Parent device.
+ * @impid:       Opaque, architecture-specific implementation ID.
+ * @hw_ops:      Architecture-specific low level control ops.
+ * @io_mem:      Flag showing whether component registers are memory mapped.
+ * @base:        If io_mem == true then base address of the mapped registers.
+ * @read:        If io_mem == false then read register from the given offset.
+ * @write:       If io_mem == false then write register to the given offset.
+ * @bound_cpu:   CPU to which the component is bound, or -1 if unbound. For a
+ *               source component bound to a CPU this must not be -1.
+ * @control_poll_timeout_usecs: Delay in usecs when polling control bits.
+ * @format:      Trace format selected by the platform driver.
+ * @nr_inconns:  Number of input connections.
+ * @inconns:     Array of pointers to input connections.
+ * @nr_outconns: Number of output connections.
+ * @outconns:    Array of pointers to output connections.
+ */
+struct gtrace_platform_data {
+	struct device *dev;
+
+	u32 impid;
+
+	const struct gtrace_hw_ops *hw_ops;
+
+	bool io_mem;
+	union {
+		void __iomem *base;
+		struct {
+			u32 (*read)(struct gtrace_platform_data *pdata,
+				    u32 offset, bool relaxed);
+			void (*write)(struct gtrace_platform_data *pdata,
+				      u32 val, u32 offset, bool relaxed);
+		};
+	};
+
+	int bound_cpu;
+
+	/* Delay in microseconds when polling control register bits */
+	int control_poll_timeout_usecs;
+
+	enum gtrace_format format;
+
+	/*
+	 * Platform driver must only populate empty pointer array without
+	 * any actual input connections.
+	 */
+	unsigned int nr_inconns;
+	struct gtrace_connection **inconns;
+
+	/*
+	 * Platform driver must fully populate pointer array with individual
+	 * array elements pointing to actual output connections. The src_comp
+	 * of each output connection is automatically updated at the time of
+	 * registering component. If a component registration fails then the
+	 * platform must call gtrace_release_outconns() to release the dest_comp
+	 * and fwnode references.
+	 */
+	unsigned int nr_outconns;
+	struct gtrace_connection **outconns;
+};
+
+static inline u32 gtrace_read32(struct gtrace_platform_data *pdata, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		return readl(pdata->base + offset);
+
+	return pdata->read(pdata, offset, false);
+}
+
+static inline u32 gtrace_relaxed_read32(struct gtrace_platform_data *pdata, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		return readl_relaxed(pdata->base + offset);
+
+	return pdata->read(pdata, offset, true);
+}
+
+static inline void gtrace_write32(struct gtrace_platform_data *pdata, u32 val, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		writel(val, pdata->base + offset);
+	else
+		pdata->write(pdata, val, offset, false);
+}
+
+static inline void gtrace_relaxed_write32(struct gtrace_platform_data *pdata,
+					  u32 val, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		writel_relaxed(val, pdata->base + offset);
+	else
+		pdata->write(pdata, val, offset, true);
+}
+
+static inline u64 gtrace_read_pair(struct gtrace_platform_data *pdata,
+				   u32 low_off, u32 hi_off)
+{
+	u32 low, high;
+
+	low = gtrace_read32(pdata, low_off);
+	high = gtrace_read32(pdata, hi_off);
+
+	return (u64)high << 32 | low;
+}
+
+static inline u64 gtrace_relaxed_read_pair(struct gtrace_platform_data *pdata,
+					   u32 low_off, u32 hi_off)
+{
+	u32 low, high;
+
+	low = gtrace_relaxed_read32(pdata, low_off);
+	high = gtrace_relaxed_read32(pdata, hi_off);
+
+	return (u64)high << 32 | low;
+}
+
+static inline void gtrace_write_pair(struct gtrace_platform_data *pdata,
+				     u64 val, u32 low_off, u32 hi_off)
+{
+	gtrace_write32(pdata, lower_32_bits(val), low_off);
+	gtrace_write32(pdata, upper_32_bits(val), hi_off);
+}
+
+static inline void gtrace_relaxed_write_pair(struct gtrace_platform_data *pdata,
+					     u64 val, u32 low_off, u32 hi_off)
+{
+	gtrace_relaxed_write32(pdata, lower_32_bits(val), low_off);
+	gtrace_relaxed_write32(pdata, upper_32_bits(val), hi_off);
+}
+
+static inline bool gtrace_is_source(struct gtrace_platform_data *pdata)
+{
+	return !pdata->nr_inconns ? true : false;
+}
+
+static inline bool gtrace_is_sink(struct gtrace_platform_data *pdata)
+{
+	return !pdata->nr_outconns ? true : false;
+}
+
+/**
+ * struct gtrace_component_id - Details to identify or match a trace component.
+ * @type:    Component type from the global gtrace_component_type list.
+ * @version: Architecture-specific version (opaque to the core).
+ * @data:    Data pointer for driver use.
+ */
+struct gtrace_component_id {
+	enum gtrace_component_type type;
+	u32 version;
+	void *data;
+};
+
+/**
+ * struct gtrace_component - Representation of a trace component.
+ * @pdata:    Pointer to underlying platform data.
+ * @id:       Details to match the component.
+ * @dev:      Device instance.
+ */
+struct gtrace_component {
+	struct gtrace_platform_data *pdata;
+	struct gtrace_component_id id;
+	struct device dev;
+};
+
+#define to_gtrace_component(__dev)	container_of_const(__dev, struct gtrace_component, dev)
+
+static inline void gtrace_get_component(struct gtrace_component *comp)
+{
+	get_device(&comp->dev);
+}
+
+static inline void gtrace_put_component(struct gtrace_component *comp)
+{
+	put_device(&comp->dev);
+}
+
+const struct gtrace_component_id *gtrace_match_id(struct gtrace_component *comp,
+						  const struct gtrace_component_id *ids);
+struct gtrace_component *gtrace_find_by_fwnode(struct fwnode_handle *fwnode);
+
+int gtrace_poll_bit(struct gtrace_platform_data *pdata, int offset,
+		    int bit, int bitval, int timeout);
+int gtrace_enable_component(struct gtrace_component *comp);
+int gtrace_disable_component(struct gtrace_component *comp);
+int gtrace_reset_component(struct gtrace_component *comp);
+
+struct gtrace_component *gtrace_cpu_source(unsigned int cpu);
+
+struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
+						   const char *name,
+						   struct gtrace_platform_data *pdata);
+void gtrace_unregister_component(struct gtrace_component *comp);
+void gtrace_release_outconns(struct gtrace_platform_data *pdata);
+
+/**
+ * struct gtrace_driver - Representation of a trace driver.
+ * @id_table:      Table to match components handled by the driver, terminated
+ *                 by GTRACE_COMPONENT_TYPE_NONE.
+ * @probe:         Driver probe() function.
+ * @remove:        Driver remove() function.
+ * @get_trace_id:  Get/allocate a trace ID.
+ * @put_trace_id:  Put/free a trace ID.
+ * @driver:        Device driver instance.
+ */
+struct gtrace_driver {
+	const struct gtrace_component_id *id_table;
+	int			(*probe)(struct gtrace_component *comp);
+	void			(*remove)(struct gtrace_component *comp);
+	int			(*get_trace_id)(struct gtrace_component *comp,
+						enum gtrace_component_mode mode);
+	void			(*put_trace_id)(struct gtrace_component *comp,
+						enum gtrace_component_mode mode,
+						u32 trace_id);
+	struct device_driver	driver;
+};
+
+#define to_gtrace_driver(__drv)   \
+	((__drv) ? container_of_const((__drv), struct gtrace_driver, driver) : NULL)
+
+int __gtrace_register_driver(struct module *owner, struct gtrace_driver *gtdrv);
+#define gtrace_register_driver(driver) __gtrace_register_driver(THIS_MODULE, driver)
+static inline void gtrace_unregister_driver(struct gtrace_driver *gtdrv)
+{
+	if (gtdrv)
+		driver_unregister(&gtdrv->driver);
+}
+
+#endif /* __LINUX_GTRACE_H__ */
-- 
2.43.0

