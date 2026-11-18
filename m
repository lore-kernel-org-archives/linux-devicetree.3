Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025168;
	b=Yp5TR7vlEzO8IViGWwoveiHpUuTU6xnAgN8/3b+w0zoPJAYd/71ZMpAcnUCZG6FWd1cD
	 H4MV8pSDXUhsvCuP2tQgYrUpuEZKR27u7qavxQKULlPSeUvxyu/g7wHktQyr+bGXztpGM
	 dC1quQiuzY1gsSMiXLkAiJA4gY9iUGZ9U+9rvkb6s5oKlXT/tQAhV6ZbBprQSG6SMq/2P
	 vMAyAyNa+21q32iMJgl75ra/GVeQgqnyggmtlnlH3XXmNYFqXxBPYXCXyRGYfZYmeqsN+
	 +K5CXUVTy0Z9AvnuE41Mi8Xt4Ql5JvUzHjQYk+j5u3JPZ2QZcNLsGrHfBYZJecIbFyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025168;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iQFVmrY5mqU3VTo8HhakGq37VzlLzgYRkFXNFEu6qaQ=;
	b=hBf+uX5VgCJAio2zeDxZsiYPVcT8sbfs4HlEfXmusnoWaqFtUHOOwZFLpTIBUEuDxmOE
	 gzCA0XpBF319HhRyJUNtvAsB5sWJRseCsBp1LS6jYEgCYPZyLx668lTUat4AqMrgdHumB
	 Wd1iGBImdG/auoPwLnadK9cr1ou8V38VXvGjbbQ0WLogIqdd3fYNT7sNdNsPahea9bYMc
	 3NGIF1ZA80Xtz/sIsgNzEbbYfmT5p6hBEzxqVZHjIJJqKuu2TXSsNt1L7esBolqlw22Cr
	 7oHhGcvZYCzn3ACYTqZQYnBNyKUjfvc64wons9E97p/Biclw4HI2fQAzHyQ0/pnaLog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yq32b61r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C59606A31C;
	Wed, 18 Nov 2026 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yq32b61r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F661F000C7;
	Wed, 18 Nov 2026 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025168;
	bh=iQFVmrY5mqU3VTo8HhakGq37VzlLzgYRkFXNFEu6qaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yq32b61ra5e7HiCds7aqOCCBDvBOQwobSi41NFyAl7Tpi6ALGnTTXQSLWbY5ErcAv
	 NKwFYCAO++63qqo9L+1PGzP3K3PjAuHkSPxJRonMMHuZgxpU36mc40Y4RnA9czav4o
	 6LAWxCVaq3GiUOHy5uHunIV1mJCgYxkJtnHRmmApwv0Wrp9jNsZ8cD65sHbrJ+vvkv
	 Qx6AK4Jnp66GINz4Tw5ZtZp972eBgQ61nERGkfZ9Caqos2NEpll+5g07njNHB4YNhv
	 OCX4iGbMpho0X/3jbBJk86PyBftZaqOZ+bmFmo/aaJs8rYAgjfDIECa3YPxOzNHvrb
	 rKNKQ1NBYBxDQ==
Date: Wed, 18 Nov 2026 18:06:03 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: eswin: Add Milk-V Megrez
Message-ID: <20261118-ninetieth-gravitate-577e3d8c7298@spud>
References: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
 <20261118-eic7700-megrez-v1-1-af8334b88336@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="/Sm/SOKiLfkWZgSh"
Content-Disposition: inline
In-Reply-To: <20261118-eic7700-megrez-v1-1-af8334b88336@iscas.ac.cn>

--/Sm/SOKiLfkWZgSh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/Sm/SOKiLfkWZgSh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3pCwAKCRB4tDGHoIJi
0pNAAQDyrpoMjRwgAbi/Nc7EXwuYjbgNwtaYj9jrzfhSkSqS8wD/VoRBX3zKOZdG
XkfXROHUrapCf7ddXpv9jceHhpylGw0=
=Z0nY
-----END PGP SIGNATURE-----

--/Sm/SOKiLfkWZgSh--
