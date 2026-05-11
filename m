Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716563F54AB
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508399; cv=none; b=h3LWaHe/PkEaLQxy57QcSnIItegBDKRHOiT+Kj56M/BkZE8ciVjFSZuXlJ0FS3sqIf0lNXgLMgbKnrPLouqIWvLuk4e4uEqgiKwvJ5YfxytNAd2BuF9EF8MJ130ydnkNlZZ5ZiB9UWPmbaBcvhSHUK3tBfHc5BjcaHFrcsStE60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508399; c=relaxed/simple;
	bh=7cxxZqN1g0qqNRtwUJmzJW5yzCgloqX4VcBEh/hoaYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmqHi+FAAAY735LULqN3dpkejGQCxsg4J96ThH9eCD70LjjrROVryT36mVpe+Gwwj0w7mEhL8DOjHd9jYDUZIUOUE2aJk3/QM7kkpMO4wsYGVjuOZZsJ0YhaF8e3inmhzzbnDdtjTYdWEd+2tm9cJYOgjATuGGe14PsqTw2cZHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKTeSWEX; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKTeSWEX"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-130b2295ed0so11746440c88.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778508398; x=1779113198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yH/da57m9j66BBfxDcaOUHxrZwIbeRL1xLwNB3IDa6M=;
        b=SKTeSWEXI8xOklgjnsdTA4FFc2Az5uuSySfJDxW04LK2RR3bE3c21CmWqwjvb5EV11
         JA37LMcgHcqYdELPPjVvbCEihWiqu15VyeIYRcbal0WDusDny+wmV9qfH32mPCjcxOP1
         dBjbVyy5TKkbZoXdaX3AM6sUxoqkDo5NUoUdKZxDMUUBBMKVpoTvUz3dTboUz1fK9bT3
         ChpNeT60APhX8purJCLB+GCdI6hZJ21/UhQyRjeWt1+QajJXVdM217cGyAbGvcGb2bzd
         hlk7qcH1btT7rnMgYol8S/muWhsX/kdSxcL6vo3Duc4cnqkiO2919d3WIyJh89HYmF72
         aRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778508398; x=1779113198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yH/da57m9j66BBfxDcaOUHxrZwIbeRL1xLwNB3IDa6M=;
        b=VCsibkcCrlJqe4OO0QeJtm/cX8FexvNdXEk6/MODOgjfiUaPSnABGmggyTyC0YNuqu
         8wmGFn0RuDJ/qlSYgCjBPnGb0Xk7qOoBkHO78M2jfXglPXXTxZomwd4VAMIO/Ni866pu
         pKFXO+YZj8Dw/YibOx859WO9pPisw1TaAfT8t2ObBfDkQccrLRHtQ8hv/yC+Z6WcVarv
         uA3bsN6JzBk5qhnq+2pRbfW4JhhMtmAyjfvKdrCmrXmDSt0zfbSjvmFt2X09juZQbg2P
         XwauF8X5QasiqbBo7pKGwfczgZ4g5YkXw49mht0rMbWkrKeO24teiSSLLmOndWCIO/s5
         G4/g==
X-Forwarded-Encrypted: i=1; AFNElJ/Tzi2HL3Ce6OFu7xuxqYKeFh+fGkNxDQvwrY2dXcp57sF/KA/bUZsh2hMxRLSvJEw+Styi09LfrTOs@vger.kernel.org
X-Gm-Message-State: AOJu0YynalwOMvsMmqmxrJsNe+8aT7w6ufIL0KIyUfNs9RPCu9fP/Ywj
	qjNBJlL5OAGtA14g7afZaSaDamU1GiQjxn+XSp6c0EsVr7GJPtQCPRaR
X-Gm-Gg: Acq92OG1RGTo/Dq3MJQWvlseWJjbMtKeP8Rqhv9dw+2bUqt4I3EJNtt3GjYYRVWW1Br
	mlQEjUoEYnhfaNjJzxNt7BgJXc/smHxvHCAKm16fo6tfgZKvZnrdyS1n8Xd6ZQDW2uN0gJgN77s
	raTtCCu2kGP0FvSBlKwWrTc6SdWm0W/073gQ3JPUJGX0D+AHwQq3QgWWA5oGXBJN/7iWFioYsdr
	V7FX/tUOvueIHnKvuqVwtNVVqU86tv+n23xBQJuceGXKBJqv5ukftwsutR6huyux7OqplKpWO7P
	moLQzUtcflIwcKedSQkExYx7Rz1X9lCSAhRJBdFQQhjfFmyU8aSLF+1s/4GLqbGaNqotHJDnBN0
	2S+AtpKPV4k3wtSVvA9R6fUmMEUZvQR1upkbWGjsxnsiAvLvHhtDYCqmfGqCoowBV00c2KZ/kTA
	rHbCoG+8/sWVnovujD1csPktMNWgi/Rnx4WJft
X-Received: by 2002:a05:7022:488:b0:12c:8e70:c33b with SMTP id a92af1059eb24-131852d2e27mr14527532c88.8.1778508397470;
        Mon, 11 May 2026 07:06:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13277bb2b14sm18610981c88.0.2026.05.11.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:06:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 May 2026 07:06:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
	Joshua Peisach <jpeisach@ubuntu.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
Message-ID: <a3055969-31ff-4b33-b6eb-6418cbf3597e@roeck-us.net>
References: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
 <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>

On Thu, May 07, 2026 at 09:33:08AM +0200, Janne Grunau wrote:
> The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>

Applied to my watchdog-next branch.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> index 05602678c070..845b5e8b5abc 100644
> --- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> @@ -16,7 +16,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: apple,t6020-wdt
> +          - enum:
> +              - apple,t6020-wdt
> +              - apple,t8122-wdt
>            - const: apple,t8103-wdt
>        - items:
>            - enum:
