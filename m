Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85719385D7C;
	Thu, 21 May 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779382643; cv=none; b=MSq613USCGpQMOHzV/amLlrJ+B+bWqod90eMDFmQ2UBtM/li3LNnrspHNvq+gyQtnmX13V5uIGoWi6Mi8+oN7U9gvCsZq0YKHc3C366hRS/kOXTbCbdLh6L7hwdma3D4qapFE4z4Iprx6qi03qVKWVS3wl3aY+/Gw/XBBIr2/bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779382643; c=relaxed/simple;
	bh=I55lHSd1Ysdw8ZeTKOs6GuGHFCThm01Fvnx0VC1jLqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUJHTpb3rYkoXiDaKfEZEt2Jf5KGGtNIPyHSJPXLBWguIC3cXT+3n6ec8hNOYOIiLdovhFt870MjWkMfXAUNU3XYvxN/HctzesPyeWLIxw8sVUoIikC2QfQVnzt+bO2SAh8TsHmSlcCoVNR3nX7MQbf9Rld13MPizJge4dR6CUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8cUeXab; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8cUeXab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD3F1F000E9;
	Thu, 21 May 2026 16:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779382642;
	bh=I55lHSd1Ysdw8ZeTKOs6GuGHFCThm01Fvnx0VC1jLqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q8cUeXabxJU0IWTMJGWeV1jyVIfvz0S1Jqem5iE9CRf9Pq2+mWblC10QoinsHPl5I
	 Q3ZL+QLPcbfH15rclKm+NAwAKcI8tZ/OYO3FPZX+WeMwWWBbTVZ+4RyAqeUcjl0r5l
	 YHvznZYLs/8jKgJqaYSbKgkFpHDAPePw9mT+COCz+J9JcfnnOHxtawaXFvzLeMZqJ8
	 cveGc4f0Y6zaJUVQtko6MRcp5gYokSoH3aJ7YeuWCOwxgTy65JiCGkgym7ddMIZgK4
	 plIS9SiU7Fu/wUh9MZfkYNY4XnjyBXf1VTvQl+3BEFXHh6GtjbrF08s/x5VvBsVfHl
	 fmGyhC6nqhBwQ==
Date: Thu, 21 May 2026 17:57:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 05/15] dt-bindings: display: panel-lvds: Add Riverdi
 RVT70HSLNWCA0 and RVT101HVLNWC00
Message-ID: <20260521-yogurt-tinker-1a5d0b7dc17a@spud>
References: <20260521150038.103538-17-ivitro@gmail.com>
 <20260521150038.103538-22-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kz3CuFPJ65DTj9OM"
Content-Disposition: inline
In-Reply-To: <20260521150038.103538-22-ivitro@gmail.com>


--kz3CuFPJ65DTj9OM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kz3CuFPJ65DTj9OM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag85awAKCRB4tDGHoIJi
0pQPAQD3ZguE0qhACoyjjc36ilvY5dp10jnqrf6MIIYE4NZo/QEAuPhAFRZo+DP9
UGlRN4VyZELr3mPIjLY+grUb7XeIUwA=
=4KHE
-----END PGP SIGNATURE-----

--kz3CuFPJ65DTj9OM--
