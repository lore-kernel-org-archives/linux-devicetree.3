Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F94A3C945B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533532; cv=none; b=qnWP3PJ5yPGmZSc6U83T/zWBoJ4EkRVaa3VEJtxSSivPi4S1Uog4Qv/qKNaJtCO/h6rHz7d3RD9YB4bATwodT50L9F3pkxW7I2D8hPa493CNv86ZkfPeMaPua3WOpvrLfiGC5SAOg0zcCrBTIhbc/h+MDijdhBzsBz1SzuzLOug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533532; c=relaxed/simple;
	bh=ySFRq6JXWx7i7ehuWqaOx0R7fr539J5ByVyyh25R8GA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tof59dY5xVNCiacN8j0Eyn/ZFY9e474VcrRvoT+L1VQYr/oPAUpKjQjJhUrMmadDQViBTWoRuie/sB+unnU/afHDnw+fzHYtkp6/Uu3SCv1AiJpujwlKpsifUw4KHeDHAZ/zWlg+kkOjAbj59h/bRuKX6JZRfu72IqCZ0MtpXWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cI052l6z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cI052l6z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC3B1F000E9;
	Mon, 20 Jul 2026 07:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784533531;
	bh=GoLnLkAa0zJ93vJ2+fU9G2aU/GZC8+94HfmZFqFh5os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cI052l6zUMYzJD9JNUwnrgZ67cmqYka2Q9J/yn3Z9t3SJCb+6Q0XUV6ltIk9q3YOt
	 y2CFj9ImtMvmcPV069auTACrSjdPOlZnMJd8Irs5HhQV6eWkPVAF2fIhasdiKrEFF7
	 e6vb4x3OyWCl6HEwDhCft2IkhP0aKXkD7nmexRQv3IHrzlE08vI9dQ7H2QD2jYJ30n
	 TU6YeXxkbVjdgB7HCjlPsBrgS0xWq4WqTRIAI6REXqb/6OFM9rQNhMI1Kj8YvMLq2z
	 5pGWhNuZa86EIghlZAsjX8Z14qHFSzRHGveGDF/cGORfCs4rwwuQJktx2RoOhonOVh
	 XXuEbOo2n6Uvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] i3c: master: dw: Drop redundant core reset name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260720073510.1869623-3-shubhamsanjay.patil@amd.com>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
 <20260720073510.1869623-3-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 07:45:30 +0000
Message-Id: <20260720074530.DCC3B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Missing device wakeup in the remove path causes unbalanced devre=
s cleanup (double clock disable and double reset assert) if the device is i=
n runtime suspend.
--

--- Patch [2]: [PATCH v2 2/2] i3c: master: dw: Drop redundant core reset na=
me ---
commit 6e023481fe0a3988544e2173709b9f994efee394
Author: Shubham Patil <shubhamsanjay.patil@amd.com>

i3c: master: dw: Drop redundant core reset name

The DesignWare I3C master has a single reset line, so a dedicated
reset name is redundant. Look up the reset by index by passing NULL
instead of the "core_rst" name.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 2f8c0c4683e06..488fb455d3cc8 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1584,7 +1584,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *maste=
r,
>  		return PTR_ERR(master->pclk);
> =20
>  	master->core_rst =3D devm_reset_control_get_optional_exclusive_deassert=
ed(&pdev->dev,
> -										"core_rst");
> +										NULL);

[Severity: Medium]
This is a pre-existing issue, but touching this devm allocation raises a
question about how devres cleans up during driver unbind.

Since devm_reset_control_get_optional_exclusive_deasserted() and the earlier
devm_clk_get_enabled() register devres actions to assert resets and disable
clocks, does dw_i3c_common_remove() need to wake the device before teardown?

If the device is runtime suspended during driver unbind,
dw_i3c_master_runtime_suspend() has already disabled clocks and asserted the
reset. Because dw_i3c_common_remove() does not call pm_runtime_get_sync() to
resume the device:

void dw_i3c_common_remove(struct dw_i3c_master *master)
{
	i3c_master_unregister(&master->base);

	/* Balance pm_runtime_get_noresume() from probe() */
	if (master->quirks & DW_I3C_DISABLE_RUNTIME_PM_QUIRK)
		pm_runtime_put_noidle(master->dev);

	pm_runtime_disable(master->dev);
	pm_runtime_set_suspended(master->dev);
	pm_runtime_dont_use_autosuspend(master->dev);
}

The automatic devres cleanup will attempt to disable already-disabled clocks
and assert an already-asserted reset, which could trigger a noisy WARN from
the Common Clock Framework.

Could this double-cleanup be avoided by resuming the device before disabling
runtime PM in dw_i3c_common_remove()?

>  	if (IS_ERR(master->core_rst))
>  		return PTR_ERR(master->core_rst);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720073510.1869=
623-1-shubhamsanjay.patil@amd.com?part=3D2
