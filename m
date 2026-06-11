Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8AF30DEA6
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171886; cv=none; b=JRn5/YquBe4p6H+2lYEXMJpJnzLjLAGvne07N7pBRfY1kfRpD2qsSv7bLlR6A67mehIudpZtDsgo3I2N9s+OkM+E4s1K/em487g1jYJIWyaPCxkuwbPRWZMXnviCOxrMJNB5eOjt3Jyp+oBZhd34qYfAOdLbbOkxm3s3IDG3OJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171886; c=relaxed/simple;
	bh=BNWBerjGHNNtkRZMoqd7MfZJ5WM0vVxa0HhdJsmqWkE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=txhi0S7DRtEL9i9TPq0r1i1NzSRwlTvrfm4KayaiymLMXv565px+NJ0tLgbJaZ9Jeri169FeQIgg4+VHTT2YoVdpsxoyaaIabpiZBcJB2Hfkg8D0MomnxxG2JpVzoUyrxxtMfSEUqmGWSQeNEFtRZWg+bJDkFozY1yWkR1VKRCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7+rPqhE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7+rPqhE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B6A1F00893;
	Thu, 11 Jun 2026 09:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171885;
	bh=q+dxmYtpHcYtF8QVZUBDQ1cNXRJv/Ixt5XlxfprjO4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k7+rPqhEJJulNCe9xG+bjMktz7IkoBiVgCCuOJIE/UqGHGcq7AujSl7ocZdKT6vWs
	 f+FZRL31Q7a/BcQ2v4OmFsJgRlmLdobrDUAS5yTlcUgwPbPvzgQmtuGhFzuiqTs2Rw
	 L6d9Lu/FEL+YNb14C8SnfV6AKMONOJxnJdO4C7WKaZ3UHf9aFkLJHI8ipRY00djz17
	 ypr5zcFVn6ww8Xn2VyF4aHF8mUPPN/qR+895GNmnykHQGFk5yOZeH2pclLZM1LjTV3
	 GSzCEKeIC9l4NF4sxlg71VRXQjg1lVk9pVjlfSM5GfimGx7uXMkOV/RsARNvux7Bmd
	 0Z4YnahBmrr0w==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v1 3/6] net: stmmac: Add register NCSI device support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610072420.64699-4-minda.chen@starfivetech.com>
References: <20260610072420.64699-4-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:58:04 +0000
Message-Id: <20260611095804.C9B6A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unregistering the NCSI device before the netdevice in `stmmac_dvr_=
remove` causes a use-after-free.
- [Medium] IRQs requested in `__stmmac_open` are leaked if `ncsi_start_dev(=
)` fails.
- [Medium] Early error return in `stmmac_probe_config_dt` leaks the OF node=
 reference for `phy-handle`.
- [Low] Unbalanced `netif_carrier_on()` when `ncsi_start_dev()` fails.
--

commit cde45e5227e87c535d6fe7fb8ee4f8048e15a5e6
Author: Minda Chen <minda.chen@starfivetech.com>

net: stmmac: Add register NCSI device support

Add stmmac register support. The register NCSI code is almost from faraday
ftgmac100.c

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 0108023897720..b6af537838830 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4167,6 +4168,16 @@ static int __stmmac_open(struct net_device *dev,
>  	if (ret)
>  		goto irq_error;
> =20
> +	if (priv->plat->use_ncsi) {
> +		/* If using NC-SI, set our carrier on and start the stack */
> +		netif_carrier_on(priv->dev);
> +
> +		/* Start the NCSI device */
> +		ret =3D ncsi_start_dev(priv->nsdev);
> +		if (ret)
> +			goto irq_error;

[Severity: Medium]
Are the IRQs leaked if ncsi_start_dev() fails?

The code successfully allocated IRQs right before this via
stmmac_request_irq(). If ncsi_start_dev() fails, it jumps to the irq_error
label:

irq_error:
	stmmac_phylink_stop(priv->phylink);

But stmmac_free_irq() is not called in this error path. Could this leave
the IRQs permanently allocated, causing future attempts to bring the
interface UP to fail with -EBUSY?

[Severity: Low]
Additionally, if ncsi_start_dev() fails, is there a missing call to
netif_carrier_off() in the error path to revert the carrier state?

> +	}
> +
>  	stmmac_enable_all_queues(priv);
>  	netif_tx_start_all_queues(priv->dev);

[ ... ]

> @@ -8141,6 +8175,8 @@ void stmmac_dvr_remove(struct device *dev)
> =20
>  	pm_runtime_get_sync(dev);
> =20
> +	if (priv->nsdev)
> +		ncsi_unregister_dev(priv->nsdev);
>  	unregister_netdev(ndev);

[Severity: High]
Does unregistering the NCSI device before the netdevice cause a
use-after-free?

If the network interface is UP when the driver is removed,
unregister_netdev() synchronously halts the interface by invoking the
driver's ndo_stop callback (__stmmac_release()).

Inside __stmmac_release(), the code calls ncsi_stop_dev(priv->nsdev), but
priv->nsdev was already freed by ncsi_unregister_dev().

Should unregister_netdev() be called before ncsi_unregister_dev()?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/driv=
ers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 5cae2aa729066..483ecf06fc139 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -451,6 +451,14 @@ stmmac_probe_config_dt(struct platform_device *pdev,=
 u8 *mac)
>  	 * they are not converted to phylink. */
>  	plat->phy_node =3D of_parse_phandle(np, "phy-handle", 0);
> =20
> +	if (of_property_read_bool(np, "snps,use-ncsi")) {
> +		if (!IS_ENABLED(CONFIG_NET_NCSI)) {
> +			dev_err(&pdev->dev, "NCSI stack not enabled\n");
> +			return ERR_PTR(-EINVAL);
> +		}

[Severity: Medium]
Could this early return leak the OF node reference acquired just above?

plat->phy_node is set via of_parse_phandle() right before this check.
Returning ERR_PTR(-EINVAL) directly bypasses the error_put_phy cleanup
label, which drops the reference via of_node_put().

Would it be better to use goto error_put_phy instead of returning
directly?

> +		plat->use_ncsi =3D true;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610072420.6469=
9-1-minda.chen@starfivetech.com?part=3D3
