Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA83B7B68
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885105; cv=none; b=MmKSYBNIulZQZcPzteRa+A0otLqa5cZRSUsrNv5h5ePUCun0IhIwij2WjZBmLpC7KZZtrovfcUO9FVFzoxRWhwM/xw3bhQvpQ6MdXAvVhR51lKWaHomV/0CcozFyK35MankfWXoZlpJsYA2+jU/ZjSawbA9+t0qJjZ3CWmdc7Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885105; c=relaxed/simple;
	bh=HxlN2RQYrmFhhrN+DFMkR8pkMwukJNomPC97r2mg9fY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CezeavchgS4jbSChy+d5qXPRjllaRg1n10c8kxnBlnq9XHlGdCt0s7tdCmMXgCZajVg50Wa/S1Vy1S5K1RSciAvvYkZKXvXZwItMtWqNvcRrK6qjgTREihyvg6IIg9icTNCR55XPHHANEBGsmFFSDJUhx4Y+Sd2wRt+8rpvIe1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjWLQVFA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjWLQVFA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE181F00893;
	Tue, 13 Oct 2026 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885103;
	bh=YDEuDZT6EORRtuk5UCN0zAYkhAiTjp+w0t/mN21NcmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SjWLQVFAxU8AyIsNLyxs2MtLiM1KZScDjT5ItNAVnWd9e5v2iVlsI8saZoJCMGYv1
	 rbn2/V/0lpfZi+sOlWPkxX8UFsyDfQjalWqC5n58CfNqo8s36/ffZtqh1Ys7j3dAJy
	 0g11Lb1wAG2btFdgCvCV5sxR6GVvb9IOXQXU6jtmUvzdf3EZWF7T3Ub6RZ5E3hOW0p
	 JLoBEgxipmJ3h/LcSqqzdMvyQxJzOmOZf11z66bDU56arI2rIARnO2oEXIwFhdlfTf
	 0JziOkwi+rnsoNFUk6lpoUx/q4b1iTiVDOqUk6QTx2hwBoiuZeH30EEmT7nEIXtOmI
	 Mg5ca7RyxxjTA==
Message-ID: <sashiko-outbox-169390@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/13] drm/client: splash: add a device tree image
 source
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TcOgeGltIFBlZHJhemEgUGFkaWxsYQ==?= <maximpedraza@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013093243.505776-8-maximpedraza@gmail.com>
References: <20261013093243.505776-1-maximpedraza@gmail.com>
 <20261013093243.505776-8-maximpedraza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 09:51:43 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of: use-after-free of DT property data due to premature of_node_pu=
t()
--

commit 98dbc79d3322b530cd1f8ff31d16dc494f5db1c5
Author: M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com>

    drm/client: splash: add a device tree image source

    This commit adds a device tree image source for the splash client,
    allowing it to load a BMP image from a boot-logo node under /chosen
    in the device tree.

> diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clien=
ts/drm_splash.c
> index a7d6279541587..50842922a7f82 100644
> --- a/drivers/gpu/drm/clients/drm_splash.c
> +++ b/drivers/gpu/drm/clients/drm_splash.c
[ ... ]
> @@ -212,6 +223,114 @@ static int drm_splash_fw_request_bmp(struct drm_spl=
ash *splash)
[ ... ]
> +static int drm_splash_dt_load(struct drm_splash *splash, const u8 **data,
> +			      size_t *size)
> +{
> +	struct drm_client_dev *client =3D &splash->client;
> +	struct device_node *np;
> +	struct resource res;
> +	const void *prop;
> +	int len, ret =3D 0;
> +
> +	np =3D drm_splash_dt_node(splash);
> +	if (!np)
> +		return -ENOENT;
> +
> +	/*
> +	 * An image in the node is used in place: the device tree stays in
> +	 * memory for as long as the system runs, so there is nothing to copy
> +	 * and nothing to release.
> +	 */
> +	prop =3D of_get_property(np, "image", &len);
> +	if (prop) {
> +		*data =3D prop;
> +		*size =3D len;
> +		goto out_put;
> +	}
[ ... ]
> +out_put:
> +	of_node_put(np);
> +	return ret;
> +}

[Severity: High]
Does this code risk a use-after-free if the device tree node is dynamically
removed?

The comment notes the device tree stays in memory, but if device tree overl=
ays
are used and the node is dynamically removed, its properties will be freed
when the reference count reaches zero.

Here, drm_splash_dt_load() assigns the pointer from of_get_property() to
*data, but then immediately drops the reference to the device tree node by
calling of_node_put() before returning.=20

Later, the asynchronous render thread could read this freed memory when par=
sing
the BMP header and blitting the image via drm_splash_bmp_to_scanout().

Should the node reference be kept in struct drm_splash and only released
later in drm_splash_image_cleanup()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013093243.5057=
76-1-maximpedraza@gmail.com?part=3D7
