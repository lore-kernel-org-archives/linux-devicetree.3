Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687059;
	b=E8cQ/0hg/ZbMAPieMZYic9XV02sIxvWpZgaJMZW72fiDfc/VDtSrCXs1TKUocXlbySBJ
	 cVgnMQh/3/rmGUKvY24rYH1YxGWklA3LJKDNkZcXK34EXVtPgU7WAsuGGY9Oxo2VrXziY
	 LOzhOE9YYRGn7UozLQ4lAZKgXuoo80KykFciW2LGu5Zh+fbjfbDRYQn4XDlGyWX+5qG6C
	 PSzayY+tMLWdLvPLHQMg38C6hf/pgcjaHm+hiiLCBzIdkjncDYV9LNAw+TsoleqLBdcQ0
	 ai26xqzZeyZc7JgdVw/vuqNGRdUW1dk1JBR/8gAd8ZZMhetDlfee/+QsORfYVI2Nkrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8z+kVMWhmg6y5Ud7btL82OoXtKHhPPjHjOGW3hGItws=;
	b=thA9u6bizpwY0KT5H4Og8DsfuR7848ZA8hc4YqkbMSIQQPxUN5DP9TzMOfD0zoiHNk1C
	 gUQqbFde5InOP+BGpV+vCXnRPc7D2M/z0XS6ddne8tibWnNollhu2IjrnpewI7+ETKCZP
	 nI8jBQr83cbni2e0H0TfbWazutWsh60ExqJYBDQEpcX46dnNRtqxju46Ngv8qxuzko+wi
	 DtJE+trJuNa3zxa47rlbI1AVquAcZpjSSgGxkgsoikbYUr7Yg2PV2TIfsBoP7Lcmf/FQ3
	 DA2LIINVnuPi5bwxt4RQ0DMEahJnYFdS7kqrkeTfeg9Q7PT2Kb70z05dMclp4xqTNmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lrzjKfBV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ET1mbzak;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C69606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C69606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lrzjKfBV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ET1mbzak
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3iU1682474
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8z+kVMWhmg6
	y5Ud7btL82OoXtKHhPPjHjOGW3hGItws=; b=lrzjKfBV+rzPaVe9bOznNaMGvMt
	kehXmuHqrxYNORenvJza7cSpm7D37uEc86I66gT8e534XVGlEC2fErKPTlOrh8Kn
	/USEJqUXLWFtsZZ/M9WG/Xzvr4enC3RGihA4cTEuWUKTfmpGu5VlrkZ3o1J8+h0a
	LouyycqWkaJvSMP4feL1YdghVRiF17o0Q5tal1pb+Dto0ZXv6UR8+kq0R+kmanxp
	TNCRPqJ/ahntrspHWaASK7GQIu5AZFHOjhp0eKuza3O7BF66Z660bJ6OZsrCiBBH
	dogJ2wMzOkm4KTTza/7DkljxMz6KDm+a+so7+ZnOsDsmXUgJEQsK6lictxg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekk00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ee2d612733so54811995ad.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687057; x=1796291857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8z+kVMWhmg6y5Ud7btL82OoXtKHhPPjHjOGW3hGItws=;
        b=ET1mbzakDc7VM6RVGcx+JJaGpbb6+kAC+v7MAIsMhbWUwI1r6jFR7ESS685eeP18Sf
         TB4rX6UuGX1ACUmyR2//MlUod5JJ+k7kZ7Je2pN2FAyiKgDuH3HhYCdrzsD22uTp8u3F
         sfbiuOGIbPDGEQc0n8qNCZWiPWd2mweIlHAd4uKm5tSoQgDuASru1JOVbhcISGyyN/53
         NXrBUH8w72Ocn4vT5yMNR8v77ZfgSQQYvt6De5QBLodPLkWvZ8zwmPPwl61lDWLU/krv
         SHtRjnKASEcdzBdFQs2WWn4G4ui1QbIgeTtGYzrh759zNHo3g8od/cqBM1KU9SP74aaA
         tkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687057; x=1796291857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8z+kVMWhmg6y5Ud7btL82OoXtKHhPPjHjOGW3hGItws=;
        b=Jmh6ysQixeS8Su43LlvFFM0PQ9JtUzkfY+u7cpXm5XgT7MXmYlUYzqbl1qYGmFJEkl
         l7dvrfClHJj5f3Y0iqLcoqLgEXAZ5GjcYFqyIZzc8fL1u1Wz0jYSluZIbacIaY7RbdBY
         ENPYnPqX2Tol4ZkDCzUmDaMjgrGRFUuwZ+RuDDjgRL/+kXtHdB2ExpJMpNI9frDCgCTN
         aNQgBPWFxvUXIgf6Kzz5EAfV1FvbASAaqIlqUgyQUdzeFzwV+tjPgRjP8d5pdTW21yKa
         nUmXlhpB1G98L0ixrMjHXnmVYiEwrMJL6TD669U253B0gIkRwqQdzmvfdOPcBm5KGmwf
         48VA==
X-Forwarded-Encrypted: i=1; AL+hErFKFbAyDO0TQFfbJwZv09qXGPSK/vFdPLpEThhiHZnk0TdLxFH+WJwP1jTOgzXzacGHzJGF+6jLL3M6@vger.kernel.org
X-Gm-Message-State: APuU4Z8gGJUvirWW4eJg0H4BfNzD3T8yW+GFqSSVR+j7XW1kqTL2JM6y
	gJaRPyevvdFQ+HQ+43O9s3jvjBfKzX0F0SKNlsakz7vyvmLKWWIzhngLM/n3/PdT/1Te74Onull
	YCB43SEMpqj3AWU0p1tiamcgYCv8RqfHaPMsJDRGpEPce/uWJCUAcmY6QkyS4c2V2
X-Gm-Gg: AZFdTZczw6YxDGnFNrA+yd+XkhnAQIqqpIBGe/Ep1XJ72kndy5CyXsRgHPmE9R6gtT1
	Mr3F2S3WYvKsv0byn0NeuMDs5VKLsY88GlB1Ag5t65bw52udvVdqaIi67IvIP1OBy9LwADilfid
	tQlzsrFDa9x3X6BxUDywSr5C4ZSigwIq30rpvo3dSkzJ0fiNyHfN2GQ+5KFA3U+Ku8nxOA5OnNQ
	JE+/LgEXa5Qk9jeAZOI+LgfyRtaI9bLM1UNreo1TwbVjGFZhpZMMVaHvqkdGULMeiuvuQ7qQlhc
	y2IhcUMpo9FiFN2gxVTQVUhMSdIXweT9dZRhTz0LTPJhmXlJC5DcnQIhZfqIoWNsLocmF7UarO5
	AOfW4IbFV/QHrfVGYhEhUK7Nfr1B/LAgeKcKHiZCjMd7JsLdOgzfOcPSN5tTmbzUDjBfoqxSjXu
	1OyKVcIlTvpOwNiq8B6gLy2rimtp7Q04/oGzBtOrzLmizrmKNibjPS1ACC4v1cUMF0of5qtc6JU
	w==
X-Received: by 2002:a17:90b:4d0a:b0:3b3:b562:899c with SMTP id 98e67ed59e1d1-3b41c8dc9f1mr12138053a91.9.1795687057077;
        Thu, 26 Nov 2026 01:57:37 -0800 (PST)
X-Received: by 2002:a17:90b:4d0a:b0:3b3:b562:899c with SMTP id 98e67ed59e1d1-3b41c8dc9f1mr12138044a91.9.1795687056596;
        Thu, 26 Nov 2026 01:57:36 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:36 -0800 (PST)
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
        Nutty Liu <nutty.liu@hotmail.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 12/14] perf tools: Add RISC-V trace PMU record capabilities
Date: Thu, 26 Nov 2026 15:25:33 +0530
Message-ID: <4755b47e4613daa764d2c50af1a1840afa2622b4.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX6W9FQUODRvSf
 X7UZo5vbbgmNzxdLbQ+rL6kIexvhT3r1Be/+T6G1m/HVsFbXRE0WfpGhhWzHwwbP5N57+iZrHTe
 2kmPlhYTwd5+UmMLnTPDxJiScSP4b8hLhdjDks2MMpy0TDSmOI2UsqBZHgcQwGOBj59YMaiw+Xb
 06ApnV3SE5tWhoIKLNkbttKseaA8LLbfw6FmCrmV6l9DiyPGj4QN9SXvxYEfsYP3qxuHXd3YFDd
 SgYkdvVXcdi+4jrXwhySI90k+HRjVoulGjUwyGqr0GfFzxqo3topnvpJAUKG7FQd8MXHFu0JXW6
 VzqBLtFrUfbmQ8RG3+c926A4cKh/kks3zZOBlsQvo3WwAjykU4DjsB9fv9iCB08yaxtdVoWLza+
 Bt2ksq4wMZBBgV4SDF6GeDaLZyDP3ly30cd/MMKVGk89NZIThcVPNKt90ajitr8jBAtxxVdxUp1
 iqrrQRwdTS5vf5yYNeQ==
X-Proofpoint-GUID: 158xrpOCy-WuGgG_AbmRCxLtKx6u8PmX
X-Proofpoint-ORIG-GUID: 158xrpOCy-WuGgG_AbmRCxLtKx6u8PmX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX+8ngJVXQNNJ8
 qvMZtG1qBhZbsJw2ms1NexcOgHblif/wd7m+L4nvbmoeVt2xBAJnytzNF73s0bAbbilqvPqslow
 dj9PLcXoYRoo9X0yxH5P0zUe4rZbCmM=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b080291 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=QyXUC8HyAAAA:8 a=61plweZImoeDEhIX1WwA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

Introduce the required auxiliary API functions allowing the perf core
to interact with gtrace perf driver. On RISC-V systems the gtrace
PMU uses the RISC-V E-Trace components and optionally an ATB Bridge
component for connecting to ARM-side sinks, if it is present on the SoC.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 tools/perf/arch/riscv/util/Build      |   1 +
 tools/perf/arch/riscv/util/auxtrace.c | 220 ++++++++++++++++++++++++++
 tools/perf/util/auxtrace.c            |   1 +
 tools/perf/util/auxtrace.h            |   1 +
 tools/perf/util/gtrace.h              |  16 ++
 5 files changed, 239 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/util/gtrace.h

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 2328fb9a30a3..e07d5525ece6 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1 +1,2 @@
 perf-util-y += header.o
+perf-util-y += auxtrace.o
diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/riscv/util/auxtrace.c
new file mode 100644
index 000000000000..6331161dff7b
--- /dev/null
+++ b/tools/perf/arch/riscv/util/auxtrace.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Risc-V E-Trace support
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/bitops.h>
+#include <linux/log2.h>
+#include <linux/zalloc.h>
+#include <errno.h>
+#include <limits.h>
+#include <stdlib.h>
+#include <time.h>
+
+#include <internal/lib.h>
+#include "../../../util/auxtrace.h"
+#include "../../../util/cpumap.h"
+#include "../../../util/debug.h"
+#include "../../../util/event.h"
+#include "../../../util/evlist.h"
+#include "../../../util/evsel.h"
+#include "../../../util/gtrace.h"
+#include "../../../util/parse-events.h"
+#include "../../../util/pmu.h"
+#include "../../../util/pmus.h"
+#include "../../../util/record.h"
+#include "../../../util/session.h"
+
+#define GTRACE_PMU_NAME	"gtrace"
+#define KiB(x)	((x) * 1024)
+#define MiB(x)	((x) * 1024 * 1024)
+
+struct rvtrace_recording {
+	struct auxtrace_record	itr;
+	struct perf_pmu *rvtrace_pmu;
+	struct evlist *evlist;
+};
+
+static size_t rvtrace_info_priv_size(struct auxtrace_record *itr __maybe_unused,
+				     struct evlist *evlist __maybe_unused)
+{
+	return GTRACE_AUXTRACE_PRIV_SIZE;
+}
+
+static int rvtrace_info_fill(struct auxtrace_record *itr,
+			     struct perf_session *session __maybe_unused,
+			     struct perf_record_auxtrace_info *auxtrace_info, size_t priv_size)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
+
+	if (priv_size != GTRACE_AUXTRACE_PRIV_SIZE)
+		return -EINVAL;
+
+	auxtrace_info->type = PERF_AUXTRACE_GTRACE;
+	auxtrace_info->priv[0] = rvtrace_pmu->type;
+
+	return 0;
+}
+
+static int rvtrace_set_auxtrace_mmap_page(struct record_opts *opts)
+{
+	bool privileged = perf_event_paranoid_check(-1);
+
+	if (!opts->full_auxtrace)
+		return 0;
+
+	if (opts->full_auxtrace && !opts->auxtrace_mmap_pages) {
+		if (privileged) {
+			opts->auxtrace_mmap_pages = MiB(16) / page_size;
+		} else {
+			opts->auxtrace_mmap_pages = KiB(128) / page_size;
+			if (opts->mmap_pages == UINT_MAX)
+				opts->mmap_pages = KiB(256) / page_size;
+		}
+	}
+
+	/* Validate auxtrace_mmap_pages */
+	if (opts->auxtrace_mmap_pages) {
+		size_t sz = opts->auxtrace_mmap_pages * (size_t)page_size;
+		size_t min_sz = KiB(8);
+
+		if (sz < min_sz || !is_power_of_2(sz)) {
+			pr_err("Invalid mmap size : must be at least %zuKiB and a power of 2\n",
+			       min_sz / 1024);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int rvtrace_recording_options(struct auxtrace_record *itr, struct evlist *evlist,
+				     struct record_opts *opts)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
+	struct evsel *evsel, *rvtrace_evsel = NULL;
+	struct evsel *tracking_evsel;
+	int err;
+
+	ptr->evlist = evlist;
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel->core.attr.type == rvtrace_pmu->type) {
+			if (rvtrace_evsel) {
+				pr_err("There may be only one " GTRACE_PMU_NAME " event\n");
+				return -EINVAL;
+			}
+			evsel->core.attr.freq = 0;
+			evsel->core.attr.sample_period = 1;
+			evsel->needs_auxtrace_mmap = true;
+			rvtrace_evsel = evsel;
+			opts->full_auxtrace = true;
+		}
+	}
+
+	err = rvtrace_set_auxtrace_mmap_page(opts);
+	if (err)
+		return err;
+	/*
+	 * To obtain the auxtrace buffer file descriptor, the auxtrace event
+	 * must come first.
+	 */
+	evlist__to_front(evlist, rvtrace_evsel);
+	evsel__set_sample_bit(rvtrace_evsel, TIME);
+
+	/* Add dummy event to keep tracking */
+	err = parse_event(evlist, "dummy:u");
+	if (err)
+		return err;
+
+	tracking_evsel = evlist__last(evlist);
+	evlist__set_tracking_event(evlist, tracking_evsel);
+
+	tracking_evsel->core.attr.freq = 0;
+	tracking_evsel->core.attr.sample_period = 1;
+	evsel__set_sample_bit(tracking_evsel, TIME);
+
+	return 0;
+}
+
+static u64 rvtrace_reference(struct auxtrace_record *itr __maybe_unused)
+{
+	return 0;
+}
+
+static void rvtrace_recording_free(struct auxtrace_record *itr)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+
+	free(ptr);
+}
+
+static struct auxtrace_record *rvtrace_recording_init(int *err, struct perf_pmu *rvtrace_pmu)
+{
+	struct rvtrace_recording *ptr;
+
+	if (!rvtrace_pmu) {
+		*err = -ENODEV;
+		return NULL;
+	}
+
+	ptr = zalloc(sizeof(*ptr));
+	if (!ptr) {
+		*err = -ENOMEM;
+		return NULL;
+	}
+
+	ptr->rvtrace_pmu = rvtrace_pmu;
+	ptr->itr.recording_options = rvtrace_recording_options;
+	ptr->itr.info_priv_size = rvtrace_info_priv_size;
+	ptr->itr.info_fill = rvtrace_info_fill;
+	ptr->itr.free = rvtrace_recording_free;
+	ptr->itr.reference = rvtrace_reference;
+	ptr->itr.read_finish = auxtrace_record__read_finish;
+	ptr->itr.alignment = 0;
+
+	*err = 0;
+	return &ptr->itr;
+}
+
+static struct perf_pmu *find_pmu_for_event(struct perf_pmu **pmus,
+					   int pmu_nr, struct evsel *evsel)
+{
+	int i;
+
+	if (!pmus)
+		return NULL;
+
+	for (i = 0; i < pmu_nr; i++) {
+		if (evsel->core.attr.type == pmus[i]->type)
+			return pmus[i];
+	}
+
+	return NULL;
+}
+
+struct auxtrace_record *auxtrace_record__init(struct evlist *evlist, int *err)
+{
+	struct perf_pmu	*rvtrace_pmu = NULL;
+	struct perf_pmu *found_pmu = NULL;
+	struct evsel *evsel;
+
+	if (!evlist)
+		return NULL;
+
+	rvtrace_pmu = perf_pmus__find(GTRACE_PMU_NAME);
+	evlist__for_each_entry(evlist, evsel) {
+		if (rvtrace_pmu && !found_pmu)
+			found_pmu = find_pmu_for_event(&rvtrace_pmu, 1, evsel);
+	}
+
+	if (found_pmu)
+		return rvtrace_recording_init(err, rvtrace_pmu);
+
+	*err = 0;
+	return NULL;
+}
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 8bb491d389a2..f77b674dd724 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -1432,6 +1432,7 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
 	case PERF_AUXTRACE_VPA_DTL:
 		err = powerpc_vpadtl_process_auxtrace_info(event, session);
 		break;
+	case PERF_AUXTRACE_GTRACE:
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index c29a8444f08e..b837cb8085de 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -46,6 +46,7 @@ enum auxtrace_type {
 	PERF_AUXTRACE_S390_CPUMSF,
 	PERF_AUXTRACE_HISI_PTT,
 	PERF_AUXTRACE_VPA_DTL,
+	PERF_AUXTRACE_GTRACE,
 };
 
 enum itrace_period_type {
diff --git a/tools/perf/util/gtrace.h b/tools/perf/util/gtrace.h
new file mode 100644
index 000000000000..63f7560fc15f
--- /dev/null
+++ b/tools/perf/util/gtrace.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#ifndef INCLUDE__UTIL_PERF_GTRACE_H__
+#define INCLUDE__UTIL_PERF_GTRACE_H__
+
+#include <linux/types.h>
+#include "util/event.h"
+
+struct perf_session;
+
+#define GTRACE_AUXTRACE_PRIV_SIZE      sizeof(u64)
+
+#endif
-- 
2.43.0

