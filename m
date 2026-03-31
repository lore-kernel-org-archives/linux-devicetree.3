Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBC13A75A8
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985984; cv=none; b=QLl9iw3/OJ2H1+C8Y5MDU04zB0k7g3/DmpGgSJBXTRFLIk2QLd1fUHzFGxWABVdYUF+T5vdEC4ZhfYmXBC60el/HbwuyJm4n3WHVP/0uUPmoXGUrMkY294wBuqdVGFcJNo1dvPINpVHYlatV3Af4eRPnbn6q6JZvIcG/1HzvG54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985984; c=relaxed/simple;
	bh=WAt23p6wWxkOHhZf8zSAdYtlsqgQv1/kNzdA1zObNIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQiD6ECYOAPrcVsglZd/4Mn0ORE41KnqgdNR7qFFMV9saEdd7uKRNd/kIErmKbgylYzdgE+IiiZGknhlNlD48vMp2fpvuOeg2858fK0C3A1a86tn9BxwajL5zydiU25C2kt7mK07Bh7LylF17SxXhb25lZ1K2631b+KUD7XCsTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kapqWO13; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kapqWO13"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5094e1d17d3so59867871cf.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985982; x=1775590782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu8+HYnN9QA/s0Ocg9WNVxv21EjyZNWyGCNCp1OiYbo=;
        b=kapqWO139NWsWMzQtJxoJk4iUEoKwe8YYRJgQiQonw26bUxkK+ggEpeCKwvDgX9mwL
         JFSXlRAe8TqZlSI5REiGotd9lQGK5/2GODMWX6wY+2Fa3X8mvDlRt8l77kwffjkN3Xhy
         im/3vuit0A80N2z7FU2jVPCl3/5aRGq6AfgkveZHvn29IsThLbonaekFTLbX3XUDaJim
         KT1cIDLbEkfi7XUlc36Wjhw0dVio2OY/7gHaa6WZ08XJLJyCrCo4h0bY5KyovUq27qOB
         9DCp/W4HvOTnvF8tG1ssYYJjZ/5Sd/4L+LRhkZD5JNUlY9XN3AvDiHAUhTIdKyQZ2ez4
         MzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985982; x=1775590782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu8+HYnN9QA/s0Ocg9WNVxv21EjyZNWyGCNCp1OiYbo=;
        b=pobo+1R/T7Kmfd+46vbnDIu14HyWDBjha2LeHMskhhjNCv9jOCw2RsmO8WXJ/V9vdv
         0fmPcAao36auF5w0+EfHDTRhwYIW8HplZV3GdPLCqn4l08+igKW9kGuNx7BwS8/6V9bp
         /N88O919c+jlBpuWDgiqEGJ1RTu8zA36oz+LbNnA50gFXTi/or9vQVbpfJd/Q+8DzbVT
         iUI/H0ZmauTSVKm21QP0dMTQKii/A3W1c4TW/OS+XbBpD6wB9Z3DHTVqzSuMbzGLF58y
         PmdYnbC1yiibQUa89Uq+jnWpmmFBTv7BdluzjTwnyDZ/z0JJihkisdbe5F5pXTYLDt/r
         Qe3A==
X-Forwarded-Encrypted: i=1; AJvYcCX5NvBE0LEksAbyDAo6JSGSeLKzx6vnFt8dwVizV1HC/zcGVOknQa0tY6Jf+fngOMVedn8dN1Cnd6Wq@vger.kernel.org
X-Gm-Message-State: AOJu0YyIcHE0pF8CKXxitpCQo2G52ArQO7SKlBAjui7fAp9N0cB8Rgxg
	VJkaxmTvLmXFB2v8tNtSMqgJu7WYRuyyF5QhvyD8MY0XwMDT1Da40SyO
X-Gm-Gg: ATEYQzyP0nROzIVFrfIu7MLtc196ucA9H/XcNvK4YhIZZBrOm9ggFEuYueXep+NBYtH
	9Lgk8iXE1IZ+BmQubITMk2N4HiD4r/4eHNDB6hwvCaMCGelJ+T/Gc2Po3EnC8ZyG3hYt077apN6
	2B7rSDXZk1D+9D8Bd4gmzgUPE/w6y/67O5OX62hRvXS/vQiio0O1iODhYWFPUtFL8Ix6tMDBt6v
	BjfkF5lL3L707Ec6YkOP3vv6m7+MiFZl3bSJpGcXR+t/CkzTz5EnQ30YllNbd7tbkGTbvmvc551
	A8DQsI3iDNMLmJdowF6UvAIEzwyiLSSezbzsPYlgRo10sGCNAhZf6sjV7pS5eCLswKzpzRPT6X3
	J5fPAb9yYMqWqP/E+7mIszVNcKTAdkhP6SxQOHpQwIoPw57RE9D84w2Lm34uV0X+W2YQK4KSUzb
	1W03pzBHqeQQNjoF76GgepRaZM
X-Received: by 2002:a05:622a:2ce:b0:509:4e59:7f2d with SMTP id d75a77b69052e-50d3bbf691cmr13111461cf.28.1774985982384;
        Tue, 31 Mar 2026 12:39:42 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2e3ed5csm109995381cf.27.2026.03.31.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:41 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 11/15] ASoC: qcom: sm8250: add support for INT0_MI2S_RX and INT3_MI2S_TX
Date: Tue, 31 Mar 2026 15:39:35 -0400
Message-ID: <20260331193939.40636-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The INT0_MI2S_RX and INT3_MI2S_TX ports on SDM660 can be connected to
the digital and analog WCD codecs. They can be supported with the same
logic for other ports, but just need to be explicitly stated. Add
support for these ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f193d0ba63d0..b8f1c91725df 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -112,6 +112,22 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case INT0_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case INT3_MI2S_TX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
-- 
2.53.0

