Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05003B8D4F
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649510; cv=none; b=WxOfOG+1XD7tkzYybtxi/JvLFVkC2bDc8kHCwrYpFhTGz2d6XP3Tlggfkp2zjAEpChOTOJUO9zlFcrnWRHrNbnXuUnqadwmwwLdCz2OxN5zV0YuEN+XKxKOjVH8+9dwWBtP5Q9PP0P1w4zoJHGzxt+8ONJKQZq/b7FFUElGXoHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649510; c=relaxed/simple;
	bh=G/s+y93B3VbxxbXuxJ8DNAXRrp8SJiVZEcWWP2z/wTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ow/9lX0VlZiMdRKGcgAyf5YvFo0oG70ZpN1zLPxRfo/Lo1zuMK7VmGNI4sDkJ6crGIVTlqnXLuRwAIav2kGrLoH6g44nAMclhGNuXxpLhOZWv6gFv/e7mPr/FNcqcOFW8xwt3zpXm5zelsjhEstC1SRG+f+WDle5bYt1Hjxl96I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgZTrW6D; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgZTrW6D"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6966d0665baso1203213eaf.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649508; x=1778254308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MHNLJO73RcwFspMcGaCjKGm8pPZRWJ1o/rW8cSDca8=;
        b=lgZTrW6D59WrjEdAwam3n/UTfZLfYWC5ZBORCZ5s3db4wH04j8e0Rq2rXB5J6JK7Mu
         ucGh93kblHfOKFQeDzEtk7mdxuW4YeemZnKKTYcTcSeopak4z7bGVrMMtTCrflSbcew7
         L/u0Yc7iJ1hDrIrWML/DyOt1YyJBz0PLnCn7JU5rgGxwHC6YkeDLGk7mqWIMarYwKlTX
         qBl3U0eU/kjnpC28GJJnC3aDQ+BKgi8yRQ8/wjC0lMCtZhy+tNh95UiBJb7ZcsnfueP0
         k6UXaWtKJwTxR6L4WW3jbiFzaoal7I6t1Rk3Kj0OQGi7ykoO1Vvh6DJ3UpngBqIziDnj
         KvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649508; x=1778254308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0MHNLJO73RcwFspMcGaCjKGm8pPZRWJ1o/rW8cSDca8=;
        b=K1GnFObaggW7N0v71y6I1sbSDzaT7qlcMtP2HhSUjhfBWFp0rUPXXHL6eoo26pYwZ7
         kS/gdE+SFj2hSRL0PFemtelItu6QQp4EHaKFB3K501yTav7rxGDUoDRnBCJf9aEyKeru
         rR3pN0F5nsB2WsfA447oi3+vUhR40olna4c7GtbNx8zf45iX1YaSD9LpqxFZQCCEp6ve
         t2tsxhs5jUHXLONrAAMZACP/0SD7mAotFV69EZvvsQ+bVVIlt7PmJyeFZr1wNfNiQKvT
         qqHmsMqtpVOV17qXDCCLtG/jCZ1p8Zsuj74/BawCDk3Un4+OwWHGAO6rcN+xpZUeNJoL
         3hGA==
X-Forwarded-Encrypted: i=1; AFNElJ++goA2mECohZOFu5rUHDsNvsTo9DTtbJ2rV1o4mLnazJX9jHVL3j+T3O2l9aiPl9jycbBrrDNBD9/f@vger.kernel.org
X-Gm-Message-State: AOJu0YygRTDldedCYySH+Z5e3CvezqDaGCL5w5DPtilpsw2mPk4P7GlB
	a07dkyFM8R0eJ695e8XvOx0AFKikHXHu67BzgKQr74dLmh3A/CzAtkdX
X-Gm-Gg: AeBDiesfMjcdnatIFcAV7QLwOrwrR0kvLo3JsV2eXdtS5QSSJav8TqzRkBQ4+sPpsAT
	wCFPHYRhdP4jVNqb6xphimj2OmQF40LF6zI3m43KIeisgFaZX1f+re5Xi1e7K2lumRNTpTia/El
	u1Nek1dPe4el+vLHJGBHHcnblZ/NwxTq7eI2AIjWBRddA4FfyvToHN8o4TDZMKYBmBX+mVglGRE
	f+0zXh/KoGeJgovuWlRP/PH4ubqamHj4EP9s6ujEEmBZGn17aDI3OdiOqmKgZT54FVd752N5ze6
	SDdrqmv4NnuKZiumOBa2qCDH6Hof9C/jsv94jqDQoQKAS8GDxNGEXmsj0ruA7IBnCXwiNqAIhj6
	Jas/bp0nRV9uRr+w0EE/xMU8YoITYM+81qVX+Mhbq+/vAmUsBNjtdPiIQ2whurE5aq3zAh0YeOg
	WPRMzT7NvnpqtDqb59aNPwU8C1liRGM9oNhcOP
X-Received: by 2002:a05:6820:2016:b0:694:6d72:9fd0 with SMTP id 006d021491bc7-6967a56709fmr4086741eaf.16.1777649507661;
        Fri, 01 May 2026 08:31:47 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2cd04c68sm189355085a.46.2026.05.01.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:31:47 -0700 (PDT)
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
Subject: [PATCH v4 06/15] ASoC: qdsp6: q6dsp-lpass-ports: add internal mi2s support
Date: Fri,  1 May 2026 11:31:19 -0400
Message-ID: <20260501153128.8152-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the internal MI2S stream capabilities as specified by the audio
kernel modules and configure the ports as MI2S ports.

Link: https://android.googlesource.com/kernel/msm-extra/+/530cffa4cc977a348753831b163eb9d3302b954a/asoc/msm-dai-q6-v2.c#4597
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.h                  |   2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 200 +++++++++++++++++++++++
 2 files changed, 201 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ee6662885593..be693b53a4fa 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -7,7 +7,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
-#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
+#define LPASS_MAX_PORT			(INT6_MI2S_TX + 1)
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index e5cd82f77b55..7006071f45a0 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -668,6 +668,205 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	Q6AFE_CDC_DMA_TX_DAI(TX_CODEC_DMA_TX_5),
 	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_6),
 	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_7),
+	{
+		.playback = {
+			.stream_name = "INT0 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
+				 SNDRV_PCM_RATE_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = INT0_MI2S_RX,
+		.name = "INT0_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT0 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT0_MI2S_TX,
+		.name = "INT0_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT1 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT1_MI2S_RX,
+		.name = "INT1_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT1 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT1_MI2S_TX,
+		.name = "INT1_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT2 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT2_MI2S_RX,
+		.name = "INT2_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT2 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT2_MI2S_TX,
+		.name = "INT2_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT3 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT3_MI2S_RX,
+		.name = "INT3_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT3 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT3_MI2S_TX,
+		.name = "INT3_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT4 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
+				 SNDRV_PCM_RATE_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = INT4_MI2S_RX,
+		.name = "INT4_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT4 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT4_MI2S_TX,
+		.name = "INT4_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT5 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT5_MI2S_RX,
+		.name = "INT5_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT5 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT5_MI2S_TX,
+		.name = "INT5_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT6 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT6_MI2S_RX,
+		.name = "INT6_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT6 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT6_MI2S_TX,
+		.name = "INT6_MI2S_TX",
+	},
 };
 
 int q6dsp_audio_ports_of_xlate_dai_name(struct snd_soc_component *component,
@@ -712,6 +911,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+		case INT0_MI2S_RX ... INT6_MI2S_TX:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
 			break;
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
-- 
2.54.0

