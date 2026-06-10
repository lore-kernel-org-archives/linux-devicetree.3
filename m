Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE061A683E;
	Wed, 10 Jun 2026 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109193; cv=none; b=mlOPujjUrTVETlilua025fqtJKfntzH26ybqvAUGBOI/3iJ/h39O5MKxMhcgAatGD8YJmZettxIsev/tlzAZ7ScQ9vFoP6e1irGRCSzzvbKR5eVrYOi0NwwPrYCG32iAzT8gDiYku/xV/cWEjcD7v7aZ4VM2KbnJ/A3dZn7YCes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109193; c=relaxed/simple;
	bh=a7o8ueTjzuBhdJFZVPdWlGeBbAHxl+TvYLedYSoqWFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYjJCkfr+Z/JWG1EdtSBbDz04IZfA15kU9IqipNTu55fKBRFWj1zWLRuqzqMmjvLg/F8bC8eNHzgNvhTGslPfiG2xRrpBsLUmzdYgImnps1zjpLkTh8Ub1FU700DlBXouTHDbkQUJDvCdI0t/qhDeMFbG/yjxQPmalcimsLw758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWNez586; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWNez586"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5781F00893;
	Wed, 10 Jun 2026 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109191;
	bh=a7o8ueTjzuBhdJFZVPdWlGeBbAHxl+TvYLedYSoqWFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BWNez586UuvLsApW7f4KwruHo+4GO3TOArOVgFwMQDesTEc51sMb3S5zJl2FRYdH5
	 /yNcrscrCJkw1CrTBxd1r3AYrOwkxZzJ15fsfpNQiyNrC7W6y0NwvBHAM7d5aBegDB
	 P0I+vpFQVYq8N0F30jiyEC9dMSs570+7U3xuo97DGtdYKzx9L4kCdEvsMAxCt191xN
	 lz0vgxdb8h5qoAWQ7jLsKbBWscDK8+8mkbbFwMhintZo8itZ0ShjNFaxWg2gdg0vKM
	 4lr6BluHwr5YqMhRGTKv9b8WRVb++9tx2pMPy1l1sahok6E/az4SdU1MvUnmqb+RjO
	 MHkfSfNR5BR2g==
Date: Wed, 10 Jun 2026 17:33:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniele Briguglio <hello@superkali.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add youyeetoo
Message-ID: <20260610-automated-imitate-7052e09dcb33@spud>
References: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
 <20260610-yy3588-board-v1-1-4bb7176b6826@superkali.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oSvp/bZG2AwmsT6S"
Content-Disposition: inline
In-Reply-To: <20260610-yy3588-board-v1-1-4bb7176b6826@superkali.me>


--oSvp/bZG2AwmsT6S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--oSvp/bZG2AwmsT6S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaimRwgAKCRB4tDGHoIJi
0pkLAP9cTvnJEdeVxlibE/lzLByT/yy3vYriNs5kmAlfz/jqKAEArWduBFRuLR9P
nWby33OtVYBpkNjOkzW/4pyRmj+qYQ0=
=BlqT
-----END PGP SIGNATURE-----

--oSvp/bZG2AwmsT6S--
