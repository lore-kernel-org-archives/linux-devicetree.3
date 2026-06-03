Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636E739901C
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780503530; cv=none; b=opbjouHuCy/c9yCF/JO0EYl54+LLRPpcbDiqyHhm1PupQKkc5XSM7UQMBuw8BLyfyi+FnabYnRztQPkVgS+MMUfZdHonUa2Eigi7gvPHb7G8zYTS5RQRSoyasdaRNMKhWFK4R3/efDcao2FUBXTJ15HfF7duRj50+Xlg2pQ0f9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780503530; c=relaxed/simple;
	bh=qXbmyNiDAuWOZ/oRic9GVvJXWnD4XIWhUjTuhj1GetQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaWSUE081GMx4ghkO9aMzVCv5w+V/G+p35GI6fsta+dCaQNoUl/kAG2vYMPsaaBMA+7+Fdx4pQr8PUaj1cdaWob3PwRx59uwXc2DnozJxDc27Qqz2moCYBU3vFrlf8glqfSz5/tWhaMjnP1AWnsBC+HPltFYsX+vfx0d/EtEs3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AaSOfaIe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AaSOfaIe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A501F00893;
	Wed,  3 Jun 2026 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503529;
	bh=33ZbVOrnOiAZAVJnipEHOynCDZG919cacA48GN1/+z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AaSOfaIeolF+JsMu/y5o8hj+h14Exhk1ombtCpZL4z8czsjA/bic7SmV2EFTBnL4O
	 hVJWDLS/cFu0Od9SdZ1w3G6TdcC4Zjq4G5e2PKAkYE83iQMkRN5XRu5XyZKd9HOJPV
	 XR/8dRGUrGaAUR9PDyql7XotM20AJgje3eu4jZd5c+yQIZLe3Xz2LcR4c5ewztYahm
	 0Woezv1L1nBHtqOa9G9V7fDgAC4kz5YusCbMrlR6yvI8YP35zLyz7gYgIZXSBEQjUx
	 SnJ/tUTG08EGacKV2IJCj1QkN3juy+Ku/XIZOpUG7UAf3Jw7NcT7/21WjksaWMckLH
	 vd3rdCTILsKcQ==
Date: Wed, 3 Jun 2026 17:18:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis
 compatible
Message-ID: <20260603-dwindle-absence-33c1b4386799@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-3-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eNmyYxHv+ceGvXNS"
Content-Disposition: inline
In-Reply-To: <20260603074222.593243-3-joel@jms.id.au>


--eNmyYxHv+ceGvXNS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:12:14PM +0930, Joel Stanley wrote:
> Add compatible for IMSICS in Tenstorrent Atlantis SoC.
>=20
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

And here.
pw-bot: changes-requested

> ---
>  .../devicetree/bindings/interrupt-controller/riscv,imsics.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv=
,imsics.yaml
> index feec122bddde..442b8870f9c5 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics=
=2Eyaml
> @@ -49,6 +49,7 @@ properties:
>        - enum:
>            - qemu,imsics
>            - spacemit,k3-imsics
> +          - tenstorrent,atlantis-imsics
>        - const: riscv,imsics
> =20
>    reg:
> --=20
> 2.47.3
>=20

--eNmyYxHv+ceGvXNS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBT5AAKCRB4tDGHoIJi
0mOwAQCUIqcOKEr7b6o5N4NpNmDG4x26QKL+gmatvWqDqkkHDQEAwOCOPR6yasBu
MKEmaHwbdFP3sfQqcnbj+ck6nNi/0As=
=NZjA
-----END PGP SIGNATURE-----

--eNmyYxHv+ceGvXNS--
