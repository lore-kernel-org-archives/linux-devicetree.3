Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336659;
	b=GwjD5bOffcQoohmzOzXCUtbneFp6dcZ9A1HpXMf6KVMxmHkK9sN6pcTjxw5710OzVceY
	 h1nq9GOQiuuNIIipyQPsXsTtBVGyCiw6nWb8duCKB3Xu2GU8d3OyAVe7On6P7E6TNiW0p
	 jB5nLAMlw6M/EbiS2jUzbxVF4npZpP4oyFggucSl2gKqqX+3jSZa5SgRHFEUU8v91jP6h
	 0wGUnu9HkCGnWcDzRQB+kTUbsVHnVO9F15pGgNnlS/tYDNz4g4JNxZSTGD60g3ZBpY5xu
	 iE6Ct0ClUfr2qxoBoa1/JP5mgEMRuEvJsk0GXeSsfhwSKpzX+BabPR+4X9RR+3pVyaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336659;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lw5R+03CbcJOauGhuqqyB5KrNrCBNCqxs2tnPrtkBQw=;
	b=41z61EWEJIj5pgbn/OJKZD2UJoitlVQVcoDCjw0hIdyJdwGLku/y9I0DjJRqlJlal9xM
	 1qlFVEPf1IGB5hRfnMsrnDMJpAn0+gx9gU3bF8LCw37rreBG5MGLYOWlLPzNoEQ+VHOBT
	 +/W5ZtMUMTDYt69L31uW/Ux59h8/SKncKBB4qnP35VLwJvjwmRtDITDx8/LtkOCzlchNW
	 2raLT+herhooMUcKSzPrPUtSAdpWeVd88gR9Ropiw/SrJbf3LVqQNjCk66kcec9rS1SJT
	 QsC4ezMXjTL8j0AP47etVJoIjMZ4PQm/qHdrMXrpILbIq6pDB6NS2FsSzfUMWN5zi2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JqWUJALF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618F6606A321;
	Tue, 10 Nov 2026 18:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JqWUJALF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CD11F008A7;
	Tue, 10 Nov 2026 18:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336659;
	bh=lw5R+03CbcJOauGhuqqyB5KrNrCBNCqxs2tnPrtkBQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JqWUJALFbq4GQTW0TDwQn+AcB9wpH2ZkJ5ed2nNxVceaHrDnqKDd+ltQqhmq9qPfK
	 eVSs01rTw3OmzwgCFfHvXI35nlkno4ibamI3Xgbi07nMDc8P0uZHy/41kfPCT7dqBZ
	 tCBojIc0lg4Z6Oeb5xHEedTfS2k1kSJ+WeMTEWI1O+hbeoU4J5J3g++zyLTh5o3J6v
	 lSiTEyC6L5UgDrhWqO0nzZGFlgpy+DUsZp+TAd2NGAsOluA/R2xQAGvMfZJEMhUVZd
	 SPYJbZznNcsMJ0cIncGa23G6VH5cvfKqecn/px8kHY91ZOP4PJtwHilqC4uSKzKMQq
	 Y/N+GahASFbNg==
Date: Tue, 10 Nov 2026 18:50:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, van Spriel <arend@broadcom.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: wireless: brcm,bcm4329-fmac: Describe
 the MAC address
Message-ID: <20261110-comfy-traverse-f4a2749f34ba@spud>
References: <20261110-brcm-fmac-mac-v1-1-df9e6264b056@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udU847c1Gm7zZV4Y"
Content-Disposition: inline
In-Reply-To: <20261110-brcm-fmac-mac-v1-1-df9e6264b056@kernel.org>

--udU847c1Gm7zZV4Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--udU847c1Gm7zZV4Y
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavNnjwAKCRB4tDGHoIJi
0jBmAQCD36ZytGuKw+f2d+RIxLcD+mwHwO622R52owDqF5/m9QD+PEZCaDeu2cUp
fbudI+tiId+GLa5O81lJVq5nPSihpgI=
=SfOD
-----END PGP SIGNATURE-----

--udU847c1Gm7zZV4Y--
