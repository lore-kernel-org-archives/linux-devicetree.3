Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541544;
	b=VEFVffLknkD5jMcs/sVTvWLRCVwbGaXxJnbFgTi6U2eDeUk3WGSoX+R/0Ywi/+7AP1Pq
	 lxZVPrzUXOHsnluuomaitn//hooX2b+j2CE2hNnAZbF/8/N0r1guar+ZaWcG6MITQC71s
	 sFDXMGbIPrvPWbvFL4oSGFQo/JCFHOf+5UKE6PcyPgeRO5Uk3GJXOSjGGvTL3soA2Elg8
	 hGoCs7ZNv4b6uypoITYfMhKpE3rawYdQAlFcC+Q8ADk0v2ysavdQw8/byUtuFkpOoyl8o
	 7nr7eRnxIf5bfXiXxHhwBgeAb3GlYkqzOEDOA0ngwiQhNEBQdmIp7mfbcKKaGWXkbkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=E1l3muk9mvj2eUO9vG6GnMDOjISfB3yngVtzlHm1Fos=;
	b=sA+ofCIUVq57KZMzrvJVXSxX1dyaER9+FMhaL0SRjnawMghc+rDgcuGyJ2Y2uZYTnr3Z
	 FxlYL1DjmX9LZ6zYOnaD+cforHzUrwlGR57FwxFH7UAbO4xLyCCKPjuIFUC8YJe6zeOie
	 1ZAGwy5G6IbG7mi/OhjZlKeKuHwRvKqdp9QZB9wTihNnjlLViMNOd9IfO5iMrZ39Z2xN4
	 P4OZ8Q6uWiGDh425dPlTd+xiTy+8oQsEUFpzeW7YZaPf2vbbN3HuSTNYTL2urbfJHH5Ph
	 +OHavXJ1MDXKG+Al+1A4jWDlP5Jr3oMwkYcV1tZFB+tldsIhQuz6t7Z/cQ7IhGBQlkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IxTmaRZg;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE023606A32C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE023606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IxTmaRZg
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-497614c95f0so2725167f8f.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541542; x=1796146342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1l3muk9mvj2eUO9vG6GnMDOjISfB3yngVtzlHm1Fos=;
        b=IxTmaRZgx+ZSGfKjB08NNxSE4z8CKY+0a07wlhzAV/It6ahQYSo4BSx4x0MBkr/l7L
         SkgSoOiETlXP9D4ZVqjCpjHZaglxA4fBQ/PDbpLc0bPV0iqbkp8WJhC16z0QdIlNwL+F
         5V3ih7HnT8pNokrq+A/LAI7QfN5tjnLjE+N0VdK6LIZZMYucNyYES0JYl5/MgboY6x0+
         Umpkhjh/XzP+p7gSGI7Io94zA/VOpNAeNqDbuv/jRG1sJsuB3u0ssnn7KrFxu7JAs/LJ
         tLbNsM2YNWPNcAr3h5pLw2mK/xaAzzqfMadTvNxHT1wVzigI9Zbfcg+RJl4T+kHZDt0V
         qOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541542; x=1796146342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1l3muk9mvj2eUO9vG6GnMDOjISfB3yngVtzlHm1Fos=;
        b=ZiEzoNlqhAehPWDe6Z52h7Z/yt6/kBt/4omH9TU7p6zN5TaywWP3tVwBatXzeeFvLq
         oCJfZsSeK6grwdfimR6LkeUBmoD60/qeu6TC3u4qwegtZSg/4ILsk12bh7EdkVRVkreQ
         Bi71NI2nQZC6L43iMePStci3Yt6KUvJqKoeXVZE65bryw1WjhN9wkTZPxK8fie3IZIvY
         IF69QWuVIVhCRttDsPdstwGCtJoHP4gcvte05W3i5wcPuyXpYcPbhRCkttWC1HWpHc9j
         zOI+XvoMFOZsCiTo6wb/xGSezqdWSf4pH9yW963/jtN6+PGruir7X+16BhPrjrcpAXOx
         UgJg==
X-Forwarded-Encrypted: i=1; AL+hErH69OpMaHPOfsqDk0Hdmib0Pk5aOePuSB5Y5dzmysUbzmEqK8fjhqJk+Zb8MhrJwCq9SvKhZ4juzHuf@vger.kernel.org
X-Gm-Message-State: APuU4Z+DYJbiolwLnH3Sn73kYP++3py+YstGUPyz9SchsinU07U/oTNi
	G4eRVAQiDGTFv837gwfgAxckB/AOBz6lfX1mXR9Zjk4z9rSNBs5ymVaZxIWseWHcDNg=
X-Gm-Gg: AZFdTZf4b2JDbSwQbAgduufgyBIhV7ASos0kDTl9blQHJg5bsslS98XaDph42jMF5IO
	dTRYg1v0ghe1hlklrTZZiT/eP5sQbwTEad9kd67n65LfsgLTVcwM9fNSPJFAODJtJjo55ufGRmw
	jQ1qZi3BCq9Bu9H7c4hZdLpn0MI4NA+EFbpEBrZ5ExVCfGEADE7jG4Q1uy2yB5Ti/rjtBXNciES
	CL0R/ElfAnEMi0U0gP7Rwxe2mgG/aTW9NquzH7PVogoCqY6MS5q+mYYjtzqEBm8IDhU3kEqX1bi
	RfNnMUwPsDEYf85Ggy/z4+sEgzQcRGX2fReFIxo40WXQZWEcQYC1AMajeg+5Sx4/D5mVkN8+m4t
	gtSZ/MAdNfajmf5Fx11wszvVVx5yJY1sq/QyDnLMeJjkmQ6z7RAhH7iw4AYrqmy2zoFwA0buTMl
	orEjxeSh8cG52sZXt2BHJG+TBuc+VIiLmHBZ9lWcboMJh7w4dm212CsskYQJUhcintmr7bBABSS
	VV/qjjDP6OYxpVI9mLCDz20/vohK/87+c9evAMagwzrG41heneS2mG6LCSn9VD4XuRKMe6Xrz/5
	EEOeZVIdonS79OsMNQNs5/W9qZzv95HxD0eeC88r0EucQrTUtA==
X-Received: by 2002:a05:600c:b8a:b0:4bb:7007:4a5a with SMTP id 5b1f17b1804b1-4bb88817772mr322992005e9.23.1795541541955;
        Tue, 24 Nov 2026 09:32:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:08 +0100
Subject: [PATCH v2 01/19] ASoC: qcom: lpass-cpu: fix RXTX WRDMA current
 address register readability
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
Message-Id: <20261124-topic-sm8650-el2-v2-1-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZWtXXIAu1ROHouXHoyzPIX41ZECCUibcP81WQj1ZjMA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoaMxJMF4WK27iYIRXyPHY+J3KHRZ3Nj+2lFHF5
 iVYlM9qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGgAKCRB33NvayMhJ0ebID/
 0ScKo7Wg04BZQhsw0ik1LBznnUCP0x1l5J8gG38v/wvoUG/mJQq48WlEFTduIhLwmX37Cd2eWhiIf8
 tW2AgtXeDpZgd1tSSfSHj6L6/8sV+s8HLwyYkfR4c6+EwU1HBw4OglZMec1lmKzdQPnGxiZO2np137
 ghZUPW38OsShr1Yz04C2spnc7zKD8xJ9OHBox6QTdGdYn+Ho5UWpdvyaKQnlR25GKAjbKIw9M4lLo1
 rx7VTbrmfu93yD0A35z8L/3IV+GWRlWaPB+1HpeZp8wxSim5pBX0HO2J5uf2DKSH9uqsuWXOMGiDfA
 yj9B2EVKssy/EHDMWd88x8FLUSrTc3MWDeJYHDwLwll4YB+igVpSUTVm+aiL0fyUZwYaFWGQH5Ki6H
 djL+eMwpwyTuw8qccK2e1a8HQ/4jNvfW0vibRE+o2zz/eayzOFF8wQOI6KK2q0FuKQALNsD9zajMDX
 NDToXbvTwhy3q+mR/eitHI43AUTpN9x6W62PXLBs5rqHgEicUpZo8tN4U2bQWzUSTmqoqpXfJ0lZOq
 yK6SyJDOVTWJpnbloVuDpeKoeaiCsIVS6f2Ex3meL0zCgRf5h8CiyoV4com39PyM/erC7qKWMA54LP
 2xp59pvMRBOSCtV2h5mc1oJ7JqJj2H3sx9JBSkRThHAXln1A8MZOirJpjeLw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

__lpass_rxtx_regmap_accessible() checks the RXTX WRDMA current address
register without adding rxtx_wrdma_channel_start to the channel index
while all the other RXTX WRDMA registers do, so the current address
register of the last WRDMA channels is not readable and
lpass_platform_pcmops_pointer() fails with -EIO on those capture
channels.

Add rxtx_wrdma_channel_start like for the other RXTX WRDMA registers.

Fixes: b138706225c9 ("ASoC: qcom: Add regmap config support for codec dma driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-213518@kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 81eebfabcc9f..5fb20e284afe 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -843,7 +843,8 @@ static bool __lpass_rxtx_regmap_accessible(struct device *dev, unsigned int reg,
 							LPASS_CDC_DMA_TX3))
 			return true;
 		if (rw == LPASS_REG_READ) {
-			if (reg == LPAIF_CDC_RXTX_WRDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
+			if (reg == LPAIF_CDC_RXTX_WRDMACURR_REG(v, i + v->rxtx_wrdma_channel_start,
+								LPASS_CDC_DMA_TX3))
 				return true;
 		}
 		if (reg == LPAIF_CDC_RXTX_WRDMAPER_REG(v, i + v->rxtx_wrdma_channel_start,

-- 
2.34.1

