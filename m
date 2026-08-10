Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BA441A4EE
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375458; cv=none; b=ZFi9dY+fKv/jNktCw/KBJJy0EnXvCcm2SHH8uceHm8DCZcYIA0LkKDhqrAJIkTiCVifL5Sc2FPSvRn8DyAnihXYK1Z4bhvl+vUMGYtVcksufWjBxnSwG/FqUwA4kViXH4DSDuW3/1j0JOpo34VUMDwUH2NwVfyg1wfa8J/XkTMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375458; c=relaxed/simple;
	bh=ppCg7T+F2a0m3dWd48ljFA/znfvwAukFlUexPE3kd9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2mpdOCFKBveupy4gqQvFYILp/CGQIC9sAWi5UzInRLx7UXZgDGDyYRRwZQFh8TD6N0PjzO83xFVgMbEM5RA1w7xE0YVh7P4o5nFn18H94XMxMpckw5FYL84lg7BTKXRAv2MxgR5OVnEpERV9gpajPNl/CS7HxSfY5dTai7jTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVXZp3D8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHGEOr8t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVXZp3D8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gHGEOr8t"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjZHw1596877
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F3lO+z9pBhh
	CrUuVUAW46lJD8XPxBVHzFGVCYA/LlGY=; b=YVXZp3D8mt/0Jio5Z7KGC+NPlES
	tLo58Q3z6Nb0i5IM2p/0wyv3xMm7hgqV7LaGKSCxlTFU+DpZgvEj7p9WCKTAJZLj
	/OliV9VPv435lefvM3NZsuUgeaRVDASXjtEypSkw6IAgZCXe1RvxQMeHXJOTR2wh
	k3J3NhFkRexn0Sl1CtDNZB2xgar9FhmKFPYY5Z8w3Ax3Rs9Gpi4ttf3kNhE3KZiM
	Tl0Jk0pYKD8cBDAd8h+PeoEsycymSZr6aOBwzY73klhmudhDg6UkPy5jkK+C790Z
	g1iBgGLn+JCE6RWwt615yiOjb0dMvjVK9OJ7RXT0P49smjdi/oVg3TftLnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6t9pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so5237568a91.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375455; x=1786980255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3lO+z9pBhhCrUuVUAW46lJD8XPxBVHzFGVCYA/LlGY=;
        b=gHGEOr8tSS/m+GPIXS4SbapvXWFxfRJVNh9KHAWWY9O4zzFqX5rn1jJEEEhyzz4VAq
         LlMuT3XJw6IFdVEAhCg7zxgG8L3izmCrytUuWk0oxaZe9gm2//wHwpYQ5eMtaVAY/RER
         qGkSx0dO1eYqxnDpLjKzh5pjFahU2cKDr955pOAOJeD0S5KTiFohrDCP+Uhsovan0MZr
         Zjzm9ceV91JbnMI4XKfqebfjuZe2TIxcC1ioqdpR2BpLGDZaawVw8R681SCN44OSZ7XZ
         MgScnxmuG8RlCm5HPym1m8nahWGoqFRyTvKxgF8rTkuWfsToAiliFeoiM7lIpvXdM3JS
         cOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375455; x=1786980255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3lO+z9pBhhCrUuVUAW46lJD8XPxBVHzFGVCYA/LlGY=;
        b=hyjAI+scxCvtjFlbqpKASUJx4tjA1KWTanhOAJQk6oDO8e6NLQL1EBZwyfD5aIY8Gc
         zSPZRdvjPLCoc9q2KsjyWFWggyuqqqNOeWP+NAZIzOhPq2IuKQEK6Dotsg39DKHlVp2X
         ZZ9P6K1xmgGmXFr7F0+slSzHBhPBZr0Lf+ELJGFzG/EhJt4OBk6U/OWIksU+Mamzf8Rd
         hXIRTcHpHtbeJxMuo9XF8+Af2g6e+RuJmA3ctk0MhLLLECxPxzFrPr9VTWQM/TQ4AE01
         F4wv4XrdMbKKYEwgr0dJ060BH17BXioczgH4YXDxZP5DebkERvm06avqOVco2a6QR09S
         bmfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+qtOz0CG2TkvCMLPhZFwCIvhYc+swIGp+1tA7WEGB2HK90jzkoy3sJyri5byqrQK/19FWjWk5HHUU@vger.kernel.org
X-Gm-Message-State: AOJu0YyuBRFaalqkjVALUF3PBRT7qIhq2dZRzMET7mHSLE0zgEWMu3pF
	b4ZeaGhKQQMa9heZKw0sU5MssFWVQ6rHZW1A57z0i4OOsoxB2NY0CIem/IH1si+JKhQIBViE+he
	ffpce8fojnZtthgL89tu94zwsCYDgxdE+K1BkCn7iHdgPAKCOSvHiPKYsXdfobe2a
X-Gm-Gg: AR+sD10pFdMs1x16ahY82NrxG+FBRLVVhq09oeIw5uPE6eV05YI4yJZkMm7l3ZZa/ZI
	Jjd8CstXzs6kbpWTVn0JJ2Sk85ycJceSZRoKzYYIDazGW5/s2gmpMrD8mcK/oI/iz1lyjoT2t76
	EvJfe0KneR3/BRWFrzJukGQOySSUhFJWPb4SgqNl+SMJOwtlpSX6kvoTjRdf29Ya54CUJuakfQU
	tTJjHkLnQi8IwKkC6uuQgdx2NtNLartM9qb6KpKtJ5wk1n+lR9SwxYniAR+pNLJnaSwlZKk8+z4
	FCKSvhbSgMbhLqibCUSRqsrQYnUn2LobaOmNIdqUjdMCRFnjheGZ+6y0Zybkp1+RkXZ2AxA7aH3
	TMn+2P6lZ8mIT0pO0aPwS2EOssn2MWIT4FBBrWRdDY4eG9tvSEhG8PuN3JYahyrgmYE+G/UqqKO
	kxk1T3nNSM1KoeI0OE/iTolfKDeQ==
X-Received: by 2002:a05:6a20:43a9:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3cbc0103abcmr28768562637.4.1786375454610;
        Mon, 10 Aug 2026 08:24:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3cbc0103abcmr28768494637.4.1786375454158;
        Mon, 10 Aug 2026 08:24:14 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:13 -0700 (PDT)
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
Subject: [PATCH v5 06/14] gtrace: Add RISC-V Trace encoder driver
Date: Mon, 10 Aug 2026 20:52:08 +0530
Message-ID: <20260810152223.3946743-7-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX4/ZbLEHM7pu4
 fjaVSieO7lpxuEochsRDUjeVdotgBglnTLtA4AzuHyudFki/es77F4cTT2NKv4RwwBDi70jqnaM
 jVi8083/Wrmcz7H8IOYsCxVz/4bWdac=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79ed1f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=vQ3DPo-oxR4YcLRavt4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX/whEhrpdnPwD
 627z8GyB7EuewzyO6JCxz9lONsILarjkTA7000OyEHDbHDso1OupuyDCkad5AMuiUBhzO4DxFjg
 efPZ2t9AEtcXU9N9GegfpWFhNYc6HEb6/EPfWB8a2ToDwPRQZXz+EYrIxfIk7eTAq/gBWfc0HaP
 q3c0IMO1uVL8ZAfw9jusgKot88r4sUrOq+kj3QMeFmsE72Ge3txfbyvaRwjGRBzx9ZMHdjDqhfX
 iG5QAMaU7+h4Zpur7BspaJnPX3WB7YlchNc4c2ieNZkn+BF6P1vEIoflNIv/o4edgqIpW+1BdDY
 4TRy/xXsjaS+64vD8XtLLaF9Z8ild1wr8DO6tzgpOF8SzXYxLsjOnI5rPofxBc4NkSj/LsyEl26
 TM/aVQ2zJqcvDzLAI1k/4nbAwBrc+qiiqM1UdwWdX5alOW+oi3mhKneFPEj7OxuTIBjNvTnnp4F
 WrdbmDxQG0nS1qBm4lw==
X-Proofpoint-GUID: taOPVIFs8mAlQ5sj_4VwIqeE-0bObJHx
X-Proofpoint-ORIG-GUID: taOPVIFs8mAlQ5sj_4VwIqeE-0bObJHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132

Add initial implementation of RISC-V E-Trace encoder driver. The encoder
is defined in the RISC-V Trace Control Interface specification.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig           | 13 +++
 drivers/hwtracing/gtrace/Makefile          |  1 +
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 99 ++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index 04986f216549..e3a621b59913 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -28,3 +28,16 @@ config RVTRACE
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace.
+
+config RVTRACE_ENCODER
+	tristate "RISC-V Trace Encoder driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for the RISC-V trace encoder component
+	  which is defined by the RISC-V Trace Control Interface specification.
+	  The encoder is bound to a CPU and generates the trace data for that
+	  CPU.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-encoder.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index cf02316c1bbf..10a74f852115 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_GTRACE) += gtrace.o
 gtrace-y := gtrace-core.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
+obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
new file mode 100644
index 000000000000..9ff3413d1aa4
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+
+#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
+
+static int rvtrace_encoder_start(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int ret;
+	u32 val;
+
+	ret = gtrace_enable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to enable encoder.\n");
+		return ret;
+	}
+
+	/* set mode */
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
+			      pdata->control_poll_timeout_usecs);
+	if (ret)
+		dev_err(&comp->dev, "failed to enable tracing.\n");
+
+	return ret;
+}
+
+static int rvtrace_encoder_stop(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int ret;
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
+			      pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop tracing.\n");
+		return ret;
+	}
+
+	ret = gtrace_disable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to disable encoder.\n");
+
+	return ret;
+}
+
+static const struct gtrace_component_id rvtrace_encoder_ids[] = {
+	{ .type = GTRACE_RVTRACE_ENCODER,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_encoder_driver = {
+	.id_table = rvtrace_encoder_ids,
+	.start = rvtrace_encoder_start,
+	.stop = rvtrace_encoder_stop,
+	.driver = {
+		.name = "rvtrace-encoder",
+	},
+};
+
+static int __init rvtrace_encoder_init(void)
+{
+	return gtrace_register_driver(&rvtrace_encoder_driver);
+}
+
+static void __exit rvtrace_encoder_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_encoder_driver);
+}
+
+module_init(rvtrace_encoder_init);
+module_exit(rvtrace_encoder_exit);
+
+/* Module information */
+MODULE_AUTHOR("Mayuresh Chitale");
+MODULE_DESCRIPTION("RISC-V Trace Encoder Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

