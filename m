Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDA0363086
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142869; cv=none; b=J+m1tRYgr5WsY9JN0nx3SHoTq/SR0KXySj0IZC1R4VPqpKdGe6p9P/YfAwwoKl0oFVhMNaGquPK7XoYn31CJweyL3fvYD5Hd6KljQxDGB6Q1sJsIIGNrEoChwcNAylP85rf2C3IhnScJSu/H4uZ7nXwRO39ixMXzLRs8sk+0/+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142869; c=relaxed/simple;
	bh=Hgic8MxAnTFchNHGOEh1DGqhIUm8syxUYUmVA61qdbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhYfTwEWiGYgh+VYoB2t3YZKFcd3gLuj01M0EtSILvs1O+FN+htRQPNVTmV7FTXhYGAbLze9lWppOalibApAevuhBTdclvGkYFzJ6v9q0E3W43KiYWsKhKsLIpJidDr5eX7LAH5BuR/wjopBfl42y4nM/R8sAF++R8o4cm3DY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKaJ/t5P; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKaJ/t5P"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7bb0d18c7f9so5487927b3.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142864; x=1778747664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mztCL7JMamVAXPjkOpC2zBeTslrHsHuCunn4L1+puRM=;
        b=pKaJ/t5PeESzq4Ku8QJaTko0AFoNXDrstBGeJbCiaaOYOV1Yxgt6ECLJ9y+19OFDCJ
         jlHvWF9kwHqyB4z3x/RApNHtEefxc55zgwp9rT7I/V6x/bStZfuVW1zximSBx6lc6YMY
         F/cseBlHVL/fn4/aOZB/ycQba4Y/DqaG/RLLggT4lCMGxBzB0h1Bdw/MLtrHf8jU/QVn
         mV7XmHoLGY9Q/2yEnq5clF9V/ZlpBVg5BvtAz6hTuTUWbqXz8CTt/+65o/FN3ydfPDRW
         x5YL9CFCKs146RuwF1yslsWhtjcrEhV5BGCUO3FW2Rk2oE3CCaYtvxjFpDMNuit81+Rd
         Ue0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142864; x=1778747664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mztCL7JMamVAXPjkOpC2zBeTslrHsHuCunn4L1+puRM=;
        b=icUfp7k8qs/Kqgia4iHpkJd463TUn56ARcDfhE5Zh8eGzTZ0hNMuUY3wSMd3101ink
         /cLDID7lDaU0OOcFAZL0gK1kPSnC5jgwHSytJ5JbWlr7khmKBKo6Umpr+84DvhdnILxg
         RPdRtOp+W1vf7tUVdbUtuXHZYxMPMM/MmxCsSBXa2fXzKzU06qNrqWlghxvs+Gw2kui9
         ddAPqn4AgixtyXSMiKg3UWUvCJzzcwKoni+AYSoCFG8pJUV8/uy/nkm//2LCVq98MeDU
         RkBnCYzvGonHskW3hDCrW0O2JMl0KwYYnsNQA2zSTxKLk8eSSt1E7dJI3ujy3k4bt2N5
         q2wA==
X-Forwarded-Encrypted: i=1; AFNElJ/QRGfw0/xhlRN6flXuRs1YTOLdCEI7PsN76NzHAtVifOwSWpl9v/pJxmFAYp3txMXyfROwQ4LcFLv0@vger.kernel.org
X-Gm-Message-State: AOJu0YwfSkZYytMkOfWVOjEyiC6OyjVnYXLc6pqrTEpwyQfN6X6D2i5Y
	Fxip7ZamxiKi+RXf6IcHd0ssG8kiG+Zn3Q6UIbmdUUxXZ2eGBi8A3JCo
X-Gm-Gg: AeBDieuJk1p2MFoeMUADroJ9Apj9J4/bVlCgMLSJCbdRA4BvW+fpORBtguslBkR8C47
	ErOyLoDx4JIQO3/IZoVYR7w3wwilBuHCNPdpXYamrW6tmHGY8QF3xPLsxjesba1fGvsZgcNr01o
	OYlZHaDBzjgnNZVPGnX1dQKghAByMZM3yqbnRCgcV4bIdaLqlv33VzNWZt5K642IdNog0Qc4LmV
	9kUwLMRTfjmxjjuBwqdKuuHrirwLCKnwWEheClqVGFOCglPdY4i1b96x38H5tYbr4E2CwFG4v0d
	phcQCxx6VhQXM6q22Eas96jiXzOnIi6/RDEqWMCwSmyHNCvis8Qt1jYBgid/2k7EHdHlFEBY072
	8lNNnQBkzE+fOg0YDrxp89vUWVXPDho80ZfcrJsNoD8WiGBpI2tGyEidhJGcgf12dfSJZv3RrLT
	RkA69SFFND2HkBa2VLHrhFg2VtqiipDYENPKH5
X-Received: by 2002:a05:690c:c4f3:b0:79f:b903:88c4 with SMTP id 00721157ae682-7bdf5efbc18mr71178527b3.46.1778142864586;
        Thu, 07 May 2026 01:34:24 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:34:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:23 +0300
Subject: [PATCH v5 8/8] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-msm8939-venus-rfc-v5-8-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
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
index 6ad20d58dda2..89798ad1087b 100644
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

