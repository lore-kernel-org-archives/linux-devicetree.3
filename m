Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F1368946;
	Thu,  9 Apr 2026 15:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748998; cv=none; b=ivWuG2plYTrWyvoDciNTBsa0ydMOtlKXFO8XNCSlEGn2Q2sEachmMLbYW0nfhb1muakXh9GGM8GTFRICn+P2LDrJm5AzZMvpj6g0OdmRfyuI+94EdV+TZHVC0A2SnYn0MuhdEDjeb1B7F5QYgDfgbdK42dyLkak0l0+/6Fw12Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748998; c=relaxed/simple;
	bh=vgHNWQIVNQLVnmYjQa3phpy4f8LkLj4MRmL9b19wYtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cT8UQ+ATpu3Xh+wpAftIbWfXUfUz9i4gHJ6Zo2XrRxT8HKvlTfW41vp8dWWNnrGiy+/unt33xKDm87wKbVGTvaKU1SLYlbociA5WqntPiCjk1kXxW916vn5LhR/LfPt9ClBbr6hUZLsgf1vUjeZDo/fcicP5SgZDILeUT4YA3Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bl3HTEr+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bl3HTEr+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66950C4CEF7;
	Thu,  9 Apr 2026 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775748997;
	bh=vgHNWQIVNQLVnmYjQa3phpy4f8LkLj4MRmL9b19wYtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bl3HTEr+tRTCJMBfshW+D0LvT7+dVBTWHSVRPqwJg4GWRC1ZuqXeKWilLsfJAMsVk
	 NUN6t6sZeE1thBJbl2Kginnj0r/IxSLfPBkGtNKz9xYtpkPnUmtg2PB/qAtbv65/+9
	 3f2gf4qZaxr+kAIAi9OMoZtmY57x2HwVvNaRq8P7WgjnvgxhCPB/kki6hiGBz6Ol6w
	 lNP7TugPcnxA3T/T8vVT4NgWa3QzQUbN7s/bQ60y5NIMktwnD75TYzHUcZP/V3rg9j
	 W0J2hPaCl2AS/366YMN9Rlt1mtLsbQMqM0pg242CnTRb2Rku/de2xP6IPIeCLF+tYL
	 cC7KtRAboBOJQ==
Date: Thu, 9 Apr 2026 16:36:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2
 board
Message-ID: <20260409-foster-stability-f77b38c6f7a0@spud>
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
 <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="94RiNPJk8aF+VXXp"
Content-Disposition: inline
In-Reply-To: <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com>


--94RiNPJk8aF+VXXp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2026 at 07:40:26PM +0800, Colin Huang wrote:
> Document Anacapa BMC EVT1 and EVT2 compatibles.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--94RiNPJk8aF+VXXp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadfHgAAKCRB4tDGHoIJi
0lTBAQD3cz6MzoGwGp8mKC6FkE8r1DyqVtkBVRvjGhBwfipPqAEA62JE9BQgRbH1
0Zd5rQtyVO3BwX5MMW3LwT1FMuJtPwI=
=AvG8
-----END PGP SIGNATURE-----

--94RiNPJk8aF+VXXp--
