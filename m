Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171659;
	b=MFeb369j75C1TLktpQbvrpKpA+AQjGwsuIeufRaDfk3uU8YSgVkttnmKjEK6cJwlgnkS
	 GamQjlMuwEKV07Pa6HyTeNfjUt91V1Xh0LElgtBe7Qt6iEftWZi5us1POEaj+dkjOxDt4
	 Q/UDjhK2iG1QE3VES4e+Q0RzKGKDJ4xioBcpg2do8oCcnEBQgYs2Gon/yQb5aO4N1NRFe
	 PcIbN0XUFMcPag1UvfQr/sx+TWZ2YY2/fi4sw1snqt85zYbSLhnsu8ajrlGCnd5/qwpUv
	 T6T/HELA3wDWi4jLeAyYagg8DQoCZEfD1WXNFeb6A9a8TWlwIdsNN+bUlFZHtpslYZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BKa12JHLTaIrkAY7wHaBaCVm5O2tQjU5ZN+Qd4lZVHk=;
	b=K0xQHSVnWaJIhMOD+7N/QVmJIoxVoUVGTbcaWKFtWb2Q4OThQ4UjPn3AUpzDE0nj7UWu
	 YhVaQCAdgwEuKizFVbbh/aFJ867+rNILKGq0mb2O6knQz3qHz0SHkQCAgR2Qfhs9fLm2y
	 oCfewL2Z+iYogd7EekT0Mg4TtYymhgsXWCOvBxDYx8ZnKdKY8sFzO+3QKJnZn11qRwf8g
	 uj+WGYWAf/mE60WofuzxrZwo5NIuiTXsn2FtdeN1yph53Chx/6IhSn/O1pjBch0jFQOQT
	 TZqKUY6rHuoh/RbyyZZGVMY7xTVYCx4X6qXkfFfTKEi4OsCARmS4m02YrjIRn0yQuiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DNo5vidD;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86073606A320
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86073606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DNo5vidD
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c5358fc28so481904f8f.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 00:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793171657; x=1793776457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BKa12JHLTaIrkAY7wHaBaCVm5O2tQjU5ZN+Qd4lZVHk=;
        b=DNo5vidDAbaZyqt5DqOmh3lLhzHdSiDXFx9EpEXiGF5MxBHB80PQg6WPFPAu4m+3MQ
         G9uIzH2aNzbQXmQoY4eHF7uBgoZ9PnrPQ0C6WnniZ2JKW26vz195fWYBG0ylIyFc05LQ
         LaaM6Af+PKwaLf64NW/ZRalX92SvnOShO0UE2srbrHovIwi3VCioanRkbRZ3lUDeT61T
         5gFKraEKB1Qgi+bCL1dzaz9USpJW1jqR5rk2zwoPZ15oZpTF5JuPCslVlykXJcSbTkN/
         oCvLJ+lx6L46bR+wJ3TVoudqfgzZaI8xOc7/1tV4J3BiDlcfagt6qyJeB+wICmFIAIO0
         73dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171657; x=1793776457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKa12JHLTaIrkAY7wHaBaCVm5O2tQjU5ZN+Qd4lZVHk=;
        b=Qe1aKWb4kps7K3R+ARHcN8wJZTDoajAcDFZFBZY5ZDwwlw42OlyI7Gn2XyBxnfWGYy
         p75RyWZrT1HRXDRLjlB9gpnk7TR54L5dvxreFpHqO4eTTpvEbJpSJAx3NV1R4fAwMw2w
         KD1xaI3JT6DbyQAx0ekYoc+MAVgPKuOcDfDTv/X1EfFGvsBwK8lUqlk7jwcgcgSsV0dJ
         jjzgaQqbt8nXeBxjc7TX8sxGCjybLVV2AmXPOTBowsx1ba1WsPLllEB3Sl8fUMtuVvIs
         mDtbLKsbHTBAAVOe6kQSsSKl8RF2iIKTwTiUCwl5aevC+eW/SMBNGXhov8nU7RKPDVRO
         GaNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRk+TdmTijHVEo+TkfsDwGzzoAdqq0KbAvV8CZigKdnEKLOhDL+TUFZrlXNXAxFZeLQvDWdCO2wS/Q@vger.kernel.org
X-Gm-Message-State: AFq9FYKVIYkgxNx/vDyUBGvncaZPkphhwYOV2cDwngFE0Zj/vGPqEfTr
	RR8ifxdW1s0VN1V6IBF78yRB21asyr/KtDEwxRbuQLeslkLZ+4mbqxovZvG51XnRM2c=
X-Gm-Gg: AYBFou0VqN/sw4qKMS1NYpuJVsfO1/bGdHVXH6/wd5EyQfr/1A1QPw+UmaAPIvcTyqE
	1fZgaCHgc/YmLMCPwDLnr1lKaWMxT+Jyp+K/caBm3GrMuYRpqwUQ3wChU+xsiXT1250CqYtJBpS
	bDQHuVDW0180V+vjJ9WKH5n5lblTVl6tMmj654ZkoRv1xkTwa/BEz2vF7bUoIEJ5wxJGTINKgzm
	ThnfcjYRguNcFmd8sQrloQIfUBZcJhW0kFzF2UVcxAbbdiYreDOF1qPoigAi6o29QNNxgfiRd0/
	vBwWUjiqCKvnOlpuCkX8chwOUJXVaqicS/MG+jfjGLzvi0pQgdOj4hhxdoQAQNgSagsPhcecJdm
	yZ3cR/X2ObMyRaWxnV2512UxLDZIoAeKu8DS48J4wv/GwvFBk+/tODn8yP64D6a2mbx0wPpknGz
	J5Rrt6SCrW9pJuRPnRSIx5hYFV/I81rhRkGsIiSKB+mLA3pJuWqZqchSNR31dGMPyAt/wgRVUQI
	5+sPSrFN5cK+hK3XF1yCD9NGJY1DAnWg14uflBjLLF4FJyNYTfRPMTIG59XmAH6QxQYeB2g5NcK
	LmL0Psvp6jOQU5HE6vgvW1YurvQeeaczvRG5ImvGOovwYWjR0JDpZM8IFetsbVB6ksjy2PyUh2S
	pzSJw4mcEPJmt8Y8EhGqbJf4eooMMgga8Lg1M
X-Received: by 2002:a5d:5d0c:0:b0:48e:4300:c70e with SMTP id ffacd0b85a97d-48e5d5ae171mr3363614f8f.46.1793171656743;
        Wed, 28 Oct 2026 00:14:16 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebcb958sm26969844f8f.21.2026.10.28.00.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:14:15 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:14:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Aniket Limaye <a-limaye@ti.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lianfeng.ouyang@starfivetech.com
Subject: Re: [PATCH v4 2/2] i2c: Add Synopsys Advanced I2C (DWC_i2c) driver
Message-ID: <auGgVBEHvowseCt0@monoceros>
References: <20261027-tda54-upstream-i2c-v4-0-ebeeaf87d181@ti.com>
 <20261027-tda54-upstream-i2c-v4-2-ebeeaf87d181@ti.com>
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
	protocol="application/pgp-signature"; boundary="nb47bxu4r7dlod4p"
Content-Disposition: inline
In-Reply-To: <20261027-tda54-upstream-i2c-v4-2-ebeeaf87d181@ti.com>


--nb47bxu4r7dlod4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 2/2] i2c: Add Synopsys Advanced I2C (DWC_i2c) driver
MIME-Version: 1.0

Hello,

On Tue, Oct 27, 2026 at 05:00:36PM +0530, Aniket Limaye wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>.
<linux/platform_device.h> already gives you everything you'd expect from
<linux/mod_devicetable.h> without introducing a bunch of unneeded build
dependencies.

Best regards
Uwe

--nb47bxu4r7dlod4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhoMIACgkQj4D7WH0S
/k7H8wgAnGAwJoL+e+Le96yU8hRX+LS1mxggdmfwSPFllT2XuqUDX0fD2CksmHRN
8v/0LTJOU6dCoaLDgXojtyhjWD6aQ9eIBohBG9Ednr/skIStvCz9/G5CZOvayK5p
Bz4o9cdfMzCYj7hMfRMEhckEaE7stpZsqAI6PyOLDlPN2VEsTTO2eNWqQQOST685
hoxWdnS1aI3LOPzUubb0vITD+l10XFzqGI5Bbq0KmjyRy7i/AOYXUCw5GVPiDQPm
Dwqtw53FNFvSZP0fhpGHmzAU7GydBWg1NbRITN6AqYzvI6ONc0k2u9fA8GEUqWf7
R51YEtnYj75xSueedmapu+p+CeOHHQ==
=1P7c
-----END PGP SIGNATURE-----

--nb47bxu4r7dlod4p--
