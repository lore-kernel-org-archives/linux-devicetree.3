Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3503D3D5C1C;
	Fri, 12 Jun 2026 16:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781282321; cv=pass; b=qg/Yc0UunQrM9cdyOXy4ncdD7nVZo3tTsR70ybkNq2qrzoE8/8VHy6A8UKrYZtf+eLF6tDRg6bwHixmDfFEnPE+AatiHZ411g0NJzU5PUY/11sQUpbfuntrfeZMn9mzvfDfGRoe38jZA6GCOYw2KEwYnuX8Q3hh4Nc5fwFto8d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781282321; c=relaxed/simple;
	bh=kMnr/NncewUs8tafq5klrb7gDwGDQaMhg7RkfiMC45I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRMoMtCOWIwcE7Tb1/Xo9mc6bQG+azf+u78gT3C41XdD+W3cQLOytun/+jLPEWB9zdPZ/SIpg4Y4hz6rO8Tpj7ioxZi5giebdAqFbB4woErntqYKhKhx4QcSDiTq9fMzR4N5EeJBm3Vr4YHlBJYT3jS+CeUXTxBqjBFMn8ZWq3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=NrYnVgKT; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="NrYnVgKT"
ARC-Seal: i=1; a=rsa-sha256; t=1781282271; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eZbpZFrHare2ZkdyH2mlS82J2OCdJQ4FvrBiaxu5MQloDqfweBtlqgapAo2lvzBt/VsowUDAujoDmKh65ObWl2o9FTfqFbJmFX64Py2iap5xUUjw2P9BmhpSmHjdqLxJi20fVF60QhdEAJSM9/j+mXPmTwVNjlA8khCCJNdtaoU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781282271; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cz0JvF5PqRn4+AvgydKR6qxMt5tufCqZlm71fI/zQJE=; 
	b=U1OSMKMnKPRcdT3LGdJ9VC6S/CrZw9aAwSXQDBEYAuJ7e64Csg2DoHKybxTI6IexcBZqopKtLYW5JwhhFIWckO3jyg2dLeluzcISdClCsJT2kYJDH2vJa7O3dur70uX6BMsPHc0Xl4hMPjSPswZlIWAjQwFwAXDwKEvOnIHu2wA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781282271;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=cz0JvF5PqRn4+AvgydKR6qxMt5tufCqZlm71fI/zQJE=;
	b=NrYnVgKTaiUOijL3nFNPT0GRc59JHJygJH2GXurDQ5WU52i418+IzzG+cEvPYoFN
	7wHye0F8/N56hPz0k3y9yYCWJuFbkwsvM1vBOEi7wwMnrtnA3Tq/o9ioKDM8LwQ7yZj
	fesFoG4rCqM5kfcfuRp9ZlpxUwEpeG0dKw9fuqj8=
Received: by mx.zohomail.com with SMTPS id 1781282268882444.94252128935307;
	Fri, 12 Jun 2026 09:37:48 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 137D8180674; Fri, 12 Jun 2026 18:37:42 +0200 (CEST)
Date: Fri, 12 Jun 2026 18:37:42 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 07/12] drm/rockchip: dw_dp: Implement out-of-band HPD
 handling
Message-ID: <aiw0VKuj6Y6tpr9f@venus>
References: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
 <20260501-synopsys-dw-dp-improvements-v2-7-d7e7f6bac77f@collabora.com>
 <4f4ff085-80ae-4144-b040-be9b136574ee@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p2h2tj3fgjiazqvf"
Content-Disposition: inline
In-Reply-To: <4f4ff085-80ae-4144-b040-be9b136574ee@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/281.270.71
X-ZohoMailClient: External


--p2h2tj3fgjiazqvf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 07/12] drm/rockchip: dw_dp: Implement out-of-band HPD
 handling
MIME-Version: 1.0

Hello Chaoyi,

On Tue, Jun 02, 2026 at 04:30:59PM +0800, Chaoyi Chen wrote:
> On 5/1/2026 6:20 AM, Sebastian Reichel wrote:
> > Implement out-of-band hotplug handling, which will be used to receive
> > external hotplug information from the USB-C state machine. This is
> > currently handled by the USBDP PHY, which brings quite some trouble
> > as the register being accessed requires the power-domain from the DP
> > controller and also requires custom TypeC HPD info parsing in the
> > USBDP PHY driver.
> >=20
> > In contrast to the USBDP PHY this does not just enable the hotplug
> > signal when a DP AltMode capable adapter is plugged in, but instead
> > properly detects if a cable is plugged in for things like USB-C to
> > HDMI adapters.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> [...]
>=20
> > +static void dw_dp_rockchip_hpd_sw_cfg(void *data, bool hpd)
> > +{
> > +	struct rockchip_dw_dp *dp =3D data;
> > +	u32 hpd_reg =3D dp->pdata->hpd_reg[dp->id];
> > +
> > +	dev_dbg(dp->dev, "Force HPD connected=3D%s\n", str_yes_no(hpd));
> > +
> > +	dp->hpd_cfg =3D hpd;
> > +
> > +	regmap_write(dp->vo_grf, hpd_reg,
> > +		     FIELD_PREP_WM16_CONST(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, dp->hpd_=
cfg));
>=20
> FIELD_PREP_WM16() should be used here because "dp->hpd_cfg" is not
> a constant expression.
>=20
> Other patches in this series have similar issues. Doesn't your
> compiler warn you about this? Thanks.

The code builds warning free for me. Also FIELD_PREP_WM16_CONST
requies that the mask is constant, which is the first argument
(i.e. ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG in this case). The second
argument should be fine as a variable as far as I can tell.

But since FIELD_PREP_WM16 is shorter anyways, gives better error
handling and can be used for all occuances in the dw-dp rockchip
glue I will use that instead.

Thanks,

-- Sebastian

--p2h2tj3fgjiazqvf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmosNdIACgkQ2O7X88g7
+pr0qRAAj815LPOHnJWGnjzNNkUa/kzLFB4bzesaxqb+wG3aeeh0mPO+oeA95BCm
SAJ+4pmlt2gMl+ubhV57wIpAqet9TkklmWL1mJjItmbqTWUYO4juygwWu/BuqMBx
fXdKK6ypbX6wXEfKSA2dfXsjIdAWI1U0w3Ur/tUbWHoaf/18RczSbqaQZo1djjBm
oszzKbkhNm+y4IN+FgKWKwTWsEjuPU3dO21LwSNU2BU2SwZKXuPeFC+oBOJgikpe
CtNKqtrU+IRnZTM0G8J00BthrRYV1wCT9e/LxMkEKXDcu1Y20UPoN9FIOvDKkjHZ
XgilvLd+sd05hogeeTyWHGZsJxj3hIjFQiHGzlxi9TU8/r/m/cVyMDIKfdWWYVVA
o83o7A1MSDm41PopcT1Ig1x/4EISnG5vl2hgXa6YPEEyc35SJc9p9ONxKx+q4V8z
uASra69imY+fuQumXJdBFFvKxw2JnGWqvgFWL2J5P6CI7tdhTQEf1FeJbg4JKMxN
+4iHaKWIkwvBni35M2cqX05bm2CXTXgMQfN8Y3PuBGdeB9tY+n2n8sCFB9CTJbRR
Z9FyB3EQdld6e2/X/dScExJyHuG4UBgbvys58QuoOd6F8XCFmxoIGpbCedQRMtJH
eFzckHF+qJfPxAYUfdtEkEK8VAFYb/8BFXBQPCxc0590XvbGvdI=
=qoV1
-----END PGP SIGNATURE-----

--p2h2tj3fgjiazqvf--
