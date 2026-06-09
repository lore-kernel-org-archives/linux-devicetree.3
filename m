Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC153EDAB8
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022193; cv=none; b=QFcq0SFDHJGFK72ZyjEwgOIRm6wEVhMGv1G/fmBEX8oqL+Q5FzOwSuRduSHr212arYXdV1GHCNU4PbyVxLAJa4SzMCRFlV2GCHXgXjpolhcO1GsunCTyK3ZlmGikJO0Y7Ul86ak6yJelsnxkUYahy8iEA+Rk8khYmklDlanO9Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022193; c=relaxed/simple;
	bh=2f1OPZ121QSNwsYLYAWhK9Hw/qiI58CkFpqvVUdneak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J25wZKB7efM+bDQ5JIiQvicN29zaOQObv/kdsHixY5JQW+nUhtuuNTjGGd5f7Hkfmp0hNiM33G1kKEDXmTFRNmFHzKW9JFQk+/2v3eg6s8o3GFhIjqZDWuohuuPG04TcaQutrOMf0gk7QLuPrOU1BaehMQ5S5npFkm2JjvnAPho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Km5pZxjK; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Km5pZxjK"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51784eb2ba0so43378651cf.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022191; x=1781626991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hun3Ky6XQUrHOTGKT/KTktQmM2f62wDExV37VcKxdpo=;
        b=Km5pZxjKIrfYWh873OO5iWZfIrHyWAVrFz3EHRDPJzCAXNx1JCku9GP4wh9xZ0lm+X
         m0rsRrC6OxWnv9UDMe11Y0m9MJm8YrJHr+ZoU2Mf1+PXkRSBfVO2MMSLxoteeX3cKD62
         iK35x/4c8AUdQ8ulLbhThxwewn1cptOHWx3sX2VSsTrfGPqE2nlZZKrLAEFZiDWrO3Z3
         0Z7QoCbl5EzEwyw1SUyNW+adTzMXvJ7W32Nf5M6JmFBJK2/x604nNSotcmA7ypmmaAP9
         1+gPz+u2Qpjm6tvs5/ZJItFPIhsZh6DqoSqiHYVtt8e2lHGfTQP+KxlQ8PWGLDfJXXe2
         tfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022191; x=1781626991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hun3Ky6XQUrHOTGKT/KTktQmM2f62wDExV37VcKxdpo=;
        b=FYFbCZ/m7Y8iSAPCNPRr4pc/CyqAd7Qzti0unExvcc2flKU4BluNJ/oU3pcZ/Q9A+H
         ldRWbLSAHBhuAHfFi047+aDkT64BaUKipAM863+X0wLT0WSmWJh3RutPX21c4EkoKp+2
         JgF9rIGZv18meii29xvSRKYfs8Fg4BXU3WVp8EHP5SAeYEyBBJiOY+bV7hXNUyENc7+G
         ADk/Mdqdwi8Awx+CnyIiUNnNWP+UJ3gl6zeEoz5DJ4e5ckDUJP3S0ZleOi5SkjsdncfS
         M8QR+Jl4vr28+BM46By1gRV+Z3GnpdQT1ca6CNe/iLz+PB1s8y9w21Fn7DWGTDSBzttt
         WdnQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aMeHXXg0FCNoCJv0G2INJPn8BfX4O+z7CKVCLCI14qW/nfSYwL/8nNiK5SuaQN2dishOD4k77Wx7v@vger.kernel.org
X-Gm-Message-State: AOJu0YwZN4KnjnFIWPRJyFA5S8k9iPvoRHGNn9pNw441/mwT+jtWd81N
	tKr6gHRt9/AVv9zyf4yGK4BjoGCIGlerE50R4nHmFSmRRnLoIzd0ZYmt
X-Gm-Gg: Acq92OEmyAhAPkIJs7PJXdLCMvnTCExRbFgyVGJUUD3RGFqz55ZHejGYP+avBemOpkZ
	pUa25SimtNVd2M4O1yrCYIqZEMlxTobw0vnq2AMxD1WVaIgyU2vU1FBq49Bq8mppm3c8MY5NoaB
	l1fEuuHG0A1F4QMttuh9MmWuLrPYb50k6BLr1aO8pW0mpLbFgiRt9JTclviC+6GQufOxAR9hgrw
	LbeD6bQaS7EwrBuPCA0GrPw7mQml2hqt7bX0Gg0whUixyfV/GEinz+6cPV4IJEae29dUA1ZoraQ
	Y6DcWXY7CePZbCVQqivZE8wV+xc8g4LP5YJUnxkaBGdNJ2XNyrpYEJrj2gI2y3y+ffshSZFH5Y2
	2119rmjZEjvLnY+MLKpM/zmVm1QBjSCaUt9Qi4+VgVtdCAWVIB5Ztc+PCePD57AAj7CEGAOr2V/
	gDkgo23HfdWHkyGnyQpZi5ka9jOIoq4cn3Xcolfg==
X-Received: by 2002:a05:622a:4cd:b0:517:8437:f67b with SMTP id d75a77b69052e-51795a48383mr305424961cf.12.1781022190790;
        Tue, 09 Jun 2026 09:23:10 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c297a8sm186983521cf.8.2026.06.09.09.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:10 -0700 (PDT)
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
Subject: [PATCH v5 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s support
Date: Tue,  9 Jun 2026 12:22:48 -0400
Message-ID: <20260609162255.31074-9-mailingradian@gmail.com>
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

The bindings for LPI MI2S ports, originally exclusive to q6apm, can be
used for internal MI2S ports on q6afe. Add the internal MI2S ports found
on the SDM660 internal sound card using the LPI MI2S bindings.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index a0d21034a626..920345609d2c 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -412,6 +412,8 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+	case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
 			       &dai_data->port_config[dai->id].i2s_cfg);
 		if (rc < 0) {
@@ -665,6 +667,21 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 
 	/* USB playback AFE port receives data for playback, hence use the RX port */
 	{"USB Playback", NULL, "USB_RX"},
+
+	{"LPI RX0 MI2S Playback", NULL, "LPI_MI2S_RX_0"},
+	{"LPI_MI2S_TX_0", NULL, "LPI TX0 MI2S Capture"},
+	{"LPI RX1 MI2S Playback", NULL, "LPI_MI2S_RX_1"},
+	{"LPI_MI2S_TX_1", NULL, "LPI TX1 MI2S Capture"},
+	{"LPI RX2 MI2S Playback", NULL, "LPI_MI2S_RX_2"},
+	{"LPI_MI2S_TX_2", NULL, "LPI TX2 MI2S Capture"},
+	{"LPI RX3 MI2S Playback", NULL, "LPI_MI2S_RX_3"},
+	{"LPI_MI2S_TX_3", NULL, "LPI TX3 MI2S Capture"},
+	{"LPI RX4 MI2S Playback", NULL, "LPI_MI2S_RX_4"},
+	{"LPI_MI2S_TX_4", NULL, "LPI TX4 MI2S Capture"},
+	{"LPI RX5 MI2S Playback", NULL, "LPI_MI2S_RX_5"},
+	{"LPI_MI2S_TX_5", NULL, "LPI TX5 MI2S Capture"},
+	{"LPI RX6 MI2S Playback", NULL, "LPI_MI2S_RX_6"},
+	{"LPI_MI2S_TX_6", NULL, "LPI TX6 MI2S Capture"},
 };
 
 static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
@@ -1011,6 +1028,35 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 		0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("USB_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_0", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_0", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_1", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_1", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_2", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_2", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_3", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_3", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_4", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_4", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_5", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_5", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_6", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_6", NULL,
+		0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_component_driver q6afe_dai_component = {
@@ -1045,6 +1091,8 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
 			priv = &data->priv[id];
 			ret = of_property_read_variable_u32_array(node,
 							"qcom,sd-lines",
-- 
2.54.0

