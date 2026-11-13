Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595126;
	b=5Xg1TgsSeCiiy3dyoKLS7QjWBxzwpSht0IHVp/FZWHtcAQsUgzTaIBc3SxGnHzVIZFIU
	 BEanW5AY/P7pgYpbI/xHpzCVTbUc6QfyP47YObs8hMNxbjA8yCxNoh/OlkvS4XbcvGteL
	 MtQbXrQCAPEjyAthc02eMkir14ViNdzluJ6gIYD6RncOFCH0NGAfre1vZF4thdOmOHFeA
	 nqur4xLEc2erd5MJ3oy4Tv5TNqAE9jakKMfi+ojqQHsx2Pdiwp4a9s9hDvX5zFXoFBdjy
	 V4R9BeIg6/mJzm2RV9AVIZ+5V2+HVYZJnzzA9X+kWGaHpv2TE+chyrZysnmGyecFJcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6Yb4xm/71FbPbrX8bul+Nh9djbt0T9PDaJg9F6V3s1Q=;
	b=e5i/pd509ebTo/j3iiwdG24uWti/urYK/sUGPBjxfSrVgP/9HtWik1MbAC/GvPAcC6CJ
	 N445mP1hOBurdyR3y63XyQVzWlqNd01i+g3HJbKD+s1opDwraLYEd94GpFKsbBBh0sgPi
	 sFaS3E60/0xloZSUtUrQrkcr4WXjFFXK1/Jz/2oNuO6U+uq/wQdaXW+uMCPCgn6ysQYRq
	 beEfIWUaWpqHjaCkwmqqWaLd7rM6w77K8LG2XDUu8Hikl6XMQHguP+4RkV7oYurs/J1u4
	 I96DIFIdcG6AglxV4vtfKnATpUl5zyRtiT/yxQfpqO5RG24axGVa67RuWBdWHnBLvng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMnFR12B;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9948606E56D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9948606E56D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMnFR12B
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so9793625e9.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595124; x=1795199924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yb4xm/71FbPbrX8bul+Nh9djbt0T9PDaJg9F6V3s1Q=;
        b=EMnFR12BFy/Zd/JfaqoThARSiDLJF50Y55g/A5oqz/RdNk/+AyHud5tlPSeLcaJY7E
         w7kfG9fjnI+eT86YE6YxbUMWWML14o5beIvMc/Ro6ndCwjooH0cV+KD7EloGy/wRJD9V
         Jif90NVzZVcQ6+YoLmHHZt4iAeZLaEA7ly68CU49G7X3pzaWIZR8lMzP2+vY891L1jTl
         h8RmgqDHq6vxU266MaErJnLthW6M6kNZv5ZuJ3s2+KVNORgMp4D4JrCArmECEFJMES0C
         4OFjKe4uqE0XjwMT4xmKxa49UaDBJ5eRE3nw5DHCUehtiWFP+2bUX4YlOMp59d2pT66y
         2umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595124; x=1795199924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Yb4xm/71FbPbrX8bul+Nh9djbt0T9PDaJg9F6V3s1Q=;
        b=LJ7dhC2DBtKhbkfyKItKSiZRpVfGCk8BlttHLM79DnbLh8ymUxyORkWi3i+pfev6y/
         h/Jz8bGikLgh/iFkO6BcYUYQSLCW52ISVsReNgtVxMK+nFEv91JC4z7/4XcsU8t6iPsE
         gdEoC29OgFL8Ie4QMy9cX8zddqEn+dsGtKn+Xawqjxl7UMSS/MDXDvRxZh7kvjWBZ8D0
         eX0diMFodN3XkFWCjiYDD1D5c+21He/lHo0mGVSKYu0A3WY52vsfHdHwZmTPuPziu9nP
         XwRqj5qYekvpRUlGjZM1ib8KebHZmD6TYmKeUi1VdIrm8n9J5vTA68chQanTA0WNZywW
         5LAw==
X-Forwarded-Encrypted: i=1; AL+hErEPu8+GGInnwKpBcm56Gn8VdxDdLRu1D8YVAW1t+1x9hlQmBj+bUAiXgNMWg0xAlxd6XUw1dRXm/CcR@vger.kernel.org
X-Gm-Message-State: APuU4Z/LAysQ4xmUI5kHlr54u7NJljbgT2rSs3bieSQEehoVHTNMRBaW
	msVV7NIgppPVbPduUmL9EOlx005Q7dKj+7O0B5TcyQeSa03lUatydsj0iHF1FneLfhg=
X-Gm-Gg: AYBFou0/X+axQxjSlh+tOXF6EbZdgryy2pj/n5J2UlypWlyS/Wy0SgIp4zQSLOU0Xo7
	EED8l2c3gHlQChe4geF3c+6yCG2izKgqDyB86STE/ND5iDXEYnDnm4IcXWqshbYQjQB97hHpm2O
	hJg9qeI3u2BkR7z77RPQ88sXWii8ATV9AJgxGJEROljFFIp8TuQj4JE9jLmpztebA/y237dEv9M
	fh1mia/CHuY6PGdV5j4UWAi+4NRfIflbCnTxo4xN8BXcnAx6gVzkEewfnpJp8Z30WCerCHqrGyh
	8ZmTV/WEOAaHYHn1SvbNoRGmFaRx4LzoMiyRbge63BnwHIGRgCGIYk46X5ycNPSw7UfMujzFvyk
	mD7tmXnrCRW33ubhWRkG2YbXdllvboStLCRac0eJGbirKY/ghhRmKcK3DA6jYScxYhfGr82EAYy
	aikHMly/EO7EIBpoByJAv7jspsG0nB6//N+1Ab94LRossN95sJAja3dGSxJfZ2nT/hxAVuXOGj0
	PdcfAXuzvTsRD1FCBQo4pKfdvvhxu8C9JfG1hPnPfGj68XmCl8iyyI1H9+et3B4jIVkspJ5gWe1
	li04R8zEHuXNOPjSj+dpsGb/SlkfgpfVVTCRYWOvB+U=
X-Received: by 2002:a05:600c:46cb:b0:4bb:52d8:73ef with SMTP id 5b1f17b1804b1-4bb55af12e1mr70215745e9.34.1794595124200;
        Fri, 13 Nov 2026 10:38:44 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:22 +0100
Subject: [PATCH RFC 08/23] ASoC: qcom: lpass-cpu: get the optional
 codec_mem3 clock
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
Message-Id: <20261113-topic-sm8650-el2-v1-8-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Z8GunUt92Y/75liBMYWXLbRwhUaetuFUQPX3BHF04L4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91khB1slVEF7d6pDan68qfrqHRNn8kCup/oD7Ah9
 hZllBjaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZIQAKCRB33NvayMhJ0ezgD/
 45ZUV+oN3bZPvX/nBQqaRAOlnpXXntUnO4puAR6WYjREGQL+qQR3swBxSOfZuApkJ1uP+MRJNBBNWH
 lQUfzGyz359aiHXu2wQg8ejOYBhu/RCprmvNTWoOo6iEDUMhAJmcNC4vwAEeRd7hGRetUUBwaGGqBA
 2MX2bvLNk3hnBttn2U2wB73UDvIPTZMix5+hOCKn77M0TkzxygA+QtythciBB1bz1ZjHEH41fvW+Rf
 v4MG5fa7fkHO1dHDssw545R581/ncL7jEv6i5LOxYu62gpgGRI1fWZgmuiEnwKy+pog0m5sZjoRbQN
 o8tMtxZkvHdS3h5KUsa/p7DzS23yZ6FPyU4u0ya+hkxanDIaN6wQFjUGrB5ogFsGkRZwjMcWK9rVVL
 4c2U/VMSdxVz6s1vTO1waKQ+tG3fi/VRMkvszXcMofbGuOvkBtr3ffl9t9zVFZkhjaknEnYsWCY+vU
 lbgz1EwV50TtXULVzqxt3dixNV8Erf4Vgpc6PpQAjSw3HPR9dCLnxPiY79MrST0s2x9lHkxxNp/FpJ
 rzpuEfpz5ApeS3oHmoslrpuTh3ZLh05TE+uXj9hmI0pBtWAgkwhegWpjmHGHPtocAGh+XpHkYwZRaC
 9UZyDMFeqzoYTidcj7aC+O+w2zdxRw0yEtyrOah3BGzW3mwqecX3Py6Mn1Ag==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Some SoCs like SM8650 have a 4th codec LPM block, gated by its own
codec_mem3 clock, which the driver doesn't get.

Get the optional audio_cc_codec_mem3 clock with the other codec DMA clocks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 4 ++++
 sound/soc/qcom/lpass.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index ee187eeb7392..ea8b6083529c 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1071,6 +1071,10 @@ static int of_lpass_cdc_dma_clks_parse(struct device *dev,
 	if (IS_ERR(data->codec_mem2))
 		return PTR_ERR(data->codec_mem2);
 
+	data->codec_mem3 = devm_clk_get_optional(dev, "audio_cc_codec_mem3");
+	if (IS_ERR(data->codec_mem3))
+		return PTR_ERR(data->codec_mem3);
+
 	data->va_mem0 = devm_clk_get(dev, "aon_cc_va_mem0");
 	if (IS_ERR(data->va_mem0))
 		return PTR_ERR(data->va_mem0);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 68b71039b981..4231466928d4 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -107,6 +107,7 @@ struct lpass_data {
 	struct clk *codec_mem0;
 	struct clk *codec_mem1;
 	struct clk *codec_mem2;
+	struct clk *codec_mem3;
 	struct clk *va_mem0;
 
 	/* MI2S SD lines to use for playback/capture */

-- 
2.34.1

