Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634543AAF5A;
	Mon, 17 Aug 2026 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983661; cv=pass; b=WHEeIh7eOSw+JRXkn/FKM+u9OeguG7Ms3sjl572Ctc/9LTSKxjfLn4rX/lDaHZdSGacF69mu+BiGhL2w6CPMb9JliXiuPwW1rXv+J2yhLItVo0lu2z06SZqar+QSe25l71zg3NPjbTORqvVYHqn8WsAgcg6ho/xWzNuujzTrB+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983661; c=relaxed/simple;
	bh=7n3aQEgRFkpa4imNcFT6FIuOLaFYM8Gg1fUCIIxm0ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=or0RJgqGRTINQgTCwF9HIBPtRyrChRQUSxhAhZMWisO5JttD3MkHVdMVhhrPxVVyATA6tarIFMl79VhwZUKVmAxsK6KCEq9dWtG9zrHRl9ZyJauzRaEY5FtZAr6QIAx0ZPBMXQ9jR1tG1/wyEUvwqxBrWfBa976DHfs25c7tX+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=W2NS3n8H; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="W2NS3n8H"
ARC-Seal: i=1; a=rsa-sha256; t=1786983588; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xr8qyASLoDgQ2DjiqPrEPNFn9Up3WmtOy3y8eb3DEHDR65PciA/p0wJPP3OQ/o27Nwwp2tAVIDJr+IMA5+TBXFdXcJnUy2rSV0IbepDwbZz9Lq3lSINS/HRkfv9DlMsQRHDrtBB6sYHrc9ZvqiCH6pWR1XMGd2l4nCtaYlMuYyA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786983588; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xzNR0kuhuJBFEV0f82GT0CErGpD2go5KMmOhRyLWgCI=; 
	b=XXIIbKa2RLX/5PZfNWuexqcRzDnHHvw3u9tpLiY4CF6vAQicYvuhUkfBySZ3YY5MfY50qftNXBS3QslkmHQeECgHikjSgTvf8NdbeE7jWmhl46VMs/hDaA2Dv/Ms5yR6Mh5gBOBI1wuKr5wP65e7UJLxqNn1ifI3DAQXv6W9Oug=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786983588;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=xzNR0kuhuJBFEV0f82GT0CErGpD2go5KMmOhRyLWgCI=;
	b=W2NS3n8HZey3KIRtc8L/1VaoVfRELxoyzSIg0FUREnTIz3aD24iyMRBHdnl+bo9G
	vNde7evp7rssgxpHWcVT7FwPJri3RzgqELGWqiQM1DvQdjPPZmqoyLbfaFp6Y9TrFKW
	EpHLsTjzhxn5JSeroAMBWwhK0LePxsgOfMjPvzQg=
Received: by mx.zohomail.com with SMTPS id 1786983584671747.0867418837129;
	Mon, 17 Aug 2026 09:19:44 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 401A7182033; Mon, 17 Aug 2026 18:19:37 +0200 (CEST)
Date: Mon, 17 Aug 2026 18:19:37 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
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
	Philipp Zabel <p.zabel@pengutronix.de>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v11 01/21] drm/bridge: synopsys: dw-dp: Register DP AUX
 on bridge attach
Message-ID: <aoM0KMBoIpIQ5vnw@venus>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-1-0d508505f383@collabora.com>
 <39274bba.18a3.1a00a939caf.Coremail.andyshrk@163.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u5w64ha2nlvvjth4"
Content-Disposition: inline
In-Reply-To: <39274bba.18a3.1a00a939caf.Coremail.andyshrk@163.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/286.975.6
X-ZohoMailClient: External


--u5w64ha2nlvvjth4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v11 01/21] drm/bridge: synopsys: dw-dp: Register DP AUX
 on bridge attach
MIME-Version: 1.0

Hello Andy,

On Sun, Aug 16, 2026 at 08:37:21PM +0800, Andy Yan wrote:
> Hello Sebastian=EF=BC=8C
>=20
> At 2026-08-07 01:02:07, "Sebastian Reichel" <sebastian.reichel@collabora.=
com> wrote:
> >Unregister the DP AUX device at the right spot as documented in the
> >drm_dp_aux_register() function description. This helps that it is
> >only accessed when the DRM device is ready and the bridge is powered
> >and initialized (further fixes are required for that).
> >
> >Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller suppo=
rt library")
> >Reported-by: Sashiko <sashiko-bot@kernel.org>
> >Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >---
> > drivers/gpu/drm/bridge/synopsys/dw-dp.c | 55 +++++++++++++++++++++-----=
-------
> > 1 file changed, 35 insertions(+), 20 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/b=
ridge/synopsys/dw-dp.c
> >index 8b8529e1723c..60feb3d1e14b 100644
> >--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> >+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> >@@ -1813,7 +1813,36 @@ static struct drm_bridge_state *dw_dp_bridge_atom=
ic_duplicate_state(struct drm_b
> > 	return &state->base;
> > }
> >=20
> >+static int dw_dp_bridge_attach(struct drm_bridge *bridge,
> >+			       struct drm_encoder *encoder,
> >+			       enum drm_bridge_attach_flags flags)
> >+{
> >+	struct dw_dp *dp =3D bridge_to_dp(bridge);
> >+	struct device *dev =3D dp->dev;
> >+	int ret;
> >+
> >+	dp->aux.dev =3D dev;
> >+	dp->aux.drm_dev =3D encoder->dev;
> >+	dp->aux.name =3D dev_name(dev);
> >+	dp->aux.transfer =3D dw_dp_aux_transfer;
> >+
> >+	ret =3D drm_dp_aux_register(&dp->aux);
> >+	if (ret)
> >+		dev_err(dev, "Aux register failed: %d\n", ret);
> >+
> >+	return ret;
> >+}
> >+
> >+static void dw_dp_bridge_detach(struct drm_bridge *bridge)
> >+{
> >+	struct dw_dp *dp =3D bridge_to_dp(bridge);
> >+
> >+	drm_dp_aux_unregister(&dp->aux);
> >+}
> >+
> > static const struct drm_bridge_funcs dw_dp_bridge_funcs =3D {
> >+	.attach =3D dw_dp_bridge_attach,
> >+	.detach =3D dw_dp_bridge_detach,
> > 	.atomic_duplicate_state =3D dw_dp_bridge_atomic_duplicate_state,
> > 	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > 	.atomic_create_state =3D drm_atomic_helper_bridge_create_state,
> >@@ -2043,20 +2072,10 @@ struct dw_dp *dw_dp_bind(struct device *dev, str=
uct drm_encoder *encoder,
> > 	if (ret)
> > 		return ERR_PTR(ret);
> >=20
> >-	dp->aux.dev =3D dev;
> >-	dp->aux.drm_dev =3D encoder->dev;
> >-	dp->aux.name =3D dev_name(dev);
> >-	dp->aux.transfer =3D dw_dp_aux_transfer;
> >-	ret =3D drm_dp_aux_register(&dp->aux);
> >-	if (ret) {
> >-		dev_err_probe(dev, ret, "Aux register failed\n");
> >-		return ERR_PTR(ret);
> >-	}
> >-
> > 	ret =3D drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_=
CONNECTOR);
> > 	if (ret) {
> > 		dev_err_probe(dev, ret, "Failed to attach bridge\n");
> >-		goto unregister_aux;
> >+		return ERR_PTR(ret);
> > 	}
> >=20
> > 	dw_dp_init_hw(dp);
> >@@ -2064,37 +2083,33 @@ struct dw_dp *dw_dp_bind(struct device *dev, str=
uct drm_encoder *encoder,
> > 	ret =3D phy_init(dp->phy);
> > 	if (ret) {
> > 		dev_err_probe(dev, ret, "phy init failed\n");
> >-		goto unregister_aux;
> >+		return ERR_PTR(ret);
> > 	}
> >=20
> > 	ret =3D devm_add_action_or_reset(dev, dw_dp_phy_exit, dp);
> > 	if (ret)
> >-		goto unregister_aux;
> >+		return ERR_PTR(ret);
> >=20
> > 	dp->irq =3D platform_get_irq(pdev, 0);
> > 	if (dp->irq < 0) {
> > 		ret =3D dp->irq;
> >-		goto unregister_aux;
> >+		return ERR_PTR(ret);
> > 	}
> >=20
> > 	ret =3D devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
> > 					IRQF_ONESHOT, dev_name(dev), dp);
> > 	if (ret) {
> > 		dev_err_probe(dev, ret, "failed to request irq\n");
>=20
>=20
>   After this patch[0]  is applied, there will be a conflict here.
>=20
>  [0]https://lore.kernel.org/all/20260723131649.134127-6-panchuang@vivo.co=
m/#t

This got applied after I send this. I do rebase to latest
drm-misc-next on every submission, so it will be fixed with the next
version.

Greetings,

-- Sebastian

>=20
>=20
> >-		goto unregister_aux;
> >+		return ERR_PTR(ret);
> > 	}
>=20
>=20
>=20
> >=20
> > 	return dp;
> >-
> >-unregister_aux:
> >-	drm_dp_aux_unregister(&dp->aux);
> >-	return ERR_PTR(ret);
> > }
> > EXPORT_SYMBOL_GPL(dw_dp_bind);
> >=20
> > void dw_dp_unbind(struct dw_dp *dp)
> > {
> >-	drm_dp_aux_unregister(&dp->aux);
> >+	/* nothing to do */
> > }
> > EXPORT_SYMBOL_GPL(dw_dp_unbind);
> >=20
> >
> >--=20
> >2.53.0
> >

--u5w64ha2nlvvjth4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqDNJUACgkQ2O7X88g7
+poGaxAAgeNiIBmqZCzTK0GPvq5iKwuyIr8+xL44ArVV7Lqm9EAor3E8wc7d7rZz
/uXUPWw76k/rt+tba7ZwpwtjdXIYIc7uvq9x6HyCIxUeAjPemr5q4iLF/eK5o4XF
flNISlAmFhzvmRL9doDKsZri1TclNHl+JzJUieSQEOlkZtFF6Bw/elJ2WUV7dFdS
gs+t5Rig5fOpfdOgDyWWs3NBhUWe818KXfHtUMoX7FsHAGb8Al5p9WN3ARCc4rYp
mRggpOE/EVgD+KMsUXSC/k3iVdNOKAHBwMbJ0burCj69G4iS+TaVtINHR0tzmivj
9B+1/9Kh29D+sLT3gVB4QjPvGnrtft1/xmB3Y9PLuUePZrpjGmSGmvrE9Me8FDsg
J9hEBp+xl0LdcQDAj3ifbJNFqUl2f3VWF47snIkMahGty6WB2/zIgO/UIC2mbMB0
GjUHEqJxiPNrHBi/nIEx+XYpky7Xa2T9mRmWea+Md6gRybg/bdGlF0ji+QVxH8tu
5kURLI73p0w9h3Xn6SRREfZqMc2JmbaE+S++dJXlbabBiaWRGNaozxU9XnfNwKpQ
D4jn540HXz9efN8iIazaZ2lXhsO89sr4/xbxzSS84ao9e8M3xGjsCaSFBeeTPBjs
x9BLlJqK4I9iQCmeeQn8zGTxmHWOuQV8wOa6YBys9f0ohByuusU=
=3lJR
-----END PGP SIGNATURE-----

--u5w64ha2nlvvjth4--
