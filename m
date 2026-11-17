Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925564;
	b=TqLK3DdXYdwM/pWogfbheioOt0PT7IC/dbbV92KYWPIzXqLGL17jhuemLocNf2CMddif
	 XzL0a+YLl0RyOd4gA+a9dTu99Gb7WbL9yIFBlw55O5DciupebyR67goZ7sGTmRFAPNMCv
	 5En43JsL8qNwGR+c2ztsKZJm8lZoGHEeODW5mrz1yDXsajRY38SRgb6HsA77YZxyaLM9+
	 +yglImrLxUbtAkxJnf6QoghtBeKkpTzdoJDegK3iewY12hHuHy6Ys8vTQRj/GZ15c1Kh1
	 o6V9itdXcvmXpwFyEJUZI7Ajv9/EAWswWq0o1HKbonETSz0cjAPtMgBknkVNiwnG+Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925564;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=PjWzcBhkkgVIs9w69hUJsb5oT+L/Mcad55T5JmI+iio=;
	b=cmkQoAQIewc3iygJxch0UbtVL/yzy7Jh9ViVFASSmg8vrEzQ4UwqOPdaxlskPCFGQTAx
	 ttn5b33Y54NbjORIaFZxtauP2IC2OJsKWRq5JsgazLMIWtMc8fHaNfkLRZSvXEw4EJocP
	 EzVN56XP9koN0fxhfI0GIogSOOphkPAdF4Rh3MxFDGm5ZKR80uWreR7KmFacQX8DrY8VU
	 M0GyYHHh596Hw+pd4+vBu+vUiwxxLPiZfP9NUnIFEv0S26JV6tZ3xI2/cNW2t27aY5uOp
	 9olAGmOAE/SeIwRwmUMTD9wNIueq7ejAqvU2nWUb3I81MdqJce398yVqIsmj/NU+aVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=E6nTjQ4n;
	arc=none smtp.remote-ip=109.224.244.122
Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A9606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C10A9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=E6nTjQ4n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794925561; x=1795184761;
	bh=PjWzcBhkkgVIs9w69hUJsb5oT+L/Mcad55T5JmI+iio=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=E6nTjQ4nXY2wVq8ILFv7CKNwzPaPG0s6BsRHUl6vP2rMAqimwzcmGMPcIuVGbu8yr
	 wIDiF0PcO4R5mHmcjBVci6m6fnj9WylW7dDEV1IA/Z5la3tGcyizTXgMYk+b8nmje5
	 ZUrT9NfAs+B/8H/2cGWYFhzf3JoirIFO1+3tDhHS1u4VqM6ojhmsbpfNlfuqzfR8OH
	 WA7oYOXCYAgRBby7IHCQ0sWauKEB7c7Gdd/9fZ2pfp5aYQJ0Vy73wYccwfwDVqj0RU
	 Na5nQ8yRUI/uNdBrytUKlOacddP+Dc6e6xaDZuqX8jJXEfqMJ4tg9mSr5t1v4dOLJZ
	 d+LKVymCLGorA==
Date: Tue, 17 Nov 2026 14:25:55 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA support
Message-ID: <evZkmv2okbTXDrodokQupcspmC8Rk0aHgHxz_-5P_lHqNZ9vat-QT5bZTP1-P2zGeuhCCl9Qv4BdGN-LM0mhnAPz3ibpy2slzjvFgIH3eXE=@protonmail.com>
In-Reply-To: <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com> <20260907-6572-gce-v2-2-412a5b037290@protonmail.com> <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 25c3788f3b699fde6da1f692dcea107b1ebc25bc
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

Legacy ISA patch of this series has got Ack now. Can you please pick
this up when you get some free time?

Thanks,
Roman
