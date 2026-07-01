Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030E7370ACD;
	Wed,  1 Jul 2026 16:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925188; cv=none; b=aLxPylwHyjYQB/tuwgKzAL5XppbiWQXvopabQQ0USCkOVnI9WwyujGGqI8ksGZ6UA6kMjdsmzC1vQCcSkamVAFU2agAOnYi1140FFTyfQm66iEVbjHbZb23+StF9VYGv0FbKjxvzaXJqOau7EpeMeXUXTcQaePFynCqqbVqbPTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925188; c=relaxed/simple;
	bh=6GKUiK4lsUyxfOQTa+DkkuPa9nC5WHhgH6dZ6JcMOVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B91ul0p0mUBE15v1rTb7Q7K+FXZtzC8QvCXNGSFlUHXHl+4WPCUwpWnUPyYLe9xjYiZWYVTowtaBW64iDU0+PQ+9fR6GbfREnQMSWR3nXVssrSwUZeZYXKv7QnijznEXBR+DWdGfWSeYV0l2Qt0ysqCkdc3I9bESf2y0LkTzniE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGr0AfCf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGr0AfCf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24801F000E9;
	Wed,  1 Jul 2026 16:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925187;
	bh=6GKUiK4lsUyxfOQTa+DkkuPa9nC5WHhgH6dZ6JcMOVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iGr0AfCfMipgDELZfH0oNnfdhHmQ9iHn3TMHt2oyDoUr+mrZrIPry83rqlC/Mpc1s
	 vbUc5VJtHdPnLMYSSuHe3Z4yMiskIo94XfuhGpTksHHZaWVI7NqADY+0sp9Iitiy5o
	 s+aQ67e4zxkdBwYCcpFRgVmEmr0G5G1B6C4N0F1bGTAGHHRuu/oEZgyfkh0hLHm+eI
	 UXl0LOtWFDDp3pJMspLg9z7eYML0G3HAUaf4rmL0VipejFw5s1Gp3acukG6WbfPiUR
	 I/Rvc0p54AyDEg/793xbBZlXOlBiGFZr4tNKf2jTebseP7OTJ57sHxfSnnJbuCpca8
	 MbhMFiCinUFLg==
Date: Wed, 1 Jul 2026 17:59:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: mediatek,tphy: Add support for MT8189
 SoC
Message-ID: <20260701-graveness-program-2cfcab411ef1@spud>
References: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9rSKBT53BZC4l7pJ"
Content-Disposition: inline
In-Reply-To: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>

--9rSKBT53BZC4l7pJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9rSKBT53BZC4l7pJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVHfgAKCRB4tDGHoIJi
0gsbAQCfNvGEjyLqD8GFLj1gnnm4qZzfsFcFiF05x5MMWV//IAD9EICibF/goigl
+KUPdrJ40+4unbogYm9VMeQegp4NRgM=
=p73x
-----END PGP SIGNATURE-----

--9rSKBT53BZC4l7pJ--
