Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA0A3A3E9F
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985972; cv=none; b=HPKtaexjEyPmOdC4TzjizdR0LscpCn7B2b8NBqVbbzPNy/KsnEVxHDnDcVZpL6em80GD16+sV8yKItnPrFg1j/6I+Z9OS15+eQfhC9AMuo8yR1XzBQWdzy47VBqy8kzerEIv4Z88BzMpVWFAsPDaOv6KXZ75TAo/81BpU+Ao5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985972; c=relaxed/simple;
	bh=I6GOdWlyv80VkD62lfoN9e2XJ3JK8Cex75Bv2RJpnSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSaP1aAOy9CNNLEL8r6kGscOnDoXokwNlf7Elqy8rDRQ9xlbdPBF9wBO4ou53XkjS3A2gUF7MBH1HO79UcOIlTk3fNAmBL/ONmh1sb/Pjklk6uP4VVVit3BeIbLBqU2Pag0RJB8sXhSVJL7osCGlP1BT6DT/eoef+DDmKHluEOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IumWai8W; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IumWai8W"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-506a7bbe9d0so51102861cf.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985970; x=1775590770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHV0JqbiQZymbMCtdLcU7ussu4cx/THQpTwsM76Wq7Y=;
        b=IumWai8W4z9pd6QFwSQ4nJUYHui0di0qW3DNh6p7eEF3LxP9Yv6nPx7k+EHstL9YTP
         AeIqW5cvr2Lc/4iuF2ATJwNjrKlTL6z0oX4h8YMPCYPSe/4ERWo7gfHX46m4txyA+s3L
         cUWKZIyE/6XO1mO2n9tXeEincMzHbzfyD3//x4tmRyq8A7eg593gqJk8shZyxsSRJbyb
         twTXoQnYLrW3H5qDvV+RrbD7lcTWe2+9T2ghApebe8fr/+AY3G5muQe26AAJFIOgu8ge
         HzEBGtsFkwrPysBYs+QbNlR+dZCo6JKGhcoLWPnltQT8LLUE8m0DOwWQBGU99/cqZihX
         8DCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985970; x=1775590770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHV0JqbiQZymbMCtdLcU7ussu4cx/THQpTwsM76Wq7Y=;
        b=pqQHAYTr/nlIQeGGpaGHJPxGpToxZ3TOKUhHMh59sn7V+iNBqLtuhZs7R5lh50t8Pn
         X5SycpqfAnQdjvmf55VTYff6J3svVkSMYgHFxysMxaQ3OIpvgRPoyv5mZZM7OaK/oB5q
         w8CVPGjBXlbeCbmXxvZZZIB/G0OdZPTaNHO94LbY95k3qwX/t1Q5FPOmd4YKDUfS+rzo
         nyWhxJeTG8mB/YxMhigJbPp1gi6NpED4ZxvgIme5hAxX1K6ZBl+yEjgXvK4Mvgn6lMS/
         okraw2Rf1kxeRr2I/0YYrlqakARO0OUzQ7QB4jNc9IFZMkqLZKmoX6nThoIzvaNtKzeP
         YWZg==
X-Forwarded-Encrypted: i=1; AJvYcCV06Qs1D+b0gXvZhayH/BNcefCGdsDCEkA3AstDJGzGUlYsbJ0YbEOezzJYBvRYFwvp46xGNxu/qPOs@vger.kernel.org
X-Gm-Message-State: AOJu0YyCYxHek7dtprCT6jtlwbOLWC0JNTtkHV/95Ag1dudDXW13RhqL
	H4nDKTJNFJIS6HoiKcxUpVIFQCe5pek32QrOUJr9nfXsQUFqok9tnUnS
X-Gm-Gg: ATEYQzyBO/FNKCziTHOJWYWgZVz+7O9OxjA6PHFE2q+4kJ9WnohxGa64SD0EKeFr84i
	GxUpjp5WkwxNjj8j7ESEha+ytGLKE80pRk9qdahFYWnCFrkXS5MeluiJybD2hJbTrtbyIoPpCMM
	ItFUtd1YG57Nwjgj5g9xrmrQ4WeYRQi0i9kA+yMd4yGuYyRNT6Hluz8pJgKUKgcOhLidWFmpPI4
	0J1FjVRwI8tnJwy1qx4RIrY+4YNX58JO6E3FCbxLIm1kz0oZ2LvFIs8R8/oZWmppOaG/MdQPziz
	D6l1PM2Bzf0TvQrqKyd3dIyAPJc+OZTgu9rBf6I2QqwluIpYYM+anIbmwTR96lqBXYntd+pW3xt
	krYm67FM/JxHsjhYD1w+SXLENzjCgIB/jgJZ6k/nUGqh9vS6eixGapLCjWtOXau5zex8nwmyR79
	RToXtzWnK2SK1HBR2NwpVYW/ot
X-Received: by 2002:ac8:7d43:0:b0:50b:2f1f:ffd3 with SMTP id d75a77b69052e-50d3bd192fcmr11885061cf.59.1774985969720;
        Tue, 31 Mar 2026 12:39:29 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2dd8b81sm96873221cf.16.2026.03.31.12.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:29 -0700 (PDT)
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
Subject: [PATCH v3 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s support
Date: Tue, 31 Mar 2026 15:39:32 -0400
Message-ID: <20260331193939.40636-9-mailingradian@gmail.com>
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

Add the internal MI2S ports found on the SDM660 internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index a0d21034a626..34ec3bd3ea8c 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -412,6 +412,7 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case INT0_MI2S_RX ... INT6_MI2S_TX:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
 			       &dai_data->port_config[dai->id].i2s_cfg);
 		if (rc < 0) {
@@ -665,6 +666,21 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 
 	/* USB playback AFE port receives data for playback, hence use the RX port */
 	{"USB Playback", NULL, "USB_RX"},
+
+	{"INT0 MI2S Playback", NULL, "INT0_MI2S_RX"},
+	{"INT0_MI2S_TX", NULL, "INT0 MI2S Capture"},
+	{"INT1 MI2S Playback", NULL, "INT1_MI2S_RX"},
+	{"INT1_MI2S_TX", NULL, "INT1 MI2S Capture"},
+	{"INT2 MI2S Playback", NULL, "INT2_MI2S_RX"},
+	{"INT2_MI2S_TX", NULL, "INT2 MI2S Capture"},
+	{"INT3 MI2S Playback", NULL, "INT3_MI2S_RX"},
+	{"INT3_MI2S_TX", NULL, "INT3 MI2S Capture"},
+	{"INT4 MI2S Playback", NULL, "INT4_MI2S_RX"},
+	{"INT4_MI2S_TX", NULL, "INT4 MI2S Capture"},
+	{"INT5 MI2S Playback", NULL, "INT5_MI2S_RX"},
+	{"INT5_MI2S_TX", NULL, "INT5 MI2S Capture"},
+	{"INT6 MI2S Playback", NULL, "INT6_MI2S_RX"},
+	{"INT6_MI2S_TX", NULL, "INT6 MI2S Capture"},
 };
 
 static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
@@ -1011,6 +1027,35 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 		0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("USB_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("INT0_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT0_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT1_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT1_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT2_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT2_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT3_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT3_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT4_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT4_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT5_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT5_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT6_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT6_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_component_driver q6afe_dai_component = {
@@ -1045,6 +1090,7 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case INT0_MI2S_RX ... INT6_MI2S_TX:
 			priv = &data->priv[id];
 			ret = of_property_read_variable_u32_array(node,
 							"qcom,sd-lines",
-- 
2.53.0

