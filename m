Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E65417BDB
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375423; cv=none; b=tWHftu/8gWp4yihWhvWhreJiT85Yo5ah2Xc7kcg6p0LkqeM2GVConSLIACcGB8y0sZNKpXnXJ6hco9F/DhhJNbyZ5NbFeNSZn2lbf/KIou7D0TpPdowxaukvmiAIxpLEi74FO7Xbxi2dtBjxjzkzLe6G5f5KaqzebvjwLZjA4Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375423; c=relaxed/simple;
	bh=/qaIWdPczgfTg2JuUKchYXyLOX26UzBCYHfxx72y8UE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RF3c6ysujzow9RYTlFuFZf7WHQsWCBCGB8nvJGipFSnDr7L5sdiIdF4t/23Cj46Ev34qdDI4Z1s06Kib7naZ1LZhHm8bmI56XzWQm/+nhrE9FE7RZFakzhZgBIw4zUJFLf1WjfUaupnlQLxwa+IMpCVBXqww/fVpbfEq5dZwcZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X69xIKWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sr1Tj0Cu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X69xIKWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sr1Tj0Cu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj4IU1343182
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ppv6/+v9uVe
	vJFb5FIxPNtQrsBx+IieOd9pY+4ba1bM=; b=X69xIKWu6fWyQ+ZVwupH7YJO3nK
	ahBgH4pOCGfltc34ioXuUkM+fU+KQ6pkNe6HZfUMpWBrXHn8EuaebiIHpHUQKQjI
	V3Z1k6dmRY/YGzVeRsfG2uRhhs1/+EtMl9446pBW9TZSOCSReHqkm6pz78HxMyXV
	ppUbagr50tFFuAibSsQ7GpB1EaiapuN8cvySIub/tIzJ8ZfclJBVcFmARW2hdeAd
	ifafM02ZOKrqVoK8TiN2EVEqho9mOcNNQtyk3a8wuHtUW+yeIHdqVhOSkwGs0hPX
	ltho4+atljcoF/Nuap4FKLdKczGh+ib3mrCmKei9heFdwSuEEFzgIKTCltw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v5a790-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:23:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso3118984a12.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375420; x=1786980220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppv6/+v9uVevJFb5FIxPNtQrsBx+IieOd9pY+4ba1bM=;
        b=Sr1Tj0Cux+yvt9veVKh6/gB5sC60HNNkjdLiiNg2pbrvD/FevXGNVZUZ+4RYr6a5+u
         uWrpbqU8giiAfduWrR61qYJC/89dVoqPhsW6WhKWhsLT1Zo2BVHAbZRiY42ERPjHKmw8
         D+YY9SqXutzL5uC5vb6QnCdx1duHVfPgvy9SFdY9pSOaw9ni9TPR7m+UtdnfMAAeLFZJ
         RqSdtmwJLbXoTwOmi5I3NzYoVxrQsum6r/h3FLlnktL53akBXiiBLcbV7pVrHcVyYKl5
         B/b1kT0m1BD/0buJToiWBDkaEFVYP/vyuWy+gS/OyOYix9BEGFZmoQAR6y3mH9AgokoU
         CFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375420; x=1786980220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppv6/+v9uVevJFb5FIxPNtQrsBx+IieOd9pY+4ba1bM=;
        b=pqdoF6ZFtfZoZy/OdBMpqAs6N7rdgUulZwWHJ+UD2YolacOu3clqphKBI0WaOImKNE
         iw4dZpXcLK4OZSHrqoD1bKVCNDe7pEsWOHX3hoXDKSxlB7M65f/jpI1CJlQ9A+tIYxeJ
         sFHUzfVK2DKps5nplXeYWdWAtWWOGNEHbqZTQmQnZVxDEXwUvEVPeU6wspexqIxsR6aO
         h26FGiRW7NJMSvu6JRXxJSKzCX1tkQwZgoNiBeQgQoigIylabm6eDeX+D9LBp70Vq1jg
         0fdcwu70yJ1COxkOH1YH07bcaYr7vCh4v/NXkZCp63BxcGmLGODGBTNh3PNvqs6wWRhg
         K/Dg==
X-Forwarded-Encrypted: i=1; AHgh+RqWR9nUQG983l14fbJi4q5TEr8n/GLpASuOUQuWz6GQQPjQ2vmlU5xt73oD45Y8mZiS/r6PaV6x6Y84@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2v+QCqJ6unz4xDnkBN08yWcYjQqh6EvtKrV16s634cW9rYQCM
	U2fY6pfF7MlbCbkqPh1tBxn0nIaK+Uz3E8/okFBFFTpFgBD2wr3mZug5+u4JGhzIRiwkaS/Vyrq
	OigNjpu7/dTxcuz3Qi0EM4kHjYwyYFIT6f2rhtXCde8EC1gjQGswlix6RA+qOJGkH
X-Gm-Gg: AR+sD11OloxWyr/ltDlpPuNHv5dwUhWWyJzttZM3WFEyWfBuCNZm+YKU4Z+JgYIew2p
	ZCpwFSlNe8lOEq9zJaYSNDK1s/L9gs/hfXjKnlYbZ6yAEBRd3nu3VthXYsDvXeHVWjRZJH6Ostq
	SCvmcKu57QyPlFDkZw6u0cjPMVxtO/To0YmcSC6avSK8OOgtCkGZUCoKaBIBtNs+rIRyGv+4V7E
	fR7cL1VEk6UgARbE2qxxOfSFdUh3R2OKzZF29vKi7bXBrHn4ENAcFf1SKqj8KqlI9q5vY0ukmVx
	1dloIJyLWaRqt60SARpHlPSkuc102Ht2VvRpT3DlJIiHnXaIvvwYNVl2GWAbUeP9lbgSHdBR9VD
	zD5QgLrR9/g2Ai0nwPs8LXTFzdxBHE/FumaxfrR1cdat7pJyTWfVrcyQy/ujnUfsGYnP2SRAxfu
	kwOFkhYRaXEyLdRxDes67UMAPuYw==
X-Received: by 2002:a05:6a21:6e03:b0:3cb:9bb0:27a2 with SMTP id adf61e73a8af0-3cbce9e4f6cmr25124034637.34.1786375419853;
        Mon, 10 Aug 2026 08:23:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e03:b0:3cb:9bb0:27a2 with SMTP id adf61e73a8af0-3cbce9e4f6cmr25123911637.34.1786375419087;
        Mon, 10 Aug 2026 08:23:39 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:23:38 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [PATCH v5 04/14] gtrace: Add functions to create/destroy a trace component path
Date: Mon, 10 Aug 2026 20:52:06 +0530
Message-ID: <20260810152223.3946743-5-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX5tcEp7wyO9TV
 QsusQoHHmJ4Tupwp3kW1QhkObCQBqK4tIWCmsMOA/swhZjpnV7uTpK8nrv7n7oMwwCFi+jDc7Zf
 SjO4L6gFK2lGxaK48GFML4zftDlREM8=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79ecfc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=rnG_eT2C7D_P6d9BKjkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: tJxCY56yogcf-mEYUPJPXcBE0vH9J-sP
X-Proofpoint-ORIG-GUID: tJxCY56yogcf-mEYUPJPXcBE0vH9J-sP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX+L6W1zq+/igP
 VeUvPX0/bzkESBmHoVtsybfyHM613kBnQqmvo5JfUQFpBqfDH5OU/B+5rORXEnc8vAKM7dWayKv
 8cwNRjjul5z+E92xkcSdczcLE0efg9Tb6deFjV/cJY0s4imiSz2x9Uin6QEphbeEQoTQmRgPVP6
 RaNltrr8BLbDOozzP3yXnlvXlylzLMfjUl+Wcl/ovhyz+2dNaOwZItSwiHBLGCUm/W6B7UVN3RA
 ZQwDPoGx4G3v0Os0cGC3+PxEon3qQK/SeLCThkttoQc0fNOi7Bcf8fMOokaznImX2haD0s0HD68
 WV8me22WkO8sKmsVF/M9R+AlxQwIfH9DW6R2ZKK1PEIpUKC4c+3/5/pfs0HNyQ4QD8s2mkuFD+5
 K4wf9IG3Wm2EWym4abyuW3V9lPWeqTZfOQ8Sgh5d+A+NFQYYsVNsMvueoxKTrlkgwaE18dt9N5V
 WpolV1kxE4SJogNtuuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132

From: Anup Patel <anup.patel@oss.qualcomm.com>

Trace needs to be configured on a chain of trace components which are
connected to each other. These chain of components is also referred
to as trace component path. Add functions to create/destroy a trace
component path which will be later used by gtrace perf support.

Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 223 +++++++++++++++++++++++++
 include/linux/gtrace.h                 |  24 +++
 2 files changed, 247 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 97398f2b7cbb..a89d195ab5b8 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -210,6 +210,53 @@ int gtrace_reset_component(struct gtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(gtrace_reset_component);
 
+static int __gtrace_walk_output_components(struct gtrace_component *comp,
+					   bool *stop, void *priv,
+					   int (*fn)(struct gtrace_component *comp, bool *stop,
+						     struct gtrace_connection *stop_conn,
+						     void *priv))
+{
+	struct gtrace_connection *conn, *stop_conn = NULL;
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int i, ret;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		ret = __gtrace_walk_output_components(conn->dest_comp, stop, priv, fn);
+		if (ret)
+			return ret;
+		if (*stop) {
+			stop_conn = conn;
+			break;
+		}
+	}
+
+	ret = fn(comp, stop, stop_conn, priv);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int gtrace_walk_output_components(struct gtrace_component *comp, void *priv,
+				  int (*fn)(struct gtrace_component *comp, bool *stop,
+					    struct gtrace_connection *stop_conn,
+					    void *priv))
+{
+	bool stop = false;
+	int ret;
+
+	if (!comp || !fn)
+		return -EINVAL;
+
+	mutex_lock(&gtrace_mutex);
+	ret = __gtrace_walk_output_components(comp, &stop, priv, fn);
+	mutex_unlock(&gtrace_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_walk_output_components);
+
 struct gtrace_component *gtrace_cpu_source(unsigned int cpu)
 {
 	if (!cpu_present(cpu))
@@ -414,6 +461,182 @@ void gtrace_unregister_component(struct gtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(gtrace_unregister_component);
 
+struct gtrace_path_node {
+	struct list_head		head;
+	struct gtrace_component		*comp;
+	struct gtrace_connection	*conn;
+};
+
+struct gtrace_component *gtrace_path_source(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+
+	node = list_first_entry(&path->comp_list, struct gtrace_path_node, head);
+	return node->comp;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_source);
+
+struct gtrace_component *gtrace_path_sink(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+
+	node = list_last_entry(&path->comp_list, struct gtrace_path_node, head);
+	return node->comp;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_sink);
+
+static int gtrace_assign_trace_id(struct gtrace_path *path)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+	int trace_id;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+
+		if (!gtdrv->get_trace_id)
+			continue;
+
+		trace_id = gtdrv->get_trace_id(comp, path->mode);
+		if (trace_id > 0) {
+			path->trace_id = trace_id;
+			return 0;
+		} else if (trace_id < 0) {
+			return trace_id;
+		}
+	}
+
+	return 0;
+}
+
+static void gtrace_unassign_trace_id(struct gtrace_path *path)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+
+		if (!gtdrv->put_trace_id)
+			continue;
+
+		gtdrv->put_trace_id(comp, path->mode, path->trace_id);
+	}
+}
+
+static bool gtrace_path_ready(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		if (!node->comp->ready)
+			return false;
+	}
+
+	return true;
+}
+
+struct build_path_walk_priv {
+	struct gtrace_path		*path;
+	struct gtrace_component		*sink;
+};
+
+static int build_path_walk_fn(struct gtrace_component *comp, bool *stop,
+			      struct gtrace_connection *stop_conn,
+			      void *priv)
+{
+	struct build_path_walk_priv *ppriv = priv;
+	struct gtrace_path *path = ppriv->path;
+	struct gtrace_path_node *node;
+
+	if ((!ppriv->sink && gtrace_is_sink(comp->pdata)) ||
+	    (ppriv->sink && ppriv->sink == comp))
+		*stop = true;
+
+	if (*stop) {
+		node = kzalloc_obj(*node);
+		if (!node)
+			return -ENOMEM;
+		INIT_LIST_HEAD(&node->head);
+		gtrace_get_component(comp);
+		node->comp = comp;
+		node->conn = stop_conn;
+		list_add(&node->head, &path->comp_list);
+	}
+
+	return 0;
+}
+
+static void gtrace_release_path_nodes(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node, *node1;
+
+	list_for_each_entry_safe(node, node1, &path->comp_list, head) {
+		list_del(&node->head);
+		gtrace_put_component(node->comp);
+		kfree(node);
+	}
+}
+
+struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
+				       struct gtrace_component *sink,
+				       enum gtrace_component_mode mode)
+{
+	struct build_path_walk_priv priv;
+	struct gtrace_path *path;
+	int ret = 0;
+
+	if (!source || mode >= GTRACE_COMPONENT_MODE_MAX) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	path = kzalloc(sizeof(*path), GFP_KERNEL);
+	if (!path) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+	INIT_LIST_HEAD(&path->comp_list);
+	path->mode = mode;
+	path->trace_id = GTRACE_INVALID_TRACE_ID;
+
+	priv.path = path;
+	priv.sink = sink;
+	ret = gtrace_walk_output_components(source, &priv, build_path_walk_fn);
+	if (ret < 0)
+		goto err_release_path_nodes;
+
+	if (!gtrace_path_ready(path)) {
+		ret = -EOPNOTSUPP;
+		goto err_release_path_nodes;
+	}
+
+	ret = gtrace_assign_trace_id(path);
+	if (ret < 0)
+		goto err_release_path_nodes;
+
+	return path;
+
+err_release_path_nodes:
+	gtrace_release_path_nodes(path);
+	kfree(path);
+err_out:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(gtrace_create_path);
+
+void gtrace_destroy_path(struct gtrace_path *path)
+{
+	gtrace_unassign_trace_id(path);
+	gtrace_release_path_nodes(path);
+	kfree(path);
+}
+EXPORT_SYMBOL_GPL(gtrace_destroy_path);
+
 int __gtrace_register_driver(struct module *owner, struct gtrace_driver *gtdrv)
 {
 	gtdrv->driver.owner = owner;
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index e8ca2bd46e67..b74d4b83b141 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -224,6 +224,10 @@ int gtrace_enable_component(struct gtrace_component *comp);
 int gtrace_disable_component(struct gtrace_component *comp);
 int gtrace_reset_component(struct gtrace_component *comp);
 
+int gtrace_walk_output_components(struct gtrace_component *comp, void *priv,
+				  int (*fn)(struct gtrace_component *comp, bool *stop,
+					    struct gtrace_connection *stop_conn,
+					    void *priv));
 struct gtrace_component *gtrace_cpu_source(unsigned int cpu);
 
 struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
@@ -231,6 +235,26 @@ struct gtrace_component *gtrace_register_component(struct gtrace_component_id *i
 						   struct gtrace_platform_data *pdata);
 void gtrace_unregister_component(struct gtrace_component *comp);
 
+/**
+ * struct gtrace_path - Representation of a trace path from source to sink.
+ * @comp_list: List of trace components in the path.
+ * @mode:      Usage mode for trace components.
+ * @trace_id:  ID of the trace source (typically hart/CPU id).
+ */
+struct gtrace_path {
+	struct list_head		comp_list;
+	enum gtrace_component_mode	mode;
+	u32				trace_id;
+#define GTRACE_INVALID_TRACE_ID	0
+};
+
+struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
+struct gtrace_component *gtrace_path_sink(struct gtrace_path *path);
+struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
+				       struct gtrace_component *sink,
+				       enum gtrace_component_mode mode);
+void gtrace_destroy_path(struct gtrace_path *path);
+
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
-- 
2.43.0

