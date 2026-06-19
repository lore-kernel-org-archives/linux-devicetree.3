Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44D12857FA
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781877575; cv=none; b=o82pNs5uIn44rI05GCgN4n6SojrYcXzbTE2fQhA8Kq+Zlxkr4JFSA5RbrWu4JPIGVjZXNqNdhrv/ro7wof/SQiPG+Kh0G3bxaX3PpOyNDEtpZvpeWcr/IJ5rCNLW+bTR/aLHd1RQGVEKQLJc3GwRCMyoUQu2lsfXBve+L8BvxeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781877575; c=relaxed/simple;
	bh=M6XOBVqYNCyAP2+UukgzLFzwR8WmlzWVSsGzneKY1Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MT8M6cpXs+FbM+LGVky1q3bTHU5EXCVLLsa3od3WqAygTqRdc4ZZaQs4dilwxrsEuTpRViU8LXEgFwojjGjz9uymRLVdipDfhfSGRq2MeFp/LyBZm7l8Z3xAKE2qeIAbzohPnz5+L/8o9/VPZ8e5/0qFpvQZv+E2f9L5FaGIne0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TtJGaiEr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TtJGaiEr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-461edb387ddso2146691f8f.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781877572; x=1782482372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IFmcgWo6u0bUP8TJiUQg2GCEaR02GLGc4w/zuv0CGcI=;
        b=TtJGaiEr+E4AM8Dqd9RNvM3VZvErBB+WUxnQQ6Pz73m7JQtitfPK/bdFXT2RIx1/IP
         Hu7Q3UAQU2FQNvTfppWMcVVi4MpQSlO6qD3JWpA7UdnBxQXyv52+bVMuPHcQGO3sML37
         hwprvGZWZUZdZeDbhfC4W7Hy7wto8jKQojuekDSEGJuZK4l5BMNisoHxkbz6NCYQEVzC
         CJKL09jBE682+PO03uJrcA+/aWo9a7DfJA/m9Myi784dQdxOKoCfxRvD0bdmEX82dtHd
         +54pV98H1++414qQTGcYndYr/3x74y+h+BJ6AsqKmnaJu1KA8yN7qYU0/g28ldsDY8kV
         ZMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781877572; x=1782482372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFmcgWo6u0bUP8TJiUQg2GCEaR02GLGc4w/zuv0CGcI=;
        b=JpZbE2DpsGpOnwqEf6AdevRZRvItEPllgV85CpUFyHfyuKckEvSCq7EraqK3SjB+hw
         oj2xQwA8mUxcDcomqDqndWzD+aUepoXlM10DQPXmqvNfNuaQ6rtGkfO1bJ38H38P3EUR
         GTU+ZfRgcoXYLoMYKbAldSf5GuhBwdus6S+So3cZk07JzINCGYZ4ua+Vv03P5nGu2kgF
         xhKE/QovtmWZL4ZCwtNudlmjaYaQj23RIaH6kYb5pM1kVWpvJ/YK9FA/dDLLnyneWBwm
         u3BsbbMr8klNQP2U+tBmv3ZCaWIJRq9EI84PWkXdvRRaiTgjqqtzWNDZlbn2FYTOS+2a
         Vkgg==
X-Forwarded-Encrypted: i=1; AFNElJ9UmsdBWhuDS7cW0HY67CrQPt0FH2UsbGWEzcLU+Uaq9Ws/rRjXWypVIWMl69k3O4B317/x0Z5oapef@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+cJyd7ObPCeh0JudD2IyOZH7AIU/aopEtX0KR1kweqEwpqv1n
	GPXBuCMHrWiyKexs3r0+Tky1BoTMqkAgyB19Vi9f2O+JlQzxyn/DNna2l+hRhac0JFY=
X-Gm-Gg: AfdE7ck9xbKS2AOQtEnPcxfYIOVyfmgt37G/gO3rR+/kFSHrJxSLy7lsZ5TGhP/lOZ6
	qjm21ao8s0mduz4kJhp5r0CsXn+BQMQikyY+m616j9oae/Bg2rkComdpXpouHVt0QDMb01OZ5bd
	X46aV7y+V0yKVcZx/ZScnrep5gIuiFvMQtqGYk4pU+mmfH1Rqp8THaZCCGJGz6ceH1hshC7EQnG
	Y52D92SA7xIbJIXLXfW98Oj1Cna18T9z0PNhfG6LXHNCin+5STVSBI4vG0gouGTofGlzYCBP50l
	pc+bveJQyZLbL7T6cFL3vOma5d8ONDe0MGWdeM5s8WncSPMlC1JahhF5QJVAfGEKetc65WHFVfw
	EBYcklipOHKc7c4PwfdtwPV0RVUQvVb9PvUJ/7LimkssIRe/4TSAKm4EZkcBd6N0WCveQgE4yvb
	FQkVz3s1ysAlVd93hDAkCIPVUlPeFdvQTYU4TYCHUjGI5z3pPzkfDuqIfa8toCVDZIcgDrFiM04
	Kc=
X-Received: by 2002:adf:f6cd:0:b0:45e:ec17:430a with SMTP id ffacd0b85a97d-46507102de3mr5698705f8f.11.1781877572252;
        Fri, 19 Jun 2026 06:59:32 -0700 (PDT)
Received: from localhost (p200300f65f47db04359fc0e70763236f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:359f:c0e7:763:236f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4650bc429a1sm8133882f8f.30.2026.06.19.06.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:59:31 -0700 (PDT)
Date: Fri, 19 Jun 2026 15:59:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Selvamani.Rajagopal@onsemi.com
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Piergiorgio Beruto <pier.beruto@onsemi.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jerry Ray <jerry.ray@microchip.com>
Subject: Re: [PATCH net-next v5 12/15] onsemi: s2500: Add driver support for
 TS2500 MAC-PHY
Message-ID: <ajVKfBKPuNk9zN7b@monoceros>
References: <20260614-s2500-mac-phy-support-v5-0-89874b72f725@onsemi.com>
 <20260614-s2500-mac-phy-support-v5-12-89874b72f725@onsemi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vgihchiky4pi5wmr"
Content-Disposition: inline
In-Reply-To: <20260614-s2500-mac-phy-support-v5-12-89874b72f725@onsemi.com>


--vgihchiky4pi5wmr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH net-next v5 12/15] onsemi: s2500: Add driver support for
 TS2500 MAC-PHY
MIME-Version: 1.0

On Sun, Jun 14, 2026 at 10:00:28AM -0700, Selvamani Rajagopal via B4 Relay wrote:
> +static const struct of_device_id s2500_of_match[] = {
> +	{ .compatible = "onnn,s2500" },
> +	{}

s/{}/{ }/

> +};
> +
> +static const struct spi_device_id s2500_ids[] = {
> +	{ "s2500" },
> +	{}
> +};

Please make this:

static const struct spi_device_id s2500_ids[] = {
	{ .name = "s2500" },
	{ }
};

> +MODULE_DEVICE_TABLE(spi, s2500_ids);
> +
> +static struct spi_driver s2500_driver = {
> +	.driver = {
> +		.name	= DRV_NAME,
> +		.of_match_table = s2500_of_match,
> +	},
> +	.probe		= s2500_probe,
> +	.remove		= s2500_remove,
> +	.id_table	= s2500_ids,

Tastes are different, but the idea to align = is usually screwed by
follow up patches. Here it's broken from the start. If you ask me: Use a
single space before each =.

> +};
> +
> +module_spi_driver(s2500_driver);

Usually there is no empty line between the driver struct and the macro
registering it.

> +
> +MODULE_AUTHOR("Piergiorgio Beruto <pier.beruto@onsemi.com>");
> +MODULE_AUTHOR("Selva Rajagopal <selvamani.rajagopal@onsemi.com>");
> +MODULE_DESCRIPTION("onsemi MACPHY ethernet driver");
> +MODULE_LICENSE("GPL");

Best regards
Uwe

--vgihchiky4pi5wmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo1Sz8ACgkQj4D7WH0S
/k50xAf/Zh/5TUve8B01NSTYsEN/FHNN2Ll/KSVNoRTgKx8ImFNr2/o/BEgi6GhK
pfNVfy1Xf+GanFXibebKU1VQX7LuHvcyYGXnkzwA+qObF81/JvZWwiqHK6NykReC
tPMNc83BEKNMA764MoqvoZaSukhGUvby5CBMSqupfKgxZ+c/b2FC6E8Hk977oKEZ
J1nZQGEdCQ+b2/m4sQLbwxIZpra7CFVd9q6ke8JkqV29pA0koqFQwfaB1r0LGIIr
jTGPN/so0SIMhZulEk/kK3T0f3Z71a3YD7xc3O9tJE5MYexsTK49ZJNV+aGtvirE
zLZ+IsKQC1b+FCzKBDKhYFsysIB2Mg==
=Joyu
-----END PGP SIGNATURE-----

--vgihchiky4pi5wmr--
