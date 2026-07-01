Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDFB3806C9;
	Wed,  1 Jul 2026 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925210; cv=none; b=UZfOl4qdiT+4PeePa7gdJpFuvE1OixdKN0gRI71QIZOUlIgTxZChbgOpi2mVopM9hngsqN7j79FzAPRetxcA1BB/gZMppdKszklH7aKGWd3oynmklc/8Fa+m1KbpkkwOhBaNumnGqSnXS3YLRYaQqjesKY+P8JmXDnSSTMsxjME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925210; c=relaxed/simple;
	bh=Lkp4HiOPABBONoTf78hQOCnxl/elkCfMhe6Bpuh0yx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzsBqJUIOxvERHce3Kz7oUG6z/kxh6jhYa2Qc6WbyvYckTWu30BVxS3XvStRtIii3phqHB0V35A7hSLPLYKOJTI2x8+gTbQuDnXs3BT/jUfl+tMZLzXvu0bmNtUBs54PrJEY5020+QQQpG3EtjTxpuhqaOlzYxN9gw75Us2iJ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8j4rPn8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8j4rPn8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE47A1F000E9;
	Wed,  1 Jul 2026 17:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925209;
	bh=Lkp4HiOPABBONoTf78hQOCnxl/elkCfMhe6Bpuh0yx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A8j4rPn8GXnN682mi5i14xifdRIV0M5B159dMsfcnWdWH2sb2mMioWiJGhFLzrWc0
	 Dyr9c2MoFSnr/orqV99qlyqFaveNQ7qAy7okRZOhpWmyag2MRRhGCGhbLZ4Dzm3qU5
	 VAU86MGUpc7T7/jw5E1fWMEAbyZcF2sEGdVKV4IqwoTy4PP/cP407BP1fy5X6UqH5b
	 DSogYVufJ95XHKi8Y+HofC3K131mqd68wdmHEx6GpZGyk0kiFJlnJsk7EgvequLex5
	 MoL5cW4HPQUA6iRA59HhmxmIdKm1dSIH3EqXDHzNpdjlxAzdbVR//xcefQ6xZsHOvm
	 Twzdtils5wQJw==
Date: Wed, 1 Jul 2026 18:00:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support
 for MT8189 SoC
Message-ID: <20260701-twisted-splurge-d8428a6ab8c2@spud>
References: <20260701-mt8189-dt-bindings-scpsys-v1-1-2c04f0fda1b7@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6LIruBZ0RnifyB06"
Content-Disposition: inline
In-Reply-To: <20260701-mt8189-dt-bindings-scpsys-v1-1-2c04f0fda1b7@collabora.com>

--6LIruBZ0RnifyB06
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6LIruBZ0RnifyB06
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVHlAAKCRB4tDGHoIJi
0v2hAP4xG8uRvU5urx9tcNk5sTMtXUUWh0Pp6QoPg3ZhJxrmsQD/W7k1BGw3eGna
wHVQ02sZvHrnrhOF9xU/nWYvggscKAk=
=8Tor
-----END PGP SIGNATURE-----

--6LIruBZ0RnifyB06--
