Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC75E43B3F5;
	Fri, 10 Jul 2026 16:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701670; cv=none; b=fQWOJEn2SD6Mi/GGnIKwrAUivJyZomCqqLFNCgFq514Q74jn/FkTsdDen1fCXBCUT+0n1Z0TJ51LKSuzw7tRwAO3ajFVqTSA/zLsDAN9bNSQ8K/1lOBGVhzQntJq8VbP76jlr+sVNbeLVK2wDBhPQtmPbp3+zdXRh7HeofrND4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701670; c=relaxed/simple;
	bh=zpfe15YD5JBM8nm7Z4e88EWsxxEDDJVjveJb96Udl1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kU33XbAAZGXSZ08bwFDDvmuTgrn8LXPqDH/DYcDiaQqOfG5jtdDDIQGvmiKU8Xgvn8LcjcXBG6xwYhht3gYGnrB+j/j33RyweKgIdLRYBfgJyiT5n11MSe0wN7f4ylrVlggPfqbAtMe1aiqmD508tHuRATteISqXtBZJMK5VC4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Raqyok6t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Raqyok6t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF821F000E9;
	Fri, 10 Jul 2026 16:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783701669;
	bh=zpfe15YD5JBM8nm7Z4e88EWsxxEDDJVjveJb96Udl1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Raqyok6tlRT/4cby1PEBf5/rh/wNKpXiLRaosxHRR9kljMWZEc2yixcn1gqzF1oaA
	 l4WseRf1xIjtP+UuoYnPi83bBYQRgZt1EZLDHwUpzax3Y38wsGRlgtmodzozSuRLCJ
	 1wfuX+Ux0APaXfkcgtIZG1s77GBY900+0KS6jMKyBV1LLSAVr6l6ohtZruTj00Cxc9
	 QvLpoqP9H/m4PNffM0dI5nX4JVqZNZS1QkwTETKXxyOJRU7tfV6d3exceFOAjzNeCb
	 YiEaAY9XqIpzeBEso0+t70VkuFUh9dPJikkb1dCRQcNw7jBf5c+W/gNqw7i3xWh1SS
	 2bRezy0GYFpPA==
Date: Fri, 10 Jul 2026 17:41:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: sophgo: add Milk-V Duo 256M
 board
Message-ID: <20260710-sarcasm-manmade-bdd889cefddf@spud>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
 <20260710075917.159969-2-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S5DilZCTUEyk3TU+"
Content-Disposition: inline
In-Reply-To: <20260710075917.159969-2-chenyou910331@gmail.com>

--S5DilZCTUEyk3TU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--S5DilZCTUEyk3TU+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalEgoAAKCRB4tDGHoIJi
0o40APsHyfBdrwi5DEqjFKf+ydGAfwMVF+1WyDtDvkRSSpFRhwEAzJoVLx0+/wGV
216f1ky/vnBNHJy/A2aBhugERQadDgM=
=hC18
-----END PGP SIGNATURE-----

--S5DilZCTUEyk3TU+--
