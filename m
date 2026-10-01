Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA43F54AE
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832312; cv=none; b=L1JBj8m4axupHmLfKGAiv5ouMo74xllan23PjLvyCLrC4T1xhy8wCI2BOj4vwx1RIj/clW91g7+K+jx0wmGR+8wKgjCQ0Ns7v8YqOeoHFymocv8eacAIh2YuTBfZ9Ws3PlQZ7vgc/U4KOxofZYWJBuC2udO6o7h9x37sGLkVpmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832312; c=relaxed/simple;
	bh=PVWad/GV3G6umJRiTjt5kMnvmgIT8T7ZwHD2xo81yjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EN+PgQf3Yh7poXy/lAp8sbh8C+VT5pFYke2Sc0fw/H0tOW9gjh0l6cOOR8h5gJSKhmVo4hkbDKTdy8j0zbHqo0WVSmqYcHWeyM298g/Hz2RfmVn7oZ96W/deoEFjsbT0PhI4kqZN7x528yHB+nfqI8VdP4urV097oxC+iJy2Rs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WAlX5eIH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EELgjv8T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WAlX5eIH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EELgjv8T"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6915GOPl1953994
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 05:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7YB32//p3Rb
	6ZZhkIM1gj9mqbzqbA+d2U4F99K6T7xY=; b=WAlX5eIHvmri2GqG1yrmW3xQ0S3
	AIFn/D4W0gzoA8Ohw7aukh9YFfU0+8BuYaEdnOA9jsFVGj0M19VzQYuX3xMBuCVW
	cLDkBy829qvwNN/IETSfev7dMT+LrItUE66qq4XMGxFyp8plXQlf82gTkL5og2zE
	1A3UfdgdHuzbAisTYNN2sPNIn40y8a4J5a0snDXHcA1eK3fQ/r84YQKuPiWA6dzb
	+4OU1lOut7ESuSc3HMUtuc6P9QV++OHV+oMngrgBI0pypVFS3W+znNB85T9EsyVl
	KxljRlrD0IagB8qvV1I0+L8WqU7M73NssCKata1cA8ONHrzVrk3eNzwfjrw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nr1gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:25:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2d83bb68cso15751635ad.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 22:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832308; x=1791437108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YB32//p3Rb6ZZhkIM1gj9mqbzqbA+d2U4F99K6T7xY=;
        b=EELgjv8T40I7m7kiXKxAqqmV2mnCIob69lHD7q7q24U51qQY7nUKuhgME/UXi4KiRL
         aZAtUTChbhDiBm8F6tzoWbInxdgkiMpOHocfnHgy4A+Gr6wuLkFcEFAf7WX37jeJG1ym
         +82KF6zAjIbt+JgJiINdszyD77iJIFyw7zQDPe41QT27ibfvio5cxUgac8xWZ46gKO5/
         Ve1pYeA/0sWCBnBhUoKERxO7MmCmbBUO3wglNWAiytT4k9NZxmgpTVm8hj4ku2BT2yZl
         kp/aiE+fMN/cDxWnJ8eoTN+0oW/I4tZibgm2yTmUM5Ip3MWG4X/bxsdPSATiJ4VS8qT4
         7uMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832308; x=1791437108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7YB32//p3Rb6ZZhkIM1gj9mqbzqbA+d2U4F99K6T7xY=;
        b=SdvhB3mCQqHowFfNTuLmlXFfv35ywRwdveYZ8dfjTH+N9Ydosideb1jMvzdiIk1ucs
         rw0hBIewnpNSoMeY+Cqd3ZevfrRBelK5Ew19ypQu0QWQj87enIO3Qiqc0vm//6HxXqIY
         jCIQGkVBI+kA/PoEyxrpbd4xFahDMFFiHMD96+UrNThrmqK4HwzZi2zQvrcHBp5hnrbo
         Da6dmlljALE57KoxRd4y4FLQ/+lONpwnfJypwL2LGDNdoHUlW+VUVZODbQYHcQARdaWC
         w+RC3VIeLIQhazbp5NgPXz2XOyhOx88q+rauz6QunCFoJ5cha7UJGFlyc1cCykVvobMx
         nRrg==
X-Forwarded-Encrypted: i=1; AKwUvByg/eeZAiMWnQK7pDdtMkXtX8wwQcEJTBq5uVN6Q5ZnMpPJxhHZUoU9uRlyuUWfJs2vQs9BQagPYnPz@vger.kernel.org
X-Gm-Message-State: AFq9FYLtzVYGc8nFm/yI1yxGz1LvXK798RH6sxMzFmOgo3gZI33OgZoV
	SRLZ3ddhYZts3vSJIBAutVNL/B1NFmdKJbxSdEOZycWTR7YotNO+go9M0S+FVnWWoLUlReSeDxA
	1gt/dFLXrUiCryBpVdiFPrscivbDyaaYxzUvF4XWA+VDco1A4BGoBnPiX3Hn2l9ML
X-Gm-Gg: AYBFou18F3ygKhCb7alniNf3kmzvJHwDBGhZfchf4/SgR1oacO9WvEpbTS6f47GC3xX
	kAW/jVCls8x7257Psuo0e2U7V3uiUfINYXc/8ljzOYJrVx/Z71hJihYdnCCWHDGufcJqE8TgXHe
	RuQBFygSc9XFL8Ihu5IoP65ilS8Tvw4o4UF2QS27DUpA7qQYd4eVH91x/AHMtZJ9/PdakZy6Crs
	xClyZpDiwredrAgIsOPpeRV871cjWZwyb44j18fWWkurEKiW0DaiHwrONz2d7ylZsWDsNDlUMwn
	PVa3uGEOq7vtOy3wAtdxXVwhhqhzc6ArJ3NNrjfPPPYSZY/uIaWy7qnUg3czizUm6MnJZln72m/
	s8IXEREMj61TZSwc76GzXpe1KZD0lg7LVxixIxEuUn3pZGM2rpZxKxAydNzFKfUvAZL4Zbay+3Q
	djwswhxJDj4sbQoczWCvr7Rha3
X-Received: by 2002:a17:903:b8e:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2e2e48b8521mr28672795ad.3.1790832308089;
        Wed, 30 Sep 2026 22:25:08 -0700 (PDT)
X-Received: by 2002:a17:903:b8e:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2e2e48b8521mr28672595ad.3.1790832307607;
        Wed, 30 Sep 2026 22:25:07 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:25:07 -0700 (PDT)
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
Subject: [PATCH v6 13/14] perf tools: Initial support for gtrace decoder
Date: Thu,  1 Oct 2026 10:52:24 +0530
Message-ID: <20261001052243.3042627-14-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abdeeb5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=pBE9Ga8SiHy0nNBnfKcA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXwl4C/gFficFu
 8icpu/Y3M9iZQ5obmN117+ETGLZ43Wfr7CEs0SUOTTAM79BkgL43N/UWfJOszTl6dJ1KtEvsDkP
 R6ZuAEAcK1a9x72Jj4+x/sNvkP9NuBM=
X-Proofpoint-ORIG-GUID: n4qjYjNKl1FFtxhCrFkhx9Z3g4xZZ9Ya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXz4yYeM/w09O+
 piYoiRUoA2BtZg/2DJzeha2/3ueDpLzyjea1pvWpNee5K9L1Vuqia2so+I+qi634PjfLtmB3YSD
 /T/ZDUWtZ6S+FRzvPfu79ucmzv1siUcwpngIUQdA2e/ZdTEyRh1b+RnCXNo5M/3/7GmyuUa8b0l
 en+7YaW+yv3LWTmQ49u6F9q8rPD5VjIr599bbvd4bwYDg4qYC8Z5zp5JtPfj5sek146hN8/nRfm
 l0wYNBSBs78txo+8ZN2xYWaqS6UdTu34F85eAflfU1RU8oyh8L7B7AaRpyUXeW2waNEhnLjxn2Z
 xWCjjyxF3WQ7Gv9RuV/F1oTgtW3i1dql3iptPIpOxw4qeJJmGOJuXmuSQIGyBW4LVVdWPC36u6G
 yfLYWJA0ExIA5OsdzG8ohUbfowUvwanP+t1LJTCRgERyiDSPYyVKkeWYQk7BtxI9jAUBvZvF718
 9MAJL8heCrMxYgtcgrg==
X-Proofpoint-GUID: n4qjYjNKl1FFtxhCrFkhx9Z3g4xZZ9Ya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021

Add bare bones support for gtrace decoder so that the data received
from the hardware by the gtrace perf driver can be written to the
perf record output file. Actual decoding of the trace payload is not yet
implemented.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 tools/perf/util/Build            |  1 +
 tools/perf/util/auxtrace.c       |  3 +
 tools/perf/util/gtrace-decoder.c | 95 ++++++++++++++++++++++++++++++++
 tools/perf/util/gtrace.h         |  1 +
 4 files changed, 100 insertions(+)
 create mode 100644 tools/perf/util/gtrace-decoder.c

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index b26a0b1ddfa3..d25140a0d64f 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -149,6 +149,7 @@ perf-util-y += cs-etm.o
 perf-util-y += cs-etm-decoder/
 endif
 perf-util-y += cs-etm-base.o
+perf-util-y += gtrace-decoder.o
 
 perf-util-y += parse-branch-options.o
 perf-util-y += parse-regs-options.o
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 1ecdde597153..ba750d089a7a 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -54,6 +54,7 @@
 #include "arm-spe.h"
 #include "hisi-ptt.h"
 #include "s390-cpumsf.h"
+#include "gtrace.h"
 #include "util/mmap.h"
 #include "powerpc-vpadtl.h"
 
@@ -1433,6 +1434,8 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
 		err = powerpc_vpadtl_process_auxtrace_info(event, session);
 		break;
 	case PERF_AUXTRACE_GTRACE:
+		err = gtrace__process_auxtrace_info(event, session);
+		break;
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/gtrace-decoder.c b/tools/perf/util/gtrace-decoder.c
new file mode 100644
index 000000000000..c25fbfc61928
--- /dev/null
+++ b/tools/perf/util/gtrace-decoder.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generic hardware trace (gtrace) decoder
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <errno.h>
+#include <inttypes.h>
+#include <stdlib.h>
+#include <internal/lib.h>
+#include <linux/zalloc.h>
+#include "evlist.h"
+#include "session.h"
+#include "gtrace.h"
+
+struct gtrace_decoder {
+	struct auxtrace auxtrace;
+	u32 auxtrace_type;
+	struct perf_session *session;
+	struct machine *machine;
+	u32 pmu_type;
+};
+
+static int gtrace_process_event(struct perf_session *session __maybe_unused,
+				 union perf_event *event __maybe_unused,
+				 struct perf_sample *sample __maybe_unused,
+				 const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static int gtrace_process_auxtrace_event(struct perf_session *session __maybe_unused,
+					  union perf_event *event __maybe_unused,
+					  const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static int gtrace_flush(struct perf_session *session __maybe_unused,
+			 const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static void gtrace_free_events(struct perf_session *session __maybe_unused)
+{
+}
+
+static void gtrace_free(struct perf_session *session)
+{
+	struct gtrace_decoder *ptr = container_of(session->auxtrace, struct gtrace_decoder,
+					    auxtrace);
+
+	session->auxtrace = NULL;
+	free(ptr);
+}
+
+static bool gtrace_evsel_is_auxtrace(struct perf_session *session,
+				      struct evsel *evsel)
+{
+	struct gtrace_decoder *ptr = container_of(session->auxtrace,
+						   struct gtrace_decoder, auxtrace);
+
+	return evsel->core.attr.type == ptr->pmu_type;
+}
+
+int gtrace__process_auxtrace_info(union perf_event *event,
+				   struct perf_session *session)
+{
+	struct perf_record_auxtrace_info *auxtrace_info = &event->auxtrace_info;
+	struct gtrace_decoder *ptr;
+
+	if (auxtrace_info->header.size < GTRACE_AUXTRACE_PRIV_SIZE +
+	    sizeof(struct perf_record_auxtrace_info))
+		return -EINVAL;
+
+	ptr = zalloc(sizeof(*ptr));
+	if (!ptr)
+		return -ENOMEM;
+
+	ptr->session = session;
+	ptr->machine = &session->machines.host;
+	ptr->auxtrace_type = auxtrace_info->type;
+	ptr->pmu_type = auxtrace_info->priv[0];
+
+	ptr->auxtrace.process_event = gtrace_process_event;
+	ptr->auxtrace.process_auxtrace_event = gtrace_process_auxtrace_event;
+	ptr->auxtrace.flush_events = gtrace_flush;
+	ptr->auxtrace.free_events = gtrace_free_events;
+	ptr->auxtrace.free = gtrace_free;
+	ptr->auxtrace.evsel_is_auxtrace = gtrace_evsel_is_auxtrace;
+	session->auxtrace = &ptr->auxtrace;
+
+	return 0;
+}
diff --git a/tools/perf/util/gtrace.h b/tools/perf/util/gtrace.h
index 343d2e9d4fa1..02db4f2ff9f5 100644
--- a/tools/perf/util/gtrace.h
+++ b/tools/perf/util/gtrace.h
@@ -13,5 +13,6 @@ struct perf_session;
 
 #define GTRACE_AUXTRACE_PRIV_SIZE      sizeof(u64)
 
+int gtrace__process_auxtrace_info(union perf_event *event, struct perf_session *session);
 #endif
 
-- 
2.43.0

