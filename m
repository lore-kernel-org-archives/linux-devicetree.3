Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C4239CCFD
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 21:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788212314; cv=none; b=gMDFLa8PaOz9Ten5suAHazZwUwhps5yRqLuEcZP8pnL9dA1Qe1jDlwrOpRv2JiYK99KV4ViaQoqMzQOGwJ8StSHchzXdGFOWjI0lYQTsOw7qG9a5eDZcze09tDNTZzid0IHuQLheBsMdbkZ9cVQqw3d3X4k6TR3R/zk4VfT6JXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788212314; c=relaxed/simple;
	bh=/01Www36loZkModjvcY88BaOTXKUDcLoWPGzE7yZ734=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iuPMbHm2OsY1AoHBnWRBCTK3/qFBkpHKJw5kRMBFc5fhiBpSGGU+UV5EgSbBnKBrbBm/H2ElCfv/WHRlOi0pJeX03iRtNzMYkpIoZNE2QBjVlF5VWuzegwIND+vAZv5R53k5tiUxexpAAjnblf0ak2JNuQIjYF46+3D1rVewKLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QznOBsAA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QznOBsAA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA3E1F000E9;
	Mon, 31 Aug 2026 21:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788212312;
	bh=Aj2sYHkOnnYHaUmcNMf5rNs3RjB4AzzWCXKDkC6lK+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QznOBsAAzvp0KAvDIT5EuJCkGSZz4nrfAldXarTTCxv2ZUQ/Q9ymK4xUomCYH2dMf
	 G29WS6ybbsH8Sw4CC2yHZr0d3+EIA+WyHKBGc0TMTBrvxvRwaIBVRzBQ1T0Vaq02xA
	 chrmA1NGdILP8akiGlg8ZhErWTcEky2N/BfemaYo4vChKSxUovYn0MZncfg5Gy4akP
	 gIcQCNIcqvcOroaKZ7R0Vj92hgupDZaV0+c0qeSvIvQGYn9EmnIj/sATmWCcpy01qD
	 JTmWrMaOEeIdsMhOIkDsRCJv4Mpo9BVjLl8DR+wA9F+cxluRIBePbN9RNizlPQ9aiv
	 1VcDDqtr34/Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 4/8] phy: tegra: xusb: Use devm_clk_get_optional to
 fetch USB2 tracking clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Chang" <waynec@nvidia.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260831185835.3732707-5-waynec@nvidia.com>
References: <20260831185835.3732707-1-waynec@nvidia.com>
 <20260831185835.3732707-5-waynec@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 21:38:31 +0000
Message-Id: <20260831213832.2BA3E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double free of the pad structure on the `tegra_xusb_pad_init()` er=
ror path.
- [High] Improper use of `device_unregister()` for an un-added device cause=
s a NULL pointer dereference.
--

commit 0aeed6fcdb21e8c89c88a750c7002793b60d83d1
Author: Sing-Han Chen <singhanc@nvidia.com>

phy: tegra: xusb: Use devm_clk_get_optional to fetch USB2 tracking clock

This commit updates the USB2 PAD tracking clock fetching to use
devm_clk_get_optional, allowing the probe to continue if the optional
tracking clock is missing in the devicetree.

> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -1045,7 +1045,7 @@ tegra186_usb2_pad_probe(struct tegra_xusb_padctl *p=
adctl,
>  		goto out;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the error
handling around this initialization, I noticed a couple of pre-existing
issues in the failure path of tegra_xusb_pad_init() just above this change.

If dev_set_name() or device_add() fails in tegra_xusb_pad_init(), it jumps
to the unregister label and calls device_unregister(&pad->dev).

First, does calling device_unregister() on a device that was never fully=20
added cause a NULL pointer dereference? Since device_add() failed or wasn't
called, dev->p would be NULL. When device_del() is called internally, it
attempts to access dev->p->knode_parent, which seems like it would crash.
Should this strictly use put_device(&pad->dev) instead?

Second, if tegra_xusb_pad_init() fails, calling device_unregister() drops
the reference count to 0, which triggers tegra_xusb_pad_release() and its
associated pad-specific remove callback, executing the first free. However,
when the error is returned here to tegra186_usb2_pad_probe(), the code
explicitly calls kfree(usb2). Could this result in a double-free of the
usb2 structure?

> -	priv->usb2_trk_clk =3D devm_clk_get(&pad->dev, "trk");
> +	priv->usb2_trk_clk =3D devm_clk_get_optional(&pad->dev, "trk");
>  	if (IS_ERR(priv->usb2_trk_clk)) {
>  		err =3D PTR_ERR(priv->usb2_trk_clk);
>  		dev_dbg(&pad->dev, "failed to get usb2 trk clock: %d\n", err);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831185835.3732=
707-1-waynec@nvidia.com?part=3D4
