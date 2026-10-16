Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36893AB5C3
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161687; cv=none; b=Qu9MvtCe2BJDdc8dS4FCvqBCJoWVr6urqzutdOKPZlRR8L4sTldbszexhvM++s5Zq6n62gURiGVIFYA9/g9AMnX+wg3poL/Z7l+y/VztiySpHUJ3uaAYesrbSlnc92y7omySahySFCsRN/Xcblg147AebJCUhEQe+NUgsGEzQIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161687; c=relaxed/simple;
	bh=Ldmay9QwO3gg+IGIDPYY4zVrqDjxeT9i+JqWgm/7kgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gMDcz0x6K6ntJj3exB9FkUg3BYnmThZ0JzImBox6YyZpkQuXFWgXmNTtSmJhoQ5MzZF+E2D3AkIHiBbwdh8mUCbI3/yFwjuF4T4RcEDUo2xBNdut6lWXnVmoXEwlFXz+Vvnza1p/vveWt5XEWjYHqJ/zdDpxTnrXL6kZZo5+DPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5m7nBNB; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5m7nBNB"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1523680f8f.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161684; x=1792766484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKla0beewDRf+y6czDuhAfCVHpAbSKZ3cp1Ezxdtm80=;
        b=o5m7nBNBVTUX58PYxitBc2IxPcPEMPKiEOgPlNrQT5K4CPXnLaal6gANRn09plABR7
         dyCoU3cX0EZjmCVI0+2Riy6mxgHNkq2G/svUrzh7IaKz3tqG1xYsGmNV+sHDK43OZWfp
         +/EcAf/C4pHuE/FYz4gpujVqSe0EMxFUkAXKA1rtaGh/l5QugtTQGjNY1Z2ZpeDXVafT
         P0ZX1kVHnCclA0u4YOGH79nS3Ta4UKqCh8DBlISK9KFDCsIPg+/lGy53BgzlkeMyhvc4
         rz/cCu+GxQK9d3/ud7N/Vtz0MxO+lLDtkZ97fn9ylbnlaKDaRzr4o1yjAOwihyGIN6F4
         dmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161684; x=1792766484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKla0beewDRf+y6czDuhAfCVHpAbSKZ3cp1Ezxdtm80=;
        b=GBWHrA+X8H39s6L2pHnuz4NKtXd8DH10uWrtel4SH18HrF/FLEhq2U/dsKIXZ87YhU
         8QSar2DCPrrKt6rWJqtaHDKjfc1EhglS8BrGj9ZpfWMDAY/+sIwCFQKLcau0o+bxWtsM
         ai+Kra1lmwm4Cpwwf6HqzfvsaNxiiRy/8HzU+1twAMkmewdiwp0mrjX1397KvalNzkYX
         q4iphZw8GorEGpuD/P58AEN8ylnO5E7+Ex/fY/nFRIObnMyiLzS8vo8ctNqzqzqAa98X
         o2c3YS4bfdwISzoJCJ1NTt3YIVffvQ2PB3eywwn/RHkVn8GLH4FNeDaQ+K9FXxUam6fJ
         753A==
X-Forwarded-Encrypted: i=1; AKwUvBwe5Sqgtg7S3cBWTxgt9sEaAiHXnSl49wtpI1BJTb1YtZwoxWW9V9sfP9uh93rkdoFEScg0/uOv8RF4@vger.kernel.org
X-Gm-Message-State: AFq9FYK6U2Eatbw2nknecQi9AhZA57JezvxHVTcYM7LD18nPcoy0j4ni
	W+hCRAp2zZ82nd8HP8KASFyDmaPI0X/rA4r/RHeS4zJvRw4/wyI+Hcvh8OFaj3LmGBg=
X-Gm-Gg: AYBFou0p8lzxFzzKL9bgEoU7f4a5fdc9BokUlUi0WGeBL4n++VjbSnJzizcydoFmNdF
	aaAD9N+SaxaI3rQW5Ex0vIfYayqxdkPiurRB+V8eV4d4DUPWpH0IIPGbmUwHSqdk4nmPNChLL5R
	GVfYMlDFlsby1OpEoZGFBpdeF+n7LwzugWzwPYXVmWd5aZPnN9dITvDBTkuZgpO0nnTGmjP9cbR
	hR4NgnGIdJn8NkWUJZ8H1KbnElmqbnDM8L2KUA2FaWD2gIUqm9AwYX3d8c3cOcIxWFwgvXtSXQ+
	Aln/IUt0uojYWujrylwPexngbyuFzF2puSLTk/rDwQsDXNwbC2yihAmHHEXIvb8TkK3GxnNYXid
	mkJg8Z+T7Lfuxs5x8MGlJCtSiOCaQuy6yaswsUI/Vs88TUWVPFWnj8rWoy2Ld+OR/jsh0i+dLgI
	bBUBMIzNXWJODPP5RXgezZ+CvvMThQZjTFvug3z9FO6au8lDdJ5eZAF1XSuAvR2iC/OLwBpSYJJ
	4F0O7wcb7Em0sjSFb7/Mb8kONFpvofjbw9uhwHFPSEoJUoUB8hGsTVbtbl8eDI6X0mH8Q==
X-Received: by 2002:a5d:59c9:0:b0:48d:f58f:c91 with SMTP id ffacd0b85a97d-48df58f0dadmr11842710f8f.19.1792161684079;
        Fri, 16 Oct 2026 07:41:24 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:23 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:17 +0200
Subject: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1087;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=Ldmay9QwO3gg+IGIDPYY4zVrqDjxeT9i+JqWgm/7kgE=;
 b=66GZw7iCsiX/A3jlcZvBstNeIKCIcwPkl/zB0PXA811CviVeXsTSD5ExJbsaK9vOJ/ACie66C
 jOHvBGugEGNBh6gznhogp46BBqamrLpOy/a6hSFeItYsAo2Cv4BVwW0
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

Add devicetree bindings for TI DM816x SoC pinctrl configuration.
Using same definition as OMAP2/3 except pullup/down enable macros, which
are inverted in this SoC.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-bindings/pinctrl/dm816x.h
new file mode 100644
index 000000000000..15aa15bca9bd
--- /dev/null
+++ b/include/dt-bindings/pinctrl/dm816x.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This header provides constants specific to DM816X pinctrl bindings.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
+#define _DT_BINDINGS_PINCTRL_DM816X_H
+
+#include <dt-bindings/pinctrl/omap.h>
+
+#undef PULL_UP
+#undef PULL_ENA
+
+/* DM81xx mux bit defines */
+#define PULL_ENA		(0 << 3)  /* Pullup enabled  => 0 */
+#define PULL_DIS		(1 << 3)  /* Pullup disabled => 1 */
+#define PULL_DN			(0 << 4)
+#define PULL_UP			(1 << 4)
+
+#endif

-- 
2.56.0

