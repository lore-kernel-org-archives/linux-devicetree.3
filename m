Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595136;
	b=PTFJj15AC6lpJyT8Ji44M0aSDPSNj2ZlNtKavaKoxapzuJoshwK6PGql3EQnQQctqcnb
	 2gEUpYIWYtUY1vVT0vKKguWZNTiFZIC0NtLFOS2looKAYp+tMEKnOGXvWWXcFV8SwW8+B
	 ywIvmGIA9GZxTnB5D94fR/W/6ydglnpbMdvjVJf6o51YkCIjfmnQ4VbjdMbkqB6Hyjzm7
	 I+mYeTjLJREFPF2lBWsZqTTE9dGicN8m5mRhbjA2e5eEdjdOemEh7+UopOU2RJCVhRCdR
	 DVvX2WjxfBif9dBLhEIRwhBNumNPVr0nC592U28DAdqjAB6ozFJ/F7k7bhQyMTSePWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p+fB/+3zgCM7NxjMth5ofyDAxapd4dJV3e25SOIGyn0=;
	b=Cmnu9iDQOD7X5ZRPaYHrvfntF4hqPHKuv0Bv0ieE/bGswo298Rc1lwVDnni3oyeaQwMP
	 sD+5Zf6JVQRrR/UVkOuvdb4nNnDeORT+4n77ws8vlcxq8AsLQuz5UJTFMfYPxeHP6T1ij
	 Cn9oY0eVrP+QGK74AFdkxcvgV7mz/AvnthZJhElrIyXH6Kg5wEYcN9r/zESimcoJFSAv5
	 nfHFsej9VlZno61Wg2+B0uawsLkX2+v+xm2XqEbZo3I8VtRb5fjPJYVRawHltu5KRN5a9
	 pmtSXelOQfKY4owz/G364TCWyPfKu+/Ow5EgCqRB2v603C+4gzlrStEV+b2N5kYn2AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="tBk0/V2x";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899EF60A5BEA
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 899EF60A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tBk0/V2x
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e47347279so534699f8f.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595134; x=1795199934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+fB/+3zgCM7NxjMth5ofyDAxapd4dJV3e25SOIGyn0=;
        b=tBk0/V2x/FD5MN56oTYx+Rbel7KWO8vro7J0ZSYNlzGWncmWjcdCYrP0aso9ltZTom
         BLEVDChuemhZi5CJhLitt/JeIMoi10UZ0iJQw9Olu85GPRltUnFs6SoaW90opVgHshKn
         5Oadp6vHgV3D3jmDN/Y0OZHk7K5+bCeMtRw14O4Oj7HTGQ1CSrr2TsObgSad6rpC2cNd
         Bij9M5YBqj17F/3PwhLSFE2dpdPWvkpJe+8amGGxji+MGwiKLi4eA/7Wohk/dOQUtext
         uEQVwuA+9RiJ/PZES6uW337oXRaivPhD4Gz9+f34Ajh+9MGfxPgZAssjLLs7EItmo5uP
         oRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595134; x=1795199934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+fB/+3zgCM7NxjMth5ofyDAxapd4dJV3e25SOIGyn0=;
        b=Y/6wJY0g90sJJRhHfXReCRkDE8Zu8xxsW6fi/G7aJR9ioxeArVMGwIaOZqGGVtZYRE
         CulHGHoXk/r2N5Tsw88eeVXZTyAJPgJl607H0Q8FljN7+b3mgXjCqnwO+v5Qx261IhEn
         L1uL6CAN9gH8RahFf4CYhWS5cyfHjpBkqR6QiPXw/6U4dQnwmo4fgpv/93Oqv+WIedj+
         03j1fTfXniF6t9zv8UJsZDUrYipmADNzDXqWJEmfVPtrWUW4ZW3KVbKDIDBAkb5REj+l
         C5GVstmErhmFmh5WE2wDdBbqlyB4O2BzPUBzRHW2kbl5ZBPGBIc40km6qp14USUfYa8Q
         8fjg==
X-Forwarded-Encrypted: i=1; AL+hErGYJwrW2aumTfQdLZRtYexMEfkSDAhmg1LlLzcYdVyibLIXPtlOBEunZyDdK60wxu3STFQDEMq9JSr+@vger.kernel.org
X-Gm-Message-State: APuU4Z/r9yuJMd1uwObXHpwoBJi+yTnTj0GqK1X+gqDVt+W1JJ6LEHsz
	FPnY3/XzmfM0lgYjYnbRJGSEYBT2KkNIMmiKojtFH877AHn/tLQvREHWp/fGygAS69A=
X-Gm-Gg: AYBFou2G3Gkt7hXjMzvrwX5bWdxOVukuCnCkhZAryzC1llS4brSTjpbQpS0Zk2bXd5h
	hTB5DunnccKHufFY0iN3gjGBOzqJ9Fuk1yrNx1cENn7z19CKut0kHDfAlbKXo9xOc1VDx5nrzQA
	PaVEs0b/0eFq/Bqpd3I65rcRjiDMN+m0wgAxCCPGx6LaldpYzU+55IS2icjXijvLz5TaRvxJMY3
	KcXMq8xYrpNPbtzX/+p8XdRqMuE+mIk94vrNz+GUJdj2vkVeImtrUqkS6RPpDYbjXbHe6IxtojK
	HPT+Lzah2wZcf8PR5Qzt+l5Sty/cDUGlOlhnk1KInvgMRaSQ/4a33fN81Ay4fhysvlpU2VHe2G/
	Y6IW+gsUZNHTk+JlNaUMFK0umtIIP6N3SKLLdP+r62KyTPaL1Dpl+unJADCL6dz+bPYQXDpzKZ0
	yFe7kQxqN5WWrE4rbPmMn83UCjzdyLjb4LDXgyowrUzC3LzSJVvWnMAkkiheNn6C47A2w3LnzXi
	Ej+rtNFPYmq49XrZkcvrzzo3i6IpY352l63ydfIqdzZoC3lY1UjROb3dQcCI++En2IF0WRHBnUC
	iMnwzF4HCLgkYJmXO+dJsgtBr1IZ5LSCm3ipqgPL2gs=
X-Received: by 2002:adf:e19b:0:b0:498:b92a:2f7 with SMTP id ffacd0b85a97d-49c71d49040mr6762889f8f.30.1794595133762;
        Fri, 13 Nov 2026 10:38:53 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:29 +0100
Subject: [PATCH RFC 15/23] ASoC: qcom: lpass: allocate LPM buffer memory to
 DAIs
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
Message-Id: <20261113-topic-sm8650-el2-v1-15-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13010;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gWz/GkhE/wFLqkiHW5rRxhQg0uwe4tBnjLj5sOHaHrQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91klQDgcb8lgV2D9XmRJ2nG4O+mslZwXc0voWgts
 k2zKdNKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZJQAKCRB33NvayMhJ0YsLD/
 9Lu935tBPx3m9w1khGDO6MoDWG94vw90VKShraCttAqQHMdi1IM1ftOZp5ardSFlWqhTqyawejWRZV
 lDofwZHr+tWpy3BeEY5mamGhOrRrra532GeMSipmu41NkP1uNMiTGCwZRF7OSqVZPQfhAfnjU0d5fk
 MErnt2dmfYnlOt4jBoEEK841LswTzJIPJqvoVepulDYi0Drf3EVcexP0h+ELmGH+eIIbBuIT939GSo
 z9exV1DZkJeRmJUyqEp58VXbLA1yCqdl1CxcrL6gaLLcZDQvHxSUk+SIf0FuyrMdzLMYyiTM4G6ejI
 6AokjvJkLmL6t7cIwpOo5DmTwTyUT5VTlCmdfn7PN+pJXh6GmNk4/pjFrb5fp4ED8Orf+Ecd+mr+XG
 G/k/FRK9mxLnSzYOFz+my6kw5gPjNJYpOoh4UFYqt2z3U+5AUb1QA1pSM4uCzifecIjWzEce82Fbty
 LjRK48M+vD+GIvZ5bjtJY7SBjEbNhu6KDMFlyATA106jGrXI/LUjcmOajotos9hcovwFGV1fMh46PT
 UCVxLDr1/7WWoOVeSIu65K95967aTBLarPT+GVL7mAeDCLz9zgu6tha8WswJOzophiB088Hon1lRtK
 OJd1OaJiIBdocQ7EdT6zyk/u1fU3zDAGXAFo2UZBnirdrvztXjgYlVq0lZAg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When using MI2S on non-core LPAIFs, the hardware can only
fetch data from the LPM buffers and not from DDR memory,
allocate the DMA buffers in each LPM memory for all users
and drop the static allocation.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c      |  27 ++++---
 sound/soc/qcom/lpass-platform.c | 152 ++++++++++++++++++++++++++++++++++++----
 sound/soc/qcom/lpass.h          |   9 +++
 3 files changed, 165 insertions(+), 23 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 9ebbc422c63c..4bbcd59ebd60 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1258,16 +1258,6 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
 			return ret;
 		}
-
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
-		if (!res)
-			return -EINVAL;
-		drvdata->rxtx_cdc_dma_lpm_buf = res->start;
-
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-va-cdc-dma-lpm");
-		if (!res)
-			return -EINVAL;
-		drvdata->va_cdc_dma_lpm_buf = res->start;
 	}
 
 	if (variant->mi2s_desc) {
@@ -1281,6 +1271,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 						   variant->mi2s_desc[i].reg_name);
 			if (ret)
 				return ret;
+
+			if (variant->mi2s_desc[i].lpm_type != LPASS_LPM_NONE)
+				drvdata->mi2s_lpm_enable = true;
 		}
 	} else {
 		drvdata->num_lpaif = 1;
@@ -1290,6 +1283,20 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (drvdata->codec_dma_enable || drvdata->mi2s_lpm_enable) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
+		if (!res)
+			return -EINVAL;
+		drvdata->rxtx_cdc_dma_lpm_buf = res->start;
+		drvdata->rxtx_cdc_dma_lpm_size = resource_size(res);
+
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-va-cdc-dma-lpm");
+		if (!res)
+			return -EINVAL;
+		drvdata->va_cdc_dma_lpm_buf = res->start;
+		drvdata->va_cdc_dma_lpm_size = resource_size(res);
+	}
+
 	if (drvdata->hdmi_port_enable) {
 		drvdata->hdmiif = devm_platform_ioremap_resource_byname(pdev, "lpass-hdmiif");
 		if (IS_ERR(drvdata->hdmiif))
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index a953db262aa0..75d2c872f512 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -49,6 +49,31 @@ static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
 	.fifo_size		=	0,
 };
 
+/* MI2S ports with their DMA buffer in a LPM block */
+static const struct snd_pcm_hardware lpass_platform_lpm_mi2s_hardware = {
+	.info			=	SNDRV_PCM_INFO_MMAP |
+					SNDRV_PCM_INFO_MMAP_VALID |
+					SNDRV_PCM_INFO_INTERLEAVED |
+					SNDRV_PCM_INFO_PAUSE |
+					SNDRV_PCM_INFO_RESUME,
+	.formats		=	SNDRV_PCM_FMTBIT_S16 |
+					SNDRV_PCM_FMTBIT_S24 |
+					SNDRV_PCM_FMTBIT_S32,
+	.rates			=	SNDRV_PCM_RATE_8000_192000,
+	.rate_min		=	8000,
+	.rate_max		=	192000,
+	.channels_min		=	1,
+	.channels_max		=	8,
+	.buffer_bytes_max	=	LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE,
+	.period_bytes_max	=	LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE /
+						LPASS_PLATFORM_PERIODS,
+	.period_bytes_min	=	LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE /
+						LPASS_PLATFORM_PERIODS,
+	.periods_min		=	LPASS_PLATFORM_PERIODS,
+	.periods_max		=	LPASS_PLATFORM_PERIODS,
+	.fifo_size		=	0,
+};
+
 static const struct snd_pcm_hardware lpass_platform_rxtx_hardware = {
 	.info			=	SNDRV_PCM_INFO_MMAP |
 					SNDRV_PCM_INFO_MMAP_VALID |
@@ -312,6 +337,13 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 			dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n", ret);
 			return ret;
 		}
+		if (is_lpm_mi2s_port(drvdata, dai_id)) {
+			snd_soc_set_runtime_hwparams(substream,
+						     &lpass_platform_lpm_mi2s_hardware);
+			runtime->dma_bytes = lpass_platform_lpm_mi2s_hardware.buffer_bytes_max;
+			snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+			break;
+		}
 		snd_soc_set_runtime_hwparams(substream, &lpass_platform_pcm_hardware);
 		runtime->dma_bytes = lpass_platform_pcm_hardware.buffer_bytes_max;
 		break;
@@ -1047,9 +1079,10 @@ static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	unsigned int dai_id = cpu_dai->driver->id;
 
-	if (is_cdc_dma_port(dai_id))
+	if (is_cdc_dma_port(dai_id) || is_lpm_mi2s_port(drvdata, dai_id))
 		return lpass_platform_cdc_dma_mmap(substream, vma);
 
 	return snd_pcm_lib_default_mmap(substream, vma);
@@ -1315,23 +1348,55 @@ static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *comp
 	switch (dai_id) {
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
-		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + drvdata->va_lpm_offset;
 		break;
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
 		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
-		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf +
+				drvdata->va_lpm_offset + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
 		break;
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
-		buf->addr = drvdata->va_cdc_dma_lpm_buf;
+		buf->addr = drvdata->va_cdc_dma_lpm_buf + drvdata->va_lpm_offset;
 		break;
 	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
 		buf->bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
-		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + drvdata->wsa_lpm_offset;
 		break;
 	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
 		buf->bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
-		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 3;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf +
+				drvdata->wsa_lpm_offset + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
+		break;
+	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		if (is_lpm_mi2s_port(drvdata, dai_id)) {
+			unsigned int port_id = mi2s_port_id(dai_id);
+
+			buf->bytes = lpass_platform_lpm_mi2s_hardware.buffer_bytes_max;
+			switch (drvdata->mi2s_lpm[port_id]) {
+			case LPASS_RXTX_CDC_LPM:
+				if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
+					buf->addr = drvdata->rxtx_cdc_dma_lpm_buf +
+						    drvdata->mi2s_lpm_offset[port_id];
+				else
+					buf->addr = drvdata->rxtx_cdc_dma_lpm_buf +
+						    drvdata->mi2s_lpm_offset[port_id] +
+						    LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
+				break;
+			case LPASS_VA_CDC_LPM:
+				if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
+					buf->addr = drvdata->va_cdc_dma_lpm_buf +
+						    drvdata->mi2s_lpm_offset[port_id];
+				else
+					buf->addr = drvdata->va_cdc_dma_lpm_buf +
+						    drvdata->mi2s_lpm_offset[port_id] +
+						    LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
+				break;
+			default:
+				break;
+			}
+		}
 		break;
 	default:
 		break;
@@ -1347,15 +1412,12 @@ static int lpass_platform_pcm_new(struct snd_soc_component *component,
 {
 	struct snd_pcm *pcm = soc_runtime->pcm;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	unsigned int dai_id = cpu_dai->driver->id;
 
 	size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
 
-	/*
-	 * Lpass codec dma can access only lpass lpm hardware memory.
-	 * ioremap is for HLOS to access hardware memory.
-	 */
-	if (is_cdc_dma_port(dai_id))
+	if (is_cdc_dma_port(dai_id) || is_lpm_mi2s_port(drvdata, dai_id))
 		return lpass_platform_prealloc_cdc_dma_buffer(component, pcm, dai_id);
 
 	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_NONCOHERENT,
@@ -1417,6 +1479,7 @@ static int lpass_platform_copy(struct snd_soc_component *component,
 			       unsigned long pos, struct iov_iter *buf,
 			       unsigned long bytes)
 {
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
@@ -1427,7 +1490,7 @@ static int lpass_platform_copy(struct snd_soc_component *component,
 				channel * (rt->dma_bytes / rt->channels));
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		if (is_cdc_dma_port(dai_id)) {
+		if (is_cdc_dma_port(dai_id) || is_lpm_mi2s_port(drvdata, dai_id)) {
 			if (copy_from_iter_toio(dma_buf, bytes, buf) != bytes)
 				ret = -EFAULT;
 		} else {
@@ -1435,7 +1498,7 @@ static int lpass_platform_copy(struct snd_soc_component *component,
 				ret = -EFAULT;
 		}
 	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		if (is_cdc_dma_port(dai_id)) {
+		if (is_cdc_dma_port(dai_id) || is_lpm_mi2s_port(drvdata, dai_id)) {
 			if (copy_to_iter_fromio(dma_buf, bytes, buf) != bytes)
 				ret = -EFAULT;
 		} else {
@@ -1464,6 +1527,64 @@ static const struct snd_soc_component_driver lpass_component_driver = {
 
 };
 
+static int lpass_platform_allocate_lpm(struct lpass_data *drvdata)
+{
+	u32 rxtx_cdc_dma_lpm_remain = drvdata->rxtx_cdc_dma_lpm_size;
+	u32 va_cdc_dma_lpm_remain = drvdata->va_cdc_dma_lpm_size;
+	u32 rxtx_cdc_dma_lpm_offset = 0;
+	u32 va_cdc_dma_lpm_offset = 0;
+	int port_id;
+
+	if (drvdata->codec_dma_enable) {
+		drvdata->rxtx_lpm_offset = rxtx_cdc_dma_lpm_offset;
+		rxtx_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+		rxtx_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+
+		drvdata->va_lpm_offset = va_cdc_dma_lpm_offset;
+		va_cdc_dma_lpm_offset += LPASS_VA_CDC_DMA_LPM_BUFF_SIZE;
+		va_cdc_dma_lpm_remain -= LPASS_VA_CDC_DMA_LPM_BUFF_SIZE;
+
+		if (drvdata->wsa_enable) {
+			drvdata->wsa_lpm_offset = rxtx_cdc_dma_lpm_offset;
+			rxtx_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+			rxtx_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+		}
+	}
+
+	if (!drvdata->mi2s_lpm_enable)
+		return 0;
+
+	for (port_id = 0; port_id < LPASS_MAX_MI2S_PORTS; port_id++) {
+		if (!test_bit(port_id, &drvdata->lpaif_port_enable))
+			continue;
+
+		switch (drvdata->mi2s_lpm[port_id]) {
+		case LPASS_RXTX_CDC_LPM:
+			if (rxtx_cdc_dma_lpm_remain < LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE)
+				return -EINVAL;
+			drvdata->mi2s_lpm_offset[port_id] = rxtx_cdc_dma_lpm_offset;
+			rxtx_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+			rxtx_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+			break;
+		case LPASS_VA_CDC_LPM:
+			/*
+			 * VA Codec uses 12KiB, but MI2S uses 8KiB
+			 * Meaning only VA _or_ a single MI2S can be enabled
+			 */
+			if (va_cdc_dma_lpm_remain < LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE)
+				return -EINVAL;
+			drvdata->mi2s_lpm_offset[port_id] = va_cdc_dma_lpm_offset;
+			va_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+			va_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int lpass_platform_init_lpaif(struct platform_device *pdev, int idx,
 				     const char *irq_name, unsigned long irqflags)
 {
@@ -1629,6 +1750,11 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 			return ret;
 		}
 	}
+
+	ret = lpass_platform_allocate_lpm(drvdata);
+	if (ret)
+		return ret;
+
 	return devm_snd_soc_register_component(&pdev->dev,
 			&lpass_component_driver, NULL, 0);
 }
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 71f1274dfa89..8f361f2808ca 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -196,6 +196,7 @@ struct lpass_data {
 	int hdmi_port_enable;
 	int codec_dma_enable;
 	int wsa_enable;
+	int mi2s_lpm_enable;
 
 	/* LPAIF instances, 0 is the core "lpass-lpaif" one */
 	struct lpass_lpaif lpaif[LPASS_MAX_LPAIF];
@@ -214,7 +215,15 @@ struct lpass_data {
 	void __iomem *wsa_lpaif;
 
 	u32 rxtx_cdc_dma_lpm_buf;
+	u32 rxtx_cdc_dma_lpm_size;
 	u32 va_cdc_dma_lpm_buf;
+	u32 va_cdc_dma_lpm_size;
+
+	/* LPM buffer assignment */
+	u32 rxtx_lpm_offset;
+	u32 va_lpm_offset;
+	u32 wsa_lpm_offset;
+	u32 mi2s_lpm_offset[LPASS_MAX_MI2S_PORTS];
 
 	/* regmap backed by the low-power audio interface (LPAIF) registers */
 	struct regmap *hdmiif_map;

-- 
2.34.1

