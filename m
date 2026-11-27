Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745714;
	b=QQCKKuHevLixA4KcixntUysX0f5BAeeRq9/HMjraIqFjT3xLLIfNs4hj9LzP1OsGCUx9
	 Eb9Dv9YyM+jJXIwrOnPa5vK/rIyAEB1Qkw6yfEaocSkpgzNK4o2qRoDoEAVuUfv7Hb6sb
	 CxPhyEwFx4mRZABgOlysNnXc24f8Li0Gv3a+TnsPKr4krWRumQIpEIbylLqqxRzCv5aIk
	 69ROdngNq4rtzaJtOjnlUkoHHSdRvnNhfPeAMpBCCCVgF2Pqfiu++kzNxg5svkctMMk7k
	 n7Bt6X5ow5p2aB1Wl2isQwtWS0YBJ+VoAjlxye7NLQrXV1p/iR3G3C36OajAxgQWXEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=h1ArAbbh+Nj6+8II10ytomm7q9koo3eQf1sW7tmJxyM=;
	b=tf/0wxRQjaj3LhttCqKSn9tCiY/QRBCNUPW9rSagVyesirWu2HbG4ppqfxYrS59OKnLY
	 Bn06uAEL/V4TVzTPkP595LUVE5fOMHp2SlNpsLSSY41Flj5hFSgq3e/wLawos4Nq/ahmA
	 lpZ/QHh4/hpYj/+gyYp4pnSuu7QsUXfVQbhbGzkmb4MM19pTtQt7b25pfEHEs//T5w7h6
	 i5ik7qugl8OclSrABzV9pebxxneYhf9YkJrKt6xLF6DuNYVakEFlhoOQaiiE2Y3ljGVBM
	 XGfvlY7OddXyhpTgXF34eJ8tL5OSd2N6JVkEUjOhW5T0NL9dFgShZDUgoWCYoXUIAiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdsq5qhN;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6FB606A326
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F6FB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdsq5qhN
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so3769915b3a.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745714; x=1796350514; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1ArAbbh+Nj6+8II10ytomm7q9koo3eQf1sW7tmJxyM=;
        b=sdsq5qhN5dmS7dLj4XnR8rPB3KKvR8KbIHitgjRlB7ObsgQgM4C+622YeHltjcGIaF
         zBJgLrIRJuVzPhP8rGXpv2INY7HE/mx8unNhyIZ+nMmHNkrHc7pD4huKWXoh/uo/QfZu
         8Mk4qcTbBJw5E6CWpI0LvzKm6pRdcnNwJxtN7HNfTVA4JWTHr7osJ/tfhHfe2xTUFyLA
         WH8lcSxnLDpJAfZvMfq4BE5igGr/MbDFYeBLkOQzuFc6Q1pNzCDohFPFf4Ky0CmaaW9C
         DPvN43vMLcU/VFj707tmQ4T1mEbYpTaldm+ZNOqhpMmGJQJ1EhcTsUTe4HIYgH+CgWx/
         w8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745714; x=1796350514;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h1ArAbbh+Nj6+8II10ytomm7q9koo3eQf1sW7tmJxyM=;
        b=EgoZ/mDyxrcW3IOZQ3qXKdVTgBYipSN6k2U+NdFqTeOj5uxNkE7NYFmAaxFQM/nul9
         v2nTlBvAeiZq43sk5h3ERjgKqRupVT6vHaDXUY1eh1ofJ1GBe5pzr214QRNUkKp2CTAW
         DqpjIIif7Tg4jq7t4/Cn7//G/e7KG02o5fefE70P+tl6wwp9Ygdn0zpo4f6PWGg0qkIv
         DOCEBcey3T7y4nez8pCGDLnR0UNiAcZRHUMRVTDQiCG+UrHwUKxml9wu3z7xkZ7m5xC6
         ZumfoqQrIx0L0kIyvdWo9dzGWJMVY38Eya4N/rp/E2Vau8C5wm0Y1ix63eq/Ff7oLOSK
         oMVA==
X-Forwarded-Encrypted: i=1; AL+hErFaWUoOFrKvq7jhBFSntrqCWlR4K/qsZB4mhW62uFGOKbLvNFNshqox0OtR0+HgkZU4HJlSCoiYg44Q@vger.kernel.org
X-Gm-Message-State: APuU4Z8e26jWiKmMq4h1Mjlt7y7SlCvFkxcSCq059FxJ7dN7OptbPrMA
	gP0AnD61WMQBVhQFDhkKZVTxE8F8IEEkAHaAFV3X4zvlgRipxVGaTBXC
X-Gm-Gg: AZFdTZdles+WBuM29NvP/i+EpIgQGxNqejf7QE1aIzjDcayUiwZqPJoKjXtsNWvMaTU
	rw0AKJ1GxrVa6EMXv0gczejLOnbRnBmqzjBh5DCBcO6m2KHTY2pxGySco3K2ktKkUNMrWeAbtwF
	XGvS48rmzOC/wVaulpjFn4LrOQ98w5cxWxugWO2EhuFggKNmBebG0aO2r2X0GLRW1k5NNT8zSaE
	NC42Qj9MM8oilFIhbZnnOk03ltjhSctdRkWpJkes4eWx2TbrRN20F67GeGRuMi6QBoHjjd+DPc7
	GmFYz7I/ueJbA4ExGZ/xhOHhK4FkWNNhtvzsonyZA2ElCMtYapo9gzCx1letB6H6+kBwk3XRxMT
	DkRcPUBx4qS108/Z1xeN6DR9TY1ZoXV8EV0cgOyKL62tZs0xweA0lynVb8kzPZ73W3jomsUowJL
	hFxhRTsn1mE00ME2MD5IPBwi28cFuqvjTiLMBhTqv675FjqlxGuuqDnqShI52W7Hk+kgAy9Gwih
	Ar4IUOZdDTcLNV/X0YiW3EheEM9nxdz0YIOMm84klt+Cpl6KN4xHGXzsAwKrOypieK/Dtyjjnqr
	zs+kGg06XF60W4oSJp1idQdADrSb/n2fL2xcFwjUXofjj/bjXfhNR0TlZOc1cstz0lOdY43ge8c
	=
X-Received: by 2002:a05:6a00:c4cb:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-8c922b00017mr13559729b3a.52.1795745713852;
        Thu, 26 Nov 2026 18:15:13 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077babfsm11807929b3a.5.2026.11.26.18.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:15:13 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
 amergnat@baylibre.com, leilk.liu@mediatek.com, me@adomerle.pw,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 0/4] soc/spi: mediatek: Add MT6789 PMIC wrapper and SPI support
In-Reply-To: <0Af_vuU3D7JCxCsHmjyJZCQhptiOPd3Y325yrg4ufwjT3C5cz6cgJxU4CHY4qfES7Hhzcb-sxm0o7dj-diOzMJPCcw5bSyrYi5CWUNsXQus=@protonmail.com>
References: <20261126031001.27288-1-iasnezhkov@gmail.com> <0Af_vuU3D7JCxCsHmjyJZCQhptiOPd3Y325yrg4ufwjT3C5cz6cgJxU4CHY4qfES7Hhzcb-sxm0o7dj-diOzMJPCcw5bSyrYi5CWUNsXQus=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:15:08 +0800
Message-ID: <179574570832.2422.15788597758077074271@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Hi Roman,

Good point — there is no dependency between pwrap and spi here. I will
split this into a standalone pwrap series and a separate spi-mt65xx
binding patch in v4, and move all review-history notes below ---.

Best regards,
Ilia
