Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595123;
	b=IRET6IbNvAWxGeJk+qP62ZElLEOby/71JaBBV74xzuVpMQJ4cw5KnNY54uwV1DC8y9pY
	 5VC8J/Viu9WnRfof24xss7YL7NDI6PpO+sP/pHtOaT8ciXZ5uvO6IiKRfqDqBBwk1BtUl
	 sEG7UXy+dSaZajMNfEpC0VMmU8IIDiEedyVYPCzNzJboW6ZPkhDjG4wRyfT+h6mr8tUTO
	 Pl5yqTfKKFMyjrQTixT46yfTH+jO/ND7jRuga9z2Y0gBFh0EQ/ie2Cg4JAE8XdyPQgwEs
	 mJ/ubknfiYsfJKWB5/6Iy2rPJNb7Vi9MoycUFdppiKhJENUkFTSi48wnugrDHOJefgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
	b=Lecj95ZmiL87V7NN2XHe+DSy7scQfFclL16sopQKTMh1cvbAnKCBdgkc1Klbp5dx6X+8
	 v/d3NTvulVvFDQCxpsZP0Lyx0pm+odvFkxQyzqA/1qmGGg46ThgOzdfNDeZjufeUJm5ro
	 LUoA54Xvbq+ulqDQwR80+fUCKaoBd5hbWqcXR/Qqx2PkTf04YfobtE07P2VPear8pATRV
	 4PAEX8xxRKpJrIs7v+thEiJuKyh3svsKfzPNFOs+qb0sRzYAIWoWglGlD4iifJJpiMrCw
	 6N+C1zDpUZZmFB9GfdD7vca/VgtOeXEaP6NCSa9DoEGbK1tx7dB/3VRJr+69HOXVqvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kNvNHTUg;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27887606CC83
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27887606CC83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kNvNHTUg
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490a0e72588so573550f8f.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595121; x=1795199921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
        b=kNvNHTUgRjtH3mON9M91rXL1bm5mOnrWnMSeu1K73fYuLMy8EvA/ZS83+hjpvyJ4Yy
         2aprL0xs0PB40OQ6Dhhpugd6YRCMj33GDsubh7LMFUt3yVSSZQDZV9l5LxVVcm7EHhY0
         pjTO/mSguDcs4kyewWd9euNoJJdqA61YNmA1VwXvwD88303OTCnLnVca0Uf9X+LVbijM
         kyjoLiViBevsmqMY1+WOYgCanH6OrT+rqXkDdJS7IOaOERJ0THv7oqUVQAQ6jLoLHu1s
         EIa2/zQG+mdhkF1n+BHNbgY8K1grM+O1yTMHkZA0I5ebtHQBqxdMYuDHw3VcUUhJRxlj
         wE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595121; x=1795199921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
        b=R0xnaq6GOg/QImYCp6BtF2bBK0nZbnrpzPobmI4lK+4hR9tI11SQoUNNqH8b/YvMa1
         dkLbxaVekD+mWWJsZLSCu0tPu9EvtjTtuh4Y0OkxIfXGYMfhDgmSou+T+ah0ZiEUo3lV
         Thuc4ZV0puu0V7Wot1QrHQ6Eghxzd7NCseooTt+t1pceZvdTGHZ9J+/UeI//VDGRv2il
         n/QoHeUnAANA6lwQrhmeqkpeVLjOsAujSZjvvgrWg4y3PaaJGTtdMJJsY2HllOqX8XES
         W6oNEjvSID3ncrX/mIBig55w+uVvhkdchZKabfQ2mYqtj6+nZWio15WxQ3m37iTdP61J
         Y9gw==
X-Forwarded-Encrypted: i=1; AL+hErHpdTjSkZq3s/JtGyxj5sLU8doiqoIM3116pC2Pw41zfy2EFnYm9rofpBSHvo+6wmnWuzg3T3geeX/U@vger.kernel.org
X-Gm-Message-State: APuU4Z8ExNBz7rN939hGKnzzhbADMayfPQIJFYUl2XNNOz+8HUNni27N
	huBGTxIHg3V0r+gdDoQqoRZCug0Cm1rmn8rWkWEcx0YedqgqBOxGXEmFRuWbZ3gx844=
X-Gm-Gg: AYBFou2kDKfFsNaXg0sBs7CWA5lGKn4MZKydntAxxp9fb00/LE36TdmMlX4Xv+Jdg38
	wVi6k/WnaZZ5T6HD2zsW8732I1xyq2xg3koBO3vWqR48UooUbRYVSIeJMZbbKaFqhT+DzuJGafZ
	UvkDvObpDNvIPpNKwssR/7Txss9SQ/q4vCk2GkRpQL782H5J0bb2O3VqRFuVeyzk76bi+4a5nwx
	+6YJJ4O8folfFr0ZadedREUCDSiCo0Wp4jXaPRmWdFXofKQAYwR9NhtB98WjvLIt8TXHb+lcntr
	TSvaU+RVPNyPaYbcKgB3XIEXkoLJYWIsvKerJ+jfGE9LxvNchv1rir/7SrmOFyh368g2e7aBBTr
	ExZKj3xR1lPX3eWmWfwpSASHr5gg3DBgEwiuXloIuSvG4JA4fyA1/lpeaVdbXR5oURqJmGNXc9L
	4uOj5N0FnkJgiQzFZXO8kDmYB+6eLcz/y+BVaqaY2ddiKJtZdHkUyHbQ1/KceJ++PIyARbpFlss
	pGaJbBip1bUSbOP96nTe1KFSPTsYjtPfnXkvnkJPzWT3jmMhTiPpT85U0Q7MexlRfBW5LVfxoo9
	b/ZlyeFQTQ9GDNNGAu+YjukbrK+k27cRCE9axYZJGnc=
X-Received: by 2002:a05:6000:29cf:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-49c712ac8edmr4249814f8f.18.1794595121078;
        Fri, 13 Nov 2026 10:38:41 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:19 +0100
Subject: [PATCH RFC 05/23] ASoC: dt-bindings: qcom,lpass: add WSA RX and TX
 channels ids
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
Message-Id: <20261113-topic-sm8650-el2-v1-5-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7B0HLPkz/JmSein0hlLzb+UyX+3YoDiyYBasK2j51sI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kfPhvTXeMs73QmE5NQsahYZG9H830cDEBY6m9o
 UEhCBleJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZHwAKCRB33NvayMhJ0VCjD/
 9N0CE7ZXY2semuBrhYN0RyvNDEYoK7WutoyBIX5xdZDi43Z4J3tQePDZTIgp8ZFCYT9aiv6iW+vjmB
 Lf9Yo9oJ66bHsV1hoAeXLrXicmkYA2NGEckDOE6g2tdkKXaIAJ8lFri+9GnGPOmeu+V21fWgKg10MX
 TgUf4zSTk0mtjwhOgAX5H2EfWQmg0eubO5w4aEmLPfn4vJBx9y6eqbo3H5sFIvStYXxniE6jargFkS
 fImd31BCwFKxStoRZJrbfUZDK1DlqyaSJfOV719LYbkYewTqbE8yh1sJHOYS8KwxBiNqUXPOtl6UH5
 F2nPJNyuL7PGUKadHNl4hJ7v32XmAfQ43twMGR/vDOdmCy700unX5t9Y57nQL7tHjTCiesr7RPxzzE
 gaDLBZ0IHe50oUdmjMoWImbsr3iZjLkrXPUwtg45m0i3uAJsyLY3D8JzgbewybuCv9nVcld/PV73EF
 VfklXWvriz7PNi3AjEN+z9X7+3SjIOmCewotFOQQMgKDWiLx5cju3UfzuuGl6V15fVxORUnV+JdhCG
 AAiSPsKru+jO0WEzQ8x5Rb+2ywsk+vdXIqAP+tODE2TUNe5gklfawC/OPSzdvCDhrWPm5um/xMIpFf
 liQuTT+BHUy6GBVORrke3b9xJAz9GqO5UKYjwiCt4RKagd+C+Z5bzmIR5Bzw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the bindings to connect to the Qualcomm WSA interfaces.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/sound/qcom,lpass.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
index 22f5e1fcc8a6..5d8db5195dad 100644
--- a/include/dt-bindings/sound/qcom,lpass.h
+++ b/include/dt-bindings/sound/qcom,lpass.h
@@ -44,6 +44,27 @@
 #define MI2S_SENARY	34
 #define MI2S_SEPTENARY	35
 
+#define LPASS_CDC_DMA_WSA_RX0 36
+#define LPASS_CDC_DMA_WSA_RX1 37
+#define LPASS_CDC_DMA_WSA_RX2 38
+#define LPASS_CDC_DMA_WSA_RX3 39
+#define LPASS_CDC_DMA_WSA_RX4 40
+#define LPASS_CDC_DMA_WSA_RX5 41
+#define LPASS_CDC_DMA_WSA_RX6 42
+#define LPASS_CDC_DMA_WSA_RX7 43
+#define LPASS_CDC_DMA_WSA_RX8 44
+#define LPASS_CDC_DMA_WSA_RX9 45
+
+#define LPASS_CDC_DMA_WSA_TX0 46
+#define LPASS_CDC_DMA_WSA_TX1 47
+#define LPASS_CDC_DMA_WSA_TX2 48
+#define LPASS_CDC_DMA_WSA_TX3 49
+#define LPASS_CDC_DMA_WSA_TX4 50
+#define LPASS_CDC_DMA_WSA_TX5 51
+#define LPASS_CDC_DMA_WSA_TX6 52
+#define LPASS_CDC_DMA_WSA_TX7 53
+#define LPASS_CDC_DMA_WSA_TX8 54
+
 #define LPASS_MCLK0	0
 
 #endif /* __DT_QCOM_LPASS_H */

-- 
2.34.1

