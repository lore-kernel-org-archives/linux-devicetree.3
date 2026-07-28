Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75BA2BEC23
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785275060; cv=none; b=HySlK4G+iQYxsJMyM8ot4rQuL2xbWTikQu8PW0PQ1f7vqCpWIk7i/nRDutOm1uPD1fn+OJctF5Kqzf12NKn2AmsbZXEEyk1QjFcCPqqi3530VBq1ZcER9Ag7LO4XVhDZUMwWJnm98JDM/hLrKVN50MldMOUFFIMUnAYcfrntSAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785275060; c=relaxed/simple;
	bh=lN7eIROdO9J9rir2WwIki6oWiTqSSe7dc1oa+4fFRUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sj7+LTSkpCx+husYmco+BOon65EctIyIPmnyvM1IljY0LjbIgtwy8g9lNmqXrLJG1jAKzEC8d1eEH5/UXp/w9WrIxSLW9CrIDqQrzVmjhHdnf5azonU/mV+9Xk+tvchEaJteB0s2TYcl2L0LQuhIrLV7fZhzaVlJhEI1IvewcG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UrHqA454; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UrHqA454"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4957eefd361so2255225e9.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785275056; x=1785879856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lN7eIROdO9J9rir2WwIki6oWiTqSSe7dc1oa+4fFRUc=;
        b=UrHqA454bnR+Nz9RKnEagDj0Dv0N2G/mxIR1ObAQgD9zpQd/s0kBCNMUR2Sg/UvBZa
         IqigIq53K3TCys+v0BSRMwckSGTugIdeANImxE15cs7YFqVCEN2L9TqJWdEW1hhhWK0x
         ZAYv1kZYyEHxqUc7o2EPq0EMPLj/l7KpnTKCHb/NSiGaiu7LQ8n3i1/3/q1q9ofJZWNR
         UZCIi6djv4YTg5aYtdzbVSwF8dRyLgJbVTM8OEyzLMK6mquAAi2X/xpikIZkSGQLJTf3
         1tS0u9MT0aQImHLxjBm0pboqjqmsOMnWQdGpWbn1B/EZPFlW00/nxgiRzuPCGaA698YU
         IC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785275056; x=1785879856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lN7eIROdO9J9rir2WwIki6oWiTqSSe7dc1oa+4fFRUc=;
        b=HgaNB/fbXa3shjED7sYRXCDXc6v2dWyxj34Ta/Gyi0fQdtsIR7pMhYdORTVhfmZ1Zh
         1JEMX6yYVpnjss3sNtEh6xk9CPrF+Pp/b3SU4TCnScSUi2Sy4ntTl3EIqY2lv8iQmE87
         0/r+QfIC6T3g+yzdHGJ7f8N0NHjaHgjysvU5DtigyIswIkXwJV9GlwMd1Kw63+lgpNLz
         zmkJvb2Wjxe7EaaJ7jMmbVpEK1h5zhdEZCvJm0wMajZtqe7wETvUAWu6sHrwL10QKuiF
         d0wJj84HEXOPt2P46WBpR6rXIelMzuSQsxeju+kJVKO47kczNa9oAjZBWyTHHTd246Yy
         0eXw==
X-Forwarded-Encrypted: i=1; AHgh+RrqbmXRBvQCkQsFZ+w7sL/2a3K1SaH1su4tUU246a/SuI987B2XednGPV00HRABGi+yfUGB660en5MR@vger.kernel.org
X-Gm-Message-State: AOJu0YydZlJcReonNxq24HICqsz/XPBlVIRTHrM6hvzI8f12uVI10h2d
	IeS2mJloaThoizMWhDp4YTINJa8hHkK9XSSoqHD/GRpNGSXWHWIbNzhGf79VsPBh6NhDKhIrFhR
	gPqmn
X-Gm-Gg: AR+sD102rIqHRDidHkYBAVt2B9vKZCsCl1mro4DiM3rZxn6xvQYS9RImONmz2qakz95
	rJQ+2QLqRU/fGUoM+9Xyt1l//eEbSdaMKibQr46XtM0gu8fTB9/axp/gFP3s09jh5Jh8ItMvVkB
	190KjMPHnjoOL+XcfuXILYgqWiOfRKsEjS9zTa2ciuLs6zeMnaGvGgUOJz74gvv7iy0ATAEVP2M
	BAyjZzQYKT6fC8J1vOBxXExXCqtrXclcoCoLgbHIrUpaX3xaKdHY/B0Z58AVtc8OLG0mMp0aX4D
	91eBzZ18uAsYnsfSasDT4d8NEUkW5rbN9kIPfU7cKYGZAJlRdd8/LrZIEz+64NI8OQMWTYqULeY
	XBFbNK8RN2X/3BNnU7YVag1tyxnw1NCVoWUhRmPkoyhoamv7yREHsGWX1LdzNaToKL26W9VN/b2
	JfQZGebuI72wFHBUGL2d1JU/8RFBusW2SKGCq+K4tZmgp7WHxT6dn79eB0TIBfEMKY/A==
X-Received: by 2002:a05:600c:4f91:b0:495:7eab:3abd with SMTP id 5b1f17b1804b1-496c65a26bemr41645105e9.33.1785275056065;
        Tue, 28 Jul 2026 14:44:16 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49764d70014sm12407405e9.3.2026.07.28.14.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:44:15 -0700 (PDT)
Date: Tue, 28 Jul 2026 23:44:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, 
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
Message-ID: <amUz_ilAvq_fBHld@monoceros>
References: <20260721095935.439174-1-clamor95@gmail.com>
 <20260721095935.439174-3-clamor95@gmail.com>
 <amGz2YZogakb5XAv@monoceros>
 <CAPVz0n3WKw74zg0HmBBOo8Z7JV_pku-DjsgKF_74B8EdD5cXgA@mail.gmail.com>
 <1d7b6ff4-4ea6-41c4-b59c-25e14fdd8b53@roeck-us.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rtua2nzjsltgdmou"
Content-Disposition: inline
In-Reply-To: <1d7b6ff4-4ea6-41c4-b59c-25e14fdd8b53@roeck-us.net>


--rtua2nzjsltgdmou
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
MIME-Version: 1.0

On Sat, Jul 25, 2026 at 07:23:13AM -0700, Guenter Roeck wrote:
> On 7/25/26 06:24, Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 23 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 09:28 =
Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >=20
> > > Hello,
> > >=20
> > > On Tue, Jul 21, 2026 at 12:59:34PM +0300, Svyatoslav Ryhel wrote:
> > > > From: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > > >=20
> > > > Add OF match compatible table to be able to use this driver with De=
vice
> > > > Trees.
> > > >=20
> > > > Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > >=20
> > > Please put your S-o-b line last.
> > >=20
> >=20
> > If S-o-b's should be chronological, then this order is correct.
> > Guenter added his reviewed-by after I have added my signed-off-by.

It's a nitpick, but as you added Guenter's tag, you modified the commit
log and then your S-o-b has to be renewed.=20

> That refers to S-o-B, not to Reviewed-by: trailers.
>=20
> Do we really have to argue about something like this ? Do I have
> to mandate the order of non-SoB trailers for this subsystem ?

I wouldn't have replied just for the order, but I think it's convenient
and usual to have the own S-o-b last.

Depends on you how strict you want to be here, as usual. I for my part
ask for reordering or announce to fix the ordering if nothing else is in
the way for application.

Best regards
Uwe

--rtua2nzjsltgdmou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmppIo8ACgkQj4D7WH0S
/k7NBAf9H9PboIOanFsnYEPcO8yizZKYWNgORBgU8FXewHvKIsjh879MUTrnJv0F
N7l6AeHZyLZk9ecLIJ7McB4Mo4szHCUGOvP1yD5YclFrJ2AZfe9TdlWo1K+YaSO3
jAsedGc48zcRFaI14Put1VIenkzRZt5CcqsDWyylSJO6Kja1BnN3ptq7dx8hOGRT
C5TSxoMKQkDj3jfKJ+gUiuzcIhun62T7lvp0smZoRPoR3xiLx+xrCsYDrxIecBRw
+WdnWqxR8EVLLubKspROGG5QC6+6HVHBUWYaecqIDF4l28t7goCD49Y4H6RzI/CE
Vk+TSm7D19nrLfN1JpNNfTPnhmuI9w==
=zmaf
-----END PGP SIGNATURE-----

--rtua2nzjsltgdmou--
