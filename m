Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E905A2BF3D7
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774940630; cv=none; b=OhLu6Rg3LbjOXVBLeK1zBV3DXTdMiNnCUa6/4s3R5yDmUInni+vhAEvVxA3Xs1freeYH2/CJrSx8c6fIdgNHerHVnBEgaVsd73HFjGpk2qeWQcjWytDnb5JKyuDDCVr8aOMCGWDk5I7fhz4jbmO0wj8Uy8ITp0ZSk+GkmCzrP+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774940630; c=relaxed/simple;
	bh=jGxbfeQZaCNRWO0CupX9OPM0rLpBdoeHpdVT2+551Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPC16ZFw54egJG5rznLPXzyZdOkgpRlTv6HEvdSIm6TjMTFdEKMfTT5QNIcVMRgodAJ2szxCMiQTelIKh2+XLZxeIkZz6kSdrp50PNabZ+VKhfQZr9J25EB2xRj7nj8y2NK+s3YX7g9x3cylqejhUF5iezQQUy6vHMTMrjyrl00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2+wU6cum; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2+wU6cum"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483487335c2so56183755e9.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774940626; x=1775545426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2rrakuJVzyP5a9RFW+UWE6NH7PekmyTOLmdb7Ewoj4E=;
        b=2+wU6cumNr+ZYkoQIWBYI+cz+yAhUPSlBX6boZTAldVUctZvbGeQihdmR7kQCTtu8X
         dh9Uimsh6St9oluX/rMAIeryOBLCqgn3RXek9TUlyHF4U6hcVWjx9MMXBjGPxbdEjFpD
         cF5x9/BBlJW8yfY8m5LATsucTzJefPoEI4mBKMsvMH57Watik7Vv3wyDdUqa1rIvv2l1
         wSJkXGp5ZBrDTIhlcmimN4ALXBwm5Xx2Tm1tDzENyVdoW72D9tIasC0dUPVM8CumEP1w
         RtSmG5XUY3HNaKJiqVJ79b1ZVWwCU974U6axA78oksBFo6ZT5chQbZogndYZxGRC2fJE
         Gmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940626; x=1775545426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rrakuJVzyP5a9RFW+UWE6NH7PekmyTOLmdb7Ewoj4E=;
        b=SD+/ykOIcyqVr7RC7rG+yFQBPvNnT3PkcUeTz1wyjCLHC2jYY2yoYOHY5TXHhOS4if
         ngx7PiBEZeJCyMVMiytgpDCAf0iYQnZunDn52aOwqt7YdqKhbkBRuOADJW4mhGIigp6M
         EBeHARCkcd/0imAQNojr6+R1kon4sISHtowPtmh4sIksUu4I6at8p7haEgGS9MIvETpR
         5Nubz3MBOwSK6cqimocFFLd0svDKcT1MA3XMfOciWjC4+wfi5QmRokvn/qtVjR1mLV6R
         p+gw2uTDOZBR/VDZljhrZn4Jh2uZ4Kcr/3SPxnxXyIHp680TziJqER2eOB02JxGibHzs
         Uzuw==
X-Forwarded-Encrypted: i=1; AJvYcCWHJzWli2XBAdLjUmPAvHF8itigkKipXZG3wMNskgp3Hji2krOLsrAGTgxXz1iyoVrrHxJn8Q51+0jG@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCJzH8/lRF7xlKjxHKvtFZyz0+zAbkcYt3CEAR3i8Yc/AinIp
	Ptd+PXZsCKfcSYrlyVJbVcQLsyLTklfHCrssLjzIRv3003zXBkUUix4M6QdMoOW/90I=
X-Gm-Gg: ATEYQzx63LKKKpWuy/rYp9iNhJ7HcxaHizpXfURtTskdbfvO/qc3fo/IVZDsNjAnaQc
	jsYZ5De7J/MXwjv0uHwQ8L9rUn/eXIo29XBDCParD6H1qPaLQKIxv6P4agQ9B6UumCLcVyIoJ8G
	iZZNdrLLjN6hc8q9/wBx+RhXVMEiEkA2QKqRFt0wuhuX3xzTt7Prib8fkVgcLP7PG/zz9bM8r3+
	EXUhEA9bacg6MZSbojuihqaw43ZFQHFhnbV1wf5C4Imp6y8mTQsNqJl8eNBkchuYanXnfqfb9mR
	ZySyhBgRQmMEIaoC6h5+EHvmHSGPafnZ7BR7izz7fX+Vpv6XxBJfkUlRuCdqdsa5cxUnocjzWBL
	wqIWAqcThHXez+XJncbAvvekCv0jWTEhwxRQjfBs4WtDdkqf674yyYbvVF+PShw8Cp707lyGbqo
	THtJv+xRKg5nRpNSFWpmIoKSTlZhcqfdaR5R7XdUmZobZyh5lBQtbzL9ur4UodWAXOJdMHoFTK6
	iW79rLOnPPLFrQ=
X-Received: by 2002:a05:600c:6814:b0:486:fbe1:2499 with SMTP id 5b1f17b1804b1-48727f7be29mr260514595e9.22.1774940625999;
        Tue, 31 Mar 2026 00:03:45 -0700 (PDT)
Received: from localhost (p200300f65f20eb048bf95aaa62516f6f.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:8bf9:5aaa:6251:6f6f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4887e93c014sm16826495e9.10.2026.03.31.00.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:03:44 -0700 (PDT)
Date: Tue, 31 Mar 2026 09:03:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Sean Anderson <sean.anderson@seco.com>, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: Re: New default binding for PWM devices? [Was: Re: [PATCH]
 dt-bindings: timer: xlnx,xps-timer: Make PWM in example usable]
Message-ID: <actvzQTb-a7O7sbP@monoceros>
References: <20250527171504.346696-2-u.kleine-koenig@baylibre.com>
 <a14be34c-de2a-4bea-9282-1fac7780b9a4@kernel.org>
 <crk42dsypmbyqk7avldghjq32vslmalfmmouwxzgtdci4agfhz@rkbmxj5z22fx>
 <20250606141324.GA1383279-robh@kernel.org>
 <erst43cabswj3cwnszssolgyoh4dsgrlnjjxhb7luk3qkqhyay@6zyoixljvwwg>
 <CAMuHMdXDZD6QAbKgny1utfYhagUEZ5pcgiDCTTfJKNVVZLOUYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wyl7ytgv5wvrmgoq"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXDZD6QAbKgny1utfYhagUEZ5pcgiDCTTfJKNVVZLOUYg@mail.gmail.com>


--wyl7ytgv5wvrmgoq
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: New default binding for PWM devices? [Was: Re: [PATCH]
 dt-bindings: timer: xlnx,xps-timer: Make PWM in example usable]
MIME-Version: 1.0

Hello Geert,

On Mon, Mar 30, 2026 at 02:12:47PM +0200, Geert Uytterhoeven wrote:
> On Sat, 7 Jun 2025 at 09:23, Uwe Kleine-K=F6nig
> <u.kleine-koenig@baylibre.com> wrote:
> > On Fri, Jun 06, 2025 at 09:13:24AM -0500, Rob Herring wrote:
> > >    reg:
> > > >      maxItems: 1
> > > >
> > > > -  '#pwm-cells': true
> > > > +  '#pwm-cells':
> > > > +    const: 3
> > > >
> > > >    xlnx,count-width:
> > > >      $ref: /schemas/types.yaml#/definitions/uint32
> > > > @@ -82,7 +83,7 @@ examples:
> > > >      };
> > > >
> > > >      timer@800f0000 {
> > > > -        #pwm-cells =3D <0>;
> > > > +        #pwm-cells =3D <3>;
> > > >          clock-names =3D "s_axi_aclk";
> > > >          clocks =3D <&zynqmp_clk 71>;
> > > >          compatible =3D "xlnx,xps-timer-1.00.a";
> > > >
> > > > There is however one concern that I want to get resolved first to
> > > > prevent churn:
> > > >
> > > > In principle I think it's bad that a phandle to a PWM must contain a
> > > > period and flags specifying the polarity. For some use cases the pe=
riod
> > > > might not matter or is implicitly given or more than one period len=
gth
> > > > is relevant.
> > >
> > > Why can't the period be 0 and no flags set if they aren't needed?
> >
> > I don't say they cannot, and probably that's the most sane option if
> > there is no fixed default period and flags and we're sticking to 3
> > cells.
>=20
> So zero should have been used for drivers/pwm/pwm-argon-fan-hat.c?

Do you mean #pwm-cells =3D <0>? Or period =3D flags =3D 0?

If the phandle wouldn't contain period and flags and so it would only be
used to identify the PWM to use and say nothing about how it is used,
then using #pwm-cells =3D <0> for PWM chips that only have a single PWM
would work fine.

Best regards
Uwe

--wyl7ytgv5wvrmgoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnLccUACgkQj4D7WH0S
/k5NrAf/fw5ux7T53E9Vam6KUGE1olp2rUotaB1fGpB//Vp+V05CVJJV5GDV4VhH
y2GFYYQbq1ITeXnvxHBYEbm4QRZ78Pcw10MsfyX9DmRyyFcc2Px2PI0EnkHbExfY
gShB5qrky/K+ZWxwLWg4H8d5IrrTW5ol+ha7TenzMS1JjDxzjv/lMgGkyXdwLhhJ
ufQzICkv2TzQw0Go1IQM3qwf62IAk8VI7j9Y2QtSStTCAVObtx3dx/PJ01rk6YVK
3AJwhMuSUEP6F1BPxKPRM1zZwet5rTfTbYUOIm1yVU2WyN2xFq/x5ExQPtQvVsxK
AFcszk2tlKcAZx+GW8MHjL+1N1Oa0g==
=KGrq
-----END PGP SIGNATURE-----

--wyl7ytgv5wvrmgoq--
