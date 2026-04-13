Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6933B2FD1
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074862; cv=none; b=PcdVjTXMCiCmfIfLRXMKLGj1eWlvQcpCS/64iS6UuRfTVcmklhnFIzFCoE0wavtnbET42f8q4Czz895RdnKTYlS6vYPte9MFkWqK0i/mNUKMECInqQhaPhWY2BeM6tOfjftR7uc673bV9NXE3gpkR3DQmj3vrTvdw4Y2mUAHlnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074862; c=relaxed/simple;
	bh=D+s8GVQ/QM2vK0xezQUADaOx11u8s9xPf3kKowcoFZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W08skXcFENOXFjmNBf/bvkfOAnJI4DyydLm+A9TMBEuqGnBCXc/dDJvfTNRbrUFpYAY4nvqoG1AtAwxvdLNKWPPdczYG45hw6vI7Y+4e+UDikU232Y0FKePOf9zDA1DW1IWu6zimybsjxuQBXkBVyYSxzUtm5U6H2vZiJMOD6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0IVQzUJ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0IVQzUJ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f37c09352so572102b3a.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074861; x=1776679661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2PgkH4WVSPSDvO10sNeJhrjoQgLFADjIHpjqVVMmPg=;
        b=o0IVQzUJsIVAaREADYj0S7ac0lmYXDnHZx8vYYm1XtLq3Ofx6yoILvwfUGf2mkwTcs
         irpZhMIJNC3J3uUn8dUtG2j2epBKl4uLaO5YEEPnlRI7lniPL16MNfEMPJAnsT5KaLlu
         HwKmTI/9y2ms8Ej5iCcKA843LWhJByN0I2td/Z8P7wvystKVZ87uF5/HtwP0aMcRiL9C
         42Q0P5/36HdYb9Cr4ZLAl7SeQpXw9Jf3CAdXwUF5s8qiU7NQlfgy9J66cHZXPlI+Iwsm
         G4j2Klj5jvPSiAatde9C/ZfLeCH1iA4KnH3Fn6lGGbPIWvHEa3fJ+3qg23W30kV8nlPy
         wBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074861; x=1776679661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2PgkH4WVSPSDvO10sNeJhrjoQgLFADjIHpjqVVMmPg=;
        b=nKc3AaxqgAESNgFlOs9bmvSZaCVHHS9gfiz6jjf04Id5NlG9vfpxBCw8nG4lzRlTKj
         ZPM02o6YFxqPyXrv1wkcrJa1usqKRgIAzI/9o5T938jaMgipIMScyoPjaeIaR4A5bQtY
         aitBEobcmXHAqbMG3KmBiuCQkdELRpKZBIf2v8Wn86UHskm0YFnarlcL2R5uvkfmbii3
         9gEMCvLuw4atr8sxBlwXKwDjPahKEqFvt929pTxopKRtsVUM6kYMPLfQYFFJOsV6hR81
         Mqoh5kDO3s3Y1aaFpt9oc7qmycztvye5Qzl3Q7+K0HTizseEvOPD7yN8D22dTtHs5QmP
         xabw==
X-Forwarded-Encrypted: i=1; AFNElJ+wPoy6j0kroPjhETjoSS+crJstb/Habh0OThpO9Jl9Pq9forAJsc21/PwqSQqFQxb9hCv6obXo7waN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqwimmeq2uMh2walsrwOUwj6C/NU+MCtqxaQ/esPBOZy4oxouV
	OmmOpIiPhh/cS6HUXwnMARL/07mtMmRx0DN8NTlPHdOUKCj7JrKsN9le
X-Gm-Gg: AeBDievOfDUuJfdGRp2w0pSRggpxQK/4Xd4tuj9AdAEF8xPUdC7C/vIk6UbzuPEhPng
	RZuYm04siylT8Z9kITWqZzEuv5/N2l+C20tvp3mZid5aAD4ytc/KQ7URqrjFJ3lB9t4AdtCxlIQ
	rnQv8Iuw2t+ISQT/5QQZ+SQUs7drGDsbsnShMoTGpEjPM2b/AZGRSp6U0iOHBzBHoVBaDfxD+QV
	gZmNaoaLMLETgqPc12CJIkIjVKfM4XxxFBfp5XizK0cHY+pjs/Qzaag3GaiL82mQC3KamvWXcb9
	0kNKMcFhxqRs+y0yP1dr/B1lYKPBHxOklR1iG+dctZiowLl4ucGqtQSeCvsGjesAF7OmpIz7ZDS
	mjM5WbiZVT6JXBNvscBnOluCIcL5qG4H6a8GsC/Y0drWFCAiq0XF9vLRbK6lDHeew4d3DucQY9a
	8jryQJkQBygZMIgdMsactglXzNiqhUevCaFDQlj55af/RutKtwQbSxG2V/4Q==
X-Received: by 2002:a05:6a00:4218:b0:818:1e8c:a513 with SMTP id d2e1a72fcca58-82f0d1ec525mr9578297b3a.17.1776074860694;
        Mon, 13 Apr 2026 03:07:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
Date: Mon, 13 Apr 2026 17:06:57 +0700
Message-ID: <20260413100700.30995-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Reorder calls to execute fsi_stream_stop() before fsi_hw_shutdown().
This ensures that all register accesses are completed before the clock is
disabled, preventing the system hang observed on r8a7740.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 109e06b5f32d..9df3e91ac79c 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1606,9 +1606,9 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			ret = fsi_stream_transfer(io);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
+		fsi_stream_stop(fsi, io);
 		if (!ret)
 			ret = fsi_hw_shutdown(fsi, dai->dev);
-		fsi_stream_stop(fsi, io);
 		fsi_stream_quit(fsi, io);
 		break;
 	}
-- 
2.43.0

