Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E7D418359
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375495; cv=none; b=Kpkuaz9LgPewB0YwlcE2Rzk+JJqRP4onJK6ceg8w53ULprMPiObHtBJZxdf5rx7yoYG2SBOXbC/Py2vof9/wvq99Wu5Jabw9VQlSD4kY6GmL3uev/cfLGgJN/Acxb5x2GsZWRxviKodEn/i5j4iuMUeB3FOuGh4UFXVyPDMHPmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375495; c=relaxed/simple;
	bh=tgf+IVxiVZKhbGaRfiLzFf6N7y+3gz6edNDUkGgFhy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqMEFcZDJU51M0095xOURgQnCEAp8Mbr+vL/UppiQV/BTKpdAiO+ZwAQ5xN23S+Vufbq6WwNT8aPxf41yXIoHMIPZlSz1jEKWytrmjwLwPzQdbaaywhL02xgIaA4+P4R/IUD3JPXSVi9ItCboEG3cWfJSfI5kDiFeivKgd3FqzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5qfyTJ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1Lro6Pv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5qfyTJ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1Lro6Pv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj9Pg1308450
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WFsC6PGmfD/
	xegtg7aOxmBQNqWxDfwAUvD3dRQnjBfE=; b=R5qfyTJ0DnVFzSA58wN2g589Z4c
	u3nw8u4VdT5jeVzLyME2ywod+n0GO+TLUUFIhAsNgmoT0TRPc7ed2zfnKiJRXjel
	w+F+dKk6MIMga5uo7OimogVNRuSAM2NqVL8rq5vsXOb+BlwhH1KGD2FDo6dBwtp6
	n2M8yY1CufUO/wKCMS1UR5CDRDbBbmP10QYmlvdYe0cvjEXsGUPbyzTiEA+sjnt4
	9vndn5hnsSt+UJwkkhgXg0tovW6oePQ2MAOUPpby+OV1PIA4KxpdBRbDdJG+pitY
	ZTi2jQ83BkKad1TRm3ULG9FSpvzizInuMozSkhIA1FIHPMLw91H0BgxH1LQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqsbu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so1687089a12.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375492; x=1786980292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFsC6PGmfD/xegtg7aOxmBQNqWxDfwAUvD3dRQnjBfE=;
        b=E1Lro6PvfGYyfIsINXIjpk1eSxlyHv2lSR/Assr6LxotfXb8iJhiez8QqY0AVnRdd3
         x22v+EjrUYaK80wrW86PhNMjhYs3n9PIOrBfYPjmzhcDEbMZwKlEVwnhbSmRFkw4Y8IS
         pvwB4dSfftEfQf+U5lqqiG+EaIbgesZVq7Zdf5KK0mvjIEM6Kixm21vzEJlqrkjNlvu5
         RJf2+GzhNqCaS0rNe9FfKhhKR+epg4uw/5PlCLD/iXjn7q1h1xOOdwuGwhk8YWyqdqOG
         ePIssMK0io5B+GGHPHyI0mzBafmXZ33eE3lzMthXgvesm/JZUh2K6ZN9tqR2VPzyRrac
         xXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375492; x=1786980292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFsC6PGmfD/xegtg7aOxmBQNqWxDfwAUvD3dRQnjBfE=;
        b=RYMoOAdHXMj9BpJFL3WjFHVo7aM4cRFlPjvROMERdGbRw6YkW8tbtbsqYe9Pg9Td8H
         v1QGbijhf+N3zp/Lz2wBnJH+BuQcD1H6+XmjzrUtowm8jOdHKkL5v1BUQJJbtbWyAS2l
         RLtCD8fgbFS9Q24NJ+5awL6hb5+AUnZbRx1qm78fmMCbAlaxPcC//Wt7k8i/flXu3Dfv
         VyEabR8KQziwl5YaeBCtwKnzu1VNA7+cWlTZdvy9g+YWr0EG2vZrqG8XTqz2Lm18UEpW
         KUo7c5KHGk+b3iTE5fa2/57BkyMrUIHM2Ct4t7ZpXINYLYbnIe1zwFDcpjgnnwp0BzV0
         QEXw==
X-Forwarded-Encrypted: i=1; AHgh+RqQm5jXmpvFB/+KMkD46A0G5CFi05G3AsKWqUiTiqwB+ox6xw8zf2A0HD3l2jcXvFP/NRj+KTXdmNJh@vger.kernel.org
X-Gm-Message-State: AOJu0YxLC7oh7ZCdPDbDbhzZqa8R4g+ZS8huUyFAKC348GuxZdzvs1O1
	apEEafcnsurjdMIlxxxvm8r6sjPHdiWcN73dwNmStjyak52telDfIfxmayR2f26P2YzHtZw1CSv
	z6IwvW4vhaxXdSXbPhdk81TOPpVAw1CGEU6W8BlhEEBK4zuuLfGO38Uoe/CoWPdZm
X-Gm-Gg: AR+sD11Hcrc8urYipcj7D4WYsXPEp6Ytz95zQ8ZvLb6KWI7Ukm0r/9X8p37thUd8V/x
	iUbUQ2MB8uCctPMXdr2VNwvWz7VIQoNez5LuXayOki6DNHc2Kht18Ec5sGX6m+28iAcnj1daruV
	7zk3vXgZ3ls4AuBKCb8Ftvai/4hrmiW5xaLNl4EsXJhN5BJcH48/r+MuMNv1gnxaNKrDASJPUnt
	ti2M87o+2hhiJTqhnPkcNDtp3C5Rvpi9PmCXpJyBB/mXTFxD27yJu8MMkfE06EtcZPjmw6hmCGz
	QpJP8mR+5DM40/YvPxN0BaJGzrPmThce/SNapLJJXubERP/H3vfNjBn/mLOoN1b87fjQ8w9Ph7+
	nKu67UIHIytepAMLDz2X62uWxFyPPbIzyFvmxjh6iL21RBuhd+QUeQlooxrA3R/W5QDm3yCy26r
	dWpgHwJEl5eVqMhiPsRQjNii3ukA==
X-Received: by 2002:a05:6a21:7101:b0:3bf:ab54:8db8 with SMTP id adf61e73a8af0-3cbd3a40d5cmr21251133637.17.1786375492029;
        Mon, 10 Aug 2026 08:24:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:7101:b0:3bf:ab54:8db8 with SMTP id adf61e73a8af0-3cbd3a40d5cmr21251039637.17.1786375491354;
        Mon, 10 Aug 2026 08:24:51 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:50 -0700 (PDT)
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
Subject: [PATCH v5 11/14] gtrace: Add perf driver for tracing using perf tool
Date: Mon, 10 Aug 2026 20:52:13 +0530
Message-ID: <20260810152223.3946743-12-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-GUID: FlKuV0SJP3DfGxEslh1ENmgMmJSUL4_z
X-Proofpoint-ORIG-GUID: FlKuV0SJP3DfGxEslh1ENmgMmJSUL4_z
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79ed45 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=_CJk7DrN_qkI4yTom0IA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX1nsVSyL5+tQL
 ZQr2IHL1tRysanN3e4FkDiu/JLwqxA6vNEROkt02ElVKlVj3WjgMlObqk6ihFYK/sHrPQbHBa4R
 umTv3XuBneXfvs1l/ytbt5AsVPSH864pe//6Z3p/UqBWRMjQ95bM8Aopeu1+pCreZB7c1rP5cAs
 lJ3Ft9V0/WlKbc4feQuiRmGtP5xluSWPhFIAeapJ7INxsQuuMGLp2kSQZ/XbfQPNzt6xiyCEkA/
 Mqp7XZfnDAm2lN4/VnW7XfRnTkOFNIehFYb+ONE3QctPNhwlLNPO8eNfy4o5mdhMfAoarYEtFBf
 YVx/v5OGf0Xok6R/1LWKcScES+qTsOQJgNSGOU1hsSf3Op0td+uxyMnlAPJDxmlTMHS0dV5ae42
 8BKaCE2rVNLZjMichtzE3/BkDfEFh8lBy/3gbrcN14MpyBFMFE22yvpZPm/M3nqEPn+wyU2Lv1f
 3SSqWiNrZ2eAqW5z4sA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX5HCoQnelNccE
 au9SyueikJvU/E/tQiSoMOha3KGgPXKmUdRUb6GCHbqzX1Vpv08luKNYaoCm2adG8o1N38U8n1l
 VY4czAYwuAiNDLjGcJ96svsScC5tnRw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132

Add perf driver for the gtrace similar to ARM Coresight and Hisilicon
PTT drivers. The driver adds 'gtrace' event descriptor which can be used
by the perf tool to record the trace data. The actual data format depends
on type of encoder device and optionally the PMU specific trace format
type.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig       |   1 +
 drivers/hwtracing/gtrace/Makefile      |   2 +-
 drivers/hwtracing/gtrace/gtrace-core.c |  15 +-
 drivers/hwtracing/gtrace/gtrace-perf.c | 347 +++++++++++++++++++++++++
 include/linux/gtrace.h                 |   3 +
 5 files changed, 366 insertions(+), 2 deletions(-)
 create mode 100644 drivers/hwtracing/gtrace/gtrace-perf.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index de4a3b533591..e5b62d65e2fd 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -3,6 +3,7 @@
 menuconfig GTRACE
 	tristate "Generic Hardware Trace Support"
 	depends on OF
+	select PERF_EVENTS
 	help
 	  This framework provides an architecture-neutral kernel interface
 	  for hardware trace drivers. It builds a topological view of the
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 3e0c68d1b632..aa044fdc787b 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_GTRACE) += gtrace.o
-gtrace-y := gtrace-core.o
+gtrace-y := gtrace-core.o gtrace-perf.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 53a3679ba69f..102251f6a5a7 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -714,13 +714,26 @@ EXPORT_SYMBOL_GPL(__gtrace_register_driver);
 
 static int __init gtrace_init(void)
 {
+	int ret;
+
 	gtrace_init_type_idx();
 
-	return bus_register(&gtrace_bustype);
+	ret = bus_register(&gtrace_bustype);
+	if (ret)
+		return ret;
+
+	ret = gtrace_perf_init();
+	if (ret) {
+		bus_unregister(&gtrace_bustype);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void __exit gtrace_exit(void)
 {
+	gtrace_perf_exit();
 	bus_unregister(&gtrace_bustype);
 }
 
diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
new file mode 100644
index 000000000000..ed9155bbbdb7
--- /dev/null
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -0,0 +1,347 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cpumask.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/init.h>
+#include <linux/perf_event.h>
+#include <linux/vmalloc.h>
+#include <linux/percpu-defs.h>
+#include <linux/slab.h>
+#include <linux/stringhash.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+#include <linux/gtrace.h>
+
+#define GTRACE_PMU_NAME "gtrace"
+static struct pmu gtrace_pmu;
+static DEFINE_SPINLOCK(perf_buf_lock);
+
+/**
+ * struct gtrace_event_data - generic hardware trace perf event data
+ * @work:		Handle to free allocated memory outside IRQ context.
+ * @mask:		Hold the CPU(s) this event was set for.
+ * @aux_hwid_done:	Whether a CPU has emitted the TraceID packet or not.
+ * @path:		An array of path, each slot for one CPU.
+ * @buf:		Aux buffer / pages allocated by perf framework.
+ */
+struct gtrace_event_data {
+	struct work_struct work;
+	cpumask_t mask;
+	cpumask_t aux_hwid_done;
+	struct gtrace_path * __percpu *path;
+	struct gtrace_perf_auxbuf buf;
+};
+
+struct gtrace_ctxt {
+	struct perf_output_handle handle;
+	struct gtrace_event_data *event_data;
+};
+
+static DEFINE_PER_CPU(struct gtrace_ctxt, gtrace_ctxt);
+
+static void *alloc_event_data(int cpu)
+{
+	struct gtrace_event_data *event_data;
+	cpumask_t *mask;
+
+	event_data = kzalloc_obj(*event_data);
+	if (!event_data)
+		return NULL;
+
+	/* Update mask as per selected CPUs */
+	mask = &event_data->mask;
+	if (cpu != -1)
+		cpumask_set_cpu(cpu, mask);
+	else
+		cpumask_copy(mask, cpu_present_mask);
+
+	event_data->path = alloc_percpu(struct gtrace_path *);
+	return event_data;
+}
+
+static void gtrace_free_aux(void *data)
+{
+	struct gtrace_event_data *event_data = data;
+
+	schedule_work(&event_data->work);
+}
+
+static struct gtrace_path **gtrace_event_cpu_path_ptr(struct gtrace_event_data *data,
+							int cpu)
+{
+	return per_cpu_ptr(data->path, cpu);
+}
+
+static void free_event_data(struct work_struct *work)
+{
+	struct gtrace_event_data *event_data;
+	struct gtrace_path *path;
+	cpumask_t *mask;
+	int cpu;
+
+	event_data = container_of(work, struct gtrace_event_data, work);
+	mask = &event_data->mask;
+	for_each_cpu(cpu, mask) {
+		path = *gtrace_event_cpu_path_ptr(event_data, cpu);
+		gtrace_destroy_path(path);
+	}
+	free_percpu(event_data->path);
+	kfree(event_data);
+}
+
+static void *gtrace_setup_aux(struct perf_event *event, void **pages,
+			       int nr_pages, bool overwrite)
+{
+	struct gtrace_event_data *event_data = NULL;
+	struct page **pagelist;
+	int cpu = event->cpu, i;
+	cpumask_t *mask;
+
+	event_data = alloc_event_data(cpu);
+	if (!event_data)
+		return NULL;
+
+	INIT_WORK(&event_data->work, free_event_data);
+	mask = &event_data->mask;
+	/*
+	 * Create the path for each CPU in the mask. In case of any failure skip the CPU
+	 */
+	for_each_cpu(cpu, mask) {
+		struct gtrace_component *src;
+		struct gtrace_path *path;
+
+		src = gtrace_cpu_source(cpu);
+		if (!src)
+			continue;
+
+		path = gtrace_create_path(src, NULL, GTRACE_COMPONENT_MODE_PERF);
+		if (!path)
+			continue;
+
+		*gtrace_event_cpu_path_ptr(event_data, cpu) = path;
+	}
+
+	/* If we don't have any CPUs ready for tracing, abort */
+	cpu = cpumask_first(&event_data->mask);
+	if (cpu >= nr_cpu_ids)
+		goto err;
+
+	pagelist = kcalloc(nr_pages, sizeof(*pagelist), GFP_KERNEL);
+	if (!pagelist)
+		goto err;
+
+	for (i = 0; i < nr_pages; i++)
+		pagelist[i] = virt_to_page(pages[i]);
+
+	event_data->buf.base = vmap(pagelist, nr_pages, VM_MAP, PAGE_KERNEL);
+	if (!event_data->buf.base) {
+		kfree(pagelist);
+		goto err;
+	}
+
+	event_data->buf.nr_pages = nr_pages;
+	event_data->buf.length = nr_pages * PAGE_SIZE;
+	event_data->buf.pos = 0;
+	return event_data;
+err:
+	gtrace_free_aux(event_data);
+	return NULL;
+}
+
+static void gtrace_event_read(struct perf_event *event)
+{
+}
+
+static void gtrace_event_destroy(struct perf_event *event)
+{
+}
+
+static int gtrace_event_init(struct perf_event *event)
+{
+	if (event->attr.type != gtrace_pmu.type)
+		return -EINVAL;
+
+	event->destroy = gtrace_event_destroy;
+	return 0;
+}
+
+static void gtrace_event_start(struct perf_event *event, int flags)
+{
+	struct gtrace_ctxt *ctxt = this_cpu_ptr(&gtrace_ctxt);
+	struct perf_output_handle *handle = &ctxt->handle;
+	struct gtrace_event_data *event_data;
+	int cpu = smp_processor_id();
+	struct gtrace_path *path;
+
+	if (WARN_ON(ctxt->event_data))
+		goto fail;
+
+	/*
+	 * Deal with the ring buffer API and get a handle on the
+	 * session's information.
+	 */
+	event_data = perf_aux_output_begin(handle, event);
+	if (!event_data)
+		goto fail;
+
+	if (!cpumask_test_cpu(cpu, &event_data->mask))
+		goto out;
+
+	event_data->buf.pos = handle->head % event_data->buf.length;
+	path = *gtrace_event_cpu_path_ptr(event_data, cpu);
+	if (!path) {
+		pr_err("Error. Path not found\n");
+		return;
+	}
+
+	if (gtrace_path_start(path)) {
+		pr_err("Error. Tracing not started\n");
+		return;
+	}
+
+	/*
+	 * output cpu / trace ID in perf record, once for the lifetime
+	 * of the event.
+	 */
+	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
+		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
+		perf_report_aux_output_id(event, cpu);
+	}
+
+out:
+	/* Tell the perf core the event is alive */
+	event->hw.state = 0;
+	ctxt->event_data = event_data;
+	return;
+fail:
+	event->hw.state = PERF_HES_STOPPED;
+}
+
+static void gtrace_event_stop(struct perf_event *event, int mode)
+{
+	struct gtrace_ctxt *ctxt = this_cpu_ptr(&gtrace_ctxt);
+	struct perf_output_handle *handle = &ctxt->handle;
+	struct gtrace_event_data *event_data;
+	int ret, cpu = smp_processor_id();
+	struct gtrace_path *path;
+	size_t size;
+	u64 format;
+
+	if (event->hw.state == PERF_HES_STOPPED)
+		return;
+
+	if (handle->event &&
+	    WARN_ON(perf_get_aux(handle) != ctxt->event_data))
+		return;
+
+	event_data = ctxt->event_data;
+	ctxt->event_data = NULL;
+
+	if (WARN_ON(!event_data))
+		return;
+
+	if (handle->event && (mode & PERF_EF_UPDATE) && !cpumask_test_cpu(cpu, &event_data->mask)) {
+		event->hw.state = PERF_HES_STOPPED;
+		perf_aux_output_end(handle, 0);
+		return;
+	}
+
+	/* stop tracing */
+	path = *gtrace_event_cpu_path_ptr(event_data, cpu);
+	if (!path) {
+		pr_err("Error. Path not found\n");
+		return;
+	}
+
+	if (gtrace_path_stop(path)) {
+		pr_err("Error. Tracing not stopped\n");
+		return;
+	}
+
+	event->hw.state = PERF_HES_STOPPED;
+	if (handle->event && (mode & PERF_EF_UPDATE)) {
+		if (WARN_ON_ONCE(handle->event != event))
+			return;
+		spin_lock(&perf_buf_lock);
+		ret = gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &format);
+		spin_unlock(&perf_buf_lock);
+		WARN_ON_ONCE(ret);
+		if (READ_ONCE(handle->event)) {
+			/* Tag the AUX data with the format reported by the sink. */
+			perf_aux_output_flag(handle, format);
+			if (size > handle->size) {
+				size = handle->size;
+				perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
+			}
+			perf_aux_output_end(handle, size);
+		} else
+			WARN_ON(size);
+	}
+}
+
+static int gtrace_event_add(struct perf_event *event, int mode)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	int ret = 0;
+
+	if (mode & PERF_EF_START) {
+		gtrace_event_start(event, 0);
+		if (hwc->state & PERF_HES_STOPPED)
+			ret = -EINVAL;
+	} else {
+		hwc->state = PERF_HES_STOPPED;
+	}
+
+	return ret;
+}
+
+static void gtrace_event_del(struct perf_event *event, int mode)
+{
+	gtrace_event_stop(event, PERF_EF_UPDATE);
+}
+
+PMU_FORMAT_ATTR(event, "config:0-0");
+
+static struct attribute *gtrace_pmu_formats_attr[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+
+static struct attribute_group gtrace_pmu_format_group = {
+	.name = "format",
+	.attrs = gtrace_pmu_formats_attr,
+};
+
+static const struct attribute_group *gtrace_pmu_attr_groups[] = {
+	&gtrace_pmu_format_group,
+	NULL,
+};
+
+int __init gtrace_perf_init(void)
+{
+	gtrace_pmu.capabilities	= (PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE);
+	gtrace_pmu.attr_groups		= gtrace_pmu_attr_groups;
+	gtrace_pmu.task_ctx_nr		= perf_sw_context;
+	gtrace_pmu.read		= gtrace_event_read;
+	gtrace_pmu.event_init		= gtrace_event_init;
+	gtrace_pmu.setup_aux		= gtrace_setup_aux;
+	gtrace_pmu.free_aux		= gtrace_free_aux;
+	gtrace_pmu.start		= gtrace_event_start;
+	gtrace_pmu.stop		= gtrace_event_stop;
+	gtrace_pmu.add			= gtrace_event_add;
+	gtrace_pmu.del			= gtrace_event_del;
+	gtrace_pmu.module		= THIS_MODULE;
+
+	return perf_pmu_register(&gtrace_pmu, GTRACE_PMU_NAME, -1);
+}
+
+void __exit gtrace_perf_exit(void)
+{
+	perf_pmu_unregister(&gtrace_pmu);
+}
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index bc82814e2738..439e2f091d4d 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -317,4 +317,7 @@ static inline void gtrace_unregister_driver(struct gtrace_driver *gtdrv)
 		driver_unregister(&gtdrv->driver);
 }
 
+int gtrace_perf_init(void);
+void gtrace_perf_exit(void);
+
 #endif /* __LINUX_GTRACE_H__ */
-- 
2.43.0

