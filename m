Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541551;
	b=FyCVnS4GuT0KN/ffSjNwOPazR4I3530AGVgEBNA7FRAM6EwcGJEn2Hg4QQzqFZJvcHnq
	 c4Tu8Z7x0IglyHXTbia9oVDoOW6rj4YReAd4bTpdIzbidJucZi8Tn1j+3eGvBrxExgSc4
	 JUkqflcXgaPqr2yV6hlINphFBiqiSh969oVP3YZFymbuUE+2SBmr7RZeHs2W1T2BYB9HP
	 E4xc0PYxcJL32fNwobcSipuXu89KE9rScDJtw+ofS9rxnKMc3ti2uY7z1a/HjSPn+vv0T
	 ydpgLL3BQ0/8XJTxofefgxGU/TYOafpe9LrgenUiLPaBeCcyJCudSBpSoo2pO42CNfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pU00y6ZXZp2/m5IiYMuEoa3EZ2Cw1dtKHvVqjAksugM=;
	b=eN4omwolqW4udAXb9m4qi3vhrL+OfgBU17Wt7m9pQeyNRfV+94Tu+Wt4hfE05yVphzeo
	 GKmp+u0hnqI9yyT2QZYOxyqBkziPWc8hVWs5FIxQwcQPXpku/KBQt7cVyVeO5M+JpbS1K
	 C9pdJZx01bTz8G+K6DpOAEIooVuZCA5fTTbgsaXFF506v64wY+zUcFulwVpAr3Y1gAgvM
	 qrEf30A86VF9KJSRuHqNoTqsO0f4MNk3Bg6KsL09estZ7E7l8MdGhIkAcAyFf9JXxmOc2
	 ZyJWkOClTHuN2tJ/z/NcFJSlM3TK/C2CFjLOf54qU2J0SGde4juTpBmGkjBNrq3MxOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=heL6dhLB;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3629B60A3832
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3629B60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=heL6dhLB
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so52150005e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541549; x=1796146349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pU00y6ZXZp2/m5IiYMuEoa3EZ2Cw1dtKHvVqjAksugM=;
        b=heL6dhLBV30oQLs6IScxNS6fxElAjmMQ2TelZxoDDddeyDjNOAvnR+SOUd580Y7lky
         ZHoVEWpgeJXiNECgtAuPimCmgJbhbu9qXwDo4uzt34VcpxySd8RTcdSIQZU2d+d+/WO9
         SdanlT65jNu1s1BghMJwEE0e3pcNLcpw11MBxI0bq7BlbNs5rvkhy2Q49glsGST77AoL
         lIxymqjyAew/qIF0q+3baNTfEa5TnlC2VdXd1F5VEZB0Ruh3V1/yYqleiqrO9R3aCCJL
         NNCWstAL/pR5d88j+7k4iyzx6PykppSv26VPbDQhvItCfS+NICtfG19EbvjrejMbrePO
         EAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541549; x=1796146349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pU00y6ZXZp2/m5IiYMuEoa3EZ2Cw1dtKHvVqjAksugM=;
        b=W0nS3JRprxcvj66OniPhfKOALkKHPaiSaMRoWSaJvBHPMs+nhVT6KhI6fBhpy/KuA6
         0gGZTdmwQ8Hi3Ynn39WQwEdWF/VXtsvMTP0n5+Ir4ajNoCNkdcs4c01FcdPvlONc7hbu
         9c7LBEsiRcK8+zc92PwzZFMSk9w+X4dsAoyUelEG0InDADnrG3D3IZhFSjZxazhCIJRD
         qRZ8gSjggpttLc4PWZW537bBdm31N2yudhBQ11S73OquNubSpPWqd+brvvFoXW68JBRN
         7OmOHrQgMeD2kX3H8OrjTCrI2HqfJBvsml83I6JM94eg9q3gAxd138gEq62Bire48FXc
         XgBQ==
X-Forwarded-Encrypted: i=1; AL+hErHuPAybHg0PPV0hBeVfKsKpMB7xNt2Gmf7U0kn5d3kKw51p0hmpZhLZtdOXvu1cpTWnoNiUZfWBrWST@vger.kernel.org
X-Gm-Message-State: APuU4Z/RSbmPsCZgsfdTM5Ta2/e1NSixqV9uZtNCfGgPK3VGLG8NJR6b
	cDCKUV4uFjoNoxAcZcvndwhMSE/ADWpyLQReweSyls43GWLwxhf/TS0BMOlFZ4YYoW4=
X-Gm-Gg: AZFdTZebbawFKsdjENIR7VRXJegtTe7S2/fV8+rW3o1NCa8EU9fw73aprkZWYXUvVpv
	noKKEO5sJeB5kKIf77LXfyUKr4Y95ecOMLYSuDfvg+c69iYM8qqIZRTW9QnX6pA3mmLnQTB5C4Q
	0stneKMFmUKIcIAdwamx1MvmHALPqG6mzREB3xGbX1Im5StmZLANRp9ryMa6IA3I02Cd9E/lEjT
	S76y26QCjfg6PmFLJOdb9+MyYIh3FD56xowxqeDCqRh2+HtjxQy+5ZOJ/JY5/AMfK0KJn4klouW
	SM4cx7cIgaRmzHAiy2SE7zBNLnsN/NR3Awn1I3llgK9a3x/7EkefULg3NOGgLTnLAc+slh0JU9u
	MSHstKFS1t/PETQRRCpBYswVdqNhFxn2VZcyAWZetcFYHmsWouUeJRRsMUuXrkgz/TX45gXMaJw
	s6AZrUQr24zC2x4N3cB1GKqwocnezEjceBUJ0YPQQPtYUb0oSBXwbA3e5jjBLhaqeaTIQiVUSkv
	008l4B7USkE1Pbg5igjcg7Dh0LMRW7c1oj+ifgryawRAZAuOwwQ77HJnpF4IyuadoTBa292HE7Y
	+8mDt1xIvjGq7Jfa/7yyPVpEVZvH7LTaMp1UVjokA1r2gNtDStc0hgFtASqx9UqbsEh0ToE=
X-Received: by 2002:a05:600c:5309:b0:4bb:62d5:4ab1 with SMTP id 5b1f17b1804b1-4bb88924a5bmr317178735e9.33.1795541549464;
        Tue, 24 Nov 2026 09:32:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:17 +0100
Subject: [PATCH v2 10/19] ASoC: qcom: lpass-cdc-dma: add support for WSA
 codec DMA
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
Message-Id: <20261124-topic-sm8650-el2-v2-10-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4127;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/ovRO+UOcxnf5QLSf5azXxbgOEDV96r9W1Eg013mBDQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoe5XukASQd1VCjYbbtVK5pheqbpQg8+xwCqjoI
 Z+v+rO6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKHgAKCRB33NvayMhJ0VkwD/
 4wLCUu25+Z8iJE3ri48np5iGr4kjd12D0sb/mZFuL5hLSEY8B+w8zjpyw7o9TSLNzOvmiRAnPXEegs
 WPiO7Mi7SP0RZhTtwp185T0oGgxgToU7aixbiTjzeenlsmKRR7tIAudhXDlIWLGc4o6OrpYDDoLPlP
 RVYxAU5IiYKJjqJzFXbGSFwmO7DJ8jLtxdSLMxfQDMsDDRYE9rHe2QcUmvdYobB7MWU2LBcmu67F42
 wsxldxEESQ1NDHcDjZTKBCoXOjxH/RQaI8FW1dv8ChKjjgbH5imY7zm5R8X07x12dEwiiVT5wGHQSg
 RicY7M3DqcWcNMCEvQueWoBsNxzmNx5z+cDz7diKGkTm5QPBYOGKMFPdVXOYXB4ltxs44eJXvebvBn
 W91YeusHC4iXqOdiAi3uFBGGoyCyMqolGJyjvORAY2mWuEzl8Bk7VqdmqpL0iOWKTqTLHSUCTH9yY7
 qUYcVEAaeKl14zUuL2KFTDECm70YKXQXh6A+W0TC2aT/c22aqj16Os1KkMG+Vt0QAcSC3pqYyi0ho/
 4WU/SRdSGom0gX8bRsE1kSSXmz3cD7q1es6iHKEfHhuh/SzKMUb+La8KvlDBHUDuqlMEaVpJvb7DHl
 CXbd+Y5+bRxc5JeWG6q+nUN6z8pJKcE4cltISV1Wo+ibrk0GO8IQSLB8Q3HQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the plumbing for the WSA interface in the lpass codec
DMA driver.

The WSA interface uses the same LPM buffer as RXTX and
need to enable more LPM codec mem clocks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cdc-dma.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
index 2dc8c75c4bf0..d7f85a4f9d99 100644
--- a/sound/soc/qcom/lpass-cdc-dma.c
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -54,6 +54,14 @@ static void __lpass_get_dmactl_handle(struct snd_pcm_substream *substream, struc
 		*dmactl = drvdata->va_wr_dmactl;
 		*id = pcm_data->dma_ch - v->va_wrdma_channel_start;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		*dmactl = drvdata->wsa_rd_dmactl;
+		*id = pcm_data->dma_ch;
+		break;
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		*dmactl = drvdata->wsa_wr_dmactl;
+		*id = pcm_data->dma_ch - v->wsa_wrdma_channel_start;
+		break;
 	default:
 		dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %d\n", dai_id);
 		break;
@@ -68,49 +76,68 @@ static int __lpass_get_codec_dma_intf_type(int dai_id)
 	case LPASS_CDC_DMA_RX0:
 	case LPASS_CDC_DMA_TX0:
 	case LPASS_CDC_DMA_VA_TX0:
+	case LPASS_CDC_DMA_WSA_TX0:
+	case LPASS_CDC_DMA_WSA_RX0:
 		ret = LPASS_CDC_DMA_INTERFACE1;
 		break;
 	case LPASS_CDC_DMA_RX1:
 	case LPASS_CDC_DMA_TX1:
 	case LPASS_CDC_DMA_VA_TX1:
+	case LPASS_CDC_DMA_WSA_RX1:
+	case LPASS_CDC_DMA_WSA_TX1:
 		ret = LPASS_CDC_DMA_INTERFACE2;
 		break;
 	case LPASS_CDC_DMA_RX2:
 	case LPASS_CDC_DMA_TX2:
 	case LPASS_CDC_DMA_VA_TX2:
+	case LPASS_CDC_DMA_WSA_RX2:
+	case LPASS_CDC_DMA_WSA_TX2:
 		ret = LPASS_CDC_DMA_INTERFACE3;
 		break;
 	case LPASS_CDC_DMA_RX3:
 	case LPASS_CDC_DMA_TX3:
 	case LPASS_CDC_DMA_VA_TX3:
+	case LPASS_CDC_DMA_WSA_RX3:
+	case LPASS_CDC_DMA_WSA_TX3:
 		ret = LPASS_CDC_DMA_INTERFACE4;
 		break;
 	case LPASS_CDC_DMA_RX4:
 	case LPASS_CDC_DMA_TX4:
 	case LPASS_CDC_DMA_VA_TX4:
+	case LPASS_CDC_DMA_WSA_RX4:
+	case LPASS_CDC_DMA_WSA_TX4:
 		ret = LPASS_CDC_DMA_INTERFACE5;
 		break;
 	case LPASS_CDC_DMA_RX5:
 	case LPASS_CDC_DMA_TX5:
 	case LPASS_CDC_DMA_VA_TX5:
+	case LPASS_CDC_DMA_WSA_RX5:
+	case LPASS_CDC_DMA_WSA_TX5:
 		ret = LPASS_CDC_DMA_INTERFACE6;
 		break;
 	case LPASS_CDC_DMA_RX6:
 	case LPASS_CDC_DMA_TX6:
 	case LPASS_CDC_DMA_VA_TX6:
+	case LPASS_CDC_DMA_WSA_RX6:
+	case LPASS_CDC_DMA_WSA_TX6:
 		ret = LPASS_CDC_DMA_INTERFACE7;
 		break;
 	case LPASS_CDC_DMA_RX7:
 	case LPASS_CDC_DMA_TX7:
 	case LPASS_CDC_DMA_VA_TX7:
+	case LPASS_CDC_DMA_WSA_RX7:
+	case LPASS_CDC_DMA_WSA_TX7:
 		ret = LPASS_CDC_DMA_INTERFACE8;
 		break;
 	case LPASS_CDC_DMA_RX8:
 	case LPASS_CDC_DMA_TX8:
 	case LPASS_CDC_DMA_VA_TX8:
+	case LPASS_CDC_DMA_WSA_RX8:
+	case LPASS_CDC_DMA_WSA_TX8:
 		ret = LPASS_CDC_DMA_INTERFACE9;
 		break;
 	case LPASS_CDC_DMA_RX9:
+	case LPASS_CDC_DMA_WSA_RX9:
 		ret  = LPASS_CDC_DMA_INTERFACE10;
 		break;
 	default:
@@ -184,6 +211,11 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
 		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
 		clk_prepare_enable(drvdata->va_mem0);
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);
+		clk_prepare_enable(drvdata->codec_mem1);
+		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
 		break;
@@ -205,6 +237,10 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
 		clk_disable_unprepare(drvdata->va_mem0);
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		clk_disable_unprepare(drvdata->codec_mem1);
+		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
 		break;

-- 
2.34.1

