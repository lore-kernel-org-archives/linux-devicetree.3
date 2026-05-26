Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E483FADFC
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802312; cv=none; b=MXLpYE9HvhlQYQD5EPUllpmRJ7RHEtmq3u4tRV7pFEN5UwhLJ2s0Y3PTbiFhXInr9Z+Z9eK8yIKAWlMTmktPf88ag3itvWX9BfpOC3Z1Kp67mbREelS2GKTpA96+gIlz6o69I7jjxVsAth5TyzxcV87vTZ6Tc4wbcC5zJnrh6Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802312; c=relaxed/simple;
	bh=XGtDm0iA2CBt34o1okB+xYp7cM9M0icTJZWbbBSl+W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T8lbVCPnupxXEPa/7FhOKDIZk/+Od6w49+P6hasOuPAfm41nC93avjc45f0f7VLBC2X+gH2PnhDZwkLkSRDbn8oazWKoJirF37k6rYLKlaC/IIxQzTttRElEmBZx2k6HU16Bjew0skD37OV9JT/2w3EmV8Ako8M8nQoPEI3M9QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFp96kBh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFp96kBh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so50518625e9.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802300; x=1780407100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rez1vuaNhDUPgx/4FRbuY6S0ijfuvuK4QmeI9SL+0yw=;
        b=qFp96kBhche/eFWbLQbfEp7AzmsHTG2axZSFrY300/n1iU5C2xqJKfKF1TouW8E5iY
         XgInZZRxLw8Sjb+uOw3LOfEOK0mOLBy+VnyP2wJdiQ0JJvoYP0jWtummAgYaiZA/iUYI
         wt1XKh6iZZpChD+WXjD1CI0l6aV5yynl8ZqXk3tjPx4rEeuDLbMOlfg/+AsdvuIZuaHB
         NeGJALAmhiIBMQPexLGOLiUcqQAiKm1AxAA/e4X7etQZhcjDDr/N7JKQ814GBoYKdsHE
         8rqT0fiwt6gwJphrx7px/Zo+RQgm5hJ4Mu7cgErfGS0LxO6TqeQLmuZsqP99tvvrTAOO
         Yjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802300; x=1780407100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rez1vuaNhDUPgx/4FRbuY6S0ijfuvuK4QmeI9SL+0yw=;
        b=NYMaqb7Cu3uKDHLHYlW7JTh3+s+09zpudzTGKDnj4QbPbrqVz4m4CweCHAzKUreO0p
         yYF0Vqo6wPW5lXAblGhWTdeqqNTy7Ms84xH2p1RPF3a3FBY6BoJf9PGUvV8i34wYG1dm
         85PXrclvaGxjuVw4cdQ1r76zvcYSKBAnQ+8ktjFmWkxLaDeayywJg4E+QvL6GGnu+ERE
         Qv9kQUYd3XVco4xzKm6gYNih5Alkdd+zwb7VhmfV86bs3li6kt7FcOk7me55DHev8VNV
         j1dOZoaSJohcrSf3mPVXMAT30+tv8YPOXLSdcNJWCOdzmt1a0cckbNuCseciGtmuA4wb
         CmFA==
X-Forwarded-Encrypted: i=1; AFNElJ/+i9K60d8qmOxgudZDa3YnRU2QdEm5NahMV7JhKBodKivjTbk9tcW5EAQmjLWSETey2TfvSS+spCTM@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ2oyAdIjBiytzhDNkWgKVx1zKG2zT5U2M8n4lhxttwI3kbyPQ
	T+Cj6Zz3cgVTiN0bf9Dz/datZR9KbfJrcacEsdCFReIGgvCw+zAaRFjE
X-Gm-Gg: Acq92OHurZthYMLxjLxLqKIGB88HW+y1+M1AJvv63Qe5ykVAVeuJwENxaYNZYyHoe26
	yPeRg2qXPD1xzVVM5CB5tByDJqTupYqzRN0EP9i/TDNUnEFhTcLDu8hL8wRKJPfV0+9doYG2yV7
	4kxLBIioras+H5OzumfU+N5wujHJ6w/Wl6NMf4l/WCruShoyLn5c4MKUwlAz9LvbGLRV2At3WlG
	X6v3Wrlr7HsUIACIGtyrChrpSphiBf0LRPeyNRkqFlscnZTBBd0W7F3ODS9P5a1A1ZjKvqrxska
	LjIbjR1U8EoDfk9bDe9L+/iuPFJlRBQbRA0gAvohlVbAw67ctOxXI32bgf8bJSx5uqYJpap6Aqh
	otUVgHYrWDn+V97ERUMvrKcMUyHyvrerryewavLrJwfBLMai1QXaW0HfYfv+2vd8v8828j3nu5f
	Yj64Hizc4hezagWO2F3S5vFqzp9g==
X-Received: by 2002:a05:600c:a402:b0:48f:e6de:1cba with SMTP id 5b1f17b1804b1-490426c5b3emr264652305e9.17.1779802299999;
        Tue, 26 May 2026 06:31:39 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:39 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:27 +0300
Subject: [PATCH v9 4/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-4-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  5 +++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a87e8afb23df..bd88e2b484a5 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -18,6 +18,7 @@
 #include <linux/types.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-mem2mem.h>
@@ -178,6 +179,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 static u32 to_v4l2_codec_type(u32 codec)
 {
 	switch (codec) {
+	case HFI_VIDEO_CODEC_HEVC:
+		return V4L2_PIX_FMT_HEVC;
 	case HFI_VIDEO_CODEC_H264:
 		return V4L2_PIX_FMT_H264;
 	case HFI_VIDEO_CODEC_H263:
@@ -684,6 +687,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index c1603eebd757..46705a666776 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -88,6 +88,8 @@ struct venus_resources {
 	const char **opp_pmdomain;
 	unsigned int opp_pmdomain_num;
 	unsigned int vcodec_num;
+	const u32 dec_codec_blacklist;
+	const u32 enc_codec_blacklist;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
 	enum hfi_version hfi_version;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..8e762cf77968 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -206,11 +206,11 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->dec_codecs = codecs->dec_codecs;
 	core->enc_codecs = codecs->enc_codecs;
 
-	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
-		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-	}
+	if (core->res->dec_codec_blacklist)
+		core->dec_codecs &= ~core->res->dec_codec_blacklist;
+
+	if (core->res->enc_codec_blacklist)
+		core->enc_codecs &= ~core->res->enc_codec_blacklist;
 
 	return sizeof(*codecs);
 }

-- 
2.54.0

