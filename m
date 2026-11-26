Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687034;
	b=2IN8rnjXHxodCKnTXQXSSUHfBVNyuWMkcW4zI5ylP0CdhzOMRQR5oA9p4bLhlYA99oNg
	 c+YkKhlg1oSZkFTprFqKlTjionVDorN5RIwBaS6UFVpn0euPGDorI3pdkaEgvADEg1RNX
	 RHjOvTW6FWDcO6PzmQySDtCIjdtn77yz5cLAbfmGS2kHZY9K6qpEe3Se9n7F/kx7TzhU+
	 PSBsHRWlhak90qj3Z49rM1ND8Mw5TGvZMCtGBbHLcfeh7u/Ok3Ewxrwt7jV4vyfTkCioi
	 2GmGU8g27GeYxxWm4opw5ZyvwFvtSjxoOpXP9zrIpQRPZl7zZ3ehccI+O3xtquONh/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yx2yUdKHe8eSskqByOkClzqHbWA8HEP3yj5O8Bu4IcE=;
	b=cgdEs95FCPIzHpAFfwbajn7AzsPxz/Cu+IphXebRxmT4G+HoLmODYJRsTx47nUHpgzB6
	 g+rd6/cV77EnW5hHvtAQ8SYHm32nyzqnLvpjI8DlHSQEij2GjVALVv7TAy+3xBhoKfpMH
	 pOF0mU0jt7Gyxn/qfV1fSQoip1fYfj6UYIsyGijB0Qs5kQY6kCf6bvdzdrpwzCwzbfNRB
	 ed+no+xQvqLEpCF71N1JIKsOxrQ2xc9g68hSnv53/d7/aNC/hhJ1nzTwNHkqxmYs9XmB8
	 +VgbsIU9Hm9hsyulQ2L+98wvbpFMyJ1NO3e2VUC71n47SLlOxiw5Pjtk0j2gO2cxUfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHFIvge3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BvEiCrDR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E90606A331
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E90606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHFIvge3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BvEiCrDR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B72Y919505
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yx2yUdKHe8e
	SskqByOkClzqHbWA8HEP3yj5O8Bu4IcE=; b=hHFIvge3I3nFaE/FHCIErTdClij
	nE8KqW+fMg1GJc9QzfMvXDqb9qs3CuqZpXvozX/5b90cOdG9tosrd0+Rs7LQ/xS8
	OEPNmQwirAUhJ6KKceiULeY/ZST2oVHwrulzoT2EcGFj70sAelEr9eyThZhVNcF4
	NzR4DiqiCMv/7fS7A+aD/i3uoMDTZiasUe4REJjGtUtqwzA4PoEjwZHY8KA5c1FZ
	HU/NPm/La/YuW1iuEiymOuhf4jqo3HpZ1XbGLsU0e4NfWfMZUVTFHZSHqonSId2f
	J6U4w/oeqJ1/vGnXPus5c53cnEm4s3geaz/bMmCq4k+4MF2qnP1HEEUpKXw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2hmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b40b011aa4so8185368a91.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687032; x=1796291832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx2yUdKHe8eSskqByOkClzqHbWA8HEP3yj5O8Bu4IcE=;
        b=BvEiCrDR0Q6bRhXkcWDWTjFv+Ur6w5/M+R2xXMsCLH/3z10hAko/xnm5d7UCYiwzsB
         UUP1oLCiJRwGAaIQmuPtT0rwoTy16nGPIlvD5mgvJKV4hDHZVSlf2U58y9PaGcTAHj9w
         uTTOtf/lTkdWH5OTbc2B7hTqK3Sjzv8cwXDkjlndvos2bdzBdAqDQamN49oGn44JAjG+
         7y5KHtX0qUFLMdifRRoFe1TEYVLKJDoJTlNj+8B5tScbkJiIy/n5fbWCqJ1po3SRfcPi
         8BOdVUByiUK1cR6WjuLtjs3mgZ1aw77ZT0lxwciRwQ/GKYIg6pgkFnz4RofUsdZ44zEN
         /MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687032; x=1796291832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx2yUdKHe8eSskqByOkClzqHbWA8HEP3yj5O8Bu4IcE=;
        b=pAKrrHko6KB+iD0QS4JZyUOhsBi7h7skJ+J4/VtHwqgfz/ccjQGvAKuVCkChL+W2Rd
         iYCkMm/7B+WqENtpwKy3SFtSbb66myE9EH4CsP9WwcQbpWJzKkWsH7dZf0TUwZDkOE8/
         DrY+qfsf2M1HvmKMBwNQivjZS/Gq5z28N5YL1MGgflza8+QjqBIhoxYMKt8BB2p8SJDB
         2wOBdG3L2t5m9ptPckvs9CKgd9f3UDYDegrCl4HWQ6NJtHzNBv/xLUC7iwcx74dLLu34
         q39Gyq0+sk94SN2KHDLODz8t7pdhvAnsL1WK5Q96mAM1zflSJkEB3R7ak6TwO7YOFew/
         LpSQ==
X-Forwarded-Encrypted: i=1; AL+hErG+L6meLI6RaNhFpiSI7CGxhyKwrKaWQeAUMsnffLziUrPupUQ5VK7LagkTldCQ1+WF2DDm9iHWRFDP@vger.kernel.org
X-Gm-Message-State: APuU4Z8Pckxa0VNKBM6DyYp4X9aTMpQySoTjqMqFamcXmD6B5Yaxm1mq
	GagcFF/pVwpH+Jybs9au8zaTupZWQV6rey8mrMUJUDjVxYCJzcj35Ap706nKzxNF/45K8Yraxp6
	HTtIyoETRANCG+I7pE3LD3sHcg4Fv43xyQXepRVPaiyR+4e2m2U9MPKdZ8YdFeRB5
X-Gm-Gg: AZFdTZeaidH+n8cZr4ss99VtPD/tXQnlFqjEo2GJhOtZS3u1YyY+5dKsu0e1UgLaOe9
	RJzNieTAsRioE90VXRNqWTEh9MsWO74wNnn4Peu1fvmlrTDDWSuJiREcIc6K5nRXK+ldMNlfa15
	PLdhqfxwiwvSYfI0dY0i56mpgPwz43FG/S91bjfDKxp4tpgLzpfDic5A6JbdISTf9qf8/jbX8kH
	UYH6oDWzY0rhfgPpCDi7Z8VdQnk44M+u7AcgeTJtR1LHg0WHqSCTtN+v8m0H69QgMJkELPunLXg
	b/eksUvlvsQQv2qVmy/hE90vNAaCsYJ2xGtHiDqH4me1aCsaR7CWYLxhD5XPVI1wcSBV5MZVu8N
	Vfoo6r2LWj+JHc0dVuDsoN5mHn867XyKG5pfMJookidrMb5KoHBcbK4C6LJPbfxEI0VTln7kwzC
	rkTtIMlFpqhRgfxpXaZr0r2KC/uTi7/Z5T1tmfM4I8IW6LRuN44y2iEWTV6kEhsP/d4W52+aRu5
	g==
X-Received: by 2002:a17:90b:52:b0:3b4:f457:9e5d with SMTP id 98e67ed59e1d1-3b4f457a24amr5611031a91.9.1795687032212;
        Thu, 26 Nov 2026 01:57:12 -0800 (PST)
X-Received: by 2002:a17:90b:52:b0:3b4:f457:9e5d with SMTP id 98e67ed59e1d1-3b4f457a24amr5610986a91.9.1795687031688;
        Thu, 26 Nov 2026 01:57:11 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:11 -0800 (PST)
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
Subject: [PATCH v7 09/14] gtrace: Add RISC-V Trace ramsink driver
Date: Thu, 26 Nov 2026 15:25:30 +0530
Message-ID: <4ea1823645f6841ddb551eb9a7bb81bd0879e57f.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX7tDEiwcUm+zW
 EY/5SpXIDjpOkmPd2OFMREHI1rAH9eJ0fp8qt9BbscZV0WHBVOi1/n6HtxNDIVmQm0uEMsbeMnP
 YGE224etylBEnhufECcbQvTAEy63XYUPpo+Ftrmqf+SMHF4Hfw/SgYhA8IAdofmrq8pK3DTGrzp
 Hqz+iNU3SNZjsoNIwObEcuC0ucmUrZmY931vgpdUd3cc9qnbipF9XJMu8+Plxgs2whZU6fmqttV
 qYckKb1LStRTdMhkgKPwfLW6J2SjCBfA7Y0aOHpEvNsb7C7E6QIvT2j2nIsZLrCG7S2su/w1p7M
 1VV71xFXJ5jBWlsvaWJNEzQmQEzya1GPVhkVUtnS4CN9vXnYM6G1kO48bP46ys235co4j5XuscN
 xBv9XfoTzA0hP6TYYourc95buBh9OIVxzDF4pfErCgb6v8i4iPAbM3pKcSmO1o0k0HeyFmWS4EQ
 U7BN6U38PdvRLhUKzwg==
X-Proofpoint-GUID: FNbJ2EuPjiiiJTNcPDO7TJBfpnW6RZIV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXxapNxhEM/ysi
 Cwo8Tsh5s8qiJCnlx3bXpAnFtvIYgDdMjNCFGEJbet3vEEavwUE+dTmjCNBaIZMHKOdFpeIhaDn
 iS/5v9JCzm36ZebEosL8VHh0IlioYC4=
X-Proofpoint-ORIG-GUID: FNbJ2EuPjiiiJTNcPDO7TJBfpnW6RZIV
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b080279 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=TIGyrV9T7BjKynz-N6kA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

Add initial implementation of RISC-V E-Trace ramsink driver. The ramsink
is defined in the RISC-V Trace Control Interface specification.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig           |  15 +
 drivers/hwtracing/gtrace/Makefile          |   1 +
 drivers/hwtracing/gtrace/rvtrace-ramsink.c | 366 +++++++++++++++++++++
 3 files changed, 382 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index e3a621b59913..de4a3b533591 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -41,3 +41,18 @@ config RVTRACE_ENCODER
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-encoder.
+
+config RVTRACE_RAMSINK
+	tristate "RISC-V Trace Ramsink driver"
+	depends on RVTRACE
+	select DMA_SHARED_BUFFER
+	default y
+	help
+	  This driver provides support for the RISC-V trace ramsink component
+	  which is defined by the RISC-V Trace Control Interface specification.
+	  The ramsink is a trace sink which stores the trace data generated by
+	  the upstream components into a system memory buffer. The buffer is
+	  then copied to the perf AUX buffer when tracing using the perf tool.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-ramsink.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 2660fcaa332b..31262cf5993d 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -6,3 +6,4 @@ gtrace-$(CONFIG_OF) += gtrace-of.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
+obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
new file mode 100644
index 000000000000..24697e6096ec
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -0,0 +1,366 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/dma-mapping.h>
+#include <linux/gtrace.h>
+#include <linux/minmax.h>
+#include <linux/types.h>
+#include <linux/sizes.h>
+#include <uapi/linux/perf_event.h>
+#include "rvtrace.h"
+
+#define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
+#define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
+#define RVTRACE_RAMSINK_LIMITLOW_OFF		0x018
+#define RVTRACE_RAMSINK_LIMITHIGH_OFF		0x01c
+#define RVTRACE_RAMSINK_WPLOW_OFF		0x020
+#define RVTRACE_RAMSINK_WPHIGH_OFF		0x024
+#define RVTRACE_RAMSINK_WPLOW_WRAP		0x1
+#define RVTRACE_RAMSINK_CTRL_MODE_MASK		0x1
+#define RVTRACE_RAMSINK_CTRL_MODE_SHIFT		0x4
+#define RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT	0x8
+#define RVTRACE_RAMSINK_CTRL_MEMFMT_MASK	0x3
+#define RVTRACE_RAMSINK_CTRL_MEMFMT_SHIFT	0x9
+#define RVTRACE_RAMSINK_CTRL_ASYNCFREQ_MASK	0x7
+#define RVTRACE_RAMSINK_CTRL_ASYNCFREQ_SHIFT	0xc
+#define RVTRACE_RAMSINK_MEM_ACC_WIDTH_MIN	4
+#define RVTRACE_RAMSINK_SIZE_MIN		PAGE_SIZE
+
+enum rvtrace_ramsink_mode {
+	MODE_SRAM,
+	MODE_SMEM
+};
+
+struct rvtrace_ramsink_priv {
+	size_t size;
+	void *va;
+	dma_addr_t start;
+	dma_addr_t end;
+	/* alloc_* store the DMA allocation returned by the kernel and are used later for free */
+	size_t alloc_size;
+	void *alloc_va;
+	dma_addr_t alloc_start;
+	enum rvtrace_ramsink_mode mode;
+	bool stop_on_wrap;
+	u32 async_freq;
+	int mem_acc_width;
+	u64 prev_wp;
+};
+
+struct trace_buf {
+	void *base;
+	size_t cur;
+	size_t len;
+};
+
+static int rvtrace_ramsink_start(struct gtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	u32 trram_ctrl;
+	int ret;
+
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	trram_ctrl &= ~BIT(RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT);
+	trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
+	trram_ctrl &= ~(RVTRACE_RAMSINK_CTRL_MEMFMT_MASK << RVTRACE_RAMSINK_CTRL_MEMFMT_SHIFT);
+	trram_ctrl &= ~(RVTRACE_RAMSINK_CTRL_ASYNCFREQ_MASK <<
+			RVTRACE_RAMSINK_CTRL_ASYNCFREQ_SHIFT);
+	trram_ctrl |= priv->async_freq << RVTRACE_RAMSINK_CTRL_ASYNCFREQ_SHIFT;
+	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	if ((trram_ctrl >> RVTRACE_RAMSINK_CTRL_MEMFMT_SHIFT) & RVTRACE_RAMSINK_CTRL_MEMFMT_MASK) {
+		dev_err(&comp->dev, "only plain memory format is supported\n");
+		return -EINVAL;
+	}
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to start ramsink.\n");
+
+	return ret;
+}
+
+static int rvtrace_ramsink_stop(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop ramsink.\n");
+		return ret;
+	}
+
+	return rvtrace_comp_poll_empty(comp);
+}
+
+static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size_t size)
+{
+	size_t bytes_dst, bytes_src, bytes;
+	void *dst_addr, *src_addr;
+
+	while (size) {
+		src_addr = src->base + src->cur;
+		dst_addr = dst->base + dst->cur;
+
+		/* Ensure that there are no OOB memory accesses */
+		if (dst->len - dst->cur < size)
+			bytes_dst = dst->len - dst->cur;
+		else
+			bytes_dst = size;
+
+		if (src->len - src->cur < size)
+			bytes_src = src->len - src->cur;
+		else
+			bytes_src = size;
+		bytes = min(bytes_dst, bytes_src);
+		memcpy(dst_addr, src_addr, bytes);
+		dst->cur = (dst->cur + bytes) % dst->len;
+		src->cur = (src->cur + bytes) % src->len;
+		size -= bytes;
+	}
+}
+
+static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+					    struct gtrace_perf_auxbuf *buf,
+					    size_t size,
+					    u64 *aux_flags)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	struct trace_buf src, dst;
+	size_t bytes = 0;
+	bool wrap;
+	u64 wp;
+
+	dst.base = buf->base;
+	dst.len = buf->length;
+	dst.cur = buf->pos;
+	src.base = priv->va;
+	src.len = priv->size;
+	*aux_flags = 0;
+	wp = gtrace_read_pair(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF,
+			      RVTRACE_RAMSINK_WPHIGH_OFF);
+	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
+	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
+
+	if (wp < priv->start || wp >= priv->end ||
+	    (!wrap && wp < priv->prev_wp))
+		return 0;
+
+	if (wrap) {
+		gtrace_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF,
+				  RVTRACE_RAMSINK_WPHIGH_OFF);
+		src.cur = wp - priv->start;
+		priv->prev_wp = priv->start;
+		/*
+		 * There is no way to tell if trRamWp wrapped around more than once. As a
+		 * result priv->prev_wp can't be used and the entire buffer must be copied
+		 * even though some data might be duplicated.
+		 */
+		bytes = priv->size;
+	} else {
+		src.cur =  priv->prev_wp - priv->start;
+		bytes = wp - priv->prev_wp;
+		priv->prev_wp = wp;
+	}
+
+	/* Keep the latest trace when the destination aux buffer cant hold all the data */
+	if (bytes > size) {
+		src.cur = (src.cur + bytes - size) % src.len;
+		bytes = size;
+		*aux_flags |= PERF_AUX_FLAG_TRUNCATED;
+	}
+
+	tbuf_to_pbuf_copy(&src, &dst, bytes);
+	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
+	return bytes;
+}
+
+static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
+				     struct rvtrace_ramsink_priv *priv)
+{
+	struct device *pdev = comp->pdata->dev;
+	u64 limit_max, end;
+	int ret;
+
+	/* Probe max value for limit register */
+	gtrace_write_pair(comp->pdata, U64_MAX, RVTRACE_RAMSINK_LIMITLOW_OFF,
+			  RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	limit_max = gtrace_read_pair(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF,
+				     RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	if (!limit_max) {
+		dev_err(&comp->dev, "trRamLimit register not implemented\n");
+		return -EINVAL;
+	}
+
+	/* Set DMA mask based on the maximum allowed limit address */
+	ret = dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_max)));
+	if (ret)
+		return ret;
+
+	priv->alloc_size = priv->size;
+	priv->alloc_va = dma_alloc_coherent(pdev, priv->alloc_size, &priv->alloc_start,
+					    GFP_KERNEL);
+	if (!priv->alloc_va)
+		return -ENOMEM;
+
+	/*
+	 * Check if DMA start and end addresses allocated by the kernel can be set in the ramsink
+	 * start, limit registers respectively.
+	 */
+	gtrace_write_pair(comp->pdata, priv->alloc_start, RVTRACE_RAMSINK_STARTLOW_OFF,
+			  RVTRACE_RAMSINK_STARTHIGH_OFF);
+	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
+	end = priv->alloc_start + priv->alloc_size - priv->mem_acc_width;
+	gtrace_write_pair(comp->pdata, end, RVTRACE_RAMSINK_LIMITLOW_OFF,
+			  RVTRACE_RAMSINK_LIMITHIGH_OFF);
+
+	priv->start = gtrace_read_pair(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF,
+				       RVTRACE_RAMSINK_STARTHIGH_OFF);
+	priv->end = gtrace_read_pair(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF,
+				     RVTRACE_RAMSINK_LIMITHIGH_OFF) +
+		    priv->mem_acc_width;
+
+	/* Sanity check start, end addresses */
+	if (priv->start < priv->alloc_start ||
+	    priv->end > priv->alloc_start + priv->alloc_size ||
+	    priv->end <= priv->start ||
+	    priv->end - priv->start < RVTRACE_RAMSINK_SIZE_MIN) {
+		dev_err(&comp->dev, "invalid ramsink configuration detected.\n");
+		ret = -EINVAL;
+		goto err_free;
+	}
+
+	if (priv->start != priv->alloc_start ||
+	    priv->end != priv->alloc_start + priv->alloc_size)
+		dev_warn(&comp->dev, "ramsink start, end updated to %pad and %pad\n",
+			 &priv->start, &priv->end);
+
+	priv->va = priv->alloc_va + (priv->start - priv->alloc_start);
+	priv->size = priv->end - priv->start;
+	priv->prev_wp = priv->start;
+	gtrace_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF,
+			  RVTRACE_RAMSINK_WPHIGH_OFF);
+
+	return 0;
+
+err_free:
+	dma_free_coherent(pdev, priv->alloc_size, priv->alloc_va, priv->alloc_start);
+	return ret;
+}
+
+static int rvtrace_ramsink_setup(struct gtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv;
+	u32 trram_ctrl;
+	int ret;
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Derive RAM sink memory size based on component implementation ID */
+	switch (comp->pdata->impid) {
+	default:
+		priv->size = SZ_1M;
+		priv->mode = MODE_SMEM;
+		priv->stop_on_wrap = false;
+		priv->async_freq = 2;
+		priv->mem_acc_width = RVTRACE_RAMSINK_MEM_ACC_WIDTH_MIN;
+		break;
+	}
+
+	if (priv->mode != MODE_SMEM) {
+		dev_err(&comp->dev, "only smem mode is supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	trram_ctrl &= ~BIT(RVTRACE_RAMSINK_CTRL_MODE_SHIFT);
+	trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
+	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	if (((trram_ctrl >> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) &
+	     RVTRACE_RAMSINK_CTRL_MODE_MASK) != priv->mode) {
+		dev_err(&comp->dev, "smem mode is not supported\n");
+		return -EINVAL;
+	}
+
+	ret = rvtrace_ramsink_setup_buf(comp, priv);
+	if (!ret)
+		dev_set_drvdata(&comp->dev, priv);
+
+	return ret;
+}
+
+static void rvtrace_ramsink_cleanup(struct gtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+
+	dma_free_coherent(comp->pdata->dev, priv->alloc_size, priv->alloc_va, priv->alloc_start);
+}
+
+static int rvtrace_ramsink_probe(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_ramsink_setup(comp);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+
+	return ret;
+}
+
+static void rvtrace_ramsink_remove(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_ramsink_stop(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop ramsink, can't free DMA buffer: %d\n", ret);
+		return;
+	}
+
+	rvtrace_ramsink_cleanup(comp);
+}
+
+static const struct gtrace_component_id rvtrace_ramsink_ids[] = {
+	{ .type = GTRACE_RVTRACE_RAMSINK,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_ramsink_driver = {
+	.id_table = rvtrace_ramsink_ids,
+	.copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf,
+	.stop = rvtrace_ramsink_stop,
+	.start = rvtrace_ramsink_start,
+	.probe = rvtrace_ramsink_probe,
+	.remove = rvtrace_ramsink_remove,
+	.driver = {
+		.name = "rvtrace-ramsink",
+	},
+};
+
+static int __init rvtrace_ramsink_init(void)
+{
+	return gtrace_register_driver(&rvtrace_ramsink_driver);
+}
+
+static void __exit rvtrace_ramsink_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_ramsink_driver);
+}
+
+module_init(rvtrace_ramsink_init);
+module_exit(rvtrace_ramsink_exit);
+
+/* Module information */
+MODULE_AUTHOR("Mayuresh Chitale");
+MODULE_DESCRIPTION("RISC-V E-Trace Ramsink Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

