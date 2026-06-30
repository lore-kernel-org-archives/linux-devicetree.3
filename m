Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18693EF0D7
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812857; cv=none; b=T2f/lCiH0Ja/yDr9ShfHJ2oRAKTe5q9N8OWRc+9YeD25K9xP835fIkOEazZTkvJBd4cZ2QdVh7dI7GbzzttQTUHfIthP1kU7Z3QjzIhoArtFgaKhouDc9uH/YVmUoEiQBrY5GlU5M9nzd4iiouHHPnb0U4KlGdFdqZgdCpsGbd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812857; c=relaxed/simple;
	bh=Y3LvXJ3xi2Nh+1HpbBhWNRW5L27t0VCjKmEzMmykAkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uLYy7arodFwSoLp0Brfr273uNsHKxxyRLwEOf+nkMh/tgiY3PZINwoEs9VGNzqIORKE1YYfepqcuQbtDGnaS9UrXSITHIHqGTeeOT/hV0LzWsVF+cGslGPlPHSl6eWXWqCv25Z6PxQFgAOhNJa40c55Juubej5E1p3fd84BkeyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=AFx1BPkN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AFx1BPkN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c8017e981fso22237655ad.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812855; x=1783417655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54+PVtGjT/I2+HzWeb9Nv2WTZ9NUADQGofIdWFcjJJQ=;
        b=AFx1BPkNOIrnQuszInKFuy07EFJcBApXwENvwOXX+Kh2H8zgqZ0j67yNwW7QUyM8RE
         9jEXc/bAI3ndsVK4veotPrvsBGfv6DUIE28zBL3EhrVOoOe4JWM1SjpWaP0bHKTqGngq
         J98iNAb/kHZiyhxZgu3c4bXEeQPMizXiq5FtGrxzLJRTtXGfoBcvsqgddbzZYWM0S/t5
         wgK4RjjFGDMu4trPKcw2x7f/6sFDW4hjXnxaZvi2vtVf8NKn+ipW/BOU44CMwrSlggk6
         yrd/lYCBULKNQl25ViB4TY/7wMTEPgrDKGZifA751Eqf64LuR0Ztz8A2K5tJi66g2Azm
         YPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812855; x=1783417655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54+PVtGjT/I2+HzWeb9Nv2WTZ9NUADQGofIdWFcjJJQ=;
        b=NWWI35QDCMuevc99EM+S53HVcsVx2+Utd9ZIb9oBZSQY2nBIucSOrJ/9E5jL2EOID2
         EjON+9HrMBcOlC+4PrG/FduFGfyFDM6UkRpRrXlFI70a3BG4Mot5lSVnS7Fcn9IABto4
         NUhnIITcyZOoDJizRUjMoYlZniHg4YkcBkb/9Qby+8OQrTmnlNt1cfQlmJpdgXU0YGaT
         5kDnW0ipz9XTjHOgRsv6PiSay7SrW6ZodyqkiC863eoY35jQHGoEPh4LRo6UVmMzkEv/
         JYwEp6ALr4z6B0X/92+K6hweyR9tKT8VjCWUPpSGh7i6kv27/RzZfMr3aRnHMdJ5jLFE
         dBEw==
X-Forwarded-Encrypted: i=1; AHgh+RoXw7hRLz9rV3y9WWrJCJ/eCM+mfkWOKDnXUi9Rrc+FylaCH4nWU7XkqclfmdXoofkfhtAHypzcFdDP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxssfau/TMPvuHkXSb9sLwyI/Eufyq1cGlCXlSN0Ksiv9XsHGr0
	pac73NDfe+JxP1tCae+PVirrZ/u+AQ7GeSQZOdmOCtLTq/0SW177jEl7MV7onexmVI7jjiinga5
	iqguKpg1f1fMNHGZ8DFL2nGn4qDvC7FvoPiTHMi0rzGJBla+GjWHQl/NlUHK82ybEcrrYVlguSo
	jCgJLx4sQQbyVvIKyUUFkDlgiJxyfTGzaL9MfQQ4orbsLBy18MxWadOg==
X-Gm-Gg: AfdE7ck2EQhz4BURFJppOtwvekaML9zG3GC3gy6KmSoDQ3W3qfgNVT28VMqbvg7XNHv
	Ple36H73VZixl4fL5vxnex2E91VQJPHZ5uWkKUX/IFEcY/krnraAfZM4/k4HLPGR8a4xo8pg/Ae
	XyL7pMSWusFNLmTNnUwQ8EZmdMe7N9sxMx0UgZf8Fiqz/apwZfRRaA2YbCpdZ0mmxA43G9OGVpW
	hyKOdy+1ogJBbIIEze721g43xLxgPFlH/VaBQ3cnV3l+CR6Wr3uiTPd/tI/FwaaVQIGhQYYxMF2
	Cu0keOMhW+buNYj62F+i8MnO0WqawItkb3P7CVdq2dhrQzylj8zGRa0TOy9k7VG1T/4IyNsgQMO
	WMd86jg1pbUiMngoU8PX6YWH5QDB/NAzXywgTEzmPI0rAeJsoiCTNp0T68eBXo8d1guRN7N9YIn
	50bk4/j/rQmBP561oiK4GE5bUYlEYldTY=
X-Received: by 2002:a17:902:e5ce:b0:2c9:97a7:f543 with SMTP id d9443c01a7336-2ca2eb33b99mr19931405ad.41.1782812854578;
        Tue, 30 Jun 2026 02:47:34 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:33 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:33 +0800
Subject: [PATCH RFC 10/12] rvtrace: Add copyto_auxbuf callback for
 pre-ratified encoder and funnel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-10-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=6066;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=Y3LvXJ3xi2Nh+1HpbBhWNRW5L27t0VCjKmEzMmykAkg=;
 b=yZAyP0pNSWntOPDmVRDriT6BLWnDpoI8J1hALe2FjprJKbrdNQZXXMBGlksIJ+9wpiyX0YAlS
 Dz1xA3RgL5tCuedfhyy3tK3tQDW/B302hQVzT/7iyJGk28mB0JgUYRs
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=

Unlike the standard RISC-V trace ramsink, which is an independent
device, the pre-ratified ramsink are embedded within the trace encoder
or funnel MMIO registers.

When pre-ratified encoder and funnel components act as a sink, the
trace data must be copied from the trace buffer to the perf AUX buffer
after tracing is stopped. To support this, export
rvtrace_ramsink_copyto_auxbuf() and assign it as the copyto_auxbuf
callback for the encoder and funnel drivers.

Note: if an encoder or funnel component is acting as a source in a
given path, we must check that the trace component is the last node
in the trace path before invoking its copyto_auxbuf() callback.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c    |  2 +-
 drivers/hwtracing/rvtrace/rvtrace-encoder.c | 10 ++++++++++
 drivers/hwtracing/rvtrace/rvtrace-funnel.c  | 10 ++++++++++
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c |  5 +++--
 drivers/hwtracing/rvtrace/rvtrace-ramsink.h |  2 ++
 5 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 153cf3ebffff..d902524e0358 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -677,7 +677,7 @@ int rvtrace_path_copyto_auxbuf(struct rvtrace_path *path,
 	list_for_each_entry(node, &path->comp_list, head) {
 		comp = node->comp;
 		rtdrv = to_rvtrace_driver(comp->dev.driver);
-		if (!rtdrv->copyto_auxbuf)
+		if (!rtdrv->copyto_auxbuf || node->conn)
 			continue;
 
 		*bytes_copied = rtdrv->copyto_auxbuf(comp, buf);
diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
index b187731ff855..41e74cac0c25 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -7,6 +7,7 @@
 #include <linux/rvtrace.h>
 #include <linux/types.h>
 #include "rvtrace-v0.h"
+#include "rvtrace-ramsink.h"
 
 #define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
@@ -78,6 +79,8 @@ static int rvtrace_encoder_stop(struct rvtrace_component *comp)
 
 static int rvtrace_encoder_probe(struct rvtrace_component *comp)
 {
+	struct rvtrace_v0_comp_features *data;
+	struct rvtrace_driver *rtdrv;
 	int ret;
 	u32 comp_maj;
 
@@ -87,6 +90,13 @@ static int rvtrace_encoder_probe(struct rvtrace_component *comp)
 		ret = rvtrace_v0_ramsink_setup(comp);
 		if (ret)
 			return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+
+		data = (struct rvtrace_v0_comp_features *)comp->id.data;
+		if (data && (data->has_sba_sink || data->has_sram_sink)) {
+			rtdrv = to_rvtrace_driver(comp->dev.driver);
+			if (!rtdrv->copyto_auxbuf)
+				rtdrv->copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf;
+		}
 	}
 
 	ret = rvtrace_enable_component(comp->pdata);
diff --git a/drivers/hwtracing/rvtrace/rvtrace-funnel.c b/drivers/hwtracing/rvtrace/rvtrace-funnel.c
index 21f58001d569..b30609278a79 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-funnel.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-funnel.c
@@ -8,6 +8,7 @@
 #include <linux/rvtrace.h>
 #include <linux/types.h>
 #include "rvtrace-v0.h"
+#include "rvtrace-ramsink.h"
 
 static int rvtrace_funnel_start(struct rvtrace_path_node *node)
 {
@@ -53,6 +54,8 @@ static int rvtrace_funnel_stop(struct rvtrace_component *comp)
 static int rvtrace_funnel_probe(struct rvtrace_component *comp)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(comp->pdata->dev);
+	struct rvtrace_v0_comp_features *data;
+	struct rvtrace_driver *rtdrv;
 	int ret;
 	u32 comp_maj;
 
@@ -62,6 +65,13 @@ static int rvtrace_funnel_probe(struct rvtrace_component *comp)
 		ret = rvtrace_v0_ramsink_setup(comp);
 		if (ret)
 			return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+
+		data = (struct rvtrace_v0_comp_features *)comp->id.data;
+		if (data && (data->has_sba_sink || data->has_sram_sink)) {
+			rtdrv = to_rvtrace_driver(comp->dev.driver);
+			if (!rtdrv->copyto_auxbuf)
+				rtdrv->copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf;
+		}
 	}
 
 	ret = rvtrace_enable_component(comp->pdata);
diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
index e794b01e19d0..d89cdcb971dd 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
@@ -179,8 +179,8 @@ static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size
 	}
 }
 
-static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
-					    struct rvtrace_perf_auxbuf *buf)
+size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
+				    struct rvtrace_perf_auxbuf *buf)
 {
 	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
 	const struct rvtrace_ramsink_regs *regs = priv->regs;
@@ -224,6 +224,7 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
 	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
 	return bytes;
 }
+EXPORT_SYMBOL_GPL(rvtrace_ramsink_copyto_auxbuf);
 
 static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
 				     struct rvtrace_ramsink_priv *priv)
diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.h b/drivers/hwtracing/rvtrace/rvtrace-ramsink.h
index 7e0391aeffd5..a398db78e803 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-ramsink.h
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.h
@@ -7,5 +7,7 @@
 #define __RVTRACE_RAMSINK_H__
 
 int rvtrace_ramsink_setup(struct rvtrace_component *comp);
+size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
+				     struct rvtrace_perf_auxbuf *buf);
 
 #endif /* __RVTRACE_RAMSINK_H__ */

-- 
2.34.1

