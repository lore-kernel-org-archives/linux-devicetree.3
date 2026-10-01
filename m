Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C2C42DA33
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832248; cv=none; b=tCgqLyO5NUOfpd+clrzqdt/XvWw+P0Oee2Zmp0ev7+5SXNNePs2FZBl0s06zIpjBtaSVTrLEtgB672eNl+k/jHrxclNPAPXcyWZQv/cQ8q4oMjH6U7Hs5Dcgrni6/rUSt/Ox/nYvh1Lzd7iDQ5bKH3P5H0TDFkxoCC6jB2VIlqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832248; c=relaxed/simple;
	bh=Tr7tAKiVKAx+CiKpmUJ0G5oOvXKJSNwK5ZsS3+Oo3+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/WWC3mVN+hvZcCTgc6XSIA2cb8Fr6kgYx4en8+6hkJlHXkB7Jaq71j/bgE3EGDQHoy2mmLIgwr+4+N4hk0JTnXHBoXoG4uNLECgXSC6dfE8bWXD54g/qm/teTifHStSvJjNOzjbW83sD2YpgsU5rJeQEMEpZjqmGh+3WGj4GaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzKcGLko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIHsMCKB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzKcGLko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIHsMCKB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gPwh1914608
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 05:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hdmJBOURZFk
	lDL2G+CgifetZhhumtO7AZp3GzGIPueQ=; b=pzKcGLkoAGuQyphMlTQGjDL5nHr
	RUGVSK6PwFnL6jcgXJvVsOhumo6LKovj/FJEiwMafqQVd6NaxgJ2Ux3FiYWYL6l0
	0xjszU2WBrX0xs2CzpRtdIIrIw8Ca4zkF5kPuipwyLZpfOvF4RM3u2QSkG3h+4xk
	ctfVyXKIFmQI2n4iaMFaU0CT4DYUN7dbPLmtZ/hjLsKbovmRZogqzGeQwt9Nlzke
	ZJptSenFJBxmbZQMtu+oaiNM7zp10QNaqQrpIxKnrHeRFwlRfW2iImiy+UsToqHY
	XnS7Ebnr2OQvKoWT7kLy25FN2FSl7HB71ZKAsFJPdzsxrlsvGw2G+/kQ6tA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n233dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:24:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e2dc7312e5so15341175ad.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 22:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832245; x=1791437045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdmJBOURZFklDL2G+CgifetZhhumtO7AZp3GzGIPueQ=;
        b=gIHsMCKBpxo9YmZpmkJJbKfOfHTEVA+hBgTjWWcWHc/I0F5m5o7kSp9JK2SIaqFpyu
         9W12stCW3MwmoqrXlHIq+/53B0uGbN2Q7HgnfV8tXaxgYnbJiZVsvERvyPU2AYRCUCTJ
         Ftnfgybe2BLRg3ojgBPnj5N0i3AsBRmn0mSQxfQBZWfyQuqtMWuytfA9x0rfYPkkwu5n
         BLpgO2wJ3lbgbJ9AW5U0SuN+uMSKg1xy1Loh1DOzE+bNC89FlRr1b/Z3o7Jd6uKKwNXG
         G5zGy+s2kwJczPwchgzqhWZlh51xsiAakZzL+76j34ByqjbIQcflmcy6qAhBV4Tw6BFm
         uVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832245; x=1791437045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdmJBOURZFklDL2G+CgifetZhhumtO7AZp3GzGIPueQ=;
        b=CmphVmlarRv5zHSZXjn65nFi4xMliRr7eXsz/0pHWy5YuQcdNsPNmsvwZuVk2GPAaj
         CDYz3eZaPkrdLvbOUqyMgAi2vbH3GcOoiVIFl+wwIqkS9QNY4THLz7XBXf1Pjn/9RYSa
         5PUzKbxslCfpO7ykT9q3RxD37M6o+MgYCtkA/L+d7YFqIqAR7DTQCDMoyAo7RFgSraNv
         8QWhQD3WtxppyvZNxjpVUb+htVApozkzJibRpvtrnZxpoTpxAsYNmnZ0xdvH2j7e0PYt
         7oyPvj5eJBBQabOlN5wCc6fVP/qnXqJVHmyKNfQJTOYwLlkR5mzh7w53YURbCtCjK4MP
         jiRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL0KZLGsd4gfXM+fBgte6pb7+mwTOZtR2XB0WK+G2XBFPXl2oF7gb4toLsjPHTAuENXw3+ls13HBIb@vger.kernel.org
X-Gm-Message-State: AFq9FYLp8+4Y6AMZxFh35zCxB5Pq8hGzJputYKmCJhm/IBCHMVlLGZPC
	J0E0KEQQBW+WDJhLlVLHdavblIlSJWZsbQFQxZBr6s6X+Lutcr9GROVHZw5V2VLwQJ3U2s3R02c
	hnltaCNZIownw7AuOjH0xrFpIQs50K5LrIxeDAF3Df9hODJ+otjwx3wV+O3n0L9zb
X-Gm-Gg: AYBFou1eyzZKkcWdEkspnBOiJlyVmzdpUHZrOvYSJAosgLEZmSkd5iUEaWPSI0MSZUE
	hJB+sagafmhxfGZwQ0bBu7yqL9oU87cUfoIAFzy1iJYv2fj0u34J4mFl9OuhSHfxWuJs72aB82g
	unZ6B+dPYAgs5GG5dXkseGOFSYxPB1rsfeLZMFkmsYZCazePYqvMEYW4owYLt/cOBOqeGnrAZHn
	CQZcbRRcdQUIYZBo/zAzha5eg0Sg7j6yZr27GHp8iG9zVYichPZn6Y8nFOTcivJxZ1uODjqinWK
	zNYAr25uFtttssNQKh4I025KLJibUPkjGZdTq0ecEffnN340InsGj6+GaU3FyIf6xXb7cjkE4eQ
	3as5GNcwRYNkE7ZQmmgvlTJW9kWDsvGBzINZSQGc2P5tWU6b/2GEbYaYyR7AT+5u1J/OuY4kJFU
	7dwJbPIhmh/yeRrKufi1OQ7wj8
X-Received: by 2002:a17:902:d489:b0:2e2:c2a6:48bf with SMTP id d9443c01a7336-2e2e4b33993mr27534015ad.26.1790832244431;
        Wed, 30 Sep 2026 22:24:04 -0700 (PDT)
X-Received: by 2002:a17:902:d489:b0:2e2:c2a6:48bf with SMTP id d9443c01a7336-2e2e4b33993mr27533625ad.26.1790832243901;
        Wed, 30 Sep 2026 22:24:03 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:03 -0700 (PDT)
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
Subject: [PATCH v6 05/14] gtrace: Add functions to start/stop tracing on a component path
Date: Thu,  1 Oct 2026 10:52:16 +0530
Message-ID: <20261001052243.3042627-6-mayuresh.chitale@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abdee75 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Be7mbbALSbNoa8F8jQ8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX5UJdwF+VMvwT
 BMGacBmmrutzc/ZlKFco1i5Y2qtAwHYdYD5ngASsAr9YXyQIrGQFOUAwFjttyxwjj0Uk2TjMnCE
 fqw+QouHKaG85uxCIVRmlSehlVT6aKU=
X-Proofpoint-GUID: M3RKxwAYY3MMhy2nd5g25LbdjOJxZAf_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXysoWdJ7FS5G+
 W5WMUqakEID+d05fWp97WH4nRFqJkLnygoTJim5x32UxpXcld9lrea/jEb+R0UEb+O2dy9ZB8Xx
 3Ouu96U9hHnxcp7H2Fz50QoWsw1x+MYbVjCsZDX1dSyAJqcvzHNenU4HkUUmEiCUm++WkaXjhnK
 BatUyauKOepnN149RoAzOiwYABCHnuzsZDAIwhjScGr2KIazkFG9X4jLueqUfn/YmJ8eNq3WsD9
 BZtD/4RE5jI+24NJKUGaxu3s7ClMi3ahbwr6A5i8XG+sDKS9Nshgf1fBqtUIOBas3JjrW1HCzNy
 tgKzqZ1yEsxZ5UwG1qPNAnJzQ/SqRXXNbgs9WkzBHoRsrzUkZvE6zCCD76Gyvvh8JII849N7/4u
 SmiiaFqp0y2j/4eQLL9GbMzWLCbrn6EBpy8nRBnJmMoPa7ZO0j/IBFBhmsAuAxnCJPD6ZIQkmpB
 H44Vj6wuI66NGFIfwaA==
X-Proofpoint-ORIG-GUID: M3RKxwAYY3MMhy2nd5g25LbdjOJxZAf_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021

The perf driver framework needs to be able to start / stop all components
in a trace component path during its operation. Add gtrace_path_start()
and gtrace_path_stop() functions for this purpose.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 104 +++++++++++++++++++++++++
 include/linux/gtrace.h                 |   7 ++
 2 files changed, 111 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index f750025104ec..d7f1df90aa31 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/percpu.h>
+#include <linux/spinlock.h>
 #include <linux/xarray.h>
 #include <linux/gtrace.h>
 
@@ -24,7 +25,15 @@ static DEFINE_PER_CPU(struct gtrace_component *, gtrace_cpu_source_comp);
 /* gtrace comp specific data, to be used by core functions only */
 struct gtrace_comp_priv {
 	struct gtrace_component comp;
+	/*
+	 * Protects start_count and owner. Serializes start/stop against other paths
+	 * sharing this component and, for a sink, against gtrace_path_copyto_auxbuf().
+	 * Raw because the PMU start/stop callbacks are called with the rq_lock held.
+	 */
+	raw_spinlock_t lock;
 	u32 type_idx;
+	u32 start_count;
+	pid_t owner;
 	bool ready;
 	bool visited;
 };
@@ -418,6 +427,7 @@ struct gtrace_component *gtrace_register_component(struct gtrace_component_id *i
 		ret = -ENOMEM;
 		goto err_out;
 	}
+	raw_spin_lock_init(&cpriv->lock);
 	comp = &cpriv->comp;
 	comp->pdata = pdata;
 	comp->id = *id;
@@ -611,6 +621,100 @@ static void gtrace_release_path_nodes(struct gtrace_path *path)
 	}
 }
 
+static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owner)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(comp->dev.driver);
+	unsigned long flags;
+	int ret = 0;
+
+	if (!gtdrv)
+		return -ENODEV;
+
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
+	if (cpriv->start_count) {
+		if (cpriv->owner != owner) {
+			ret = -EBUSY;
+			goto out;
+		}
+	} else {
+		if (gtdrv->start) {
+			ret = gtdrv->start(comp);
+			if (ret)
+				goto out;
+		}
+		cpriv->owner = owner;
+	}
+
+	cpriv->start_count++;
+out:
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	return ret;
+}
+
+static int __gtrace_comp_stop(struct gtrace_component *comp)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(comp->dev.driver);
+	unsigned long flags;
+	int ret = 0;
+
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
+	if (!cpriv->start_count) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	cpriv->start_count--;
+	if (!cpriv->start_count) {
+		if (!gtdrv) {
+			ret = -ENODEV;
+			goto out;
+		}
+
+		if (gtdrv->stop)
+			ret = gtdrv->stop(comp);
+	}
+out:
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	return ret;
+}
+
+int gtrace_path_start(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+	int ret = 0;
+
+	list_for_each_entry_reverse(node, &path->comp_list, head) {
+		ret = __gtrace_comp_start(node->comp, path->owner);
+		if (ret)
+			break;
+	}
+
+	/* If a component failed to start, stop all the components that were started before it */
+	if (ret)
+		list_for_each_entry_continue(node, &path->comp_list, head)
+			__gtrace_comp_stop(node->comp);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_start);
+
+int gtrace_path_stop(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+	int ret = 0, err;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		err = __gtrace_comp_stop(node->comp);
+		if (err && !ret)
+			ret = err;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_stop);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 2c3be4d161c6..a4b99c87d250 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -254,6 +254,7 @@ struct gtrace_path {
 	enum gtrace_component_mode	mode;
 	u32				trace_id;
 #define GTRACE_INVALID_TRACE_ID	0
+	pid_t				owner;
 };
 
 struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
@@ -262,10 +263,14 @@ struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode);
 void gtrace_destroy_path(struct gtrace_path *path);
+int gtrace_path_start(struct gtrace_path *path);
+int gtrace_path_stop(struct gtrace_path *path);
 
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
+ * @start:         Callback to start tracing.
+ * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
  * @remove:        Driver remove() function.
  * @get_trace_id:  Get/allocate a trace ID.
@@ -274,6 +279,8 @@ void gtrace_destroy_path(struct gtrace_path *path);
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	int			(*start)(struct gtrace_component *comp);
+	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
 	void			(*remove)(struct gtrace_component *comp);
 	int			(*get_trace_id)(struct gtrace_component *comp,
-- 
2.43.0

