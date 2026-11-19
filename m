Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110946;
	b=IHJ255KZhEYsrDJaGP9doDfqQcn08SPDXykREYpOig0vNKDsJOtMDpOiSw1VbRadBVuR
	 aGq86IpqOzhFmW7PuO36eUHeOmcT8LZnc038mn/ltyJ3/FVVGXUGYiWa/kmcpUmvIK8Dg
	 PSvKkf2ksCH+n7PiAHi8t2nmzoaPZPZSDQQtLKWycK2rtKHmp8sljKFUn84AggADE9IOF
	 UMlgIbH35U8rr/7hYxq42Ou0PRpBO+sFHfoApocruRTv0kSHJot5ia8YslbCmRvsVI+A7
	 ElBiV/xi9AZHDz0uBCXsoz9Iwyr7/1qJolFMRAj93jaHAxmFCAQZJglU3M5UbzewA8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110946;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5Xk5pPbAq0dYNkaIt18VSndwOHAb9R3m55g5wEfXi8g=;
	b=OLXawMpPzt2sfu1YXZBll/5iehH5FkmpAQ6tDOYzbXgxydF3ONhuJNyKyjDwGR35Qqht
	 WcWeOj6yZLsqpfeoZOYRDt6v/rXqkb23H3AtPM5t3PNcdLqE8pqFWbJx+IQ1D/eAZL0ZF
	 vRT1xuAQJU1267u1VU+gRrev3BwPkNXVL5SQDncgXTCYIkQD8OxzeB4Ii4Q41zHAcs5vY
	 FTFKQl/nyGy8HG5zTIKkKynaDECI9GKGqtEgwTP06RGZc0n7CUnoHRNv5JLQFe/Qgx2uc
	 U8HVJ9vM1mwSHq2cU6eTluaiUn0WcK2rnyuT3Gc2Bi6Qt2xFtmeuioqKxq3IR3NEKvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1N129zI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BC1606A320;
	Thu, 19 Nov 2026 17:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1N129zI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07AE1F000C6;
	Thu, 19 Nov 2026 17:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795110945;
	bh=5Xk5pPbAq0dYNkaIt18VSndwOHAb9R3m55g5wEfXi8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V1N129zIPuc1HRbU2bjH5Wg5J+SnZM3lDf0cnUYip+zyJkAMY63fm8xtYdTDMPTaY
	 kUVn1KWUaRcaW/1skChWKB2so0HWMhWzkVaePa506ei3huKU1tPa3oxVz3sJHNinmg
	 HeGTBLoOLtV6jjqGJswd0lPTSFXMv1a3jmSXGZQZFqc+OYDzRKStTBc8/tuyF2QL9i
	 M3s0rM+CHZKL8pWeAMyW5WtvG5fIINU2Q0k5JcYnSbzhqBJrTOiGFjurNo0xrA/jPd
	 u8eyyfQPICTsKBthtnRei/ZWSTN0xpNMkJwiE9LZTo+SXo8pswh1t1ziSzZr1K+/QM
	 vcn6Zmk2fo+9g==
Date: Thu, 19 Nov 2026 17:55:41 +0000
From: Conor Dooley <conor@kernel.org>
To: alex.cramt@gmail.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Mahesh Rao <mahesh.rao@altera.com>,
	Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: altera: add Terasic DE25-Nano
Message-ID: <20261119-overpass-cone-55444b473817@spud>
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
 <20261118-de25-nano-v1-2-473d16131f7a@gmail.com>
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
	protocol="application/pgp-signature"; boundary="VwlXUI7bkGqsqioT"
Content-Disposition: inline
In-Reply-To: <20261118-de25-nano-v1-2-473d16131f7a@gmail.com>

--VwlXUI7bkGqsqioT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VwlXUI7bkGqsqioT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav84HQAKCRB4tDGHoIJi
0mgCAP92GBT28LEUFDJeLnAigzhLl9lbnnjAFWXVK0pwX6qJYAD/apMzCn5uDeX5
yzIUyHUOvW7U+NoFjz0wGF4oqU6n3wE=
=IOON
-----END PGP SIGNATURE-----

--VwlXUI7bkGqsqioT--
