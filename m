Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF8A1607A4;
	Tue,  2 Jun 2026 16:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780417224; cv=none; b=AoUMB+mJJNNVMow6DCukDUH77tdt6Jc9U5jRSLfbFKi1u/O3xIz0WesMrC9Sfx5iGvbvVaiekOj6zfGRflHDenQCfL9q6HFj0xdqBXTFcYJo0tLdyf1AlfpAjxEK6meVULuz3EjuWyLjLtRhIcno8IZaPk57dEzfZ6LiedSXZCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780417224; c=relaxed/simple;
	bh=0k5yjZl4vRmofziFWi9oG66Z9lvqiWvEA4ZQGqJDIvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzpYtwtE5sqrorYCQy4CaVTLvdRo/u0ixubQowvHJrSiwQF2ZIxKXdN9jpt5smQTZYZZA6eIv+QmKsJ0Qd8GIqhCa/CTG5CNyg3Eb4qiYFIjesU96SPioFEE122j/C9z1aNtvopbJk6ey5ReQTPfNH4NLuOwqsmAXNV2qKJml3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJIT0ssx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJIT0ssx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661911F00893;
	Tue,  2 Jun 2026 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780417223;
	bh=0k5yjZl4vRmofziFWi9oG66Z9lvqiWvEA4ZQGqJDIvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJIT0ssx97ERW0yGHGdcAT7Onyw2jRu3dp6/o7krwbw88WSv6suDGkCjttC1oDfsY
	 aSQigl1oNaNO2XtrFypJjWpzeyx9yWJbPf4I0urwcRMwUlMHmB1furYutcp9B9RRtN
	 g1OVtUn2jaT7a2LH8r2jVudjwwGLbPKZuPN32RgADkEl418D6BpCv0CD3cuFvSjUY1
	 UN9cmu2E5srnx/Twd7c1B2ZWVHke/iyUkf5XxXYOO26yFtXI4spd8q+ROi4Iz7rz/x
	 3XCAbB12R3EfmL/z9wfv9YNlNyt5uYoSNMUajVXFpP6GoUfY5AaAAs28YkFXBRgpr8
	 RjWX5shckYo+Q==
Date: Tue, 2 Jun 2026 17:20:19 +0100
From: Conor Dooley <conor@kernel.org>
To: u8813345@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v3 1/9] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2
 DVT board
Message-ID: <20260602-cupping-cahoots-40da41ef0f67@spud>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
 <20260602-anacapa-devlop-phase-devicetree-v3-1-7c93c5df8d9b@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PLx3EfovJTpILGs4"
Content-Disposition: inline
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-1-7c93c5df8d9b@gmail.com>


--PLx3EfovJTpILGs4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--PLx3EfovJTpILGs4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8CwwAKCRB4tDGHoIJi
0s1kAP0VxPsI2ai9KcE8KjyAxQu6KSL/RYgc7cxhHgVC0P+rzQD2POXKO6YSEjEE
5WfTAe4ILcmjizB2Ac+SEFo7f85KAg==
=cSj8
-----END PGP SIGNATURE-----

--PLx3EfovJTpILGs4--
