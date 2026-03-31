Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1C73A75A8
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985980; cv=none; b=tYZIDvCFjAKrD85/r/qnJISTvLRplLxo6lRNKmBmadQu6m7VosYbw+bYD0WBVk3KJOsnYdaT/xC8dBBzC8g6fD8qUGR1RHv7ScHLY/VdWnTGHUuSGULbI1dTm+/J5h2jY42D2//8P0IfAIhRYqPGLBspZCVvsdoB7JyJzSNZTac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985980; c=relaxed/simple;
	bh=BXCnnROK5Jr7XSfuacF1JCL6R1HVhObmmDQUVuRBs40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdOHA9dSrc9mrYH3BJGwiXaXhr/Y++7LYuEAr8uGZBTIpOoEbUXHcMVcTBqRBDkhk+CTgdQdgvYjYxLdtoDKqCd+xLqC+ZSmCmRpMWGX4IEgi/VYnDkuv0f2HzRLF8G3GmrcoN8QQ9dK7omyl0tpp0Zy2Ke7SFv8w4cyQYrGfeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLlZmuDm; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLlZmuDm"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cfbfdabf3fso607332785a.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985978; x=1775590778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsXOvrBEVeyjNtjVFKrqAY0t05Kf7cmvMHwIAAt+bJU=;
        b=iLlZmuDmZuYHLup5n1GYlUrLgsG30yGWK1dmRvP9LHymIEkH5TrKxqjw0MMaaF+bSt
         KvzmyNyiCX3ezrH0WDV0IcffG1JMIXli3QGZ9jes3jQ5QqxWa0UzsqxyT14iZ8pNRtic
         Y/OnmJ6wrKdaovJ9sC4e0itZfHR1JioQsclm473l4nyEPN1d4O7EMBI704pOVhXNC1Hi
         YLWThWz+rPeG3Csvv0b+3T3Ay5Oyq631dgOjuuHOhXtzzD/WaersolRfQSWpC5xVyvHd
         ByiKOmkEskOJ4+g5aUjQd4N5LprhKptx2MgwExqMkob/dGTQcA1yXPfAj5f9v9xhknQe
         b5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985978; x=1775590778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NsXOvrBEVeyjNtjVFKrqAY0t05Kf7cmvMHwIAAt+bJU=;
        b=KrzLq3nHSMSf+J2rzUMBekrjJZYfYQXwuzAKPe25u+JeMGT28rUbPivwKP7R2p1tj9
         wZTXXIUcxKDaGF05xPbNSE1gEn43LijGAem34jgMyaO/1sVxvyPi1pl5IvxBvSmxMqLY
         giQmCEJA9VNm1X1Tj0priOrM6qT/e6iU4wEUakGLmPEQh5w5GJ+SM9hYVsxo010bX2qz
         209+yrNFP/kEwULa8UcR4FS1CMeOfEfb3Rmyz9v4Qqq84OB383nDNIMkRE1FRWYu17RF
         sowg5Eu2tYhaKkDHZiBG+7iaFaaO5UcobDHAraED6V9SgwXvO1cjBZc/Emme0yia9ycE
         iBcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNJl4czE1d2MDf6pylV5qRzhvF1fbGxhnAU2DjPRCa5g2Kvf7td7FRc9u91V0VXM4kAarNwkC/4Oyz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Z0Ca+F6ck4lEZ8Tsmt34Ib9NM9xjIANDmOLMWANYg8WnZTxN
	Jphhzsyszyd892WJ/64GQ7FmWvJyaplaM22XOeVNTXQnUh6AeTc/v++L
X-Gm-Gg: ATEYQzwpCj2A6xTHrqliJX6UfshorJFMrvbiFgvyYzklZUs4wrO3tfohcxJrg7Sypwo
	bXde+v8sMpoRoO4uErBZ/FDLEC05wld92Jg1e3RpkWOtqJMAASw0+seieD6hR7Xgc3jp2SG/jBO
	QtlfmsYKplLU3TwBiLlMgC+DcNZWA5Gu5Ya4bfB9P1lrq/oypmCKrAt0ERz48YXWYBw4GkfFk65
	PeLT7vYBK1fSKEg5/kr4PF+UcYEg7ML/hbJtYCLzdzC8rRrSpL1p7IrW8eIx7rN9r4dWwczmaRA
	/HtNXRqpIAtIAHX7nzBOhkaO0EPl/eoJu6Zqm0uGDzCB2aVVyzwZwMziF5fgTAO7vObcLZS68JP
	DpbBh2eic1E5M45NY33yKtbCAnsPyOq35kJGnIMwAwzRJKJH72zwEgA8Ne+1nNxa9axUrMh3Ksy
	rL6o7bjwJvagRMmBsKclPtPHOU
X-Received: by 2002:a05:620a:4503:b0:8cf:c75d:2a0b with SMTP id af79cd13be357-8d1b5ab70cemr159538285a.6.1774985978137;
        Tue, 31 Mar 2026 12:39:38 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d02806d7e5sm1155303985a.36.2026.03.31.12.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:37 -0700 (PDT)
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
Subject: [PATCH v3 10/15] ASoC: qdsp6: common: support headphone jacks connected to internal mi2s
Date: Tue, 31 Mar 2026 15:39:34 -0400
Message-ID: <20260331193939.40636-11-mailingradian@gmail.com>
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

Internal MI2S ports are connected to a WCD codec which may support
headphones. Register the headphone jack on codecs connected to the
playback port, INT_MI2S_RX.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767cee..7e2a8745594d 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -232,6 +232,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case INT0_MI2S_RX:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.53.0

