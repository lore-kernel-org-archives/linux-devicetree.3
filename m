Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C267746C82B
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932559; cv=none; b=B26eCsaxLMt9c2MU6dhfhNKvNT19p3lmTIjqtsMMDAhih4exFtC6XHKo6KAL0ACj+lu+sr/gLT3m1p8nopDTCXfn79x50wo5hqCTralphvR7B97B4YZb+Ed6hAlyR5Gf+8KMQWNgpaKfyBJxKnkj4LedZ4VzB00znb/kydMFaPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932559; c=relaxed/simple;
	bh=RVJuTH9dQx8sPj2A0T/4W/YMqBB1eS42ftDLNOb4H8E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G2yOFvZ/Q34O0Gb51AnqmS+YeI/WfgPrYViA9Z3GIVnmNon0utDotThhPUSpBrM1vLhyNy2CcXenGliNoHLnAgeZwDUilRm+nEgufLk2RLf0gQgWb04wV2UYKXpel/q8jrp80HMa1m46TQkbpOtNGEiG+7uJVPe1yweuFpQZpKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+92Yi7h; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+92Yi7h"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b0503e39fso1813980f8f.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932556; x=1791537356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jRPrTGUlYlRMvJF+ftPXWXm2emGl+fkBUfXA6bf3Pvw=;
        b=H+92Yi7hVudwQRM/kXkv8j9Um0hz/nUEC7552OqPS+oUYhSotJdckR3vg+ioBISYZv
         0MQplvrETbFoMPm2yGtfbiha3WQ5CDIeVkUcLjjgCNZjx3ut+FpEwRLJkWx3NY2veS1e
         Ukxdbc7/5lMiUVHcUFTtsTvjeg1Sb+y8KCz6eeAFYfoH3YThHja+Y2mb7aeIefzh2kpj
         eRsoLsoUcZKGSFbALtzCbwDF5dD/Zo+Ac9sUUBC1p5OtyPriHRUHvLpsTOo3u/GeqfR8
         7bS4vjTCYPiGolRwMKFilxIkFE9KxxMau1oDMOquLQGJDGd+0jL83cgv+y2pV5zeGOyX
         Pj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932556; x=1791537356;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRPrTGUlYlRMvJF+ftPXWXm2emGl+fkBUfXA6bf3Pvw=;
        b=xQV/OAUe/mzyQe0XDpLi4JkUKXHrkbKRT9t3w5Cdm/YasZvL7ORKuUm3zmprPDThXK
         y5r0oZZC3G7ejkQO+z36cW1Pv48u0fMhQT+zN5IL37+1zJTbPFtO3FbaRJYKynhUesC/
         sWijhfFrdGDlMT8XTU6g7/0qzqbJNziyfzLlBmpBqXl2kLoyXwxWVaromPWvI6a7Wz4m
         nZr7NLEqkHgArzbYdhMC8RnRRUSPrOtCa76u0sYMtzIaUkuUfC3PFGsmzx3mLNgFkIsA
         AzSWR56+ua8HPitjetwbe/Sa5Yxv2/fc7ZbZQ1bV+bm2OaQpzHQPomhk4riFgnwfQClG
         OjkA==
X-Forwarded-Encrypted: i=1; AKwUvBwq06f/DSKOW59pyIPjNq+XbxsyA81uwBSLQ9Wfn+seZ5CnfHnfjXKURT8U8gkUktPnoxolEgq5FQY1@vger.kernel.org
X-Gm-Message-State: AFq9FYJB33nkA4iQppl2otQ5qx9iTfkNWzzmfHaWDOlIsb6i8K+IgOEE
	ewVR5O0wZk2orzNzSsgpDe6HXXg6ptCjJn4xb5Xqp0WcGxpnx+zvmoGU
X-Gm-Gg: AYBFou0ZD80DkRx9R3l0P8Z+QxUCn1UKd0CuCuuK9qwmV2n6cTV3JM7F350plY5booS
	3DTMeCBkMGt8RJ2TbsB40Qb1Zx4bQeBzGUZMvqAMyADKwmEGogb+IwjhNl4C2Ixz7sQU6rx4Fd9
	4HrZYpD9EnVUkhOcp+/DOgJUYVyaSXK8QofOAI8sU5h5Io8kJjZO9WsE0qrGBQko8gSlJ/IndUK
	bQU++PL7PytUNoDpQNRrAqLJwv2D6z2shganLYgXDHpwTywd3mepizJEu7JKglN6D+nMFScZcRY
	O8rjxjwzboVA/+aLcOOqEG4tAfRpyLEuMLs83kq0l4Rgm8IUVxpkQt6IP/hbFlVj7fDXmk4Z03J
	E7bSmiVDD4VL8xo2jLNqxFuNeVTwsqs5+13nzbXVzyTQdYwTN0njnzD227F8tIk1e2buLq1Y1cd
	LEMpH0Oqb1cF6JUHTBbDt2gLmpKKDC7pCvlQrBgLVISwYq6Bn/eGG6lc9TJyBecwWTMbna3jVYg
	rlHtTgPxg9o1EoL9pTE8QV86mTuTNQX23SE6Sb6YMEbkI1fSWmFWVvvXuKuVSZR6CcXst9SJbuJ
	2JfW3bnS3FHO2HBS061TQH1aSOeGkH304CeYTVWvXh7HoKroKxQgmgEy781GNEGL+tbPN6CiBa1
	rlfD8+oy5xklWqudEq7S4vlgmBPqsmWYjgRQCcoW8HlbDYsJleUyWlmR4EC39S0RDc6EOBWH8WI
	YhjgYf
X-Received: by 2002:a05:6000:4809:b0:48a:fcec:2a29 with SMTP id ffacd0b85a97d-48b1273b029mr4027458f8f.20.1790932555893;
        Fri, 02 Oct 2026 02:15:55 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f89c3sm3966667f8f.34.2026.10.02.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:15:55 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:15:52 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc: Add syscon property for
 multi-SCU SoCs
Message-ID: <20261002111552.000049d3@gmail.com>
In-Reply-To: <20261002-succinct-voracious-orangutan-fdac5e@quoll>
References: <20261001-ast27xx-adc-upstream-v2-0-2f9c15cc0064@aspeedtech.com>
	<20261001-ast27xx-adc-upstream-v2-1-2f9c15cc0064@aspeedtech.com>
	<20261002-succinct-voracious-orangutan-fdac5e@quoll>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 Oct 2026 11:03:33 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Thu, Oct 01, 2026 at 05:50:36PM +0800, Billy Tsai wrote:
> > The ADC's reference-voltage trimming data lives in a System Control
> > Unit (SCU) register. SoCs with a single SCU instance let the driver
> > locate it without any additional information, but SoCs such as AST2700
> > that expose more than one SCU node need an explicit phandle to
> > disambiguate which one holds the trimming data.
> > 
> > Add an "aspeed,trim-syscon" phandle property, and require it for the
> > AST2700 compatibles since they are the first multi-SCU SoCs supported
> > by this driver.
> > 
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > Assisted-by: Claude:claude-sonnet-5  
> 
> Your SoB is the last one.
> 

And the Assisted-by should have just "LLM" instead of "Claude:claude-sonnet-5".

-- 
Kind regards,
Joshua Crofts
