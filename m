Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4400E379EDF
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141905; cv=none; b=Yz0QQZN6FvPa+HwyONwVgGQLoDGwbfQc+ifsJ1bg6p8MwPHtcQgrUuxbDTqGit9ZQ3Ec43eGIQR02ZYw6WVaM4u8nhcv9k3El6UJIelKiyepx4ASUp7y6TynVbXW0kPADMcRzqZFPlXuVrFV89qMehw/L2e8w5ybww9HJMPNZR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141905; c=relaxed/simple;
	bh=a7H80R42r3F7Ek1jE2GWR+lyOfXfzqpGUFLS1QAha0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQ8ooXshJ984QpATtgpuIs603xf60dBSqbiK8PaUp76D19kLP9a3O9Lb94GGhumqBvQ5XnCKPOhuDspcC5XODM4CawE8dT9H4GC34Z6UFGCBHSziR14ptmMdBEClmzcHGZtxiGteMLbUNwzrkqNlLYKRewFKZ9WYUDrm5NKlQo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzC18Q+5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzC18Q+5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso92456085e9.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141901; x=1777746701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARuAZF6TJpQOmiY9M38BKODkMHskTETvMicBDgqEAHI=;
        b=SzC18Q+5MaXyxkHH//H7gVxvZI/vKHIYUnI/08ywolMda6hH8p+jogPh9J8xVJ+a7E
         lwoQcDYsLei7NNkS0L1wkM2cY5D6SOhjDtVPcmpL7218//k4ztjI9Z8UiiJwg47lTT+e
         S55ptSuy8ezrVNd/Gwd14pJUI+8kk3bjPSD1jGrv111J4ZmVw8mZRBM/fnkjpOkUfPic
         q1iVsKIO4ODBtfG5ZMS93JVWhax0TXblkgmmqX8r0o+m+uC3mHSRq/3AD3vGfrdggt/j
         m+wYVZpto1YtztMiuJBCo7oc+yCkYeGoQei79WwExoIKpP8bIqSxHCycnYJiG+uJzAz3
         qlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141901; x=1777746701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ARuAZF6TJpQOmiY9M38BKODkMHskTETvMicBDgqEAHI=;
        b=YL9RTnSIW6m6OuQhJSYT3PjCd/Nz9GEgm6X/wEyCJrbZneZ/4SR5JAXy++A/77yVAZ
         BfualFbmJpckhGpv9oweB2vq+qGJbzS/PyDyBOG5e7XfppUFxHOn2ytCF23djaxbkvhD
         pnKWQYwFS0Apg+s/Ow8WyqqoHtRsbIQbC+je44WJdyDx41kyEZ2D18E8T41YfOYMGnee
         VvB7Cmklwy7NchWqwJgZTxmPV5XBB+JznVcUTvZInenGx36H5yuxIFYMWCcIYobSYuaJ
         RpEZVZhhNiUg4YVzcX/7x/55XODIEW41XiXJWRhWmCz5W76NbLaAlviO+Ubjp+Vi8ETg
         ErNA==
X-Forwarded-Encrypted: i=1; AFNElJ/YvqViSk4m/Tefswu1bENJ5bxTPgFEGKkrxh+FTzR/+XY2J2FyyETKxFARot0HWaYGgro3s5n+FzjH@vger.kernel.org
X-Gm-Message-State: AOJu0YwXbD4gM3UwTOomlwJONVByv57Ov6MqHKQW27VCq7mZeAHZFfQi
	hsp/eqz9uk1VR86irKHFLxD4Gd/m3V8LyI3gAI5b0v4vk3kDGzZ+630d
X-Gm-Gg: AeBDieuMPVS2p7AD4F3AX2c0oFJsNCTfCipBtpWrNA/eHxR/Bft6JDwWwV/vKPEahMi
	dXCBprAoMGtX2NWe3mzEqfTwQM7352hO70OQO7zSPtPrrKAuvRLHju73SluJgDyif34dClocgxw
	kp2DUtM2pSvuzFN5E7Q/WR26TuIcwI3HLXNeU8eSpHKmC5rWx/PEAy/VL/f8phR/oH6d3zst61T
	lTeDisy3zVoIU/q5NUAZYZTSTE868hUE64V++7Qy5EROcr0OPgByw0GQBaCWS2V+YZdPIthrCsC
	4ZIPZ8hBQ59AVOo4yGkK2EOZBwcimnnIEtrBcTBlTP2sQEoMHf79SUCve5HcKHioHQEmWdND5Xs
	KXJOsEiI7j6LJJT1xUtoc/xjq8rOyBkUSNtmdzxA9mCa+vjSIAnIie8e1eYiQTh3xfpDm/PoDdl
	hcN8Z5DxOeiDaDqahhEKnQI+TcAfrnxtfDyIY=
X-Received: by 2002:a05:600c:41d6:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-488fb745294mr323101045e9.1.1777141900459;
        Sat, 25 Apr 2026 11:31:40 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:40 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:12 +0300
Subject: [PATCH RFC v2 11/11] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-11-f69e52b36207@gmail.com>
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
index ebe166b5c955..98526a1735d9 100644
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

