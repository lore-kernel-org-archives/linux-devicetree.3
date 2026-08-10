Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D6840BCD1
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375480; cv=none; b=ryfsVjHkUDpmu2nau44hCFborMqXJoE/iNmNzeVejv4w3H9GhIgWrExIDEbT5yZeJ2p2UImXT1VVqZD/muTiFTJCkc52w3ryBmHlE2PNf0ssUQTrdoKSv73+YiolwWnl+87gU5QQxfcfBlgMQra4Ns3KSWGRdPGJr26aQ/VsWP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375480; c=relaxed/simple;
	bh=ikKKopLhztnYDbRF6631l+JmVWsrY4TGksETB85cIig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sg8G4temyrdqphAlybkafcnAkPJCh6xIgGTr3nJZg2f6H9ioMMThh/tuK/mtP8vyOBkl+7Znhv9T08lwb275nVanZoHTqL4gc2cSCBgWHPAvjINiszV3sL5x84J0VRaVpJjM2Oe0kL/3n6x7GLNm+JP7xlyXWHT40ad8L90n3u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMyAuc5w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJtHxWFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMyAuc5w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJtHxWFp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACifH01704894
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lzDMmAD0xOQ
	mX/Xf0iW0AFAXwF9POaztIiwjZypmNYk=; b=VMyAuc5wwm96QWkCLv5JlfSE79t
	8HWS4ZzQBgIz5e9H/otIkxnciHre6+uc+SwedssVp4g7fhVoULz/W2zfgbsm8qUv
	DQwp0pAjvXCGliU93Ma8fn86vEEn5VhrdEncdttmAS+mEF7qzPN1tfO2c+c2/q11
	pWPsm50xcV19aG47cn73WgcQXZfTguEyfvj5p0+XAsucQOR3+V2igkjryOOBkbXF
	BnoLgKPYUxKDpK/hNTVmp62nMDjMDo9Na5AUg8ucvKa/EcCKI+pa4RJt/YOshdMl
	JL8G5m7AgtDnio7xbB6Y9Q8cKGw1ld8sBkMjDUS4YF3AUj42yCo33T0qDig==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh59mnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so2668541a12.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375477; x=1786980277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzDMmAD0xOQmX/Xf0iW0AFAXwF9POaztIiwjZypmNYk=;
        b=KJtHxWFpwcrHyX3ugjzTV4eJu3jPQMRmMwG7ZvRNODIKKEmkxcFx8y8YJcwqeOJSpL
         OoPSQLK7XNnL2YFXYSink2sD5KoYoLnTCLDnoPXkKt6QSayJKS7U4SfFiqPZsRSI8TE+
         V9J2rk3bwlX1a4K6Wb9D9NMDvv8HLDZ52gaXh3nga7jqinNBzI65lPX8sGsiIlg6ERzg
         AjuYgD3NxQnyBTx/PubAeyzGmJIOPdY+hmgqW+pDRGXjTKOk5iv+P1CWHj7Fz/jBQiyx
         aa/p3mg2NWPN+sfkg20Pj8enXfGueTjAoKyD1WMq13I525QHWg7g1PGIFt688QGe5DIF
         bCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375477; x=1786980277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lzDMmAD0xOQmX/Xf0iW0AFAXwF9POaztIiwjZypmNYk=;
        b=rJmhkmf1JrPsh/YFvrDXmKbMu5PTF5RG4xbtzLcXSuf5sNd7RUdOcDcy6mPFvDspj+
         iusZOzQokeVI2/aP534HnQEbU9/8aOSDLI15jeaCm6eMaUAQIcUVMZM7mPSeFUUaHQHr
         5ym+ozenDRFWWxi5hdWvRtN3yqX/XwQDJgaYIyVYDbuCSgYOvTrpdqCX2XGL8IxWxDgp
         XU5n4J6jV3tMMV5orQpCtDzoZwo7Cacd+/6S65oWc8NCvmiWtxMRR7PHRaeIApY1Lp+Y
         NGKYbHwjJmQ3dAz5RmLjuPfh5hK7BK0msibr+ZQMCOBcMPanpizZQh0fNN3caBvwlrxR
         UmMw==
X-Forwarded-Encrypted: i=1; AHgh+RrJaNPArBk//HtWE2i0o6+zssQaxi5mb1OmMOPz5+Ad5aDN4dqgodQ0wbD2GI0UpGu98zPFB/HRVRBD@vger.kernel.org
X-Gm-Message-State: AOJu0YzTrGvvdgGx1MLzFz4Kc31pmAAaT35SQ+tC7u6Phq2XEDFys0h4
	bGZRIDhtsX2ynLx4xCJ/5etDNwHXU8R2T/q3QTzYnFDx3p9dMvITqvi8aZzFFudr4Jv2YtQJM4B
	OjqRY+rwFTtcCMg0uQ38c4aMgKp0SYWkNzI39sGmYSVnyY2No1FI9QrLKD+WlQlsJ
X-Gm-Gg: AR+sD12XJlcpb6fbB2okQpZ6Wvo6PZtA/Vifkm7tsdQAQKGk0kuMeNMa42gPpEomDOG
	sbMNnxIo6aqNEs/I2HYFyLSad4v/4z0oFjGsoq3iLDs1UAbaJlrz0KeQDf+g2SUUCS7Bv8VLyvz
	S++PL+MZI0m1XjHHuPVen4Gw+9GYvzLByhuZYmNV5rFn1ZSrhsIlB8bsZj1sxModJ5i22/XGOnf
	/glCR3fjNTq20BtcoQ+naT4EDdBKLi6gNvwdsOkzdzozKh4iDlsJwRTR+TjitriiijKImI2vrvc
	oGSUW1CpO4ilNwRFyyzn8i/FYJy26f1uFwWWEWJoIDpo80zV7zH9mEDJDuDcJqzmsm5PlaFA8FM
	IbpwpAsD/5j/mOGJb2wgfR/t1CmyEV6YnJpxt7t0wbTxO6AjVyvsaGK9ugu1CGdu3cmt016Xuli
	Za//1tuVDImnwKHxMkBQKXOwpi6w==
X-Received: by 2002:a05:6a21:6e92:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cb85df2778mr58309981637.14.1786375477001;
        Mon, 10 Aug 2026 08:24:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e92:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cb85df2778mr58309911637.14.1786375476473;
        Mon, 10 Aug 2026 08:24:36 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:36 -0700 (PDT)
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
Subject: [PATCH v5 09/14] gtrace: Add RISC-V Trace ramsink driver
Date: Mon, 10 Aug 2026 20:52:11 +0530
Message-ID: <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a79ed35 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OYi3kTF5xvdVTFsD8bAA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: yxLd1CYM88pfgn8GFQlmpsIdral4mOxZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX469qxVgSDeMF
 DsFME/A8UMeBTBHbiqthFdquMxuws+MPaAw7TN+EZfv1xMo/IrODV42TBIHQWrWW7peo45tWVTP
 w9T6w4jpQLbvdYrvnkYSNXvh7In7DbI=
X-Proofpoint-GUID: yxLd1CYM88pfgn8GFQlmpsIdral4mOxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX65bdSiQx6s+q
 NiGl3u09xRWVv11kglz5f7ZzvkczHYTuo7ZvrA5bWVURL8tTKe2iBwu6UbHgNxMZTGmH3Hhx/oK
 YUkBCfMM1sMlDH5kw9TjZ1iQWpmWZhr71Fng6jvCRIhguQ+bAyaE9XeRTeLicOP9fv5PNi3kwBi
 5QiaXSWAOkrZ1BSn9svCK68EtEADDrmLNXWgQhJzltISLdJq9pr4DQOf7IoebIeBR86JRUfkPAi
 Zrf+oF69/TVxbWdnUBH66lnj0vNs4drv6V9N8TrmhXYN0VjE0xiE7yvyKdn+20gLIHVCoaCjaVs
 gPAlfqf0HfJ6bOzm1bRQe0txEUa10LgjQdYUGNuqFxtnHXgUnYkvPcv8TDp8BMiHeqr4/DB4eG0
 XC3la0NsoIfoROnEUR4Wz4fqo3uz0qvC/JmNJzxeDZU2GhVJVxAhAG0wIsP62KQJLzmMgPqN88h
 E7uv7gkCyDbT2mbNVOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132

Add initial implementation of RISC-V E-Trace ramsink driver. The ramsink
is defined in the RISC-V Trace Control Interface specification.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig           |  15 +
 drivers/hwtracing/gtrace/Makefile          |   1 +
 drivers/hwtracing/gtrace/rvtrace-ramsink.c | 320 +++++++++++++++++++++
 3 files changed, 336 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index e3a621b59913..de4a3b533591 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -41,3 +41,18 @@ config RVTRACE_ENCODER
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-encoder.
+
+config RVTRACE_RAMSINK
+	tristate "RISC-V Trace Ramsink driver"
+	depends on RVTRACE
+	select DMA_SHARED_BUFFER
+	default y
+	help
+	  This driver provides support for the RISC-V trace ramsink component
+	  which is defined by the RISC-V Trace Control Interface specification.
+	  The ramsink is a trace sink which stores the trace data generated by
+	  the upstream components into a system memory buffer. The buffer is
+	  then copied to the perf AUX buffer when tracing using the perf tool.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-ramsink.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 10a74f852115..3e0c68d1b632 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -5,3 +5,4 @@ gtrace-y := gtrace-core.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
+obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
new file mode 100644
index 000000000000..7ed25cf364a7
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/dma-mapping.h>
+#include <linux/gtrace.h>
+#include <linux/types.h>
+#include <linux/sizes.h>
+#include <uapi/linux/perf_event.h>
+#include "rvtrace.h"
+
+#define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
+#define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
+#define RVTRACE_RAMSINK_LIMITLOW_OFF		0x018
+#define RVTRACE_RAMSINK_LIMITHIGH_OFF		0x01c
+#define RVTRACE_RAMSINK_WPLOW_OFF		0x020
+#define RVTRACE_RAMSINK_WPHIGH_OFF		0x024
+#define RVTRACE_RAMSINK_WPLOW_WRAP		0x1
+#define RVTRACE_RAMSINK_CTRL_MODE_SHIFT		0x4
+#define RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT	0x8
+
+enum rvtrace_ramsink_mode {
+	MODE_SRAM,
+	MODE_SMEM
+};
+
+struct rvtrace_ramsink_priv {
+	size_t size;
+	void *va;
+	dma_addr_t start;
+	dma_addr_t end;
+	enum rvtrace_ramsink_mode mode;
+	bool stop_on_wrap;
+	int mem_acc_width;
+	u64 prev_wp;
+};
+
+struct trace_buf {
+	void *base;
+	size_t cur;
+	size_t len;
+};
+
+static int rvtrace_ramsink_start(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to start ramsink.\n");
+
+	return ret;
+}
+
+static int rvtrace_ramsink_stop(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop ramsink.\n");
+		return ret;
+	}
+
+	return rvtrace_comp_poll_empty(comp);
+}
+
+static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size_t size)
+{
+	int bytes_dst, bytes_src, bytes;
+	void *dst_addr, *src_addr;
+
+	/* If destination cannot hold entire source buffer then write only the latest data. */
+	if (dst->len < size) {
+		src->cur = (src->cur + size - dst->len) % src->len;
+		size = dst->len;
+	}
+
+	while (size) {
+		src_addr = src->base + src->cur;
+		dst_addr = dst->base + dst->cur;
+
+		/* Ensure that there are no OOB memory accesses */
+		if (dst->len - dst->cur < size)
+			bytes_dst = dst->len - dst->cur;
+		else
+			bytes_dst = size;
+
+		if (src->len - src->cur < size)
+			bytes_src = src->len - src->cur;
+		else
+			bytes_src = size;
+		bytes = bytes_dst < bytes_src ? bytes_dst : bytes_src;
+		memcpy(dst_addr, src_addr, bytes);
+		dst->cur = (dst->cur + bytes) % dst->len;
+		src->cur = (src->cur + bytes) % src->len;
+		size -= bytes;
+	}
+}
+
+static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+					    struct gtrace_perf_auxbuf *buf,
+					    u64 *format)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	struct trace_buf src, dst;
+	u32 wp_low, wp_high;
+	size_t bytes = 0;
+	bool wrap;
+	u64 wp;
+
+	dst.base = buf->base;
+	dst.len = buf->length;
+	dst.cur = buf->pos;
+	src.base = priv->va;
+	src.len = priv->size;
+	wp_low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
+	wp_high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
+	wp = (u64)(wp_high) << 32 | wp_low;
+	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
+	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
+	if (wrap) {
+		gtrace_write32(comp->pdata, lower_32_bits(priv->start),
+				RVTRACE_RAMSINK_WPLOW_OFF);
+		gtrace_write32(comp->pdata, upper_32_bits(priv->start),
+				RVTRACE_RAMSINK_WPHIGH_OFF);
+		src.cur = wp - priv->start;
+		priv->prev_wp = priv->start;
+		/*
+		 * There is no way to tell if trRamWp wrapped around more than once. As a
+		 * result priv->prev_wp can't be used and the entire buffer must be copied
+		 * even though some data might be duplicated.
+		 */
+		bytes = priv->size;
+	} else {
+		src.cur =  priv->prev_wp - priv->start;
+		bytes = wp - priv->prev_wp;
+		priv->prev_wp = wp;
+	}
+
+	tbuf_to_pbuf_copy(&src, &dst, bytes);
+	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
+	*format = PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
+	return bytes;
+}
+
+static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
+				     struct rvtrace_ramsink_priv *priv)
+{
+	struct device *pdev = comp->pdata->dev;
+	u64 start_min, limit_max, end;
+	u32 low, high;
+	int ret;
+
+	/* Probe min and max values for start and limit registers */
+	gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
+	gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
+	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
+	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
+	start_min = (u64)(high) << 32 | low;
+
+	gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	limit_max = (u64)(high) << 32 | low;
+
+	/* Set DMA mask based on the maximum allowed limit address */
+	ret = dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_max)));
+	if (ret)
+		return ret;
+
+	priv->va = dma_alloc_coherent(pdev, priv->size, &priv->start, GFP_KERNEL);
+	if (!priv->va)
+		return -ENOMEM;
+
+	priv->end = priv->start + priv->size;
+	priv->prev_wp = priv->start;
+	if (priv->end <= start_min || priv->start >= limit_max) {
+		dma_free_coherent(pdev, priv->size, priv->va, priv->start);
+		dev_err(&comp->dev, "DMA memory not addressable by device\n");
+		return -EINVAL;
+	}
+
+	/* Setup ram sink start addresses */
+	if (priv->start < start_min) {
+		dev_warn(&comp->dev, "Ramsink start address updated from %pad to %pad\n",
+			 &priv->start, &start_min);
+		priv->va += start_min - priv->start;
+		priv->start = start_min;
+	}
+
+	gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
+	gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
+	gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
+	gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
+	/* Setup ram sink limit addresses */
+	if (priv->end > limit_max) {
+		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
+			 &priv->end, &limit_max);
+		priv->end = limit_max;
+		priv->size = priv->end - priv->start;
+	}
+
+	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
+	end = priv->end - priv->mem_acc_width;
+	gtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
+	gtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	end = (u64)(high) << 32 | low;
+	if (end != (priv->end - 4)) {
+		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
+			 &priv->end, &end);
+		priv->end = end;
+		priv->size = priv->end - priv->start;
+	}
+
+	return 0;
+}
+
+static int rvtrace_ramsink_setup(struct gtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv;
+	u32 trram_ctrl;
+	int ret;
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Derive RAM sink memory size based on component implementation ID */
+	switch (comp->pdata->impid) {
+	default:
+		priv->size = SZ_1M;
+		priv->mode = MODE_SMEM;
+		priv->stop_on_wrap = false;
+		priv->mem_acc_width = 4;
+		break;
+	}
+
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
+	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) & 0x1 ?
+		 "SMEM" : "SRAM");
+
+	trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
+	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	ret = rvtrace_ramsink_setup_buf(comp, priv);
+	if (!ret)
+		dev_set_drvdata(&comp->dev, priv);
+
+	return ret;
+}
+
+static void rvtrace_ramsink_cleanup(struct gtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+
+	dma_free_coherent(comp->pdata->dev, priv->size, priv->va, priv->start);
+}
+
+static int rvtrace_ramsink_probe(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_ramsink_setup(comp);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+
+	return ret;
+}
+
+static void rvtrace_ramsink_remove(struct gtrace_component *comp)
+{
+	rvtrace_ramsink_cleanup(comp);
+}
+
+static const struct gtrace_component_id rvtrace_ramsink_ids[] = {
+	{ .type = GTRACE_RVTRACE_RAMSINK,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_ramsink_driver = {
+	.id_table = rvtrace_ramsink_ids,
+	.copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf,
+	.stop = rvtrace_ramsink_stop,
+	.start = rvtrace_ramsink_start,
+	.probe = rvtrace_ramsink_probe,
+	.remove = rvtrace_ramsink_remove,
+	.driver = {
+		.name = "rvtrace-ramsink",
+	},
+};
+
+static int __init rvtrace_ramsink_init(void)
+{
+	return gtrace_register_driver(&rvtrace_ramsink_driver);
+}
+
+static void __exit rvtrace_ramsink_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_ramsink_driver);
+}
+
+module_init(rvtrace_ramsink_init);
+module_exit(rvtrace_ramsink_exit);
+
+/* Module information */
+MODULE_AUTHOR("Mayuresh Chitale");
+MODULE_DESCRIPTION("RISC-V E-Trace Ramsink Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

