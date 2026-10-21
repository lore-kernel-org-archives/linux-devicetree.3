Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596794;
	b=qNr1tK+Sv62SVBcdjBEJthCd9zIdxkiJwsZx7JvIovWkVDfZYUKivd94PycMnGdcyBZX
	 prbPMI0Hd4+mCtfGeYLv7SS7NjuLXyYmaHQ/szuD1sIL6fHPhuaRe5KZufRhSsgdZNO9T
	 h06OKuiZ9MChndyPpar5gpbS1yEHwfZlHMZ+fL9wuSaj5ODW0UQGf17DC/Gz2wRBRU6iK
	 aCAFpt0jxV0Bzx/so2NaMUN/0UvY4ikiXjmlmaGTH+MuBYEWVBSSL430Gu9VQWOJksiwu
	 V205RT8lSwZ+/og2jG9VUyLHwSG46VBcrpGXMVWqnNQaQ39jt4uIhFPCPTO4u1VLa3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2T7x52CfJh7PTM89ij+e5+OFtjfOrYsnGcRAlxn/5p0=;
	b=Ubb/GsxlnXM4S4MaTkEFzXDNWgTV+WQLBoEbnfGudyXkcikDeIJ94smLwqID+uptBAL7
	 MwBBGiDo6vLKWAT+MZaP82RMyrQGa+5M27Zy73T/0BvhKetnnN4DPP0LLKj9OOGVDu0AX
	 2eagLuibXWPptWdaMbjI0Y7s+YSWs5LBAiOJYB0c4nWEePocED7IVxUBuJQEvEgbBpjSK
	 7zw9NekafI/LQx6gUJnYrcbK+XkGEVlH+m7pAhlgPMIDUlePy5Qg7SH2DvfoLwpoRkjgv
	 9QZiDaDs0AfqKI6Ps7AOTdj8CnEQaXdxYcXkfLymwjK29zRkzmVGBODUefXFlDU2XkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I7nQRYHH;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201FD606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 201FD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I7nQRYHH
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso11639615e9.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792596791; x=1793201591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2T7x52CfJh7PTM89ij+e5+OFtjfOrYsnGcRAlxn/5p0=;
        b=I7nQRYHHtdAkH0SfvkXhvsU6RtTUjm+0BzSmlN2Kd6jJMMa5w6ieA87y07koAAaAOe
         /8UqAm/sbX2L8YKnEgrIg8kaCEoRCjbNOjKwqQPPPl3SidXoTeQbGwydGB/gVr58AqeI
         f8HPOYYLCpZN08CSJlW8j9WgvQKs94EJgdN1J1lvNP8l7e54G5cEk2Cy0P3qz8im5ccm
         U5kuNZ4NfTDixsIttnTuQBKAVB4GyLCaV6PZMPdDatJQSVSDrf04nSp3TxSaQVSa1cyG
         BERkOIZPdjTcbXb8I9ajo7uP3yAXDuZKJXDB6hEWTRDC9FRpKHesfXbKyfMMsai5iieG
         QXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596791; x=1793201591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T7x52CfJh7PTM89ij+e5+OFtjfOrYsnGcRAlxn/5p0=;
        b=sYUNyHGIsjk2hMNtQMv5L4cq6xuUiYOPDyAr6L588dyb9uF5GO5Jkh9Tz54iIE1lDQ
         dQV8km4UGLKRGdjYlNrFBjQiLIOjFA9leHvYkY/7m8HPgmUKsKzt4GvrMFZRW0pXldqV
         BYY6Vka6MFripbFCP8+e/UCGfkWvE3JDWbx+1GX/Sfv1hTKmg1yDSD6hXd2C7O9+I/JS
         AmynnH1kdQ7boTgV1kWoaWe9CUmsNPVOrAmeczGVfPFquRctWj9Zjy4j7WsYrJN7B9P5
         2yiN1pgnq5AEnUU4Hb3GpdIqJnACNQZJshXEXXmBW/utv5e6SpZnsiLMEx/nclu0eE49
         SVTA==
X-Gm-Message-State: AFq9FYIOOu6xx3IJVDJoOmOw1uxpcmrtYXsFYpAvRPrQXjssVH2bVnPZ
	UzfoQvsOdr9Yjw8BCJZKs+MUNm5N54aKohm6jP/OWYwxvReSQqOGhIFseqJ0yJQl1fQ=
X-Gm-Gg: AYBFou3Q3iruNgZg0F/JU+VOIangdkYvYgXMwryiAIL38IcWEFmf9BQc15yA2gnLhfN
	JY6nKDMnCl5qUU8Gh4DJy+0vV1SPj9ZxEsOHSThJCX2RGO1KYO+aj9zLo5vlAnbfwo1Ajvd+RT6
	BD4GoHMqk99k1UKSlASlo2jpm/uXWMeYuIbbmjj83L+JDjQod21AYxIWDRdIXdcGTbewI3VbtF2
	NgexWBpfvwehGYFBK21QwM1J1ldi38i2YDsYwu71JB1wxztV0GBwtQMLVsMZfoxwnRcr8oi2lgU
	MQT6VM6USZo06B8s6lDMvwv7fylrwBNr1lqlcNmwoS2ANFKxxaqL2mK+4bdeM0TapRJjHIZ2MsP
	BfkdU0av2J/V5Mpy2cDbU1vily/RMGxbTPY9OQ42A1KQZbJLbUUhKtyY5trYSnh3qe+xRVeUjsm
	BPHL4y+g0VAXaJ9yfkOzkxyQ/bWj02O9bPoAiF1l2ozzInzVVIbuGkAN21I8nGxsA7x9QKJ2WW/
	pNBDOn4ud9S9dwpnPmo0mkkdbxdtGJzlhspifnlH70tYdxe933WoBio/fJlU7O1+pB+AkKnR03x
	DSzHWPdnz7ycRR1iBTWODSTijOwdLH+3oWUsuwynlCJiCVpCg1J3PPqJ7u9pvvfnSdZbuQ==
X-Received: by 2002:a05:600c:3b17:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1fdd31aebmr56977285e9.16.1792596791483;
        Wed, 21 Oct 2026 08:33:11 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm59333825e9.0.2026.10.21.08.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:33:10 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:33:08 +0200
From: Carlo Caione <ccaione@baylibre.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	David Lechner <dlechner@baylibre.com>, Julien Stephan <jstephan@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8390-genio-common: add boot
 phase tags
Message-ID: <atjbCWF1OU1c-Vtt@macbook.homenet.telecomitalia.it>
References: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>

On Thu, Jul 30, 2026 at 10:04:41 +0100, Carlo Caione wrote:
> U-Boot SPL runs after the platform DDR loader has initialized DRAM on
> the Genio 510 and Genio 700 EVKs. It needs the debug UART and eMMC
> controller, together with their clock, syscon, pinctrl, interrupt and
> watchdog providers, to load the firmware FIT.
> 
> Mark the nodes consumed by the current SPL configuration with
> 'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
> information and bootloaders do not need local overrides.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Gentle ping on this once more.

thanks,

--
Carlo Caione
