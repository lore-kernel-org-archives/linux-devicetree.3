Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C349931E85A;
	Tue,  5 May 2026 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974476; cv=none; b=uxDPg+Za8A31R4E7yftUgvYSH7K0Nc3RRc9f8p32uDZd85imgKSzYTEPxGRCSn6nMQY6P7H2SLKhB++FeGAO7q5jEMLBXeNOcvzPBhAt/ZgscEGxjGOFejV8aDBHXwHvQ6u5VmaKovRj77Gr5cKDSWkVW1NDTS+ZrvU0EvSubxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974476; c=relaxed/simple;
	bh=rgsC7Th5Xw5EDH8D04pUW8olV6c3tFld3eIVw0s7rDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDv9S33z8zMkvvEwhHybD+xn3X6yXE26Y/8uHWPNyKWB7PXsfVxxQuPMqYVdBD7RFj4lxRGxswlfMgs+21WwJQ2H6BXNJz7pmQd3IR2YSQ+KQ6ksabPFYJg4VxcLlGzR8XhbuMJTvYs1i7Zdfs8Va7BP/3XAcH7dAwnqR2Z0Zwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gy/34Rul; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gy/34Rul"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DD7C2BCB4;
	Tue,  5 May 2026 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974476;
	bh=rgsC7Th5Xw5EDH8D04pUW8olV6c3tFld3eIVw0s7rDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gy/34RulvKDsuv0MnjSMnn84Ge7/lJvLURQAMdLckeXNxEzaW+Uu/NZ0MFB09oIMP
	 zlm12fLkF/m7QdQ/MRto18gRnVnDVhzyTfWyGI8/FJQuO5KQg/QatrAupbMuseuJLl
	 dvXRqbK7EM8Z3SNxbqYUHKENijNJIL56+KP7lwACqeOBL3GPqEQY0Zci8jLcchRRVP
	 UcWNtZVC2nb1uwZ8C0frs4DhrrJdrdniLfIwYFwOVoNido4p21j1fYaCFaui/9zsw+
	 U/Y4QT5HmOv7VFmALSXYuwnYrabomm4OC4dX6x2yi+tOxK9VjxfxZuMpjPDhkKW8nI
	 ArAc3DtB89Sdw==
Date: Tue, 5 May 2026 10:47:52 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com, Brian.Burke@microchip.com,
	cyril.jean@microchip.com
Subject: Re: [PATCH v1 0/5] riscv: dts: minor beaglev-fire improvements
Message-ID: <20260505-equinox-overeager-a0d7a3d84394@spud>
References: <20260319-outsell-hypnotic-94b480408ad4@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ah00lo09AlTLcpDr"
Content-Disposition: inline
In-Reply-To: <20260319-outsell-hypnotic-94b480408ad4@spud>


--Ah00lo09AlTLcpDr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 04:31:14PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Yo,
>=20
> Some minor improvements etc for the BeagleV Fire, spotted while updating
> our downstream stuff to the latest lts.
>=20
> Produces errors at the moment, as it depends on changing the
> interrupt-cells in the gpio binding.

This has been merged as part of 7.1-rc1, so I've applied this series.

--Ah00lo09AlTLcpDr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafm8xQAKCRB4tDGHoIJi
0nH4AQDy2OTEZDNa2wkD6s3rmRk9pjUYRxbDgbDYkLeWpMnKrQEAj0kwU8VpeDcE
UOyR3XRxp3oX0OfWILtiePr0jnH6CgE=
=sbCY
-----END PGP SIGNATURE-----

--Ah00lo09AlTLcpDr--
