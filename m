Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1763B635F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707588; cv=none; b=ghY6BdiSqgTawvWdszUmYldlbVb8RTlW4yOE7e1t4cjon8PAK5jBCX3TWcH2T3xzAQXYJqan2NSWlAAC/oueZ8YHeNBI7rzJ0L6EsvYo2DZItpFA1EFCqguQEMHdvAZfZZQn76W/9aOYdohJHENWFxcIsp4vRj8F99iYaSrLSDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707588; c=relaxed/simple;
	bh=kbRxkDSklKmUXRkpNNt2jlXF+tF+3iVfzCr636P03P4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Goznlf7Z9TziQNSMWveFTHNd7t4DQxcql1bvGIE1VXLAz+ThdANDB2ZlDEICUm1ZHd4/AMiAl26IqMOztvTedsxNEXDeNXC0LKxWQwH5xMDicGvqYD5U0ANnirwCghB+jF3lA4iJssO5MyHf2ch2HUxq+SAv126gzgF8d+ipIko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jwqgme17; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jwqgme17"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-656d749109cso4699492d50.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707586; x=1779312386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3TcPVRIkkCvtZzIpVvk6MMaDhrZ9WpVELhUPvDjGtg=;
        b=Jwqgme17n8uOUs6ZlP0KdYudX83NJbk9t0JGX0V3YTPd2KaYUvP5wy1io4mxcOBUOA
         q3c/ixn897y83zTBLixiZLrP7ls+JX3O1rSY7CIAi+OHP+1qluvSXU2b6DK7LPT0N9cK
         /nLe9lgzoD4EGKuIp/vMUXPIMfPvVRh63N8GOMZ9qJboxEsy6JDXiRZ+X/q2wJq4molG
         sDnL8WBb10tvcAtbOC5ONtbsfmMfH2Ua6OV3kmJGVSeDm0hc3ZRFhrPJFC3xX1to5Wuk
         rQioImlMTJAp4zmK9Aggi74xn3SnbJevjtXCvg2Nv26xg9yTKkq/XsMVVatT8ZykUnt2
         Sosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707586; x=1779312386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O3TcPVRIkkCvtZzIpVvk6MMaDhrZ9WpVELhUPvDjGtg=;
        b=aWuLWuBUuGorONJqadG7mkpNHbUKf4ts9JvTQGo/37liRkytyl2VRJs6SdcfACscQ0
         aL3PgrMuanTxjc8cf8qSNOd2v3UZlaQsy7xlI8eVoJFyGjJwjNltB8L7fyjS/tvG+hAh
         pHHOgSRvAwamrL1j7s3x1T6DF5Jsxvlq6tpQsDXc/5U5d/gcTneeCvSEmWq9c8QM7uL5
         EwkZJ9V9KezueXaOvhar3yBUg9+SiOZZ9M4Jr5AABp/XgTSjrKJBFDk4bV/Ykc4Voz2Y
         7Q/friLvO1aNkqNgOGf8AUZZhcBunbJugf21QOHneHVPZNY4TzdO/d3lg5zkNPWVDwf0
         uM3g==
X-Forwarded-Encrypted: i=1; AFNElJ+nSwm4ubiWY9O//MZtNww2m6PAoBt4qvkiYZsKWvXQTfEz7aM60JvYiuNr+oI+reBKoMfQP3EEaZL1@vger.kernel.org
X-Gm-Message-State: AOJu0YzUd3uXbQrE7PyUcQGMaoJEd68uBq9aRg7PJz2qjZ2ZWWcTBZC4
	bS/rUswnby8OHY2iQXj1S6ziZLI4bIh46ujTiK26ACj7ZMWoXnA4YS5T
X-Gm-Gg: Acq92OE9+8S2OPMAPtikHPCt1ql62JpQBJ4+bJKH62+d6G5aHE3K7wlrc0r+CISwSQt
	nvquFhKMAmko3+UHaSIbr+WG2Z74acM2hMYnCKW6W7Wc/QOJW47btksVDJYajmsEwyedkL3B6w4
	PSw6OH/KeP9Ti9vu/tsBWmO8bPkGfZzXuBAhinMrs/FlHUVf7CKy+c3cpbezXdUEaOQJzizLir0
	liDtaRhUsGNfWG1KHHvRvGAH0ayCnEZwJaXiDLAcPQWaqVyxq0BAAO3rCmkPQHYEj8Ib2znmIPv
	Ey/tkdzBPNwvj7MftEkUhm//jMomb10XfWZ81FP0N6X67SlCfth+v3JKS6cLrrNmTF4KOs5tGQJ
	GVU5q3n+EpgKmtmR5ECTJcGHFtZTpLPdhAGX9srz7LkAmDLB+iI4xmj7UKsKbKUylsBP9vFSl2f
	FfnPx1sk3aBK6HcdxcU4VYsQqgfg==
X-Received: by 2002:a05:690c:e3e2:b0:7bd:8782:bb63 with SMTP id 00721157ae682-7c6aa11b5ccmr54775837b3.19.1778707585933;
        Wed, 13 May 2026 14:26:25 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:25 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:37 +0300
Subject: [PATCH v7 8/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-8-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 1b5e72980702..b6eb96e43319 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -692,6 +692,45 @@ static const struct venus_resources msm8916_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 133330000 },	/* 1080p @ 30 */
+	{ 220800, 133330000 },	/* 720p @ 60 */
+	{ 108000, 133330000 },	/* 720p @ 30 */
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
+	.vcodec_clks = { "vcodec0_core", "vcodec1_core" },
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
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1125,6 +1164,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0

