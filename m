Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EF6330337
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 19:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781810903; cv=none; b=cKTMeLji3Srri9Gw/fAEHtFzeUaLkKilIcPxsvcy4mNTkSik1FAuUWvnlEHZmMOunhQUfpvmno699FOmd/XBi0RAC58A6gu/q5d94+lcT4SfnA3RaEgzXkBJUf85APDCwpxHURFjXzIoPzkwkVu8wmzRfNmE1QyICivNRs1wWA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781810903; c=relaxed/simple;
	bh=A153VHEeuRIzzseIS0sssGTKG4lkc/OZ1lFglcZ7OeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VyPwBKS8lsqa6NTcgt4Dbi6OcgL6zMQFEPL1LIXWx3HCVas6ZiyavBEFUxcBlR8iIQXsZsgjnLbDFhE64soyhqwo1ZrPwVdTfcq8cn0p/tvvJc3fTfuoRdn5DOX9fZDoEgWBpwqfqH3OHspKN49OHVgZ2Dh76Z1NiFGWUytB/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACSpJz1T; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACSpJz1T"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso24278495e9.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781810901; x=1782415701; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7F4n8mgpmXvR1ZomD7s5qVMQgPf2THfCdABQ8kzmgU=;
        b=ACSpJz1TowvtUTlneYCY6z4s+BILPdMJRGznqH8qQSVrUZwO7ueog16BfKFjr9nPAQ
         wUCjisZSN2PdZmMl2gtuvqsiWw9ABycuiICmWIXfqGCsFpxgOHrKaobjMueDqyFANIHZ
         heGDxYEk3+753FgsIAOnwoeEQkQ7kKaCmvHun6I/ZYukGzqk26rEZiAAxlB12j9tOWlJ
         taQIV6NtI6vQQMSPUyLgCgZ4cH9FU21uzCZfxva7H566E70uulf1VvpP3ow3eWCLeOfc
         GcGLa1Ll5Z+SsntEsMcfMVk9J+TX9h9aRsMP5FxOmJJqANBQkwG3WlJmTeQCaUoLxESC
         1m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781810901; x=1782415701;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7F4n8mgpmXvR1ZomD7s5qVMQgPf2THfCdABQ8kzmgU=;
        b=jvYbWGLnKd0ACWhy92PJVeYq1edmtCzYtvFh4nFoIW7BtWPE59v05uQD/QMb7AvQR3
         jGTnXBImXB5CG1FeMmkBj+cxcdKKR1D3HOnOcg9EnZaEXzCHWysI9ZHeNJNREGubcuCu
         qTyM8jU9GQnWVO9Xb5G+z1HiaO6V061zNk0rjUFn5lnDS+GxndcdQTzKYa7gLC4UWB/2
         i+tKJGXF+e9g88wYynu6H8vsEL1/p1TXhq0CW5BF666llk73k0me3Jxm9qaajboExEs3
         Rsb+BMadH8yZqJKKgLPGrQ+M+GM6iWNasX+whJQGWXlHvMI2Q1bhrvoSo74ZEJufVmhm
         kOoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bJvdVukIego+ne4vemLFijA4Q7m1lDEEl5Vnyr3p9q4VXp7LtoX2yobTMk4uwivyotHKfd8fUkpe7@vger.kernel.org
X-Gm-Message-State: AOJu0YyOq8htLm0JNvzqkmMGZIrsl9pZQt/rIofVCHCJSGGjgHv8cCxI
	7WupfdSsuk3qhHpBRVvF+gfWzsEyvNwNlP9Yj2fzfkNoYbpiHNoncRGB
X-Gm-Gg: AfdE7clcqwIRkAWVwyypqovI/Fa7KfSKpn8rfTQu+uQPt+1+UcuA3QeVYFfNaWk7ePE
	92ZXhZK94KN21iAC1lp+G44VdQCk9KeH44Rne/quTIRKt9tbOMyebPTDcOqYTHebJWPQPCS7qdn
	+1RHAoSnSwi5FyVcbw4bdLPusfJMBLmVVZDqrXax+8mPzveexuXBuF5j726ad8fxr4RoskeqwSV
	LLz2jmyeIiH8I1keJAmCbkF7JtWlZJzLOnzuTpvOp2pLeY0dwuypYgB/vGONAlp7L1rrAev/mE5
	RfMY+xS96hnEs7Q2JbW8XrkHAca8reecSJ6K7yduOZJsmiRHRgB3r0nb7BwHntQeFPTgq7mp/2S
	rDIF4Hk/h20M74QR6Q0vHVryAe7plML77urOR7Ktkj8DfV57o8GgwtjcYg+vqGczdV6pfc+mQei
	qub3zFObN/pAA5L+9jjUl0Ww==
X-Received: by 2002:a05:600c:4745:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-49240a051c5mr5075335e9.5.1781810900283;
        Thu, 18 Jun 2026 12:28:20 -0700 (PDT)
Received: from strix.localnet ([197.250.96.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd29883sm11319845e9.14.2026.06.18.12.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 12:28:18 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Date: Thu, 18 Jun 2026 22:28:01 +0300
Message-ID: <8K1EfEWITAurt--cymuLyw@gmail.com>
In-Reply-To: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
References:
 <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-10-ca994bd22e9d@gmail.com>
 <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7cqxV3SpSTKGVocmuEIt-Q";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart7cqxV3SpSTKGVocmuEIt-Q
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Date: Thu, 18 Jun 2026 22:28:01 +0300
Message-ID: <8K1EfEWITAurt--cymuLyw@gmail.com>
In-Reply-To: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
MIME-Version: 1.0

Am Donnerstag, 18. Juni 2026, 12:24:26 Ostafrikanische Zeit schrieb Philipp=
=20
Zabel:
> On Di, 2026-06-16 at 23:26 +0300, Stefan D=C3=B6singer wrote:
> > This drives the auxiliary devices created by the clock driver.
>=20
> Which auxiliary devices? Which clock driver?

The ones from patches 7-10. But I guess you're telling me to spell this out=
=20
for readers who see my patch in the kernel commit log rather than the=20
submission series.

> > +	[ZX297520V3_UART0_RESET]     =3D { .reg =3D 0x78,  .mask =3D BIT(6)  =
|=20
BIT(7)=20
> > },
> Is this a single reset line controlled by two bits (do you know what
> they are)? Or might these actually be two different reset controls that
> are just always set together?

Most devices on this SoC have two reset lines. In most cases asserting one =
is=20
enough to reset the device, and consequently both need to be deasserted to=
=20
bring the device out of reset. In some cases both need to be asserted to re=
set=20
the device and it keeps operating fine with only one asserted. I believe I=
=20
documented some of that in comments, but maybe I forgot to move it from the=
=20
clock part of the driver.

Exceptions apply - some devices have only one reset bit and for some I have=
n't=20
found any. USB as you noticed has 3.

I don't really know the difference between the two lines. I don't have a=20
datasheet and ZTE's downstream kernel only operates on the USB resets. The =
old=20
upstream zx2967xx code had no reset driver at all. So I found the resets by=
=20
setting the registers and then single bits to 0 and seeing what disappears=
=20
from mmio space. Everything on this board except USB comes with resets=20
deasserted on boot.

I'm pretty sure that what I identified as resets are actually resets and no=
t=20
extra clocks because previous device configuration gets lost after assertin=
g a=20
reset, whereas it is retained when disabling pclk.

I absolutely expect to run into surprises and epiphanies in the future and=
=20
problems on as of yet untested types of zx297520v3 devices.

> > +	[ZX297520V3_USB_RESET]      =3D  { .reg =3D 0x80,   .mask =3D BIT(3) =
|=20
BIT(4)
> > | BIT(5), +		.wait_mask =3D BIT(1)},
>=20
> Same as above, are these actually three separate reset lines?

It is likely a combination of the same 2 indistinguishable lines (4, 5) and=
 a=20
separate USB PHY line (3) - this is what ZTE's code suggests, but it is a m=
ess=20
of #ifdefs and redirection, so I don't know if I isolated the correct=20
codepath. (No, a kernel built from that ugly code doesn't boot, so I can't =
add=20
printks).

The PHY reset line does not do anything observable on my device if I recall=
=20
correctly. It might be nonexistent, it might be a leftover from older=20
revisions or some devices might have different PHYs, similarly to how Ether=
net=20
PHYs differ.

I'll double check those USB resets before I resend. It's been months since =
I=20
looked at this particular part of the board, and maybe I missed something. =
On=20
the booted ZTE kernel and in the bootloader, when booted via USB, all 3 are=
=20
deasserted. When booted via the NAND boot chain they are asserted when the=
=20
kernel takes over.



--nextPart7cqxV3SpSTKGVocmuEIt-Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmo0RsEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiEm8P/AvHfClRvmy9YL9udTPC
Z4QCPIQLCeqVhdF7G8jxr++QtOAWGVMwzMmhkV/HjMOZKzngI/79K7GOXh+ZWacu
8urWF49rVNSwd66BJAspTEzrhAFzDKyuqRni9MxHUKUZQhwHR74mB3jbvJN7Ro1T
ivQumkIS2UvKvSXrrn5jN3oy/Nyrvp7D+18fd6olrwCBAqxufx2XnUStim/unV+j
EetwGC0+OFgDrN3baOlhVHbZpa3sf1R+K7VfUp83K1SaAIil0DbmXho49O6AnV58
4x8xOXR+e7cJn9Wwal90xb6uhNumK/Pcg1JfxazDu1r3LoO/zNeBuQPhVipny1/L
5rScYzShnt6RwEhn97EY1+JIUcFl+sSfcsLrM0g9N8IRY6ZF86xwK1uhzZtHVhqa
iduxPvaxGWzK/I4VO9gLVQ+SzI31jX13AquwVe1wMzR4aWJlBVDqV8eyzDT3xQpT
pM88XTEW8HucCi8UNTM1UuFwiaEmKBjyp7zRCci16eRY9RkzlADhCT2oQ5SXGaf2
uy6ke7LyzUvSN4HUzUhN5RY/Kt8qaDi9V/K9yKYc8w/k21N/hdfryJEsouPfmGJq
EzjOugd9lByljMjhYc2sj6xazXsNLKNNounCgqw2hUyzg5OAdQZRB+fV/c19/QCP
AIr5phGYT29fwL4Rd0gyO5GJ
=KeDM
-----END PGP SIGNATURE-----

--nextPart7cqxV3SpSTKGVocmuEIt-Q--



