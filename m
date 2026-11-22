Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361255;
	b=bPOJxV1J9oX+8h8kmru5D0jNcbms2ZjYmJ77PEtU9BhbtsQhyn/5M1TaHTG/vun7Mra8
	 3pbtTCwQ9SOhZzcE3rC7DJiuWDcicAAvacOtm2lc3DpYymVwZSaC+QeJG3oLUyyGkJ8aY
	 +0A84mp+nxAFcW/xrr5ltOFoaXD/QaD3D2AhmN+1+ayiWGimUNVkaLRoWFw+shaZ07r4D
	 GfXXvJBI+VCcNRLJHCA32Ogm49CFc1aatcU4xnnqI2eE3d0gfDOGI9WcVkL4dd/QcRZu8
	 xYW6iJhVSK24NM6Ef/GycnmyfsAhj2Kjr9ir8T5MnvStRKO85k3tPrcbdQjA9ebOBxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ot0zJlzFbVCe62Kvau5YPtTDd6GdHkdbEpE1vxuLRFc=;
	b=F4aukMDoVDloxSoPAx8xXE8stKy3gwoFQ9PLb3VCghDQNWO5kY5cPSSyetTIaDlBluHx
	 yFu/7IOGyf1sOb0WFOEqk5nvTqNU4c7rovPjLq8E+RcPu32sxXIhStkjojajoQzqGH/uk
	 FS+u4KG08lvdfhh2HjYDCbiJrEarS3XuTkfi070n5kwhwaw4v4d7f1TxwC2BezSy3b1wX
	 gt6EJY6A5S07gMo4+b7NXUTpfWcTC66ViotMwCxoWqFd6wqV8BWDeHHzeT/n6PeKujpdL
	 vHrvf6rrgtVmGfgUc5/5WjLvrBQ5N/OlTgv2Xrg3MX7cDfgXKhYCPCpLCMs0XKuy0vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PnH7L7Dn;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9498B606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 15:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9498B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PnH7L7Dn
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so23556845e9.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 07:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795361253; x=1795966053; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ot0zJlzFbVCe62Kvau5YPtTDd6GdHkdbEpE1vxuLRFc=;
        b=PnH7L7DnBZ4AlNcEALOd6IOWa4irex/1Lm5oBthjpFyAhqmWwFFq8gIKqMkc4sqGoW
         HZlmoeW9uEUJziypoQHvEs+htAfo14e0038YSI0qZcFUEN1YmHPo2vXvrwkwK0/ZRiIg
         s60LnC3AzzZ2/EP3O7uMQZKYXOqKoHOBdcFDf5P4FZLhoE48mW8jrd0wcmXWBuzFmd5c
         wGeJPggdzFaVNQgOgumC6ZRyP49nAyG1BTwikpiQ9hxPbH5n4Oo/ZF+Z884wMqNdlqpV
         PUHG3ggKOybXoTSLMdvYgc/2CvGFHEAbBmDXfMlmMX02d1R551xSH7XAfBWi2jC+8ZLL
         A6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361253; x=1795966053;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ot0zJlzFbVCe62Kvau5YPtTDd6GdHkdbEpE1vxuLRFc=;
        b=JlMwdfsxjXqGECoFA1ArmuLMZTwftlkHwfreAbvuFo9EP+ZBXfA+OSwZdsH+NOriwC
         IUBjxqcm45IL6xztm12UfmljH9NyUkO2KIvVptzZ1XFDnAN9zPD2UJciZUyGQO225Xae
         Y+hK31ofexeIFY3XZY78X+Ucwibr5KQGqSPdHs9bltEahCixuD1YW8YZqr+v+IkErtUH
         y6ez/7ncx0XEx48I8qYCG3NKZOSpYv2GAvM34m9j9B/83VCdsh5usz2TqYxVhy2Cc99y
         WQz1wOpUSQKhlvjJO4ims0tqvT5aEqcoSWeETmE7MatpWwxWIzobGxsXKg/87N7jWc6h
         XA4A==
X-Forwarded-Encrypted: i=1; AL+hErFEnFxy4E55GcPyjYqACps+yMB8d6q6PSTm99cXH41/jPrLrKidJaYiNqTCNY/VT9X3O9ow9lSoh53+@vger.kernel.org
X-Gm-Message-State: APuU4Z9T1xxWvPcK4SPiwGBVZFhmPnCHXS2BAXGGMNOssUv9c57owJI6
	DUOJ7UZuSXbqt2Z4Oppo0O79nbKCL37+Y4HKii6aMFUUZjODEGuf7k9v3JFsdHeYAqY=
X-Gm-Gg: AZFdTZf3n0kfH/dPanj40EEyR2a9sxIcn36tO7BOzUJx3rS1SjnDrETkYPfQBginNB7
	Lex49P6qOqXI9n1rfW6OwdWIhpouJ5rtpvo1abnDZwVORtrn50bg0PGXZmYFj/htn0WPywD9PWc
	JCQVdBawhcmwL81cjS6PrP5TIoXH/mR0F0oz8+MAjuH/SImiPzUBs0w5rzdjeMpEbW6vbh3ZmST
	zMTEAawZsT4F67NWWLjAggHY8szWePVWfKKTyzVxk3LICJ2CnpvT7DiLumNvlPbIvt3p3NWrx+6
	70VdgZw6DiTYYpoOdkKPq6DQdPwxGdqefy5eJXqXQA1y1QeFWpfQwVqO4UzNz07mm7vvptNv45r
	VeJp18Lc9dilX6QrDNxfn7/Vjur6bQmiTFMwO3p7Jpxn/vR3GvOTeSsxKLXjDuN3MqFAJ7jLBxv
	OVv53ygTKH7My0WaRzb5IiZxAT7dFDa//t1wKuB6zyK6vKBDQqXBfwvbvzX404AkKg8L0h58kDx
	RjcTKRjfq5+fiIfvQOM0WmXDrfL2ji3nBf8icF0EyEYxaTol+DOi96WxgRRCUlaS7qxLJnRGoq+
	ltRNCC+7eOy2QjqdZA7XX77q7lCNGivz3vRoK1etvqq6Rx0Ltw==
X-Received: by 2002:a05:600c:3555:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb8881da76mr187712165e9.34.1795361253164;
        Sun, 22 Nov 2026 07:27:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm324114005e9.14.2026.11.22.07.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:27:32 -0800 (PST)
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
Subject: Re: [PATCH v8 0/5] Add support for S4 audio
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
Date: Sun, 22 Nov 2026 16:27:28 +0100
Message-Id: <179536124894.2728475.16240917993133855473.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=SakUBu+Tj3UYj69tUpTC/fsgrcNkMteoX+Lt2iuPgXc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMnE/+NymUzd4hva7CSmxX3dxLJ27tYynZy6qYorFaU
 uexikFzRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbCdIThv9fc1off4xQusP20
 lhVaw60es6lqQ/uRSbU8X05aMdusWMXwP980O55/ScYJq4WsZ3SZNh+93vxsmyBL/v8zj3qqwxS
 YuAE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
> 
> 1 Device Tree Bindings Updates 
> Added audio power domain and S4 audio clock support for S4 SoC.
> Added S4 audio tocodec binding support.
> 
> 2 Driver Implementation
> Implemented S4 tocodec driver for G12A architecture.
> Added S4 audio clock support in AXG audio clock 
> 
> 3 Device Tree Integration
> Add Amlogic S4 audio subsystem support in arm64 DTS.

A clock immutable branch is going to be necessary to handle the dependencies
in this series. Please re-submit with clock changes only and a proper cover letter
so I can merge apply this and provide the IB. Thanks

-- 
Jerome

