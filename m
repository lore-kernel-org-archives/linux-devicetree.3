Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606013;
	b=DayvmsxYFL9hxhXQvjfoR7jJxqc6yycOnO8PFClNMCz4dzNmYLYwC1PltUn5mHyO3IcG
	 K4sVHp8K2kBfXntbxWG+wI0ISUCWnducM3hFfDWOxP13kt7+1T94sM+CSbPrvcSTPZufB
	 +7eift7LPYCdlJed7LiyprwwUVtlozo7+VjraGreUB2XcQWhu8quYsqE7HvQTKAP3ANuA
	 qTFl4KCHsu6FHZ5Pj3IYRdYYllgqZqRIvsLcEsUHUbl8AxRopcWaKkIYWPxb2mGk2MGyN
	 EWr4SDQbbuuJXRt7kI3cD48yYnlYwW5Z1qGBikja1DdtRuJOC/JIhMdcxyTChRcEMSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
	b=cc1TDZ3lAGpXz5Z2cp1Vh1auEqDMxoS09LRzzzHQ4DM2D6wI/89aRONslQWbONYky2SL
	 mTvtO2WE9pwLA7SWV49KgcTFAfgblKg5NwIVzlmdQ5wYdP0LJXYQF0i75JUStXiLAWc3X
	 HUnf96qtmw3LZJegB6axxf0lI7kld3yzejLKUCy5Zfgj6iZ/nGGje93qzIxQZEhetOcVR
	 babADAhRqACFy67zMbX0r+WVktMSktK//YlnMMRKW21QajD8EFxQWINb5CpHaE0fv+f6H
	 qYAjN+1h3K332/oXMDKUvt3HD5xRj3zCwAhVqA8yaozIi1lhkDWzgfMqxtn299O5TiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jyGKAlov;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B7F606A68D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B7F606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jyGKAlov
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso54468301fa.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606011; x=1796210811; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
        b=jyGKAlovcwZSdrD0MngFnWQGCgbR1bsNB9jg7IqxSmLK0XzoVhx8RwgXCJFWbH91hG
         dlLvGqU0Ihq4/jX4SM6J0XYFj1elFigqBzomfWLEQ/aFm/f+wJFvfrrja5wACD50Bsee
         ZfrnMhBo9IsKKG35FUjvaF6cSWSoFpkmcd+tLlvjNOn6TqYjwqTb42gMU5RJEaMSosHD
         ClXTTley3jUlB5UwPfbQADiM+1xHBP57dQtvUL4QTDI/vji0BuUmXPtUOHeFgvmoZ2Zp
         vOzd1ZTu/5FSppLJJD57ABv+WATKIGZ5Ex2mJoFfcPj7HAPaNlX8poONISTTeBAxgnY4
         vZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606011; x=1796210811;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
        b=ypqu8Y6r+ZIKKe8O3zhc7+CmCGkVQeOstxJ2EVJ9FX3zgQ9ooOfemB9kuU1lhRYbP9
         Qg4zoVTbi3vQambUTfwmQDlDe5wLt+MZ/uX5jCHSM9IknhmMeSTDI9JxbQA1A/Gi9grk
         aP1U/gIvovqdNyYIxXXkjXNilZbr1rZdSyYoVgn/4MPQUu1wBaE6vp8Mxuyp2qwXJXgZ
         bVrqHwb5VALAekVcc9AhCs+5ohc5tP4sDyOJ+dbYTR/jeHLSxhCYr1SmbVxjuShok/bE
         OPpuVZ90pXpKbWiOLzyFjcHjAJaswZExzZwRSPOlCLJgU+DpIoZR5c5GllVgPx2Lvs2a
         D3tQ==
X-Forwarded-Encrypted: i=1; AL+hErFqetJSEqvzzz6M58oYq0b8HNC7QDpnpPo2Jgb3jNVDZ4ag7XTy3XPC8myRN88cnwqGPQAymF8W6Jbt@vger.kernel.org
X-Gm-Message-State: APuU4Z84EAt7V0kdmmI250ULx5YXAMu/xBcUdTyEsFSlvNlPSr+z6erc
	z5/Bppimo/yYnlVfD4IJVZTSRy9VDf9DlDuB/oTti7GxJCrrSlpuRILx
X-Gm-Gg: AZFdTZcRvRp2o07AgnwftjaiVSvHoacXd+3o5AP/8BezQ3zoCO+9aX1ehlMq8Efv++1
	/nGMFUoHKHkPCLGVxBjsGVizzfAd973Q2j4yayeNKYy41qAi9xI3i8n9Q+EeFnXkAIkVEwJR5Xi
	M1TwpfZGEipCDApv5BxVvE3JhIbhENm9WVqnjc19pDoPSl9a0RrgbT0nNFximq9Hs35kn5zCBXp
	sqCVuh+O9iNiKE39Cg/hBVOHr/IXCDSSR8lDF6UhXmNvDwxDQcthjPEtwC2w6COXKjlQ3P8Gs9J
	+ViJr6Eed/gPR9MslhzG0izbPnAhhTaqgfyyiZm7dpPOW+FwhzAtgKwv1g10pIhvX6QTPp/8vbW
	4tsxJ0mcako74BUf5BkfzZWgExW0kXuw6TilMRFtWmPjB8AffNoTafWVPm81c5yOXoLZammvbqG
	EZz4BCL5dS/9UtFWnfJPFM/fCk2t3InOsilgBhWjvxs6Dbpg0Kc3e9pIWR39+LfiLaRcDq4F7TG
	DvSOcS/irZ3cxP2SzTrjY3gt5MyHqiSoK9Lv/YjKfQlErdN0u+QDcEGT6KvApGxJTdLxYVr1Qr8
	HLfieYI7X63KeNtBIkVe39u0L65NvMljb+BWyyTEhHNwZOXFDa56EB0=
X-Received: by 2002:a05:651c:b28:b0:39c:624d:82b9 with SMTP id 38308e7fff4ca-3ae7f9a073amr54848531fa.4.1795606011279;
        Wed, 25 Nov 2026 03:26:51 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e3c4sm46556431fa.4.2026.11.25.03.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:49 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH v4 4/6] reset: Add Cortina Systems CS7542 global reset controller
Date: Wed, 25 Nov 2026 14:26:28 +0300
Message-ID: <179560598858.3.3579752078270188660@gmail.com>
In-Reply-To: <3b8b8d154a841d80de20d31c32b2fb4faba11480.camel@pengutronix.de>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
 <20261125-cs7542-syscon-v4-4-3337bb0d3b48@gmail.com>
 <3b8b8d154a841d80de20d31c32b2fb4faba11480.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Philipp,

Thanks. I've switched the allocation in cs7542_reset_probe() to
devm_kzalloc_obj(dev, *rst) for the next revision.

Best regards,
Fil
