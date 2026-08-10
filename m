Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CF440861B
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375503; cv=none; b=WBoki4umkGiVnzZ54MDWm3bsRFJnC7vnTLiBvE9Fdq7cddBpnltTOZ0WQilJZzM2h99bKJQSgr7slmJesdkZshRyLDn+okFfvREFfmer9ByWYcTPWGOa/iZqHUHxtn9VjQU/xGiE++6wthVtYZOfw4x9u+WvOGB5ocS0ShsQFKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375503; c=relaxed/simple;
	bh=In4x6785K8/vzSdIYiKbGi6O4zEsUhiyOAirPWAlgjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIOI2mLKlj4GvKgrSVKcEOCSZH/ldrruD8OrajdCOC5eT2SDu08PliJXUbvE8iqg3lGdZRa6ZaZaRbLrz/gX+ayEORZtLgaJKaSGzb4r5nBlT/IT/wD+0jfJDBltHv4iSPNTfuKW2FphTEj6rugz4b4wD9f64675+c4cbBy1qqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VeFKsovc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQgjABSA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VeFKsovc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQgjABSA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACiwOi914587
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Hk/olWcMYCC
	UGqV7YkEAh0ajnCbIBwvqXEI3sMl4tPk=; b=VeFKsovcq8oVyZZMdjRDlfKpsM4
	Gp3kPQrCzcq7847iNVdgPb3Eq8jAkVHgLmv7a8gCrnL6UVY0QREsaX/3eVzHB9Yz
	lUN/a4ZKFqVkn8rHtRDYsZPCWbMS3o7HSjI8BcEQH+WLnCU2cQH+8AOO5SZIgn6q
	9tOCwyDFZE6i3O3cS42bpwa5p7QoheDLl9O3Nn/e39YFS63sjiYDE+QjbVRnmLxP
	443NYoTPXScGX9CWpygXxGeyZqqxOMYY/Co5X3BmK26vfl42s2+ffCw5qJiBgqUD
	TJaxDUQRfTi2GyDbVKNKKV/YTa8hQhfE+jk5/9mEFxIN9up0yH0MFK3N1Ig==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v9279w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:25:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso2525855a12.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375500; x=1786980300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hk/olWcMYCCUGqV7YkEAh0ajnCbIBwvqXEI3sMl4tPk=;
        b=GQgjABSANY5GliZU1j2eHaYuj1F8e99UlR8L9L5Ala/htkG+MKAhCCc3TS0G4VWrqA
         hiZ5R34xQCeO/zs7viBJddbtGO5Zjrtiovfzne+wz2GCXOTyqP3OS9wI5Yg6vmNlyz2A
         mG7QNI/3v0G/VfbcXNaXxxFXOVnZe6mlPRPcAMwzY60ZVy+sJuTAtfAFfDZYIxM6TkTq
         Hz4CsmxdVshUl8+kbThsm3pAMb/aGxpnboaL/gtFSLdf6X0fcb4XQCs1qk59SCWJ8xRg
         peFPu/43WDeKQo8GB3eOPFTLiOVhetXrBHK5Op1rgo5gMocB767i+WjdW/p0ex/NgRmx
         14vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375500; x=1786980300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hk/olWcMYCCUGqV7YkEAh0ajnCbIBwvqXEI3sMl4tPk=;
        b=nrWnnhgru85V29ax6JwgQ+RgbpAghrrGdjHZ8brvcvMqlXfsP4yH0Jeu36e2g54hZM
         rmz9i5GrOXZXvQb7vpSKU+6c1JwuPvbkmsgOjhwy6SGznsp3vLiRv87FZ4hPfAvGE8Wk
         IcL1JSiJ0dBBevkw36N9v4rcJ0qHieB6iupN/o7SlAA5USeq5A/w4UfGAwMlekYpwQ0Y
         rxwSOEYpuCBxRBpFEuoHNMVj1UmNkIwkjpUcTkwYg8exgPBcJH/b9zGMNBVzZkgFIrdF
         RbEF82D2cNvkpLXZcntoJBiFSxCbAK/qPfTm7GihMtiZFo6KZ9RrNtaz3rsSyySiCd3/
         cOvA==
X-Forwarded-Encrypted: i=1; AHgh+RppT/Rpn8OQcpUeWhSBR4idUgZAV4XQ3mvM5PdegXq0klOwF1q3Bxd3AjXv7tY5OVCQHaetXHnBSIIy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx6uVDlOwmBPgcjdSJiRdiC52KGOnCEfQYrkO6mlqlg5DeLxZ5
	2oqDxceDczW7kjkNNdZA6xvdj79QVO5ZK49Tcj+G4Y2X4zFKLFrnHtQXe4x+A2yp6q++xoTXRL3
	Ddw4piGGq6gHPccXFXhYg6yQoPL4wAHfily90C6aVl/e+zv7FTjWB8y8RkuRZ2eVW
X-Gm-Gg: AR+sD120wShh7FDg8NB1Kt3xI+B37/s4LagJaWD96aTT5+C5Kje7YpK7+39uR+d2Jhl
	gAkOV5Sn/zc7DMoVd7AoAgbEoTQp4+7Gmg9WKMaUO/UJzVhiF7I1Sc8Gxvg4WhL5yzlnYVI8hX5
	VbhRPC+cfT/0nF29hFwGoCka4vh7AAYQAcZaMQTboAhWOkx/R/YW6GhYBBuKa9AzoiUBFd6CHmj
	OmjM6XzLlaFlJvrkZR3SVJXMRmYVS9X8ZY0woA4AxIH4WKeY1iOW8/9jWB4cKZpeBMAxFtqz1b3
	iA7SI/LnV+LJo53KztFrSDkAmWU+fabpcEcMLkKDTYJPaO2xyypcfIbxIPHXSaMJCcfZHQ4soH+
	31v+/6pciZPtb5TOZrdT4t9I/aog2APC5I40BlRQi9k/5pM5qVbBudcbTCtwQwBtLkEsmw6R5PI
	qTHxmLB0pEfs1uCrpf8TwW/e9MXQ==
X-Received: by 2002:a05:6a20:c5a7:b0:3c8:f98f:475b with SMTP id adf61e73a8af0-3cb85e6c950mr53762707637.19.1786375499780;
        Mon, 10 Aug 2026 08:24:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:c5a7:b0:3c8:f98f:475b with SMTP id adf61e73a8af0-3cb85e6c950mr53762639637.19.1786375499195;
        Mon, 10 Aug 2026 08:24:59 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:58 -0700 (PDT)
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
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v5 12/14] perf tools: Add RISC-V trace PMU record capabilities
Date: Mon, 10 Aug 2026 20:52:14 +0530
Message-ID: <20260810152223.3946743-13-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfXyyIaZhOMVCch
 t9TEPINq5i8G5UrRFpOghGXjoBOftcaGBvWIIozAjKzTcHJu3QuTGF7DL+4QCwwvgOBAUoq4ecx
 mKpMHIWMqeiPpkKV1S4LXeMl0IkJnfE=
X-Proofpoint-ORIG-GUID: K0GcdYYGTgPPRSJ3URSXmkDQLitlL02f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX7jTWsIOACWBv
 Xz455VENQo0TLMHGYECFnNF1COj+AvocgEPfX7Idvz6ruHaBerWijp1a6qeb21PtW/tFS/IxOU/
 BIWvsYD21KSalx26Nm8WKPTUX7oPy1UcnXwEdaVePgphpfuO20kxoPT+ujCcXtf8/zXmlmGIkRo
 51w5CviBBXaKHCXLes1UOKC48CiErsjXLZ06Zzyneete9AGPbpCRutGMl0Qq0e1ZhFye98MnWnG
 LybHm6Gj/Y9Yn+UTBApjIXLpn3F/4bl9o6VvyqnGzwja5rG4c0Z3WzUaQmtPFgIqxvU1Pi/2chu
 ARWrIoHCP56eUtLR1DMviMeby918ylvxkwPoOqXvegtt4bE4ifdA+q+McJmG7Qh0DAV3d7ANMTV
 viL3POIuymfkJM+sK0S/ci3P8nitUEQ/wkg48k03GbxHhPzf+iwAS3sRZnKj7J/1f3+vVcZdVVT
 Or2GXNZsB3Ie7p+KJfg==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a79ed4c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=QyXUC8HyAAAA:8 a=F5mInixxrWKVZ3nbcxgA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: K0GcdYYGTgPPRSJ3URSXmkDQLitlL02f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132

Introduce the required auxiliary API functions allowing the perf core
to interact with gtrace perf driver. On RISC-V systems the gtrace
PMU uses the RISC-V E-Trace components and optionally an ATB Bridge
component for connecting to ARM-side sinks, if it is present on the SoC.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
---
 tools/perf/arch/riscv/util/Build      |   1 +
 tools/perf/arch/riscv/util/auxtrace.c | 217 ++++++++++++++++++++++++++
 tools/perf/util/auxtrace.c            |   1 +
 tools/perf/util/auxtrace.h            |   1 +
 tools/perf/util/gtrace.h              |  12 ++
 5 files changed, 232 insertions(+)
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
index 000000000000..39c31be9f896
--- /dev/null
+++ b/tools/perf/arch/riscv/util/auxtrace.c
@@ -0,0 +1,217 @@
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
+#include <time.h>
+
+#include <internal/lib.h>
+#include "../../../util/auxtrace.h"
+#include "../../../util/cpumap.h"
+#include "../../../util/debug.h"
+#include "../../../util/event.h"
+#include "../../../util/evlist.h"
+#include "../../../util/evsel.h"
+#include "../../../util/pmu.h"
+#include "../../../util/record.h"
+#include "../../../util/session.h"
+
+
+#define GTRACE_PMU_NAME	"gtrace"
+#define GTRACE_AUXTRACE_PRIV_SIZE	sizeof(u64)
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
index 4cd2caf54015..d7f27ca15b81 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -1427,6 +1427,7 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
 	case PERF_AUXTRACE_VPA_DTL:
 		err = powerpc_vpadtl_process_auxtrace_info(event, session);
 		break;
+	case PERF_AUXTRACE_GTRACE:
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 6947f3f284c0..42b1481ec894 100644
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
index 000000000000..4b87bdaf55c6
--- /dev/null
+++ b/tools/perf/util/gtrace.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#ifndef INCLUDE__UTIL_PERF_GTRACE_H__
+#define INCLUDE__UTIL_PERF_GTRACE_H__
+
+#define GTRACE_AUXTRACE_PRIV_SIZE      sizeof(u64)
+
+#endif
+
-- 
2.43.0

