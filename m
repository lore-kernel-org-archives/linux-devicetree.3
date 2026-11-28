Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875307;
	b=RXJQZzpOfQnXv6MbZ+0HAIi6e58unPY2xigSmss5ZmfIm0L2G4FDxqgbMa/UU+qHzyMx
	 UWMSiDyjS0DOxyOqWrTipG/ZLYpGMfMwJJ00l92C4zE/mgNEHpzgeejSsLIu127iWyxkj
	 Q6LyQTrFMt7XTYY7KzsjW1mxnwPQcTs8Dn2dDhpch/tsjQq1pz6BME8dRg9D6HwcAc3YV
	 czPj3G2JCtvkbNbY9y6rQKJpBg6+hXPAGIs/cZoU6vdneYl3Z++y/cOCrXXBxpnn8q9dN
	 dmH2sOxuw/iMerSvFnDyVWVVVTFEyX4WC4vnAbJHZ72mlDq7Vl5hoBRbLLBvVixO0Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HJn84ZfJNZIuHrzv0CHcIfvwZwaHinXtB9Ojn/nATMM=;
	b=tBwqpT2Sw8WUaKHDWbY1Gm3ERQ60c9kku9uPzcjwBaWY2vnvAbPXVJGcpFy/o55Xm61w
	 GBbpYYy+frg711wLL7zatOr/CV8MIXxM/VA941c65+MaxZjiUVrVHZflUDXN26CgQrciw
	 yKeKEwH8R2rI0cOYa/zCMpB0gq0+PQbsvl74RGqvSTtVEcnWLLg6Bctd5hXgYIIM5LMLK
	 4YFpFpfOuJ6+oZIfPHsBYYdda9617qfkDKsTxaCoPw2sQZK/thaPc3gBr76nA66stga4H
	 78xdtypjYaHMiUQuMhj0Qt8NO60gBuXo6SGDTBzYqZ/y7Wy5Y449wYi7nzmYg7pP6Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/wuzQHb";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE566606A325
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 14:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE566606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/wuzQHb
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso147936eec.0
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875306; x=1796480106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJn84ZfJNZIuHrzv0CHcIfvwZwaHinXtB9Ojn/nATMM=;
        b=v/wuzQHbD8nfeNbSx0XGxb9bZ6T647gP1hj6dG+zdKBlNrtDRuqcefzv6m4RhGTP79
         mmGld9iGkATVHczfUZuNavM2051luVlacG1Ew1TnEjG8Y23c0xB+znir720ZIfWRwyAv
         waF2b2dUoI5zJdxTsg7npmXZ/RjLRHsXqX6yYCratmiQqj2BBrxJGELtRjZU5brjQTHV
         dyBlTVp0TRWcp3YI0AW/yuqcssP2oI4STazXV2aJN7hztjooODIvTL5R/gBsLfJQd6pW
         kE8I6rtafmaTT4yP9suCEN6tub6t3Z1e//qc94sXf9sRYivkN7dA7NWfm1TFIkxfnGmr
         6+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875306; x=1796480106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJn84ZfJNZIuHrzv0CHcIfvwZwaHinXtB9Ojn/nATMM=;
        b=Z4JrcFyA6JI6l68OafRilS/6UB3o7lL7hZMkGWoBjqaWGLqjoJ0zhlkq4benYiKJGg
         9gaZBwfhSq7WKJyQFDCqVKHs42PrndjHTtghtAJ+UultWhCeOEV8p0rn5owlKnsRkSNr
         we6LYkLZd0IZsmhgm9LvuhTIzLWIwZR66WwasWrtz9ReGqfxbc3TFiNLvIXxqMa9G8uE
         P+nPHPvOb6wIP9WbnsUQCTQS0Jx4GTB4hU9IPgOQIrjFGA9+OGM5LEkLks0VeZ9HSK9S
         3pP7ypIeEKC74wgYMAHCZ+bNO/TMRdCLAzE+hf/mnA+/OxBU/i5fF4ejCS3YPtHQbzer
         nUGw==
X-Forwarded-Encrypted: i=1; AL+hErELgMQtZyi7S1/jG8ITDwywxKVsgq2Yi329CjR0JbqI8Uo30aBRYTomT6U+S5HyajQl7jiirxVIE4fe@vger.kernel.org
X-Gm-Message-State: APuU4Z+mLH0po7+ULzjcZpJxK3oAV5zOwkKktPYG64Z7yvdrkD9/bHW9
	MND+VLHiMkL+CFSI6fAgDLCkKoeqLiIe1HNbPTtikTyaLIT+1/vP1oqp
X-Gm-Gg: AZFdTZeKZ3VtNi50uF1QkM0c2Xb91KgLH/y7bGN63kkudYKnnbJNznpwc8dHj6sn4M5
	Qm3pB9/+9e8v0KynSFXj7zpF0Pg+g9udEKXY7ZiB80URwWC9bOj0TUZcR74lRdazVAX4v3ZkuHu
	/U2KxZMPwVNS6vWhnQos6C2lnKNiFWSvacNeifyfDwy6swooZutVpVPaIORQaq/UotVELN4xKyo
	f5yGb4Z42IjH4R8cFxZ6oU/io6qD2VdJ0Y5tkDsTUgv7CxoCs0M0dR8OZ+IOCwZZddInAzXgHmX
	hDyt0nrrJVtbqsHEbIgJ1NizFmMps/aauJSK1o+ARVGQFdaIECSFy35TVdGD/zb31OczHSvkQWO
	RAztpOMXNswOjU6777cpCvdWDq5q/5ODaDlYfMNx8scF07YycWX2rI/CfdmallW8yvaHZ+LILkW
	HeHTir5uq3CsoUOHNpblLP4xxhVGbV2glCpM09hqSDzXfTglnmiK9r/fQknoA1DdtgktcNMlhBo
	cPh3MhzTqhowmh0Zs3rzVLxhRtTZC6yNf1edv6hXk2aHQL6Pat4ZQoMOGv6DYsEjD1gfcVg5jcg
	TU4cQV7stN5yZ50NOPiwLobRfT9w3oqTNbM4zTyEHpZqMQHqz3nssbl7uUU/UHivnjZEA/tzJ8c
	16Cugu6KXVeoQyO1LDE0xpyq7cM49
X-Received: by 2002:a05:7300:f797:b0:386:95e7:848c with SMTP id 5a478bee46e88-38695e79009mr24469794eec.7.1795875305781;
        Sat, 28 Nov 2026 06:15:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.14.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:05 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 1/6] dt-bindings: spi: mediatek,spi-mt65xx: Add MT8189
Date: Sat, 28 Nov 2026 19:44:25 +0530
Message-ID: <20261128141443.13065-2-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPI controllers on MT8189 use the same IPM design as MT6991, so add
the MT8189 compatible with mediatek,mt6991-spi as the fallback, the same
way MT8196 does.

The vendor driver's MT8189 data differs from MT6991 only in not setting
must_tx. That makes no difference here, the driver then just supplies a
dummy TX buffer for RX-only transfers.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 3bf3eb1f8..34e833745 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -41,6 +41,7 @@ properties:
           - const: mediatek,spi-ipm
       - items:
           - enum:
+              - mediatek,mt8189-spi
               - mediatek,mt8196-spi
           - const: mediatek,mt6991-spi
       - items:
-- 
2.46.0

