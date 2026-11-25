Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612752;
	b=KWQL+a3kg+pkVR+kMNtuVnG6aj+AO915rAdcbV60KqGPXf88a+YN8HRd6qvY5XdeE2If
	 C4MNwKUPX2bMelHV1mU2f0dmvYGBRD6kjiI8ZmdzqgCUgEdNq7LtVyqlDZMrqMPee5Nkc
	 NmuKH/QAUEAZM4rpvdkgzo4/gnm1YOTUsp+dS2TcyMQ99B9xY+dRvsEtVIh9uedM84ZPI
	 33PLqmj/j7gd/AGRoRkfr5CO2J8OX6X3ssd+yDWOn3X/mv6zIp1sOzuodOyjO4LEcWsmt
	 wwpIyabvsYVB8zfZZZg24aTZCoaZi5+M6QSot2Dyb10dbhdNFZPdObsIvvnrBTiiX0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612752;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PbJccsraF+zmfoV/jIneW4TmcHct+4DU8z1BavCW7HM=;
	b=eOcOp10baIfh73MZoJexEGglgFeWH+5QSPzQpytyz2fbetWvqg0VKkB9UQnnkyj5C31i
	 Ylvq3ybhV9MbiGzdbYWGPfj0Wg1eZRwJO2IZkKSpyD8TbgTpFM0eJz/Ir3PIJR2YTVqRl
	 2VjrKk5uVUT96ACMgEvU4XRL4bQiwo7hry9WLq3mZGPzqUYC3ZNQdpA79pckTC7zw4twM
	 6V3uho5DRjeIeVSeRB5ajnTUGFmfFta42gNeB/Cj5ewTcqcdwqWWfMd6w8/DQKVvnQoO4
	 6E4X1znmdg1qjUSdC8V0V8cjjUrKVTNrknBd6Oybrsflv4GOK+Rba57XbCF7CHSa0kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S8PcEWzU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACE3606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S8PcEWzU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8CE1F000CA;
	Wed, 25 Nov 2026 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612752;
	bh=PbJccsraF+zmfoV/jIneW4TmcHct+4DU8z1BavCW7HM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S8PcEWzUnsGT1EmsZ+lp4o9GkhdnC5MHg0MAXMoP3oeRXzqndBYxK3WeAK30ombYI
	 8Jyst/NlsevGAzN6f6mf6BTTz9xm11x5bIbUWJrQI4u3pqVpjCkjKH5/1//OFN1McX
	 1xLa+T//7apghJM0Lay1vO+UzLovRizMCcxOiRo/0qFT1ngOUcVKWpMAOIryXk8LtV
	 q709rsiBzjsecDCmZTW2SLkmAXEKoVwQojUH5LnjdKuPraq68+AuvyOQTwSvsz1gTd
	 gHduVDoOTQBgtQTiwVAolLErLGQ1FyetePbqLF6Y8gwGFmHPHZ8VpzkJXSxvkx9eM4
	 YwMOgIWOyLZng==
Message-ID: <sashiko-outbox-233481@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] drm/panel: lg-sw43408: keep VPNL paired with
 VDDI and reset deasserted
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-fix-blueline-panel-v3-4-914b4a30b73e@ixit.cz>
References: <20261125-fix-blueline-panel-v3-0-914b4a30b73e@ixit.cz>
 <20261125-fix-blueline-panel-v3-4-914b4a30b73e@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:19:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/panel: lg-sw43408: missing resume callback in
  sw43408_pm_ops
--

commit 503ce47692b3c0852447cd397b0dd17406adf4a7
Author: David Heidelberg <david@ixit.cz>

drm/panel: lg-sw43408: keep VPNL paired with VDDI and reset deasserted

This commit leaves reset_gpio deasserted across unprepare and keeps VPNL
enabled until VDDI is fully powered down, checking VDDI both in
sw43408_power_off() and from a late system sleep callback.

> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/p=
anel/panel-lg-sw43408.c
> index 7123ad18744cf..6854292bd99ca 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
[ ... ]
> @@ -57,14 +67,80 @@ static int sw43408_disable(struct drm_panel *panel)
[ ... ]
> +static int sw43408_suspend_late(struct device *dev)
> +{
> +	struct sw43408_panel *ctx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (ctx->base.prepared)
> +		return 0;
> +
> +	ret =3D sw43408_maybe_disable_vpnl(ctx);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
[ ... ]
> @@ -318,10 +408,15 @@ static int sw43408_probe(struct mipi_dsi_device *ds=
i)
>  	return devm_mipi_dsi_attach(&dsi->dev, dsi);
>  }
> =20
> +static const struct dev_pm_ops sw43408_pm_ops =3D {
> +	LATE_SYSTEM_SLEEP_PM_OPS(sw43408_suspend_late, NULL)
> +};

[Severity: High]
Does sw43408_pm_ops also need an early resume callback to re-enable vpnl
when vddi turns back on during system resume?

During system suspend, DRM unprepares the panel in .prepare
(dpu_pm_ops.prepare -> msm_kms_pm_prepare()), stmfts_suspend() drops the
touchscreen's vddi vote in .suspend, and sw43408_suspend_late() then sees
regulator_is_enabled(vddi) =3D=3D 0 and disables vpnl.

On resume, stmfts_resume() unconditionally re-enables vddi during the
.resume phase, while DRM does not resume the panel until .complete (or not
at all during resume if the display was blanked before suspend).  That
leaves the panel in the vddi-on, vpnl-off state across .resume, and when
sw43408_prepare() later runs, vddi is already held enabled by stmfts so
regulator_enable(vddi) does not power-cycle vddi to recover the DDIC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-fix-blueli=
ne-panel-v3-0-914b4a30b73e@ixit.cz?part=3D4
