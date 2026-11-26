Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684051;
	b=jVyuL880gvDnyArlAo7daXKe4KxopOTgWktYIWg/QHQc+YJZzUABsLP2vlfGFGTn6xJ6
	 /K/6E/t9ZYIBUkY8CKwfc3PLkAk2XYVtFSJwKgY7bPAVF02QxYAqWEfR7frOKf3Yvccdq
	 beWv1hdH2cG1TapDiFbVioFqNQ6WxypJdR12L/zbDjOQR2dkZ8Ywm0cEu8HiNQvUjto1r
	 m/Hb/j7E4QsCXy85C9UeCWi3vBvxpF3+4Bg0od/v7Yzj9ksf6h+LHJk4Egdb6svrvPqbW
	 N0MAJk9T/vd4mSEv6k6PJ2incw6G9f4g2N4bcYxKhcqFMTVDrgoRCgc7fGPfDDicnHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=496JOXpOEHemKz8UL2GWW4yob5VAkawIc7w2N9x0+W4=;
	b=k3McQrv3eZrGBJwhroF8dKmja0oDVGNVMbhNAWiPbBNtcBzwMZ7pC2SfbvXI6lpQHxA7
	 aIlGPOg9+SB/elCh2mGcfmRVSB+3fFTZR0zt63u+jBB0lR7VAX+bQ3giOXb08DoVP0hXe
	 o99FsvdP8ipE/hFGhtCUVDp5ay7LJ682qxmq+D3lEN80xO1oHSZ84k2wqp7KpWX+4WE0p
	 dJCo5mtrRJcRSqZWHLePFKFyu99VlC8LjQITpvMEOXVWrrK1Z+YXYVERLxVKglTH3XcH6
	 HCV1/hqDMFcDHg7lkvFd/GXFEBGJRK8hXPwSotr3/8Di4gOxs0nv8B6jvkLGNiAvz6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=EpB1ZKf6;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433A160A262D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433A160A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=EpB1ZKf6
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386ab9ab619so8841157eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684050; x=1796288850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=496JOXpOEHemKz8UL2GWW4yob5VAkawIc7w2N9x0+W4=;
        b=EpB1ZKf6ohYzLuR3qFJEHmXT8RUVIvLrkogUbkZZwOKj8jkJCM92285IzDMqMBDMsH
         dgId/tzm3iH/WwoIwPvyMr8mt85+gKWhxcHJOf7UQqnevhH4rKpHtlLLTpPZ8y5YcFD7
         1l+uNTr5jgtMRKPmWlr+KgKMBepoJMttKEDYYHj7atpcMFAaimgtOJSbm0XmqM+a2EJU
         J3JbEXhTPhlbCEUVqV2asLwaVpVEktXQPl6a0pEaFSBYucX6k/6ob1g1IdtHvvgf8Ro1
         OQiJFkMUMLnkFQym/copn+nFDlFRSMynCqd/+73eHdADLW2BT/EqUsvskB5k5X0PY46Q
         Y7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684050; x=1796288850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=496JOXpOEHemKz8UL2GWW4yob5VAkawIc7w2N9x0+W4=;
        b=Erb69X+YS3Z55KuiYKdbXfl9+g3aYMeogQXMKAQsgDXoJCjHJKXWhh9eZtWXOiVrbX
         froqwmbF4SGjmlmWcpzMpeDZ2KWA4p/ysJBUuemkuLhSpvK1WJA8vrzpdlq8m/I5v3c8
         9DXjid6+GXvErmjA0oWUNvbk29xXMBeIvvdKUR2qf+OTsLZ4//X99iSna+OBsSw4e+fS
         5EPRoRugIasAT861YvKY1BDTX1UOklwhXiJKLjy8Dk+FLcZOsFDJlPjakfdqIJXk+1cM
         FoWyPkoDdaPrTlHjoFN5/koc82X2JQEVF2o6Axg9dtxnC+fvtVWFZ03yPpEABsffmrXH
         gTfA==
X-Forwarded-Encrypted: i=1; AL+hErGm8nPKb4OvVhCYmtKLROwIOQjf2qj5hxlkC765C8dhRW5mXntOK8LqRDf7y26tiYAF4t7rA/dY93Wd@vger.kernel.org
X-Gm-Message-State: APuU4Z/syTaiV/SnUjPsgPTdngATWqUZFEcaU1uwcs0c3mC/p2R7RutU
	v1tTphE7lrpWi1k0r59jC3w7+l6SpE6zo3YJHbafL9cKnVsV5S+9ibEm6qiPUUvcQqsMO4Hh+ST
	uBXngGCc9Wr/yPIeq2mupurPutzapa0WOkB05dCJyrO/FBg2kOoN1rew+iWYpKkiVjKN1PhbBUA
	WgTykUjDZOqwFJhIqWra6sAb/nQ/7BOUqBr0vn/7gFUpeRkZgEQg==
X-Gm-Gg: AZFdTZcaMjt8m1KVcululPlXa27o338nuDP3AXVjO3smDBbwHSdhzDMz7u4eWGAst/7
	k6JgJ5gFRO7cquGfG89JImD7OkeABmrWLPDk2y/0ayAkiSTEFMbarrFNrxyMZVI/1lpcOLB9431
	XX6/bqhkINTf2Z2XDk0i3DNmVCKFWkfTKD471wW6tfPvi8m4X07QKev3s4F434yR/Yo3QCAKZl+
	iLUiJqZBlYNIgADsXx/0RA+YrfrrhtaQo1gTpLqnE9e3Ib+0XZONyoyXXz1dgWw5CI6f1V1TlDv
	Abv/LGH/Tteh1VgkqO6Wk6fQ7n0Lvkv9F6AwlN9Q/vMFveASTk1lvrHhbi6SB6e1v2jxdZjoe5v
	uTA45J2GaxFm18WSj0s9aMcLPNnwDHN1lyASj1EwdTx1dH/qmEHljnUMHWEIiSiXI1wqxXRsqrC
	Bs3ryKgcpZ70wiQ43/Esy7DpCJ7ON+yNNSfgQ9It4FXjHyPN2fRYuo9KVuv13/hkVSC/WP3Mo4N
	QBeQWEugmAgqrqN+KKGSRox4Eklbz6mgwxhrkcSmEie/GUr9PxkKBWOZ9YPR3I9qe/wo1nhCOe0
	eq13r450m2pd857qSWL13z8uZmbp/NDGTxcBnuwRkkwB
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr24314577eec.41.1795684050228;
        Thu, 26 Nov 2026 01:07:30 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:29 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:14 -0800
Subject: [PATCH 08/10] gtrace: rvtrace: Introduce struct
 rvtrace_ramsink_regs to abstract register offsets
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-send-preratified-trace-v1-8-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
In-Reply-To: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0

From: Eric Lin <eric.lin@sifive.com>

The pre-ratified trace ramsink implementation uses different register
offsets compared to the ratified RISC-V trace specification. To allow
the pre-ratified trace ramsink to leverage the rvtrace ramsink setup
and copy functions, introduce 'struct rvtrace_ramsink_regs'. This
abstracts the register map, enabling both pre-ratified and ratified
trace hardware to provide their own register layouts.

The read/write pair helpers no longer assume that the high register
is located right after the low register, and take both offsets.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/rvtrace-ramsink.c | 69 ++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
index 52aeb7626a55..a164db57167f 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -15,8 +15,11 @@
 #include "rvtrace.h"
 
 #define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
+#define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
 #define RVTRACE_RAMSINK_LIMITLOW_OFF		0x018
+#define RVTRACE_RAMSINK_LIMITHIGH_OFF		0x01c
 #define RVTRACE_RAMSINK_WPLOW_OFF		0x020
+#define RVTRACE_RAMSINK_WPHIGH_OFF		0x024
 #define RVTRACE_RAMSINK_WPLOW_WRAP		0x1
 #define RVTRACE_RAMSINK_CTRL_MODE_MASK		0x1
 #define RVTRACE_RAMSINK_CTRL_MODE_SHIFT		0x4
@@ -33,7 +36,39 @@ enum rvtrace_ramsink_mode {
 	MODE_SMEM
 };
 
+/**
+ * struct rvtrace_ramsink_regs - Register offsets for RAM sink implementations
+ * @start_low:  Offset of the start address low register
+ * @start_high: Offset of the start address high register
+ * @limit_low:  Offset of the limit address low register
+ * @limit_high: Offset of the limit address high register
+ * @wp_low:     Offset of the write pointer low register
+ * @wp_high:    Offset of the write pointer high register
+ *
+ * Different RAM sink implementations may have different register layouts.
+ * This structure allows the common code to work with any layout.
+ */
+struct rvtrace_ramsink_regs {
+	u32 start_low;
+	u32 start_high;
+	u32 limit_low;
+	u32 limit_high;
+	u32 wp_low;
+	u32 wp_high;
+};
+
+/* Register offsets for the standard RISC-V trace ramsink */
+static const struct rvtrace_ramsink_regs rvtrace_std_ramsink_regs = {
+	.start_low	= RVTRACE_RAMSINK_STARTLOW_OFF,
+	.start_high	= RVTRACE_RAMSINK_STARTHIGH_OFF,
+	.limit_low	= RVTRACE_RAMSINK_LIMITLOW_OFF,
+	.limit_high	= RVTRACE_RAMSINK_LIMITHIGH_OFF,
+	.wp_low		= RVTRACE_RAMSINK_WPLOW_OFF,
+	.wp_high	= RVTRACE_RAMSINK_WPHIGH_OFF,
+};
+
 struct rvtrace_ramsink_priv {
+	const struct rvtrace_ramsink_regs *regs;
 	size_t size;
 	void *va;
 	dma_addr_t start;
@@ -56,20 +91,22 @@ struct trace_buf {
 };
 
 /* Helper to access start, limit, wp pair registers */
-static u64 rvtrace_ramsink_read_pair(struct gtrace_platform_data *pdata, u32 low_off)
+static u64 rvtrace_ramsink_read_pair(struct gtrace_platform_data *pdata,
+				     u32 low_off, u32 high_off)
 {
 	u32 low, high;
 
 	low = gtrace_read32(pdata, low_off);
-	high = gtrace_read32(pdata, low_off + 4);
+	high = gtrace_read32(pdata, high_off);
 
 	return (u64)high << 32 | low;
 }
 
-static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *pdata, u64 val, u32 low_off)
+static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *pdata, u64 val,
+				       u32 low_off, u32 high_off)
 {
 	gtrace_write32(pdata, lower_32_bits(val), low_off);
-	gtrace_write32(pdata, upper_32_bits(val), low_off + 4);
+	gtrace_write32(pdata, upper_32_bits(val), high_off);
 }
 
 static int rvtrace_ramsink_start(struct gtrace_path_node *node)
@@ -152,6 +189,7 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
 					    u64 *format)
 {
 	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	const struct rvtrace_ramsink_regs *regs = priv->regs;
 	struct trace_buf src, dst;
 	size_t bytes = 0;
 	bool wrap;
@@ -163,12 +201,13 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
 	src.base = priv->va;
 	src.len = priv->size;
 	*format = PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
-	wp = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
+	wp = rvtrace_ramsink_read_pair(comp->pdata, regs->wp_low, regs->wp_high);
 	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
 	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
 
 	if (wrap) {
-		rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
+		rvtrace_ramsink_write_pair(comp->pdata, priv->start,
+					   regs->wp_low, regs->wp_high);
 		src.cur = wp - priv->start;
 		priv->prev_wp = priv->start;
 		/*
@@ -191,13 +230,14 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
 static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
 				     struct rvtrace_ramsink_priv *priv)
 {
+	const struct rvtrace_ramsink_regs *regs = priv->regs;
 	struct device *pdev = comp->pdata->dev;
 	u64 limit_max, end;
 	int ret;
 
 	/* Probe max value for limit register */
-	rvtrace_ramsink_write_pair(comp->pdata, U64_MAX, RVTRACE_RAMSINK_LIMITLOW_OFF);
-	limit_max = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	rvtrace_ramsink_write_pair(comp->pdata, U64_MAX, regs->limit_low, regs->limit_high);
+	limit_max = rvtrace_ramsink_read_pair(comp->pdata, regs->limit_low, regs->limit_high);
 	if (!limit_max) {
 		dev_err(&comp->dev, "trRamLimit register not implemented\n");
 		return -EINVAL;
@@ -218,13 +258,14 @@ static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
 	 * Check if DMA start and end addresses allocated by the kernel can be set in the ramsink
 	 * start, limit registers respectively.
 	 */
-	rvtrace_ramsink_write_pair(comp->pdata, priv->alloc_start, RVTRACE_RAMSINK_STARTLOW_OFF);
+	rvtrace_ramsink_write_pair(comp->pdata, priv->alloc_start,
+				   regs->start_low, regs->start_high);
 	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
 	end = priv->alloc_start + priv->alloc_size - priv->mem_acc_width;
-	rvtrace_ramsink_write_pair(comp->pdata, end, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	rvtrace_ramsink_write_pair(comp->pdata, end, regs->limit_low, regs->limit_high);
 
-	priv->start = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
-	priv->end = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF) +
+	priv->start = rvtrace_ramsink_read_pair(comp->pdata, regs->start_low, regs->start_high);
+	priv->end = rvtrace_ramsink_read_pair(comp->pdata, regs->limit_low, regs->limit_high) +
 		    priv->mem_acc_width;
 
 	/* Sanity check start, end addresses */
@@ -245,7 +286,7 @@ static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
 	priv->va = priv->alloc_va + (priv->start - priv->alloc_start);
 	priv->size = priv->end - priv->start;
 	priv->prev_wp = priv->start;
-	rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
+	rvtrace_ramsink_write_pair(comp->pdata, priv->start, regs->wp_low, regs->wp_high);
 
 	return 0;
 
@@ -275,6 +316,8 @@ static int rvtrace_ramsink_setup(struct gtrace_component *comp)
 		break;
 	}
 
+	priv->regs = &rvtrace_std_ramsink_regs;
+
 	if (priv->mode != MODE_SMEM) {
 		dev_err(&comp->dev, "only smem mode is supported\n");
 		return -EOPNOTSUPP;

-- 
2.43.7

