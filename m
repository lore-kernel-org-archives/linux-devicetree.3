Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72391411670
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375465; cv=none; b=ItlUftVg1bRrqtBqez3KvqcezDw/EVVc/A5NE/eMOGtRokUqC1fxVmr7P2xwucH1QaKA25Lo0aaU7JfBFvtzL3xf584d+7YObYKEplISoE4s9Ev7xeh2Zs6JztOKB5GqKjZbhlIp5pIVKLTcgNjPG7ZZu8CG2HBFB9dpbDbagAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375465; c=relaxed/simple;
	bh=SHPac3/YNhNPWsUtpPuxaSQoRBAGpNcm7mF5ZLHMc4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpATJPLIKroa553gBChZ4pQES0iDmWbQYm8kqWXaX98JqljQzM3j0YFawaLadeVHq6eCvZNDXof4wCzQ300gIuNHDnInWG2mZN4Yw/CibiHTarsNJ/D7ACQ2Lg2tP0pEl/DgwlT2pk7G3aEy/Sm7iq+UQWHv5QeLjNIyobnTqjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFd32wVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O007DXGY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFd32wVp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O007DXGY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjHOR1959740
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SXSG2wb2TZi
	XtJzB1T1a7hCG1Hby4CtDQXZZTgX0OkM=; b=pFd32wVpll8LxNuLEM3A6bKTvq8
	IdnWlw/vm5muYzIg/eHeCWVdmBaig1y6KaGS10dx18FVuJEncjd/G3xk5tueB1Ao
	ce8c+Zfz5Fnwotkii1MBgibPz/vv9GILwmoM2V/igu+p//LtC5sxx06+rQVg27mc
	Zhtb1cyjKEabNie3/l/2EqvGlebsdeAvS5Xg0tSluHDMLmiMBKVNr/Xb6F970YCh
	8GP04comFwhrrdv6Qlj5tKGJ9EW30xyGBROpi5/dzh7OEbI4zoXooi5OSO+occeA
	yk/9IWA6DCVF3kK/vCFdb4XUCnrNocZLkO/lkH3GtL/c1GaIdro4jvj6V9g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xu9fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1501813a12.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375462; x=1786980262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXSG2wb2TZiXtJzB1T1a7hCG1Hby4CtDQXZZTgX0OkM=;
        b=O007DXGYdUq7xtdoToT+HHfoU8xEEQ8vUpb/3WV/c/pGZcdlhcDnOxUZ5oSBLa6s9p
         fTGfeEImL3fohW+j4X6mVwli95xtf2L6e3hbsTP8gnCGyfaDfcjuESwEgSDqCUN5ZqQp
         9IOy+niL+mX3dA93jUbNHzHPqqY1BVJ2S/iWCsLWWBu+4D++bwRT5Wfm3XlPrmvaP67i
         sEwMM53lEXymXonhYFS+ovSjmVaNbrvyOr0jVu0MHEiTZ20b189Naqy15ka8kDqlM6xD
         1U0ybMGsGIgEkE2GZdN2sAH/nJkDVA5aZWYtJeRiz651f4C/Jfm0qlRXBETKNudyv7kA
         6yBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375462; x=1786980262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXSG2wb2TZiXtJzB1T1a7hCG1Hby4CtDQXZZTgX0OkM=;
        b=izyUa1VpQKwx8boO4Uo3IJWpTXC2c8LNNJQctfgwTcCFrafPGaDg4hJTz2mCqFSbje
         MMKYJ5/taQ1xFhgYkhD2C1YTYijxgq6vlIhaat7aUrNhl9TQACvSCeFf0Vkkn6ey+4Cq
         jOqoquVVi12hSRN9VM+Tv5UB1vn6fWvAvbz1jHmj4LAwaALc1zlDCYanGFxnUgkYkQ5q
         CnBSt8NyRai4Kjs67+szy1P1G6GkonxHCwPkXvJkS1Ds8mCpBYh/LzscjI0XQSbRFCcS
         zOA7joY5zJ5ZzUE8T5eBPICq2D1x/4RpyzC+q7OK9S/t1JotxsNXej1PrOQQofxfBcPs
         BOVA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0sRGgPbNoPDlBZXrPA25afXYJKrl+j2E3C037VJxDz7o7UYK07Ymo3W57GqiJeu2/VBUQMrABvALF@vger.kernel.org
X-Gm-Message-State: AOJu0YzvORsbJqKZJcWJXsiUc1YoNvisOg1n663BhEA4RVc2sEeaAtbB
	zHBa+tLF6AbGqzhArfQqRGSXRqNcq1D52CmsCeTV86HU+7eeG1BrBB9SMJkbOHZQqco3S/OS/QH
	64qHmDNOfoqUS+6hOhBZo0CHkCU5Xr6WpA5g1M+WNYVlwFUW787hRDOfaVWOWQuUZ
X-Gm-Gg: AR+sD11VcBEyh5v1blVsOguC7gKSJDJALmKjueuNCcVOH67e+vulLpcPoECRyspJx6a
	NDCEzBPtRZ6TOA489cqDDJ02E+bRNv7EMabjjxVISo5SkPafnEJpDHCqvw9o9Vvg8ZNtfR9dfTP
	U+cXMrbTsTOYaRoNb+mD/QGKta+BAznukAKSXg2yNJrqaY13Wk4be7krNYfYnzF5bsHGxKd/glJ
	xqMKTFKqx3Yi4/cKWGvrcaZx4k2lu7/57ygrl8u4frWLyiBu6Rnh/qsyDm47BRxZuAdE6k7O/17
	rjQkbg7fHtdHXUXQYts9MuU5Hvuj3AwNVDelP45vhUgo5jtufFurvoivrXGfymgh41tD1s6aO2Y
	Wm+Ya5MywoX5vsRlca5vAOPIcpEqef/qRDp68CCSLh1tYMTdZeBUe3Zz1ogHCID8wUlZmFO0scM
	X2uZ5Z2W2zBmzMbYW+hByfRdUZ6Q==
X-Received: by 2002:a05:6a20:7fa0:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3cbce6f17b9mr20866794637.4.1786375462240;
        Mon, 10 Aug 2026 08:24:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa0:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3cbce6f17b9mr20866754637.4.1786375461670;
        Mon, 10 Aug 2026 08:24:21 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:21 -0700 (PDT)
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
Subject: [PATCH v5 07/14] gtrace: Add function to copy into perf AUX buffer
Date: Mon, 10 Aug 2026 20:52:09 +0530
Message-ID: <20260810152223.3946743-8-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX+y96WdyYBRiV
 dFMCKhY8GYTM7QusBw6BFTxA1sGwDVmfVvTpzB43IP3laBuEp816d11tAAiyngb5JWr8CwqiFUU
 DFojNmr/fuxjD4WxTCkQJFMyIn7Hb14=
X-Proofpoint-ORIG-GUID: _76ttSCkB0-cjDU1bsBEUbejph_TYnCD
X-Proofpoint-GUID: _76ttSCkB0-cjDU1bsBEUbejph_TYnCD
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79ed27 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MNQjnuzN1gR2RwVUj5UA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX6Sg33F5N15gs
 GGFo2/m+m3i7PcDJwYYHzfBGCofOuaanNc5FdsQSH7NurWnAxILMsJJ5GIQ4+xBYqSdNymXkXHT
 KRJefjtRg+A27ZQ48EvU334tK0HpAWeCXd5QX62wAWFBe63mxLOPkrkq6ZObVcuHfKMkmR4GnKw
 qghGExF09vwNTd6XPTNNEJQxA5f68gjlvr2GIehI1Cg5HBOA5K+XiuFQjfmY6dslkWbIEm/Oppj
 2gUbqkX9+W83S9MhpoDKVp98OMKFbAB1MtxgKhoArTpToxgv7BdJ3ItsKrQFsTScGQEAGDwDyp9
 sU0lfhcWHZ2mntV59f2CFSz1P+0r3WmEdYdbdgWlrDZMTgRdrOW9ghwo1HwbFFb8kNgsSzT3tWM
 ZKqKKsIdQJ+MulyuPGqOmJq3HuqKxhczZEFNWdc4Punt+YTvRel9YgTP5OUKYeOYOM4O2x2kVy6
 qQdN31sfzYzExqd39HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V trace ramsink will need a mechanism to copy trace data
into the perf AUX buffer. Add gtrace_path_copyto_auxbuf() function
and corresponding trace driver callback copyto_auxbuf() for this
purpose.

Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 22 ++++++++++++++++++++++
 include/linux/gtrace.h                 | 24 ++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 6ff1b3087947..53a3679ba69f 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -626,6 +626,28 @@ int gtrace_path_stop(struct gtrace_path *path)
 }
 EXPORT_SYMBOL_GPL(gtrace_path_stop);
 
+int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct gtrace_perf_auxbuf *buf,
+			      size_t *bytes_copied, u64 *format)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+		if (!gtdrv->copyto_auxbuf)
+			continue;
+
+		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_copyto_auxbuf);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 78e2ead3db8e..bc82814e2738 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -257,9 +257,30 @@ void gtrace_destroy_path(struct gtrace_path *path);
 int gtrace_path_start(struct gtrace_path *path);
 int gtrace_path_stop(struct gtrace_path *path);
 
+/**
+ * struct gtrace_perf_auxbuf - Representation of the perf AUX buffer.
+ * @length:   Size of the AUX buffer.
+ * @nr_pages: Number of pages of the AUX buffer.
+ * @base:     Start address of AUX buffer.
+ * @pos:      Position in the AUX buffer to commit traced data.
+ */
+struct gtrace_perf_auxbuf {
+	size_t length;
+	int nr_pages;
+	void *base;
+	long pos;
+};
+
+int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct gtrace_perf_auxbuf *buf,
+			      size_t *bytes_copied, u64 *format);
+
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
+ * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
+ *                 reports the PMU specific trace format of the copied data
+ *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
  * @start:         Callback to start tracing.
  * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
@@ -270,6 +291,9 @@ int gtrace_path_stop(struct gtrace_path *path);
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
+						 struct gtrace_perf_auxbuf *buf,
+						 u64 *format);
 	int			(*start)(struct gtrace_component *comp);
 	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
-- 
2.43.0

