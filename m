Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E784407CE5
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203625; cv=none; b=pJWK2ToYq3MShnCXPoLOMUozmTCHZl8R8jLtOCacQHKOJK6Kbui5cC/U2SDHXuYoK8E+2hMdM7QfXTr9D24PBcRGb/9I/AtcDWhG1NfhOvLeQk+7MyqK4JHI1bJU7SeR0fEHHORmdgin1yHIK0YfRLblitusSGDpiOZFPraz2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203625; c=relaxed/simple;
	bh=SKSKGA5wu5mHBy3LdJTJn/ga71reNQLH+wzxBhoGTzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vA2Yc9cE1alROsi6R6ixvpfFSyFmR1tpPgmxg/rjLT57r0Ac2ZDOctmjbzvWE2fgRteMaLgu5k7jpZn9qh2dUe1Wh7Z7PMDtSJ86gPfY/mKCgWOLJine0vSf4Tu4Wmkm3QQJ6dc2XeNL0aeos627iL+gc1PAM932We+jms3Qjf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G59ac6Zk; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G59ac6Zk"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67e2498f3a7so8164741a12.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203622; x=1779808422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOluIAb4J/mdtDnp0IJFTCHh0boFRqdkW+b5Er43ycM=;
        b=G59ac6ZkOahl07psVgdDZSUW2ys2JRHh68u6YsjMyNf6oWNudM4xijOHvKfuekh3Nu
         p8zU43x1mxMskdRzRNnf9d2ZKB+3mtOm9pTAoe56XahyCrg1pgMDCmu7/LCqzt7NquV+
         WA236oJgLTexJjyZ3X9TgE+ZtE+vKxHHk3JnGSyLtZWB6udaan0XHPr5Vhtbi/0VcwxU
         Hg8xENiRkDyJylakwh2L0NtmRf/aix/xUxJrlMyiZrhZW/uA1GPFHkfcHewctLtWzFEb
         LxAB52ef0voDNIL8Jf8USNIMBKTWHsCxMwEiCh2Xho8Fhj8GzUVmnSC2zb0mTlvo24W2
         JdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203622; x=1779808422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nOluIAb4J/mdtDnp0IJFTCHh0boFRqdkW+b5Er43ycM=;
        b=cc4xyyjwjDRRbJKsLk25oO6tIO3eNAOjI0RPDpQq2sjHBKZAxkJCL0WKGnN0Qb0eyC
         e02etyPJMpWV1QP987N1YETv0MUMj0pcgDhVV/F86Xli5M4ITdbBxorSXMQYaedlQFq/
         f/JcPEr8rJb5OMcEeve9344OdKp+qMDVkzg6AOMDZuKXaJX5fZYTPReDWF7HreNZiflM
         aJPLwnG/qtgxApUMdWIJQIVI7zASRmT4GHfwrXaG5IPi0U/vgiqOjS/DgiYh232ACdw0
         /NkznCbEJdmo7uSTcZJwJdrPSQXeIA/W0IQOFYQ+ykzSaI/dPfwh2DpA3j9n3CWU/CVS
         7a/w==
X-Forwarded-Encrypted: i=1; AFNElJ8+CciruaRWtzzps+EYyX4zv1VFQzW2fOoFN2zNxFR1Dx4fPBnWn9CWpwIb+uKjzXT1hZDQatGXhDY6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4pIYT6C9cd/VOYD0PebwdqG8FyZA4ohHepyvCRNqyjbsRNTX7
	HRf8659C0VIWfvv+b8XeXN0Vs55h9pVHiUrFjc7KbbynRGUkwEzYd3QQ
X-Gm-Gg: Acq92OGXSP6nb4VBSMEH2SmDzH+cElQxj0NePEPMjebi9RWpMXaoT5JjkOzZwgYUPDF
	ixQpjpi1JwyR+S8iZi7bemuPmitqFa3KsQCXJykFM0sD4VrLA6Bp2p9HrqGuUHNwwsdZmeysCSX
	9P6aruzc82Smzt3V3rCXV1XA+pB5gBZuMXV0c9DLrj6v6Sc8dNhZV1hl5WUNwWswZRWPQVBLwna
	CnM+q96Xd79yX83jE7kJq2aLN3Ziz4eR015JJu4zlxUF1E2dVA/W0bez8QgfWHq03n2p/ulOXrO
	eHW5NvhVkJeR0k0g3BBjm+R6wWr+QFHfLpzQwwJ5UyS9XepLBTNgQkb0mf+qhd6MoaPuc3+C96R
	W0QLUhL3+gnQe8NNhJXweMleQv2i7NDNVoV7W/gAnXa6WSJcyZNuqhILQFOivhVpCPY0zH0NgO1
	kh4O3XHATZ4hlKZECW/UlFKC3gJg==
X-Received: by 2002:a05:6402:358e:b0:674:40c3:f047 with SMTP id 4fb4d7f45d1cf-683bcd9eefbmr10573864a12.12.1779203621784;
        Tue, 19 May 2026 08:13:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:39 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:51 +0300
Subject: [PATCH v8 6/9] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-msm8939-venus-rfc-v8-6-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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
index 3baa6bb4968f..ef9081d5335d 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -690,6 +690,45 @@ static const struct venus_resources msm8916_res = {
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
@@ -1130,6 +1169,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0

