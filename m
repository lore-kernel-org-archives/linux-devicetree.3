Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369890;
	b=3zt3L0aLlD9NRUwEGKeB7mW0dk4uyzBDI1rLdWmuYS6Fan/l+XTXGOZi7xSlUjn1J6DI
	 ISr8Z0ZkngDdLbfRipEtsw54dA7Mhzdf1t99kqgz0ufh/ZHt+CaM9NULPs1vBmP0ZZEY9
	 5Qi3KL0L/zIFJeh0hcAjk2psIqCbEJn4RQF2ndM8p7TR+/vsk8lTmRGj2gFtUUmchtIB7
	 S1Dc6PxrFeC440XybGMIdLhkdfNwFO+jHnxWfQVAAIr97RCH1esudfM4/lsX4iMNUfT3l
	 s+E22qUeKO56yZI6tDGKnoGty+7bjM4CX/Nrl7ueU0O8xNxP30v7shMb7ijY5EXYLqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Subject:X-Mailer:References:In-Reply-To;
	bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
	b=Ndcg4yFzP9P+PDX60K6sCal9KodVXqFU2GWA4x5qJvK6x3irle01MIHEitMRRZ3p3D7C
	 Y0M6u0fimGkXtexIMQ8JAXEX86swb2lbw2JEy1w3ltXz4Dy/Watwt+4CM7ABLRoylIyZB
	 VDOzzIkr0V0WgdpH1LZsS5gQ/ZKbVGCbc/SFYHp3k/uODqCEDwCpC2H/2i0iLDzS2IL2C
	 rQpbknKXGkUrHjTODdYi+IOoROcgf78ovmolD7ChhHjUF+eoKamNNBS9Ymm1ITzp5y1oj
	 DQhuE/jYpS717tDfzdiWr8cL5WT7kikzWrz5Uw6mkUZ4QEIwq/ZqooP5aHArOcW8Zng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocIXO8tt;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBB8606A339
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CBB8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocIXO8tt
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso3050819a12.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369889; x=1795974689; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
        b=ocIXO8ttGSav0YlCF+6rCaq8/A8X2+hNimH0KNNt7I8Z9pOrjNimf6xfgJBVch5CGn
         KdCLCmQvhRJQmg+wq3LCmcS/aWe5jMCrTsvjj3iLIKo/Vvy32mijdyC9QMACnldboU5G
         dHAjOx0ZaXPBXk/nJRlk8HKX+DgTHqUzs/37rU8qLYE7Jo+VJgwyk+BWvT655W93m3af
         xGZ/d0wGUIkj3tukmsQcJZ4AQywSoBoYmLdHbQ2qQdQHp5Y+04Zr/Jspmr2v0MCB3XI+
         4kWCF8bBWRHnzBedRjqt4a7KGLvIHh2yn+lvE28DhKfqTK5SnwZ++0TTbvVpqox0w0zr
         QVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369889; x=1795974689;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
        b=0+SScKzAh6gxz23CHgn6hm+8GiSA6E7AM0iJEtT38vuhlY69xIm+VAwuKUXHNhvVtz
         o8NcGAu7Sw/jIW8T8xpm2OdDt4C0kA5EVovdDgNU9USSfdHUNLWX8RB42CHMmhCjYu6b
         S2JkgistaH0ie0aDuwpLdWgKVIWloPsL4+FB+zgzNjAZm1BwMCmYp0Q+RMm904P0u7NF
         dXPa/pJ2lhzFdkC0X7brfKPm/vqcjwcWeX7ZoISRSgPQUPgSkCkidxSCoa/+AtvbKIo+
         +v8BAPwZYcvlQVJHQPXbi0+cKPSXAMuuzY+n7yf12ipiQGwPyY5MGpjpUmyhe3Q2/oS2
         7Epg==
X-Forwarded-Encrypted: i=1; AL+hErFUNA0lOcrfDPCN+upaQQ2I4mG7FCl1ngIpXdJNbe85mtVg8K3fL/9XEaLHNopfxLd6G6+ZxPFUi+Eo@vger.kernel.org
X-Gm-Message-State: APuU4Z9jiobZGV33j9xVBBdTPHkliS1fV8Cu57zTPdnYGT9O0cnibZhs
	vvbh01hAJyzItM0J6Es9fnq6XtM8Xl1v88FbY4NLvF2doOe0Y+vX0sKp
X-Gm-Gg: AZFdTZdhDRcl48Uds0cUg+Y3tjVrdV1lf35VqMgK58eHyHzgs7200Wo7ODNin+aR13H
	jSR8qsGMNeJO6NyqTBnyYTdq23Asss0GnzLHhIdnPh0OPBasDNNI/aJqCO1R7ZvcaMy5+k+VS/L
	OhTY3iYm//6hjMPTbINIYI8+W8kXDERsPcukv2yhAxXpkduFRMwaWGjui8HYO3C3Vqp0Ga5rFYL
	ZYGbK+eM2xkZeHJbtO5tcwYyj2DiDAqHAYkojqxMcrZVU1yBGuT8VvXq8nS2heKrL7LUYJ1reOR
	gkX6PCxZDwI4JYMfukdN82o96HmYG9GrOjd/pUH/PC5JLURCx1j5Ep3Ji5pgTeSZvqVOCzA5cqE
	hhaR1j15pyX0von18Z/+H80zafcw9GjWFfF3q4jM0CQ1dd7Nz7DwgNRRoRcG9Cn2Cog7j9WG42L
	LnaipLcpgsyLBcn9wOEaBcdOpVrK3XfkR9Qqkun2r6DDVtriTsy5MzOTabiBVbneWO2F6kI4K9Q
	djxo4REc6kE3Ie2c574zJfgO6dckLpZH53w0QYQeCqg9jNFmWExlfk9ja7qBZTPDj8afqqUoPIR
	HunMNA5FsgtHq4qCZE/DPo7CTurq6wIIo7qQEuYYrNfbtdlBrw==
X-Received: by 2002:a05:6402:350f:b0:6b7:d189:6044 with SMTP id 4fb4d7f45d1cf-6ba37e64b27mr6482678a12.17.1795369888545;
        Sun, 22 Nov 2026 09:51:28 -0800 (PST)
Received: from localhost ([2001:1b81:1b55:aa00:48b3:8eff:fe5b:7d15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8adbsm4246918a12.17.2026.11.22.09.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:51:28 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 18:51:27 +0100
Message-Id: <DN1XIBUZ90MF.2JOY3U2VDD3ZP@gmail.com>
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
To: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>, "Daniel Golle"
 <daniel@makrotopia.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Hendrik Noack"
 <hendrik-noack@gmx.de>, "Arnd Bergmann" <arnd@arndb.de>, "Ferass El Hafidi"
 <funderscore@postmarketos.org>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, <linux-input@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] Input: hynitron-cst816x: respect touchscreen DT
 properties
X-Mailer: aerc 0.17.0
References: <cover.1790944534.git.daniel@makrotopia.org>
 <75b8436b900ecdce7f29513a7403b851986a3a1b.1790944534.git.daniel@makrotopia.org> <DLWC73DK15W4.2LCL8MREV6FDM@gmail.com>
In-Reply-To: <DLWC73DK15W4.2LCL8MREV6FDM@gmail.com>

Looks good to me.

Reviewed-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
