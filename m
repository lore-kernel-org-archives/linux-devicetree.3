Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EDF418373
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375452; cv=none; b=XULtw5wvHwpbG6WhGNrmKZm+9DtGMqbc4D4+BJO/RrvZ1GVFIkbJR1ySuXek94FxO1XcNW/X20Oee9Gcba473aa9mOzMlFoamz8R24FVW9jv8ehQII38ogkkPriryGTo83pNLtRg9Y3mJNLrOTl8Enros6T7h64FzpENKyRlrh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375452; c=relaxed/simple;
	bh=eo7S+d8ZiEB7Vx60jyef3VLs9lEX5txX5kILnQCzzUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5qKNhXlkaJjnY4DnymCZsvo5PeEXDTIBpG+8lTynsJqJwJw/8stWPzAp4B+QfF5W4pYgm9qbOwu0j+oDWuVQffk39icqVxp/VJp2XgLOFf+Asry2u/4AIrijxma2eHQTZ7h/XS0i9rRQuEbbLr3c0hKQLIJT7Fq5ZHA4KIN5fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2YqF+bn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXHt6m5p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2YqF+bn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXHt6m5p"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACioh7397251
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XI+TWSI9Lo5
	Uxa4GBWQbvSKGeik/xwrPtHlF4bh58q4=; b=K2YqF+bnIXCh1qAEk55VNI5le2w
	pXvJkXtVJAjM6TXEIbwBBsjbl/CkldxatBj0t7EFk2xB/5pndnIieN7pkgZ2uDif
	r+cY4PTUFfrg3NLXzqhQOjAenfeSqyT1AqVaMNpPjTFiPecnRyHPFePFmUqcL5me
	A0UZJFZ+BsN2MCt1snvE8jV/eYNB3TOfy5vt+AOBCfhI7RMzr7LJ72/TZB5AWnG0
	bU+4b1W2HnM4EsGDFBUfFODUR2qGs+Qwe5BWFvo3X9UVymnXGtnFOvfNyiAGS1ES
	c6EOMLMKHZIodhDxEhHNatLk/8senGvFFFdQf8w11oMSZQp3mSb1ZxNpmCw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycgesbh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e04598adeso1728723b3a.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375447; x=1786980247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XI+TWSI9Lo5Uxa4GBWQbvSKGeik/xwrPtHlF4bh58q4=;
        b=EXHt6m5pr5IHWoeBVsILUEUmlG/cDX46TbI5OfGEDDykgpbKBF2zFF0IRiPrAtLvVJ
         XpS/XAvO0TxPKKe6Gx1GFDrocGTWMd5EsdanHe2UixSVgxD/iWbAj/KnuzN8J/Nvsgyz
         O6cd/BJD5IhCeyxzKE1hamFNckq0Tb4bv90LvqG6TnB5VrMmfXuazO0eUaBMHjo98acz
         ztxoJVnro5xEy2XbLl91vWBnQiz8jgjI+xzYnp35MD3ulxHWwwdExv2iPe7THRHxXvvz
         dVUvqXQjD2fSf/msueM7EKqesY33BwFAWNm7pr2CATFTGW7e8J+FDwX2KY84NPokEmHS
         Q7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375447; x=1786980247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XI+TWSI9Lo5Uxa4GBWQbvSKGeik/xwrPtHlF4bh58q4=;
        b=SbP1ALtmOcM5i0D/1FemA5efRNKIgztFr0yp8nBh5krJStLEjt4db72W54g+wAkIly
         8/fNlZUoSlxS/wr/pd2wlFpUrkkhxZJtbmm+wIfolU/Wohsay730uNd7EiBdZgz5hBbw
         AQg8UbRtdPSfXlXfQz/zWbmSXmknAvQoaHsIjzHci8aVXI9n894KKlKJ2Ha793EatgzN
         dAYfxG2hxt/3L3vZvJJZWgPUrSeLn1+p9nhWeIKAS13JilH5eL92jx7PWINQfzR96PIO
         WpAc7Orcng1BZL1C2Cw+vFqLciJL1Kn98s6YLt56yNGF0IhnvBiMDkglFhKqvBFXFjKS
         T15A==
X-Forwarded-Encrypted: i=1; AHgh+RqRF/xZ78vw+st/oZcxwapXyqFTJjDsTFs0LhW6T05OSXP2sZOuYUB8bp+HTEig3SvlbI9FcQtsPR9r@vger.kernel.org
X-Gm-Message-State: AOJu0YzC9Qfn334PNLh8qFVGg2+z44rrkiucmBli9oVezK9suv7S092f
	wnKT3+1SptKqs5kGxj26HQi3vkGsvwfEH0LApKSHsgcOxStIaiaYso5dCuSKTkK9qlckx7CsMpg
	fNHbShIoEF8xqZNwiHBDwcEQ7ZgAKRbRVahjrhHk80uMW894B/qvqxjyNAST+2+1l
X-Gm-Gg: AR+sD10mW/mn/fkWBmQCQe2XHY2EP1xCdMvzipXUhnFNkPK3d+VO9m4j2S7904um+NG
	N/u5ohYVmIeeGn1/ijOox8fxuFJYLhMqlhAgnfCWf0qZk5aBtbJMTjpoQRG/nTjArBM+TXm5/Wd
	JYprDavaD6DaO5+g36gzS4qtHetTeNQniNg1T65zlV/38H0ZIEbO2XRhdztd/HBJvx5MH8n5wkG
	OIUeYleNyG5/P/SqsPGGxeYd/mT42dPJx82z2HcxOG0TvI6oCL/VEj7ZQ900ZZ2j0b4SLbHcqBC
	TKebiFRgyFm6FU6MNSfWk+1jtJL4o+AlD8I3NKH9tea/hUsSTQfPXf2twfafOJSTaxoqbhsyRUr
	pwTIF5hzcs3VwZb9+40NQXyoWsYKbqMIDm6Vh/72shTvOU68ywbBMZpCuFJtV/Q9AdS/iEdunMZ
	x8V6NXf6kAc9y1doHt23PSek2EsQ==
X-Received: by 2002:a05:6a00:ab89:b0:84e:24df:3870 with SMTP id d2e1a72fcca58-84f4fb800c9mr35806047b3a.0.1786375447129;
        Mon, 10 Aug 2026 08:24:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab89:b0:84e:24df:3870 with SMTP id d2e1a72fcca58-84f4fb800c9mr35803483b3a.0.1786375426778;
        Mon, 10 Aug 2026 08:23:46 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:23:46 -0700 (PDT)
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
Subject: [PATCH v5 05/14] gtrace: Add functions to start/stop tracing on a component path
Date: Mon, 10 Aug 2026 20:52:07 +0530
Message-ID: <20260810152223.3946743-6-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: t6090VwsRioeVzx0w8eMzf14Q0-IB0e8
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a79ed18 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=a8cUU4qgmBzOD3ajWOcA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: t6090VwsRioeVzx0w8eMzf14Q0-IB0e8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX8J6d5tjISR/c
 4l2n9oIz/OkmVhDSyvRfT1IKotw2Ltr09+zji0L/4tp/9/9Eh+eeK2F0M2+QIyRm1zaU/N4qxDr
 1FwcYZKkjceZVNhkRa0SWvHvExwUaf8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX8DPX7BmXDz2P
 11yDnP/LwGFWxFjZAhVjncE82MVoYLMO9v+Gk92Im4ZwrD5bOxNBgXb6cANPiHW2tXSrBDVT33R
 umxbLSnovLOsheRwSeYThKK3eUsz4bqcex3b16Yow3AP6kSeNIlnbkuv5RC/ja0BvqW4ajG9F3s
 MQccUZzrVLI3k1j1mjXOECxweP3D1I08RoiJy+gPiBU5BKU2m87wuSrVUoOhDeg6iLSJeqmYVRk
 9TJoWNAkGaVsj3YJ4LdFfsWHLfSlJoAJxUF9SxhMpkD3t73OvHasRAik1c79bYugM88VncC0KZN
 pRlhtYr8CLwSIG2utfwSpkhS+tVR9UFABK5HzI/SvoxnqNng1PQJp++BYDRoSRLO+hIKiVn7Uwt
 iSCY/aiITZvRMQeSv2/tw3poZt5nbPl2M1GOdOPevftUTYE9IecZrHXJl4P8/sW7u7L9x9faN8x
 mabbzTHCYYX+yCArt0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132

The perf driver framework needs to be able to start / stop all components
in a trace component path during its operation. Add gtrace_path_start()
and gtrace_path_stop() functions for this purpose.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 44 ++++++++++++++++++++++++++
 include/linux/gtrace.h                 |  6 ++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index a89d195ab5b8..6ff1b3087947 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -582,6 +582,50 @@ static void gtrace_release_path_nodes(struct gtrace_path *path)
 	}
 }
 
+int gtrace_path_start(struct gtrace_path *path)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+	int ret;
+
+	list_for_each_entry_reverse(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+		if (!gtdrv->start)
+			continue;
+
+		ret = gtdrv->start(comp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_start);
+
+int gtrace_path_stop(struct gtrace_path *path)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+	int ret;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+		if (!gtdrv->stop)
+			continue;
+
+		ret = gtdrv->stop(comp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_stop);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index b74d4b83b141..78e2ead3db8e 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -254,10 +254,14 @@ struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
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
@@ -266,6 +270,8 @@ void gtrace_destroy_path(struct gtrace_path *path);
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

