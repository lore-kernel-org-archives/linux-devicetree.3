Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4863E009B
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022196; cv=none; b=Ni9mU9+M/edwat0LHucaTXWdbR6d8C979DY4nZkgUyv6T1Kx7d0IDgvBq3sEOwmtwKgmMXt1hZDmpExQXe0IghVOHQMDVdi6uS/fSTghQdfwjZAH6tk7yAAhKWu+M4ilYGbppqAuB9aTWteP/p+aZPOTDC3BcyIDGIXOeN9nT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022196; c=relaxed/simple;
	bh=F3/Q/P8gGDDcuSGCNzRM4Jb/sel/WSnd3g4fJslYVg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zd8oTTB+FfIa1Nz4uHes9Zgl1S6UYrboprAiwrmtdQIcS065AApKMpxP8HYwdU4HCB25uRx/YsFRBv/ESZUajKOYfYjTCitrn+lViqLQc4NM0MMkABo0LH1D4Qi8h3Jshu1QA8XPYwWBm+TSz215sqEK7UOqHXNwr3bfO6L+jL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExwWrScB; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExwWrScB"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-91578122305so924118785a.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022194; x=1781626994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9po3bV9rnmIHm+a4pHCaXjx/Bof8CvBzTp64aammzQ=;
        b=ExwWrScB12UJPgUOulJhOD3WF6GW3a8iqU66RzS1Bpp7Ix+ftz0vKtD5ZlwD9RJOAV
         zCtTn8HxwtMuidzXvs7ExwnR8fS781bprWVZ5txvJAsXie2YIl0aW5fxH1RbKS//llhE
         SEJyT7kdAdvhxAmjyXU2Yf+XxFRB0Enar1/c6eeIhYklCBiKU1B5ZyPd0cb249FTPiN8
         I5H8wKWsFCHUJPouu3A4BzG15BiXjxJc44XFUUIZu47ilpMg6LJBNA4aO7GuUEs+5+o6
         m2WS23fm2KDyc+/x0jGxYlphFfCYm0KZzMbcpTJHJf7MLmK5o4fzJObl9c6fb+X8iCvy
         f7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022194; x=1781626994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9po3bV9rnmIHm+a4pHCaXjx/Bof8CvBzTp64aammzQ=;
        b=DRXI8EneeGb8GqdOT/SJPjSjkNffi74RLfsGF53nGDgCaMPIjyIlARBlA/HZMhzDze
         p4OKLHISy5SWJC/Wyh7uogdUcwh8+kEf0wYVrC5vnQtboPaRpmsJ2K7xex8QhM8aSlEI
         2+ObPeYdizM++NaYr+gyWBGz7DmDfJIrr/BPObSLYjmqBF1nuRllIcFBTxnbx+6hOyx/
         H2GkiVpecPxFcWptfSatgmq9vJGVKmfwFvRFOe+EsaI6k5VHL26cpdB6A85k77oY/N1s
         J6EhZ3adiMsvhq0Dy7pwu8clU9eL71CRDaStjQaNCSMiri2ESz8tKZzYtQ4hhEa/NxNM
         sSWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QfgQLFkjdWKgpfL+kqSlmx1KHq0R8yuEhxC08nyfeA+uom7ib06xVLQbJEF8ZaiWR9EJWtA50ysHv@vger.kernel.org
X-Gm-Message-State: AOJu0YzsJxp9N/JafudZ+Eqi7of82HqqZ2MpsHoS2SrX6LaEu7t6Fjr+
	5w14zcoAbFZaBm/obspUGLvbWY7KkrPgzIzcR95F7J2mmZfv38LWE7Ea
X-Gm-Gg: Acq92OHBRYMWKKLkJHmjxj7Hg2r/XkT5nYOLLeKVehQmqN+RHPSqtsiYL876Wty2USL
	Lu464ecf1aW3mqxa/9c+l2SPknKVpuWOgDqhkKMBaS9lLPLBBiHTwjT1Ga+rlJJjKO2O+dPVsrz
	SADNKcni7eAJCe/kalmqxY+kB8HCsR+qdJXgCvx5jowQCzpkP/lXAK/iGQw97HEWDD+ap6gHE8u
	zTNO4qpptiqVl++v7uX56b0c24tnNa0IjGB/UBHcL50DetHoAfdoXtoUapO3Ie5ogk8iiH50Zz/
	vo9h5+SzMLqt8y020S2Za2I/N2fGYM55TdX6BY9euLt76/PbRiMHaayy61bfWK7NaxjhMIJQiVn
	ctRSxcafmrkO6/Z3QnwzbCv/Eps50q54EDK8cQBQAwUQlms424ZVxBMJJWfGS/53GCSHc/Wpc8v
	VMu8OZfyEF85lFAerR5CplwiITxapD+PzGodCFBg==
X-Received: by 2002:a05:620a:6847:b0:915:bac0:fc2d with SMTP id af79cd13be357-915bac10351mr2274439585a.7.1781022193940;
        Tue, 09 Jun 2026 09:23:13 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d2384sm2158510185a.39.2026.06.09.09.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:13 -0700 (PDT)
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
Subject: [PATCH v5 10/15] ASoC: qdsp6: common: support headphone jacks connected to lpi mi2s
Date: Tue,  9 Jun 2026 12:22:50 -0400
Message-ID: <20260609162255.31074-11-mailingradian@gmail.com>
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

On SDM660, LPI MI2S ports can be connected to a WCD codec which may
support headphones. Register the headphone jack on codecs connected to
the playback port, LPI_MI2S_RX_0.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767cee..9070db005e21 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -232,6 +232,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case LPI_MI2S_RX_0:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.54.0

