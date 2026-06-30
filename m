Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163C62C237E
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812866; cv=none; b=fojhlY7VBmCMlU4qpnEJM8vMGKgdu9HWCC83RaPX2nAQhP9KhGhIulN8CfJ8Ex+Ebh9en2AF9YEy9MaP7lLAb8UzmZqsgl11BxTgeS6bJ930VdJ/pWobiCUJg1PXClhA/uFSaVS+hoZUyYfx97AGZnSsbiqYdzRChNE2zv6AJVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812866; c=relaxed/simple;
	bh=iA92P89O8Fbr2v9RT5UY8ZtumXveAuMX3tRI4pD1FjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYCleo092zOGpuAEJBBf44BuMGJgZ/20k5/TOe7riAHZhqd4KJ9FAbhMgc2pWHmod4w4EQ26K5J72LDg8m/gglZpHcuHvOI8ODRLbIjsXVGNT6B1BdjskDVsto0OX/R5Y3POAeIQ2bTg15Wep0X2vzG8ZzA78BbUGTARwjl/fXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=DxXsIDdx; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DxXsIDdx"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c9d87b1f9eso14299865ad.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812864; x=1783417664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCd0Rjz6Hwu0tTfmpV0ijwjuzSLgPDCGqWDTMjcsJq8=;
        b=DxXsIDdxyldu3IxGju8kNYUT5GNMBUihalIYpj6d25Bc2pwB9Vm8c9x5vR3j4GP9fK
         QF82b6ao4OIvmuo+k2wDyJN71otl18u4FCDwmWw7X12E9LjvY+C6kKfXAeOpfUOnh2by
         frVMAB0vsXh0AxqTBaFKtXmKj/1gGfRE58pKlIgl3PjUyxtFzlDAqDHMTQtE6SciaAdZ
         3Zfau3aX+Wgc7a6/YYj/BeVqfQ4igEQNbCJL0aK/E+Y6kPoST+JJ22Q/UYqLLPY5D5W3
         eKhlkDFXmzgWLttcsS3jvJztj3YEHbVWKRJoEXDUYH/VtY38H+tkDSwN3DdgohdC0zGM
         598w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812864; x=1783417664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fCd0Rjz6Hwu0tTfmpV0ijwjuzSLgPDCGqWDTMjcsJq8=;
        b=tW4+JFnikj/jTs/xpLrE2+GGbKj6GuJPMDXN97KHyOZLUEb7n4WHxQgBUNr56aQlN2
         zMniC7PQ+lvcB2/lQfXDba9AsJOWNPL/veaTPvCx8ibL09NKRrlhBUYaQPeEOrC4jysF
         prXXVflOpk987QF11Ryv33h3A/EWPnxncR6xhLfM6zdJwWDcC3pAuBtvYO+SbdkK2VRY
         sczVjLfaR+5YgVL7+Q9+rBuyMY7Pa8aXE32OK6BUUdHe0WtpH3NnE7ZdEzLfPHtmj9lk
         7C+Cisxy5hBl82EorSd+WcwVxFsrBw97d8v73XRE67K3HqMcI8flNtbnWOIJFXN8iBO/
         qlng==
X-Forwarded-Encrypted: i=1; AHgh+RonPEX3AK72lv3cCH/z5rLMg5QkcqKJ2YukZKGHOZ2Kdw0e42d/bNCNq77FpmWbMdVdanJhxEmalMZW@vger.kernel.org
X-Gm-Message-State: AOJu0YzY4emZqc8B5+EH7vk8V4fn4oMdKyG4mdnM2Z3HnPltoDOYWyYl
	JH01o1v/EkQg8/TxPIgSuBCR5io2Qe4NjaDAdi0OnNW8fZP72jkqaEcgOCv6A4/bnqWxi4vIloW
	YxH8M9gUBkZY5V55XH05FL1W7/ps0YlNkHznAN3+9DZtOKJwZ/pwmdQbF1zABrzQEe3I6ksMQ/E
	d8t+F2LKBrDv6J5UP5wsZsmf+eFN1S9SHKyr9uNJO/l2MW4KprbjTfBA==
X-Gm-Gg: AfdE7ckwJqacOv5qNSn8RCDFNcMF1NuWg620z+y0zgG87UbT4V9nyJSiVBek4c2UGhY
	z+/JRYI/VlEtU8njj1GGlSKJTcauIWc5QMSHbWnCB51FfwZndj8i2sjOlw93tNq/r/wMrQAHM7/
	LVi2VrsNHdMFydLuitgmOui9UKT8aHiq2J9LPyYVPb035mji6el90GeXn7oLi2OvdkpFhb0bFw+
	id4IcqWS3srThCTtp9QpIQAO75fyvDiToWAHERQLsWKdOBOcHeLR1SHG92Ww00Wz/pnApce8u80
	xOr2CgVYeVTbmJM2TjWFf30m2A1yGUywclQkbW1Oqdx/GqHBmFzBvE0WAdQwtTa+3HVxhMwQdaR
	w1OSFfT9ubL3+tvFzeITM1m8cLhCJb/l/Udza/Dr1MHVWxfGxkmINq+Qsiy/iLAuyUO4pQ0lvCu
	CX9NUyaLNkf6tV2/6H6L54dDzwteSSXFNQqkjLihLd7g==
X-Received: by 2002:a17:903:94b:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2ca2ed6765amr21739245ad.37.1782812864165;
        Tue, 30 Jun 2026 02:47:44 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:43 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:35 +0800
Subject: [PATCH RFC 12/12] rvtrace: Reset RAM sink write pointer on every
 context switch
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-12-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=4041;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=iA92P89O8Fbr2v9RT5UY8ZtumXveAuMX3tRI4pD1FjM=;
 b=lsjfiPDk1AqzyEu8JGuSbv04BwI0yhfgIRKiFCOzihuc3tq96944PXrWZW1Mj/zfGVzQhjkBX
 Mhdd2tOT0HLC5GYyT/7/pzcoPOsKXN8HnIk4ItWwXsKEBB0vu/IlQNE
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=

Currently, rvtrace_ramsink_copyto_auxbuf() only resets the RAM sink
Write Pointer (WP) when a buffer wrap occurs. If no wrap occurs, the
WP is not reset and is left at its advanced position.

This creates a highly non-deterministic tracing environment. For example,
consider a scenario where a user traces a program: On the first run, the
trace data fits within the buffer (no wrap) and the output is perfectly
captured. However, the WP is now left near the end of the RAM sink. If
the user runs the exact same program a second time, the hardware resumes
writing from this advanced WP. The buffer quickly wraps around,
prematurely overwriting the new trace data and resulting in unexpected,
incomplete output.

Fix this by unconditionally resetting the WP to the base address of the
RAM sink at the end of every data copy. This guarantees that every time
a trace session starts or a task is scheduled in, it has the full
capacity of the RAM sink available.

Consequently, tracking `prev_wp` is no longer necessary for calculating
offsets in the non-wrap case, so the data copy logic has been simplified
to always read from the start of the buffer.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
index d89cdcb971dd..8e9cbaa70f16 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
@@ -59,7 +59,6 @@ struct rvtrace_ramsink_regs {
  * @stop_on_wrap: Whether to stop tracing when buffer wraps
  * @mem_acc_width: Memory access width in bytes
  * @regs:         Pointer to register offset definitions
- * @prev_wp:      Previous write pointer position (for incremental copies)
  */
 struct rvtrace_ramsink_priv {
 	size_t size;
@@ -70,7 +69,6 @@ struct rvtrace_ramsink_priv {
 	bool stop_on_wrap;
 	int mem_acc_width;
 	const struct rvtrace_ramsink_regs *regs;
-	u64 prev_wp;
 };
 
 /**
@@ -202,25 +200,25 @@ size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
 	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
 	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
 	if (wrap) {
-		rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
-				regs->wp_low);
-		rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
-				regs->wp_high);
 		src.cur = wp - priv->start;
-		priv->prev_wp = priv->start;
 		/*
-		 * There is no way to tell if trRamWp wrapped around more than once. As a
-		 * result priv->prev_wp can't be used and the entire buffer must be copied
-		 * even though some data might be duplicated.
+		 * There is no way to tell if trRamWp wrapped around more than once.
+		 * The entire buffer must be copied even though some data might be duplicated.
 		 */
 		bytes = priv->size;
 	} else {
-		src.cur =  priv->prev_wp - priv->start;
-		bytes = wp - priv->prev_wp;
-		priv->prev_wp = wp;
+		src.cur = 0;
+		bytes = wp - priv->start;
 	}
 
 	tbuf_to_pbuf_copy(&src, &dst, bytes);
+
+	/* Reset WP after trace data copy to perf AUX buf */
+	rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
+			regs->wp_low);
+	rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
+			regs->wp_high);
+
 	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
 	return bytes;
 }
@@ -258,7 +256,6 @@ static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
 		return -ENOMEM;
 
 	priv->end = priv->start + priv->size;
-	priv->prev_wp = priv->start;
 	if (priv->end <= start_min || priv->start >= limit_max) {
 		dma_free_coherent(pdev, priv->size, priv->va, priv->start);
 		dev_err(&comp->dev, "DMA memory not addressable by device\n");

-- 
2.34.1

