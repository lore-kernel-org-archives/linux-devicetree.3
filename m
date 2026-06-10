Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00C333D6CA;
	Wed, 10 Jun 2026 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109294; cv=none; b=XvDnsc094x8hnnWtDm5UeENc/ej3jIpOS/WAH8JYsmMIXSfmHXKQrt80r8StQk6P79JIbisV7LwgC1wMbinnN24kwXZLitKX/tzF23Br2sUgxWcTAFaIZq7Zc9QOW/O7FscVDiwlnxp+3jpWoFqeN+FwG6Tv73peO0YPhkndIWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109294; c=relaxed/simple;
	bh=Dz6bGaU4TEDuP6jhqyEdB9WJVR4UPC+1gECsBc02gec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K75eooN8e77K/fLQCC8Fnou200vxQ9ftqlZ+pKb9yLDIwbvTdeWigobwFiOZHyCbbdURFaW0TqGTBVIy3tnGXGtLRmUS/f0KXGafLVJC49lc1rEeT5Yw416GbNMzuU3MGnbM77MQ5K9q6/V4ryNKVN7wJr8Ha1ZAp+QtoPfc16c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cm8OsZ47; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cm8OsZ47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5051F00893;
	Wed, 10 Jun 2026 16:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109293;
	bh=Dz6bGaU4TEDuP6jhqyEdB9WJVR4UPC+1gECsBc02gec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cm8OsZ47Lb+44Q9TUtiv8uVPHlwZNn6K6loHRzompo1TrtfZzbX5LZ8yQjW1DVUAF
	 K/lOT5sTCx9vUktC1Fs1qfgdoQgFKgMcGjlk+3dkP6XrAjIlqn8TRlSJeurYPf14n+
	 sttbi6reDnMd6WayJbHYp8gi5kWZpdBMs+1kJJRYKjy8jwaV7A9DvMvdYs/YYQE8pX
	 Q+scRHiJ3fCWJradqVKcKu6LFZ+DlTkfKxQqjdsQ6WAycF9bGJgi+bfCZWZYyzo5sa
	 UdQtzo/lNOu5635K7xO0TXKdZqcU2jIhUfBktscmj43isz2/ELo15HBPCOzvT8o8Qx
	 tWLW02P6TJgQA==
Date: Wed, 10 Jun 2026 17:34:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: unicorn_wang@outlook.com, inochiama@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chao Wei <chao.wei@sophgo.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: sophgo: add Milk-V Duo 256M
 board
Message-ID: <20260610-swaddling-correct-00451e8a8717@spud>
References: <20260610121026.1517621-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F2+KufmimPfDy2pj"
Content-Disposition: inline
In-Reply-To: <20260610121026.1517621-1-chenyou910331@gmail.com>


--F2+KufmimPfDy2pj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--F2+KufmimPfDy2pj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaimSKAAKCRB4tDGHoIJi
0peRAPoCfdWATa8xwu1tCbzjMJd+Hd1fRBSRaOFpV9ZkBv0m2wD/fxWasa8fGQNZ
hUBJomcr93d+JharX4vKTwzdGQw8Qgk=
=liZn
-----END PGP SIGNATURE-----

--F2+KufmimPfDy2pj--
