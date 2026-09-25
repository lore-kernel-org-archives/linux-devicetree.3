Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE763B38AF
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355034; cv=none; b=sMaxlaWW1gLYMqrfdzjJ5Ti3adnCBGqSPsVhe/1Gyu/Fla7sR10MmlGXxZDTB53QBx8J0mvoEUy2j/mU5LercuG4+g+cK6FtFWsH2LFO2+MioBuJZtPmU00/5HgghoAnB7aT9xHpCmVQlx/PQD4SoEEKdrzapCB2syoJ4xJQEf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355034; c=relaxed/simple;
	bh=3hSPhY9fRP5wAkvwT7nZpif6uF6urSydxdtYszdoWwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0vpWOfmmG3eTCgKsQW12Abjvb5/mdRh+Fx0a/mv5/hVHe1lBjeKOLykovXOl7A/6tng76Yo7toipRaRwHaJvrXrPN9GXPPjlsPgo3HAUXxu/9rA2sJO0JDgL8joeY6WtmOG0D/A07hOLE77IsNg1HrP063rGY0X6tAlUOkoJ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haU9ZjH+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haU9ZjH+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F271F000FF;
	Fri, 25 Sep 2026 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790355012;
	bh=3hSPhY9fRP5wAkvwT7nZpif6uF6urSydxdtYszdoWwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=haU9ZjH+gG3+lhEZKeklSiZDBp5v+46afCM/D3mYa0ciFqt+7RJxilyj+iZ7y9KQ8
	 xjv9EOd/5/HLiRWxe4a00ogF+t60IeJ3Awt8fA+UWn/LQTEZ/VcDb5rK9xtcluArqH
	 wCmxJqR4Is8sklxqjKMMBSLhXd1lrXYuxb6APjR6bNv/DkguAUGLvuQZxRzSO45ubb
	 Wv5N0tDCMsTWmC+GEWVdXCUOO2cOmnsbmVVevQUXO8VvhP154dmXm5O45eM7dVf+0p
	 kXh4geg0XTXUs216GsQ6JdR24LsdvuhZGlYRRInXsiSMnx2z1ubECb/V6QxqTJ0KIR
	 ZTWAHsRsaeGXg==
Date: Fri, 25 Sep 2026 17:50:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	qinjian@cqplus1.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux@armlinux.org.uk
Subject: Re: [PATCH v5 2/6] dt-bindings: arm: sunplus: add Tibbo LTPP3G2
 board compatible string
Message-ID: <20260925-overhear-guileless-d1d23ef374e6@spud>
References: <20260924164922.117236-1-ag@ffroot.co.za>
 <20260924164922.117236-3-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UztgH/KZeoyLTOhi"
Content-Disposition: inline
In-Reply-To: <20260924164922.117236-3-ag@ffroot.co.za>

--UztgH/KZeoyLTOhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--UztgH/KZeoyLTOhi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaramQAAKCRB4tDGHoIJi
0rRSAP9x38BQMzrbM9+ELZfonFtJsqSlkUsjT33bxwS8bBMJLwEA8+U3TdZHtyqx
TALSS6VNdeQl5j3JI5+n7At4xFLHeQE=
=lsv0
-----END PGP SIGNATURE-----

--UztgH/KZeoyLTOhi--
