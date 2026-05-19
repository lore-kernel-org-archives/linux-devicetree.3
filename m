Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB5A400E17
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203617; cv=none; b=XzYTuVikHorU5rc6gBMfAFbn4XsFoa4igh3sn9qbIka43VZa2o1qQmVtu127y4+58GWgFQHKnHc/o0p2FDMlBAtxVL03RuPK0PCbAGtbZReEydhaDrYJ38vlY1FKtGkBwQD4g5w3IfeLsJeoTbJWkRRwVN1Sm5ry1rheL244kQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203617; c=relaxed/simple;
	bh=PyMDXHTHmiBal63+huyGbhXhACUB3uDUE0n5xE6s7NA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfNOy5sV/gz++7wFgj1Wn+Ud9g+9u5gEPJVuXgkGuhWDgj4iQ+BWN+Dp01+1j9LNKgliBlsf/sChzmnDxXrHzqqvwRcHR8NW1PJrn+lvUPwqSgcW3mE5UVrn0oPKxvH5WZBo51t94wD4az+z4JBdhfrUMcpjvTjwOs6E1d3cO8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BajwrF+5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BajwrF+5"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-686af4e582aso3056512a12.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203613; x=1779808413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xq7nQ1Lsb3vRwbjHSOrZ5dNJgO6+7CKIuI6JGLvOcQk=;
        b=BajwrF+52pOVnrXSdG8nYsG1nb2P/dv5aBLkWrSRM6UImHnLFqX+GyTcCHmOR2QsyF
         aRFXdqk2aPoZs/EqSLpp0f2V8Oh3HrNE3HdmMlxeKepNpSYqgWCobNXrLF9OX7noFsbx
         ZaHBnNr1BgN4Qs5KugIlzww61vtwdmZ9Uh1WiUX4OO2mCrGviMHY8BcjXDSUTUAnG2n3
         LTEG3+burDB36W/R+Yu4XaxBD9EPyA+RnIomXygprHvshJxf2gjqaKqDitytL9sQ+bql
         YMNg9TWj1L3TvVOEjnAy9ksNGuY/So2ocXWxb81GPrtA4O2DkiQkJ7Wa1D4xFe8rnPq7
         CrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203613; x=1779808413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xq7nQ1Lsb3vRwbjHSOrZ5dNJgO6+7CKIuI6JGLvOcQk=;
        b=NU74e3bB4sADsIF6Kt9+7b0oGBCHuWhw1Q0DCTmQxeBLfbR5P77nQ5IBWY0zsS+Yd5
         njgRymCUk+iAxaiTiZApioeh3IBFAdX8af4WaktOOIRgzsVvL9fEHGXjWEXLtd0h8xEk
         JOGB1DTrX5+x0X5LZHcbxwGlsFtDzRN0SsSY76BYEuJjRHVPiRuVF1MAXthZID6QBgN5
         7B/RtY6oIvEXTow6ELwV0/atoIv5Ytx2vdB8VMjYXvltsyWTF4nO8gK3BzHiyhAEsOdy
         syFf+fz8fYkO3OgVsTKbwfMGQbaUbgKGeg6I8aF8lG3zeIcCs7mF6KJ8PMpECjdA1yI+
         rXhg==
X-Forwarded-Encrypted: i=1; AFNElJ+rzQYQeLZH/b76BIUhAt2E9dQeU8qiqMmfVUUWXvOqzNEwVAzpEjeGskB23U4owrp9rKH10tsPkBmu@vger.kernel.org
X-Gm-Message-State: AOJu0YxqYziEa046ux6tuTPZzejumBvDMLur1cEICWE6YeAvlgGFN6E4
	9jtD8OJBe7FS5hH+lFR/a4tCF/eeWOpV5tQ/p3Q2ai+PtfWXl7UMVLXj
X-Gm-Gg: Acq92OFqZ0H9GfNx/qMBI+nm8pClSpRIBdkR45xS8NOsFcEkRuiI3IYW+u9UIuJhozf
	Z0jlMRDUrDLv+qQl02KJrcfg+TNwW1COed8IuUDdUhVTpw5BIsw4w4yQpd6lnP8Qgc2KWUPx4ZO
	ba5jxNGqh/G99kEbuRz5a6fPlkPMDCFCdaIKTTEaBQCcWukKx+0WLuUxb3Vfv0AU84fbLzLed+r
	TEHDAyq5sIvfnWa7IaiZiIHjjwPjBdaHSdeVX5t5ARiNnJCKp19WWwPYQK80twLw2EgfupIaz6D
	Z4P3cE1oK8URoFnw7ac0xav/Tbdtpc+VxHwdUQ91deOx/3Uj6ldNqvHwpRraC3GFIN2aYepC0uK
	FSj528k1oLoNOQS+6UBu3VIwF51i1zU8Mt7BxQS3pCp89meHdExJGT4QtORPQ9NtMXSu4cmJo52
	bCVt8FI9d7lJiDk1PRcsCxnX8RfQ==
X-Received: by 2002:a05:6402:40cf:b0:67d:bc41:334c with SMTP id 4fb4d7f45d1cf-683b40c5f7amr10086739a12.5.1779203613247;
        Tue, 19 May 2026 08:13:33 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:31 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:49 +0300
Subject: [PATCH v8 4/9] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-msm8939-venus-rfc-v8-4-542ec7557ebc@gmail.com>
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

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

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

