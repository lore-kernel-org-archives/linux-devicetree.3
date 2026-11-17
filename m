Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924655;
	b=RHV1deMa264GxqQukEH9dQ1ZJdBGaXz5gIVRD8X9jLXWtGMdCMLY01W5borOryTdDSkI
	 vcxaYph7h3hCFHXwYorEp7YC4SmDhynbbTkRZbaXGfmO51bmO/Q8CFa0samLNUO6207Vh
	 /4ddlraJoNHhEQdW0zGBel8EKM4vUTrjRs3XmSxsQCpv++OfhERFZT2vtIh1ERHwqKAyA
	 o+ru14gCQu8Wn9HaWIJ5xsXVGtRI2/ntmfYteCOwbNyVtqKZlWTvFuEk1JxP/dAv6o25V
	 TU4M9zNZzmlj6WqImeybcfKgsXqyAHsqzffDWTYWQEWpsagutdOz414XeFUIY581oTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=whjZuJx803OECGZ5BXNalc3GEiTKyKTsH0cL456539g=;
	b=0RyWZ7EKCtm9lEu464X8G76/5/PsZp9UsU+Z8ttwpKar45U47Ljn3fcTMqSf9MFTx1xT
	 t+EXOjAB2KGrXGVpwMVWfoskKU+A7OF1r75b91gynTs37HzS4BW6r3IQymTNy2MOqaq1A
	 aoxG5n2qRWackWYvdfW7kOKnbMUDtGQgRbZrmMD5PwlxEVgYfIoiH7NllW14SYaRlw5PL
	 o2D7wre8C/rybvfZyav8zlVPJJiOLIIFfp9eZzorw3VRW8ged0ARr5rf5aBS4QJGtdy6Q
	 clzIqCRt71op2CZ+cWaZcdZajHFouMIEM4yZ8JC9rtaeR97x2SJB3N34AoXIOcTWudA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d4Hvoy7p;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7A7606A884
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E7A7606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d4Hvoy7p
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso35747335e9.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794924652; x=1795529452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whjZuJx803OECGZ5BXNalc3GEiTKyKTsH0cL456539g=;
        b=d4Hvoy7pxpb1GN8453dYuj2x9rXEaWYlKEof1StTGBlLww33R9Lw6xoqKlcLrvYHEg
         YcA7WzHjoCBNwPefRW6wiWxxjZg3WmvXAVQ/y2CBvz/23FocTudxaF+7f3ww/6QDESZu
         MIWrhq6uVpRNeTJkq6Mf8mk8Flvjcq+dLp9jS5cXdjT+UGfOcdK6p5l8SGancjifHb4u
         +3MpGfW93IOtOsvzaQaIUIlUWOY8BM+V/MZdWKyoxOkFkn4wG4hazAfMG9pMzlgxN5tQ
         omoZTKXXn+yvRhWDzhmpSGiKLyGnkXMRCjkj2bq8cVcNbS5a2xYBqpyUUlW6h2KpiPmv
         t8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924652; x=1795529452;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whjZuJx803OECGZ5BXNalc3GEiTKyKTsH0cL456539g=;
        b=tZeJjmJbKxbEalyt8GOjUSz2E7fvlggiqh0EeRz4OiPZU/APJw/nxAOIN3jgRJTq1i
         9OOQGgU8hhFALNdtchWcS2dmFRSUhDEehiV4QyWX2NlEm5tY8wEUkwpFa8iPNjfYkC3u
         vjcvfde7oscCexrl6xzTxb3KkdcFBslLQ4XpI0Eiiqi6j0osGaw052GcSUQ+bUHgeUnl
         i14G4Ze2FIDXEUuQ4KGkq4TJESaS5RGMGTW1w8HxsAgzf1K2QWojOqwAMeVGvI5WyxF6
         c3s3wkNsXhKaih9cBv8Hkqg0fBD6K/qX/WihxCJ/D6wl99reLsDk3VU7FpHS/FL+KRqf
         OOew==
X-Forwarded-Encrypted: i=1; AL+hErHCUtBZyzItEFLbFHkYRbSaGSmr64ji2wWtdgeb2xU88EO3vmTwXfrAxD6OgmwOPxXqSoRvWe8hRNau@vger.kernel.org
X-Gm-Message-State: APuU4Z+mD2B5jiErIeJ3FLbQzKD2RlPv64rcCgVBPBOitRdTZSQbeQkO
	b32VE+oilg06LUfd5BTrQhpNuL0dwPD7eIpgMGVZVeW11vbSLPHBO/ryJLHDPSvwO5A=
X-Gm-Gg: AYBFou3joWNjrzDDvB+UUOoCTATU9Csx1LqyKg6FYNL3O/2alE1gM+KgAdx7TgLLVIH
	++p62E2TCUv2ERqecpCbhaiFuj6Y5++SYf6o9pNRVjhBIK+lLQbcGLW4tUBAHxDnJ8UoiReXZvV
	Ga08Tzk/2zR1FWrCDIf+IA7oQ2vLTYZFKGv95d5zFbR7R54F28SpDV6sWDvLvXp7tkh7wW6Rm/F
	3p/4Gq8+ffKxlaEVztptdh4Naz5M5CRRc3T+nzZ1Em/qXK2lxUFhfIjrkVXrLC7ShmeMGWT96EK
	o0oSzRcNTRI8ba0ocgkxzz3MmNc9Q95MBpx9qxJ3OA2UuZnehLr1vFYVHr+oKl83Namko7TtOQB
	HkZ3hGGX86JdqGFjljWvwxOGQoozn8TwvjllkQAukE80QkXeojlPMZ+E56y7WeIC1RuNlP6k8w9
	ySOy8dgL9sN5Q7R3TY38tzpdoHZYQK6///YxPlbfLrD9TKvs5IyU47VFk9kUXg3HyHT0/TG2N3Z
	rWeEHvD9T4xS5xZJgA4g5REpw1/kPQD5QTaexaFHWPDqRSSfNJAeALrQq7TxNA5fUecOFWWztlL
	pZWo5lucJbHhGO20HW4dOeOFpS2Lfbf5a/ySQxf6/GMry6oW6vxFhrfmOzWP9NlGcmChH5L/y9x
	7XMymhvF8NhUpTBM=
X-Received: by 2002:a05:600c:6097:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb66265d0bmr196643105e9.20.1794924652481;
        Tue, 17 Nov 2026 06:10:52 -0800 (PST)
Received: from localhost (p200300f65f19a904a5ac91f50e61369e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:a5ac:91f5:e61:369e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb78386902sm78143685e9.1.2026.11.17.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:10:51 -0800 (PST)
Date: Tue, 17 Nov 2026 15:10:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: CL Wang <cl634@andestech.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tim609@andestech.com
Subject: Re: [PATCH 2/3] gpio: atcgpio100: Add ATCGPIO100 GPIO driver
Message-ID: <avxgGQL91z0ezLFH@monoceros>
References: <20261116040914.368298-1-cl634@andestech.com>
 <20261116040914.368298-3-cl634@andestech.com>
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
	protocol="application/pgp-signature"; boundary="cyuwbzqgdey2ihm5"
Content-Disposition: inline
In-Reply-To: <20261116040914.368298-3-cl634@andestech.com>


--cyuwbzqgdey2ihm5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] gpio: atcgpio100: Add ATCGPIO100 GPIO driver
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 12:09:13PM +0800, CL Wang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id and
<linux/mod_devicetable.h> adds a lot of unneeded build dependencies. So
please drop <linux/mod_devicetable.h>.

Best regards
Uwe

--cyuwbzqgdey2ihm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr8YGUACgkQj4D7WH0S
/k6Nbgf+OnbjIDFyQv3zYIqcwE/Un//NPGHrFQ9idxBn0sOWRA4bwsWkktGVG/ci
m4eZ7fh6kVNQ/S75Ab8pg4+r2nges3azKBvLpjUB0w8W7GocXMcVhVGgtnEs7NhX
x/C6fVqVxbFKcc515ipiVvs5MMQ/WyFf+AXuRea4KgAhVBdsSznpQ9MSYx5S5pNf
LOXxIrMnnkzVHODUtFQqnUBvRheMhndwVSTKSO27i3jV5Ru2mjYMx9U1alrty93N
LEhseOe4f6Ug+BRa8c0+x51EuARRVFxGNSf6b+uuy7zgz+hR3My9bhyu9JFieWmA
lDkM4htuy3LfAAWTUW8eTCDBChFi7w==
=Nh9T
-----END PGP SIGNATURE-----

--cyuwbzqgdey2ihm5--
