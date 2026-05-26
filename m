Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A803FD96F;
	Tue, 26 May 2026 16:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814391; cv=none; b=I738UYZGPpkPtcgLOYsAHyPZGeF86UICVArepykUqT4WnL+TVg7DDseppSvXBdT49CjoiPA6xxd4wRHWqhnMPrTMwv85mBAjojWatOuC+GBiXXQOIDIrZi0nKnVWti7ks3wC8bQzmy5pPNkDkoEGgy0bU2Ef2EBBF869DqEPdjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814391; c=relaxed/simple;
	bh=OpVBqdItn10WijuV1NiWbwskiquoRFfvBAzrrmnP84A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/tL1LZ4Y2oFIwFvX50DBCss7Cruy/iVV0R7uaqZzqsUV4VWxysnvSu8F+P2uzWEmhaHSA6/SDwFAtdUZzCSYigpqqUgXv4yXOgllzIQMOsEdjk05ZtlJx4miJtkor0zTNiVaDiv1A2kHup28wUFgwFBB2BW0A9UA9tOfOx+B1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyTF3Kf2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyTF3Kf2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571DF1F000E9;
	Tue, 26 May 2026 16:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814389;
	bh=OpVBqdItn10WijuV1NiWbwskiquoRFfvBAzrrmnP84A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SyTF3Kf2GRv2/2mEejhM8TAd5xPzYuw8ThxF35jLbwvasecCcU/6k1i56GX8e9wX7
	 BSi/aQLRPNl3XIx5ZuIKoSW0BHO/BowRuqywg0Zu6O5G5Xc7Xkoz3sVFvC6bZ4GYx5
	 0kn9ETubXF2HYZ2yF/Mu3jX8unVvAsftb2yrYdZz/GSmKkqjKGVEKSOq6SvDbRVvCS
	 fGQZOqhKvvu+NVhQGgD8HrwzFd7tsfqI2q6Z5Awi7aHFDwIxSAEmams81MdlqhOlUv
	 GmAs+PhNOFKZvnz9fiLu8BRiICyKbFhSKEt6lDSr2IoBzF7Jwt1EaOtRb1NmKTwn6c
	 Zj5QKgC/hqnWQ==
Date: Tue, 26 May 2026 17:53:05 +0100
From: Conor Dooley <conor@kernel.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Wig Cheng <onlywig@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: mayqueen,pixpaper: add
 pixpaper-426m
Message-ID: <20260526-scrounger-motivate-7079f771f4b4@spud>
References: <20260526-bar-v2-0-c66df9a840c4@gmail.com>
 <20260526-bar-v2-1-c66df9a840c4@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="55YTm001h8+bCEZx"
Content-Disposition: inline
In-Reply-To: <20260526-bar-v2-1-c66df9a840c4@gmail.com>


--55YTm001h8+bCEZx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--55YTm001h8+bCEZx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahXP8QAKCRB4tDGHoIJi
0o8lAP9bdUMQ0S3B1H+ktOtjKETQ0aAt6JZAW9EZpVSp/g75fAD/Sr9X/I25LRo5
wx9QtSBc9htIlsjGraSsXz4rQFUwTQo=
=IBND
-----END PGP SIGNATURE-----

--55YTm001h8+bCEZx--
