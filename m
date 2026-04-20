Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7321133F58E;
	Mon, 20 Apr 2026 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776700911; cv=none; b=flGmJ8f6KQ3SvNGGTGpih/KPjgA5H5+pwANlGZ6b6NLQnOY9irvQnRg2uBXzmrDK/N/7TWqUWtuPXfrXvaHXyirbqh61g8uhAlnk0CazRBRc1l0K09ysuWYkeJ0VC83q/QYkO7vc+NtrZMoXTfD50T8Xy7nCfmrV9ViAF0CStUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776700911; c=relaxed/simple;
	bh=TFfvYyf8eNA1jMBa/chl/2ph4XTsgB6/URx9v/wsFQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eH9Sk9DC4bysiAkHaNH2vIAZRPFGD/4TtzbsAvRp75aTO3yqWKIlyGKvcfma55AmQ4UWJtsVDJ6XCWFW/y0Br7AAe1mjvmfssJ8g6UaBvSMegd+iBr/tY8VFv4FHq4Ti05W6qARIesna9ZhkDTCEsX0xHlPfW0tLP9WTEbM9yGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzYk9Yj7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzYk9Yj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A534C2BCB6;
	Mon, 20 Apr 2026 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776700911;
	bh=TFfvYyf8eNA1jMBa/chl/2ph4XTsgB6/URx9v/wsFQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JzYk9Yj7Pnrv3DBUSzMOK7bC+dzLeYnjE39rK9y52m7xyOo8T2iglPOxBsvTVLEPb
	 A0WWrcGtXro5COv7MJwumpvo7PtsOjXC+cleU2gnih1ujR07VBJXO5kuQ0G+oQsjgL
	 Ta5jChXy7xPsv+lHl85AMLm/uWPLtRyH2JJavUkXkRE3DV/CRrp8iOVREZOz3fKt/6
	 R8H6//El6n0fvBxMx9LKih+27JQObszl2cZZliIHJCem3sJNiSjObZpewA4DQSkCeK
	 wNOs25/T/fzam6qv7HUoIKd2NELsCb/FZW1yyno1wcxl52O2NBRohbfam1ef0avxSj
	 5EkvIJKRVPyKg==
Date: Mon, 20 Apr 2026 17:01:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Raspberry Pi 7"
 DSI Display module panel
Message-ID: <20260420-elaborate-sulphate-45df36ab62ab@spud>
References: <20260420-rpi-7inch-v1-0-e68d5c9c44bc@ideasonboard.com>
 <20260420-rpi-7inch-v1-1-e68d5c9c44bc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RueKeo7KxlAH4OXJ"
Content-Disposition: inline
In-Reply-To: <20260420-rpi-7inch-v1-1-e68d5c9c44bc@ideasonboard.com>


--RueKeo7KxlAH4OXJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 04:13:35PM +0300, Tomi Valkeinen wrote:
> Add compatible string for panel used in Raspberry Pi 7" DSI Display
> module. The different display module versions have panels from multiple
> undisclosed vendors.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--RueKeo7KxlAH4OXJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZN6QAKCRB4tDGHoIJi
0oXnAP0aCo7RyHP7ZGVmtD6z3YTxQRmzy8Q17uHI3tw72fuG+gD8DgdiCX84T1YB
ENrbLPayE67iUaoCK7YHtvDGiLa3Kgw=
=FLqb
-----END PGP SIGNATURE-----

--RueKeo7KxlAH4OXJ--
