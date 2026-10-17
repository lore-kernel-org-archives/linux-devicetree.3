Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5F847F762
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792236055; cv=none; b=Is6KYJK3GEjDYe5MGA5ojXq77HVyk5eFDsJqPONyE+KpuCWNY0S4QY+xIo0m1ktMVSf/hqpAMLbccLDPlJ84nHDwXInVDkzCu9fBmBSXGOneq4S+a3ZxqWKVtK1DMp3YLUKcwZAoiO9b/E67MrqrcCK3AnV+n0rBVF5NlSLKx2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792236055; c=relaxed/simple;
	bh=8OA0voCDpLDbofrOzXd7nf71veI29jGVqj+54srnJek=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nPNBhBHsnkluZOYkFdWg+N43F8IpHE+8kI8dmySola6gFKSveSh9rQUUeBdnWIMq7DVuGeTj6GMCgGWAw3x8ddYo1ONAfOcB7s4DLAcvVgkcqD1oA3vF9FdGIcpaAT5GXAVrYuRPsG9eJL7MEFkfKx6yev8nAC3XQVje3wGV3lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1+46nEC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1+46nEC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9E11F000C6;
	Sat, 17 Oct 2026 11:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792236053;
	bh=QdSCvFF1LlYFe1m+zurp2tLeQZZTlmW2PQXLcgULyNI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o1+46nECcmrWjhfSVdO11ggYVQ1JrU+GajkaVnTCdpECp7Y3bxj6rsSLrrUh86+2x
	 8G5kft/hLSdewjCiRlDKci8roSQcLwMw3T7LYQAcwdZ/BPg7CmHCdXfWrG0Shvvt26
	 3k/5u481tbKCiEwMniXdiRfNvsbYWbzqxBsiWS66xbVEDQrQSM7Ad/f1iJPc+RCl/r
	 x2h8TQWNK/EQMNXA34gSDrppsxiPZxMT6tKv/xoAJQYvGHoXGkfnSBs/K89MjOqPlr
	 v/X6Mmkq8yDzrc0LS2oXbgdP39sKSKDvTFfzhHo4aUYw80qsfSombJAvxcWTNk6GCp
	 c6rWL3ufdhDNQ==
Message-ID: <sashiko-outbox-175491@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 3/5] net: phy: mxl-gpy: release MxL86211C
 Super Isolate
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016112033.949026-3-robert.marko@sartura.hr>
References: <20261016112033.949026-1-robert.marko@sartura.hr>
 <20261016112033.949026-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 11:20:53 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: phy: mxl-gpy: firmware version read while PHY is halted
--

commit 2628bcaa4964186af3313096275fe989a084332d
Author: Robert Marko <robert.marko@sartura.hr>

net: phy: mxl-gpy: release MxL86211C Super Isolate

This commit modifies the driver to release the MxL86211C Super Isolate
mode in config_init rather than probe. This ensures both MDIO pad voltage
and Super Isolate settings are restored after each hardware reset.

> diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
> index fbac7c49b4759..8bc119655f104 100644
> --- a/drivers/net/phy/mxl-gpy.c
> +++ b/drivers/net/phy/mxl-gpy.c
[ ... ]
> @@ -422,6 +423,23 @@ static int mxl86211c_configure_mdio_voltage(struct p=
hy_device *phydev,
>  			      VSPEC1_PM_CTRL_MDIO_VOL, val);
>  }
> =20
> +static int mxl86211c_config_init(struct phy_device *phydev)
> +{
> +	struct gpy_priv *priv =3D phydev->priv;
> +	int ret;
> +
> +	ret =3D mxl86211c_configure_mdio_voltage(phydev, priv->vddp);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D phy_modify_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_PM_CTRL,
> +			     VSPEC1_PM_CTRL_SI, 0);

[Severity: Medium]
Will this delay in releasing Super Isolate cause gpy_probe() to read an
incorrect firmware version?

If the MxL86211C PHY is strapped into Super Isolate mode, it remains halted
after reset. During device registration, mxl86211c_probe() executes and
invokes gpy_probe() which attempts to read the firmware version:

drivers/net/phy/mxl-gpy.c:gpy_probe() {
    ...
    fw_version =3D phy_read(phydev, PHY_FWV);
    if (fw_version < 0)
        return fw_version;
    priv->fw_major =3D FIELD_GET(PHY_FWV_MAJOR_MASK, fw_version);
    priv->fw_minor =3D FIELD_GET(PHY_FWV_MINOR_MASK, fw_version);
    ...
}

Because the release of the Super Isolate bit (VSPEC1_PM_CTRL_SI) is
deferred here to mxl86211c_config_init(), the PHY microcontroller is
still halted during the probe path.

Could this cause the driver to cache an incorrect firmware version
(likely 0.0), potentially breaking firmware-specific logic like the
workarounds in gpy_sgmii_need_reaneg() and gpy115_loopback()?

> +	if (ret)
> +		return ret;
> +
> +	return gpy21x_config_init(phydev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016112033.9490=
26-1-robert.marko@sartura.hr?part=3D3
