Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684046;
	b=3Ugmz7Qv0JPchsayCzxF5XKzgscU5KPHVu93wigM1NhxBwn8NC72nEOl30Hhdh/RLutZ
	 hjyvIh78eyYQtRU63G7s44NqBe2r5jbuXo0fRdlWx8EUvH95AkCEhF/hXWX2b5qn4yVKj
	 RGxoo7+HnaZsofQWnoOz7Kstk6UlSNFQlhELh0fFLeZRWeQfayODDEWuPsar27kVD9d9x
	 7ZG+XdMzQ0cm9J2VrsOKXgN44ggxfuyXb1vBHwnfcrwefBM/WPklKBONUxQzZX7NduInV
	 oWZqIeIPXCFELw4Hd6cb7bcEOubhTjT+DNbsPaKT/q8q9JkmDinwZjIDAjVXI2WtZPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FwKsnhSZQ8XFeHSv0eyjguQWfHByolFJAVMuMClJrgY=;
	b=hnGhYGHobh6Ip2LgrtAPybPqDKLSs1mE5hrucG63lL2fjSCcYBSP6+G6maRXM1BkD7ff
	 8jR1Xf842SOlVa+/YJGP5XLI/4cfl1J36z5D0I8yPja4c5nGLIAZzV77mCruRlJy+zssX
	 g0kIgADW2DfNgr+mJbuTyPmK5Sdsczp/caOF4uzjO9hoPTyMNfS+1g2E9mRjsKnQzk047
	 X9Sj3J0obIYfYOBUEpPPT2A8w1q3GbCYtwjnQjR4m8YaMOPivCQkpgApIKSBbxABUjXyl
	 qdLj6YAmlWwbYHhmBm2/pwcx6N7iqpowde085eVrXuFhkj/EiqByOAWBK80siEfSvqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b="URjRXR/4";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AD7606A695
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3AD7606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=URjRXR/4
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-385c497bf94so5018280eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684045; x=1796288845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwKsnhSZQ8XFeHSv0eyjguQWfHByolFJAVMuMClJrgY=;
        b=URjRXR/4qk8UxaWTYAxDr3ynt6byh7CW70whhOjCwDZY9SLH+zdqEIHN7ctmddNBqK
         n50w3Wr4Bli0BfOmTggUdwZpyNzRFuQZXK56R1I/DxtTZytwHH1KH/S/DXNszW/nbuaI
         n0HBhEZcCiLsx/AKxzO4ajfmmjwB7FwltVOX40HvN/REVJIlBe1weBMr56gomUDU55Gm
         hXXMbffDjHm1DsHJs1ol0tf/oT7/wk4QePu4p/gh7+UZ+J7VcbLKfvRbs5N1+sXWcMrX
         yRt6pW3dlde6ED9OQkHQJVsOR3LZV2qkq1NyAe3fAxzQ4etEDpYm43Ww101IhU3FsKCs
         WQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684045; x=1796288845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwKsnhSZQ8XFeHSv0eyjguQWfHByolFJAVMuMClJrgY=;
        b=NZznPgH1RKigk+lXDUTk7o9HTZIPZIuWMh9fX67uNwhngn/2Jnd7kG5eVxdcKbgrUC
         Jlc7lC52mPlucnj2zaIFfufqQWni0v6PN6R+hv+/MOkmXS+Gd2TTbErPInOsEfeNEXiW
         mznxaxMpo0MJJAaS8PAq6Ym/xGC8tYdfZQp6nxhlr80WjhgmMkhV+ohQa7zDk66XkAzk
         TnMho6BagKDPYk46ryZ6XdHuMd2NrfwaflNyssJFwq522x2wv9yaQp93uj2cojNAobnM
         YgytJd556eIAYUfrW3DuiKcWRPZvIyNEUkEeQfTrzqPYZGpmZrUtbVDW6yz9dU+hxai8
         /P+Q==
X-Forwarded-Encrypted: i=1; AL+hErGyOLUzXOQpaZuuVDF1n3P33O6e2mAtohERhhkMDzkOx+SiJhLDOFjEMG2szlhw+qrZrsJ9ybT/RAvR@vger.kernel.org
X-Gm-Message-State: APuU4Z9TZ7NgzfTJcabiknBNpo9o9UYZDg8p5aVaS/O6mUAP62yxT+Pu
	CCbsFbK0tZnCU9/P03Ck8w91F/22bMqidv1sYNpzFyKgh/aBC9svmbLxnwhwmGMI98F5fj/J3OV
	zhg2qO1CIOVrmSg5Hhs9M8TYcf7z8J8HZvq7L5LNWew0WJblFsjx3nN0QmwfYfJm8oI6kQ9Wxyz
	kvLbeFbO3ULbBcjQod9aMn+ElyrsOjuBgq4NSwFswSB7erufwUAA==
X-Gm-Gg: AZFdTZe/C3kinmHJS6jjyu/uEk9OtUVHLLez2U50WNjDCUlF02gky4ATNj6gYLCg4JP
	lcCrbVLo/kGfqdhCBQ8Dzjadl79lwAuPO/3WRkU6YwuFcKQuiwfDff8a/9CYkeFE+lE0jwWuyY3
	n+csIq8JsJabud6HYTu3x0pN4UZvwStrWKF84s2IIZ+g6zIt9l5Hi4nnwniB/3S/uQRasY6OlqD
	xoi5YihULIe1coM6RgyD2I1ZSRIvosTuwN2q5uRF5hUf9PH9nosborBLtul1q8Rwllv1WsLR0Ju
	4JLKR0BUkAYhpFcGDtCWnsC6MCrEVWZnKfILt3loDmWssEs8T+0n7JIW5lGRyAwyx1fVCR4jXg+
	UzNJcf/m051SC4OTJZMoCN2SurJFvXvtvHiIqhY35SqESPDWOvxivwKP339A+C72WJfLHwigOzp
	cpiTKtv1XF6RqNFCLFn+qWLIE7feecbI5pyqIV61V5lp+i20u86OewJlg+f4TS49S/O0EQTgsuK
	/0wI2sjchxFOR/GfZuMg2OZTgmznDKm8risV7//lyauOovssLisjmcabiTzb8Xne00udpZ1dTZb
	NdVwmSP5AEjOsKS6mTCrvNVnCtc1i/5e6/eaz6ccdbCq
X-Received: by 2002:a05:7301:dd86:b0:351:2958:1740 with SMTP id 5a478bee46e88-3856fb641famr20691278eec.37.1795684044736;
        Thu, 26 Nov 2026 01:07:24 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:24 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:09 -0800
Subject: [PATCH 03/10] gtrace: rvtrace: Add pre-ratified private data
 callback
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
Message-Id: <20261126-send-preratified-trace-v1-3-1e686fd75be7@sifive.com>
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

For pre-ratified trace hardware, a trace component might support
different trace sinks, and its trace sink availability information
is embedded within the implementation register.

Introduce a get_data() callback function in 'struct rvtrace_match_data'
to retrieve the component's supported trace sink features and store
this information in the gtrace component ID data (comp->id.data). This
allows the driver to access the pre-ratified hardware capabilities
during setup.

While at it, zero-initialize the on-stack gtrace_component_id so that
id.data is never left uninitialized for ratified components.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/rvtrace-platform.c | 10 ++++++++++
 drivers/hwtracing/gtrace/rvtrace-v0.c       | 22 ++++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-v0.h       | 22 ++++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace.h          |  4 ++++
 4 files changed, 58 insertions(+)

diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index 8c1503bd8d98..b9b256d469e2 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -71,6 +71,7 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	u32 impl, type, major, minor;
 	struct device_node *node;
 	struct resource *res;
+	void *data = NULL;
 	int gtype;
 	int ret;
 
@@ -126,6 +127,12 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	else
 		impl = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
 
+	if (match_data->get_data) {
+		data = match_data->get_data(pdata);
+		if (IS_ERR(data))
+			return PTR_ERR(data);
+	}
+
 	type = (impl >> RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) &
 		RVTRACE_COMPONENT_IMPL_TYPE_MASK;
 	major = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
@@ -139,6 +146,7 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 
 	id.type = gtype;
 	id.version = rvtrace_component_mkversion(major, minor);
+	id.data = data;
 
 	comp = gtrace_register_component(&id, rvtrace_type_name(gtype), pdata);
 	if (IS_ERR(comp))
@@ -172,11 +180,13 @@ static const struct rvtrace_match_data rvtrace_std_data = {
 static const struct rvtrace_match_data rvtrace_v0_encoder_data = {
 	.format = GTRACE_FORMAT_NTRACE,
 	.get_impl = rvtrace_v0_get_encoder_impl,
+	.get_data = rvtrace_v0_get_comp_data,
 };
 
 static const struct rvtrace_match_data rvtrace_v0_funnel_data = {
 	.format = GTRACE_FORMAT_NTRACE,
 	.get_impl = rvtrace_v0_get_funnel_impl,
+	.get_data = rvtrace_v0_get_comp_data,
 };
 #endif
 
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.c b/drivers/hwtracing/gtrace/rvtrace-v0.c
index a5ca9001bc08..01e62642c245 100644
--- a/drivers/hwtracing/gtrace/rvtrace-v0.c
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.c
@@ -3,10 +3,32 @@
  * Copyright (c) 2026 SiFive Inc.
  */
 
+#include <linux/device.h>
+#include <linux/err.h>
 #include <linux/gtrace.h>
 #include "rvtrace.h"
 #include "rvtrace-v0.h"
 
+void *rvtrace_v0_get_comp_data(struct gtrace_platform_data *pdata)
+{
+	struct rvtrace_v0_comp_features *data;
+	u32 impl;
+
+	data = devm_kzalloc(pdata->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	impl = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
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
 static u32 rvtrace_v0_get_impl(struct gtrace_platform_data *pdata,
 			       enum rvtrace_component_type type)
 {
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.h b/drivers/hwtracing/gtrace/rvtrace-v0.h
index 2d83c87936b9..0681405fa414 100644
--- a/drivers/hwtracing/gtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.h
@@ -9,9 +9,31 @@
 #define __RVTRACE_V0_H__
 
 #include <linux/gtrace.h>
+#include <linux/bits.h>
 #include <linux/types.h>
 
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
 u32 rvtrace_v0_get_encoder_impl(struct gtrace_platform_data *pdata);
 u32 rvtrace_v0_get_funnel_impl(struct gtrace_platform_data *pdata);
+void *rvtrace_v0_get_comp_data(struct gtrace_platform_data *pdata);
 
 #endif /* __RVTRACE_V0_H__ */
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
index 7f9e88d99b8f..b0cf2e1d875f 100644
--- a/drivers/hwtracing/gtrace/rvtrace.h
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -115,10 +115,14 @@ static inline const char *rvtrace_type_name(enum gtrace_component_type type)
  * @get_impl: Optional callback to retrieve the implementation register value
  *            encoded in the standard RISC-V trace IMPL register format. Used
  *            by pre-ratified components whose IMPL register layout differs.
+ * @get_data: Optional callback to retrieve component specific private data
+ *            which is stored in gtrace_component_id.data. Returns an ERR_PTR()
+ *            on failure.
  */
 struct rvtrace_match_data {
 	enum gtrace_format format;
 	u32 (*get_impl)(struct gtrace_platform_data *pdata);
+	void *(*get_data)(struct gtrace_platform_data *pdata);
 };
 
 static inline int rvtrace_comp_poll_empty(struct gtrace_component *comp)

-- 
2.43.7

