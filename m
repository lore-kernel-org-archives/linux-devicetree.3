Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B59A3CFF71
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649547; cv=none; b=AUVFqzRHgcL4LH4kkRSpfI1sGonPOYE+9frQyi/w2+QISitZUvaxP4yoPq8eMeknaug9sikWLHfHVPOVok2liPanvMbil/xeUPoLUymdHqZF9Dl88MwxaxLazCr21FDTp5Jb74de3T5Zd4joGZvqLUZkT0cEV23jICeItjdjNxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649547; c=relaxed/simple;
	bh=WkQUxS/816U5853s3MLnvYSUgDbpQorPDyga4dqZbF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzCE5krGTLG2I1RUvwYi5LaFW+yFMJnhV/d5IYIfNIx4OS8C5AEn0l6PMGNUQ8g4+KOb7UBldgozFAApuOeRxbkbRuQO0nInOWub9xQoPcZN/qwaoh+sYMvoFa8KbRKjwwKpSP35Cc4wkvD7+4MJ9KBC54kQAcZQB5DFRMUzXVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dG/8zoHT; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dG/8zoHT"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8aca4e14411so21215926d6.3
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649545; x=1778254345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8JJrRMxYy4HOqBZzGEAGcIIyvVzUrj6XAtjrL3wzn4=;
        b=dG/8zoHTjG7GwlEoUscDOij+2eVVCWjM4TTI+fjb3IRVxkLGWAFikaJ7MWt6lPJ6R+
         QbQ9ywnfU69+01gZQDpPqasFx5mxN0zWQNrtgdqFNhcJEtgfUg3YaOxs6JxV6X4w7uOo
         ASCUl5/LfGbtP2W4ytbIuR0LP2dxoN3cHCCGfc/UERuVKK1Z11i1vODqS/thOTlG+FMt
         VUmo5TMihaEW3DMw1TYo16x/sBXSXRWjlSISmQNOGEdBH9TG5axvjHCQHajupToICy6W
         ldWIwJOcASqKA/VtS4lr1eMOhAbW/0TZY7jzH/25Pr6J/aNau4m0aUAS/CZ/Y2nNbWIz
         WICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649545; x=1778254345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y8JJrRMxYy4HOqBZzGEAGcIIyvVzUrj6XAtjrL3wzn4=;
        b=hlh1RqWw+lt2P+RnSFwL3HO8XfsvgLGK9cyr+yvQD4I7SHdpHy92vPHaPG2/gQLq9e
         96smncppmyg4ACfrMtwik5RVw/lL2el96g3zPmdbs0sXu2OBAIgw4CSCsT0AnUgUHnsT
         wcemYOZXB9j2nrxWE7Yl9vOKhP8u3xrg68GNzPD1Lz85ke1AvCi+w7tmJh//nboySLys
         aLWkqDofD2SGoKpEgzgXCbOeH0UGO9V/0YP4Kj/ojLc4VQewa7ZErkaLalXQiKTtBXxd
         Byrx30khhh/mYtOhuyJaLDeVyRAUqJG2yQLot+62VQAdXR6csxMZh4dJqi8pB1qAp/9H
         mCwQ==
X-Forwarded-Encrypted: i=1; AFNElJ93gpDOB2nQIP9jdH89nwE+UnuCqht6c/F9QulGU45TAyp54I/0Ws7okEyEfKoGux55/Gve02rRv/Ev@vger.kernel.org
X-Gm-Message-State: AOJu0YwZP+IAuaV2Bw20jnqH8Uzz1KY9WOqEaaCPfsXJDvwMM+BwFZJb
	B7G2hTPnWy6D+DU+/6HVmWfPI8sj/8Fopqbe4clbychymIVxY0xvVBzu
X-Gm-Gg: AeBDiesoqEE5HbgxAVOi0COZsB4TmtHQG4bDoxT5DZy3dJe2YD0hS9XPPbUBltHsosP
	wnwUFM5kowyhEF+tkpy+XVe4xqt/XgzoX1FtzIKRu5wYyWg4lJDamkKVTSSQfAd+P/xkKmkJyxJ
	TlFqnw+YgG0k2CgihUNuOxY548cThoenfmoCNGMjEq+vDzIpX5TDwh6obf5GjIh8E1zTgsVUsRY
	zuJB6mDgOV6zt5aRh6zdzs/jW2VTBgQ2KrUNGeaWFfU8T1J4c4NguUI/QsQP/mhWD/RBXHmHirN
	BbuP/LbPIRDmOe5Fdp7YqE6GQANczamR4Vre31K6VqBGosHiF1w6ZzCYORL+b4SHsS29L0w1ypr
	mma+vp0xrsaMErnwr7V+Cr/U/TKa06nORDoxKfcTHi6ZJqlCsv8NbJLxKOAsuw8bk9JegiuA1+F
	yoA9nv7VXrvpD1waUUxwR9Yp/i+USIvi4po+ZBW+3PzWWDlID9O7/aI0pRMJcIEy/8rmbm1pfZl
	mNdshO83CXI6BfX2BlnThbqCA==
X-Received: by 2002:ad4:5aeb:0:b0:8ac:a154:e156 with SMTP id 6a1803df08f44-8b3fe7e7316mr114395476d6.29.1777649545206;
        Fri, 01 May 2026 08:32:25 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dc606sm26653506d6.31.2026.05.01.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:24 -0700 (PDT)
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
Subject: [PATCH v4 10/15] ASoC: qdsp6: common: support headphone jacks connected to internal mi2s
Date: Fri,  1 May 2026 11:31:23 -0400
Message-ID: <20260501153128.8152-11-mailingradian@gmail.com>
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
2.54.0

