Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33933EEACB
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812848; cv=none; b=qIRPsPDNyfOzmilG51jHcYidLC7msL+Fmi4+TF+QoJAsttyUsMFLBrdX9HOkIqZoNkU7Xj1lPjLAeHngPKvAETNxRPFLCZUzVKORFaGMaKY82Nb9toVYCRN9mpmNj6Y1pVDY4jtbTHidQJW/5BbSe8UUoTZqZV54Lx9krUxx1Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812848; c=relaxed/simple;
	bh=5/p1BkMdW55JzvCfTycWeCnv1Rmss0WQ88QFmhxlUK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AUhN+xu1uyiBW9T8VtNaV27s//arpGUBV1E2UMWKypCFgjSRJyO2kU5XVbAFylRSw+OCx3v/Kh9UkRWo75Q+dCFWcIf4cXasDIVdZi9O4PzJdjPJEY1+kYPXyJdf2oXV08dM2bxIu85fBl03hDY1OeOAysHUE1KoIFegh6BeqDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Mejr4SJr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Mejr4SJr"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c821a50615so21685895ad.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812846; x=1783417646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFOOmoV1aNQ+UZSLd9xC7p0AFbf/86JbQyaITygLl/I=;
        b=Mejr4SJrb+TgyTY9FEAoXRnAUDbSzuUyeA3SzBArYmdy/JkdShfXKFrEfqEKzaYmXL
         iRDgjBnaqV+pV6XtzYFdHOYv1RVjktIU+z20XFdMiHVnZqA/TxYzOeutSvFAU772aLui
         vsXtdc1HyBtknUXyhs8vjKA2V7S0C7OM9FVmxiByz/sUNtaZDLwJtAPgMZHroFkTyoT5
         Vt8Q/dgmAMwKm++uW1m8SDVuJwsYajyj9y+ZRMlw97iNZkf6Rrrs6zmb+pduO/9qETKd
         cQVB61F32DGpAvq3uSTPiBw9Ab1ooYsdiuIbhfHfBocqqaJYnk0oWDYuIshyB9ITGNnn
         LjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812846; x=1783417646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BFOOmoV1aNQ+UZSLd9xC7p0AFbf/86JbQyaITygLl/I=;
        b=JjvigGkptw64jlL3QaXq/5gACcqQ8kHWHfiJCUyiFmhaqrHwIAs6s709+WjVBS6JRn
         e+tGihx1UoL4aAERZdT37xGLD/fN9JzYK6+ZGGCaTcTWUz6+Ej9eOYZqsUFkX2uSKyQq
         YmTW6ojflyuF/E0f/WxIFGt7AxFtiGtZYLraigABVptWpC0hhmfbtlWL3TeH3jYfSOU3
         PRqrDaHcbM/K2f7Ad35ozN1lZ9Q+3zg04nIkOs1UNxkxJ1uMQX1jrEvDCiakckDL2y0p
         T/Xw0snIS7SyAv6F6uyBCO3IO9dCy4PBMnvTkokDlyBOH1U/jyDACDx99rK0tTWbypMW
         4m2A==
X-Forwarded-Encrypted: i=1; AHgh+RqPgcDt6XWS3SxqwqGttAXIDtrcqQu9p3TXCwtCKkC/dXo4/UdsMqOosvCk6jeDsUPJPCCK3b0rF+s+@vger.kernel.org
X-Gm-Message-State: AOJu0YwDAT7iasveRg83leq9eGm0OlJBTlEDHcWeOu7m8K/Iwr1C0M5X
	Lxekkqi9TO/bhEqXFIvkGtD2RhlOihdY0YhrYbfQpYL8B1dr5dJpwXy5L6QUzIpBG3n5BmYYluf
	pVCaXp0PB+fCd4hRVC4RAU7dZYuEkwrKgndWnpDU3ywlLVTkF+0h3apsMlIIow5xoLJ4bl5OdqY
	NjP4QLpQog1f9787dpWl90jeVrYo4SP6/lAHS3Yf4Q8fnzfJCNh94f4w==
X-Gm-Gg: AfdE7cny0LbzQEgLVa7BfvYXhVxNVz7ctSYlGOaMT4s1VUEkHSisfu7Nv47I7SPYAVZ
	E1Ux6KoYtJ+HTGOo/FoWPO9OLPGb/WTImsksEo1n9i+UOy9VLCX1cMVqLIfJN6plPsg2cJ9UqeD
	9DtkjewLAMvaexXiWKfRJjZkkvEtUxxAjSDnlz+ZNLM6emTSP+BRMF8chcyQhZ6qPGl7QWp5vgz
	yTMMfac7xXzw3FtOlzircS8qFH4YjMbAo/UUr+A3/ZSq5vmHTSTGU2ZGgCp415xNOvXuB9NKAtG
	MKwcyZozEoWnPLdR3i2Nx5MjfYeZ1O1N+PxBUvJpQ90uv1F4sEFpmS8SxAFe2pO+kQ3QKSKsOyO
	kdUfag8CriS7aI30GNaqAPPsQINvn/S8Udmh/qwYjINhchVqN/sJCjKPoz9+vWNZ+Xzejp/8zGs
	rXqcyVtk4nmoDKHsaAlGrRw3nZTQxnT8waJqYswlvt4Q==
X-Received: by 2002:a17:903:1b6d:b0:2c9:f44e:9942 with SMTP id d9443c01a7336-2ca2d547e03mr23166855ad.13.1782812844489;
        Tue, 30 Jun 2026 02:47:24 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:23 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:31 +0800
Subject: [PATCH RFC 08/12] rvtrace: Introduce struct rvtrace_ramsink_regs
 to abstract register offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-8-c9c1ffc64e4b@sifive.com>
References: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
In-Reply-To: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
 Eric Lin <dslin1010@gmail.com>, Eric Lin <eric.lin@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=8625;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=5/p1BkMdW55JzvCfTycWeCnv1Rmss0WQ88QFmhxlUK0=;
 b=XmAjM4IPZ7JekNuRXy+uU+tMpw2zAAw2qbW7VEutOMIm1NXa4oN+RBf3Qbx1Kc4SQfEpnJUFu
 YxisxbAGAxxDAnRC177xnShYjsftsLTvof7Xh3bDQSbt2IiSbB8Azyu
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=

The pre-ratified trace ramsink implementation uses different register
offsets compared to the ratified RISC-V trace specification. To allow
the pre-ratified trace ramsink to leverage the rvtrace_ramsink_setup()
function, introduce 'struct rvtrace_ramsink_regs'. This abstracts the
register map, enabling both pre-ratified and ratified trace hardware
to provide their own register layouts.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 97 ++++++++++++++++++++++-------
 1 file changed, 76 insertions(+), 21 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
index 7aa525ac0f75..e569e875568b 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
@@ -26,6 +26,39 @@ enum rvtrace_ramsink_mode {
 	MODE_SMEM
 };
 
+/**
+ * struct rvtrace_ramsink_regs - Register offsets for RAM sink implementations
+ * @start_low:   Offset of the start address low register
+ * @start_high:  Offset of the start address high register
+ * @limit_low:   Offset of the limit address low register
+ * @limit_high:  Offset of the limit address high register
+ * @wp_low:      Offset of the write pointer low register
+ * @wp_high:     Offset of the write pointer high register
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
+/**
+ * struct rvtrace_ramsink_priv - Private data for RAM sink implementations
+ * @size:         Size of the allocated DMA buffer
+ * @va:           Virtual address of the DMA buffer
+ * @start:        DMA start address
+ * @end:          DMA end address
+ * @mode:         Ramsink mode (e.g., SRAM vs SMEM)
+ * @stop_on_wrap: Whether to stop tracing when buffer wraps
+ * @mem_acc_width: Memory access width in bytes
+ * @regs:         Pointer to register offset definitions
+ * @prev_wp:      Previous write pointer position (for incremental copies)
+ */
 struct rvtrace_ramsink_priv {
 	size_t size;
 	void *va;
@@ -34,15 +67,32 @@ struct rvtrace_ramsink_priv {
 	enum rvtrace_ramsink_mode mode;
 	bool stop_on_wrap;
 	int mem_acc_width;
+	const struct rvtrace_ramsink_regs *regs;
 	u64 prev_wp;
 };
 
+/**
+ * struct trace_buf - Trace buffer descriptor for copy operations
+ * @base: Base address of the buffer
+ * @cur:  Current position in the buffer
+ * @len:  Length of the buffer
+ */
 struct trace_buf {
 	void *base;
 	size_t cur;
 	size_t len;
 };
 
+/* Register offsets for the standard RISC-V trace ramsink */
+static const struct rvtrace_ramsink_regs rvtrace_std_ramsink_regs = {
+	.start_low    = RVTRACE_RAMSINK_STARTLOW_OFF,
+	.start_high   = RVTRACE_RAMSINK_STARTHIGH_OFF,
+	.limit_low    = RVTRACE_RAMSINK_LIMITLOW_OFF,
+	.limit_high   = RVTRACE_RAMSINK_LIMITHIGH_OFF,
+	.wp_low       = RVTRACE_RAMSINK_WPLOW_OFF,
+	.wp_high      = RVTRACE_RAMSINK_WPHIGH_OFF,
+};
+
 static int rvtrace_ramsink_start(struct rvtrace_path_node *node)
 {
 	struct rvtrace_component *comp = node->comp;
@@ -117,6 +167,7 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
 					    struct rvtrace_perf_auxbuf *buf)
 {
 	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	const struct rvtrace_ramsink_regs *regs = priv->regs;
 	struct trace_buf src, dst;
 	u32 wp_low, wp_high;
 	size_t bytes = 0;
@@ -128,16 +179,17 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
 	dst.cur = buf->pos;
 	src.base = priv->va;
 	src.len = priv->size;
-	wp_low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
-	wp_high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
-	wp = (u64)(wp_high) << 32 | wp_low;
+
+	wp_low = rvtrace_read32(comp->pdata, regs->wp_low);
+	wp_high = rvtrace_read32(comp->pdata, regs->wp_high);
+	wp = (u64)wp_high << 32 | wp_low;
 	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
 	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
 	if (wrap) {
 		rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
-				RVTRACE_RAMSINK_WPLOW_OFF);
+				regs->wp_low);
 		rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
-				RVTRACE_RAMSINK_WPHIGH_OFF);
+				regs->wp_high);
 		src.cur = wp - priv->start;
 		priv->prev_wp = priv->start;
 		/*
@@ -160,22 +212,23 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
 static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
 				     struct rvtrace_ramsink_priv *priv)
 {
+	const struct rvtrace_ramsink_regs *regs = priv->regs;
 	struct device *pdev = comp->pdata->dev;
 	u64 start_min, limit_max, end;
 	u32 low, high;
 	int ret;
 
 	/* Probe min and max values for start and limit registers */
-	rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
-	rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
-	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
-	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
+	rvtrace_write32(comp->pdata, 0, regs->start_low);
+	rvtrace_write32(comp->pdata, 0, regs->start_high);
+	low = rvtrace_read32(comp->pdata, regs->start_low);
+	high = rvtrace_read32(comp->pdata, regs->start_high);
 	start_min = (u64)(high) << 32 | low;
 
-	rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
-	rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
-	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
-	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	rvtrace_write32(comp->pdata, 0xffffffff, regs->limit_low);
+	rvtrace_write32(comp->pdata, 0xffffffff, regs->limit_high);
+	low = rvtrace_read32(comp->pdata, regs->limit_low);
+	high = rvtrace_read32(comp->pdata, regs->limit_high);
 	limit_max = (u64)(high) << 32 | low;
 
 	/* Set DMA mask based on the maximum allowed limit address */
@@ -203,10 +256,10 @@ static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
 		priv->start = start_min;
 	}
 
-	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
-	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
-	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
-	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
+	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), regs->start_low);
+	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), regs->start_high);
+	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), regs->wp_low);
+	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), regs->wp_high);
 	/* Setup ram sink limit addresses */
 	if (priv->end > limit_max) {
 		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
@@ -217,10 +270,10 @@ static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
 
 	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
 	end = priv->end - priv->mem_acc_width;
-	rvtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
-	rvtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
-	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
-	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	rvtrace_write32(comp->pdata, lower_32_bits(end), regs->limit_low);
+	rvtrace_write32(comp->pdata, upper_32_bits(end), regs->limit_high);
+	low = rvtrace_read32(comp->pdata, regs->limit_low);
+	high = rvtrace_read32(comp->pdata, regs->limit_high);
 	end = (u64)(high) << 32 | low;
 	if (end != (priv->end - 4)) {
 		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
@@ -252,6 +305,8 @@ static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
 		break;
 	}
 
+	priv->regs = &rvtrace_std_ramsink_regs;
+
 	trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
 	trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
 	rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);

-- 
2.34.1

