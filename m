Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E623F23CF;
	Tue,  2 Jun 2026 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419713; cv=none; b=if4e82YNzq4EHaB76x+nUboFSfiDHW22NvY5m1egJ7/9A98vXQ+5Ilzf+Gv3EVKJVKm9Pd562V47cL9oijiaYag47wUs4dewDTQN+D6yOeQiA/pw7Rshye0llLqOCwavtnN6S+dkjBBEjO5RUF6n80RDq3fpDwnid031+FVwUgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419713; c=relaxed/simple;
	bh=DFC1w7p/0qB073AfNGNffsBQG0WW8QDMDzU+cxdEF3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2sPGYD7vgeVygsDbb9HSnF9O11bstn/mmlY2YM/mMgH4joqrvcV+t/pVfWYKl6YcVwyx+il7PJNb6KxbrvPCZkydILRNft67O7esbxHKfUGaFHGRhq7gGmMrb0lrl9zpx/IZ+MZUGBqk55R2VLC5H1heika6F8uFOen7SN3BlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bky1Jb/N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bky1Jb/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3568C1F00893;
	Tue,  2 Jun 2026 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419712;
	bh=DFC1w7p/0qB073AfNGNffsBQG0WW8QDMDzU+cxdEF3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bky1Jb/NZnBNnpwQWDthgWcFz+0+/2sBzSQPyI4DBzbC+DqHPsQmwq0TIDeA3S8YQ
	 4GztI70qPsv4c3cr5aC9lAbt9fvpuEXpELLyzEc17RtM1X4AQ0n58ujkkJRUENg1D5
	 9wu/KclcM6CCvBteSIE0h4HHUOHL1NChBZsVLDtJAAEphTkxQcHBiivFS9f+9tFvrA
	 ZIQjPG/h0IYzH10Q7LnC4m1+j3RhmjVqGPcAAW0deWQCP/Iw6YnShJVWe9nxvH0c3G
	 3UeILGuiQ3G2yL7WwjrlStDjgys4kA/sU0Lrn3ALZ2c9yROXndGMFuL0RZ3LcyzYla
	 dVsXrxwU/V46A==
Date: Tue, 2 Jun 2026 18:01:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com, cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com, dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com, dianders@chromium.org,
	m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 01/11] dt-bindings: display: rockchip: analogix-dp:
 Fix hclk as third clock for RK3588
Message-ID: <20260602-cranial-aerobics-9db5af2159ec@spud>
References: <20260601065100.1103873-1-damon.ding@rock-chips.com>
 <20260601065100.1103873-2-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tXJ/OuPN5ucFNEVK"
Content-Disposition: inline
In-Reply-To: <20260601065100.1103873-2-damon.ding@rock-chips.com>


--tXJ/OuPN5ucFNEVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--tXJ/OuPN5ucFNEVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8MeQAKCRB4tDGHoIJi
0qXGAQD9vbj7tixbtiXhoJz2EzXrSh78kjxJNRDo8PGjKDfIbgEA2afp9CeVcHz9
lbuu8IN7ZAF7QMTIEkFKWyqOc2Z6rgQ=
=7N8P
-----END PGP SIGNATURE-----

--tXJ/OuPN5ucFNEVK--
