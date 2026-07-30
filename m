Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8BD410D13
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433479; cv=none; b=VKSrufoExLZogaouatLnEw8XVxyFXcH/oVrN6I+A1RZG/GlL/8/DIwxqZSt0KJkziU6enMWv9ZN297+yEC8dbPRif3EXEF6D4SNJHdrpqjyaB0ZgI8eAgUbqAbMHtO7XAcXlGX/7EDfM4mUUY8O9aCFFzVXoGSc/W1v+cOTFGys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433479; c=relaxed/simple;
	bh=1rz4d6kUCvtk3X3Q7TzG/qxAmeJkZ7rfw4FiS6yy2dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZI/NwAVb7g2x3VZw7urLZjR3ilnzAT5LHpPyLpuGWN5CD77ThPBffEkkEViIFb1Vk+2q73fCmoGp4RYyIjTWfhFyAS/9i/7SKkx6Jr8L5yJ+W8AbowIAjX75UAhPnBg7f+XCXnRWvUS1hHXY1sJpBpKMSHjGKfhqLtLu2IwoSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbU+VxL6; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbU+VxL6"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c2a818fc4so243921cf.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433477; x=1786038277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAaiYldDXpLVNz+o2OLMOmDKxzhY6CTVCWlAjTcIi9M=;
        b=BbU+VxL6jA5OeTPnyzM0kEzkyHpncFVjjHB/xGWgST6r2idSqwWZXa+XiYJoeFj3Yo
         fbWE0fOZY6U1F90oNhr2XQjloJGu4lvqs3HqWn6hE5wUj6uZXH5DwRbHS2edPqsd2Rnv
         vwMIN1wduSwWC29j0GU+TWsL1TBIUtenDSNE5lpIBEbC1ABmLiNLOcOAhZeTSyrxrquM
         V2h8CRWI/fq2i+AEb1PDQO14MHT7/h6JxtH/4v/5X6jUcCCNvgjOIz2Xm5FXTwsTex6W
         UysFIANXLXe1PySJHNoKgI0Fc8LtFryJ01qkKbZBMu7WjTitlZwTFf1954Qj/wtryir2
         mYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433477; x=1786038277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAaiYldDXpLVNz+o2OLMOmDKxzhY6CTVCWlAjTcIi9M=;
        b=d9fIdEnve9c+ZrtqjnrCUJBvhz39rfoNcOoHk+U20qwmXXkeL+wItPO1A95b1uwP7N
         mh6pFTWuG3nEsOe1PIjKRf1knDJBZO0HsyJ3Yj/4UaGkyU/e0OW8t/phjua9MyJDOcra
         O4V8U7Axvdc8aR8oenbhF5yIYoGWlhvnVevIOdOEP6X0t3goLLmMhL1m8sKdq9FC797Z
         y8GKovsumMnNKeXhp1dZEIkMurAGtjThsBUfD/YEKiIHzsah5kuKkNLwK3Ei71Kvu9Mw
         5nDO2pmb9efB7t0cLIvqRo2OCmf4vWxYRBw9ftmDkmvZcJGf8ho3k8BWdJW/A8prjcFX
         NCEA==
X-Forwarded-Encrypted: i=1; AHgh+RqhFFWMJLJYxVdx5jzI3ZT6ZxT3PsHb8hD6srGdY+184rxkbUlAtCJuaEjxlZDSMYyEMzYvf8xEgPCY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy56Erv1lTT6Q6LEGxplhUKvjZBqZG4S0qktdvSND2+UbGZUEda
	+DzFbFQ3JvHTHZf3NG1VcGtlp47e69+OD96f56PUCvt/MPcFReLj4TT9
X-Gm-Gg: AR+sD10i4pkyndYtV3HfHCgvAgUoPmEhzTyuGefq8Rm4Ulot2bl8AUk8jICNEHzXyoD
	YJsZoukN/CdscXMpe0+jG4iIxYpL+aZMMSO1rInE5zCt6VDGWYyN2MTmbGaC7gfaWebzu/Uqgk6
	pB6CBp68fhidx+lwoOc4Jju3NqCHXJQYZSTcmwtO6Tzhay1jb1eaEgpSo/ZsBfEmMi7qhSxCbcJ
	4x31HjQdmijIKJwUT+SBhNP9zLFCZ7kaTDsd7ilmhSCeyR5Wv+b9Jiv+nZ6fn4DHwqh++rNhKyR
	ykW2G86BrJnEd3oGBIuFP6ycF+v5UAeYl/Iu7I3LBbn4F5eh4S3xRME6Eou7p3/n3NHKwLhaemp
	kWc/iAmk2fGIqGXE0xkgAhtfTlVdVkE3dvGbCchbn3pPxq7GZulQXYJcd0mr0QJxMajlVxD1EQ7
	MWo090fEbi5eaL5TvRI6gz1fzUKt9mJMWVIIxaTMquEdE97TNdGAHXT3SurPY=
X-Received: by 2002:a05:622a:411a:b0:527:69dd:5413 with SMTP id d75a77b69052e-52b38373e09mr38385611cf.5.1785433476915;
        Thu, 30 Jul 2026 10:44:36 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908325186b7sm22472296d6.43.2026.07.30.10.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:36 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v6 10/15] ASoC: qdsp6: common: support headphone jacks connected to lpi mi2s
Date: Thu, 30 Jul 2026 13:43:48 -0400
Message-ID: <20260730174353.108023-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On SDM660, LPI MI2S ports can be connected to a WCD codec which may
support headphones. Register the headphone jack on codecs connected to
the playback port, LPI_MI2S_RX_0.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index edc4611691f7..b570d81583f2 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -215,6 +215,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case LPI_MI2S_RX_0:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.55.0

