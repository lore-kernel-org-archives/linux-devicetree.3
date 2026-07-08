Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D0644B66E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519221; cv=none; b=nStJii9TdzJj2IiKYSu6ZZJKmh0ggfJvYXFarm3KL0kIuhabu4q8FWRmQvywsrBI21JUcdQZ3NK2Ec63hsOkxyIfCjj8R6tzpiQbEcPTWHOhBlSOz0XF7aesXsrUHp7Pc1nrtGI+rXN8MtMdhTWT1uK0YZ79Yer7nmXLAQrlXdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519221; c=relaxed/simple;
	bh=+v9vy7krakGFeXF6TzAUAnw0/rePpUUz3AXWVtluiys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9BJNeCwaqmlP2QKKezVlezUFlCqk24H+WHS4TF+zufAzqP8PHEw2gnAy5xY2pVNs8oe1xZh9iP04xe4uqwIstyWCWaJbdMd9tZbYeciaMuSwTb0O55qzRBg3uBq/5Bwm3f6Yq2P8+aTZmP6eLbjESSDMsP6i4Tgj1wqlYvq74I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkgCQ1Cm; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkgCQ1Cm"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so646956a91.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783519219; x=1784124019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MXKeSE96P/DSTkSX0hfZLI8OogkntC/gTUwapWrQ2Q8=;
        b=mkgCQ1CmdnIweyRa4WhpzMCueBmIKRUM6wi1Isnd1iWqA1FPSnSJg54FDGYWG6Z4iy
         HDlpifybzxvrVq687Fjz3r3RSoRFePAxf3Gx0zTNDLbrfZcorj1kug5UH68tOWnspxUT
         gR/0B6cZDpiJ6s70n7Kvy6XyaWH95+svuBhugOEdxmt6WxHReE/XSTzjOMy7qxGTY0FV
         9HHuS95GEE4IGTmO3jgkw+oq5ngFjc80PA5jyiLbKivWL+1UjspBLSX6WAThfchxLdqI
         6qqE0n+hN9B9i2RpRne24V2WwpfZJrTnVUQVFF41/L+9n7Aqw+GcSSg6SHa4WyR6pQdH
         Ltag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519219; x=1784124019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXKeSE96P/DSTkSX0hfZLI8OogkntC/gTUwapWrQ2Q8=;
        b=QUYHal7HrWWxp37EWQHkP3g1BGt/GqofKKsHt/LWihBRzTRveY2pJAHt5n+JNndQUZ
         0Y2ljSYkIU95AFXgjQSUb8oWjx0SJY2F+SQd4sayApefEzPgzYD8OEkqBsyIKowlyOPC
         DwIB/ESog8680sXa51FQwIVwLQJHoX1SDm5aa1QBUsXUyZUdJMOxUJqZRF8F9efZQ16N
         2POo7OjunBrQ34lXOYIeWX56WIobuPqwQbmxlJWHgbz0x7i8ts+dd5bb7qF5/IqrutPP
         q17FKylS8APJNzbSN/SdHJJp14MyGvvvJB9LigTcpiwTvWlPaUXVZkVrXsIWoczzkfFq
         SbRA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1uJ+TF82dI7ngbYbUaitMg7iu5ppQICpLMX0hy+zggN4SaUa487vEdHeca9NvFUFJJfUWtb99LT7E@vger.kernel.org
X-Gm-Message-State: AOJu0YyywownpkedPoEq4VvLUpMqZQXRPOFZ+CG0aYsDnCk0iR0nebtw
	g9c1jcp90WIglkdfxkASkvQRSksY11y9up/f3tedjIoZqncZLZKBEPgG
X-Gm-Gg: AfdE7cmaZk54JRGvpWi7M9t11Zd2eRjL9cXGPooYsxD5IhdgAVjxr7LV41RbB6tV2g2
	YMujqDVgAJ6Qw4YxCl3Afd+DZFW/G+IN3XqIRq6de0exqepKYwbEfvD6dsrZ1+P5B1Chv/mNwsi
	MMytO+JRqGB+npqlh3ZzTWC6QwpP87vAzRAJ0QZNOfujX9Ult6PwNGFMa4V9qTsb0x2VMN/7bOG
	1OSHLa1djGYLIksLp+arVqlor1bEd5riZn2oaGvHUX3gPy39rPAgIMe66kdr7jZBREbNqJxMuHY
	VL5gfmWgcCP746IqC6B747pnBOxxyL4PQvDEPwoOw4MAp/3k4HxddlIRyJoxdhHpLCEVhL+Ypay
	NATd0zvcgTDkatb+e16CC+Pb088fp/f4nyokOJpekpMyDDqSAoXm06lrM2YDNgDR9OwC0CtgTBU
	UfPYAz9GOrGNpQW9c7bxOoFe5lNA==
X-Received: by 2002:a17:90b:3512:b0:37f:ec5e:12d9 with SMTP id 98e67ed59e1d1-3894034404bmr2572315a91.16.1783519218978;
        Wed, 08 Jul 2026 07:00:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-388fdc9a066sm569937a91.1.2026.07.08.07.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:00:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 8 Jul 2026 07:00:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 03/10] dt-bindings: watchdog: apple,wdt: Add t8132
 compatible
Message-ID: <a03c19ee-cf74-4f26-826d-f2bfb816fb3f@roeck-us.net>
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
 <20260705-apple-m4-initial-devicetrees-v1-3-e5655ee56523@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-3-e5655ee56523@cyberchaos.dev>

On Sun, Jul 05, 2026 at 03:17:22PM +0200, Yureka Lilian wrote:
> The watchdog on the Apple silicon t8132 (M4) SoC is compatible with the
> existing driver. Add "apple,t8132-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.
> 
> The M4 wdt block additionally has a secondary watchdog, which is
> disabled by m1n1 and can safely be ignored by Linux.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
