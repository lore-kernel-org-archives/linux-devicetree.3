Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551774;
	b=auR2USQpteqvVJtC3lJz07SroV0PWM7riIw4//w1Qz75mv9Sbg887lPpG6PwIA2qX+Oy
	 +mIVg5wyfrTspai+wXkMaD+B7Al5snptsgSqCDYn49IKHn7DyGzQlXmiQPzrYZMemd4W/
	 gZxkps+jji5SxRlYZvvAJucpxXMcNXy6oT+EfL0QQqto8NqhHWaHnrEwivZASJ9/Ye4E9
	 x4V77P9ZaD/N0MlYeJMEuHmGvjp9DmUobdCiA+ATgCOZZLyezKwmOyjYwA7nPW4vZDgYq
	 VW5iZJm62ciS6jXhjMWp3jTBEPKjakoJImX78s44CK4vGj4wZrelrm3yrKDOve9WyGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oY6Sw2eupDcreXCwLDckh5hNjgWiUywnz949Uvx33tA=;
	b=weF5sdD9fp2hU//CEuqI7N9F6S37uPMvqUmdGvdq5Uvl3QGUddSLEs3sWWjC4e9UUv2E
	 08sUYANHFR+q97nFyX1OsJxJheFilFx27S6ptNoyz0DJPPEjOVlmE3vLuDR3oAoNHfErA
	 h5VIo4jBrl0MOcUg0vSQp/k1k0TfK7nZgA3gxMf2gJCYLMEBQXzwY3ZZUfsgV31isqoja
	 1uASGC7XaV6kKkHUd77mZzN3M1BZo17SJJyQO3znbElUgmy7ZW7xC8kbHPHc1JovMrz0A
	 r2/K4FAd9sCH9cazw8RUTQm0hNSFwhzpqbUq9GCP7VLwsTjrXnePd8UGwTT7qDIOrxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p0pKQlVL;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6C8606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF6C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p0pKQlVL
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so3513795e9.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551772; x=1795156572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oY6Sw2eupDcreXCwLDckh5hNjgWiUywnz949Uvx33tA=;
        b=p0pKQlVL7CG9eGWvQln57Smu0NN9pCnm1mnPUVAj/UmTklt/UszoRYj8hQfYXlIrwy
         kMzdLKYUHpFQl3S6frWGST7Pc62GUmKnHPK+NGidwzvBivn0sP6oXJTN9orf5ia2OGgV
         p7fpHcuUr44iI9GaSCGsEKXjElFSFsxUNFnGREj5vxDFrRTtjKIGfXuDdnqZX3tYJDhh
         afc2UFp+4Nur21wZHEuEZ3AiJtdaxUQl8G8wR3Au5J2FZ0l3fgjd0y/MbOuwgoZgkaNQ
         TTtJ04biYuEeePTRzatAs6scDzVrAAfHAK1S/E2uS61rBZxF14AQxTNdJo5tfJ+3fp02
         DuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551772; x=1795156572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oY6Sw2eupDcreXCwLDckh5hNjgWiUywnz949Uvx33tA=;
        b=b+rUd/7pYci8lECYMr/4DD3Yjtm5JFRuJnBmd3astnd0FgfaudJ+6RlQM4XA+DzL13
         PhkBLDgb0FBQf/+ByXp6KxgriGXoJBBLPjaBxHf8CRd+27nrlGPLrT84iFwLKwWLNlEX
         LFuOv4C78ecvzp4szsFyIkfCYRSCqTvswQMwiIGFxPy2Pb06yJZVQiwzAOTFAXowjz5n
         gWhJeO1SNx42qtQZCd81HUzY4vxFyexglKZ+5ZIwTwRY7KdU5iHjjYGYzruKO/PY7NTc
         pP7b0hq7kHoh5YBpI2xzw1zf2uFd9Iy6kclJjS4+2sZmWSWPcRfFN0CdbMFwDN22b2Vq
         Uewg==
X-Forwarded-Encrypted: i=1; AL+hErHjonXJApPpLalMCSKp6UQ5h0cigdvjmHuFUVeQmNV0PFHTF9mJ/hoEDA1IxREPC3NnFouBNx8fhIGX@vger.kernel.org
X-Gm-Message-State: APuU4Z97yO48Xe7IM+vnRSw+v6QOcX3W1o9bi507qk2VpvMf9N+8Eftb
	af/0W9qvcSfg5gA+Z61pTlnCNlOqgMrNZmDE/1q1AI1N+7a743EZyYq/Kw2WhgXoqkI=
X-Gm-Gg: AYBFou3Q58ViixcMrl0m9qjl33ztoaa0ikxStwb2+b2WK9iwknSJ+C9pWoz30k3DPNX
	ZeMd9HDot9hTsThLNIrfxAnsc1bNAv0nRqTfJFzVxNhYaOaf8QJbs+DN+BQ2x6wJJHJmNq97a8x
	j7h6zbQETDM2cBZvd2c+dUBbyMBPh9Hf84a5Wicnci1Ci3KpQXJWBXi1ljjwsIr/fmIfH1+6bjT
	8B4oh+KpbQmDybeLzQZUqyd6I+n0xPXYwTCypP6JBqMVpRt8WVqCn94cvZLJ1JJ1E9Zy74qOMjq
	vLgKY047DIIXJ6wZf6oCsgJT92HaiVnx610g79Lm3+AA7VKSy9NdDI8FNnCFeDLMK6cnHMefdTm
	1ub1zZkrYz/c+dEgk/xfUxHuaGs8NHTYcR5vBSQ46iRqJhx/j1fi7SyicdUl0i7N7YMG3eMVFva
	eCIr61d5qB+AdSTxCBUSLiNvSUSv7b815ELbEJFGOpzpwY9tClKRw/28KoOKRTwTh5cr+M2P3YM
	fdQhpbs0RhJy3CdOXLOntoUspsUSg6t35MCPNltBWsFe8V47tjiLC+fJeUdj2AsSw6cgE4+G38J
	BXrMhqCHhiopOOWVe7iNvFc139iX4GqLHQ==
X-Received: by 2002:a05:600c:a00d:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4bb55aa854dmr30515515e9.33.1794551772311;
        Thu, 12 Nov 2026 22:36:12 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c8d286480sm4583537f8f.7.2026.11.12.22.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:36:11 -0800 (PST)
Date: Fri, 13 Nov 2026 07:36:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
Message-ID: <avavgGbj8WupEstn@monoceros>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-3-624559bb8ec7@foss.st.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gkwqr7dnu5cjjahz"
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-3-624559bb8ec7@foss.st.com>


--gkwqr7dnu5cjjahz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 02:10:23PM +0100, Gabriel Fernandez wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/mod_devicetable.h> introduces a lot of unneeded build
dependencies and <linux/platform_device.h> already provides
of_device_id. So please just drop the former.

Best regards
Uwe

--gkwqr7dnu5cjjahz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2r9YACgkQj4D7WH0S
/k550Af/ViscKIb63+PVQx/zXwL2fH1N+c0J0B6+Wy1MxiLTwJFXkjS0mu9bkBlw
CLifRBkJubxD6KiW9nuvesALuaWyKACFL64L/M8rnUTgMEQtIzbxaJP1/fdakEdU
NGqid7VZx3OLkHgHRSws9AOsMV6rJAKvG29HF2mjA7Sr100t/T7kfAskHU60dDRT
oooiNIkRAXDZzowGQREV0WePP+KhHjYDXNY8XL8kp5fc5oxRJxUcSTCFZCWxxgT7
Y7FkmxVSxQA07Pn07yy0KF4rBoj6O+JrpsfW1vJ25VKLi4BaW4Iyl/EMLXHhi+rS
IiIDqmj4rco9HRt+45lVPGX7qe4gPA==
=gLbT
-----END PGP SIGNATURE-----

--gkwqr7dnu5cjjahz--
