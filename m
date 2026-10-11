Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA1A46985B
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791759984; cv=none; b=eTjJc7aG/sF/wx7spvr8zxTF/c9924qr5APKm1gT+z0T6kvyrRu4TsgbWHoqmbn2JjKUuvNDMqqnxNUbQBdVetL0dn75WP9NF17Apa26YMVccC+Fk2+Cd2dIFY9541Pqm3wnlZvuy4j4fyKv51+NKaObNqOJfWn4Rq7KfXW3bXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791759984; c=relaxed/simple;
	bh=GId+tRXTCvTzFm3HINSe/LmkKEkAakiciV2ix96r7+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au0gcn+x7r3INrS6uP6VyWeZ4j+s/ipz1Y1DFj1dJubQAPOG/N9l0DE+MJbXQGpGhZNbhr53fl2IpJkHaSWIHkk+7KBSNtQXjQM9UR2Xl4UsAXVUkqrXnx3AX8rUcpZNdTD/FHqt/NhZ5OU7NPEchNwI16YzB7f0vX3gInYNgq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QXlcqlfG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QXlcqlfG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b02a2359aso1195518f8f.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 16:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791759980; x=1792364780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GId+tRXTCvTzFm3HINSe/LmkKEkAakiciV2ix96r7+k=;
        b=QXlcqlfGq8qJflB8PXiVeVhLNEArs7zM+5eyofiXwFPfWETqNKQgEYbd0pTB6Xy4ft
         l4q2tJuxoOb9j8yBoXmk14mQLz0YQVoYNmeRJ1EjVXB75Udsm1j6oLS1cteb8+Ljq/Uk
         PwjU6Td64OjPURTdDizsrvAe1iqiP4B88WH+WbcmDKa1eTyfOZle2DoD3R1LBqFSKxKn
         MOc6ghgvBjDiyYdULGqrzQIcB9UFLxjOsbFlhAluW4KpfKPv9jUI6Ke8Xt+T1Bi+taJi
         FwVF0zcAApTf+6C82ep7AvBsNxi9OOPcVP+FZelgFDLlwDfG5LqIq399SipNvoFo35+J
         Zcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791759980; x=1792364780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GId+tRXTCvTzFm3HINSe/LmkKEkAakiciV2ix96r7+k=;
        b=GewD8vtFQ6vwBuulsC1NKb8tb4ouQcDYtY5nG0uw6cdyGM5wv3h+jLVgucRdNr5yhk
         CqQQWCd9oeuJDaJWA49TXvWwPcIzqpzvB+dV3owSEXFk8zC/kL1SaEju2XOegS8aW5R2
         hcPpgZC2tzYlDIiI0nY7KMrQP9LTD20YQogRua5PUeUyCL4aj2n//tK9J3SaejV+4gty
         gU3ey6Wxa/la5Iid0KhO3SWLEDqycDIYbdkgJtxSnmdFpesYlKgyTRr7TNzFt84ZAQS3
         QHENPakkmo1BpNKjaUYJXX9E0Asp3ZoS0UV/GqfwovTWMGkpbVs3kEP3sqswC+jRlvAK
         QsJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUgBhjKqIpofYEcy04WPIW3wd+M0rXbWLG9gXhi48G2ngJffgnKOCADN3M6YZjIKgmDPxzRifdfxA+@vger.kernel.org
X-Gm-Message-State: AFq9FYKz00okTdJUnl9eAtoNy3uiM0qefq1Exr8MZ/jvjTlRXK9MPSmn
	G0AJ1u5aKwu/isBVv18LweGXvvPneKXBNQMstVy8yTx4IlDAO8iNeDm8i1PxlkOY35c=
X-Gm-Gg: AYBFou0hD6EBpaEYCMLD1c6pTA3SS981Bj6mrf5GMelWL/IrcEjIt+aimIfeSaVA/GT
	QEc312t3pT0AItyN4Mr9CyVVKOcYvjrC8JPlo5QOae35YBO0KLAvzIk1UqAZMwkaxHaQ7V1LTuV
	VZpY9+zsv4yf4w8AHkcW14uERYFnYZj/8k6Oxs/Ih/+OggaZm+n8+lb7v+3C+2lq+37jDRRdIya
	QoRXGMkRJEbkp679z8dFHZNKj3h8AjZKk0oXWV63J99Pfpny0FyVp2InHRob5OtNdw90vFluSlP
	a2rCNUqkypMmU+gjohga7qW1aVg3djEUFlI5D255A4Dynv4MOQKUIXTM9+45Up0QPYwuJl2KRTu
	5xnby7DSom7/NftU/bJyVD0hNeIhOW7ytmkCn0o5n8RcbCcZqKruKP6CGhAaftN/E261W3fSMHq
	S9qsRX8mw5XqQ6xvYT1kKxvNSdOH+cxQ7a8JYIQ2exFc3s92KUIyrrkRdj/h3B28xZIcyFKDEFI
	Jc=
X-Received: by 2002:a05:6000:2306:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48dba9e6163mr13299157f8f.7.1791759979566;
        Sun, 11 Oct 2026 16:06:19 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dc1abcaecsm12488698f8f.18.2026.10.11.16.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:06:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:06:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jikos@kernel.org, bentiss@kernel.org, dmitry.torokhov@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, allencl_lin@hotmail.com, 
	tylor_yang@himax.corp-partner.google.com, felix@kaechele.ca, dianders@chromium.org
Subject: Re: [PATCH v6 2/3] HID: Add Himax HX83102J SPI touchscreen driver
Message-ID: <aswV0ATke05Aa-q5@monoceros>
References: <20261011181633.1778969-1-michal@nozomi.space>
 <20261011181633.1778969-3-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2zn2xrgow5dc2xy6"
Content-Disposition: inline
In-Reply-To: <20261011181633.1778969-3-michal@nozomi.space>


--2zn2xrgow5dc2xy6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/3] HID: Add Himax HX83102J SPI touchscreen driver
MIME-Version: 1.0

Hello,

On Sun, Oct 11, 2026 at 08:16:32PM +0200, Micha=C5=82 Kope=C4=87 wrote:
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. This file introduces a
big amount of unneeded dependencies. You can rely on <linux/spi/spi.h>
to provide of_device_id and spi_device_id (which are the ones you
actually use). Alternatively---if you want to go full iwyu---include
linux/device-id/of.h and linux/device-id/spi.h directly.

Best regards
Uwe

--2zn2xrgow5dc2xy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMFmMACgkQj4D7WH0S
/k4MXgf9EcZ3GfDdHxsy9EN8ExCwEfNg60ObLE8QD0gdVxF+YdCbdpGNF2XrpYvk
exy5MWNHx1evhGI8uT/bu9C/jyhN3agP3CnjN8IYUDxTDMIt6AnsMR8o/K87exej
Jwx8C3Y9Yo3SQpDDR4mJF9ftPo4LgbCWne5l9cEAMH4M2i2xBYSZrMNHdPsRZ8rh
91JD5Nl0fgYKcD290dVrM6Yyzy0jTpbUgTEm039g0ev8eEvvylQcfsP30oqEDaI9
sHPHaxeZY+jPpKiOqzfBMP1IzFSQNXt86mzcWDLKLVHalJWEh7O1dnfv1SqWhPEA
s2aLRmZvKqCLimKqBYM+vLnmUtqynA==
=yG/u
-----END PGP SIGNATURE-----

--2zn2xrgow5dc2xy6--
