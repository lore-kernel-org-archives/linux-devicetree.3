Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9171F3BD22C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022189; cv=none; b=YgWYixG9/H7BfStdnmWeb2W6PSIcOCvxZdqdcHxzhNf3fVQ6dutefSco+NLkgxCNW9f2CMGTUUOFgeyIuqcdUkmFD0D+Me1NSFVjMA3pXWMMtGehJI3U1fv5sHDg+kWHUgOSrOoqoMSQq/n0LhPPVuV4XFgJfXiBs37iW7EBTDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022189; c=relaxed/simple;
	bh=X1blx1IfE/S2XwILbwkaFERfov8+N6iDeA0KBsBTu58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0S0EK08hfT+7lcTWnG24g3aAMNTU8HI1NZyzBda0/DHMJc1xmQTKrVdWcMeZa9cggZhgMWH73Fj0va1GkJATlbpbnKCrde8gfaQVmtb79WUYkg0uaqdyTHgMznlRlHDEj0KbVE46D8sfiSI6yFt4xvjdeJdXovse3HZLTgH5Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfGDmFNQ; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfGDmFNQ"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5176b9c476aso43308781cf.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022187; x=1781626987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeJyh4JLdoSrIjHhlptP34QNHBNQ4psdrJrN26Yex0k=;
        b=ZfGDmFNQTlPMuQFOxLrT9CSXFf10VS74NMxZHwbTU6KIcL8NrS/Tsim4TEFa+CGmrA
         hEYCTiZPprtTR6mCqZVRgu7RIhLjeU7HAEmD0uW4Kc7uRceyWR6eUC+ienZUiX4ggYj/
         3Ba5C27Cig4WRqq1O7pBqldnKor4zveh4KHrDdvjc740s4foVOiKg3ffsnfazoqnvfKo
         c0Kc/AzZK+2A/x7rHyIwaVWZDyG1iC+qNndog3y/VHmJC66DE5h8QjNnhC3YeHm2jbbP
         VDkMORQ3zIs4VA6fpKqSnDssjP/MMbqVGN0P6jT9P/oWkR0efL2XjYqeq1tuQKxrZnuo
         u91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022187; x=1781626987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zeJyh4JLdoSrIjHhlptP34QNHBNQ4psdrJrN26Yex0k=;
        b=RU+adTS7jgNCY5Yhr3btteQOlsN3I4RiGu52DR47VVAaxYav10fMQb0FKEvL0wuxZc
         l2jsqKijiy3FwCoxfHYQ2y6l/2PoyU3S4OxRfxe7HxqgWpDPijvLvIDgIWPVZOEC7ArD
         vFg88JfTtNTQhOtyVXg1WlCwI6AFi+TlEQziAqNHZ3qJj4nhVUdg14LGWxr8EVMvmUYH
         pQ/C/+NA4jNbHTSxwwY8iJLxEyjUvE2iqdngb+Q/TdwS4jXnLvvImGqmElITGvhfWuqu
         nE6GTYOXr839DZlMAyNWINw/sGbEUMwsYA+FvoeudJX037kICtGDcyb48vLA4Uz5urVa
         48hw==
X-Forwarded-Encrypted: i=1; AFNElJ//BwGf6Y0icQ5T2IQ5EYfwV3ksIHeClH3HMvO5rA9MN8+x3WhjRhPb27vZ4IN4hd8vYiXwxXye+GB6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj8XIv2xlDHDtSmrkEoOrpWFD7xugIdLFLZ6w/AN5zLFkvB8Sw
	lGgKt5AsK6a+j2M7zkhfE3Pj2mxZmGGAgqYlEKR8P3jz19WxbFWlLEOI
X-Gm-Gg: Acq92OH2ZOx0Gzd7cGH9eDG35uMpvWYLr3Td14Q8hs09eMEz149or0YrPIbCKeXMdgr
	h1tEIc1wNRwufYGXytEfHz+CzBtiWuf6GW6iAVEo6BuEw/LiDhnbrQ4Etj2FxmH/9FhzaMHCnFC
	4kdmme7zGxJ2NTDPbVdBmwdyA7OQq7r3/MBK6hH/xwgl7gP8Il6Qn9MKYA20NNwPtTU2Q7HGLe6
	ncZIBYi0HnUP0ZIpv0lAK7uqjNbLPUbHppsaETtgLeHHCeUNgb6YddI9dcuv/tuPyHayGlv6x9z
	Soh2hcyfo+Kfn2BMm7FDr2aHxsSnQL2Dtg0aSlabsWLjxoYWX7qWCDuNMZ8+F61cx2fBQms/MZz
	zOL5akEyTsVU6qb1BLtVKlUIojZIqFlDm1ItdYEKwMixX+sEI/wIxlONqmplBoO7YDzADkShETq
	sbtAO9CgTussQSur6wQeGAn5sPjs7pzfhY9GlYkg==
X-Received: by 2002:a05:622a:98e:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-51795a090a8mr287909751cf.5.1781022187522;
        Tue, 09 Jun 2026 09:23:07 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c54177sm209351671cf.12.2026.06.09.09.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:07 -0700 (PDT)
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
Subject: [PATCH v5 06/15] ASoC: qdsp6: q6dsp-lpass-ports: add support for lpi mi2s ports 5-6
Date: Tue,  9 Jun 2026 12:22:46 -0400
Message-ID: <20260609162255.31074-7-mailingradian@gmail.com>
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

Add the extra LPI MI2S ports used for internal MI2S on SDM660.

Link: https://android.googlesource.com/kernel/msm-extra/+/530cffa4cc977a348753831b163eb9d3302b954a/asoc/msm-dai-q6-v2.c#4597
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.h                  | 2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ee6662885593..48b114eb46a5 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -7,7 +7,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
-#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
+#define LPASS_MAX_PORT			(LPI_MI2S_TX_6 + 1)
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index e5cd82f77b55..c3d8116ad503 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -553,11 +553,15 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
 	Q6AFE_MI2S_RX_DAI("LPI RX3", LPI_MI2S_RX_3),
 	Q6AFE_MI2S_RX_DAI("LPI RX4", LPI_MI2S_RX_4),
+	Q6AFE_MI2S_RX_DAI("LPI RX5", LPI_MI2S_RX_5),
+	Q6AFE_MI2S_RX_DAI("LPI RX6", LPI_MI2S_RX_6),
 	Q6AFE_MI2S_TX_DAI("LPI TX0", LPI_MI2S_TX_0),
 	Q6AFE_MI2S_TX_DAI("LPI TX1", LPI_MI2S_TX_1),
 	Q6AFE_MI2S_TX_DAI("LPI TX2", LPI_MI2S_TX_2),
 	Q6AFE_MI2S_TX_DAI("LPI TX3", LPI_MI2S_TX_3),
 	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
+	Q6AFE_MI2S_TX_DAI("LPI TX5", LPI_MI2S_TX_5),
+	Q6AFE_MI2S_TX_DAI("LPI TX6", LPI_MI2S_TX_6),
 	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
 	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
 	Q6AFE_TDM_PB_DAI("Primary", 2, PRIMARY_TDM_RX_2),
@@ -712,6 +716,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
 			break;
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
-- 
2.54.0

