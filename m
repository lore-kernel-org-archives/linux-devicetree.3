Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595137;
	b=OOjd9Jk5cvaEicLsSC2UAQ+5cT8F71cn7sacDr2lnE3p288X+Grpabw3gGR3RCj1qxBb
	 3peRBL1OIAv7ISyllWvyT2+3TuDiWkXqufCgQQI1ZMvZw122wbXgsSSss62eTLFtXr1Qe
	 6MpCq3/JmJA8lknzuo5rcyb3P+vA3PJO3yoWkdDECBPcFxpCcdX8ViNz5y1GvVL3SBlxF
	 5LMQggHCFqdYwslv3GNJBFJvt6G0ORd8HuLHe+YXyTRl73a8EfkeJZhqfDhrfUbCcaWxq
	 5z87O8L3WJMbxy15SMAy+Bz1aBEtcCAr82pYoXlxHLT1gezvQ4NzpRHRjO4LjLduCfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Sb8DFUlQmjU4/qyO564x84mS41rxyPwR0Mfj0gP/tZw=;
	b=sPPXHejz6HpV744puY136cTJxtbk6JVPGGVbKtvqBCkAMkQFEv2XDNrjtReBHbxf+rN0
	 cXMvBO+zFfcbL2qLEHA/1eaCPpYPc/G3fG5vP10afSJbChRylg6rDsx4UFHlw13DsV9Iu
	 s0HRceUuvFOP7g2C5KqjEyQQ9CEt0C5pn2H/sdZZjDofslkAblkLq5m+ZPAmHTPMbmBRG
	 3stqaWUDKLF6vuLNNQC6lccNxT1Egn6wB2f2v/unPJTo7LXspOlf0rv9VGEUX/xevPsJE
	 LLUv2EzKD0R0Csa8cckt44+Kwjx3MbYhnfn2C+pFUXWJjgoumY36ZWQyzCQUAoiDB7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eiUsTeut;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6E760A6F7E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6E760A6F7E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eiUsTeut
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so22553115e9.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595135; x=1795199935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sb8DFUlQmjU4/qyO564x84mS41rxyPwR0Mfj0gP/tZw=;
        b=eiUsTeutoRfpVR1lc/Pw48S2P71aatiA0ngKcd+0b5MN47x6T3HvUqzvXy2jtB6aXO
         t6gVgna/wmI9V5micVVXfdeJIFElzu/8pQOhpa9C1O1Q9sazBbIUMLV0NbgFCssQRg2f
         +BdYSUNGJm1MWi7wJFg6sBPod3Pc7haav6183CjCgIugFfcDI6EeBZIS7do2cQ1iLUzJ
         9nJ/K2jXrfrRS7g+iODf+Ub+SetcRsDckrPaDWQK8A6h6FBlx6vxbxWtYvpfn4FMcuxS
         HAQ8H6WT6slVm9aOsq8jFz8Y8FFWBNwbVB0SVkzoAo0AkPsT2ew3UG3C6RYyRQJQhbn6
         2H7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595135; x=1795199935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sb8DFUlQmjU4/qyO564x84mS41rxyPwR0Mfj0gP/tZw=;
        b=lFmLB5sNcBxWTpdpfOWduHOQbkfAbdm1eSAvPnwHSrU+zPxk27/M8V2PzlThgEvvur
         H/dhucbw8V0IsQDtQMUUUU2IXjZpV0FvMD3WmVQ3e4PQvLuAY5Fkafu4vB0NYnp/8qUI
         jZJKzv/+wPWIH6cHZpu2wDOcYdHynZIzQk88BHK3ZkfBYqvEzpLSVGLTQxqNUn820VAM
         amkBkVegnxUd4xcdXyNjonWxzPmSexb675X0dWEpvCrEJUnB5BjlK7+uYAc2B9hOy7Pt
         Y4SIzeDnnG2B5d6XzXquUgwoidcVtkfTttwPhz+YVhUSM15TJ/3vMliuBMqAenVvAjGY
         dsDQ==
X-Forwarded-Encrypted: i=1; AL+hErH+GaHQvXeNWGuwe5TUtM/18b01rVAFA/KoT+j6KOf8kRskuDxwHp2Nxd15LX6K0shTvPVxAwLst9TC@vger.kernel.org
X-Gm-Message-State: APuU4Z8onEBDeR84EMINKEKY5XT2NjjXnwabBkiC1TZXdM/xfjrL0jg5
	IaKsdkSCMHLs11ruHyxXt7+jt+egexs6Oq8L/SMcgug+3gmAmY3JHfkglu/8FsSPZ4k=
X-Gm-Gg: AYBFou3woLoN59vCdoQVDwpweDnuPx+17Eo/8gAfSl6iIcN1HI0faOJiSRYOLXllKWl
	rRsG+pX50+zOaJs3JQj4MNb8JQ8ipUqRzVkWxeT09MXzu1AUH3CNeR5YJbX1bkAYBvOxf+sxS+s
	vnYFc44FJcldKjN3s8MFzKWogZVyfVd85RfX/8I721VnHGCu57ck/OXwFkb9CADbUj15ojrKTpe
	wX+jLatmA5BCc0y2/wfFkMnFUaqnX44wjgBYuM3xTsdismZNGDm9kL67NM30GOtCjM+KHmvYQS9
	ub95BYNLYzbJXPiBcBUUBBMYAOH5UQoNfYTMg/iVjJC8jgS2nGR9LnLYROqYyI8iop3kB6t40VI
	+VR1g2k5Gb2CId/GNGvF8pztX9cFxJLm0RyoOWIidc+SnX5IkWsPt1Sh/oxjDTyGcsapf9jlZw1
	orWTYCKZ9yilV0HqUhq0T5Pd4fU+7NgpGTXsBbiS3KA2ee8VlIts3jehu9pzpNd1gdrIg+RbLKM
	1n0Lp9uzuoJVCIdRn5ZLu6oydmOarjnbmm1S1JgeJS9HJexgXuyiMUst2PiifenUxe7adpcH7LS
	pAQwnqSzbk/C/VlXtfBm2zFI6Cb+5kcfYroqTxARAns=
X-Received: by 2002:a05:600c:1d03:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb55a58e1amr81333845e9.20.1794595134798;
        Fri, 13 Nov 2026 10:38:54 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:30 +0100
Subject: [PATCH RFC 16/23] ASoC: qcom: lpass: enable the right codec_mem
 clock when usin LPM memory
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
Message-Id: <20261113-topic-sm8650-el2-v1-16-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6102;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1PHrl1bnC9gePFMj/aP2+K6qk5z6zGw3NPDjiSd89LQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kl4HiUZEUqVZs17X1D9Ch8npT+ibOhQ5bYsD3p
 eWJXtDeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZJQAKCRB33NvayMhJ0cxuD/
 wJGCu68fEr4YqXdOSSu6ZoUm9h5JAml/m0e+4lFR5ssuqrerSPWr5sJSK1Ruqi1pGunyz2h0JIeNKC
 Vg2VNcx59QRTzGIn4+wdstUNwk2vlejLolqmNC0eXDxR3qPcMso1zuJxYxKgbUM0UxH2FdsZSQXc44
 XTDKf9v3WBs+clRK/Fhb2wgA0is87XBzdw1DlX9fOXWYgCb0vwyNHAK/m6QfVkeXezJjv0TNDGVprc
 fHQVw8rzNNXbkupSL45b4WyYeQy1TIJOTqUGTVVJTm5SMpuUq0yBelZ7fxcVZPqy/fw8Nv5BSGjZ2U
 gmyY54OU+3dhLZ6l0sh9EI4cv+dDKVCzh8mWHBfIvtXbByDdbKhMwR6ZOn6L7sTlJa74mmeuZD/2Si
 ikxQCBEbjmjUrqsXbD/8UuYu7uPZn3bXI2JW+R6CMlrBmgK8x5PhS+y++BeFR6bUQDwFf6XVYBVX4O
 mJ39DEGBPrc7+ALCCaPPZb+Qdtgrs282zS06GYIgvI9PSI+y0dxTo0HaKSuuqXfpaa3uLykFGRYHQB
 gGtytNxh9P4aEayb2v8i9YZNU1Pr9vuoKenyapqxX6nbDsTVfDwqoZkVO3T+FtU0w85ZqUqobniGgz
 oD0JpkJMJE39T2ZofYRgqMrOzdcsLiJ1sKgKEPH81dTOwZhGBMiL/hL69QiA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The LPM memory zone needs different codec_mem clock to be
enabled depending on the DMA buffer offset, add an helper
returning the right clock and add support for the MI2S
ports using a non-core LPAIF.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cdc-dma.c | 27 ++++++++++++---------------
 sound/soc/qcom/lpass-cpu.c     | 21 +++++++++++++++++++++
 sound/soc/qcom/lpass.h         | 20 ++++++++++++++++++++
 3 files changed, 53 insertions(+), 15 deletions(-)

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
index 903055e3188d..c20e0976563b 100644
--- a/sound/soc/qcom/lpass-cdc-dma.c
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -199,12 +199,14 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct clk *mem_clk;
 
 	switch (dai->id) {
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
-		clk_set_rate(drvdata->codec_mem0, CODEC_MEM_HZ_NORMAL);
-		clk_prepare_enable(drvdata->codec_mem0);
+		mem_clk = lpass_cdc_dma_mem_clk(drvdata, drvdata->rxtx_lpm_offset);
+		clk_set_rate(mem_clk, CODEC_MEM_HZ_NORMAL);
+		clk_prepare_enable(mem_clk);
 		break;
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
 		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
@@ -212,14 +214,9 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
 		break;
 	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
 	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
-		clk_set_rate(drvdata->codec_mem0, CODEC_MEM_HZ_NORMAL);	//??
-		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);	//??
-		clk_set_rate(drvdata->codec_mem2, CODEC_MEM_HZ_NORMAL);	//??
-		clk_set_rate(drvdata->codec_mem3, CODEC_MEM_HZ_NORMAL);	//??
-		clk_prepare_enable(drvdata->codec_mem0);		//??
-		clk_prepare_enable(drvdata->codec_mem1);		//??
-		clk_prepare_enable(drvdata->codec_mem2);		//??
-		clk_prepare_enable(drvdata->codec_mem3);		//??
+		mem_clk = lpass_cdc_dma_mem_clk(drvdata, drvdata->wsa_lpm_offset);
+		clk_set_rate(mem_clk, CODEC_MEM_HZ_NORMAL);
+		clk_prepare_enable(mem_clk);
 		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
@@ -233,21 +230,21 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct clk *mem_clk;
 
 	switch (dai->id) {
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
-		clk_disable_unprepare(drvdata->codec_mem0);
+		mem_clk = lpass_cdc_dma_mem_clk(drvdata, drvdata->rxtx_lpm_offset);
+		clk_disable_unprepare(mem_clk);
 		break;
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
 		clk_disable_unprepare(drvdata->va_mem0);
 		break;
 	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
 	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
-		clk_disable_unprepare(drvdata->codec_mem3);
-		clk_disable_unprepare(drvdata->codec_mem2);
-		clk_disable_unprepare(drvdata->codec_mem1);
-		clk_disable_unprepare(drvdata->codec_mem0);
+		mem_clk = lpass_cdc_dma_mem_clk(drvdata, drvdata->wsa_lpm_offset);
+		clk_disable_unprepare(mem_clk);
 		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 4bbcd59ebd60..302c31b23090 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -89,6 +89,17 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
 	unsigned int port_id = mi2s_port_id(dai->driver->id);
 	int ret;
 
+	if (is_lpm_mi2s_port(drvdata, dai->driver->id)) {
+		struct clk *mem_clk = drvdata->va_mem0;
+
+		if (drvdata->mi2s_lpm[port_id] == LPASS_RXTX_CDC_LPM)
+			mem_clk = lpass_cdc_dma_mem_clk(drvdata,
+							drvdata->mi2s_lpm_offset[port_id]);
+
+		clk_set_rate(mem_clk, LPASS_CODEC_MEM_HZ_NORMAL);
+		clk_prepare_enable(mem_clk);
+	}
+
 	ret = clk_prepare_enable(drvdata->mi2s_osr_clk[port_id]);
 	if (ret) {
 		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
@@ -133,6 +144,16 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
 	}
 
 	clk_unprepare(drvdata->mi2s_bit_clk[port_id]);
+
+	if (is_lpm_mi2s_port(drvdata, dai->driver->id)) {
+		struct clk *mem_clk = drvdata->va_mem0;
+
+		if (drvdata->mi2s_lpm[port_id] == LPASS_RXTX_CDC_LPM)
+			mem_clk = lpass_cdc_dma_mem_clk(drvdata,
+							drvdata->mi2s_lpm_offset[port_id]);
+
+		clk_disable_unprepare(mem_clk);
+	}
 }
 
 static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 8f361f2808ca..699b9a07eb5a 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -30,6 +30,8 @@
 #define LPASS_CDC_DMA_INTF_FOUR_CHANNEL		(0x0F)
 #define LPASS_CDC_DMA_INTF_SIX_CHANNEL		(0x3F)
 #define LPASS_CDC_DMA_INTF_EIGHT_CHANNEL	(0xFF)
+#define LPASS_CDC_DMA_LPM_MEM_BLK_SIZE (2 * 8 * 1024)
+#define LPASS_CODEC_MEM_HZ_NORMAL		153600000
 
 #define LPASS_ACTIVE_PDS			(4)
 #define LPASS_PROXY_PDS			(8)
@@ -291,6 +293,24 @@ static inline bool is_lpm_mi2s_port(struct lpass_data *drvdata, unsigned int dai
 	return false;
 }
 
+static inline struct clk *lpass_cdc_dma_mem_clk(struct lpass_data *drvdata, u32 offset)
+{
+	unsigned int id = offset / LPASS_CDC_DMA_LPM_MEM_BLK_SIZE;
+
+	switch (id) {
+	case 0:
+		return drvdata->codec_mem0;
+	case 1:
+		return drvdata->codec_mem1;
+	case 2:
+		return drvdata->codec_mem2;
+	case 3:
+		return drvdata->codec_mem3;
+	default:
+		return NULL;
+	}
+}
+
 /* Vairant data per each SOC */
 struct lpass_variant {
 	u32	irq_reg_base;

-- 
2.34.1

