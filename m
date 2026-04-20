Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8184437EFED
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706813; cv=none; b=X+HirpQIIE4MUa+crmjuXVIixcZOOkZT0DxAs617XRbNUce75JskUyhkgbOLV+udQcXV32wCYC69eVKTBB4IzREN4L8HfA9a5Hfuj3QzJTVeFO07qkxe5qk2k+Ut4e24bj4MFEjh5uYekRzNpfM5C7riDKDH2R/YxVd5m7WWjWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706813; c=relaxed/simple;
	bh=49BtV4liclRnJ5e6tUfHwtwQp6Rtyy5+WI8PtQcjUpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ck0XG1W/2Bsgn/UBJkslqCxk6MQ+W0TKfevwCfTsDRF45nlwQXnyRynGNWVHUnX/RTnREobgyLsBAqqfKRooyn0HBhD03FsvZsmN3rJCEXmnW77dKhEjn8jRxghEc1wFGq0vP3F4SJlRH4GWYdR1QmD05DxQK5EBrS51IA9eCtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pu2puW6w; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pu2puW6w"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso11238535e9.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706807; x=1777311607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIQGoy6fl4lhGyxodk/fSO9eXPaG/yS/b0aAUL+PrPk=;
        b=pu2puW6wiYhIQyvZ6Bv69jrBzkXu9fblMWyeUCZtxjjX0nVhoCrk6h7vWzfXcxaGBi
         /6VHvJDfMQTZ0vHjD2iNjly+XL9yAYF582FCduP8c9vbJehXi9jHZWLGDBDO2IuT7bfP
         xG2Zw6N/DZSjbl0TOEYdpQVtWSg4qhLL7qFYRpTc7lVvRbQ8QSLtSrX9uWy9NJY2Njbb
         KJijcabD1ruK3zh84hdh8Mi79RFYYdy40LuWt2I91abMLVUV5W7mhcUl4f+LzkQkS4Qb
         K7mFzDtV+ry5UF1qN54siF6hMlu6VYMbelQYlPX1qG41hKQEevCTFT6lvuZxVHO5sJ2i
         LK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706807; x=1777311607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIQGoy6fl4lhGyxodk/fSO9eXPaG/yS/b0aAUL+PrPk=;
        b=HbCCl9kQKItTQArx3ifoGTIlNFcByubG+rW02TNc760fjdQP+p/ZaYfx1k6cBzIy+m
         E0AVttU6DTfniBIWJPQ8vis3wQ31E5GWFl6lf9RpXFIl4oiWQc8A37XkSjREQzeTCpri
         o9XnHkWYzkr1zQBLTKQEMa867AwfMgRMf/R61YK30Mo6XY698jA8bWbx9v7XevlU374a
         EPnDeNmBcQy6Tmh4U4a0jBjjjCN6ldZdxKsyyOpoLITxc3UVVK4TSzVJXLq3LFXoNekA
         Z7j+t/laV07jqZP8R4Ahh0bax5kK9eHPPVefqklrO8XpC50OPYd8j7IY6VNvYhFidnGN
         GPEg==
X-Forwarded-Encrypted: i=1; AFNElJ9vtGCd9oW3kWfza4ZtFXABm2rZCosrnypHt/r6/XVM3a/q8YFZAake2B3yW1p9TcnAy1/W1JE1FKWt@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXuBtO07MPZd/peMn9+9aoclnCbh4DS3Tojpt1nQBTVezVkda
	jvdZWpl8JE3BFQqwudEKTcjPuEe2nEsAdgzVXmqAmfLCpmn66/N9qrnMo3hstkW82L0=
X-Gm-Gg: AeBDiev7fBug44A8fqzea92V4qi0wGzgfFu6pXwrHd9+JTfSbYZrevImn9gDU/Wuk5T
	gZ5nEc9b7S0lD+nPlawPUz5QB/PNnnaDCp91p9QApds/mTX6elXq8BXwdCvbQfKc8hyi3doVDQD
	3fpgCaCyiQXB9NO1JkkczMUuI/ZLtg0SYstFh/LghaJ5aesOpCgsI78U41YX4C+/PAXP480jFhZ
	F70xKY4gXXauprNjoXTZZ/BJsZiFrNpWtYy8VF/U3aqnDctAoQKhkNFv4enwCRXw6B2bWg0EZ3X
	7HyQVgWafCjgZ1Wl1exzUvTiwk1Y2mugASadzSLujw37w2U5bop7JRjOfUbHAaEyeiZZgugHoVq
	R3ZCToSbG3Eze2P4yHKXsfRVy4f/ew/ZNI6wFiGMidgbBRjghQmpDIoa3j5GTHaprcNUJylX70S
	On+EYS6MeE2gWT1kRExaRX2bCuG5HE1Ud61x4xVhi8Av4f1ZU44f8pkenSJODHnL8iU06g7NY8X
	5/HfBDk2Octxo97zg==
X-Received: by 2002:a05:600c:c0c8:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488fb787bfdmr160240165e9.26.1776706807433;
        Mon, 20 Apr 2026 10:40:07 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:07 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:49 +0000
Subject: [PATCH v3 03/10] firmware: samsung: acpm: Drop redundant _ops
 suffix in acpm_ops members
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-3-3dc8e93f0b26@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=4439;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=49BtV4liclRnJ5e6tUfHwtwQp6Rtyy5+WI8PtQcjUpM=;
 b=Pb4Ofrj7eCzqfvbfC4jlUZiTiFA9g6OyHFVOMPAZ6LNGAdtEXvx8niESMIV34rfDTzWwZ5BSc
 ToF6YjPTTDyBqda5yHWVBCS1dGST4FFpBxbq6/jLClzYXE6tQ6i/abx
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Rename the `dvfs_ops` and `pmic_ops` members of `struct acpm_ops` to
`dvfs` and `pmic` respectively.

Since these members are housed within the `acpm_ops` structure and
utilize the `acpm_*_ops` types, the `_ops` suffix on the variable names
creates unnecessary redundancy (e.g., `handle.ops.dvfs_ops`).

This cleanup removes the stuttering, leading to cleaner consumer code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-acpm.c                        | 8 ++++----
 drivers/firmware/samsung/exynos-acpm.c                | 4 ++--
 drivers/mfd/sec-acpm.c                                | 6 +++---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 4 ++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index d8944160793a..93667777094c 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
-					clk->mbox_chan_id, clk->id);
+	return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
+					      clk->id);
 }
 
 static int acpm_clk_determine_rate(struct clk_hw *hw,
@@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
-					clk->mbox_chan_id, clk->id, rate);
+	return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
+					      clk->id, rate);
 }
 
 static const struct clk_ops acpm_clk_ops = {
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 8b2529e50328..39d3d2317659 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -616,8 +616,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
  */
 static void acpm_setup_ops(struct acpm_info *acpm)
 {
-	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs_ops;
-	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
+	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
+	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
 
 	dvfs_ops->set_rate = acpm_dvfs_set_rate;
 	dvfs_ops->get_rate = acpm_dvfs_get_rate;
diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index 0e23b9d9f7ee..9e15b260b8df 100644
--- a/drivers/mfd/sec-acpm.c
+++ b/drivers/mfd/sec-acpm.c
@@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
 	size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
 	const u8 *d = data;
 	const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
@@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
 	const u8 *r = reg_buf;
 	u8 reg;
 
@@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
 
 	return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
 				    ctx->shared->speedy_channel, val, mask);
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 13f17dc4443b..62a3eb450067 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -35,8 +35,8 @@ struct acpm_pmic_ops {
 };
 
 struct acpm_ops {
-	struct acpm_dvfs_ops dvfs_ops;
-	struct acpm_pmic_ops pmic_ops;
+	struct acpm_dvfs_ops dvfs;
+	struct acpm_pmic_ops pmic;
 };
 
 /**

-- 
2.54.0.rc1.555.g9c883467ad-goog

