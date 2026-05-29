Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69C3E92B4;
	Fri, 29 May 2026 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780072368; cv=none; b=cWDiGppyeXLdauAceBr/XL0lOdQ1z8xpkWt4qGUxiJPVex3byJiQ9lTHju5Wy6nKAjUr4JviiyBcJUAPGXmFuG6Yjhxj3pml9XLgdJ2+JmJRHwz/lryuZQr1Z3dnebbEu5tNMFxA41K/C8MTgIi3larR1W1iO4l45CTIXE3WIfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780072368; c=relaxed/simple;
	bh=F0eusMqTsmVOySOOobpQHl8ClXyjcHV6wDgvEo4tVP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXB43rJVVGecrAVAyA/gKEGabjE7DtjyflHFsLgMNLCJEGzOL/Y39C0Du/OHXhWjRrzxe1i6Wz6T4TZ9GWQ1eQRc6nkqv9dH6ZtSna3IAuW+eHAavsk4V6ablbQ03hDmsYYDOWuKgzy3PlVv5RZ+VOiZdNt1GStBYpcB0tEsv3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H41QF7v6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H41QF7v6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74091F00898;
	Fri, 29 May 2026 16:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780072367;
	bh=F0eusMqTsmVOySOOobpQHl8ClXyjcHV6wDgvEo4tVP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H41QF7v67iTCAiuXHcqn2XTdr9avXqAl9Mi9uTEu6Dk1ChLhE0j1om9ktPB+LcGhQ
	 zuKlkQzAxqhvcEc+Jrx+ai96WSs+vEV5cvn/2RCUuCXe/0TIDhR1g3dqc4ieb7ZhYB
	 G4d757/ynDcJ867kTe4Gvwxljg7uQLEVEaoSzSoEpGhmz1W/320NANEmMh9o76jxiG
	 gNUCovOZ4YCXzu26SKQgyUViCRHJ+saf1i2haabXh26Kwvtaqfi3wUUHBwkpUB8bvR
	 0wLOtbalODIblzuAcD5HMvIyeHB72oRpc0+yKzhO3imKcbuM0mbvKW2fvf3YxW+qEL
	 lPteVGO1x7IJw==
Date: Fri, 29 May 2026 17:32:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: Add LG LP156WF1
Message-ID: <20260529-neglector-reptile-871529be473a@spud>
References: <20260529110518.624454-4-ivitro@gmail.com>
 <20260529110518.624454-5-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BARr7Ixa8gc2gzG/"
Content-Disposition: inline
In-Reply-To: <20260529110518.624454-5-ivitro@gmail.com>


--BARr7Ixa8gc2gzG/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--BARr7Ixa8gc2gzG/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahm/qQAKCRB4tDGHoIJi
0tEtAQCdpXdaqBga6bfZCGQnQyl0kTI3NOSMeLXMs7pVoCNX2gD/cgIDJGUaHRsW
UfyqdBUswIjy4EqTy99yPm2J14WiHQA=
=D/7C
-----END PGP SIGNATURE-----

--BARr7Ixa8gc2gzG/--
