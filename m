Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D07385D7C;
	Tue, 12 May 2026 17:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605894; cv=none; b=pAoJyfwN8duv7eInSE50MySQVsBPpdtRt8Le1byWdGSgm+pwr6C/x2/n2+u11C4Z3zEJ4fJiKcMREOL8rqQOoMF1r+EQGTSzHtUMZBVYnnynyDiN5gv40uhhkzfoVvDIes+hBVCJVfcE0iU9DxZGKu8GvybQo7Nbh03oz+2gZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605894; c=relaxed/simple;
	bh=PM7Hsk7rCZ7i7ss0DWokkdpyP/aaxTsbqAbCbIJEgO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mlsz391sgiPRpK5nCNIWWp8yE4Hj+QMjxhkaGKzKXToPCBlwZlnD9EBkQH6vezqHQLYc6+vKfWC17k/VAEF4vld2Xm748udpMe2WGiVx4l4cfhkY3euiZA285SUTH5lvhRUIqrkRkQGwXrng45wkTUAKFWlyggIMXIDThc5BmNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dx/RlZ20; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dx/RlZ20"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B3FC2BCB0;
	Tue, 12 May 2026 17:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778605893;
	bh=PM7Hsk7rCZ7i7ss0DWokkdpyP/aaxTsbqAbCbIJEgO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dx/RlZ20DHNQSDtLHsoojSgNx5+PmGzfx6uY+qJpWhuz9d4XDZqu1YIQcpSCyyxjs
	 4akB56wGOcega4tbyEQ1CNnW/foikCpjYjj5hNglKjM6d/QRS0aMHioQMpyJtSrz/r
	 8K3W7/VJBIIpVjq6MoN/e+J1UcvE4GetAimajeSBYCHa4+uQBUwunbD+4Q6DDfYLYR
	 i1FeJFd+DnPmJ3KXturPPx5uRUAPrkGX7U1114grF1oHAFZmcktaMXNz/GjZdFPQeb
	 33jEyLQatlsAtya1GEtTpoxhay1gozyGmDqRZukaVKxXhihm4ForjIdaPg307qba8m
	 4fvM5Ftlo9Xng==
Date: Tue, 12 May 2026 18:11:26 +0100
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
Subject: Re: [PATCH v4 02/10] dt-bindings: display: rockchip: analogix-dp:
 Add per-clock descriptions
Message-ID: <20260512-unmoral-jacket-265a50cb4ea8@spud>
References: <20260512095644.1946084-1-damon.ding@rock-chips.com>
 <20260512095644.1946084-3-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xz/8nfi28M2rs0iV"
Content-Disposition: inline
In-Reply-To: <20260512095644.1946084-3-damon.ding@rock-chips.com>


--xz/8nfi28M2rs0iV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--xz/8nfi28M2rs0iV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNfPgAKCRB4tDGHoIJi
0sU8AP4vxmovvT1OpZFfAxAwr95num10Rou4WT2dmzmv35Q8YwD/ZdnsttL9jh2J
o7mrpvcV9tKvqbzCroKr/tILpzRIHAY=
=kWPn
-----END PGP SIGNATURE-----

--xz/8nfi28M2rs0iV--
