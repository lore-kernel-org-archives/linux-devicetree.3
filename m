Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E153FB7E4;
	Wed, 29 Apr 2026 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467146; cv=none; b=IOoPQllwDiYuo78y5F58oHMduUX2MdvrFEl6FGJa2xg4gLNB5u2pgtfJ/brf6RH+PWIC/OPpmVZlgh65uXWEuiGuP5IotwnylShi/6nNxOg3io087/TvmPKm5GUwFgQUOHjEEBD0Iwg1g5CRHM8B62MxMxpkUfER/Vyj26/Jkvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467146; c=relaxed/simple;
	bh=+DL1DclBlXFeMArXfCaUevQHEMgSDsY+8x6YxAFkm14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QciNnpJcVnb0uJiaxqi7dw7VHNt3WV1sEKbQ1IYy9AM3y5Ckje33GPB86RkPZNDQYU7TATiqy/zpt0j85CE2VBAxjHyy/lgUQH+3gra/eX0ixZY53ymyc3djNvYxVzZD979krPf8SdE50QKPOMplWKZSVhuRPWLzybMC0xz3WDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YW/TTd0A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YW/TTd0A"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qEbU3066969;
	Wed, 29 Apr 2026 12:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=paPXV6QvgMm
	syxf0ALUvgRJENAz5jaR9fVu6RhkIUR8=; b=YW/TTd0A6X9pNz+mwBMHD0Q+9qb
	Y1HW9ZwFXU3hn9iUaWbBDTTxCaZrmqVfRU1ArD5v8EO4kmB+n5Sg+w7AsyMlxJMh
	ZLnLSHG/R+H+gmlyVLgZUHcdBnzV41HOGkl3hxy+JEu/yYYpmCbss0UpN5U7HcWn
	i4QYjA5P+zMsuNEbxJ4FykHCkcOMKs96ASWPQpbGVGtAcXyntzexJq7j4TCxFPrF
	lysILOHn94YaEz8W4T4ljQf/cdbhCjEZHXU0D83MTLCdLKRjB0nqf1341X6cK4Qp
	sJXILbMGVhV62MdwR05o5bd0Ecc+Wr2hhnOc72CDSKI8sL870QcDkOilgUw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sxaj0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63TCpbOW010778;
	Wed, 29 Apr 2026 12:51:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ds65fvr21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:38 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63TCpbF1010751;
	Wed, 29 Apr 2026 12:51:38 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 63TCpcRu010805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:38 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D2AC7222FF; Wed, 29 Apr 2026 18:21:36 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v4 10/12] perf tools: Add RISC-V trace PMU record capabilities
Date: Wed, 29 Apr 2026 18:21:33 +0530
Message-ID: <20260429125135.1983498-11-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: iEpIFKEAVp5HPzyz6TGC8zZgOOCZVX5i
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f1fede cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8
 a=kkaCVUy_t53esOPYLmQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzMCBTYWx0ZWRfX7GNyk4/6b4uI
 b8HHjBjmiTSTiq9mLO2chtwNZaOQDYegSZu01I7nmoF+c/yhi4JAiBMlCn4m0iYXERdRz3eHiZw
 pj4L024LdT1JwKXBpVaiVPKb09oHBlSZ81ImiZ404JZilZs9uM1WHeGM3rAxb+e3TJyeljvlG44
 qa0HUQ1X0eznTvwGb6op/WhQ2fb7Z7SeyBdXl+X+0tR6Yk4F0VZwxteUIjt22SynBQk2ENmO93K
 LWRPJ48FtBn029GSpJoVXeqWMH/DfQBVIqt0kDs9kKaP32TknC/3HD7P3OqR9l/hhEZrKdWh3Ng
 TV39md31Ab0NJRC/PL3ApLB9PYnNLWUbgUbVxc3i4aIWhvgd7jpByeJg5Q///aXjERWlZSyfISo
 i6aksLsIKoXk7heyrIxriRzdoBpNveTc7wsWA0RD0JAOxb+mco9ckpG9AiZj/OxSDVnBPaY/TBr
 1EyLRs5A5j5B9IGnUBQ==
X-Proofpoint-ORIG-GUID: iEpIFKEAVp5HPzyz6TGC8zZgOOCZVX5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290130

From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

Introduce the required auxiliary API functions allowing the perf core
to interact with RISC-V trace perf driver.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 tools/perf/arch/riscv/util/Build      |   1 +
 tools/perf/arch/riscv/util/auxtrace.c | 219 ++++++++++++++++++++++++++
 tools/perf/util/auxtrace.c            |   1 +
 tools/perf/util/auxtrace.h            |   1 +
 tools/perf/util/rvtrace.h             |  18 +++
 5 files changed, 240 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/util/rvtrace.h

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 2328fb9a30a3..e07d5525ece6 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1 +1,2 @@
 perf-util-y += header.o
+perf-util-y += auxtrace.o
diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/riscv/util/auxtrace.c
new file mode 100644
index 000000000000..5293ece2147d
--- /dev/null
+++ b/tools/perf/arch/riscv/util/auxtrace.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Risc-V E-Trace support
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/bitops.h>
+#include <linux/log2.h>
+#include <linux/zalloc.h>
+#include <errno.h>
+#include <time.h>
+
+#include <internal/lib.h>
+#include "../../../util/auxtrace.h"
+#include "../../../util/cpumap.h"
+#include "../../../util/debug.h"
+#include "../../../util/event.h"
+#include "../../../util/evlist.h"
+#include "../../../util/evsel.h"
+#include "../../../util/rvtrace.h"
+#include "../../../util/pmu.h"
+#include "../../../util/record.h"
+#include "../../../util/session.h"
+#include "../../../util/tsc.h"
+
+#define RVTRACE_PMU_NAME "rvtrace"
+#define KiB(x) ((x) * 1024)
+#define MiB(x) ((x) * 1024 * 1024)
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
+	return RVTRACE_AUXTRACE_PRIV_SIZE;
+}
+
+static int rvtrace_info_fill(struct auxtrace_record *itr, struct perf_session *session,
+			     struct perf_record_auxtrace_info *auxtrace_info, size_t priv_size)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
+
+	if (priv_size != RVTRACE_AUXTRACE_PRIV_SIZE)
+		return -EINVAL;
+
+	if (!session->evlist->core.nr_mmaps)
+		return -EINVAL;
+
+	auxtrace_info->type = PERF_AUXTRACE_RISCV_TRACE;
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
+				pr_err("There may be only one " RVTRACE_PMU_NAME "x event\n");
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
+	return rdtsc();
+}
+
+static void rvtrace_recording_free(struct auxtrace_record *itr)
+{
+	struct rvtrace_recording *ptr =
+			container_of(itr, struct rvtrace_recording, itr);
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
+	rvtrace_pmu = perf_pmus__find(RVTRACE_PMU_NAME);
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
index a224687ffbc1..944a43d48739 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -1411,6 +1411,7 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
 	case PERF_AUXTRACE_VPA_DTL:
 		err = powerpc_vpadtl_process_auxtrace_info(event, session);
 		break;
+	case PERF_AUXTRACE_RISCV_TRACE:
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 6947f3f284c0..4f4714c1b53f 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -46,6 +46,7 @@ enum auxtrace_type {
 	PERF_AUXTRACE_S390_CPUMSF,
 	PERF_AUXTRACE_HISI_PTT,
 	PERF_AUXTRACE_VPA_DTL,
+	PERF_AUXTRACE_RISCV_TRACE,
 };
 
 enum itrace_period_type {
diff --git a/tools/perf/util/rvtrace.h b/tools/perf/util/rvtrace.h
new file mode 100644
index 000000000000..24b32947fb4c
--- /dev/null
+++ b/tools/perf/util/rvtrace.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ * Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
+ */
+
+#ifndef INCLUDE__UTIL_PERF_RVTRACE_H__
+#define INCLUDE__UTIL_PERF_RVTRACE_H__
+
+#include "debug.h"
+#include "auxtrace.h"
+#include "util/event.h"
+#include "util/session.h"
+#include <linux/bits.h>
+
+#define RVTRACE_AUXTRACE_PRIV_SIZE	sizeof(u64)
+
+#endif
-- 
2.43.0

