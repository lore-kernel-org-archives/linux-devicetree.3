Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E74040F74C;
	Mon, 24 Aug 2026 11:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571500; cv=none; b=tghrJZh0KFZHi+hPXHIv8zQ7FSkFVQ+f7poHyjRL1fZ1YBHuEEu5G6hU6iOYXScCXcMoJipmpzs+SwJzEW0faWLarbiaJdpoZJWFtCC4veDJ7n+IdvUPxug4UQlUkmz5uztS2s9uAJe/+WPbrSVNx1bDZ5tMTmvDJOK/Hk4kuhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571500; c=relaxed/simple;
	bh=3q9NDZwgoVkR4WoBEzjGyMO82gzgr/gMKpVRDzygRls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSHxPUWB5DihqC7XtwHrQtfiwdIgyS6DaEp864cNg/b7lVjsXMlfyQq94+DATHlGcVHmk2/tOP4GdXAuwE3o6lJ1ZO6ymZCbQ31H4+MiMBlNkPLSrAx8cVP3Iy8dv7RIpIHym7Bu7qaqth3fP+A20BstFmjqSMMEeDmaVW2HwaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/mJGvjp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/mJGvjp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77EC01F000E9;
	Mon, 24 Aug 2026 11:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787571499;
	bh=3q9NDZwgoVkR4WoBEzjGyMO82gzgr/gMKpVRDzygRls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H/mJGvjpNvPVYSaTHsj7IiZ94ywWmC6RVluXhlhZtc6paO/aCH+Hz57xk3Gos+g5L
	 S+19Jn7XWUoMajethg3MCRBgYdS18edUS++a71CJ+DRNR03hpVtyClDxHWy5GfZbF2
	 hIBAA5rA5Kz0DJSbQ+xZks/knxO4YYRxr5mg8vne2o0EMBIimRK+X5E1c2dJhN0Ax2
	 XC5VS/fT/xyOSToCXoQqd++SplYYYvkAtNVTBcSoMy3i6NkMXUVhGIz0NAGWlpsYMT
	 oEiSkJhMgbx4j2vWiWgENn+U94PrUPOqFUsB6LS9VDlf3Tefw1jDHP5qr5wrPPoEIv
	 eNnoDdg+doXag==
Date: Mon, 24 Aug 2026 12:38:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: regulator: fan53555: add tcs,tcs4526
Message-ID: <2f89a45b-b745-4d7b-aeb8-10beb5b2b954@sirena.org.uk>
References: <aousEdwMni9ScZBn@0d3a7a881997>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DADyGIEvjdBMPZtM"
Content-Disposition: inline
In-Reply-To: <aousEdwMni9ScZBn@0d3a7a881997>
X-Cookie: Accuracy, n.:


--DADyGIEvjdBMPZtM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2026 at 02:27:29AM +0000, Rudi Heitbaum wrote:
> The driver has accepted tcs,tcs4526 since commit 5eee5eced95f
> ("regulator: fan53555: add tcs4526"), which added the compatible to both
> the of_device_id and i2c_device_id tables for the TCS4526, a chip that
> reports id 0 rather than the TCS4525's id 12.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--DADyGIEvjdBMPZtM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMLSUACgkQJNaLcl1U
h9DDOAf/YMxeG8RAKF+TO053WrtnRiiUqPL87cD7PK85QM6WVXPIc/l2RJ5aWYiB
KHq0AiCebADDQHWCFKsK7JPvbY3Alob8DuUhNtqb0zTngWJnKR2t1kuee3IMKb3m
vjE1DhwpHCrv5GdEz7eg5IOjN6UwlYEVqB56z00idKHHhtugez83+HkMU0jjlIpI
jGRrZ9OjDZVO2DD9kZnMqTdUWwRRPiKMeyYcDI5FX/JzkwOvcijHlYB+Bw7ulxqm
b4OzONu0gk3jRyffdexu3iJe8AFVhUinl4Xc94P3E48eb7KsUxMfFJ/OT/dICCJb
uBFOHl4kVtk7nRMftRa6wFpTnTKJDw==
=TJTP
-----END PGP SIGNATURE-----

--DADyGIEvjdBMPZtM--
