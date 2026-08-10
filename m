Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61BA426ECD
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375510; cv=none; b=HiD0yBofv8Z+Vi8Ugn3MZzGAzkKYQjXE6Gro4Zn4uPc8Nf9DwlfpA2SoJh9Jp7sjMcXmRsyXIOyCdm9T3jIp7AbXJc1Gi9uCtTcaJqFMsFvOguqnEGme5H43BY2YyKExj/Duz9OMUzjjiJEn5wd9EOWPiH+V3h1wa21efPxT6O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375510; c=relaxed/simple;
	bh=fOg5i2ihG8+tJLLCvkanJIPQZ/ECRJrI2j4yWoeAsj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RaAi50jaGSUB+NbL5spxVhcip9eAf7xGy0RncxQT27xbKVPfVLV9gb8ieNHT/5hdQAvAvGsEitH674C80B6oG68KbgBCwQGYIinuuYPcBtdSUKdDpHfIUP+5enkDUFLAmCgCaYAMyY0sxh7nLhFPXdHzZR4YdMX3VKqSwtw5i2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJK2RHoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxbWFMzl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJK2RHoc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxbWFMzl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj7381706815
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QfjYrKxKbfX
	2s3AbR0cFidaFV2bBYJPCsLbt9KgbLlk=; b=oJK2RHocf9Va6uS5vrKXeBBhXaw
	R4ziwHFl+UIN6W7ZhGN4q6xrVUPSUByQ4iMcttt/ob2LrATdh1vgkN/GV6MU+gMC
	aEMPAH8FsfXiwpJOO/Ev17oqkLy/kfn38Bina7uO5VnVSxIRtWeE2nLYbZjGbQha
	EVqJBgvHK1SPefmelxFlLWAoS7h1DMHfdHFBMNca8qZn6dXMFxJX369Q+zfeC46T
	GdXLngB4tr3YL7/rD9SpwpybV1LZNDDwCTXVpxvDcZCxyj7FQrNi2jUpVlYKGKl+
	ZHgxWTKlHBjgHFz9G8GHPQdGYALZXeSMvojf8Br1+fs93QsUDA5zycMO0dw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh59msr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:25:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so1779038a12.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375507; x=1786980307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfjYrKxKbfX2s3AbR0cFidaFV2bBYJPCsLbt9KgbLlk=;
        b=RxbWFMzlSQ2YBmvlIqit1wfjTxPY8Po17wH7nm2ufoyVv4KCIGMwEEIoLxUAR5beXD
         KDAGxrETW/vgPHDUrlkjpYohGTnudpFlU7M92D66V7ND6S379ZHSn3r+FKXQMFm4FOmF
         uO+h/JAsCpukXPrF88S7thlqw7l84RqKwX8WJcOjA4iawjdVKN4RtAynkb/9qVF4I0bd
         cPUE5dNErpHDcrTphjK2uyXwQ/JOJgyFNxq75co9PAP9avusmVXZmmoHPto1BFao9O3D
         3FVnEpPWzR33X/JQ2rv5mmj9TZ0AMjEQa9MCmvGiC3uSKvjE1PRmKWfwVFhAEYAwGRdZ
         x2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375507; x=1786980307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfjYrKxKbfX2s3AbR0cFidaFV2bBYJPCsLbt9KgbLlk=;
        b=QiiIGPqd/JA+oE4CZtlOnOQ7dumXR2mTRKZJ970m0bqQ7vbf3NgEaVYGAfxvr4uAlz
         J1TA9pyAuJADobxIgKJVJ7E8T0y9hla5opYUb6fb9IuBzxE1MfVTe9aYo5D4AFcbygaj
         D1YNew5393gDmFq6qvhew0dEXZiJV93AkTiS+adEleub+CgNOIzxUna4qIOFO3uNlYIl
         aygAdD0xidzB+Bfs7gBIP8FKABTaZ3ENGBmV9sljgYXJF1kewIBrqSLpNPAOYURxRgfi
         8OX7hnkT2MovJX2eS95czqk6RknhTEZ5vhK68XWZdavcKdyRgbVc/EyGdCCEshBr3gsf
         TA2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpua/wMrVj3w+0IhkQ0onX2I3+dS18kaTkuIbZHF001BTcnACsSgE+W8d2xwuXoW+4tjPlO4KwnXgJ/@vger.kernel.org
X-Gm-Message-State: AOJu0YzPkQIJCCoX4d1P9jQpvscCeTad+sJbOB5ydtlakHKiG5S/kEr+
	KxnvhPg1MWLyaSpVwTJndxGHF/WqVX+umX63gOZ3f32jW3Xg5nJMZwngpEQPGVcUpvxW+zIC5u6
	a9ACNzj7r8FV4enNdaktpT5LbG8XP1pK91r2EZWArjRsGYWY+bq8HNDtraBL8YetF
X-Gm-Gg: AR+sD10CtWWPYCquXKGKnUf+skDFRp30VgUBJNOKo9/yIE8DPjmfD6YIkOO9a/+Y0J6
	qDpYiXzzFkEkFy09ZiU38ZDy2qQsQMwRzCK9mK+2vfMjmbyOeXLHIskFuAY0pMAruI6lS+o4iRc
	lEavOlB9cMHNxt79vO8TZJmjsh9DnlMEoKQUHyXBTw7OQNA+pEqEbEFNo5bofBsa4OZnDk1F1vS
	P7TqYISLUnxAkDTbUD9RXJ2T3UoswV5wf5NHF4MbYBJskYPBjxahI+8Li0XRvxVXIwG5iM08ekB
	ZisxUV7dg+umUmoboi8tJD4MuXsnPpLGWbvz8XnVFuzqBpAnBEnjQBsQ6KY9gw5KVE8CS3djkmp
	on+sZxeAy+WLHyq18qf13kHgVORYFkJY1BL8OqXNbFEWYs3Tf2jzzOUUbrUGVJTBbbnPu8cg6Sm
	x+gYg5XNH8O0tLjlqiou31xRCTsw==
X-Received: by 2002:a05:6a00:18a1:b0:84a:29a7:f3b1 with SMTP id d2e1a72fcca58-84f4fdbfe84mr31231012b3a.16.1786375507202;
        Mon, 10 Aug 2026 08:25:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a1:b0:84a:29a7:f3b1 with SMTP id d2e1a72fcca58-84f4fdbfe84mr31230942b3a.16.1786375506737;
        Mon, 10 Aug 2026 08:25:06 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:25:06 -0700 (PDT)
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
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v5 13/14] perf tools: Initial support for gtrace decoder
Date: Mon, 10 Aug 2026 20:52:15 +0530
Message-ID: <20260810152223.3946743-14-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a79ed54 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=pBE9Ga8SiHy0nNBnfKcA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: L6LELZd3LuooMkatSehHZcPFZcJUN_Xa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX9oR5xYO/cLI6
 rYamdbPP75OuBil/eGTvJBRhwrlaOxPjH53eiLEbIocq/Y3b1YJFk2OBaQQoDnwKd7/ft0PBqLU
 yR9KQAkXBAXjzzRYCmW2fknnhpSd/No=
X-Proofpoint-GUID: L6LELZd3LuooMkatSehHZcPFZcJUN_Xa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX83B1arhpg7qr
 6DznkP/qTundAZnUdwsZPEIHVehInEGRetZiSNt6/CwjRhOXddXOkQ9KmK/UtDxeGOi+KfAcFPl
 LOG0/6guQif6hNMCFp4Yv0dtwl5CZvR4gfa0n09XjA2e9mBHiVX3kHRJQPQClqYk1nwVkOHpsZ9
 bX2stdWYXnaMXzxzocHCHHlfgOz7yJpHd0aBxfQ0rd3H4AZWbxLnpVIh4bQLkd5NK4agWhTZN3F
 Rl7qUnOl+nzRi4brenvrhHbYudSMc3tecytWR9UOsIIyJ1ZrLWYwFllQAiuB96DdP3Jyt2vyLli
 n55WGUXpUT/1HIZEbX54hLqhPqAYiHaSt+GvZSPzaY75+N+2UTN/ljNoaY+cQMzjdwV+nQ5TeIM
 bupmo22VxWntQe2kDnJN5KfZ7yKquWau1gK2NfrlxahZBPHKJr7l7kj4hTFsHxSdqtep8pz9+TT
 tEp5mhhsjcEHa+/sW/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132

Add bare bones support for gtrace decoder so that the data received
from the hardware by the gtrace perf driver can be written to the
perf record output file. Actual decoding of the trace payload is not yet
implemented.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
---
 tools/perf/util/Build            |  1 +
 tools/perf/util/auxtrace.c       |  3 ++
 tools/perf/util/gtrace-decoder.c | 93 ++++++++++++++++++++++++++++++++
 tools/perf/util/gtrace.h         |  1 +
 4 files changed, 98 insertions(+)
 create mode 100644 tools/perf/util/gtrace-decoder.c

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 5e2265018826..7bd752b5ae6a 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -148,6 +148,7 @@ perf-util-y += cs-etm.o
 perf-util-y += cs-etm-decoder/
 endif
 perf-util-y += cs-etm-base.o
+perf-util-y += gtrace-decoder.o
 
 perf-util-y += parse-branch-options.o
 perf-util-y += parse-regs-options.o
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index d7f27ca15b81..8eda626aede5 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -54,6 +54,7 @@
 #include "arm-spe.h"
 #include "hisi-ptt.h"
 #include "s390-cpumsf.h"
+#include "gtrace.h"
 #include "util/mmap.h"
 #include "powerpc-vpadtl.h"
 
@@ -1428,6 +1429,8 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
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
index 000000000000..4a1571431edb
--- /dev/null
+++ b/tools/perf/util/gtrace-decoder.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generic hardware trace (gtrace) decoder
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <errno.h>
+#include <inttypes.h>
+#include <internal/lib.h>
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
index 4b87bdaf55c6..3531508b1dfb 100644
--- a/tools/perf/util/gtrace.h
+++ b/tools/perf/util/gtrace.h
@@ -8,5 +8,6 @@
 
 #define GTRACE_AUXTRACE_PRIV_SIZE      sizeof(u64)
 
+int gtrace__process_auxtrace_info(union perf_event *event, struct perf_session *session);
 #endif
 
-- 
2.43.0

