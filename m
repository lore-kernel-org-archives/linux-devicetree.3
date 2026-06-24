Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8C9332634;
	Wed, 24 Jun 2026 16:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319367; cv=none; b=cu18M0gYjpikQAQyTSh7xSM08+0G9saQjZTg36s5B0yQNfwsIX7DgQfj2+TbKIR4P3BcEVIR0J9CGvAPzRbjo1qgpOaRvRrHzpji/pLBKqa3gK1B58cjhjmxEnlF+scQE4MMWrfw9jf3Xw+gMSjDnMbaOVFlSvD9KbIH2K7nZaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319367; c=relaxed/simple;
	bh=PscZaUfcZA0pNJ3C+ILA1g3BAlYfkAovBm2+jca3OyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9uWk7O8ibLrX43+XmqsUzc9JfbIKVhLCp83DUJflQHG0TCwa1VNMcdcaDkgLCioUmqCuGqKpvDKtaR3KbWCrkxnM538mBt2dU0kN63c0xC/0tWq+LT6TvR8eUNIKgiZJHnZjLsZ19seWPD22TfhME1Wri2gkGyodCgDgs+u5MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIqIcAzg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIqIcAzg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545121F000E9;
	Wed, 24 Jun 2026 16:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782319366;
	bh=PscZaUfcZA0pNJ3C+ILA1g3BAlYfkAovBm2+jca3OyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CIqIcAzgkgOgTjtHQo/W6vlF05j/b6nbpe2dZnaul5Khi89kbllYWIKDNG2S/UxgZ
	 WKUkUiZsts0r7GlAkt1AAaj+s8LdKzIAh5h87PRG0d8ES4UUjzD+zipkDriMJeJ3yd
	 Gpj0/mpKv0E9/Pt/GfJTKEflvGS7QV8RueiFwWI4MiltJz0EoGCbPid+Ie7krAkYQ8
	 4c6dXlrqoJI9Va9vijsDTyLJkzWKKJAaZkWxAZvgg/twUhPqkuenyhZBV+bh8rUTe9
	 CMYwbnErSq7R87yGmkYWH8JaxfTHnfvPuP4vdFi3QkLgAAmuLXx+A/t9j5cFYjQNiU
	 axtRfeQIZofkA==
Date: Wed, 24 Jun 2026 17:42:43 +0100
From: Conor Dooley <conor@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: dinguyen@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: altera: Add Agilex72 SoCFPGA
 compatible strings
Message-ID: <20260624-glider-payable-6148277b8365@spud>
References: <20260624055644.7508-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260624055644.7508-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2z2FyFjfn9NdGdyt"
Content-Disposition: inline
In-Reply-To: <20260624055644.7508-2-muhammad.nazim.amirul.nazle.asmade@altera.com>


--2z2FyFjfn9NdGdyt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--2z2FyFjfn9NdGdyt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajwJAwAKCRB4tDGHoIJi
0n/mAP4woezfqDOhOPTeHKxKiN4UDRQJySIxdKZwbSbcfe6AIQEA/mnPVXZOHF2I
NJetc4z78sNvGSrXFUwf4ohO4wmMjAs=
=HRU6
-----END PGP SIGNATURE-----

--2z2FyFjfn9NdGdyt--
