Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7973372ECC
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957790; cv=none; b=l6huSs+pCFPijuSJjiEOtUtZbByX+r0EBxMQ4+hNxXLlnK+tNm1/4Hu3JOeTihm1yJPSMt9ALIDNUD0BVKM5kRtGWHfIouc7YRKzEqNTvjI8jVEXjNLnr0erymJw/ARlbSmaGqlCnOEz8c4u/6VqKS/IfVJea+6uxWmSiHn6+OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957790; c=relaxed/simple;
	bh=YbKU8bNkuqniUi6opUD1cEX17xfpbeAqZSEM023mUjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+Bka7BoqOOq03Kkct5fMFNpGPYKphh/GflItqJQFBA+egEtZkM/ygjlvV7ouMAY5xCDBOzZUN+26hh0IbtGI85aeOBkQasiDr8EYr7QXcW2wkflDY2A59TS7PorfQt5HXGUdfd8Bp+NG7ValyAmGLGgV5AgWZBX7+xXhAJx8Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HCBv9gYr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HCBv9gYr"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d77f6092eso4709507f8f.2
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957784; x=1777562584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFRx8vQlRrTBYadIbF6D8n4BAlzLtgQdTMGBUepLq/s=;
        b=HCBv9gYrqGwlmqcdlTp6ImFIYSGlEpnKto6UDlX6eUw4taAucfMlJQbadwxhid/LcN
         ANJxk5h9TChMAr4qlMzBUHtvneKDCF4exl5eARDnucA3qUqYbs2vohm/JsRMUTlwLelj
         z2NS/0neXn68+yJFvEaMv7eZhLSQ+l1+poo/HyAkFHM87lAuz8uJjAaRPb56F5ovrhwx
         0ONTf6nc2flvNeykyswJht5xHBlGAvP4ND5OipxOSjFpOhZyqt8gX7nwGXiKzVbqPkrU
         xxyaH9KJ8jua99OIteIpA6rmA2Br6aUctExZVSzqRJho+GaNBMCzIkodqWb1zyu+WlqA
         PXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957784; x=1777562584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SFRx8vQlRrTBYadIbF6D8n4BAlzLtgQdTMGBUepLq/s=;
        b=emhA46F29hvTxTZlUYo7O2YbGxNOQ2IGFh65loI8fgwemRF4sscOrtPBJKEcBKPQU6
         1I7/TZPx8N/x9DfY2S4VLT3taYDQx9TszPGtRt8MLENms2bxn7fC863VjoYsTXXBVv/e
         gIOh5dLF+pJVddGLQVaTpfPwQ9/f8GsbxVV2JAMomZorqr9INRqgNJnE+UBj637m/Kty
         SqnSeyVLSF8Id0PhpAiBp2kibdbFViYrm6f3BsoxoxF/O/xZ+qA+kVjTsjWxyaN274mP
         DcVdAgDj49eT0k8CS77lwZui7uICNpgz8DXwckjWNUSlo8QrkSgE69ZGBvn1hGPqLyYn
         NEXw==
X-Forwarded-Encrypted: i=1; AFNElJ+7k6m2d4iBeYiM0d096Qh117PQY21CPzWSNZofV3zF0mVKJqvv+ZJXV7aT7tCnEUjHmRU/yIZ3xbu5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxso5s3t7gb4qKhVglyhUDp/LHVJZXTn0P6ZDhcmq0SrnaSDFFj
	T3MqbPvmxJ+6U14o9LmZQhvWsXuKDaxBzY0EDpuHpM6wjOSHw0W800y4DoMBH7RTjkc=
X-Gm-Gg: AeBDiet71m786qTqTzIxHBYXVbzMOrAk91h09fmZqeKv1uuLKq24Dbq0Ck2ZdfSAmjy
	gjm0/emcW5Lh52qDDdixNVU7ISFNYmfPipQ6nLJ2pUxgyxP27hylqBSRHLjro2F7GEOWEiVA9so
	Lqx02vnCXtyu7zksw/0CT1q/WBIFB2wCIGa5UpZALCyyOMbsEW+Yc+wM9qAfcH07JQjc58sIvtP
	TQBQU6dbCx7IXOGdueqmBX64aygSBaCwiTyZvntPP82gHaNslurytG6szJvq/sUASAEoUtzWEqs
	/anrSQhrwegh3YemGIUbLjoe7SuAekTJ8HYVQHz4GzsjfUc4S9SOgm+fUAhrKHxnoEpDSZM4MkK
	sdm+aXL1uoU5QZLloldWQM8YGfrFk2r3oYZz96tA5+qxqgpNs6Lfr4H0NAWLGg+JOmmS0o8KUyK
	C/2ncfhNDqWj8OqKfujXUsLt3ck8KWnCnlyJr+rCd5oEjEyyYoXSiufojYVIPStbFtbMFgSjYUC
	7Uj1eouci0QBSOilQ==
X-Received: by 2002:a05:600c:3b14:b0:48a:52d9:54ab with SMTP id 5b1f17b1804b1-48a52d95604mr227748485e9.30.1776957783700;
        Thu, 23 Apr 2026 08:23:03 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:55 +0000
Subject: [PATCH v4 07/11] firmware: samsung: acpm: Add
 devm_acpm_get_by_phandle helper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-7-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=3024;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=YbKU8bNkuqniUi6opUD1cEX17xfpbeAqZSEM023mUjQ=;
 b=gWU8Thuqdu+garSPEjoTkbNiCDA9yevszfEqnNqdri4bAmJgHoIk33bjFw1V63C+yxyWRNccp
 1IZUWsWg+OQBSrbw4xbsja5qvOYRQjVDFPrpXNZYNlcZfXVGIx37b57
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
index 655b80fc635f..6dee461f5827 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -812,6 +812,29 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
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
index 08d9f5c95701..83cbd425b652 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -71,6 +71,7 @@ struct device;
 #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 					  struct device_node *np);
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
 #else
 
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
@@ -78,6 +79,11 @@ static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.54.0.545.g6539524ca2-goog

