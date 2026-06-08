Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C13B332EDE;
	Mon,  8 Jun 2026 17:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938679; cv=none; b=lrUP2UsQSHWNZ9i5DRnAf6DSvl+fWKLMfYdiYviGOSer5hVQj1/BRLtl7d/kbuFKRkdNT/3rRV8qv60NFyE7AtFyJJkbKFdMdiVY45ILZdshBvT88ck3zpI78RWLN8LCx7Laaho3qPbje0a2k6z5y6aOptvcqDDYxlowMCVLFB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938679; c=relaxed/simple;
	bh=uHkwhHssG6Ajbq+kxDL/0e8WB7yH/kcwATkmbA1AP3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjpgWM7kQrceCjshzMqCMyr8GSwUSmmK22IVaf1iBa1D4GoVeaI0EBQYfcPwEjzPrgbxFIWMs6Tke3GlcHgAGHaBfdxqg82bSRrdAoCynHUlhLKZPVasC2HJm5Icav7oq+BKLylomueEbr1obOtPGrKyjrSgrhCFVo0lcwNYzLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9j4SDSD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9j4SDSD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CBD91F00893;
	Mon,  8 Jun 2026 17:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780938678;
	bh=uHkwhHssG6Ajbq+kxDL/0e8WB7yH/kcwATkmbA1AP3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I9j4SDSDT9ki9u+z7cSyvi9t9iQL/2ZYIZOmJOK8cjgmPDqdNZaCe++QkjvmjjeKS
	 0vuXC37r4OurgF+e+cFDban3ikva6YU9DnO+WTlMAy9/y8O4X63E6sWjuOUXruzm3o
	 UGP9Dee6imuHGn5VujBSIB22wLnkHh5rU/Sp1ksu8Op/zmn9tdjSiJi0n/mW9z4hDJ
	 o4UVF2zaok5sbLNd1S7cDPIP1tat//LWUB80NasQqFvDhBWYMMXr53uLeVcw5JIVa7
	 wWxmCfMeu/nf03Xi1BBE/z+PINBgmD8m5xioZ2iSPLPujG8cKM6uCWhOftMEjLYFLM
	 bmlyRfCwVINmQ==
Date: Mon, 8 Jun 2026 18:11:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: himax,hx83121a: add
 optional bl supply
Message-ID: <20260608-tilt-probably-5bd81e84098f@spud>
References: <20260608162622.403713-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eoSr/GZJJ3GY74cM"
Content-Disposition: inline
In-Reply-To: <20260608162622.403713-1-zhengxingda@iscas.ac.cn>


--eoSr/GZJJ3GY74cM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--eoSr/GZJJ3GY74cM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaib3sQAKCRB4tDGHoIJi
0j0rAQCvfWv/nj6nvGJdFYHllgXfokFFKjL+XSfhDQO9JKqbBgEAw/0tXEtdVAIU
pbAwVaqJyMR8xgIRaZ5DpD+VZ/dvVwA=
=/RX/
-----END PGP SIGNATURE-----

--eoSr/GZJJ3GY74cM--
