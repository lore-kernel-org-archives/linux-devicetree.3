Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675793E866C
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812837; cv=none; b=Wx6SoT8eVoSgw050KRxzfsaare7gkXD9SVpUsRtaVc4lWteg/4idHL3bHNUKlQcpgMKarxYd8UHAZgu9bWFRl6wBJTx6hfFuQWsv2iozZ6H9yHKLdCTgnO1hdz7UlKFZRCg47gbC48pvDs9n/w9XPDvZ+Su2WPFCwB86nmqAKzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812837; c=relaxed/simple;
	bh=ECTwA0XtfV45FIxMVmnl4WL7ctH+u5U0uVvayrBzmhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IUkFljIErfJd72HaL0mR65e7ycvke9KHfzawd47mvyzgnTEbuS/cb6Kqyqtcr9Rj9cSfpENfrUr+lQvZiY5mK444E99mY/Yb7AYelmIRZvHuZCCksHTNfX21v8R4AdOBSvPBYYjqpDCfdoYJuwGr4T4zF6qzgaBEfL4U6I62Sgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=LIMMdNb9; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LIMMdNb9"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c7c61b5292so37819255ad.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812835; x=1783417635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozDuGKmJyaLLZ/9Y2e4zVCOrAth1HXfElawe4E1zEVc=;
        b=LIMMdNb9Unnu3VskUIXQRTtpxHfA5YUWhGVdtOvn+FVIlz7gXgcVoo4LR16EF7do6E
         vsLjh2pY2B8wtVHQwFz8/2aDsC4rjlDC2tfHymLlxw7KFGX8JsGqq8EY7y1MyfsQkxiu
         nXfTrYvgPMfnkm77s5u2PgpDATN5e4QCPWaJVX85bkuHB8l93JLG1giCUO2rxZhh0xHR
         3cV/XQNMtiPHae3qeMsEh/oGWOzyL3ewMa4CW9uhYl03g/BZVUhcdmdP6CPYOa4v7DVI
         8GFXTQva+NWG5BLO47892/2CrbZAaj53lcyPa5o0jKnXL6oltPniycLX/xf1RaBjn51r
         DmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812835; x=1783417635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ozDuGKmJyaLLZ/9Y2e4zVCOrAth1HXfElawe4E1zEVc=;
        b=kkn4RnDeZhpQsjfT5nwnyI4Ijl9dKb9fKd+6s2g2/ktLyGyFdLVtuAm5mideFCmxIv
         dAOQBoZRC72hQ84JYVFSCYSgZrLPBxDYYg1hCyu0ZNS5nOC/Rd4gxDay2DQZzpXad5PF
         w20I6A06cBhFOz2lCfJehnxzJda1US74GOh9E75gTPJuazepSAm0wQ0YEWW0uKsHkHOg
         TyN/f/YzmZ4ikir9z3yLinZ7a07G8YCGhXTwU82Z8rcb18P3Iz54X4SMz4261hedUAwt
         qHSqKwACGA7JEyv8TqnTxE8EGmKaFkZqdaboZQ2P8HEIeXpwSSaYhEC8ubAEfJXvcP0I
         ch+A==
X-Forwarded-Encrypted: i=1; AHgh+RqZEncVZiDdYF9CU7BvyfddicTNRGQyD6VmqsX0QeHvIUJ4AVv6ciDo9D4SWAC1LYXE7Rc52Z7hYV+1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8GFDrki3Iz1kV+IHsJqq3k6qOcvsttoccF/AOiFDa1EUaNDuk
	xgoxDh3r4xurPU60M7LZhcKNOOPjrnmTNnuasHmSL6TFrpCxnSuLC9vZqs66aieH+kB8iBfJXUt
	ge9VSlvGpDl76u1lZuppBCr5iydNIq6YjjzOB9m1QYH4d0+Tyzml+7WEPob+JTYGCcZDHlvdv1c
	D8X6Wrj3pX3RPH3gxdhkds6bAbKKF5Jkc4hqHLrxABEc/N7QfejS5w2Q==
X-Gm-Gg: AfdE7ck29ZkJeBEttLvAVdmQDWYhcqWf62IH9rad7O8Phd+CtAIgPbgodhaK5Ex4nct
	bL1CmcnfWAykez4pKOu/Xj/eW4zpbgjrfK++G6OiWd7MtMnQokRmHzZgg7HuerBACCqIsR3b5gS
	pWwjK0ek5MHd19dr106CkbX4VQ5n/CkjI3czPrKcv/+7pYHmIC1C3fnXDleG1ubsqnloIuu/1Ux
	+aNQdEtDpmZK4rpw5oIons/HdGxExwp6J6eUR7W3r5A568wjzwY3u2QG5JNjtjrSP4ZIQ7iQNfx
	ZyiAnrEnEXuWRkoIXxyYVPgX546U5YUJGNY6/3b5zsD7rqyl87u8d4eQ/bBaCoFfQimGN7ablDe
	RQs0XNlDJtFobVLIBq3VhfVIo9gVjlEX7W8UTbVRamSMbcC+OBAEP0/Ep5y/8p8ddX+tPP3KdDO
	QvclIX95BAUfMekPvsIMkef7IVphFpJ/M=
X-Received: by 2002:a17:902:ea0c:b0:2c9:fc14:588f with SMTP id d9443c01a7336-2ca2e915405mr23302545ad.29.1782812835400;
        Tue, 30 Jun 2026 02:47:15 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:14 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:29 +0800
Subject: [PATCH RFC 06/12] rvtrace: Add pre-ratified trace sink config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-6-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=5772;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=ECTwA0XtfV45FIxMVmnl4WL7ctH+u5U0uVvayrBzmhw=;
 b=lwgZgEA1WBif9ZVQ2oc6ygnD0CAKPkGgM2IdZ8v89xxblXjLonQfEF5ml90GGNjh5JF1APth5
 1Z+E8QPmFDyA3FixbxI9ELSf+gpPKQuPAR8k+sDCS5xnFP3MkvbNXMG
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=

To decide which sink to send trace data to, pre-ratified trace
hardware (eg., SiFive) sets a sink bitfield directly within the
current component's control MMIO register.

Introduce rvtrace_v0_sink_config() for pre-ratified trace hardware
to correctly configure the destination sink based on the hardware
capabilities and the current trace path before starting the trace.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-encoder.c | 27 +++++++++++-----------
 drivers/hwtracing/rvtrace/rvtrace-v0.c      | 35 +++++++++++++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-v0.h      | 15 +++++++++++++
 3 files changed, 64 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
index f3be47e448cf..47740bbdc206 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 #include <linux/rvtrace.h>
 #include <linux/types.h>
+#include "rvtrace-v0.h"
 
 #define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
@@ -15,14 +16,19 @@ static int rvtrace_encoder_start(struct rvtrace_path_node *node)
 {
 	struct rvtrace_component *comp = node->comp;
 	int ret;
-	u32 val;
+	u32 val, comp_maj;
+
+	/* Set pre-ratified comp's next sink */
+	comp_maj = rvtrace_component_version_major(comp->id.version);
+	if (comp_maj == 0) {
+		ret = rvtrace_v0_sink_config(node);
+		if (ret) {
+			dev_err(&comp->dev, "failed to set next sink.\n");
+			return ret;
+		}
+	}
 
-	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
-	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
-	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
-			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
-			       comp->pdata->control_poll_timeout_usecs);
+	ret = rvtrace_enable_component(comp->pdata);
 	if (ret) {
 		dev_err(&comp->dev, "failed to enable encoder.\n");
 		return ret;
@@ -61,12 +67,7 @@ static int rvtrace_encoder_stop(struct rvtrace_component *comp)
 		return ret;
 	}
 
-	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
-	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
-	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
-			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
-			       comp->pdata->control_poll_timeout_usecs);
+	ret = rvtrace_disable_component(comp->pdata);
 	if (ret) {
 		dev_err(&comp->dev, "failed to disable encoder.\n");
 		return ret;
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.c b/drivers/hwtracing/rvtrace/rvtrace-v0.c
index bed35f631390..ba87e1f7a839 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-v0.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.c
@@ -6,6 +6,41 @@
 #include <linux/rvtrace.h>
 #include "rvtrace-v0.h"
 
+int rvtrace_v0_sink_config(struct rvtrace_path_node *node)
+{
+	struct rvtrace_component *comp = node->comp;
+	struct rvtrace_path_node *next_node = NULL;
+	struct rvtrace_v0_comp_features	*data = NULL;
+	u32 val;
+
+	data = (struct rvtrace_v0_comp_features *)comp->id.data;
+	if (!data)
+		return -EINVAL;
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~RVTRACE_V0_CTRL_SINK_MASK;
+
+	/* last node in list */
+	if (!node->conn) {
+		if (data->has_sba_sink) {
+			val |= TE_SINK_SBA << RVTRACE_V0_CTRL_SINK_SHIFT;
+		} else {
+			dev_warn(&comp->dev,
+				 "Component is last node but doesn't support SBA sink\n");
+		}
+	} else {
+		next_node = list_next_entry(node, head);
+		if (next_node && next_node->comp->id.type == RVTRACE_COMPONENT_TYPE_FUNNEL &&
+		    data->has_funnel_sink) {
+			val |= TE_SINK_FUNNEL << RVTRACE_V0_CTRL_SINK_SHIFT;
+		}
+	}
+
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	return 0;
+}
+
 void *rvtrace_v0_get_comp_data(struct rvtrace_platform_data *pdata)
 {
 	struct rvtrace_v0_comp_features	*data;
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.h b/drivers/hwtracing/rvtrace/rvtrace-v0.h
index 562d3a77c513..48728fef24c0 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.h
@@ -9,6 +9,9 @@
 
 #include <linux/rvtrace.h>
 
+#define RVTRACE_V0_CTRL_SINK_SHIFT		28
+#define RVTRACE_V0_CTRL_SINK_MASK		GENMASK(31, RVTRACE_V0_CTRL_SINK_SHIFT)
+
 #define RVTRACE_V0_IMPL_HAS_SRAM_SINK_BIT	4
 #define RVTRACE_V0_IMPL_HAS_ATB_SINK_BIT	5
 #define RVTRACE_V0_IMPL_HAS_PIB_SINK_BIT	6
@@ -21,6 +24,15 @@
 #define RVTRACE_V0_IMPL_HAS_SBA_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_SBA_SINK_BIT)
 #define RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_BIT)
 
+enum rvtrace_v0_sink {
+	TE_SINK_DEFAULT = 0,
+	TE_SINK_SRAM = 4,
+	TE_SINK_ATB = 5,
+	TE_SINK_PIB = 6,
+	TE_SINK_SBA = 7,
+	TE_SINK_FUNNEL = 8,
+};
+
 struct rvtrace_v0_comp_features {
 	bool has_sram_sink;
 	bool has_atb_sink;
@@ -33,5 +45,8 @@ u32 rvtrace_v0_get_encoder_impl(struct rvtrace_platform_data *pdata);
 u32 rvtrace_v0_get_funnel_impl(struct rvtrace_platform_data *pdata);
 void *rvtrace_v0_get_comp_data(struct rvtrace_platform_data *pdata);
 
+int rvtrace_v0_sink_config(struct rvtrace_path_node *node);
+int rvtrace_v0_ramsink_setup(struct rvtrace_component *comp);
+
 #endif /* __RVTRACE_V0_H__ */
 

-- 
2.34.1

