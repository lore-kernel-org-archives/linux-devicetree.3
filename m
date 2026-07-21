Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155EF22E3F0
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623476; cv=none; b=jVhdVEX1lf2gbraq2U7LpCasfXoNzrllu/bHrbO7328zEuGw8bjYnUjKty1cMrsTLlCVgXN/i1JIN2g6kPU173c3o01LKqLxtmLpNkJ+N/W4yM1JGaZ77YCaJecWeD5fCDZVknjZadku9En8pwKRk9xZLdh0H4T+CktW6dU70sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623476; c=relaxed/simple;
	bh=fdsoK24vo88pOd6KCP2A0L+3oICs+Yajlx3oTBhK4c4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=BVEzFdEa+4K2YsMFnAaS5xnOxkt4I/Kb1xSFygE1Ybidph/vwqddmbIT3YFBIG9gzd093gxewyt5wc5zg+CICqVW3vhhzJM3xvVlnGJMqbEzSdUqp5ylexiDJrt8U6/MyE3CVvGEiq7VtoCMbinfcWeJIRtoGZ5j9dqF7xo5FGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5vUMsWE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5vUMsWE"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6EF4C1F000E9;
	Tue, 21 Jul 2026 08:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623475;
	bh=jJgmLQ0PBklWvKN4vrJrqNpLIPHESCWsAxcppX/aKF8=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=b5vUMsWE8LXO1BbsE/RXxg95MQrRpbp+hrUx+0yey9iYVJs+Hcuq0o/pnNWGVvQCn
	 tJtoGhFuelhDf3LdsTMtibnJiyMtxP2UZqi7/6NEttaaLzDsHESBdWQqegSRWHplIv
	 PTY/AJr25Bce1kM4WZKfhSR35Hw810JSsf5BXyyxZDrrPs8wi94I4HpfSjeT7ogwTq
	 cJP7ONP/Y1o4kg18p1qZbSkIE4GfnHb5J35mX9S33KjlyPJlC9sIVtKIPg13Etmvhd
	 CF34hG5xlo7YUhAGI339NB97tMyVAtYiznCcXUgi2ekI4FkCWNjyreQrkrigy15lH9
	 O9RV4ImFoVV5A==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4d358136a3b66542fc9f6e397693250b807903e2552f8ebad5754366153e;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 21 Jul 2026 10:44:30 +0200
Message-Id: <DK44809N7Y8I.J2Z3U4N32H0Q@kernel.org>
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
 <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <olteanv@gmail.com>,
 <linux-phy@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v3 phy-next 2/8] soc: fsl: guts: add a global structure
 to hold state
X-Mailer: aerc 0.20.0
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-3-vladimir.oltean@nxp.com>
 <20260720135049.8AC231F00A3D@smtp.kernel.org>
 <20260720140139.dmgysphpse2jf3fi@skbuf>
 <20260720145724.acega7erguyufxd3@skbuf>
In-Reply-To: <20260720145724.acega7erguyufxd3@skbuf>

--4d358136a3b66542fc9f6e397693250b807903e2552f8ebad5754366153e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Vladimir,

On Mon Jul 20, 2026 at 4:57 PM CEST, Vladimir Oltean wrote:
> On Mon, Jul 20, 2026 at 05:01:39PM +0300, Vladimir Oltean wrote:
>> On Mon, Jul 20, 2026 at 01:50:49PM +0000, sashiko-bot@kernel.org wrote:
>> > [Severity: High]
>> > Will jumping to err_nomem cause a NULL pointer dereference?
>> >=20
>> > If the allocation of soc_dev_attr fails, the code now jumps to the err=
or
>> > handling path which dereferences soc_dev_attr to free its members:
>> >=20
>> > > @@ -269,6 +271,8 @@ static int __init fsl_guts_init(void)
>> > >  	kfree(soc_dev_attr->revision);
>> > >  	kfree(soc_dev_attr->serial_number);
>> >=20
>> > Since soc_dev_attr is NULL when this allocation fails, won't evaluatin=
g
>> > soc_dev_attr->revision and other members result in a kernel panic?
>>=20
>> yeah.
>>=20
>> I tried to be nice and play with the existing "err_nomem" and "err"
>> error handling labels, but the truth is that a single error cleanup path
>> is just an antipattern that doesn't scale as code becomes more complex.
>>=20
>> Instead of having a single error handling procedure which needs to
>> carefully fend off from various invalid contexts from all the goto
>> sites, the standard convention is to have an incremental set of labels
>> which undo just the setup that was done up to the goto jump site.
>>=20
>> I'll refactor fsl_guts_init() to use that convention for v4.
>
> While I was doing this refactoring, I noticed that this code path:
>
> 	if (soc_data)
> 		soc_uid =3D fsl_guts_get_soc_uid(soc_data->sfp_compat,
> 					       soc_data->uid_offset);
> 	if (soc_uid) {
> 		soc_dev_attr->serial_number =3D kasprintf(GFP_KERNEL, "%016llX",
> 							soc_uid);
> 		// no kasprintf() NULL return code check here, unlike
> 		// the rest of the code

It's a long time ago, but it seems to be designed be optional. In
that case a NULL pointer check was omitted, because nothing bad can
happen anyway. Either you'll free the string if !=3D NULL or you don't
free anything.

> 	}
>
> 	soc_dev =3D soc_device_register(soc_dev_attr);
> 	if (IS_ERR(soc_dev)) {
> 		ret =3D PTR_ERR(soc_dev);
> 		goto err;
> 	}
>
> proceeds with soc_device_register() even if fsl_guts_get_soc_uid() was
> able to get a soc unique id from the security fuse processor, but we
> fail to print that string to the soc_dev_attr->serial_number variable.
>
> I don't see anywhere mentioned in commit 786dde1e59d7 ("soc: fsl: guts:
> add serial_number support") that this would be intentional, so it can
> just as well be an omission.
>
> Is it OK if I replace the silent failure with a loud failure of the
> entire fsl_guts_init()? The code executes only if soc_uid is non-zero
> anyway.
>
> kasprintf() fails only for memory related reasons.

I don't have a strong opinion. If you ever get that error, something
is seriously bad anyway.

-michael

--4d358136a3b66542fc9f6e397693250b807903e2552f8ebad5754366153e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCal8xbhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ieSgF+ICekJYVWEq9rBDY5VZlPzbSBak27dBhZ
NkdIeCS2Vd7RS4jfJ2na8hplH3Fu7kTuAX4hd5ZuNnKDx0T1mYH5EUpZu0N0lVyS
xrLYo7Lk/69G931Si9SJgvHYemQA8/J8+q4=
=xtHI
-----END PGP SIGNATURE-----

--4d358136a3b66542fc9f6e397693250b807903e2552f8ebad5754366153e--
