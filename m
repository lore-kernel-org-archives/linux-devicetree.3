Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C9037186E
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141889; cv=none; b=D5wF2ROPvF4aAI8LInGX5yOlka3ovh93+7E9ulZDKeICALyWQPChSunTeT4q0S8/R+QhNPKK+XrXv/gvlCuEfPapwxF3i1wpCrrG9kdIet4eMeLnGAIM+Ue9au5EoJpnFJECIlEYbk3vfpmHQy4yO0LjxM6QvjqwJwl22kjcQVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141889; c=relaxed/simple;
	bh=LpD6bSQrYC1BjamcEs0u6YsU6tL9lz8IAu4zl3kOQh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kc903AFVM0OJsYFdpVj0S2FCcX6fUj9E0xmpgenBIFsC8AnhCgfQqrrQ5SRi2t31WhmJsSNWtI/C3tMnPbFLO7tIGoSbh6JGTFsDAt22pudephAqZcUzTMAyAEqDWbxyum6ObNFjtiQUzOedT4y6jmM0mMhuOGz8OCDZO3XCoP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VT/Ort+4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VT/Ort+4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ba840146so79704355e9.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141883; x=1777746683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7V1onxXfVBoDwpXP39VrgYBBMWRu3J4MOQfpF7jti6U=;
        b=VT/Ort+4laCNJMTw5benZ6n/d+RPfiSGNaYXD/bX5Uke3ikX01/1DVc5RRLXIT/K1X
         PKXyvlM9nV/YHMNFBqhWcE0r4vPViI3JorCg4XeM2V3Uek2sM/rRcoOnFtxn4ZwyzmJA
         b9p6c4KTW63E0zKVadJdNAb8FBx/OYAWqOWLsacIkPLUy0i0xHbQ6UqCYcYBRzZEZgts
         2CgOQ8IXOeClzB6Edeh9K5DAF7zHgHMpEq9Tah14wYHtpOtvkoEg3Uo8RIcZJ2tVkM/P
         GzklJ6LjDHiQrHK/E7xa7Rm6GgCnOfmufK85hxdRtyjO0Q+JExhj5f7HBWGPqny32Jcq
         oykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141883; x=1777746683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7V1onxXfVBoDwpXP39VrgYBBMWRu3J4MOQfpF7jti6U=;
        b=Yxp7g+5SqJRjJZk+qULcmWCKJJxeZypwbqp+v2COKeO+SqVmyIQlTbjvQhPGg+EM2s
         5Xo/V9c9DJEVzTZTdeeXV4Q8vpckDQ6EWvz0h3ILtstdkipM4zDPsoWVcWjJy+ONHRlY
         QmeNIjj+IbGRcFPpFQLpcAULqfqI3fPOFebnknD87CeJmVTjbSiZKp1KXfS2BJjCKf96
         jRuU7lNaLlbvjKElLUzn/iC3wClWbwZ9W3A/Uc7xZxm8ujQhqwtwbfQ0kPg3ZztoNi1p
         qsRrnNMf8XLwIWgcjtIiutn8pv0q05f1lHEceKGG+LlwNd8yezwcJ1p63nuvYPxCm33o
         QLdA==
X-Forwarded-Encrypted: i=1; AFNElJ/s0comJgJwwBJpa+LXCXZTt5v8wYJjTbWyjZncqEopm8QxJi4Ucr5pvn69GrdHFrjM0C9Venb2D5uA@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQNe796IpyszpBY/4D7IlVRh1W8wMCfTXFcOEGOSxcaUo0Zyw
	YeKiEzEK1KeK8isS033siXVpWwfBfjGc/pHBjdd3gmBvjJYDmu7nznSY
X-Gm-Gg: AeBDiesKRGZAe+U9x/6VTs+95zaMouQ2oYf1TTFYponRo9uHapCdNpr9JNnNIzvLOAN
	uYzUNpeXbIzwD2AOXECW7DDTERjxBD07W7wMZPIu5xhXVyQuAcPJP1CqesdrRCmCK1V1MGkDuYj
	W0OhcxHxvUNiaohkuOzRKxqt37/6QtgTxzPQvM11sxbdMlZjZnSSyYzZOIf6Ugh5fj0g6YYgZv2
	KRBZfSSOWJt+OfP8F9e08j+WZSHWXi8CZMuU9C2lZarqI2Wtv6Dn+q+ntRDUE5MGRowyQorXN8h
	HXIaUCqcV6E8ai2//HU5mBfkiovh5eR9IbsseIrYr+62Dk66cxhFQ6P5ujy6nQp74OkTDR3VSU6
	W89lrStJWrYTE6y4IBsJ8H5M2bnLNX1QdldAKedAZF45xgoLH95I8PelpkRTS3QEmdmvIMn9EZg
	ys4zeswfGKXj4Kx0ZM/n1j32WLTQN371bssJc=
X-Received: by 2002:a05:600c:33a6:b0:489:1c1f:35f9 with SMTP id 5b1f17b1804b1-4891c1f38b6mr230516585e9.9.1777141883035;
        Sat, 25 Apr 2026 11:31:23 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:22 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:04 +0300
Subject: [PATCH RFC v2 03/11] media: qcom: venus: Add msm8939 resource
 struct
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260425-msm8939-venus-rfc-v2-3-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..ebe166b5c955 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -688,6 +688,45 @@ static const struct venus_resources msm8916_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 133330000 },	/* 1080p @ 30 */
+	{ 244800, 200000000 },	/* 1080p @ 30 */
+	{ 220800, 133330000 },	/* 720p @ 60 */
+	{ 108000, 133330000 },	/* 720p @ 30 */
+	{ 108000, 200000000 },	/* 720p @ 30 */
+	{ 72000, 133330000 },	/* VGA @ 60 */
+	{ 36000, 133330000 },	/* VGA @ 30 */
+};
+
+static const struct reg_val msm8939_reg_preset[] = {
+	{ 0xe0020, 0x0aaaaaaa },
+	{ 0xe0024, 0x0aaaaaaa },
+	{ 0x80124, 0x00000003 },
+};
+
+static const struct venus_resources msm8939_res = {
+	.freq_tbl = msm8939_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8939_freq_table),
+	.reg_tbl = msm8939_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8939_reg_preset),
+	.clks = { "core", "iface", "bus", },
+	.clks_num = 3,
+	.vcodec0_clks = { "core0", "core1" },
+	.vcodec_clks_num = 2,
+	.vcodec0_pmdomains = (const char *[]) { "core0", "core1" },
+	.vcodec1_pmdomains = (const char *[]) { "core0", "core1" },
+	.vcodec_pmdomains_num = 2,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1121,6 +1160,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0

