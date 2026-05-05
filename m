Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027804ADD89
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017595; cv=none; b=QcsdMMmgkz6HjZRcw3X1jcpSboVTl/n+g4mQNdsc56EO6CegifBoNDBrjTZKFiRVDVzPJfZeo0jKBJbENkIge6eEwJZt7aKNGH3bBByCW/mmzE6Trha8IWTbRsweaDpM27aFSA9tNR4pkyb6JRXS2ArDgYkGhmtc9f4YggkPvPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017595; c=relaxed/simple;
	bh=//M46Tga2bI34hWrYo8a2BgcoG977Zc1LR/SYbuK1Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jq880rK3g2E/UYzagLzIzN8K0H7m3AjIeT6aILP8fxeX4HjJiPXT+pZHeNqUsx/M4eEdwtZYXth5kCG9OFWpFFgN17AbZR4hrsG3pWBf2GVFMMmRqBbRUeDniKzWNM0Slrz6FcG2nKYmqICof/Alf6LqYEfPElBkhUrD2HuC13E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6Iwfg88; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6Iwfg88"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7bdc947aaa3so12288657b3.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 14:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017593; x=1778622393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA3VhW1+zRSIxiOmiAMnVzHu6j3L3rzzIeEBVV/zfx0=;
        b=B6Iwfg88ad/vaK4zIvY6JIN1bYHDtPTP10C6SxOXbEGngF/B4DYLtXpXDTFvVzO6YX
         Hrfoqs6LFdoXQrZfib7U0NWXhu2JHikfTdH9PK/rKAIIAQgCr/SD98fug9BqpQESDjaT
         twOc6SIGXXxpBiAwHJnpc/NieIX68ZoXN3O13TJxzCkyg6o8JTLRgosqZSC2glWFEPg2
         tzf9yQalZOj4oAA0QJkJrxmYqOD5kGOspbk5ov3AVjNxEj2OiMb2kcwX2j2Qhg9zYpAL
         kAHIPhKNUPmLhDdy+XFbxdp8ZLPBhbRSm37fy0iZSuyBgnOM8d6YDIUKwf6jDFQQhSBa
         q0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017593; x=1778622393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mA3VhW1+zRSIxiOmiAMnVzHu6j3L3rzzIeEBVV/zfx0=;
        b=CSPeaiXbUWm1U617WRzQzY0QRIkHZCkEb+wb9NfX1m+oMzvAEdu4V7GXx2r9t0Yogz
         NTcHpgmzARf6V70zRABx71iMTKKPNzOlDXB6lHwx9LT8u0IMennLyuvV8EoOQyS6rWTc
         7JzzUr1fJFg3OiZXPCqLf9mqVSVAxwW53L+Ws5MxAn/EOSUoOWgH1bKFJtcIdf6rXjgi
         WsFSZ7JQ1Jh89Gljilgt8V+FiKd4kq2MohDGZe6AUSF1hIOTIME91RlUzYeySAT8Mtqv
         y3ObVOiXpKN5zAE8Y/WR4Mv1QCa8HCUfbvpAPM6Y6eKMac1S1i9l/ShiTXvl4yOo1u0h
         ElFw==
X-Forwarded-Encrypted: i=1; AFNElJ/Au7qspJ0iVkfM+O+hNFMnx7Y2NHWSHpjTXm0eWNaNc8+XKctTU6YdQ7aDvu6v8iPP+HLJ9qbom3Es@vger.kernel.org
X-Gm-Message-State: AOJu0YzcC/3Eacrx9Gta9NGIAqN54hzb/V8vAiOxqOZgCItCw56D1vl6
	ai2f6MBeW1PKq5gq7Z9DUIDc9dxzYRZIIezj4eEnGKxAd9ttw1ah2gY9
X-Gm-Gg: AeBDieu8ywJZ1YeHmKjBqwwXN+cWD3ZWKR8z4h0HhCMXOWSz/mys1EIo/PxpYuj3RfH
	29w5xOEwfOS9qMoPjkWaPpXwouuJMsv50q/0EEVHpRKfWWlr3y6qMj5R2mdCApHwWbPx/m9LiP1
	vi3CYT5BeU24E709VEVVWTt86RYjqamrxmzc/0RRynxCIVFYJavwzjNgF/q2po/89ECDS0lGbv9
	w+gvcNfjnxDgP5cA3SWPhwbkql4A1XANyk9XO6XXsTJkNSjM2p6fGz/QJ4fCY/Mo8DEUQm4Ze86
	OmQKO0rAaSFuuGYJyPt+Afv+YOVgCSetWFTZghmAWH+cbbLvTioRTp9lo25YE8ZJb9U0xxvuowJ
	tMLZBDn3mfCcbdMAWEl7bpdo6ahVQfWKAH9JZG1STtEweshSJTzH8tBdM57iioQosI4kQZ5H1tW
	svyL8uzJQ1Ice3y7N/wOlkABso2JR7IP6At8Yk
X-Received: by 2002:a05:690c:a05c:b0:7b1:3579:2ef7 with SMTP id 00721157ae682-7bdf5e86fa3mr9817227b3.28.1778017593022;
        Tue, 05 May 2026 14:46:33 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:32 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:46 +0300
Subject: [PATCH v4 9/9] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-9-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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

MSM8939 supports HEVC decoding. Do not disable the HEVC codec HFI bit
and add it to codec type converter method so it can be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       | 2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 1871cf3830ac..eda6b19708ab 100644
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
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..178274d10c02 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -207,7 +207,8 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->enc_codecs = codecs->enc_codecs;
 
 	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
+		if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))
+			core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
 		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 	}

-- 
2.54.0

