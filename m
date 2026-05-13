Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FFB35839C
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693102; cv=none; b=gZPDsy5njjMH35kDPIsgagFhwqs1xq/TzIiaVqikahbcH+eZYl1/OliNMssh5Gc7yrBzvKaZr+ChmIvwQzxOoVtJwXOLcibFhkItakPgOeDB0CZmqQvkSQzeWq956CRbjBs+jUGBZ9g6vREo+uE0q53+EnM/84KtLy1oQJHaE1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693102; c=relaxed/simple;
	bh=wJ6p36sQ7ksIIiWfPWxaQgJmH9W8pqsZ3aoTLGeXLQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4ohR25P/s81mBDIC7eb6C4C1V4xPx3YktLig06MvEJZIB7QzfmwY85EHOcWvSNx115IBj3SB59hMjAsfho+GgtT4nKAqIZ2wxI8eHFZ+V7/ZLYjPlgQlhNpBlDG78vMWCR9aPBCltSfIQc/HwOkQMTSU8620JIF4jnS9Zfwayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDTQ5sHa; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDTQ5sHa"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50d87c138e1so67446721cf.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778693098; x=1779297898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZU1btMobI51IRRL4Ho1mz96alwmNtMYLu0zpeinvrcs=;
        b=cDTQ5sHaY95WHkKQyjD69sD01pZELRxodu/HZ3UHUsiT2ep6xFv4ahTcCDRYYe0J59
         jeWJZt0N3Q4zP8iOgKMO76tw3OD+Po3zQsTF8HYvrp+ppJ7Wnsq9fC2C2JPqdlKkWNIx
         0wWSjhoWmrT6w32kbJZqXLBgHwUv6N+/AmsWw29y5P69nudURuhXvQ4OeeTfEDMNgMv9
         rSxnLEIkj7JSKZonwChPqeirTCxjoBwnXzsorlGx4WO6LbEPpOgcOfaY4Vy2Gj/YwaDx
         kDPv881aVx45Zsv90tkhVG5VMAMXKdkU4oXofsRe46h/5jnZ8xpMLw0FDEB4Ef09+1l7
         2APQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693098; x=1779297898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZU1btMobI51IRRL4Ho1mz96alwmNtMYLu0zpeinvrcs=;
        b=W2fR0cSWjvA7ABTnO481WCY6NaXXvD/vgt4AHtf8nOR5Y9ClDxnGzu4S9oWBcFkqcv
         xBc9GaEZ5c8RwJPF32N/oWzEnvUhEv583uRwcAfOGtbTfVdWP29o7JoF+Ala9b6geUua
         +dChq3snr/Y+09bZgXm3dJmo1kVqHiBwed0lAorN61875kee/W/TP50ou8iimOPh6zw0
         F3h9ylIig3i+5v5l9ayX868dGYnd62BZH8FvAo9kYU6IBA4qqzV0LJ8/+UGbQRGzRIrU
         srkY4+/5cQw0fU74IezU4bHgcn/J6n+ugvNHTRtg3Rx3qpv+124WFAAAU8lDEPo4Qf7i
         h7vg==
X-Forwarded-Encrypted: i=1; AFNElJ8xxO4qtPJ11fMA90Z4r2H6air+mdFPcaqDXTweI114XwXAK0hruiS56R//cUPLN1rYZtkdh6IlQ0LB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4173UwpCCiHdmsuAP3MumTJUEAWWtbPdo7cBD+/Q7quO466ws
	7JmdOenedCMPhMiztICTJGTxDP9NuD8PGSTNJuJ+5KEstMDLw/tgR6Vi
X-Gm-Gg: Acq92OFwOcRCLZiYSaPIyIpV2388RGgcS3SQMGBaOQfSgxGwuo0bUB5ex6v/N4lJcsd
	20Oykp5BraUQ6TQWp4ExCV8Bfu3qnbeYiYqKzGkszj3zrbBn0DMuQvYPLO9D+cTlt5NXZvOEBjN
	1wxwOZ98rQpcx5TaGy3aBkRS/zFOLf1j3qrdXNHj91B3qMABfZXfZBDkZjG7v9YcqoiLtddMiwS
	HApNtdEno5RCh/2ilKhiBjzPl1faLlFm6Qf5Muqa1z2SIxJHh/TZwcI2kKUhpq9VMt4Gmyz0j8F
	FJhqBntXy3lXGcmL3y82VdzzkCJLpIGKMuwZuLu/oLwqHrHiV0yPio2Mkk5zOI9hOxQajZhJ5Yh
	X+bgtiNpEfKgfDvg0jBPzQV9x/HoiuEpY/4f73cp68bchoJXKgmNeDzSbJKne5AB1VyvTeASkb0
	w7pOOAkyik0zHWWlGOvz/VA87UEw==
X-Received: by 2002:a05:622a:124f:b0:50f:dd9f:1223 with SMTP id d75a77b69052e-5162f5fe405mr58670381cf.44.1778693098486;
        Wed, 13 May 2026 10:24:58 -0700 (PDT)
Received: from localhost ([142.181.178.53])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148fd8bfe0sm151895461cf.0.2026.05.13.10.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:24:58 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	Yifei Zhan <yifei@zhan.science>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: add support for pixel 3a xl with the tianma panel
Date: Wed, 13 May 2026 13:25:49 -0400
Message-ID: <20260513172549.1345-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513172549.1345-1-mailingradian@gmail.com>
References: <20260513172549.1345-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pixel 3a XL has variants with either a Samsung Display Controller (SDC)
panel or a Tianma panel. Add the device tree for the variant with the
Tianma panel.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: "Claude Code Review Bot":claude-opus-4-6
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/sdm670-google-bonito-tianma.dts  | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 169cc9b9ccd3..d909c527d848 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -303,6 +303,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-fairphone-fp3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-motorola-ocean.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-bonito-tianma.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-sargo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts b/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
new file mode 100644
index 000000000000..42ddaf53d150
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device tree for Google Pixel 3a XL with the Tianma panel.
+ *
+ * Copyright (c) Richard Acayan. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sdm670-google-common.dtsi"
+
+/ {
+	model = "Google Pixel 3a XL (with Tianma panel)";
+	compatible = "google,bonito-tianma", "google,bonito", "qcom,sdm670";
+};
+
+&battery {
+	charge-full-design-microamp-hours = <3700000>;
+};
+
+&framebuffer {
+	height = <2160>;
+};
+
+&panel {
+	compatible = "novatek,nt37700f";
+};
+
+&rmi4_f12 {
+	touchscreen-x-mm = <69>;
+	touchscreen-y-mm = <137>;
+};
-- 
2.54.0

