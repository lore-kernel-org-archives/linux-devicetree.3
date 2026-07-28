Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D83E3D98
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266210; cv=none; b=OEGqRtNTz7W8rox4ip/1I0zQC/iBHobkyOTFVsZy0Bh/hMyQtcjBx2pu676hvaFtblZ+WKkB07P0zVF4p18j2h1GpGhw+oniHFDA+unJ0RGRwAmLNJeRe4gZO+K3daK0Cyn5XGjPjsAzVv8PMmVZO3dyrnOUGx4CH+c1SCSps8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266210; c=relaxed/simple;
	bh=L4BdWppUxFsZHM8doAOmepsJHOJDbVQ6kSsqZ8qElRI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n5ygzu94Ny0oo1Rq+NDAdhn0emvpHh3apGU8VD2Nz1YcC5SpLk32Z1MfqERGpG6g/rWIXOTaMkIBmrwbN1BVvNVRWaQsSCnet6C+wiTu7BC4QWboDGFCE4gwxngEjMcjCXjuiEnKLyb7dVEki5Cd7stJ0irpRMKWV6YU0Wo/8iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0z5Cc2E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0z5Cc2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956721F00A3E;
	Tue, 28 Jul 2026 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785266203;
	bh=cB1TZyDNRIugpz+STBldDvNY19ncVExGEdHbEhveJTg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z0z5Cc2EPJNja1x6055b2N4FuH2x9IiMierOwH0imbUzpBILBBMFmylVJHvWguI1P
	 EzfqPQVEXvHtvt5pgcm+nVtRXky8rPU0en9hhY8A8IGfvVZSh0wKo3ipc7UX/uSENU
	 oftPF1mxi3hv9cA225/PaRm+JTGF1ZAKmTk6KXF3NAfYt1ySgZ1FQJ/dwx/oKAQfP1
	 bKPX1tZkXM+jEhvQB0LeyXth1YlbmjrnjC5obnW1NrPWnK2T7EpyrcEx48o1GoUPBq
	 z7rOoIF9yzyECCyofvhjdr0RZrHM38S3wM5c1HzFqy7DxSKX2Toa7nfHzryEHx3y/Y
	 lC26M/LAb/W0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 4/9] net: mdio: realtek-rtl9300: extend
 controller structure lifetime
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727191559.19617-5-markus.stockhausen@gmx.de>
References: <20260727191559.19617-1-markus.stockhausen@gmx.de>
 <20260727191559.19617-5-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 19:16:43 +0000
Message-Id: <20260728191643.956721F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Ineffective Fix / Unresolved Use-After-Free
--

--- Patch [4]: [PATCH net-next v8 4/9] net: mdio: realtek-rtl9300: extend c=
ontroller structure lifetime ---
commit b6df87c0a19bdf7cb3946cca13544583a9dac7fd
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: extend controller structure lifetime

This commit attempts to use a kref counter for the controller private data
to decouple its lifetime from the platform device and tie it to the MDIO
buses, aiming to prevent a use-after-free during teardown.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> index 3dee5bff41349..9529f877248ba 100644
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c

[ ... ]

> @@ -617,6 +634,11 @@ static int otto_emdio_probe_one(struct device *dev, =
struct otto_emdio_priv *priv
> =20
>  	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%d", dev_name(dev), mdio_bus);
> =20
> +	kref_get(&priv->kref);
> +	err =3D devm_add_action_or_reset(dev, otto_emdio_cleanup_bus, priv);
> +	if (err)
> +		return dev_err_probe(dev, err, "cannot register cleanup action\n");
> +

[Severity: High]
This is a pre-existing issue, but does this approach actually decouple the
lifetime from the platform device?

In otto_emdio_probe_one(), registering the cleanup action against the
platform device (dev) via devm_add_action_or_reset() means
devres_release_all() will still execute otto_emdio_cleanup_bus()
synchronously during the platform device unbind phase.

Won't this drop the kref to 0 and free the priv structure at the exact same
time as the old devm_kzalloc() teardown would have, regardless of whether
the mii_bus objects are kept alive by external references?

If the mii_bus objects outlive the platform device unbind, could accessing
bus operations still dereference the freed priv pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727191559.1961=
7-1-markus.stockhausen@gmx.de?part=3D4
