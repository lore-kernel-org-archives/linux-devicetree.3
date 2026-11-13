Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595139;
	b=XWqchubOJx7gPow/Ee92Lfv4/wZH0BOSzPLJyDrqw5eYDn34CbxmNB2sG4wpaqX0jFhk
	 +xiVneQNgKortWtSFS8ek1wZI+aSNs7uPJzLEq0e5MLlRZZgBaVKvtXqIiIoY3ArP4535
	 UVZDDaX3q4Xyx/bXIEQdhGFFL99fVmiHxk69olvVlQSBS8blHUjq+wXcUXyHb9WBZxWgb
	 UANLWAG51ctQyipzd4bzlQ3rM7tw9exCx9maoyXmb+gubFaBbE9aAMcmV66z3g18K9Qvv
	 0wWex/HDSf7KWNsi5ogIqjiDDqPhglBwHlHlJUtAp6ygheUc+KYeONcYeqHjATjMZSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ShonUOYxGGNmtD8AWNfZClVcjwHiQNoIijd5Y0f0jlg=;
	b=k6y/r4Bizgy/0NtRFtK79aAX66P8Q+0hR2nor1m6WW9AtkaiRBWmQTKKlZzsdmSlpnjr
	 6tDZQQXpxgchPhPzlMcAml7oz5xzLqY7CXsajstJG4d+ayb0T3PEzWa3VoAQeN/X9E7bc
	 eAOTC8gcNWjKAmHjXD/Nkj4R3pBkBaU12NkE/obLrlJXet70wOGVmvW+qNOuHt4ZPLoRe
	 gp7gK/XzsbRHTTNVrY9i+8ia+YzGcML7ARqy0qOxcftpg9u+ck647n8OrwQL3CRIuSXxC
	 DAjDjnWWbwTxwIS3ECRhzvwGXF7p6xhiLqOTLeLxdk/vtO3O2kfeHyl7F8OLf3UgZyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pzlEBQos;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6D16070B7D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD6D16070B7D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pzlEBQos
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492f563d1c6so860367f8f.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595137; x=1795199937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShonUOYxGGNmtD8AWNfZClVcjwHiQNoIijd5Y0f0jlg=;
        b=pzlEBQos34MNNpurfGyXR57C0NNyfj+EPBTsCLT6EE+7Fi4G/LzhXJ2OL8x2yklRtp
         pqU54v0RQTpZvIhbxhHQAqnB67+/B0xguWkzoVW4mlFHf/P/SIXv8yTbgcIoAwF3sLVc
         0uU6yujcPl//gZIlsko9pCMGUJu+DrMJXKAi0weJPQRsfG/WFs45W01w/RJMFgO6ZoV5
         Vwk/qHGXElE0LJb0jJSGAZ9EPx/P9Flo9CkkyrFfv6Z2mOAFLHBzWVt7wJLnsVXYUjNs
         sC00lnvD4w4JP45/2HdtuuH/dT+gDYc+OyFd1TnDoB5XNPJFrJ3etxWnUAWZVE4I17bJ
         97mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595137; x=1795199937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShonUOYxGGNmtD8AWNfZClVcjwHiQNoIijd5Y0f0jlg=;
        b=QnU+n/y7XK0ZYUbUxPIMY19oJqmotbhnlYIEygQ4bShrMRKyajQB98ch7UCyKtNvNf
         gV2jXypqRyhNrxaX2qOBxKm9bv94LBKfgRrX8VCbbeolKxIF3XWbp6t6Pn5Y/KojLIi3
         x5ubFIQokilQRA5gZnGJBkIWWJtRyNi+tFO7XTA96myHrFc/NgZ0pB689xdURGuXbUwc
         Id92WG2wRKG3p1Duxiddh/bTKLv73L+/NeoWiMhI1VhGkq0qLqBwOL2MM6zLBMDzKdb1
         JfOlSdQTSy7rdmkk0MuiyKxgZfEEBzozWEoMW7dTsUMYEPZ6qW1ng75/Zkvm/X8uUoTd
         wXkw==
X-Forwarded-Encrypted: i=1; AL+hErGnQsp4ZhBakq4C3q7bMMUgpOmp8lqe+zjFfkCbdbSQGDeCwbU0VndvRJbPwnwmDHpl1lAo7NMGX9RB@vger.kernel.org
X-Gm-Message-State: APuU4Z8UduJzma/+X4L1zH30ixSb6Na+YC5B77g4Th32MuCiOWA0Ma+r
	lV0a7rrn2SaY/UwTpE8BF0eUUvh2dVyCrhoUdfZoi8GdLs94fViiIEv7/S49NovdEE0=
X-Gm-Gg: AYBFou3lmQ9nvTAsWeXutEf1GPzvlRXyxgVq4gmyCpXstFVa38spRijTJnhag/Wz56D
	scxMSLoRmrZWbAmrPhcQDlX37Fhqa6V9X0OtIQdP4xWiE9ForhTRteFX7nQn9y7lSPXfYMfcBoT
	FIXcIZcAkRd1hLDU7yXK4z4BHlXjCB8VtqVL2reAEfTN0/DnnVgDEClBxf2Xxyko7Os5A4S7cBm
	ggo9T5i0zFqYlZh1P2mG/AI0VO56Aef8ZtERpFYuk0xOgcbR+8QVbvs5o/1y+OJoecdr/8tSbuf
	5YLJXwrI2+2QTy9I1LsbOs1R97yvGQNrzHcVaXo6CIUHYOmmFAokVGQl9uHiCSAy6YqjvKM9L5X
	rhOB3YmYWvw7PRZAZguCPtfvAVXPHgNmiX9Aj0Ls80jV74v/Vi1WaT+8bHG8KQRk7zur4th/BI1
	wsi7WhfNbL2S6OLQRAJXe8DUU+Ps6N+gp0TkzFjz+B4xD19B3cWVsKgt/GMKjhtRGwDlL8CmYRv
	N1D0aUKE9fF0hvZJhVkpuiUAnkpbatn3lJnsVQvAPgE6a8x8+R2susRwxsa8qkuaHuhUX4tWj/b
	Db2IFm2NVqfU99zuP5t80nNcNhr08CFo2nW9wdZ8TiE=
X-Received: by 2002:a05:6000:29d9:b0:498:b92a:30b with SMTP id ffacd0b85a97d-49c70ed7d88mr4816619f8f.15.1794595136922;
        Fri, 13 Nov 2026 10:38:56 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:32 +0100
Subject: [PATCH RFC 18/23] ASoC: qcom: swd: allow LPASS_CDC_DMA_WSA_RX0 as
 soundwire dai
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
Message-Id: <20261113-topic-sm8650-el2-v1-18-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=588;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=B8W0+YjZEiqoAbB2dPCHvIJpxKQMBOWC30klAZVCDd8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kmG9XLHJeLS7JkptOZPLWufRWNkDG/W5drmOwW
 4Y4Jx0CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZJgAKCRB33NvayMhJ0R0kEA
 CPcpfO2Q7RH/mOuBrdmSsYWh/Q2dOu/1HoNUT5WDw9BCZ9KYeOyugM6c4PRXbtOZWvx5rcmCrgj4dK
 uOctwbfOrRO7CrXqfSUhskQ4BbiH9AtLqvcmDNt6lZQIi++PrIPtZu/3RVospJueeLMMtkTxlQnaka
 BhIHrbr0o7jHeVHDde7MIVJb9jsk7r961kQ3n+tSxuMkYZuzW92q7kLDMf2T3kdUG49fQq+HtNb7Fn
 oS912dRmDG826ai/0NTCaoM26y1CYZR5zKxzdXmheZPsHts4GBG39RZcFIGnnKaWHQNaQLpdQ1CP6L
 qyjGpWD0rPxLsHi/mmKZ6ImyWTSNsxBUJXrAr8vionS6Cps9C3lPWY5sqeaTdFU7bjYjKDByBY7OCg
 zVwH+GspOzc97Yqo0/CfpwTEuI99sqsyN4nECNVVlEsGYByj7Y8W8r95sMqdWyBeztHhfLBsl75oMO
 FGKGYrfOx5ArkG9Neh9MIvw8uLBIR9Lon0M4TE9Kynly51xl6CZvyJaPlCnIpK0CdhY2hbx/6rLKLV
 Yv2xDY7I06/F7K3vCRn7tR7/9U9vJhFHkTGT4DH/BCpYhpbjNZbOJFT97MfTCsp1HaGiiLeCrg4sS9
 lXXSdPVk3ThK2lywQ+5XCWFy0iSp0cNH+gJPh5QzpvZw+n/45H+zRxX33QHA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Like for the WCD ports, allow the WSA_RX0 port to be initialized
as a soundwire DAI.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..82a12c050d5e 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -41,6 +41,7 @@ static bool qcom_snd_is_sdw_dai(int id)
 	switch (id) {
 	case LPASS_CDC_DMA_TX3:
 	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_WSA_RX0:
 		return true;
 	default:
 		break;

-- 
2.34.1

