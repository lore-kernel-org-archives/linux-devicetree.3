Received: from mail-wr2-f24.google.com (mail-wr2-f24.google.com [74.125.225.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AA6421240
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233584; cv=none; b=NQ4w4cWIeA0tmMQX3A0NE/x1w+g5nn94xymF9zba4Cs7eVWdLQn9ZqzirI0cdd9ySunQFQGg3asMG8bQy3fERug2XKxoHMHLlbbMvsirMlte/1SxE8PBBrkG4IW27dXYSWEwTfYMD0dYFgPWXZyfr82LxSa9Z72M9KCWVMAxboA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233584; c=relaxed/simple;
	bh=qF/GmJdDAJbhCt6NxR0IXt/ma6iHiqTNuALlBPxzgdg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L0Xl7XhsY+jraB5yFvITf/0n/e6q/Rpshtt/Np2euZaX7sCWkUk2LtZMSxyKEovBBrtNHLL0QoLXXyAcUepeOpGOL2xwdwKndZv2TXUMOf/M1ApvqYPbggWInvXjKZ31ts+DSOXEuHdXoYhuqEhVr2LiU0XA2HKamajU3oZKS2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+echMSk; arc=none smtp.client-ip=74.125.225.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+echMSk"
Received: by mail-wr2-f24.google.com with SMTP id ffacd0b85a97d-482f63546c3so1365479f8f.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 00:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790233579; x=1790838379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aNGRH9rZqGsSRMqbv+c8f/d7VbynsVVOoe5uGipRICI=;
        b=K+echMSkFK9Cg8+MpoQFFvLFuIprDqBh3s/DkKFIEoMv+9QAnLNnpHBI5HChGohXTa
         au7GsUflCH5v5gWxFNJ59F5JRjijqCWE1K9o865FJ3ElMJ+ZEDSLWU5S8jSfqM+dL661
         5NCvSMQuByDtKUdiqAX1W9H/LWH8pNH8WTPUfYAmhQQOC4RDM1zBq87fAdz1EPsMGGFQ
         2jxqle42qE/pe0SYoXA9mzURbzanIuaUTptKtL+EUAWCnSElVHidYyeS/Um9CcppRp45
         UgjX6rkchbqshxH+8M2UHCOZoyC9VvYPw/ZF5X4n9pIIzonesUnMAWyhBAv27r7ks1jy
         2kaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233579; x=1790838379;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNGRH9rZqGsSRMqbv+c8f/d7VbynsVVOoe5uGipRICI=;
        b=UlwnVkYDnx5s5Tp+CxEdkSM8KsDIGD27MRdiYWSLVkkp1QoBu3yovMsbGaBHZ11gFS
         neqvBpRDRSltolbIfKDO20+5++JcbwSKpEJDEouCFUrpkLrLWN6jQoCoLtOgSkTk8FzQ
         7sNYwlnV7LGbWTfkZhBwK+nMQGd+pE26F4OcowtMrYGQFgNpIbp7NK07yz+vpvogZ2Vh
         JeHsRaIGFRNqjBuxKtklbXhFps9qIKPMtS5TbQjlG45NkAqTSY0VBWGfFaOAvtkXrp9t
         qECiVHca4IDfVpLD0UdQLQ4LG84fL2WiWeDtfcfJM158EkJH7jDYoEGie9IUvmPZzpT0
         B8bQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvkirXb38oCasrRdEoKaU2+UoRQtg58iRHkQCNlwtwkWUdMNtnbhVzIAkTx5m8u7V8gTc1lTW5mpUL@vger.kernel.org
X-Gm-Message-State: AFuF++kgf6kiCeiu3wlKvImyowJNDffZPxMAbNplCWVZWOeEZ2S2w/19
	pzka4Tn9JAqWXkjwI2Qhb3mACJx5obKf9ZzVjWyf44YBObmk+6FgO7hW
X-Gm-Gg: AYBFou3Nj8mjBmV7BUz8aa90DVZTrKJYJh0lKVAgxjIQ5R5cBX2dEYuaSUJqFVneLfz
	vraCRl28TkcvfuYjdM4GPSa8fotlWVzyjadglESrIjy48R2WVC3U5y2BuRyiYfwOWcrsZsgAwGg
	UahVUV2L9CAACL7R59If6xDpksvKwtXLLUh+uuHqyljrEb4aafIeWUcBVGKsljpBXx0yybTUkII
	GUBt++nKEHJwkA3jFytroptcEadRe05PeY8cwVs+BcVOOL4qHZpbJZ5bYK5H3XmByoQE5hEeq3k
	kle3ElOSM1ISDuSPs4P4TSehPmJc34NbXI4QJp51f96tNtmaFkw52Vg5k0AO5eZHtTfQ900aw+s
	CJT4sqw3Ssi5Rfg4Gz939sjGDUry2Yv7kzFuM/1c8nl26ZJ+7mLNRgwywQhkwuuerQ+IUSfjEmo
	lqyvcNdZzbzIYlsPf4nH42jQBdhTuaq9doaBJEZfYTnn+IjBU+5X98WxWlBvjQ/h1AEH/zZsJ0w
	+rWmalQn5ApUjHicwklaax1WwrkrZ7iHLMRv7tdvZpLNWvo00zGDSpiwCFDAmn/s0jQNj3WDoUB
	CzinUJwUD2RJMRrIR/xbUc5mBWR0nhuDv3u9F6aCZmvVDjPZCYEdobQzpYHwhmSwnUAeHJW6/M2
	8L6gVrgk/sT0k/XGmTnn4RbRcZ/Y7BjTa/OQLyKZ6Z4bLJYll3YdpRz66vWZW4rkUT+gSZ/7u/y
	GaXopX
X-Received: by 2002:a05:6000:220f:b0:485:8c16:5ee9 with SMTP id ffacd0b85a97d-4887175fceamr2133359f8f.35.1790233578647;
        Thu, 24 Sep 2026 00:06:18 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486408sm11108512f8f.9.2026.09.24.00.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:06:18 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:06:17 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Tsai
 <ktsai@capellamicro.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: iio: Add dedicated CM32181 schema
Message-ID: <20260924090617.00007d47@gmail.com>
In-Reply-To: <20260923191616.2217203-1-robh@kernel.org>
References: <20260923191616.2217203-1-robh@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 14:16:15 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> Add a dedicated Capella CM32181 ambient light sensor schema. The device
> has optional vdd-supply and interrupt properties, so it no longer fits
> in trivial-devices. Include both optional properties in the binding
> example.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - use additionalProperties instead of unevaluatedProperties
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
