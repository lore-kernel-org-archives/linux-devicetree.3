Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C388405C4B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203620; cv=none; b=alTxiydb7e3smmLEO0EskvYIii0s3i3M40OFqi1LJAtjQW4NdFMOqgZdS6PFD6x4f00R7s2cftx54M/MwYm5vMQiQvo2ttfGQMebgF+48MEA4m4MRlQ5aAJhcsp9zPO0fnp0EPAnfd6z9kX8i/jc13rrkNnokI/6ftgiyyuL28c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203620; c=relaxed/simple;
	bh=aYhaIzNwDkK+FVYZ56jaWtzX4RysdwPlvKRxwy6pzZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkk62txng2p7EA6mZYb9OwBgN8uabA07euq6ZtTNXITangthfQjZfpiNs8mFSawc0VEcygIiuHNU7r18m6oD1zhuZ8LYSH7Mv0yqdoYN1XHtgtXZRY2PM/1NA6W15itOX49PtN+l2TWF2RqlgFfSdJswz5DZ0iaSeZKSwuPIcM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pf1+b31s; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pf1+b31s"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso5019003a12.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203617; x=1779808417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfYMJnZuLLMFjOVUeUnlk0ujttfbJS66AiqGq0iE0pc=;
        b=pf1+b31sT7s0MlBVk/5TWXX0SFF4RL3QgP/g5YmRpOAiCU5ZhMon12oNTxN3Uv9GpG
         3BYA8nO29XT+FWgM3uRNPF9AZWFuEJ0GOUaFE7l1GWoImqNoUUXaVr2zjktjQ1oVxXIH
         jDGJqiYkjjM3td4PeIPh2wSVu9zvtOSIfjnbwNr+BHfmkhT4TF/XaNHclzI5gPn+SZdD
         HlRE4Z1P5nV5f4tQ+JO3q4Miv9UROF/Uhqx2c2OMGam9E0o1fAXINHPgB2UMB2utQPWt
         /GWYZKjLF/zbjCganFp1MELbp3FGkf7Im7t007WYeK4r9OBeF1EGLvGHVVRHHmURSJhh
         bI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203617; x=1779808417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yfYMJnZuLLMFjOVUeUnlk0ujttfbJS66AiqGq0iE0pc=;
        b=aAyVkfOsu2TiMI82Xqhs4rUgFEQQ5PBxiQOXuPu8R9fT95NKuZM6YMy1re+DOyi/mz
         q6ik2cl0u+cH5JUr3P8HrhyNjpP0+MCa963oZ4gMAjjM1QWEOKZMu+7HUIKLTy3hUldI
         QYPGQrYZqbmC3jHtmv7ZCl6zd9xnKU0MjtaNYYvvr8TDKZ4XzPXZ7kLm/Y9DHcoBUarR
         pZIcHgeyhPJCu83ZFFSJfINpLLRY4E0i0BxRjwJyn7Lr7hvAP73aMPaIcJHBdRwbGRYD
         imswyNeSciacmnyO3hWZ6oulTEhQoKbMwFzqjYLfC21T84AEFsvOlqQqGLluB4bmG1NT
         rspw==
X-Forwarded-Encrypted: i=1; AFNElJ8/tiATkUA6uTrTdzuIbFo9AK3yYOeqy/1qJPTZdwek5bkvFwG1tcwfVBS7kYiQ873JKkp7NG4zlXYL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq2EtwRYO3Dy0VUc+NA6C4x/IuWaqclJiYGmpcVvXjk0S3K2RO
	lvXnJP9KX6KP2S2gMqQU7UmmIOYKV8gfgWx7Vpl5xcwPV2X7HH3pMitw
X-Gm-Gg: Acq92OHzdp/tEfwfVfvyaxLA08MbvpeD4M8ZHU5Awl5JTFW/mKMIc7Uhx6D0vV6IJ1V
	zgSGmvZYibd/LxaiXFkck0Ld4MaqgvysIBAVHJA5Cy4PUzOU3/JyCSqdQ178tBD4YC97gSMDu7+
	kVbO+oDJVA236Dmxm0ZqQm8vs/P64FPY2ODfRGRN4NkcumhD6cnLlz37ISUS3+dQaRFhxmBkkG6
	8sdRBrUX4WujNFAD6i03DhtOK6/nfd0aHPe3c+JDWWr088vVF4LcezjhK4joSLGYHQAMy9hu7T2
	jtW9P1G7XtmU4AZiBjbF90TxKcSFx/TIzbA892PzM+AfWTGzpLlw2NM8ZWOkr9LKTJgJ+fFcxje
	KQ6fU+yrCG96UUCPnZ6QgqlNiO3IkD4qPu3H/mrPLeGKyFk8vCs7HqoisSdhPGfeHznxZ2O3YjI
	fDPVbaNA4aFeSf/58pEvM9nBshK1hqUgtiCKMi
X-Received: by 2002:a05:6402:13c2:b0:683:1cc8:84a8 with SMTP id 4fb4d7f45d1cf-683bd28ac44mr10467337a12.12.1779203617448;
        Tue, 19 May 2026 08:13:37 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:36 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:50 +0300
Subject: [PATCH v8 5/9] media: qcom: venus: migrate MSM8916 to new
 blacklist mechanism
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Blacklist unsupported codecs for MSM8916 reported by firmware to prevent
them from loading.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a87e8afb23df..3baa6bb4968f 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -684,6 +684,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };

-- 
2.54.0

