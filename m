Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1063859FD;
	Thu, 21 May 2026 16:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779382478; cv=none; b=hFAlLuAHnXC/uifhOsdoNea87CuHJ6M38260ebW2YahCtHLbHeJd0LAxO3khv6ZYX+PFVsjKnov04hNJ7IuwBfsy4GK3qStCjGrmii+xAxHzkKA1ORSB0eYjcOoAYRUh7oDONJpuugLcFOGGeXGwyy4ksb9xNDbKOiHFpp/2NA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779382478; c=relaxed/simple;
	bh=CPiUBM1CCh4+fwupCgXGj12p6AUKJ3ii5aw/UejUZUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBnmtj2DMsJIz4m/qGpV63VGgI61sASU85jynC9/Jm8tjNuFVreFQUHqUbWxRkqOaHLZAWXqhv4yAaqgqTcibE9am9xWStfYgrSHivDo1CpiOd9detO+92SZqv3d2BABxWmCm9L5a3IifAc4VzjG+nW/iOxwfXLpiC9toU2aDj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccZrLQhO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccZrLQhO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724C71F000E9;
	Thu, 21 May 2026 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779382476;
	bh=CPiUBM1CCh4+fwupCgXGj12p6AUKJ3ii5aw/UejUZUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ccZrLQhOqQ0tJYohaZqVI+HkRDzD8MClngR4ibpzHfdxbrTHjvuDld5kc9Sm05d1A
	 7A9ILnAX6gVNepqnmZutIezRg2vmEADM8h7xdBUHUsXKXWOW2LJlmYATKRxqLq7GGW
	 wO2+DTys2qrOWtjdSoTr7eBfvR1e3l2yBhUP52jQTHa9eLoMr69OiQm/bsavKgLTEy
	 cox8gCehzyV2UnZip5uZosgbGld0JDjw5ChOFP4NV96F/3jFWVAIYZQrPCI+x89qpb
	 7xkqubQv5rak0NWj73sNGQurQdb9Njmv3hmCrzZKeDpvu035qMP67jWldAuZWXscvp
	 CkLlWrsW5rThg==
Date: Thu, 21 May 2026 17:54:30 +0100
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
Subject: Re: [PATCH v1 04/15] dt-bindings: vendor-prefixes: Add Riverdi
Message-ID: <20260521-contest-paralegal-cc088842405d@spud>
References: <20260521150038.103538-17-ivitro@gmail.com>
 <20260521150038.103538-21-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdKBY2K+SjDfXSwL"
Content-Disposition: inline
In-Reply-To: <20260521150038.103538-21-ivitro@gmail.com>


--bdKBY2K+SjDfXSwL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--bdKBY2K+SjDfXSwL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag84xgAKCRB4tDGHoIJi
0gcFAQC4LpPl3BGoUACGvb8sFxOPR84XXJPFojWht4l7o5Cb4wD7BfeIUT2pXyx3
DETSdDP6P7I10GKFgqHRfxIZzz9P+gY=
=rwt5
-----END PGP SIGNATURE-----

--bdKBY2K+SjDfXSwL--
