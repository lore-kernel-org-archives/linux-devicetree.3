Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595A637C92D
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 09:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406500; cv=none; b=o8zpuNcTBVOl+VXou0mvMeZqeKCRtlOQ77Irtb6SYEUz2PNpWUwY2uTsMHmE3YUCn3Ha1B0jRQkQ0/O6xIqLORmZ1VmVGz5m/d+2d51bKbN3QtmiAGgCseXDZEBH2UaIbu3wopCfhcwkDx50fw7mhFUdJfHh0O/YS4HbFW0cYks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406500; c=relaxed/simple;
	bh=PThAJofFUpaf0I7H3OPLDBFfLJQH6zwvWvtmukAgzZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VkUGnp8elzs1kpt39HWwWXhXVxdcU4ioSYM0KPZ4BKRJRKrkyYilc3ndcgwU2XCH+j+F7LzkayeJxMYYn6U5uGR6T/oG39gCFvhBWkpytgWocW6yukwgFQ5NrSHm/dx0wMMBAa9S6GECK5xb6VUVZ6Brg8/TcYJAswL4PzjXO/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIXIqxkf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIXIqxkf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso37959545e9.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 02:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406489; x=1779011289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJYDpcxH6Tn7+0ROYd7sOCYGz+GoNKS70+mlfSYBYV8=;
        b=UIXIqxkfDe6yto75EOjj7Nqn6jcpzylJ70+ijNqrIxVQe/iMOqMOLn4TJ7BboT7+Oz
         /4mhcmmcusdAzQNtldbSdJOeG/NZ27biyVx0IhoErzzbxj6zXKFNo1PXRBiaWbRh2msX
         5mwghnEo3LDL4Af8souX6q6YPCR2KGpdXD6MAFhjMOhYblvjjYJL3RoRS7ABMzdp11O9
         x2MAiz4SaGw/Um77J8BscZLHxTnMhdnvKToGOrBlRUJi7Y0fFYLkykz/UixlZQgJula0
         KWWu/Xv/BHIu31fEK0qVu8qSuZ4TNmXWOBMxz72tH2AQAZo8xhqLc2cFXTDs3aa+rkOe
         n8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406489; x=1779011289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qJYDpcxH6Tn7+0ROYd7sOCYGz+GoNKS70+mlfSYBYV8=;
        b=SPSLpsYvsHFDFI/tJupuEttNscnU4PdMEzapOYXlksZgC8SDmkR0jtOCRWIi28MM4P
         KC9mdrK+dfzs77PRbO859qsAOqk7yixQFyOMm+rrVxrXAOgLr88tQYSApbQHGzsGn2Yd
         azdPTmxEp1nf0m5ovTK/Qs87MfEHeUK7IsNT7Avqg5EdM1jr3KTdRXStgKSdQNVbeRod
         mjh/x4mfny+dXhQuJdBw/NGuwthOmB3ZXwwjNPKuJf3Tb/mTqbCvsdPATfNzCDYxfv3L
         okZwJTAZbbIb8aRfcBotnntODQYYR1OtIgmlXM/u2VF9IiALjHYXy+xLOaX2Ge/tyl02
         OteA==
X-Forwarded-Encrypted: i=1; AFNElJ8rrAYsNL90bCPpt4oLx66Vb3q2zMfuK7XQLty/ds2jikpVdX8O11StU8tDUAlPHnndVohlqci7h0xb@vger.kernel.org
X-Gm-Message-State: AOJu0YwsH/gi9PiWsSGsxnjcLYk4JI6rQom3UXapmzb1+1qqcZOHdK+h
	ihDdxFvvP29dkZ5RDvOfOrHu+XILFEjh3pRnbVroMBjZivKp7Qv1Yw7W
X-Gm-Gg: Acq92OEGEmj4a/0rZsDeCycyXt5JAlkzrFA+OgMxUdRJ5GeoUQ/L3mjsU5/+A8LpBDY
	HW1cRy4oeUWFX5mlqH4p6+zCBi6yhmv1BkSslja7ZtfE1+vgqmy1OKkN8T6zitK7bAuyc/Pl4Wl
	hlH7ZwiaXrN8XMlyhryji+8OaKr4/AQEGFg/69XJF86mI2vv3Yf7DGdnkJ3SurJsxp07ymg8oXV
	J9y97USZRJBh9c+lJ0REQnhoMfpi6NhztyUx6mzgVFB/t0bfhZHQcZDHjx/E2EFaHD0+G7l8k3N
	g3csQ1gHEeZb7Cbw7ZtXCip5xKSn3NU+H5qBFHBKLT6B1cL5HEx/XNO8rROVez+0/54hySDCR2t
	Vvg6LAUKpmkwyLDFrL8CvTi5RWMdk4bn/kAAM55/p3RMW3kBbFj1/pldOjm8nW8C5dhakEgoswL
	AGsZINGWpJ4HQNmajkRqD016Qk6/oG
X-Received: by 2002:a05:600c:8011:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-48e51f3b589mr302185505e9.24.1778406489364;
        Sun, 10 May 2026 02:48:09 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:08 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:45 +0300
Subject: [PATCH v6 7/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-msm8939-venus-rfc-v6-7-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
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
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..6ad20d58dda2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -688,6 +688,46 @@ static const struct venus_resources msm8916_res = {
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
+	.vcodec0_clks = { "vcodec0_core", "vcodec1_core" },
+	.vcodec1_clks = { "vcodec0_core", "vcodec1_core" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0", "vcodec1" },
+	.vcodec_pmdomains_num = 3,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1121,6 +1161,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0

