Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887006;
	b=Xerju8mz7dk2Tdyg+TF4hbtfGeFJTMij3Wfe+xkI0gGsElDMa0xDzEtVVCICLWT+UKMI
	 nJwHCU/WPsllh2Mvv9Zb3zyqb4OuTHE8tXXQf8BWox6hN/lR3NaBwdax61Ev36KCUgQyr
	 bmU2sD/313ht+fFc37ZdtlpWUVad50kdm8jPWZ0fMQqRDG9vkSdmDXpCWQrSeJlr/drCo
	 hCQi68ynNEry9nt+RC2KlktXR2NrslP+BQbS3t0Z3hqzyUq1PQvSZ5DdS7YCpoZ89ECw3
	 8g5MgXf05CdXn0Q6Djr8vFAFxgpLoD6YtnFlY82/+Qb7aO/ImssvF9IrLPmV1jUIdcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8TiKAvJXB1NGH1N8fdTjOIOAtKyqlHUX1XLSobFGMdc=;
	b=FUrRHR1ODjSfvRztGBQ15DGvyCZ7GT7cwL0x8GrVz6sVXjZ/UI2Mq/VT+VKo0pHjsHXr
	 E1wdL1cUElpWk8guSNecpzNFe5xi38yY1yVGtJkmb0dnakheZCUo3QMOrFO1sRkidwycC
	 N0cHD5V0tEqYucz0ewpvhHJtPBRFJBMzkpqUmc2Qrskn3BAJGusb1jdYNEBx8NOIEbEZ6
	 DgdC5hr0k5RoX7GbesWwKoPiWOcMCex5RXfQSfQy5qG5WFMwATH1wPonC3KGY+rNhfKTq
	 iaHozpTIM1qqVrAn/N6WzYSBZAZahaVLI0HHYSTM4S5d3OS8Ztgmr6FQjj8GZBlemtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iNVA6ioi;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59161606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59161606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iNVA6ioi
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20edd106so1355180f8f.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793887004; x=1794491804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TiKAvJXB1NGH1N8fdTjOIOAtKyqlHUX1XLSobFGMdc=;
        b=iNVA6ioiu8eO+9tzpQL3oNb86QKDrzMRHGj57cea2rDeLio/Y1s/ECZPeuA/uZ3iA+
         gLGKJgGVi1Yp5zVrLk2D43+m2iffO+kvPjNBtBP7sQ/WeIJma4EwdzZPyQk57IWfjwy+
         NIQjFQu2oxZXHZ1Irrq38vHb77m48IA2KvwA1f06AmeoI4Ax+hRkDVqKZ6Dx255K/2vf
         ZKsHj1aLBrYl87FR3WSLF/XnVFg5MJ1mJ0U5nOKafZ6eiglpNikiKms5JZMBjMjAX7zW
         ggX843EjJdH2OMcJQQ3KhZeAxGRz19kqjz/InMwpf/mW7rM1MdZblXXanMdFRKwnb59M
         YxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887004; x=1794491804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TiKAvJXB1NGH1N8fdTjOIOAtKyqlHUX1XLSobFGMdc=;
        b=eMQDPoyqK27PMGZqFjXlI+Sxn6R1V1on8z3Npd6U5uERd88UUI43vm+A3ecNqSldc+
         IQd14RIa6ETXQbnRJeoZgF4VoBTeosVSIKbkx+AQF+8ko8a01ocY17P+o7gEqbGAHMxs
         GHHltHcey4+EKqna2gHTUVtUK7gUPZ2350LND/XpCo/seXb444OtmBtBHdUivV0VJoEa
         tOoJC6lI6S6IivoM3y5EaxrDAHXG1EUmrP4TiMDURDjoTGom9HkS62TjiAiIs99BL6gr
         /WrOq+4WQM2jm9xkSm7KYhSveK99Z0VmE+nKLgLsQlkKa7cJ712HVndlTpFi9g0PFGrA
         B2Sg==
X-Forwarded-Encrypted: i=1; AKwUvBy+4DwlkHgbdMinMXHIMZsqN0BVUJ2GP/IQONrX+Cy0Ek/25gHA094ZE76IF4lgQ3SXDl5l3ZtoHAnN@vger.kernel.org
X-Gm-Message-State: APuU4Z/mvv6I2xU3VG42A3BUpFYIPZA7Hp6WYke+bVj+MHosXzmTUf5N
	Xjj/uFFVfJz8HOh0t2T+SFCxFD8PVKb4WAigmsIG2+W2Le4jOHVtdfr1PsgaugzZxcE=
X-Gm-Gg: AYBFou1Kwm0Dh+Nj8KHh1IGV3wLuND9s3InwKfTRZ4dYs7Jj/eu3r4CMrIFhcaFCEOV
	CCNUQxfNTUr67OfDPzVICyxgDMzk3WpiZ2ziMhAKz7xkz3feXSmTlQwb/MVwZ8dShfO3FdkPavW
	12EVfdNnq4e3w/HOl2Ocsw2wQf1o3ySr6zmR1Ed47yG3H25wOSfqPeqteLSOe3zSpHrgyQ0+HxK
	s5e5zT1RzSUZldcUn4nP/9feA6uNi7vef6bjX8uZsTUA4Zs564g7l1QqR5b9JSYrxwx8aMFYFwN
	s3vNDeM/Bq20YXa+/N3ngtKYD6MRXCKsdaspw0VXRJGxTbyCboR7j8w76/e7tD6IhhdIOsKbjyv
	Ncu3+zY6qlMOe4hYSv8E8WZ5E7i/4kL/bneNFAB99M/xJm7IeXnXy6bC1+tSHVVROoC7UrpRfkA
	xXv0QiSUkeQGx17gTf1VVo3caqpk8RghrD62hFkcC1p9GGzwnxvKXe+jtbpyXL9onFmTqQvBFRj
	XmRGnpyo7XFE42Qy9KYneCPBXfsxLg5KHRRUWaNmh6yJqiXyoTpHnXjOiyxL61AGfimczlFvzTt
	seJN0Ov3Jx53sLpbXgwufY0FIxyW
X-Received: by 2002:a05:6000:25f0:b0:48e:4f1e:5e24 with SMTP id ffacd0b85a97d-48e6e2e75b0mr38836163f8f.14.1793887003590;
        Thu, 05 Nov 2026 05:56:43 -0800 (PST)
Received: from localhost ([194.213.108.7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48feda20567sm10969363f8f.51.2026.11.05.05.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:56:42 -0800 (PST)
Date: Thu, 5 Nov 2026 14:56:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhila Kavi <akavi@axiado.com>
Cc: Sammai Chakravarthy <schakravarthy@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next 2/2] net: mctp: Add Axiado AX3005 IRoT MCTP
 transport driver
Message-ID: <auyKnmpiL7ZSJkgs@monoceros>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
 <20261101-mctp-transport-irot-ax3005-v1-2-36ceb822f01e@axiado.com>
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
	protocol="application/pgp-signature"; boundary="2v5unmaqs7i3rrwd"
Content-Disposition: inline
In-Reply-To: <20261101-mctp-transport-irot-ax3005-v1-2-36ceb822f01e@axiado.com>


--2v5unmaqs7i3rrwd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH net-next 2/2] net: mctp: Add Axiado AX3005 IRoT MCTP
 transport driver
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 06:00:58AM -0800, Akhila Kavi wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as it pulls in a lot of
unneeded dependencies.
<linux/platform_device.h> already provides of_device_id so you can just
drop it. Alternatively if you want to go full iwyu, include
<linux/device-id/of.h> instead.

Best regards
Uwe

--2v5unmaqs7i3rrwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsixQACgkQj4D7WH0S
/k68lAf/S7Au5tx54BaHhFIyr9rnWPJhc+OMWG/KaFglaxrdG2WQeAImkDXsQr88
Akm6VVPKYQBh50KUi2muuoNafteiCwHcq9JtSo2+R9q/d75TDEKggJICOxF7DYzs
wTbn+hGwOmxGwHjpR0nNW8uQWUyIhk0irXV3NsQkMhikal9x5T8XOesQJnoZA3bT
UEzoa1NXgZD0o4T+sQSLjMueCbC8OkC7GrhuMqiNG6OzWo42mecP4cY4li4MxjqP
rFj3ymSSJzaGlEtZoe9+m0986qi8/JUOkyh26I1QR8xsjKpq194Y55T4uLnlklID
EsuWtThrtvbozh5Kxnz8O9aFUEb1xw==
=onVy
-----END PGP SIGNATURE-----

--2v5unmaqs7i3rrwd--
