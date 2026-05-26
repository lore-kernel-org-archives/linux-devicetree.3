Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683B81A9F96;
	Tue, 26 May 2026 18:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779819410; cv=none; b=p7qQpeF3EL0i3IU9+J1kpPi7H+5wpnsq7QwuCuZS+wJHicXVdNBVOsHesBkWIvJgfjS7v1++U6pI6+SJizLb1NkC3jVgEdW+cPhK7zNNFdGuyzftYiPkqU+M4ac8ZQtAxO8N72ugKNdUfBIZ/YYx9yGzwQssL0EvrYfBqHJH4d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779819410; c=relaxed/simple;
	bh=I2OsPB9xwMzP8bTRW/BdFImKiBqOv6GwJEepAQeykmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcKs3cADgXk+jrVDn23Yz6D3Un08QoxFVarrDLloAmn7m1ceiPr+kpNe8jNhb+w6LHn+5CuDie6ppu8XV+u4B2huHXMHSPGMO3z4Vy+IEGdYscTyI4GCfRc6muwgrn8p9mx9rMfhnTUF3uAX5Oaj74rQ3RJ3eYTkHVb3QXICfSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wnn93VgB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wnn93VgB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936FB1F000E9;
	Tue, 26 May 2026 18:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779819409;
	bh=I2OsPB9xwMzP8bTRW/BdFImKiBqOv6GwJEepAQeykmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wnn93VgBbaZIOuqN0Ht2pPIhqPHtL+ogpB6srusIHN4so9rLBcbnWSqk3Rs3V29iR
	 Z3TixGsksO+3v2gKZPlMsuf1tgQnYOyKqjPDMxkVycy9J89PLXBvzGcpU8689JuVF/
	 /xn+5s5IUPI43rzsB9pvUC7bFFQqT8GzHE0XJqh6ae1ocd/q2yJVBcvEziuqSNRS8v
	 kzx1qO7mVmkGRv7rpvKhXfxCbug2tlWvCxA3EJVtTrW1UNB1bJlp9jh0QGmnsY0mos
	 SMoU5TP3ElXTSgW9eoDFJKTrYvpcMqe5Rp3I7MWJs9qtjk0CSQaTDjGQbRUg72XpjJ
	 ltDdK+3qhclUw==
Date: Tue, 26 May 2026 19:16:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v10 6/9] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Message-ID: <6e939fd1-0d65-442c-aced-e18705774ab8@sirena.org.uk>
References: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
 <20260525064209.2263045-7-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6VIrc6YsHm1pWuLW"
Content-Disposition: inline
In-Reply-To: <20260525064209.2263045-7-lakshay.piplani@nxp.com>
X-Cookie: You are fairminded, just and loving.


--6VIrc6YsHm1pWuLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 12:12:06PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>=20
> The NXP P3H2x4x family integrates on-die regulators alongside I3C hub
> functionality. This driver registers the regulators using the MFD
> framework and exposes them via the regulator subsystem.

Reviewed-by: Mark Brown <broonie@kernel.org>

--6VIrc6YsHm1pWuLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoV44sACgkQJNaLcl1U
h9CI2Qf/S9IFzRbBRN5qoF1uXEkFdqLcfGDe/TkziPuQM0Wf1fbzs2zAm6kGR1Y4
7qInMlsC+H0FiO2jmITJJffSSiUnWZuUXjCUSIZ46UnyuPhtnJnr5ZIZInk5CE0O
PXPm8oxZlNmG0nI87vwkUytDv60xcbC9gDB8I+PEk8SYVmdEfcH0Fob+hnm9/yUm
u6ukx1igjf/EK0x9kzDnFi14QXfj7MR72hzcYANJYLXz5vsgsroRtJ/+KUhYctax
tS0tz+UABbrp8ns6uX7w8BM0/Cc23QMnArK0eWFSPc/U7bxV7G3c9qAnUfNroZRI
Y3+9eoDd1nZGs0NuVty19ywWlMOVqQ==
=rXED
-----END PGP SIGNATURE-----

--6VIrc6YsHm1pWuLW--
