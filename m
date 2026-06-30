Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BF63E8355
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812823; cv=none; b=PZwb/9q396BUEFC1wrqKKroV+ng+bLdmUTJzPVqjaUNsW0chz8lBdPCM57ec1pMIreIdhFMWkQUT0tIiEri9tpIm1L24N2rFUtjCW6lmIBJGS5gYm4Ev9qwXaK7WjmLgzzH/X5SY/jdoSNWkuzJl2uO0Jb66/2rGGdyUhT579s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812823; c=relaxed/simple;
	bh=JTR9gEm5UhAF2yG09QL0loA3AKcywA37X87hRt3foz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZjdmE23YCiL1Us7qPe33lW1eQI417lbQL5XbwmmWWP4eaXfqKd6FJBFm2rS4zUEhFhJVhq0T6HXbCbFujwF0XvV3bcHk2NIkuM0S4eI/mixTyW3WEwP2y5JvvvUGqFpEI/Gs3IxpbOi94L31zEUsb9KG7v3M0Tkcu6WMOOf9Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=ipr971vA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ipr971vA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c9b42be8feso24745655ad.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812821; x=1783417621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnAOQCSsF2o4VZGP8SMJogyuZsC7iPNVxWIrUn/m6BM=;
        b=ipr971vAAvD+2iCbyOJCKAFd59lxjY8rj6X/Ue8lmIAk9C+U32B9Xs99xKqp+QxAr/
         5jY2k9MDtlXDrkH6v9sbQb13nbCqxrsRQpFVdHLu95/eoQnIg9+LSE6GIfqeSlBx1i9m
         YQk0q9hZp7CyoHr3fK5AVKe3ACQJYThCmol4bJSlHS8mzu4fbrFDL5NRLAAsHPklQovn
         kZWo6qwlJXButbA3QIJbtLOE1JtyKZPEqLg+Fq0sJ408P1t7DbYNf1SewUwb+GZLcwCl
         LMLQ54noXLQmjdl2u1o1FaUBNe0YjwdO9dJmqvSgr2l0lyb2C5HygNSka10WkwcyDFAC
         3YWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812821; x=1783417621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnAOQCSsF2o4VZGP8SMJogyuZsC7iPNVxWIrUn/m6BM=;
        b=CNtSvWcqUBcmTeK9bujJFZ5fD5cYchUHvx8Ci3Bpw7XfMN1p7Vc4dkj3fWQECQQDZL
         9A8gXqnCOEQGAEU+WApfQsOo/WJMc/9tFUtRSuXxtMRGQCI5dsZHk44Y4zxIXoIjl9Z0
         bV+qK8NtkqqPBeZopiCjS02n8BSDahfjsMD/aZg0+Umal8EAyu5FWQX18jb7ZIWpPdAh
         xZtfEmkIzlCE+ebuo+b4xdUGljXwqboLRBTs206/TsURTyJpVhW9g+GMRqnbjfp4Zaj9
         Sgimgm9N9PRzZ4tO9c6tqYlC0Fpzmo7Vns6jJvnjTzvLa3wip8eGQiAqWG77ZDYM1MUH
         RnUw==
X-Forwarded-Encrypted: i=1; AHgh+Rou7sEgFd7Pe3pEPjjTB12jh5SZhqm8gRmKlcveRsUUJplBmNPTIusjWK/s/A0BWBhEcf5qZWiY+s9R@vger.kernel.org
X-Gm-Message-State: AOJu0YzjlQ72ql+EvZDyVLcvvamCyRbP9QfjIU7S8c1de5CrOjmiJdeO
	+WVj4fKvIcaiR9IfWnbnHwI2Z4f7no2c5IAXUPj9IYeKbKLppHFWu9HhQt8ttmLfq9pSsdbg6Bc
	RS2I+ML+0kB+pO1AN8qIpM2tABiVhvF7wYHlRU9VXgDgjlUecqMKd4bvKkBYVALDhToCTwwAx4v
	LNv+VKFa+rXyvaSx9ZNsiQvwKJczWH6D9/RVKMBZF39xof2EcOpkCPLA==
X-Gm-Gg: AfdE7cnVXskKCdRanubsVlnJLzW47tRfQSTHEhgMDMZfUQ22bvvg2tZoJWAQP/TLDlQ
	ndrIgL9DhWuCX0/iqymPDMz+GdGqI3YFJjsJMb8IeXrSMNPLoBqg97xmtyL1CaLuxGHmd0LGUpm
	igvInLjsoKyk5WAb3OERV3MgssEfF1yvZeVgPS2b/LihGROaPWBpsVIcOQw+TWQOTwNNRLHBGTs
	dqrfkCdqZpHLWUyGGVdTy8Q7aGM5kGIS9WDnZC467bHjrZtPAYYjbxbDCAzbjLelOI0Uzy2Qtln
	IxIceZM8i+3pRnLgHsLsy88ignyHZXQdi+gKOS9tJE4r7lh8BzxWH/+yHbf4/Fc3ICEzpVYUwZX
	TTDT5mxgsH0YjZtTmkCLEy6BUlvgZiTCx/ZJ3GvcVTU173x90CeiKwW0zggyorHDI9TNwgheBQ/
	QLpokOGDHU8TLVb0ZxWOrRb5QewiyNZQU=
X-Received: by 2002:a17:902:e950:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2ca2d52a0cbmr23236415ad.3.1782812821271;
        Tue, 30 Jun 2026 02:47:01 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:00 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:26 +0800
Subject: [PATCH RFC 03/12] rvtrace: Add pre-ratified private data callback
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-3-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=7165;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=JTR9gEm5UhAF2yG09QL0loA3AKcywA37X87hRt3foz0=;
 b=tIbr2LFjXZEnVs8swWuQjZQ2fAxttCaAZlsULyX3YmBYqEw2oL34+Ya3+P/l+3mWuotHnCsQI
 bhlCNQl+RiyCkZUWHdGwLeJTk3dnBDCW/C3Fu9uZVWEgAM/XPS6KuYR
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=

For pre-ratified trace hardware, a trace component might support
different trace sinks, and its trace sink availability information
is embedded within the implementation register.

Introduce a get_data() callback function in 'struct rvtrace_driver_data'
to retrieve the component's supported trace sink features and store
this information in the component's private data. This allows the driver
to access the pre-ratified hardware capabilities during setup.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c     |  4 +++-
 drivers/hwtracing/rvtrace/rvtrace-platform.c | 11 ++++++++++-
 drivers/hwtracing/rvtrace/rvtrace-v0.c       | 20 ++++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-v0.h       | 21 +++++++++++++++++++++
 include/linux/rvtrace.h                      |  4 +++-
 5 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 58454e9ddb4e..51546cbcc6ad 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -368,7 +368,8 @@ static void rvtrace_component_release(struct device *dev)
 
 struct rvtrace_component *rvtrace_register_component(enum rvtrace_component_type type,
 						     u32 version,
-						     struct rvtrace_platform_data *pdata)
+						     struct rvtrace_platform_data *pdata,
+						     void *data)
 {
 	struct rvtrace_connection *conn;
 	struct rvtrace_component *comp;
@@ -413,6 +414,7 @@ struct rvtrace_component *rvtrace_register_component(enum rvtrace_component_type
 	comp->pdata = pdata;
 	comp->id.type = type;
 	comp->id.version = version;
+	comp->id.data = data;
 	ret = rvtrace_alloc_type_idx(comp);
 	if (ret) {
 		kfree(comp);
diff --git a/drivers/hwtracing/rvtrace/rvtrace-platform.c b/drivers/hwtracing/rvtrace/rvtrace-platform.c
index 6cf8e7dae2ad..8d2b03668c2a 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-platform.c
@@ -122,6 +122,7 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	u32 impl, type, major, minor;
 	struct device_node *node;
 	struct resource *res;
+	void *data = NULL;
 	int ret;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
@@ -168,6 +169,11 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	if (driver_data) {
 		if (driver_data->get_impl)
 			impl = driver_data->get_impl(pdata);
+		if (driver_data->get_data) {
+			data = driver_data->get_data(pdata);
+			if (IS_ERR(data))
+				return PTR_ERR(data);
+		}
 	} else {
 		impl = rvtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
 	}
@@ -179,7 +185,8 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	minor = (impl >> RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT) &
 		RVTRACE_COMPONENT_IMPL_VERMINOR_MASK;
 
-	comp = rvtrace_register_component(type, rvtrace_component_mkversion(major, minor), pdata);
+	comp = rvtrace_register_component(type, rvtrace_component_mkversion(major, minor),
+					  pdata, data);
 	if (IS_ERR(comp))
 		return PTR_ERR(comp);
 
@@ -205,10 +212,12 @@ static void rvtrace_platform_remove(struct platform_device *pdev)
 
 static const struct rvtrace_driver_data rvtrace_v0_encoder_data = {
 	.get_impl = rvtrace_v0_get_encoder_impl,
+	.get_data = rvtrace_v0_get_comp_data,
 };
 
 static const struct rvtrace_driver_data rvtrace_v0_funnel_data = {
 	.get_impl = rvtrace_v0_get_funnel_impl,
+	.get_data = rvtrace_v0_get_comp_data,
 };
 
 static const struct of_device_id rvtrace_platform_match[] = {
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.c b/drivers/hwtracing/rvtrace/rvtrace-v0.c
index 825de1120c8d..bed35f631390 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-v0.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.c
@@ -6,6 +6,26 @@
 #include <linux/rvtrace.h>
 #include "rvtrace-v0.h"
 
+void *rvtrace_v0_get_comp_data(struct rvtrace_platform_data *pdata)
+{
+	struct rvtrace_v0_comp_features	*data;
+	u32 impl;
+
+	data = devm_kzalloc(pdata->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	impl = rvtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+
+	data->has_sram_sink = impl & RVTRACE_V0_IMPL_HAS_SRAM_SINK_MASK;
+	data->has_atb_sink = impl & RVTRACE_V0_IMPL_HAS_ATB_SINK_MASK;
+	data->has_pib_sink = impl & RVTRACE_V0_IMPL_HAS_PIB_SINK_MASK;
+	data->has_sba_sink = impl & RVTRACE_V0_IMPL_HAS_SBA_SINK_MASK;
+	data->has_funnel_sink = impl & RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_MASK;
+
+	return data;
+}
+
 static u32 rvtrace_v0_get_impl(struct rvtrace_platform_data *pdata, u32 type)
 {
 	u32 impl, major, minor;
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.h b/drivers/hwtracing/rvtrace/rvtrace-v0.h
index 511aa6489caa..562d3a77c513 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.h
@@ -9,8 +9,29 @@
 
 #include <linux/rvtrace.h>
 
+#define RVTRACE_V0_IMPL_HAS_SRAM_SINK_BIT	4
+#define RVTRACE_V0_IMPL_HAS_ATB_SINK_BIT	5
+#define RVTRACE_V0_IMPL_HAS_PIB_SINK_BIT	6
+#define RVTRACE_V0_IMPL_HAS_SBA_SINK_BIT	7
+#define RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_BIT	8
+
+#define RVTRACE_V0_IMPL_HAS_SRAM_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_SRAM_SINK_BIT)
+#define RVTRACE_V0_IMPL_HAS_ATB_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_ATB_SINK_BIT)
+#define RVTRACE_V0_IMPL_HAS_PIB_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_PIB_SINK_BIT)
+#define RVTRACE_V0_IMPL_HAS_SBA_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_SBA_SINK_BIT)
+#define RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_BIT)
+
+struct rvtrace_v0_comp_features {
+	bool has_sram_sink;
+	bool has_atb_sink;
+	bool has_pib_sink;
+	bool has_sba_sink;
+	bool has_funnel_sink;
+};
+
 u32 rvtrace_v0_get_encoder_impl(struct rvtrace_platform_data *pdata);
 u32 rvtrace_v0_get_funnel_impl(struct rvtrace_platform_data *pdata);
+void *rvtrace_v0_get_comp_data(struct rvtrace_platform_data *pdata);
 
 #endif /* __RVTRACE_V0_H__ */
 
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
index fdf6115d7f06..9f1afcfd83e6 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -160,6 +160,7 @@ struct rvtrace_platform_data {
  */
 struct rvtrace_driver_data {
 	u32 (*get_impl)(struct rvtrace_platform_data *pdata);
+	void *(*get_data)(struct rvtrace_platform_data *pdata);
 };
 
 static inline u32 rvtrace_read32(struct rvtrace_platform_data *pdata, u32 offset)
@@ -263,7 +264,8 @@ struct rvtrace_component *rvtrace_cpu_source(unsigned int cpu);
 
 struct rvtrace_component *rvtrace_register_component(enum rvtrace_component_type type,
 						     u32 version,
-						     struct rvtrace_platform_data *pdata);
+						     struct rvtrace_platform_data *pdata,
+						     void *data);
 void rvtrace_unregister_component(struct rvtrace_component *comp);
 
 /**

-- 
2.34.1

