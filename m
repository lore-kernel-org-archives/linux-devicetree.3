Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A824D40683E
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022197; cv=none; b=kf617ghdSd7wjvQaRQUVwvsGHA9lRJfCnjrwrQtcUlDlEa5zq7ZKLnhVHXFprAZWiFwMUzTdq9+tpMlmA8LEqb/CjmiXrexSKvVZBWyw9foqwb03edCeVA8b/EMnzOY/1JdMNLyjQSZInbQ3Hd0iBTdxdHKKhSUOdri4CCqObMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022197; c=relaxed/simple;
	bh=5RJmdsszUwLf4aDp9kqAY1nEgmpwmhr4v8CwdairNGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCB1JhKsuKgBxj5/4Yg8c7lXTjl5dOHr52rWHdcshcCYBV0aCpChV48OtxpnhQG9aMsQ8hMso7TfzB+H4uSRug+rshklZr0S2vvNYYYY0jsqhnRho/n0Lr9m4NQufnbRiW+76gEox5mELJqoWXPmQbThrf68smLJjtHtfa1kO2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ara+ebIc; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ara+ebIc"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9156ceb55ffso495488885a.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022196; x=1781626996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbMh7js/t00A2OiKknYuR6CQAso5EMSHmQD8+7uhBQM=;
        b=ara+ebIchabtqoFhkWbIlvVBzv0Qq235kwuKx1CET1E7u7LPdoC7RTFJb8BZqBlih9
         l5ZW9bmd5UPrGpaWOH9olPsUhTW27m5CQhBEigDEowjpfVHNzKAeYo6x1UXPtmfXXShH
         +KMjexyks9k6fCQHdud4uL33Q3Hm5QHS8RoSmmODQCOCQ2oCMBbW3r504AEsQM/qE2k2
         gpyrZIX9H7yXdOH0q0KrafeLSHgJ87Fy0BZnvVSwnjpER7Ea4rpVAc7MBw5Biepgi8Sr
         EKRMZWqP+P12k6VAMp8B9v46J3Ol5A0LvI8tyKQqyHh2pdqM7062xhbI61QpCfLvpH0J
         yprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022196; x=1781626996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gbMh7js/t00A2OiKknYuR6CQAso5EMSHmQD8+7uhBQM=;
        b=H3Hk7G6ga2VG3Euww7BDaG2iiH9Z6yCEI4hx99297P80IppFYMct9Tfjq26xRJvu06
         IJkaLXUcEW02hZrqt467Rc9uTGA55u/bHt+Vdq27EIrvCKJ6Pn12BTUKMRRt5QXZcxQ4
         30q4JIGUd0GylOXsvT3HqjgJN/AQA1pV3uYp2w/LQDc58bAz2i7cWkp7rUYB1fZvm6nY
         9S2ZxMq/wgWZSlnxnhsGcbKuu4BDtuApOfg0PuHd151QzkWtHTQbiOF7DETsKzYcJY75
         hpF/ZF5+CT7TU6b+jMPH0JMXS3bymMMamoCxa3Wa0mCPWCs8NK43BkXgugSIq3XiESwZ
         BzYA==
X-Forwarded-Encrypted: i=1; AFNElJ+xtD+Xdqjrcyn/B812uI3uYy44AKXW0PYBnUcf9QmvBU4jmnj478qf74mqGc/Pi/VW0bjnrdjSp4x7@vger.kernel.org
X-Gm-Message-State: AOJu0YwqohmFkcpc2qycXXzf9u4dZuLYtc13HBTa26eyDN/zJDoQeMSi
	elyIdoa9651DdYkqBqm12eg1S4WYApQB7TyZX8Xq6+oESIgVN7tLcttE
X-Gm-Gg: Acq92OGz0Z1J5rWpG1VYb5F1fPM0DQZ7L6LQp1GD5WAkDx7HGjAEEUVuNwiTVoeSFFO
	+hgzEm9W7+X/4a0O8i6WuEteBWgcVIJDXPfE+vFCo3updb1KuiYTJh7VbYzsc22rB3JMQtu3WKe
	zkbAaXbL+hLlIsdXqJRQeXXi85qu+5i2JyqETwvQ38bmwYHDPF6UKfXf8pbJvR2/wvQmPrVZ0Ro
	NZ5DLt6IExhux9w9oBqNe+PtA/y39NsnW/UX9Mx6qOlda1BVGljg7GbuAlxoj0rDJgZ6j6XkUna
	wp9pNlvRWXPagr9hvrgmaw6FKbFSdyCRIFiVaK5+6pcIn7XNcxKeTpaKFolJq5jUA7XCIyUWL6b
	PTr/wEwOe80sbl+hz9PtNj359vWfAXbCuig5hLNPad2n2OjDWI+cXgjn12aDX0Cg0YlUeKKouaB
	8WmmtYgLAkJr2U5whKpWSG4oozw53ac34UYBWsukUwnoFLshTm
X-Received: by 2002:a05:620a:468f:b0:915:9fba:8794 with SMTP id af79cd13be357-915e822bc64mr519249685a.6.1781022195649;
        Tue, 09 Jun 2026 09:23:15 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00840dsm2345045185a.1.2026.06.09.09.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:15 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 11/15] ASoC: qcom: sm8250: add support for LPI_MI2S_RX_0 and LPI_MI2S_TX_3
Date: Tue,  9 Jun 2026 12:22:51 -0400
Message-ID: <20260609162255.31074-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LPI_MI2S_RX_0 and LPI_MI2S_TX_3 ports on SDM660 can be connected to
the digital and analog WCD codecs. They can be supported with the same
logic for other ports, but just need to be explicitly stated. Add
support for these ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f193d0ba63d0..1952c599e004 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -112,6 +112,22 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case LPI_MI2S_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case LPI_MI2S_TX_3:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_CAPTURE);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
-- 
2.54.0

