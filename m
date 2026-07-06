Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA703B7B99
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358376; cv=none; b=WSkPSzRyd2lcoDk5Lvm6I4qNzjLPU/cDtsHaL3ciZZG0mEjLCWTvszoS/0H/qGlyOzvkfj07UIVOJQdtCRzPRy3zuFvTaWakGw86TIgvV43KFV6m3Xb6cfRXUeajOojC/34867NU77iNiIduO+6b5MgiYpJgaZf4im2fezXbpk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358376; c=relaxed/simple;
	bh=dHBwqhTYfbY9fJIHTmYEjxPraka/sj1Dbn/aCnQQgls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA9JqAMvjpdxmhLlKFwQG1e0nbmw5mO3ag99TYN/wUhhomHtsUAfsQlbRZnRX6dlgH7d3Nwdsjn5DoP32icbneuRvnzbZCSmVxxo/NVE9bbdrIw8jsdY8H1p68Qm8+YHNs5M5MbF68+4WAO0wmaltHZOSfl3d3jLQ+N5brSlRJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kEDcriMY; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kEDcriMY"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-475417f010dso1815994f8f.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783358373; x=1783963173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dHBwqhTYfbY9fJIHTmYEjxPraka/sj1Dbn/aCnQQgls=;
        b=kEDcriMYD2qbvjO5qDz42WB9jgpc/wXissBLYzuLKVsDh37RLvM+1Wpwqe/L/wEgEn
         Bzsimd3HEfJTDr2JQ1aoEARPmt86aUvKAJPMr4216YOUf6zz2G7VNmJhatFVULtcqrHk
         m1fpgsSVtiP7kP2daY4SrEZ50S+wwgF7Go/D1c8lt9Rgokyf3tgg/AdebvEAWI1p0Jwf
         b4yEcNcmJKzOc36PhLqkk0B93aBUJd6DPSi6gz1PY6cz7S3uq4SN/6ub1csvN5hKdiYg
         9rAAk3no0/OW/5KI/vtXPUBKPgFHofH2GAt6YDj2Zdia4rhvZqdSc+f278HR19pm74WW
         FVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358373; x=1783963173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHBwqhTYfbY9fJIHTmYEjxPraka/sj1Dbn/aCnQQgls=;
        b=dp6I8Gm9WtA8/irO0xgipEl5/V73lp79rCOZGyID5IxeODb2jMZpSu4efOjApJvm32
         ZlmYTWoffkZguHVVimNLa3dbzrcGvPxus9fuCMVw/Zar65YLu0nEhv9BDBjE3xQUkCZM
         HutensvhLkXIeXoS+BVYv86YkU4OeQtSounTWzZ7OQYX2l3/eLhiWITJobIdacRAHQfv
         flL/l+9Mht2EO3jMNUU3/T3d3QOXVDMQ3DpzdAiA+InfoyhlqvbFibFkkxXXIAkd5WAr
         E5Iok4lnbahlZaNlZVLszyhTrcawFmr1sM4munPwfJNWLJ0wH7S6quZLicPZEfcKHJFN
         5vLA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6dNGarvJMxtBZowNtiJsxKYlcx7wbXSdA2qq1Rc65ad13dzLF6SlDXPYVm811Pmi2Ecf1e2WniwkB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4tDo3yeSBk+8faUnyyamV1JpyldEkSYq66N0hSO/oc1lz+JZS
	dMSLw6UdRdVqmELk4Z1eRDUByvF9m9vpzf6oCSKbSHBZxkXn3MgCJivxUEIzfnQAVWc=
X-Gm-Gg: AfdE7cn2QmJtMifU5yPG6fyfGFY9krshKhEoNwxCpUo1V3C3KQYmrqpw3blUPALKsO3
	2+t+/0wp1c0JZdkpywdbQHFaW2DTaxHnWhNueGuLKpwoy5N9t5J5od7OE3WsdykvOKdgxOq22ie
	IEd/DhKrHQPHP/R7nn7NYkn/N67e17CDZ8KpPT5CkfA1ClVHyWa0K4OfWcMebezMWpaKwaCfrts
	0uzZsnrPmstf9XJ9dzFXiNwHRRUdY++H38SU8raaAexr1IOZo69oPSlMaGA5k3k+4lUM3v21RsN
	SztmA2WWNORpIBwLXf3vL2g2eRahF2vJTMMxN0hrAN9FLm4s54ET5COVy5Ge4GqVHPQEmDcA9An
	a1WMvh8F8gbtCy0RWIm+ERwMwtC4SVhWaPqxRMAqxeORrHA8u/6EFp1gMklvMxUfbKJu5moJHv0
	qOE4unu7d+LdTlYwLfHEOd2ewSnpSkhWaqSr1zUtq3vdUhBR6lxnyTEJgKW4OsJJDrwVaz8t02L
	Bnedk7IDSjUqQ==
X-Received: by 2002:adf:fc86:0:b0:46e:c978:7ddc with SMTP id ffacd0b85a97d-47de668ad94mr1104856f8f.24.1783358373402;
        Mon, 06 Jul 2026 10:19:33 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f21328sm26811879f8f.32.2026.07.06.10.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:19:32 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:19:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: andrew.thomas@touchnetix.com, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kamel Bouhara <kamel.bouhara@bootlin.com>, Marco Felsch <kernel@pengutronix.de>, 
	Henrik Rydberg <rydberg@bitmath.org>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Mamta Shukla <mamta.shukla@leica-geosystems.com>
Subject: Re: [PATCH v7 4/4] Input: Add TouchNetix aXiom I2C Touchscreen
 support
Message-ID: <akvjh3luyvQC6p2w@monoceros>
References: <20260703-v6-10-topic-touchscreen-axiom-v7-0-0d2a550a7ee8@pengutronix.de>
 <20260703-v6-10-topic-touchscreen-axiom-v7-4-0d2a550a7ee8@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xu5avqsjxngvurz6"
Content-Disposition: inline
In-Reply-To: <20260703-v6-10-topic-touchscreen-axiom-v7-4-0d2a550a7ee8@pengutronix.de>


--xu5avqsjxngvurz6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 4/4] Input: Add TouchNetix aXiom I2C Touchscreen
 support
MIME-Version: 1.0

Hallo Marco,

On Fri, Jul 03, 2026 at 12:32:25AM +0200, Marco Felsch wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need.

Thanks
Uwe

--xu5avqsjxngvurz6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL46AACgkQj4D7WH0S
/k7IzQgAuSytq6eodi1gpj8Lnqny84O1wKdC5ws5BbWBuQOxm3s3uS09akU0uyy7
uRPzfliKfsoSiM5ZhS8QmBeB68z2OfPvzSmYA0wATJWYxOMFLub2dpTEfHtJqf0i
C9/oSgSY3vmO9x9yP1C/Sa94x5UIGdxq9O4C5KkClNaSlED478Y5o70Sk6ZHr05q
5jyaYk6Xtyhrf4uYqliu5ewXlywlG34FQC231sEMwslfWgx7k/ifmngUUjrSUAmq
uXweNMRNsDS7DLG0MJHHSm0pOUgcaj6hEVkatXHvidT6c0d9zUtIDOL+Bvf0EIcI
EJRrPkRmRlM7GUO8KqNaOEmvl3BTIw==
=SMi+
-----END PGP SIGNATURE-----

--xu5avqsjxngvurz6--
