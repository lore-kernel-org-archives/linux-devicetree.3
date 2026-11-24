Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541546;
	b=WblmE+UrXpDeYm0mB2+Hx9jWxfBZDaT7KXGvEncMpRWT1jhEddMWa34triM7xztkcp6t
	 Y6Gx9Gcy835bIdJlIN70Rd//XSHsVs/ZR8q6c2z5VaYvm6MAVax4A1LIKl1x0pPTDOQp1
	 RZeQj+yxxairiwLZ7+UZg3hRrYk+QlctHlWnLurY5jS+I3ce7FlMg2m1c7qaBg6aa6dsh
	 RQ3DkhMQjjBvbIAj4Iw6a66jcYeMsNdHSagNxSgA6KXOVUwrsl0sC+86qwy47GKCuOCNF
	 uYipw6/0fgn0MmwL/Efruw+AaFjWJOJpmEb+0ZDjH7HUpqjkXVUdTdI/TzX5RXaCVTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mElIxptdta46/R9CCcDiVZtCz+nxON/yJk/P+Rr578s=;
	b=dftbOqf2/YIXO3EuCHFD/1trqN84SFEazX1OCS4k52n6HxEtMG998j44zKb05qZdwmiS
	 zmL+2j3he37lELaBP7lGR9lH1NPTt0qaQhtlvegc/3pI6Yy343ruVu9/3nx6QlWLl8Ad9
	 Nhco71qiMsXfPpCyIgIuwAsjSxZAO32/cQ+8St66Gk1Jc4on4cA+fnL/yEUqZ/Bpx9dDI
	 Sum8wW2SspnjaGy8lPaYJmgUNNfJsI/LFmUqD7f0oy+tVWNlwMfOj3dTtqNFDpanf5FaB
	 4xBtUQWv4xcdf/brwz41InM8/p9iWE+GuQJK+hgVJ3Kyi1BDWjFETu59mBD7pXo3zmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SYGXy5Ap;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4004606A336
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4004606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SYGXy5Ap
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49a92144733so2362732f8f.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541543; x=1796146343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mElIxptdta46/R9CCcDiVZtCz+nxON/yJk/P+Rr578s=;
        b=SYGXy5Ap2u/X5/KQA7XPp07sMy5CgEguqu7FL08TXFm/hqOEQruZbw1hMZsKonEV/l
         HOJYbNxnnkiaXjP+iTfNjDb+tCtb8lgbQdlT1/bk2ppPOcgY4HXPs+bO+3wDsxDWhWvj
         /cRKaVH1hAR+hIFtV4glDO+OBWJNnMeebm8W5+O8SCZMkYZIiqkSlHqUi3SJRyCAaRPp
         hLgZlkjKz6wWatMVSQsiI/K+g7CDbHVlDU4m7f3Rw1ja3LW3xJHaotoAE+s9XGycvEiW
         nkysYRYQrV+Ed+F3/EwlLq+QkF+3oKt7Qbn9nhW+QRpJqvJN9FruCRU3crA1YArQm2j8
         AFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541543; x=1796146343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mElIxptdta46/R9CCcDiVZtCz+nxON/yJk/P+Rr578s=;
        b=tBTJN1i1QSjdeKGo2h1lSyeI9wbHmsAW6yKYvtSnh/yHzZOQrPiI0qxwpr0iDXf+z2
         1b+7Qa4O9szK6DPUEr1yWRINcu221n77k4mHyAjScfGEv6Q/REfTooGQtkcfea0DESvU
         8ONa2AEJqOVfMqW6uJyVtPjOZNZ4u0XvKZPCfsx27N/YK96bHD64f77bSVDB7PkdxW0Y
         4QwBoUrQZztomJFwPv80entUNM4MgbbA1CEmUm6ruWaQWK7u3CBPne88ydjpP5g6nhmb
         8vHDX40Js5Z2vJnIGfvVzZ7me8SxAI1fjkdqtZur17NlNDJqKRmgXCDPj4gt1pElwIdM
         MviQ==
X-Forwarded-Encrypted: i=1; AL+hErHhR14H1gcspomPyyalsCz0A8Wg697qxkUmWBRwGyCg8loZJqe7IKxCVaURYoC2JB6kSNNsoavRujqd@vger.kernel.org
X-Gm-Message-State: APuU4Z+mTlC/f/4hrgq8hMeMvJMSVAIWrs5+2zG10xIPkyjs43gNjcPh
	xCalVHJBs4WJeFSQf0EOy9vYZqXBo5H6cb0ZoYp5HQidAkSU88yKa2G9pTw0z8GvcTw=
X-Gm-Gg: AZFdTZdPmsq9EBV9rS4Kwih8tQe1EKCbmnQAf3YfvLgzVR30R3HF9UOGp+wlhnESYOE
	uQ4ef7vrr59BwmB4YE+6rnwmDbF0GBfsqrrVhEBkZCVN+rnfi3XB7kajk+iN3syOOM9EeboVgBD
	h1le7nVGBc8M6Dnwyexml1wP7qKE7J8pP8wliInz5II9n+Z190JOkZjvaPakJ5vkI03MJogQzF9
	kRE6acKG2exMHUsjadRXEWRGcpO18/lMN3YHXU/i4kf0VHR9A/lsoGjsU/lYYzIlOSscbb7CcsN
	2+t80FXhQfTBXAr3Ue/I2qr5rAqyXaFhrQ27S5AUvfMbaHxcW3tNP66YSp5HBxfIQNz1mIp4Kkj
	mPLP6OwIXozI7yUC/BUQ8mTFqxHxiLTWX+od+mwsw2H2f6ru3TAuZBnujPa2erYTZgd5cMWDa3E
	7ohU+64axsIW+PmMl7AnqC4sXsPpmu68TweE/3xiE7lCf7I4GnyjLGm6Ah6icNuVmK8Pcv2OQuX
	hv3QRNaDV69df8fIHNcJwkYVxN0ZSlWurg94N1cEtJ8InPjMM/2Tg5LpYCy2OIqPJPYhn26fP8f
	xVLY9LwBiRa9hFuxxe8b/HCcmOZcqn6lqLDzfA6e3BnQTsTuZw==
X-Received: by 2002:adf:e197:0:b0:4a4:14db:233b with SMTP id ffacd0b85a97d-4abb3678774mr26445608f8f.12.1795541542844;
        Tue, 24 Nov 2026 09:32:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:09 +0100
Subject: [PATCH v2 02/19] ASoC: qcom: lpass-platform: disable the RXTX & VA
 DMA interrupts on stop
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
Message-Id: <20261124-topic-sm8650-el2-v2-2-174e159f0f69@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/fsIHu6LLX02EBqFrzxtmSXw80zjZLf2vPoqG7Eq77I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoaUI+Ey3cpx0oclxJ0BXcgHjXP65kiip5bZsF4
 lAYCriyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGgAKCRB33NvayMhJ0QQuD/
 9pJ9+7KRKgBDU43qgCv+lNJYfANeC2u/lWlHn7lj/L+rtHC1bC/dnwZ9MKq0FokNeYhOX3KkafaNBC
 JEnp4fIJSy8vMDejmTUsLiNTDm2xt2WG2kcf0YcyKS8v5LCIQnRdgYC9NyOsTZek1AkpvKQYW/AHN4
 sE/LUiXpldjN136fa4G9Hpz9nJAr9PU5wRQOEPlMxdIvb8rO08iQDfv1dzhrtyjp6X674F83QOD5Gc
 2WBm4rfbqbcDZ5GQ2z9djiBaijVzHUIuldz90XoFybzb1w8L70TyyXu63ePVE2RUeMuRc8FMp8kyOh
 uklsd8vrZ+NMKjCFtlaImyDaQr9KDVpnXA7qv/U+Q4B5tihQcG1s4zWkwYESgzrKZRMzCfU6BhW6qa
 RJvClCA1YStk+grQd7OFMb+VHK+EWHy/Loor9fU2gFuoKg3AY1SoPVVhe+wcuIdbqjH8uyQIBJk/6r
 +624C8vjUIToXwKU/Xfg7dPhUPZyLWNfrftTFaiNC+bm3zS1O84AmtBQTyKyDLnBDCzq2pKWhnbFKx
 6nSmMLOdRHOqDwt7ZoKzMMj+ntgYrHqvdFGCfyYs/EdUORbYB2gORzUfb1bKDcgYNvAaZOldcrPKli
 qApjQsl9XIWZbkw9CXE94le3TeSIMKUwsKNbPsfH5AT3YXA4Swwf5QcNAqrg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On SNDRV_PCM_TRIGGER_STOP, SUSPEND and PAUSE_PUSH, the RXTX and VA codec
DMA cases set val_irqen to LPAIF_IRQ_ALL(ch), so the channel interrupts
are kept enabled instead of being disabled like for the MI2S and HDMI
DMAs. Once the stream is closed the substream is cleared, and the
interrupt handlers ignore the pending interrupts of the channel
without clearing them.

Disable the channel interrupts on stop, and drop the irq clear
register setup which is unused on stop.

Fixes: 7d7209557b67 ("ASoC: qcom: Add support for codec dma driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-213518@kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-platform.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index dad4becf7579..9666049ae51b 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -814,12 +814,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 				return ret;
 			}
 
-			reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
-			val_irqclr = LPAIF_IRQ_ALL(ch);
-
 			reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_mask = LPAIF_IRQ_ALL(ch);
-			val_irqen = LPAIF_IRQ_ALL(ch);
+			val_irqen = 0;
 			break;
 		case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
@@ -829,12 +826,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 				return ret;
 			}
 
-			reg_irqclr = LPAIF_VA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
-			val_irqclr = LPAIF_IRQ_ALL(ch);
-
 			reg_irqen = LPAIF_VA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_mask = LPAIF_IRQ_ALL(ch);
-			val_irqen = LPAIF_IRQ_ALL(ch);
+			val_irqen = 0;
 			break;
 		default:
 			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);

-- 
2.34.1

