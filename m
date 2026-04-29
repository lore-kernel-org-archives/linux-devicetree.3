Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF33E401488;
	Wed, 29 Apr 2026 12:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467159; cv=none; b=fi2SKR8+fTrzrnqqP98BCzWw6cktIibQf/SkaD4iNdU0bwuMk6y7wsE3p3K8zb/EBekTx6Zo6+H+2bM092H9OIHG1q1p8nO84J7GEsLsSAnuFj/u+rJzwtOh7km1v7FUeePq+YJmJq9AWa0qfhqNB1qR40cm1SMrxjCcoxIiFhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467159; c=relaxed/simple;
	bh=yy7I52APMPCUW/rid7cXQxA7lqmgiY7KHX7tKBvjytY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnHjycrGDzqOmDxTbtQphwET9LeMAgmLuIe6xRzCfNMsHRaDDKyLdXws02KyycdWLOyoBxsuMyBzwR8j2mERvxxUPrHK7QYjkCbgsc+cluvrQR3Ae9zWIIxCQaYvD14ode22l8n31mOJTuwnLPcqdZpi7L8352T2irc1Dl18CA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jX+daNjY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jX+daNjY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qcGf870170;
	Wed, 29 Apr 2026 12:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Um4b1vdTfO7
	UEMAByHqKwcuVXLD08tA6X7O8a/l44zA=; b=jX+daNjYUgPyzKq+/wLNXbJsx39
	qmZ6YfTvJhKBChOXYx8LdiUraX3Gs47XA7RcslXAEv4JuhAVHNL5YRYhZd3rxvpm
	rL6bXnOqvynoMCC72xUYXqbgD16mKOde0mLHm4bFgm7iC6kgEytwFma19jnHFmt4
	mV3QHpmPeHYPYumK6ZnPsXRUONBCeX6RrU6vf5RyV1cOlgiyOi+haPHySjbDOF1l
	qJFwqdQq0H1QIjG3gYMnIdR5Qu97RsWCTpMF53yMcMa538fPAbQR4xywnYCE0BQe
	RsmRLfN39B3/LgQoOnoVf7N4P+m1paKHAr+sBbGP8X2AIonKIGSRv7nbj+g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1uxvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63TCpdjg010860;
	Wed, 29 Apr 2026 12:51:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ds65fvr24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:39 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63TCpcqH010817;
	Wed, 29 Apr 2026 12:51:38 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 63TCpcv7010800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:38 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D64372230D; Wed, 29 Apr 2026 18:21:36 +0530 (+0530)
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
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v4 11/12] perf tools: Initial support for RISC-V trace decoder
Date: Wed, 29 Apr 2026 18:21:34 +0530
Message-ID: <20260429125135.1983498-12-anup.patel@oss.qualcomm.com>
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
X-Proofpoint-GUID: GXZ_LK5W6CyPgkCBnkuGCNWe4pp21o4p
X-Proofpoint-ORIG-GUID: GXZ_LK5W6CyPgkCBnkuGCNWe4pp21o4p
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1fede cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=b95MOGMN5JXeKaQ3w7sA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzMCBTYWx0ZWRfX/bjOdeUhI326
 XQCRdUGY4lAcmX8FneMP3WhM+j48qZdVZkSUX88ihTPMgLUEco7UktEvZrJuR0jMdK3cuVKvHna
 82Ah24cGuS50OJaV6na3/SymS7KNIGwTdoXtd9JbUtXAUknoSWBogndnwPpkRva4gqm08zd8Bev
 rrpn2Hzzcz+zV0YV09ZSwbeXf24EVEdCE0MFwcrg/NDVDRJJEBW35pujqpwHvcmKTu9GJkFAlmc
 QsvpAP/2GXzEpR9BXQoWYIwox6jxm0xXsofPfcI2VK/di6/aWeJ6/Mzoem3m7hG2ie+xAj79ItA
 R2oPtRnxN3QBqY0cK/pP/63lPeVHWYBDdUNmb2yHaflgiarRIxFDnXRSSzhrZhPBPf8/rxQTtGr
 yCwRDH87Xtby6OOpDthJe4NbNOaixliMVxW0s5vR5p+KP/N9lhPzbzYtl4fRFUkzrxnjrwgrLdk
 q/U/1G/TIb5KrLPxFhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290130

From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

Add bare bones support for RISC-V trace decoder so that the data received
from the hardware by the RISC-V trace perf driver can be written to the
perf record output file.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 tools/perf/util/Build             |  1 +
 tools/perf/util/auxtrace.c        |  3 +
 tools/perf/util/rvtrace-decoder.c | 91 +++++++++++++++++++++++++++++++
 tools/perf/util/rvtrace.h         |  1 +
 4 files changed, 96 insertions(+)
 create mode 100644 tools/perf/util/rvtrace-decoder.c

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 70cc91d00804..1cd1491f93c8 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -147,6 +147,7 @@ perf-util-y += cs-etm.o
 perf-util-y += cs-etm-decoder/
 endif
 perf-util-y += cs-etm-base.o
+perf-util-y += rvtrace-decoder.o
 
 perf-util-y += parse-branch-options.o
 perf-util-y += parse-regs-options.o
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 944a43d48739..c6bd6642ce05 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -54,6 +54,7 @@
 #include "arm-spe.h"
 #include "hisi-ptt.h"
 #include "s390-cpumsf.h"
+#include "rvtrace.h"
 #include "util/mmap.h"
 #include "powerpc-vpadtl.h"
 
@@ -1412,6 +1413,8 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
 		err = powerpc_vpadtl_process_auxtrace_info(event, session);
 		break;
 	case PERF_AUXTRACE_RISCV_TRACE:
+		err = rvtrace__process_auxtrace_info(event, session);
+		break;
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/rvtrace-decoder.c b/tools/perf/util/rvtrace-decoder.c
new file mode 100644
index 000000000000..58db5ca62c1a
--- /dev/null
+++ b/tools/perf/util/rvtrace-decoder.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RISC-V trace Decoder
+ */
+
+#include <errno.h>
+#include <inttypes.h>
+#include "evlist.h"
+#include <internal/lib.h>
+#include "rvtrace.h"
+
+struct rvtrace_decoder {
+	struct auxtrace auxtrace;
+	u32 auxtrace_type;
+	struct perf_session *session;
+	struct machine *machine;
+	u32 pmu_type;
+};
+
+static int rvtrace_process_event(struct perf_session *session __maybe_unused,
+				 union perf_event *event __maybe_unused,
+				 struct perf_sample *sample __maybe_unused,
+				 const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static int rvtrace_process_auxtrace_event(struct perf_session *session __maybe_unused,
+					  union perf_event *event __maybe_unused,
+					  const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static int rvtrace_flush(struct perf_session *session __maybe_unused,
+			 const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static void rvtrace_free_events(struct perf_session *session __maybe_unused)
+{
+}
+
+static void rvtrace_free(struct perf_session *session)
+{
+	struct rvtrace_decoder *ptr = container_of(session->auxtrace, struct rvtrace_decoder,
+					    auxtrace);
+
+	session->auxtrace = NULL;
+	free(ptr);
+}
+
+static bool rvtrace_evsel_is_auxtrace(struct perf_session *session,
+				      struct evsel *evsel)
+{
+	struct rvtrace_decoder *ptr = container_of(session->auxtrace,
+						   struct rvtrace_decoder, auxtrace);
+
+	return evsel->core.attr.type == ptr->pmu_type;
+}
+
+int rvtrace__process_auxtrace_info(union perf_event *event,
+				   struct perf_session *session)
+{
+	struct perf_record_auxtrace_info *auxtrace_info = &event->auxtrace_info;
+	struct rvtrace_decoder *ptr;
+
+	if (auxtrace_info->header.size < RVTRACE_AUXTRACE_PRIV_SIZE +
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
+	ptr->auxtrace.process_event = rvtrace_process_event;
+	ptr->auxtrace.process_auxtrace_event = rvtrace_process_auxtrace_event;
+	ptr->auxtrace.flush_events = rvtrace_flush;
+	ptr->auxtrace.free_events = rvtrace_free_events;
+	ptr->auxtrace.free = rvtrace_free;
+	ptr->auxtrace.evsel_is_auxtrace = rvtrace_evsel_is_auxtrace;
+	session->auxtrace = &ptr->auxtrace;
+
+	return 0;
+}
diff --git a/tools/perf/util/rvtrace.h b/tools/perf/util/rvtrace.h
index 24b32947fb4c..8e3eb4d681a7 100644
--- a/tools/perf/util/rvtrace.h
+++ b/tools/perf/util/rvtrace.h
@@ -15,4 +15,5 @@
 
 #define RVTRACE_AUXTRACE_PRIV_SIZE	sizeof(u64)
 
+int rvtrace__process_auxtrace_info(union perf_event *event, struct perf_session *session);
 #endif
-- 
2.43.0

