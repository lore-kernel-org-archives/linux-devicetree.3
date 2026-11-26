Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686992;
	b=VxhFG+dXVVRyB/6h96g5768WTfUL/LZMpqrYl0rczhdeOjYpvjBMMec2Z3nMAOYTDJNs
	 2cAxZztr5I7oCPqlwQ3uW6+/K+GPYwVaQ4lCR4vPSAaLEnwoUzl0DoPv+jtB9K68WCZe0
	 UAXLZslOiqjgpOCOa4JglO//+8molnPtmILERChx8jPqedvlL0BVA5L7HNLOa9SZJGrCp
	 P8pjFVSG5zUr6EAFH3DAaBXpvByJGulDFGKPih+lQIexx7jDxiwftzeZDvOVxTVQYG8Bg
	 nkdX5+hKB/+AJVs8hLzvfSo/a3o2EP10tknHEaPrA7xXSLbZ3Z32xd7ZCuAYPq3JW5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rXYnq/FMsaO0wy/3wLLDl97ZH6IKPomcYTZ4KmGBeUc=;
	b=KVmoWlXMCzUVwOh1ZMLnetwO/ixSZz07VpnScf3m9SfY4A8/OFlB8KLLNmNSmAJXYjkk
	 +sIe97SMwQpRSSfNw/vfYc8SRXF+f2khCKti1puotzVplXoDyGHuJDFavVz/t0BkK2uVR
	 uqAbhP+zOzJWNC7qLT2rhNUh40lBB7DM7Tv0DYzuUyhAcBnpurKgyD3axflIu7Z4PV5la
	 jaO0wfHrrtH1rpEU+K9msr0dVyEIK0ZO0Nb+qHcIY788LgeVOwF/PHhpfr963ns6iGuLl
	 klybkZ0+nEh2OjE3kIoIIfoLGIndDZ67lXJeAsjB0RhNWOR5DdpaOOrOY0xufky5hAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bjemo1Jk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDVQUtJf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47538606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47538606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bjemo1Jk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDVQUtJf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8oipt3537784
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rXYnq/FMsaO
	0wy/3wLLDl97ZH6IKPomcYTZ4KmGBeUc=; b=Bjemo1JkjtvGIptSoufg5Z8swpI
	4LxdmRgrR+deEScb9VDujE5NyB4i/x3hu2TmI1RhZjze4DuQbFC9GUbrtrbla9AQ
	B62j2V35OZIt8I6+gipMrWQCUnJgNDxZ/dnOvOzXtUycmFwmUF8OCrTIu4QBo1Ri
	Fo5lIYSqbOkliwDqMvXVPuBtFc/NDu3bqrUo9WmC5faEq5VOeNza3jf+oN+3+5Ms
	hxftphfUJbh9yDqE+bkVQzcCYz5VfPu3o/sCWVoTpwMx6v6aMfUSfXd9eIT8/e2t
	ODeo/1YmhTVzVzdmjTnRgTKxm6yvMXDCBrP08Mqex97+VvPh5/bwoF5gCKw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm8093x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:56:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so1578275a12.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686990; x=1796291790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXYnq/FMsaO0wy/3wLLDl97ZH6IKPomcYTZ4KmGBeUc=;
        b=LDVQUtJf88krQvbOb83JKgNbuSHg+CHTYBz9mS3go5ijFXj8NA9YVb33QFOugbdg3c
         ZDkqg3y/e3lxsR36jCG8frYOmNmsH6kWFyvYDikwcH5JhKDjBvoFjT3t2PU8Yw9CWgOP
         moCok/4GNHm9eQTJGOWGsPPC+/bflrFYkHHOUDhenAptz+MmR0xKn1R30CxVPxsAMv8Y
         rHKnn6DFCVp1eAUSEttIb1fjHYevhaaNAUTctrqu4jrn3MSvSEhLYSjARIQgbtfX1vZZ
         OsCQ7xM5Ka+fY3x1HVJn0dVGlQJDW0KGi821vY3ubOSa+mBMn/eV/ZmnzLlJwXwstni2
         YnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686990; x=1796291790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rXYnq/FMsaO0wy/3wLLDl97ZH6IKPomcYTZ4KmGBeUc=;
        b=Jiq/fHst3JRch9t9Ga9/VTO3+DLkBfcC5uy0bE+AJKRbKb8i5Y5A0NvFrRdh/bR3ic
         1Vk7UER/zjsWk3oAnKXHP+q87WKW02BmBC9OCSgYx5Xw3do+M0ZOjI3j4fQ4dvlG6ALn
         JcJmdl38iw/q5RjmOOykMIZYTxH2ktwa14C+KfGBp8AvOc+l56PTVFY2NPktUH0GzBdy
         UWfGG7REuxu3HaOvPweJGj6osKCmObnsR4yEfSB+JRfg94hNzABCLT3Cke3a5PeT0GlR
         UyA9kl9AUPl/MkW5OajpFHc8f7B6BMBXNRMAtAWbKXkFfbOmWSPfLEsZMblAOntJpPrx
         ZCjg==
X-Forwarded-Encrypted: i=1; AL+hErEMH8dsYg21Z4PuAlmHIMJ6My4/oyx77PzOGfQi4BEk0ZAIVgrTJ3o6qyic28kmuwZvxkbuM0vAGWuj@vger.kernel.org
X-Gm-Message-State: APuU4Z+WFlPAHkEoiexhx5DRX0iKaGrBbgkK3OJl1xhNuru10ygIYzSo
	VWptqkXhDjj5hkvNDJHiMVkxJ4fL+093HuHXFGFLTI7ZsAmG9U6TRYJE6tPJZnRnHPfgWFPhHuR
	0iS8vVE0InF3fMvihOU6mGt0VrlvZzSBVEHCMmhctLtOiARFflQs9xk24OGbZKK5Q
X-Gm-Gg: AZFdTZcQx6jkl3Yd58Gqaajcumk7EdXoZVc3XFBoxuhlFdhmaDw1Yo0WrpyWgWIDKPX
	w6kHZx/EC1ObmsT+hsg8m1aamebKhL2LfDYG/zWbfPzrjd9FhRjKc+hxOQhdgLnCj/g4ghzP7lJ
	weYqsSEuBM1PWy+o+7i7C0jO+exPYw4TgEnIrSEfyeczkbVLn6iH0+QMC5nZF1shtute/ucnORU
	fTt7zCe/FlaM/sczLW//0/lnL+303gWqddN0sGUAN4TBL2v///cifqvWkiqBwVVd932bqssL6FZ
	mWd69dUbeddA2/SyK7NVAz0iVQTDc+sxjSDec2yqts2+Y9+UKFJtYohJGObZCFulSDvDSUvYA7h
	cWVRoeHrer9fSHt0h/oSDpx95y6ZUduB2FmM35gPJCf7Ww5sMMDCAfk/cXcMaqQwUnGatqGD8bu
	6S4aVCOiiHDX4gtPhNjKf8SEnkYYE9wrLVxLmCEzW1FKNOitw3sNNqoC4UMr3epUUNQEP0YwxlW
	Q==
X-Received: by 2002:a17:90b:17cb:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b41c9bc517mr21125788a91.67.1795686989997;
        Thu, 26 Nov 2026 01:56:29 -0800 (PST)
X-Received: by 2002:a17:90b:17cb:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b41c9bc517mr21125768a91.67.1795686989539;
        Thu, 26 Nov 2026 01:56:29 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:29 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 04/14] gtrace: Add functions to create/destroy a trace component path
Date: Thu, 26 Nov 2026 15:25:25 +0530
Message-ID: <7647f6d7e4435523423e5e392131f102da8ca56d.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Zr4d2nW8xBEm99_98ot5Nx-tOWefHESX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX7txir+ER8+Pz
 N2M4XkbjGc2f8iM6YB0ae4Mb+OFGm+59ccHNa5nm22gsLce/sX/LyugUPCgbvrjCiXqEqUrKizk
 vmsVpjpu/1XNyJUuwXMQUo02JkBc2QU=
X-Proofpoint-GUID: Zr4d2nW8xBEm99_98ot5Nx-tOWefHESX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX/+Zxt0kCDDuL
 HtWAUjaebKzL0ivV4+GTZyQVieXvXjqnujZT3kpvYVRN/8fVPVzBjjjUR4RQOzoGD+MiEWHcM/i
 dfELBygIDjszkPLH3S0qeV/2cOTlDULe8l6Y8befOGJ5rPCdxfKhCoCtTliZchHtlaoq0LFgZdv
 xhdsWQyAC5GRGvUzAtRZx91C9StzRR5eTyILeiaSA22UegEHXjSYBo85X8FC9dHHrTtiUGY78RU
 +wuVbYMGlEodrvkF3p24sSLvPOm8ey9V+Ba8MzdUguR4Dc+A5996LzQoHuiza9+XoRc5BYIm8Df
 I+YGZNk+lNo2zjSRZFKqgI0ng+0WjuRD81o2nOHFGkl1cUjc1i7tvmwCE+0JJpomjLHQ5SQe/Gi
 A9teldapoMvfQ+wmkDNDFkPReVn6OQUSWAbjz2k9wNd0FAhfFCdN08XT67H2gS2xjjBebUYvwep
 ebVQAyOdRoC83ZZV3Sg==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08024f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Z2DXsEUlK3EcHYVHAYUA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

From: Anup Patel <anup.patel@oss.qualcomm.com>

Trace needs to be configured on a chain of trace components which are
connected to each other. These chain of components is also referred
to as trace component path. Add functions to create/destroy a trace
component path which will be later used by gtrace perf support.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 257 +++++++++++++++++++++++++
 include/linux/gtrace.h                 |  27 ++-
 2 files changed, 283 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 57554d5eb98d..728235fc9bfe 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -26,6 +26,7 @@ struct gtrace_comp_priv {
 	struct gtrace_component comp;
 	u32 type_idx;
 	bool ready;
+	bool visited;
 };
 
 #define to_gtrace_comp_priv(__comp)	\
@@ -230,6 +231,62 @@ int gtrace_reset_component(struct gtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(gtrace_reset_component);
 
+static int __gtrace_walk_output_components(struct gtrace_component *comp,
+					   bool *stop, void *priv,
+					   int (*fn)(struct gtrace_component *comp, bool *stop,
+						     struct gtrace_connection *stop_conn,
+						     void *priv))
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	struct gtrace_connection *conn, *stop_conn = NULL;
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int i, ret;
+
+	if (cpriv->visited) {
+		dev_err(&comp->dev, "loop detected, please fix the firmware\n");
+		return -ELOOP;
+	}
+	cpriv->visited = true;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		ret = __gtrace_walk_output_components(conn->dest_comp, stop, priv, fn);
+		if (ret) {
+			cpriv->visited = false;
+			return ret;
+		}
+
+		if (*stop) {
+			stop_conn = conn;
+			break;
+		}
+	}
+
+	ret = fn(comp, stop, stop_conn, priv);
+	cpriv->visited = false;
+
+	return ret;
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
 	struct gtrace_component *comp;
@@ -496,6 +553,206 @@ void gtrace_unregister_component(struct gtrace_component *comp)
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
+		device_lock(&comp->dev);
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+
+		if (!gtdrv || !gtdrv->get_trace_id) {
+			device_unlock(&comp->dev);
+			continue;
+		}
+
+		trace_id = gtdrv->get_trace_id(comp, path->mode);
+		device_unlock(&comp->dev);
+		if (trace_id == -ENODATA)
+			continue;
+		if (trace_id < 0)
+			return trace_id;
+
+		path->trace_id = trace_id;
+		return 0;
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
+	if (path->trace_id == GTRACE_INVALID_TRACE_ID)
+		return;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		device_lock(&comp->dev);
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+
+		if (!gtdrv || !gtdrv->put_trace_id) {
+			device_unlock(&comp->dev);
+			continue;
+		}
+
+		gtdrv->put_trace_id(comp, path->mode, path->trace_id);
+		device_unlock(&comp->dev);
+	}
+}
+
+static bool gtrace_path_ready(struct gtrace_path *path)
+{
+	struct gtrace_comp_priv *cpriv;
+	struct gtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		device_lock(&node->comp->dev);
+		cpriv = to_gtrace_comp_priv(node->comp);
+		if (!cpriv->ready) {
+			device_unlock(&node->comp->dev);
+			return false;
+		}
+		device_unlock(&node->comp->dev);
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
+	/* Before proceeding, check that a valid path was built. */
+	if (list_empty(&path->comp_list)) {
+		ret = -ENODEV;
+		goto err_release_path_nodes;
+	}
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
index 46264c775efb..562cd1eca162 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -269,6 +269,10 @@ int gtrace_enable_component(struct gtrace_component *comp);
 int gtrace_disable_component(struct gtrace_component *comp);
 int gtrace_reset_component(struct gtrace_component *comp);
 
+int gtrace_walk_output_components(struct gtrace_component *comp, void *priv,
+				  int (*fn)(struct gtrace_component *comp, bool *stop,
+					    struct gtrace_connection *stop_conn,
+					    void *priv));
 struct gtrace_component *gtrace_cpu_source(unsigned int cpu);
 
 struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
@@ -280,13 +284,34 @@ void gtrace_release_outconns(struct gtrace_platform_data *pdata);
 int gtrace_of_parse_outconns(struct gtrace_platform_data *pdata);
 int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata);
 
+/**
+ * struct gtrace_path - Representation of a trace path from source to sink.
+ * @comp_list: List of trace components in the path.
+ * @mode:      Usage mode for trace components.
+ * @trace_id:  Hardware source ID, or GTRACE_INVALID_TRACE_ID if none is supplied.
+ */
+struct gtrace_path {
+	struct list_head		comp_list;
+	enum gtrace_component_mode	mode;
+	u32				trace_id;
+#define GTRACE_INVALID_TRACE_ID	U32_MAX
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
  * @id_table:      Table to match components handled by the driver, terminated
  *                 by GTRACE_COMPONENT_TYPE_NONE.
  * @probe:         Driver probe() function.
  * @remove:        Driver remove() function.
- * @get_trace_id:  Get/allocate a trace ID.
+ * @get_trace_id:  Get/allocate a trace ID. Returns a nonnegative ID, -ENODATA
+ *                 if this component supplies no ID, or another negative error.
  * @put_trace_id:  Put/free a trace ID.
  * @driver:        Device driver instance.
  */
-- 
2.43.0

