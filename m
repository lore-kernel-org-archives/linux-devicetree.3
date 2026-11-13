Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595132;
	b=Kypg7xYCTfcm9IE1HTUkANMuwc7nV0N+KlSiy4WNDSWQnar6j18hn3P/asOaUseZqpFH
	 h0lzlb6tTgoPIab9BNEmzXzQlwiSl1fy6Q7Q/2EA/U6Z9zM6XqYzKeM7p7rQgIkZsaA0S
	 DsVIs3xHE5ae4ax4TEHcWJfcFN+zspcnnfZqgrhgEr+2pXfkeS6uuOMpVZQ3PSUbDOgYq
	 ovryJwlXk3/gE9XOwb0QDhxeF9Mon84txaUVog4XbLuoqiLhCGDKw8+/lS86tIIzkeSvg
	 gfm50xp/9TMkoDIot2nvfLLEXlUL2tUpvS3n9RdBUFoCgqgV78s9FVtgZsEOXGDoMtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=I3CxMslsd+5GbFipqe8hUZfFNzi5/bfvHjhMGH0Ggto=;
	b=XPgM3fwElD/psJM1kABFLo+tcs13b57tdSfpVU47DcdYGFFBukUSGyIEj6EiFmn8Hnvz
	 7gXJ0xQW2kTeUEcaBqSxWmRYdX43Xt/gvgSin8A+Fu5e5cLhan2QkyVcpFPBgUXdvsF6n
	 81eEWdHxRePo4ZA5jH0BnorI9wPzT5PqWhZUegrjY3ZB/zslDskkrdMCDv1Ub3l9ul6Hi
	 8XkanYWHuytU2aUz6Fl4WWdPXqt96CX83zkxiq2gCNrN7BVR3xzoJ3HOOW9u8f/VyJW4b
	 WovhBhC6kSqRHJvbsLCokiddHyXcrfyzA1oX60vwPcGVjfKABWsgFOWv3/xoHyr+vBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LbpqK6Un;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC1660A3824
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC1660A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LbpqK6Un
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491971ac844so1507154f8f.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595130; x=1795199930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3CxMslsd+5GbFipqe8hUZfFNzi5/bfvHjhMGH0Ggto=;
        b=LbpqK6Un967LK/nmM728B9/DzxZ3woD3YQrGDkm9tctvjUStFBTEOGxHGYYUzjuPBj
         EtLMVOrZo+ntdcy2qL+Z/UO8FsI8ZAS+xb/mb0tac3YTNrtt4PxukKQd+GD87L/out6A
         jzIxTbJWtjtuuQWmHsqkhfjvyku7FuRgiojQu+Og/HjqA+keC6Y0PI8hNETXDd8A77Ak
         D4smjMqJoSjYpoEkOW1h/Yu2WvSFJCLoQ72bHe2D66ZuriXYRPnhxoKcPUuSq4GoT/EL
         9MTr+sphaPhBF56ZXsxr5yR1OTeo2gb6PSDmCGk/5zlLouzs8WkyHKiOtTmDqm2tGnJj
         lzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595130; x=1795199930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3CxMslsd+5GbFipqe8hUZfFNzi5/bfvHjhMGH0Ggto=;
        b=rm+keUSumAas+q1BsEik2tOJKlQWmay0C/s66Hs9OlGfUJxzpUxPUtmDEMIjBzHIrv
         BIoX3eiYFkJ+pR39JvIke012Xx5e56BMlBbt/DQH8+zp8EA50zpYbUjkrcKo21PI/TEf
         FzkDcvD781uY+if9UEu/e08fAHa1siYkN2V+6bztqVnUxFo299k2SQgXG9VoKGxpzQU9
         aecRQH7c3W82IqG5zygJx13241koQkzw4L2/zw5YyYK0xXWm3pUPtNSQAqnUKtZ9bidJ
         RhRAicrOZNnrDllLguSZsw5bdyoGhPmHMXSZdvl4xPY9sIHlkal08U8mwv1MwS0Yee6b
         Npvg==
X-Forwarded-Encrypted: i=1; AL+hErEc/AhoCFjOwoeYhout4FWG71zvLJ0KZyHXajmsWaLewK6iAiX5ls6/w0Kdc6P00jENbCqLjIp8y9Tz@vger.kernel.org
X-Gm-Message-State: APuU4Z8IfUvLE3wJbWYY2mZ7CE6SmkJ1twSnPHjV+YVt7owJNK33JaTD
	yzJlC4300F3OoOkkRJ2kU9SE8EHwYmNNh7WsXtFxBYR8D2UkuMJeguf/WheVANp2JYM=
X-Gm-Gg: AYBFou1y7fmHyrInLoZoqQImRWmuxWuX8XUo+gFLXq0YIzgSvHtKEqT+ltJTuclQF2T
	lhFebgTbiWKW3KbU6DlIrmQ+/V9u2Xk3w4i33nQtVFrslp91B7YJoyWl5Ug2PN+NgHdhHFeBJ9c
	VuSGpfPCgyAEQGqcl3uwV6/9JMyljHhAhIKYMm5SfKmpS5OK6ZCGJeCrH3LbP4NPGP+PnwpXEdJ
	Jg8ZqT2VeNec1aesvufoinDxHrCGu3Zzu1hSj5iTnq3xjhbn1trGAHpBUyYii0/NlHrRjbebCaa
	oi96IFrn1mqS6yMBOPJMNbwWc9GW6zKk03kN9Bqs6nHk1dwUM/WcBjp96+Me3DLr+bByasJskY2
	peExN52OdXQaE59Tcu0NrJsWlIIkFaTYSemyPrO86TV3w8GFBaaJzKIZHLmTipurGdZIOgCb4tJ
	4Kqljg102ykj6Ji99YIxFiebdtw/sfSzKu0f1FWAdtItSvONaVDZSdf3cvytwCHntghVkC04nMf
	K9mXlUt2+8+1FTDDa6iVWOlNDvpGMSTe0lY+wW7RGDoiW+31mId4yxhqB5J7YdfHdYPPvnukyo4
	uvrbZIP/bJ14/3W61Kb2JTEOIi7oC82c1vfIVp49rVSL
X-Received: by 2002:a05:6000:1615:b0:48c:466e:9d08 with SMTP id ffacd0b85a97d-49c72e8536dmr4550919f8f.43.1794595130196;
        Fri, 13 Nov 2026 10:38:50 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:26 +0100
Subject: [PATCH RFC 12/23] ASoC: qcom: lpass: add support for MI2S_SENARY &
 MI2S_SEPTENARY
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
Message-Id: <20261113-topic-sm8650-el2-v1-12-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4946;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rqZ0Osg0HojjlY5HyP3QcoLTcy4Arc9udO5pSa/aXBU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kjp0bSXvioqiMiwdRjaBx8bf6FhTsGhAQufZLi
 jum2U2eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZIwAKCRB33NvayMhJ0eVuEA
 DE/YDI4pr9/6zWuN9XERrBLxGuRaSsKBAlHRD2Oliy3oHThjs9SgS4iq9JeHHtILp4ScnitchAv4VF
 oBQlSwJDvUaF0RjEow+nTVWSbwXAIABeljVLoDkcEbqC7hKqikq4M0N/DSLcDJee+hugf560hbVtQB
 tKm5QxQV/F75kUO6GnmsApUkr+eBjbopH3+Wdqb3d1d/8Trpgln1rvqVnmG21JypwH2GHt663sZssS
 Pt2B19mj2SeY1k49Q/3sFjCTkMPvta51CMuIePkEjTTY77AOfwLbRfvwbJxF20LK8I+BWfRM/oR855
 HU/4zmcGi5xKya0V2wz68yFqMv5tNMxFTSN86ujIHLRiceoXY8rkYEXrY0ZUHjz0EduyMKcQXv2G/6
 GAjEKbBsUxoWsYjViWsU/UkB3AnkAh0PDvCh8nfEr9n1Ap3DocpSg1p3xMHzRRxO9UnuXCt7ZHtVVn
 Q6dA6Z1jS2IhE/rX/awLO9mRutGwd3jE4V60s43G4ctEuN+TsjA7c8ujaFJ9EVhVn6OsneOgIVphGM
 y6To59zf6jAvTXKu+Ho5WWxdsUhm1oytUZXf4tnvE4rApIhsv+UaiBvM9jpAI+clU2g6K2S9joPLKf
 x9qbWVJtduRBGCfaIhhuGrv63Igwq/synAeY42R4KZ9sJ16z4GVBhfdCENHA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now we use the helper to translate the DAI id into a proper
MI2S port index, we can add support for the MI2S_SENARY &
MI2S_SEPTENARY ports.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-platform.c | 14 +++++++++++++-
 sound/soc/qcom/lpass.h          |  3 +++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 574b46e2176d..2400a6d16bb8 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -274,6 +274,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		port_id = mi2s_port_id(dai_id);
 		map = drvdata->mi2s_lpaif[port_id]->map;
 		drvdata->mi2s_lpaif[port_id]->substream[dma_ch] = substream;
@@ -303,6 +304,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	data->dma_ch = dma_ch;
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 	case LPASS_DP_RX:
 		ret = regmap_write(map, LPAIF_DMACTL_REG(v, dma_ch, dir, data->i2s_port), 0);
 		if (ret) {
@@ -361,6 +363,7 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		port_id = mi2s_port_id(dai_id);
 		drvdata->mi2s_lpaif[port_id]->substream[data->dma_ch] = NULL;
 		break;
@@ -400,6 +403,7 @@ static struct lpaif_dmactl *__lpass_get_dmactl_handle(const struct snd_pcm_subst
 
 	switch (cpu_dai->driver->id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		port_id = mi2s_port_id(cpu_dai->driver->id);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			dmactl = drvdata->mi2s_lpaif[port_id]->rd_dmactl;
@@ -442,6 +446,7 @@ static int __lpass_get_id(const struct snd_pcm_substream *substream,
 
 	switch (cpu_dai->driver->id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			id = pcm_data->dma_ch;
 		else
@@ -481,6 +486,7 @@ static struct regmap *__lpass_get_regmap_handle(const struct snd_pcm_substream *
 
 	switch (cpu_dai->driver->id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		port_id = mi2s_port_id(cpu_dai->driver->id);
 		map = drvdata->mi2s_lpaif[port_id]->map;
 		break;
@@ -518,6 +524,7 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	int id;
 	int bitwidth;
 	unsigned int dai_id = cpu_dai->driver->id;
+	unsigned int port_id;
 	int ret, dma_port;
 
 	dmactl = __lpass_get_dmactl_handle(substream, component);
@@ -568,7 +575,9 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	case MI2S_TERTIARY:
 	case MI2S_QUATERNARY:
 	case MI2S_QUINARY:
-		dma_port = drvdata->mi2s_intf[dai_id] + v->dmactl_audif_start;
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		port_id = mi2s_port_id(dai_id);
+		dma_port = drvdata->mi2s_intf[port_id] + v->dmactl_audif_start;
 		ret = regmap_fields_write(dmactl->intf, id,
 						LPAIF_DMACTL_AUDINTF(dma_port));
 		if (ret) {
@@ -811,6 +820,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 		case MI2S_TERTIARY:
 		case MI2S_QUATERNARY:
 		case MI2S_QUINARY:
+		case MI2S_SENARY ... MI2S_SEPTENARY:
 			reg_irqclr = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_irqclr = LPAIF_IRQ_ALL(ch);
 
@@ -910,6 +920,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 		case MI2S_TERTIARY:
 		case MI2S_QUATERNARY:
 		case MI2S_QUINARY:
+		case MI2S_SENARY ... MI2S_SEPTENARY:
 			reg_irqen = LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_mask = LPAIF_IRQ_ALL(ch);
 			val_irqen = 0;
@@ -1073,6 +1084,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	case MI2S_TERTIARY:
 	case MI2S_QUATERNARY:
 	case MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		port_id = mi2s_port_id(dai_id);
 		map = drvdata->mi2s_lpaif[port_id]->map;
 		reg = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 78125048b064..4407996fb145 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -45,6 +45,7 @@ static inline bool is_mi2s_port_id(int dai_id)
 {
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		return true;
 	default:
 		return false;
@@ -56,6 +57,8 @@ static inline int mi2s_port_id(int dai_id)
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
 		return dai_id;
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		return MI2S_QUINARY + (dai_id - MI2S_SENARY) + 1;
 	default:
 		return 0;
 	}

-- 
2.34.1

