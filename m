Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87555318EE2
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785063617; cv=none; b=Jh7vnd2tEwXoPtmiZv7nulYRP9u0MqEm+9feDl2L+6BadNUAl5U6G9V7DueIK13xE6/OZk9pQvVCK5kjwE9GGhOBALq7WQJJ5Sckws/UcJG6CJtDBkvHk9czZEGqUeqr7qLDvcX5bBMStl0xd06rlgH9hUBSfPa9Vg29QUbws8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785063617; c=relaxed/simple;
	bh=byvuZJYZYd2MSiuhVWfo6h4n7bx3BOovOl/DMV0oaKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8OxkfvGwhsrRxORTlre3OUD5BuRNJbWuBeLOyjHim92X5cMrdGrvJ9tFJG+N8tkJR144MAx3iAviE07wTFDcVtLkZrNsgvwtrwnYn+oMREp9G6r4PGNzknk3iKA5IGhHDZ8B/Vm8/uv3EB1/679UjGRTgEyaZuercgLHp5qDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCGr6Y4U; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCGr6Y4U"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so19273415e9.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785063614; x=1785668414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GUYubJZOlyk7ZUcTegsKcSoPhTLrbF/NRujnb44b+Dg=;
        b=rCGr6Y4UG+COIj/r0LxXFvd4seBVaJpB2QAidIeeG1M5q0gjyDRYR2uRWywZyCusXH
         uzHxt/j0Ov6RADBdoYJMD+wPOXyxnnHh6Uu+8xXJ/SLV0ahrhe04DR0NrDc0KhKcXTbU
         eMkdqJBJwgHp1P547cQA9uzuQ0pKI13pJ20ghmNmN/LWgSkv/V2d6gJRU4bCBamD468l
         GGDsnlDawzjTg2aGbatkBvNG7LF58NflJUfF9XFOUJLpKGfY3fm6SMPgDOsgkQjDezR7
         8E+2ELVkZgYerPnXncqxPAS+RU4rixklFmzW59UvZqPZWf/SFIg6L7DaQ7CKGNhf/rlV
         vHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785063614; x=1785668414;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUYubJZOlyk7ZUcTegsKcSoPhTLrbF/NRujnb44b+Dg=;
        b=Gpl4S6WW2YrPe5tI5gDMhvv2kth9ThGIGYVjEGU7xBqLQI3eRWuDFhsA1FNz9Yhkar
         N9JIlvecwcyYgKJA5BFW8RhjGg0oz3om2V8xOA9jS6ZUEL+pNV7SrroD04n1Ar2hRUGf
         2QU9zjvINgRBNFd3lAK1tm32Ff6IixEv6+PFxLMy9d6XR7+rLCgsNxBlILDrlT6FxxQ7
         LraGRDW+jCkAFNGhJ2EU3u6/eqBh5z/K1ms/zPisx1jZVAfabMPhNr4CFbYWx3vBq+OV
         F+QS+zero0lp8i+koy+SHcDMdlwaBC83CX/4n7oRsvmrHEPUY9PZ/GGEegRYqKel/Aaf
         Z7EA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4sAL3sdoSXtkJCuIsHvkWTmgXkiBuJrsLImSK12zaBq+6K6+kpW1A4Vfz/3zRdMt3bGfYdkY0YH7+@vger.kernel.org
X-Gm-Message-State: AOJu0YycoHGeaD/i8r4XhqvrrmWci9V7EJtPBoCBaMYN3O6hy8+Fm592
	3uIN66+YthurM7iPljcplTMj2Eys4dGqbUxXk4I1i3Np2gOp/rP0YY3n
X-Gm-Gg: AR+sD11PGXBprcMSsqXT/mLLGsVuGiuWL+CJ1RyXrmyxxQfIvmKqlJA0Geta6eRUze0
	m99RQ8Q1pT2GFYCwt5F1WhRdTQLgY1yJ5AMbVp0QgnmeddvfZaXGVTAZmQKtm2MmQIrDL6pHNxP
	DZalEKNZAzdGwDoVAfeOMaYAVu5gIq/Ofl1dYl0GisseH4IHDTbb1EvaUQrhujGZBKhJIxVL7GT
	Ugr6JXWWHcCuUtm/XFqubmH/ht1uiDC2HiZZXgZHBPSTMbp/DZ6dt4Z9L5+3d0HGwqC1GMzoG8G
	uT2GgUI3nQYPP4BDwLvd+lSouuSi4VwZ1qhV0FfB679Nxo+kqLrgBA0epSKrx0IoVFfkN44PiTW
	NbDMDu4Vo4ZLCD/YIus3e1s7ksp3AlSrhXAlcM3YpU4fDrTqaDB6jnhQBrFb3Cf88EXUbirPl/R
	V5Vpvn1wVyzgY9mouB0EAS
X-Received: by 2002:a05:600c:350c:b0:493:f639:9b2f with SMTP id 5b1f17b1804b1-496b5ddd7dfmr62118035e9.39.1785063613640;
        Sun, 26 Jul 2026 04:00:13 -0700 (PDT)
Received: from [192.168.1.110] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee0e91sm132606545e9.4.2026.07.26.04.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 04:00:13 -0700 (PDT)
Message-ID: <2b553c1a-a2d3-44d8-8e98-976835e3d436@gmail.com>
Date: Sun, 26 Jul 2026 19:00:06 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] spmi: apple: use IRQ for RX FIFO if possible
Content-Language: en-MW
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Alba Mendez <me@alba.sh>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
 <20260725-t603x-spmi-v1-6-e1a29fcd2d38@chaosmail.tech>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20260725-t603x-spmi-v1-6-e1a29fcd2d38@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Sasha Finkelstein 於 2026/7/25 晚上9:48 寫道:
> From: Alba Mendez <me@alba.sh>
> 
> The IRQ fires as soon as the reply is available, which is usually takes
> a few us instead of the 10ms sleep interval for polling
> 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index d8509f027df6..d627187b3ac0 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[...]

> @@ -195,6 +277,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
>  
>  	spmi = spmi_controller_get_drvdata(ctrl);
>  	mutex_init(&spmi->fifo_lock);
> +	init_completion(&spmi->fifo_rx);
>  
>  	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(spmi->regs))
> @@ -206,11 +289,23 @@ static int apple_spmi_probe(struct platform_device *pdev)
>  	ctrl->write_cmd = spmi_write_cmd;
>  	ctrl->cmd = spmi_cmd;
>  
> +	irq = platform_get_irq_optional(pdev, 0);
> +	if (irq < 0 && irq != -ENXIO)
> +		return irq;
> +	if (irq >= 0) {
> +		ret = apple_spmi_init_irq(pdev, spmi, irq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "spmi_controller_add failed\n");
>  
> +	dev_dbg(&pdev->dev, irq >= 0 ? "Initialized with IRQ" :
> +			"Initialized without IRQ, falling back to polling");
> +
This does not compile with clang:

drivers/spmi/spmi-apple-controller.c:453:22: error: initializer element is not a compile-time constant
  453 |         dev_dbg(&pdev->dev, irq >= 0 ? "Initialized with IRQ" :
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  454 |                         "Initialized without IRQ, falling back to polling");
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


>  	return 0;
>  }
>  
> 

Best Regards,
Nick Chan

