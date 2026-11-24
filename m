Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541559;
	b=eBjNwqKQruyhv4Rq1MELyxc+KiQYtn7pL5C8gGk9vKtVij8eMxSF5KDrG4as40+EDcnc
	 L/pQGPhjgn+e1X+fDLPqy2dpvhQsTGozoLMuwzQ10V03K8dVblkRLPtnEdUEHoakMp0vW
	 k8FTqyC9oiHlUtwgzZfppYjXqyHMg/Sq/4aV0knLv62Ls/e3MuytR0/j3kNRHgYhDPn0K
	 IrhWtIXtbK/uxFvCasN7p3MP//QSmmxyQGuCurc4yHBAs8q/dC63aV5sIuvAEKVFNYv+v
	 1RhN4t5FmU+6DGkHQ584C3/z8/iG/LQAqSqQvc5tgyHehCWfhuIi7bRXESY/td/S+AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aGnxrE9p9zHRNsEciXyE5jXeXqOzlxMaO7gUWGze/Mk=;
	b=OP+qnVJNlQCFkcBKCaTBpjhiHDubz872XZYkZ+0IHhPTqsTIsKYe2s30zi0+IUITywRr
	 Xvb40rqTpESQzJNMr1YtTUJBgk1Ag6UWvob23hnlfMcuPxDj0vUfAXzVkEjlVpkO+UJjw
	 xm4hbs+oTclwEPjKC3m0EPb+bhLbFwnk3XDez5OZUTRN4hcq4naCgwTiEzkFGEJ4cIlCq
	 le44Lp1v1zqAAoxanY3I1SDCzMqWNVtcx57DlHW/lzX6dpdS43mC/0VJuWmEdSnBamkUG
	 5zcRJU4gyOTo0Rt6ZdaStUpQQTckNbBB6YNp9nmZ86yXzlBxz3J0Bdw0cGdJHC83UUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MkY39iiw;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C198E606A330
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C198E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MkY39iiw
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3028362f8f.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541557; x=1796146357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGnxrE9p9zHRNsEciXyE5jXeXqOzlxMaO7gUWGze/Mk=;
        b=MkY39iiwV1cr4k4iONAPcT86nVYaRcmTicW4sWKh2feM8v+PJ90pK3fM+7wyoTaDDd
         e8paW1DK2LjWmLFnx/WvPQrUNLJvTSM2QVLeBcBDFS214tQVb5yxvG0WTMN/9+isS7c8
         YvJr1J6mAJ0m9NlmFDoZ+X/rNViXMlxEXvqtNJ7KrsCDSu/vDQw9NdRCY0xqvi4Ocr04
         Y8PhMEEltxo9oeGplPzV9+q6B8HaB633NyN+kRQS/RDDYNFng0+y5DYxBjX7D+EaRPD6
         i3OsBbyH4ZdfgkaGLRclml6/VULm3IjhT8Y23NtN8R75W1qRAflHkTzVRvz+Y1DCeHAi
         dOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541557; x=1796146357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGnxrE9p9zHRNsEciXyE5jXeXqOzlxMaO7gUWGze/Mk=;
        b=RDW9Im7xaNt0eb5vPS4m/RFxEIfZEm8VZ+LiI6x+1a06DlNGI0ORfgRonp798SbcI4
         o1EWeyOAf/648ef+r7xNbu4zyOju7ZtjTj8fwFYpgUbmWkftqM47DQ5ePX1YaIQzdOCN
         Jqu8m3AXPiRybtLl6mKFoOfPbTn8j4c9HSVPPJwJKQIiJt7Maa2r0k/iyCiNhIjDRS+I
         reOUjws16rhVeE1xyvXn3QA71ZgSoZtUS6oFN2cdqTrKOHQPLR5HvRf3Bmn0V3Fi/wrO
         sbFZbbPj3zhAJgqLNq4J8qJPGnVsz95GndtXnGXTIInd3eTrSbRhUWO9DTu3PwarHJpO
         /Vjg==
X-Forwarded-Encrypted: i=1; AL+hErGhtQ4ESOGs5g1dpmdlGHdCCr11we+udi+2tNF7SrXJPP5ThanWNSZJfgrK+ialbMjV2KRgft6kXdf0@vger.kernel.org
X-Gm-Message-State: APuU4Z8Uvt6jrVvLfIVGl7ezOAkPiYmxmBCnPQI59RoMWZdb9A8+I/7S
	dFl7oDbQWZO05Xl3OYuu+EAfDAnS1RtjRLLbe07+aoKnl6Vkz1D00vpvgbs68gwLa/A=
X-Gm-Gg: AZFdTZf1klKZM40MzkveLzk87dC3c97wMfNs2VfyhZj0LC8ZJE6RU6J3CCbOWj3+7JU
	BRZS94vSj5wRrynrSt73yjuAASYY0eScT2COQEic635JaYwEXd5jurzStGnbVatyFJRSs2QwoBU
	/iV9LG8Eb171Lyh+qMM64NUMuyW+QncJm8MOZb/UGwO2IbnklQaqruykhKkp+FFm69ERcapcEp4
	ENAz8UtalsvRht3yPivfNBgNVCHLLdf9AUvl0pAEhMsEpMGN+FiQEzkBu6Q13fvMu+PpKFFwoAZ
	iRJoqLPv9FLQfpWJwRWGKdYUj9RKxUoijy1uf/R1KxfVZi+9Hmo9MLAzNk/ldbnrlKzI7R95il9
	ny+sMqoxQyx1q39EOZm+fIxlyF96NXImWbBCtw4g1qKZnus7x5NuR3LZfHxz/Svb/5cw5gpP70r
	iDXJHuPERYLk/6AC+3mWFN77W+RKgUcL1iZ6iIKumkEmXX8jFDswgNJP9VD90suQTbyUxVyq3xM
	qa5BZ2qXpN5uShvIBZAXq5EsUOVPELodE6D62ign66lCifBtVBKAaUHGh5rijtYBWoqua5WIkub
	rZtp3orrO0lBmvym70XBIjPP1AF8Pn9w8kIsE3INZ25CWvs7qw==
X-Received: by 2002:adf:e014:0:20b0:4a6:b87:d77f with SMTP id ffacd0b85a97d-4abb0f3b5a5mr23020018f8f.12.1795541556971;
        Tue, 24 Nov 2026 09:32:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:26 +0100
Subject: [PATCH v2 19/19] ASoC: qcom: sc8280xp: allow using the sc8280xp
 card with lpass-cpu
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-sm8650-el2-v2-19-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6410;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6KOjMX1wUY70p+TGT4KMTCpDJ5tl7/ySb9BcH/nsQ4U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoj7RB3F2HyuJE0Mv65D3VmbKTIEFpkOranB++6
 gTK5bhmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKIwAKCRB33NvayMhJ0QcWEA
 CwIgTuDCa6XHOyFrf1uRIIx0q8nDuYS3SftAW8vG9CsuWeuzEdD29umb1iQ7cHCqyODqQ8AV0GkdQE
 HvJNKb2Nb3f7bumzzg0d2FPMIPKsP2liMHoyKREnkAQnSAFlrLaJ/lKs94z/IOCcmJgfUyx3P4Qsdq
 awSW9XSNTeYdVpgLYv+xV60Q0nOa4cPzA7WbZefdK1KKsgmieNhDa8QYAtSkHj2n7wWo4oO0VwOw1t
 0y7WfUIQALmVUt6W1bujh4Fwp2mZ0TVu6ApXqodnCuQ3VoNuUyOE2dNqRUs6GEdIC4nWBjaKrwX4YW
 vwOfcsRpH4cfcoaPx4fAro7psr87oSduHUKJdHL7ZemTrhJ0Gvti/Z7GO2/7KTAAlumaZbi7beRywV
 YbnG1Xl1EZAV8xitxSI1XAkcwzXXyzGuI/TdUW7KFom0zIdb3T1b9Kbdw5xnkbHmoOmgRVRcrweGdL
 rYmgQK/XNqc/xx1/E8+pu9npu6bfZz6ewz/8MDennI3WZJ1SZgVRomxcn9HELwamSLQIyySLqsQfjd
 3+oRqXv2ReFpF4pEWS16va/9Qq6YIZJcOClKO3nj6vy/aQSz6tMPHtWnAZrqYswQGOgJAKXVBhlx5a
 M+GwfpAU6Em8BWLs4KkROXY5efQ5ihSGtoPOf0M0c/MQMAq1wwQww29M7XwQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When the ADSP is not used, the sound card links use the LPASS CPU dais
directly, those links are neither DPCM frontends nor backends.

The LPASS CPU dai ids from qcom,lpass.h overlap with the DSP dai ids
from qcom,q6dsp-lpass-ports.h, so add separate init and ops callbacks
for those DSP Bypass links and keep the DSP backends handling unchanged,
allowing the sm8650 sound card bindings to work with either the
Audioreach or the lpass-cpu interfaces.

Also attach the WCD jack to the LPASS CPU TX codec DMA dais on the
DSP Bypass links in qcom_snd_wcd_jack_setup().

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/common.c   | 43 ++++++++++++++---------
 sound/soc/qcom/sc8280xp.c | 88 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+), 16 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index af5cacddf67d..65f0db493642 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2018, Linaro Limited.
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
+#include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <sound/jack.h>
@@ -420,25 +421,35 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	if (rval)
 		return rval;
 
-	switch (cpu_dai->id) {
-	case LPI_MI2S_RX_0:
-	case TX_CODEC_DMA_TX_0:
-	case TX_CODEC_DMA_TX_1:
-	case TX_CODEC_DMA_TX_2:
-	case TX_CODEC_DMA_TX_3:
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			rval = snd_soc_component_set_jack(codec_dai->component,
-							  jack, NULL);
-			if (rval != 0 && rval != -ENOTSUPP) {
-				dev_warn(card->dev, "Failed to set jack: %d\n", rval);
-				return rval;
-			}
+	if (qcom_snd_is_dsp_bypass_link(rtd)) {
+		switch (cpu_dai->id) {
+		case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX3:
+			break;
+		default:
+			return 0;
+		}
+	} else {
+		switch (cpu_dai->id) {
+		case LPI_MI2S_RX_0:
+		case TX_CODEC_DMA_TX_0:
+		case TX_CODEC_DMA_TX_1:
+		case TX_CODEC_DMA_TX_2:
+		case TX_CODEC_DMA_TX_3:
+			break;
+		default:
+			return 0;
 		}
+	}
 
-		break;
-	default:
-		break;
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		rval = snd_soc_component_set_jack(codec_dai->component,
+						  jack, NULL);
+		if (rval != 0 && rval != -ENOTSUPP) {
+			dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+			return rval;
+		}
 	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index ac4dfb2c2182..4fcccf7ec496 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2022, Linaro Limited
 
+#include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -377,6 +378,37 @@ static int nord_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static int sc8280xp_lpass_snd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_WSA_RX0:
+	case LPASS_CDC_DMA_WSA_RX1:
+		/*
+		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
+		 * to reduce the risk of speaker damage until we have active
+		 * speaker protection in place.
+		 */
+		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
+		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);
+		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
+		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
+		break;
+	case LPASS_DP_RX:
+		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack[0], 0);
+	default:
+		break;
+	}
+
+	if (data->priv->wcd_jack)
+		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+
+	return 0;
+}
+
 static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
@@ -538,6 +570,58 @@ static const struct snd_soc_ops sc8280xp_be_ops = {
 	.prepare = sc8280xp_snd_prepare,
 };
 
+static int sc8280xp_lpass_snd_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	int mclk_freq = sc8280xp_get_mclk_freq(params);
+	struct snd_soc_dai *codec_dai;
+	int ret, i;
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			if (data->priv->codec_dai_fmt) {
+				ret = snd_soc_dai_set_fmt(codec_dai,
+							  data->priv->codec_dai_fmt);
+				if (ret && ret != -ENOTSUPP)
+					return ret;
+			}
+
+			if (data->priv->codec_sysclk_set) {
+				ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk_freq,
+							     SND_SOC_CLOCK_IN);
+				if (ret && ret != -ENOTSUPP)
+					return ret;
+			}
+		}
+
+		/* The LPASS CPU dai sets its bit clock from the hw params */
+		if (data->priv->mi2s_mclk_enable) {
+			ret = snd_soc_dai_set_sysclk(cpu_dai, LPASS_MCLK0, mclk_freq,
+						     SND_SOC_CLOCK_OUT);
+			if (ret)
+				return ret;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops sc8280xp_lpass_ops = {
+	.startup = qcom_snd_sdw_startup,
+	.shutdown = qcom_snd_sdw_shutdown,
+	.hw_params = sc8280xp_lpass_snd_hw_params,
+	.hw_free = sc8280xp_snd_hw_free,
+	.prepare = sc8280xp_snd_prepare,
+};
+
 static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
@@ -549,6 +633,10 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 			link->exit = sc8280xp_snd_exit;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
+		} else if (!link->dynamic) {
+			/* DSP Bypass link, neither a DPCM frontend nor a backend */
+			link->init = sc8280xp_lpass_snd_init;
+			link->ops = &sc8280xp_lpass_ops;
 		}
 	}
 }

-- 
2.34.1

