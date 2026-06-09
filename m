Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE113E009B
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022194; cv=none; b=Oe7D1tJXrimet3JmPmHf5Tv8JNE1QBALirg+SweKS7Y3Vtq4RFhqnaciywtDCd2vDEXIHcMVfLd0zwPaLZ0SyBEPMFcq4z4wR2CCzN49DOBFpASdXWhlq++8PK1c6CIHb3vfLWDDA7t/I2CtpZy8d4WsC3QVShslY3cCZHuwMAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022194; c=relaxed/simple;
	bh=tZzl0LSt5hWKjHWY0hRyxQWh/N8wup3F94zum0CMnlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0aBjdCYkzC8165G9a2gHEaP4z+m2NFpXJjsTNjYO46pZA8lS9IuIrg2rarD3Rbk41dyO9izl6SBhUz+CvySL4uymqEStEcUMQubeo7a2MmKksoIRWyCbHE4wABOg2H2oKlYbSEL6NXEBVMff5J81AZG+Bu441KdgLOkkmU+D+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3+ekqDd; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3+ekqDd"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6cfd2b2e7b1so2008452137.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022192; x=1781626992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/RwMIwkE5nM8F7dAjhZHrdIn89L9B+B3Bhy6t+lh+c=;
        b=Y3+ekqDdMRcrxLbSPuwdnZZ7YZ7Eu+NbTN8pJylhJ6kMG+02wHyLppQqY66sXuyYeM
         GL3kog9QfzU8RBJ65pbKNlO4CZ7i5ZkVfsYNX37ULh9h1CmhZxs5FBGa4OfucHwFp8PF
         xj27giFzPUyS5CpHDhNj1CDg98UNXHOV9GG7KQAkfJ5571N6lNHKDoNYrcACuOyiixB3
         U/neTVVNoJ6rf0xn8cH/BiBNkhuVMQrNXQtYOqjbWJuuXyri4+e9zS6rv7ZMofX3QY/6
         /Ghb/68Ul1oRmR1Grwi9L/5N7Dnko50zQpSI/6JWj3Fea7/CaWvxjOd2s8u0bGrFQ4Al
         BpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022192; x=1781626992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x/RwMIwkE5nM8F7dAjhZHrdIn89L9B+B3Bhy6t+lh+c=;
        b=gGj+srYC1iVtFpMM4YnUGq0Lm2zmoa46RHj4il6aYIMxwMgwnFbYPk/L8Ba2e8eKE7
         YkKuirmLWbjFijD6JHDwTnolwSFy4ON0ICB+gGFQqRF6fFC3S3EyudBqK4lIUXE4lqEN
         CPSqqVGUN8JeIP1vbeKyEBLEGKoAJb05to3X253ekIkS8+DJW6s1qG8IaFupmdId8tiR
         CRBu2zLZDTbMOebJJ8vTEod+4UxGOA/9nl7tVJ5PNl6I5E+PqsKH/pMVMKJ3h9iHPyA+
         HbO7yCRqqOKmIaTB66AvNWpUxzmmR7A+IsRdL4OMghnH2d8WC/pDMWER4cmCgj9EZrL1
         hbaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+j+x6mg5EX7uMP/F/l0wab92UXKOsCP23V54JRcNfIWHE5U1FTtbfB8L6QBiYy3z2LSnF467YjRSaI@vger.kernel.org
X-Gm-Message-State: AOJu0YyE2+8mc9e6pB8q2hCTnjA2RIuTYE3oTlF5ojoMGggHSlqtm1r/
	A3k9mIYKCnIn17WCnEr95HScRNfS/9kMbYhBV7KLw4t9vizK7hN7mEri
X-Gm-Gg: Acq92OH+Ubu0+/nYsL/2RUX4+ZoSNkweB+zA8PbXuKWEyulDP5Fc5iQlGKM3R9UWoaM
	NHCLetXdYViAkUIM8AjlzUZNsmxTwAvwgOwdfuH0FZWidaXwytVpgvoovthAwx9GngNMabLNomV
	jgTFwVLM3loVt8UOu4LseNmag/c6yLBx6ABy7IcKScNdOXwD3nqNeT/pD8P/QcNDdkpZBGSEllP
	iHpoT8ep/J0cNKAfbC5VC3MQg63xO7wk0ADeD3DVHa9fo4xHcyrmi3pno/8zuNfQO0AeeeHRZju
	2F9Rqjj9lRBZ0DmZNL7zxfDWUcgxze2zXSBOQiLLwskpc0ASQNvy3fS6tLS1T0CWwSVRuOkH3Sz
	9D0sUPAO/R6T/LAAHXsIQ0aaUWmISZgr5rhJcx2IN16WN1sMYAyb4Q36iyyZQpCVGfi+HDF/DQC
	4H983iC0QgCsTd4+tY+WIIvu+yAAior046d2I1Kw==
X-Received: by 2002:a05:6102:9d8:b0:634:d42d:15e2 with SMTP id ada2fe7eead31-6ff0725fd2fmr10705801137.26.1781022192234;
        Tue, 09 Jun 2026 09:23:12 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdcc968sm220219576d6.22.2026.06.09.09.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:11 -0700 (PDT)
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
Subject: [PATCH v5 09/15] ASoC: qdsp6: q6routing: add lpi mi2s support
Date: Tue,  9 Jun 2026 12:22:49 -0400
Message-ID: <20260609162255.31074-10-mailingradian@gmail.com>
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

Add the ASM-AFE routing for LPI MI2S ports which represent internal MI2S
ports on SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6routing.c | 78 +++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 7386226046fa..d076c99f197f 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -127,7 +127,14 @@
 	{ mix_name, "TX_CODEC_DMA_TX_2", "TX_CODEC_DMA_TX_2"},	\
 	{ mix_name, "TX_CODEC_DMA_TX_3", "TX_CODEC_DMA_TX_3"},	\
 	{ mix_name, "TX_CODEC_DMA_TX_4", "TX_CODEC_DMA_TX_4"},	\
-	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"}
+	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"},	\
+	{ mix_name, "LPI_MI2S_TX_0", "LPI_MI2S_TX_0" },		\
+	{ mix_name, "LPI_MI2S_TX_1", "LPI_MI2S_TX_1" },		\
+	{ mix_name, "LPI_MI2S_TX_2", "LPI_MI2S_TX_2" },		\
+	{ mix_name, "LPI_MI2S_TX_3", "LPI_MI2S_TX_3" },		\
+	{ mix_name, "LPI_MI2S_TX_4", "LPI_MI2S_TX_4" },		\
+	{ mix_name, "LPI_MI2S_TX_5", "LPI_MI2S_TX_5" },		\
+	{ mix_name, "LPI_MI2S_TX_6", "LPI_MI2S_TX_6" }
 
 #define Q6ROUTING_TX_MIXERS(id)						\
 	SOC_SINGLE_EXT("PRI_MI2S_TX", PRIMARY_MI2S_TX,			\
@@ -320,6 +327,27 @@
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
 	SOC_SINGLE_EXT("TX_CODEC_DMA_TX_5", TX_CODEC_DMA_TX_5,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_0", LPI_MI2S_TX_0,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_1", LPI_MI2S_TX_1,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_2", LPI_MI2S_TX_2,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_3", LPI_MI2S_TX_3,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_4", LPI_MI2S_TX_4,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_5", LPI_MI2S_TX_5,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_6", LPI_MI2S_TX_6,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),
 
@@ -709,6 +737,26 @@ static const struct snd_kcontrol_new rxcodec_dma_rx_6_mixer_controls[] = {
 static const struct snd_kcontrol_new rx_codec_dma_rx_7_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_7) };
 
+static const struct snd_kcontrol_new lpi_mi2s_rx_0_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_0) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_1_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_1) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_2_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_2) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_3_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_3) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_4_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_4) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_5_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_5) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_6_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_6) };
 
 static const struct snd_kcontrol_new mmul1_mixer_controls[] = {
 	Q6ROUTING_TX_MIXERS(MSM_FRONTEND_DAI_MULTIMEDIA1) };
@@ -938,6 +986,27 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
 	SND_SOC_DAPM_MIXER("USB_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   usb_rx_mixer_controls,
 			   ARRAY_SIZE(usb_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_0 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_0_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_0_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_1 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_1_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_1_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_2 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_2_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_2_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_3 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_3_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_3_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_4 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_4_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_4_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_5 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_5_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_5_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_6 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_6_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_6_mixer_controls)),
 	SND_SOC_DAPM_MIXER("MultiMedia1 Mixer", SND_SOC_NOPM, 0, 0,
 		mmul1_mixer_controls, ARRAY_SIZE(mmul1_mixer_controls)),
 	SND_SOC_DAPM_MIXER("MultiMedia2 Mixer", SND_SOC_NOPM, 0, 0,
@@ -1031,6 +1100,13 @@ static const struct snd_soc_dapm_route intercon[] = {
 	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_6 Audio Mixer", "RX_CODEC_DMA_RX_6"),
 	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_7 Audio Mixer", "RX_CODEC_DMA_RX_7"),
 	Q6ROUTING_RX_DAPM_ROUTE("USB_RX Audio Mixer", "USB_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_0 Audio Mixer", "LPI_MI2S_RX_0"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_1 Audio Mixer", "LPI_MI2S_RX_1"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_2 Audio Mixer", "LPI_MI2S_RX_2"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_3 Audio Mixer", "LPI_MI2S_RX_3"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_4 Audio Mixer", "LPI_MI2S_RX_4"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_5 Audio Mixer", "LPI_MI2S_RX_5"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_6 Audio Mixer", "LPI_MI2S_RX_6"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia1 Mixer"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia2 Mixer"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia3 Mixer"),
-- 
2.54.0

