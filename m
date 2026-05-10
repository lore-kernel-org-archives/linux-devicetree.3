Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0B137C119
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 09:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406499; cv=none; b=CWCMhkE+f0EjC0gB3Apurde7DSIThOHVUOWmeynDBKUTH2fUtNdZ+woUSIEPDt3VA8i5fjwhWXJosIXJ//9Pn2zLfqw72sho5DkFqQ3sFvpp7Rs09ejZDzefZ6JT+Qad2qHVtgFFH2enRBN59urjtUPrkmkcHXYAphpYyrUSDOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406499; c=relaxed/simple;
	bh=oPx+TYWEbOLSoB6gl8GiiVCXJsV3cGiWKVqM3xR9UtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kISxoIin8F/EYL7oRGUCi9xTkVaZmg5B7548IEY2o2X2nzTeoiw5MskDThHWQ8EcOef70UiKf1Y0pNxs95sVWTuXXWWvZXNSXw4EBmGKlZy73TJAv6pT5vNo3fO2t9+ekLSEJrgQy7/WxOqXMSnnHbXbAVRu965glHPDXjL8/PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FToPpjRm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FToPpjRm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48909558b3aso36555055e9.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406492; x=1779011292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+ZA0O5WYutVBzNDlZS1hqQyKCHJ3cdUiG33N7QKPgQ=;
        b=FToPpjRm4RG+zsaGViYBOCvdo2+0SXHSbBAleSZ2kQyCB2yac72sRj07vVMsyJqIDl
         Go8ZubrjIwoGCm6/SPjgs7lo/T5z3cCgYmEix0dWTV1bc766tNJqpLzYJ1h6D+vnscK2
         79tb5DObwslWUk3+oRFLwsldEMiVUJ+lLxPikurtOlCXxL3fvs4U0NL/0ljpOxv2vMIv
         KNXjcL+s8ml2G/OO8G1OafDfZR7UzNDuxFzoKDWm2K0kV+HULejHtsgsTWfX3SuA+4Pe
         A2sGn4uTLfp6NrXrukjlfxMpg44jMl3wkSmMQxKHdiL5A8mliDyf+04pJSwkY/aBve3h
         ZHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406492; x=1779011292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+ZA0O5WYutVBzNDlZS1hqQyKCHJ3cdUiG33N7QKPgQ=;
        b=V7+ro+oKQ0kcUPkZDBxBx3oxkWoA+VTI8QUl+zS4gnv/7NplIBTnhyJVZ9pu+tmoln
         gY5r0EhL0e9Qt+KI6tbzOuLgZh/UTVpMNcZb1RFc9zP4a+CLauEk/Sz86xCMykD6j+BL
         7NLNdIZmnkJe5sITAVPQBhHpllFp4wK38U2IysC15hdRr4Twubb/SX+M3uCZBfzAFc9O
         1QERIYt/6PC35Nl1jqTGE+GSmySCtDfAlQ1mK5PmBCSrMutiK+iS6v+60LZSO7oU2RwW
         gzFX7dQPHVjPUgeMkf3VhhmREAPVphPzZzRDUalG0ZKqMKHArBOoK0gPEmOtCb2lIU7u
         kvSg==
X-Forwarded-Encrypted: i=1; AFNElJ+sNGzccTQ/xhKMUjePLbwLfrj8H4EdJfvjWYhOrxbRFrptEnYel+BQJ4WCRNv44gPONTCsi+q9vnvH@vger.kernel.org
X-Gm-Message-State: AOJu0YxRuL9P60kieuA1WSX2K26gQBdu4RsEJfc/SdnFdi+mHDzZaqis
	fB7onC9Q8GVb/c/ntnmFSIRY1DzX4xjBFf9BB/sfTp3qbQi1srNBBbWs
X-Gm-Gg: Acq92OFsmQxYOHjmWB4YlT7FDIktjQYIjW9bvHCL5o/uqA5Rbx0xXA8Vy39gASd0jjx
	w2hXs7AzInodN1YMYBI0LoF5JXvMWgzSSAudJt9ZthiKhUmWv+eLuTRI2JPhsU7FM+Nmz8gutju
	JIMVOhEjaTSX/ukDIJaKiIH/wnVhoX8PGRm39GKeFH/DocFWKODCxrlFwDNuD/OJkfNAMETB1vP
	TNSRzoimvXli0ugMlmGOgNNwKUQoSvxDJxp/y6T4Y0fqobV24Oirln3roKtPiofQLmlmUa10gPV
	e9mx1muFmvN8cRt2X6CA77kthoIa7sbsJVeywx8LpH2D6cfOt0peAzixxof+uST2LLW5tK7f1ji
	+Rb/ghh6n9Kk5yuvruZovkZYffVjWoZP3ZNsiREfxFF15wcJdbKZLNilhMMcj7Xi5AKVoH8Wcls
	VHkNZOGLvmlX3cC7WLtYhHnV29BlnF
X-Received: by 2002:a05:600c:4ba6:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-48e51f4bab4mr180086765e9.25.1778406491652;
        Sun, 10 May 2026 02:48:11 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:11 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:46 +0300
Subject: [PATCH v6 8/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-8-e69465375900@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Despite using HFI version 1, MSM8939 supports HEVC decoding, therefore
it is not blacklisted. Add HEVC to the type converter function so it can
be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  6 ++++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6ad20d58dda2..75cf63b452dd 100644
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
@@ -724,6 +728,8 @@ static const struct venus_resources msm8939_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..514dfb99449c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -84,6 +84,8 @@ struct venus_resources {
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

