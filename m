Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B43A3B9601
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707587; cv=none; b=Ei/EBudCPPexBXzZZc4XH7Tc21N78yEykFpCKDmd5tvlv1VXR14pFtvW22JUqAf/tLn7eJRiXz0HiyxNcYpWUMr9aag05vNcgV3dJse8rJeIk7b1YmpjGr2cWq0LcjuXsm+Uy3+VjiUeNlNCBGlQydrLFeF6aU/bqSHCu3gxbDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707587; c=relaxed/simple;
	bh=eWvwFj63Oe5rLHhL9VyXX1Yhyfqj3Z9mzRiwe5LaGlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxxBjBuWL3DcUadZwTcjJ0KTmzUXJN9j4eQtkoGn1GpWib/13T8eyreVsDCqFaiBDr5QwSwsljbtUAEKFiCjAeUvcai9uwdFrtYnrBDJpaqfjbnWYrhZbvc/HttDYmFDbSq5N9H7foTvbtdseddTYRO+PFKUQ1CbaawDGiqT/JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ke006ddQ; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ke006ddQ"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65c09c1d000so6503428d50.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707585; x=1779312385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktJMLSr1SMVyv2PkF3WNZjUBeXP3YGWJAx5pUXBljGM=;
        b=Ke006ddQtjSVdQRSagn8qAzonPyGOJocJ8M/DpSzur/MfiuZApYe+J00NVbrFvbqBj
         kgFqbcaOE2F3Ya/4bDBFbRJ4BJ6GE/fsLjT9kpH/xa01sxzz32V3uRo8Dv8zZfGhGCSH
         oCqTzQieMTq78Cykon3++wPjmWJK+GZHxoC8eAjcrFYuMKQyn3oaGH+Q+ivhNysQJqTS
         hqli0cqVw++eHt5+yn7JVhYbLXO0OyF3r7cdXdjWdP9hsYnKEI1U0cS6PkZ0pJOrsHXo
         xmyEeqzI3b0IXrqEoOYoQxQSZ9LRZjf/oElwncJpETrUXgtaFMlCL8qTD3fb7kuLCDiS
         rvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707585; x=1779312385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ktJMLSr1SMVyv2PkF3WNZjUBeXP3YGWJAx5pUXBljGM=;
        b=qNMa8dLK96LaaJrZ39o1f3Z3nobPMIw3RIqYJlMcZReEA96RNehvH2S/dq3qNTlQnB
         77JYriQk08PGCWHImHmYMPo2hKBzCghqAk1jeDOQQJ41cHlzZ02fFOIYRCD+59/oekLY
         HVQ8aaXyXAtsyZmt9TEepaWVMhW4KyqN9CKRG2NRCrxLjX0ki0xKUB5X+Yf4Ektq9GJa
         FjkNJRqiewchIHHTWHqyZ3Jwtut3r1vZfvrcHoLGR17yTAabfRc386YJBf05rUDPLM2v
         WME7TjdW2kKiwvJuQvxyuq+q40Pp+qJm3NryZMK16G0eBShoWBBd+41+vSlDDx9IdSzQ
         Uemw==
X-Forwarded-Encrypted: i=1; AFNElJ+7JPaKPRIUQp1htjS+RSUgIuWBXrnBzqPzYsd1rlQfWCj1Hd73fYP7fz+W4N8zsK1ItBSchOczIsjD@vger.kernel.org
X-Gm-Message-State: AOJu0YyFjqzM05xTZppV8OPYgzb/7GOKSJD+kAW6CtTlpxjMVQ/Hoz31
	zux/VVuEXz2aXSTYSxGVtFJc16vQcdnWIfUYesnpcbGxdfTUkdxTHqFc
X-Gm-Gg: Acq92OELtR/XJb5lm5XKpNo9a6PPKxoTBEScFdJadtkpvJz4amjPQxxXSuTxTeHkau6
	6/rmHd4ttfutNynxm+D1XhCHKr+NaKM2vHCic72e98x7KgdS0K5+b6a+ljzRGhiTxoUmpCXUhXC
	DeqiH1O3PPhvwvbg7vsxDfzAL0Jvkn6eFeqimwTLUXrZyXisLClVUVU5orinrxf/uuU1EzVTnU1
	eVfNWLSGzN7mzBExx03BowvfSCvXtuiVUs8hQkrQrhhW9DArAOgLCUCQ7i2y4A/YAKiWIZlftLH
	pGUN2OfpxSD8n81K2QlQp8MD3uyN8n0bdoa6Xel3ojuJFHeRUuxhRTlhaQqzyXtZeq4MB1utPsc
	7XKKU61YgXW0elaRWARqkgnzJb4u8VUCl1d5XQTj7SY1RNfYhHvy3ZzRNY1wzCcCSXQUlc8T7xG
	8e92nY/nwxCQMu6BZ4bOlkYBkzlA==
X-Received: by 2002:a05:690c:6286:b0:7b6:783f:2122 with SMTP id 00721157ae682-7c7e668eb6fmr11694307b3.9.1778707580397;
        Wed, 13 May 2026 14:26:20 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:19 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:36 +0300
Subject: [PATCH v7 7/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-7-33c6c6fb9285@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  4 ++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..1b5e72980702 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -178,6 +178,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 static u32 to_v4l2_codec_type(u32 codec)
 {
 	switch (codec) {
+	case HFI_VIDEO_CODEC_HEVC:
+		return V4L2_PIX_FMT_HEVC;
 	case HFI_VIDEO_CODEC_H264:
 		return V4L2_PIX_FMT_H264;
 	case HFI_VIDEO_CODEC_H263:
@@ -684,6 +686,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index ff9174a4e8c1..3f162b11e669 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -85,6 +85,8 @@ struct venus_resources {
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
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

