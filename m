Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541545;
	b=zYEIw+lCjEvEAzSVUbpql/nR2gBTZd+LieiJP8h83k7KNHzs896cw4c92Uthlfy6MWXf
	 B3HzSea9jXsXQFFoXWoeSj6WKHc3RdXYIjhIhh+EJiDRILqBW1iIf+jmNcmhPSOLB0gFx
	 erxHkQtGzyUAYxMK07xYLv8xGDYui+FuwgIQstE4hUJJu0Y1L6bx0T49wKbNdP70zr4D6
	 WkQYh3C18Jos8o6Iqq8t5Ru+pJgpZ16Vy7VQPnxSkt0ZUpUwALUIcm0JouSOdKkn0Ltoq
	 xjNPAMzSvSmCRPMD+cLmI2b6gDfbU5ry1bsTxfEZCKwEWixUaWSS1uFIyMNj1XiCa7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
	b=WJahCG8WDSiy/Axts/IVjTQ6I7pqX1M4FWy2TM+bJbeAka0Pb3BRMw8z9NM6W0nRNV2a
	 pyMoGAbOK7qpyk3gYoindn/IaNZZZ7ZfauuJno+i0ge5xFWi0F48sTSvSPDYRy4IZkUbA
	 Xf+/lXV/BASaeeBSIRhDwyO/1w9iKV/llg6x8ZWTIc8bR2tHUe+yRDrpqAOnjhpjyNEVn
	 OlkqhtPgNLMqbY+wtW01tk9aO9Hx90Il2lpVoEP4ju9Zn5KxSIdJWDMGu7w5Ai0vKAtO+
	 sP54g/fGWXarYE0ywXl+tatioz8tmQz1lB142RkFRXlIKHbUbdYDbpzGnjiSkcD655A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lNsYRe3b;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464F3606A692
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 464F3606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lNsYRe3b
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so37781355e9.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541544; x=1796146344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
        b=lNsYRe3btU7VMxDTeo1Pfr/oZ3x9wFi1mXH6ULDi+3dGmlc7GVM6Tof+Bl66NeVDzC
         HdLS75BM4CC6auVjh17vhJsNahWpZXKLofgX5XK6T3fux+XJIypDoDuhfSQEMO452HNJ
         suqziFfU9QfsU+CqCgH6uBx6MMQ5nDwjyosp9XgDUV9DJApYpZWbZegfzYHuae/QIQpH
         lGwnnGP5aKc8Sr53uf5pjriYfNzcgk4u56raFMxvEHdp5wpgn/m32pb+IcvP9JqCWPLG
         RiqbfwUrM2CTkEREh/BBY2swpXP/ndLyVDMeu9OcoZrM3/u5IvIfNIFB4W+pAxALHrem
         mULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541544; x=1796146344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
        b=WEY3CZ9GLvUY4ySiu3gnkBXCf5+gj/gXImiOheP8XM38Uzt/wuOeQx0XqTbwbxk7XQ
         vCqn8Y6bav8uVH5f3qlWXeihi4kKmBvknCMIHqueEv9dc5bvOE9Tv7yxiE56uIMjZXE5
         +gHWAKSQbhde1PuxPH8aFExsCj6/xmF4F4grxtIZ3HVzSEGBqe4H+ojPp/HKLwCKvtvZ
         GfDM0TH/a5KE1ApaPhhQ+0b15SErHrJKMfY5f5LHqqL+JcMOxB+UkArdXdT2eNsUiiwB
         bV0Wm/r3VxE+zuBKb+LEO+4UAZaNWwOEVvMWzNU6R4NwkTyHKEkB+cfgD1NsFFfIAJ+s
         jkQQ==
X-Forwarded-Encrypted: i=1; AL+hErF/3b8G+oce1plBXk6E/+fkZRA6r3Tp0/WEGubN3+64x/N1ReTZaMmnTifmTQv5iII+X+jipgwCev+e@vger.kernel.org
X-Gm-Message-State: APuU4Z9uPB+DOtYxRroK2UL4+x8fPQ0I95Sb/GZ79Mt8giC0m/m7n/Ry
	9FxYpp1iMUAwRGZXqp70VlePBr8QOTcxAoNAfoQXdj0KmzAYs2yqYmsIIayYv85zZ8k=
X-Gm-Gg: AZFdTZfbDKwLqY9cjT/kmxGgyLGgbRJQiDs9mGvw/kZcXupBGPYJl03uuw03x5sZ4WE
	BOBqZw/KbFwv+ZNxjxzGQrLNtwGoftcQOPc+JeGJav8gDHv9cHyG1K8PQNqjROfLJfUp3L7ySTa
	QLV4J+78DOWaGmilxeB0hD9ADu/YEZ4bBkdvYNNoVpciMxYtAUG0vEckiQSx3WaOxcQ0ckiHLqJ
	ZYRg7piypuYEuqsiL+DBT/nt9BUyt33d4/DmAGdmcmNMg8rPWiFz5y9mLQcbwevOWxlCrj0HZgk
	YGMhYz0nP7HUjJYSOrNCLtsmuSM+wYGqx9pEnzpqLJha08n/EJSN1vqhuTOwbI/IjbfSHLfsFpE
	XB74p+gWj46QtHnW45qhzUEoJJfD8+HsmMa7StuNCM81n23INMaRQETRr1HIVX4Xf0d66IEfMXO
	dZ6xFKx+/6E0KGQ61m6VOYBo3LvLiCm0G/c3gs7LuinFPVUfVQJRPtO7RrvuYV31sHBa+tD+9vO
	ge5H7o8Z7zjsI+nbdLEIWlcRYS2aqU4PK9nOYG8b2arsAnoP9oKRUXuC6RtPpbE/0Pwv53YFM+H
	clkhyTbi3muyNKGglGX0+QBqyRYdpRE//OudtqdLXmeJQgbewQ==
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr392620865e9.15.1795541543609;
        Tue, 24 Nov 2026 09:32:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:10 +0100
Subject: [PATCH v2 03/19] ASoC: dt-bindings: qcom,lpass: add Senary &
 Septenary MI2S ids
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
Message-Id: <20261124-topic-sm8650-el2-v2-3-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5I6Gvg7c3l0nKuQTPTMB1qG4Gtu3tCn1ElSv/OYu2fU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcobWxAIrUaikBSGw3tfCDe/BvDN5W1VJ7l4ptzE
 Q8mTg52JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGwAKCRB33NvayMhJ0YbMEA
 Cef2bCqZVVI2O8r/CtoVbur+J5keWp49wViKQ2UMUyMQ05+wYQ1avJUMr0rgVlkz89rmzd7XhXaXP3
 +aNBSBgseud2LTgLyCkhIEuqJh788RVeLRfBPA8AuQkmqgWBAlhofTxFtRHlunh5hL4+nItKNvjBk+
 Dm+ArKSVLTyUtzv3p21ESILkMDaZ7DlfsyyL00VLWmI+E2ZyUEKLpDy0SIfMw6LSOqU76PKSwOCrmy
 HdPPxRyqCnUCa6dyQ0OmqcbhiHwSBFFR4Ds5GNZuDiZUCLVZAVNDh9Zzdg1DAflHfcVpF3ggzGRdxm
 nLAZyeYo+OvEERaSHbn2IcQ6Rp9hkwQQ1wV+M9vdcY0t0HcCWFmrLAuXq8gfCLh24JtnIXLBi8Cem3
 +XFPB+n+xuVG7X/CjoVGpBl3VosciA9ZVUmpHT1L3kZk7c11tobtt6rsdptFXpr4OEKuhJrInAT1pz
 Cg1FmGKwPZkSkBXcBWVS6SKhsRFNUn5u7c0lUinKo/9rLK5UpeiWDE2uAFlfk9uGzWRbLDh0GuZCKz
 G+KSxZa0GJpJVVBhUYyVEdWboaKAMGz7gIb2BDfjlKafK8pL0eukLVqTtRRRfBa+9sJ20Zip14VkCf
 Xfa9Fl2qwYUYTzP9B3Bk13LHA2Bj7y96Q+BjlRvdzNnH+Ec2xp97Q+J6acSQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Some SoCs like SM8650 have Senary & Septenary MI2S interfaces, which can't
be referenced by the LPASS CPU DAI ids.

Add the MI2S_SENARY & MI2S_SEPTENARY DAI ids.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/sound/qcom,lpass.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
index a9404c3b8884..22f5e1fcc8a6 100644
--- a/include/dt-bindings/sound/qcom,lpass.h
+++ b/include/dt-bindings/sound/qcom,lpass.h
@@ -41,6 +41,9 @@
 #define LPASS_CDC_DMA_VA_TX7 32
 #define LPASS_CDC_DMA_VA_TX8 33
 
+#define MI2S_SENARY	34
+#define MI2S_SEPTENARY	35
+
 #define LPASS_MCLK0	0
 
 #endif /* __DT_QCOM_LPASS_H */

-- 
2.34.1

