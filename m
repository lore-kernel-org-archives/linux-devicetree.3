Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782048C8A8;
	Mon, 18 May 2026 16:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122681; cv=none; b=MTjnIzm/nEoel/qMieirpHzhT24JWWGctNpqgzfAWK+tFUOU/Anm9Z88wQaW0tqghHLKmHZ9SRRoVNv4u3R+fDn/3JUgeaD1E7ilIqZIDi70YCm8WZfpuEOUL4KPTq3LFwG+r5fl8QamgkLT4dst+RLxNNudvIc3A3AOrKwOTZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122681; c=relaxed/simple;
	bh=m3Ikqs/u6iw16HVdcS6tQdZmxm4Gckpgsu2UZkrryLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRm88FaxnmG2cOdNbcqU/nlPaVfFQDSW/7hyz4MIhxjECnn4kiSw/RoqQhf9tPRLblcbp/Bl5CYlWoBpU4nz/9vgt8vS8P3Opxx7JsHrYQuT0VvkbZHqzejgQtel7ZWCXzq3WjdZRMN/9ZVvvF5G9yfbFjS4XbTNFGxjrTgcK1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hnb+B7S2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hnb+B7S2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CAFC2BCC9;
	Mon, 18 May 2026 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779122681;
	bh=m3Ikqs/u6iw16HVdcS6tQdZmxm4Gckpgsu2UZkrryLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hnb+B7S2mrRrVnxTpFwavDZYcQo+ZA1OPZyLlO4Bpa6hFh5jghWsMhgRFUVVlkW7g
	 A2EsU9A42Y8hoddNVbUjyRrHB/Ed6rNmkKQNeto7AnMHZmOoaAF05mFTpmKjVsKjgb
	 bgpzq/j6tRXVlvMgda1RQ0iMOkE6+OYGsWObpIaymsWH472UwYWRcL3fHX09jW0EKu
	 cFBwPVDK5C7dAj3Yaw+pZWVPjySDN/ip+NSCn3rErFrKFBK1pcn7I8rt/KfbWB8z7G
	 TItf52cNhgK3oaF5pg2e4iQlRseETGquwS3/Epnvg9ralWg8TNKA3jxkjy/1glyuKu
	 CFI//kXd9M+0g==
Date: Mon, 18 May 2026 17:44:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com, francesco.utel@engicam.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 01/15] dt-bindings: arm: stm32: support Engicam
 MicroGEA-STM32MP257-RMM board
Message-ID: <20260518-cranial-egotism-425cda572694@spud>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
 <20260518143150.3138712-2-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k8rYH4PA6MYcOw7H"
Content-Disposition: inline
In-Reply-To: <20260518143150.3138712-2-dario.binacchi@amarulasolutions.com>


--k8rYH4PA6MYcOw7H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--k8rYH4PA6MYcOw7H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagtB9AAKCRB4tDGHoIJi
0i/4AP94lXNNmFYS6tVgFN3LRcZ5Ins4gmmknN0ofz1VRWQEgwEA5D9fYg7lqDmX
1W6kIm5teSCnFwGj0zzwdjMgivR6eQw=
=t30R
-----END PGP SIGNATURE-----

--k8rYH4PA6MYcOw7H--
