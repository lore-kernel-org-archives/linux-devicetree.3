Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B50C3A75B0
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706816; cv=none; b=izpg553QYXEtcZnMUBrO69XOejkLQgjphf63fBkOXwhpWC4rxO9RaByLqOJzO7z+42nNcfglbP0StJzkONLS/+ekNH3HAVAy5ji7E01WJmRdQwgBdGY5JAcq96h0RI/LxTZTZMzkGEi7RmK4VjiPJYCM4jx3zjw1bzbiW15aU7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706816; c=relaxed/simple;
	bh=dBg2F8BGZZ9Mm5Km26Z5eGMyUNSTN1VtnuTwvVrkrps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhDgq8FWIDWO/hcPkWsoo6w0RE0FA0O6kzUxDKNgbaSVua6FnUWeBFD2mGkwhhhl5UQD4pX8khUt0ezrroCptWTaYb5qUGcVAa858mFpLreGyP619YUpsfq5PpzR/eb+nge+paQuuBeigwk2Y5mf4QR4IsNdkCiPji9Kkk6oT+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XoutfUF9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XoutfUF9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so43824445e9.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706809; x=1777311609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O67orx5DZUm8BgsTcl5AUXZvqqdjzW17WuxDEAybQAY=;
        b=XoutfUF9J0q0jx7CLg5db6DEsZ2d/oVy4JiJR4vNcDcq/DW6bCfsGHf6j/8jaB1TZd
         eBXMWIQ0zNdCdg64Uz3gxpfPfvDGi3mN5ta6U8lvfhJJB+rHcwaHqpZIxEotoMXhGx4y
         nQTf7XawgQubFT5jcEm0DxA5wCBpQUhujRQCv5X6bMyExDst9+QmHIgB4tq2TEpQEDWg
         bclh3KHnMEGAU4Lt3xR0rg9Lal+jo8+vJkLu5eBGM1hOPnlQdG99tTqj+WiKkY8aanjU
         2tWZDwd6UNHXLgFC+Iz82s4wtbJQTqRBiJ08ypIAzK8HbPvGGk+XG9/sNKrUlJYdS9RA
         +1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706809; x=1777311609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O67orx5DZUm8BgsTcl5AUXZvqqdjzW17WuxDEAybQAY=;
        b=I345iMnR6daJlnH9wFP0uLqqHUJT/G9/n+stv1j90C2ZT2Nv1aOk3xJkZd6M5LFqLA
         2Ng9NuAQZ/ZypiK2z25vmleHpt+bnMgHOXNF4hGJUq+gacXjBfC2xVy/09kxzSM7u9Eq
         VGqCmm3CG/t4vvcopqZ1H4VxDFOQU0zAZNiRa92vxQ6x3oK15zjCAL0ZY3d16Y0KmlgE
         9qlMjdDBh7OqEBopP+V8Bxl1P0IhHrTgjglmLokVFXvakz4Fg/3bTs3eQjm9zanm6HqA
         aoWIikumXEjvTXDqgl7ntTzJo2pa5tVC4tao85fzx7m9tZapFclrjs6VIeDGNsk2Bzpw
         KZdA==
X-Forwarded-Encrypted: i=1; AFNElJ9A02YAubLokIe0ZRtREZj2fzWRnwEET3PLu49SZdJ0Ue81jU/mZEcMi1jhG6JqBCkCH14se+KXV/d1@vger.kernel.org
X-Gm-Message-State: AOJu0YzwQR3kZhlUQ5a07UppJ9u978Mb459O/7EONVhmo2JOPTUVFJr+
	P9E+p/ZZED6gX+t5nkmQnjaqPky8vQKnykzccn/LRZxpnLgHNNkNRmT51fp534S2UQg=
X-Gm-Gg: AeBDietnzBgYTWsG4IaemZHEN1mUt/kFf8Mp/lzUZ85pyxecZPtYGZ4vtLt06PpvqXx
	03i7nwLFLlB/aRoGBH/OE+s+HEekbOG/fGbeU3yiHtKybsp4qLvW16/Br11V6493gDjhu0ZQeMp
	GYwMu0igD8L6wqRr4c7A9jubTKdc8uxVws3ERnrT2F1MHxaWbNXCdq0UjpYrXe5z4QBdCpDbLBt
	8J+EVkIhIGioW81cX1eGgv5+fSrqARr2UwzFlLwb6PQgrPY0IWD9R3f7RW1FLPUoOXTqmFFpxOi
	jIDpRIDx583FFywXwx2Z7QNAnx7iJZ7U7lmHkwOzmMTPD9yl6cTyRc9qfbSHxt1l4IxExiYnJ3W
	LoQ5hKWY8irt/5Agdh5UfvqkO1y9BvjQrQX3wVP0Q/fgNLUokGIjl6Ub/EcTODOkRVb8eP7bbaM
	FaYzSZjEjGGe8GhKu5h4W2DcoWLQ7261dZkLeC374MCpHHw5xXW5mrox2db0cfJPXSvLWlKw09e
	wVUxinvwC5J33S+Pg==
X-Received: by 2002:a05:600c:4f92:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-48a0f18edf7mr39490595e9.24.1776706809215;
        Mon, 20 Apr 2026 10:40:09 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:08 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:52 +0000
Subject: [PATCH v3 06/10] firmware: samsung: acpm: Add
 devm_acpm_get_by_phandle helper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-6-3dc8e93f0b26@linaro.org>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=3004;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=dBg2F8BGZZ9Mm5Km26Z5eGMyUNSTN1VtnuTwvVrkrps=;
 b=UOAj8gd0XgQFhm1iCBDvFWh9DJ+oBh0oq0XfmalIeylHgCDrLUj+FnH+1NXZyoFoKkD5UBjgB
 DQ3XgDUmwZzDRFlKtsI8+P4vVI/i2hj8MZGg/O8O5oANp006hjIzhqw
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Introduce devm_acpm_get_by_phandle() to standardize how consumer
drivers acquire a handle to the ACPM IPC interface. Enforce the
use of the "samsung,acpm-ipc" property name across the SoC and
simplify the boilerplate code in client drivers.

The first consumer of this helper is the Exynos ACPM Thermal Management
Unit (TMU) driver. The TMU utilizes a hybrid management approach: direct
register access from the Application Processor (AP) is restricted to the
interrupt pending (INTPEND) registers for event identification.
High-level functional tasks, such as sensor initialization, threshold
programming, and temperature reads, are delegated to the ACPM firmware
via this IPC interface.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c             | 23 ++++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index d4afd6b535e4..15c10fbb2920 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -797,6 +797,29 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+/**
+ * devm_acpm_get_by_phandle - Resource managed lookup of the standardized
+ * "samsung,acpm-ipc" handle.
+ * @dev: consumer device
+ *
+ * Returns a pointer to the acpm_handle on success, or an ERR_PTR on failure.
+ */
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	struct acpm_handle *handle;
+	struct device_node *np;
+
+	np = of_parse_phandle(dev->of_node, "samsung,acpm-ipc", 0);
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	handle = devm_acpm_get_by_node(dev, np);
+	of_node_put(np);
+
+	return handle;
+}
+EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 8511c3c3983b..9df4c514ebde 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -70,6 +70,7 @@ struct device;
 #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 					  struct device_node *np);
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
 #else
 
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
@@ -77,6 +78,11 @@ static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 {
 	return NULL;
 }
+
+static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	return NULL;
+}
 #endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.54.0.rc1.555.g9c883467ad-goog

