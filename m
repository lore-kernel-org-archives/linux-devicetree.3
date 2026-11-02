Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649213;
	b=K2enjmcV3o6bQkGgHO6mrTTyRbZM3jecoOssjWPkoWBIeOuihdvFsDTJmn5kfXaY1yad
	 KgLvzSfbdNvml00JJqI3ks0apRAz5QsvCYVKKDtNlkORb6xCJ1ENh2Fz+hjrPjJM3xV6Y
	 pDQFc391KdlcigelZFNksVbGAzfgPhBYkFzjcrFT8D/QYEqb3+D8C9lbCgfLE5Py3yFfF
	 3G/V4cZd5THGptvjbwQewt5I+3pB19SFqwnXBMrnNybwbEbk9Tq+mYNe6pEy2eTvS0u6O
	 2SSwvVDSmYik7sKPOaHY2wGM9yhxDH2KsXza2o8n8408+DGl98CxoYZc9ANN7llQTgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7d0shAOVJ1K7372dJ2kGybXJI56xuJHqHu/gSqF4j54=;
	b=AJg9jxwNjj3ulRvanDC7JzcAEENXWpBdwjq2mgZPQ/nyk5Zt4PjRFV1gJOgwAvpst1j3
	 hpZKHDmIxTIYTMqOvOAcWvRe+1xZNeB67w0fTgX+UlA7NpyC7CkUzUH0+KtNXbFQvOlPI
	 bmkMVTjDlp0Gn5cYmIF4L/4rFdMrFZUpUrZjz/nnjgGhc8JJ7+TkGf+JrbBr2+V2OeZ5r
	 ilVnFfUJYxDbZniTvZHWqFrKwsZ2tY42Jc0kEU/eek/QXC37+admEkghY+Sj+csteYfm9
	 D1H4mwxuJAbTuHo4gOJod6LjP2u0Cuf964UdThFXBzIkFdIHYKl78u4t4yEji5E/7JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tm6dYXLV;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB44F606A32D
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB44F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tm6dYXLV
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so26352415e9.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649210; x=1794254010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7d0shAOVJ1K7372dJ2kGybXJI56xuJHqHu/gSqF4j54=;
        b=tm6dYXLVklLHH8myqEweMrC1yiCYroQQ5l03wfAaG02x7dzD+jtd/XZapAvC2BFtJ8
         oQKoFx3G19wa62a2RwsVi5jsWyr2Jax+qIMfK6L+04bPtIu0oKzFgd9KMOwp8ZRo3FE8
         i+Zul6/QX0RHTvIICVFfbfR/HfGUCOtvdob7QRvRHgeCpQIJRvAx5gUM575WHu0WnrGk
         3OoYDXH2pt1Nt8E7Cvw6kfiV/WJ2QYrVMzXg51b/M9F7HpYu1Hoi3mKwC80R/YJdsWaj
         wqaE8oznYOjf/ZdPiSdYcuuY7y2cRq/i6ZVG06to2hDjrENA3bGCDmWIv80/nLEZqlI8
         3jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649210; x=1794254010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7d0shAOVJ1K7372dJ2kGybXJI56xuJHqHu/gSqF4j54=;
        b=yXcDVWqy7LPqgzP/NQTe0tPiCfXeAS5wawS5FiaUE7P+L6hbKVaTrcKa4wi10gphZ6
         QmykOZWNAZa4OWtKJPZPawwr8/tafB4gsXh5JukloSjcJThQlediPWvcJV6+yqQ2HqpL
         q0Cx0AuTlWrq4IYzsSYPUWzZL+gJM/N22Yvffn00+5AiY4A73JQgYQAOZobCx6MIEMbo
         1DdnRtQuPkIlbReS/GrgtTvQHpTgFVYjMSjaS7YBr8Ca3Hri/4d+xATj6wdZiFLFMmJ2
         w/K9NY6/0xf/Dj4q0LHSZLzXumvXIajoQ/RevsPI6wsG82O7sgiK8uDY8mKfePtT95cF
         TUmg==
X-Forwarded-Encrypted: i=1; AKwUvBxc+WEKVFoQyE75fExVfYoFGpCEkdIdzg5sYSB1FnKGW5vqZIsHP3vo4/RRxbWe/nPo54KcqpECSWyt@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ0elKyIAVJHC3kgjKszxfNBSm16lvL9XZypJ8VlvKY7pbSZB4
	3PqpFGsfDdIBrjQ4HUhmAOd/OwQTEoaOpyHzjVAgtEg/FcgXuSN8i+SCCXUxY/8By1o=
X-Gm-Gg: AYBFou2U/XM+YTFSnT6fJZuBpPRJPLXgj6zllRtBCskmUNfGLKYUPHLgKsHuYRCyxVH
	3WLqhkfqFEJ9UI+E8I9bnP6WWfHiHitReokR5xNtPj7A52MGjl+6xblnjDBnU85WP6IF4UvIIks
	TaHwE7Vtlut+3YZj9eFZhkCVFRT1ccyyIquHepYVMZKJkPUxXnUvttkdV9+mTltRuNmOlq9tzad
	x/bUxnWhDSW/6tyeqxFMysbzhEW4A+Oq6SehI8RBoCISP9PKwFAwCoj1hMWHq1989enWMwEp9UP
	t6szM2TnfLQmRjjK3a6O3zXe8tlC02JpfdFSDZKVWfTGb5SNYNMj8YFlVBx1mbCQCZe0u0jq0y/
	5/PhLtk9p09/4wxQqaieB5sB+/BZBkBvgwPCgGFZVbB/yewKzMleFtuhwMG6RWD57d/tkkJBk4S
	Rfq/CVkc1yWuW29l8n7h2PADN0MP+ZwEzaVP8AqopBj+qLX6L2helf/5x8y7U9/CTc/OPLWJzOE
	VE0FbtO8bs6kLJKkpvHDeknqXPKgCmUHeWJHnNpoz3nUeSnh09F4vTNWQcn4UhEVP+pFoSS6jlb
	mNYZxDiFAX0JF2QHPQ5gz0jniyEK0YbdBHpipoE/+cYx/kJsMwbxowrgjAdIL+FzB4PJoFBu4Xw
	4VfycOgnG4bwYkMuljcMrxISjjQ==
X-Received: by 2002:a05:600c:1f94:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4ac1548f591mr254361025e9.3.1793649210359;
        Mon, 02 Nov 2026 11:53:30 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:30 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:47 +0100
Subject: [PATCH v3 1/9] ARM: dts: omap: dm816x: Add specific pinctrl config
 defines
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-1-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1087;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=pNEg8PM8cIp8ox2y+p3fYgoghPcp69Vhurs3Xww0fMA=;
 b=7FEE9qKpkZS4TmJ0ng4j0OyfENMQ/VSbQvaLIHzr2DP8dPlCjEE33M8B+fZIJoj3KWBfvUBSq
 4UVr7SVq73QC7TRJsvkn9TnNlTt03EMZoDO3ZrKgov02XeVPMcF8afM
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

Add pinctrl config defines for TI DM816x SoC pinctrl configuration.
Using same definition as OMAP2/3 except pullup/down enable macros, which
are inverted for this SoC.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h b/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h
new file mode 100644
index 000000000000..b93f971cbe95
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This header provides constants specific to DM816X pinctrl defines.
+ */
+
+#ifndef _PINCTRL_DM816X_H
+#define _PINCTRL_DM816X_H
+
+#include <dt-bindings/pinctrl/omap.h>
+
+#undef PULL_UP
+#undef PULL_ENA
+
+/* DM816x mux bit defines */
+#define PULL_ENA		(0 << 3)
+#define PULL_DIS		(1 << 3)
+#define PULL_DN			(0 << 4)
+#define PULL_UP			(1 << 4)
+
+#endif

-- 
2.56.0

