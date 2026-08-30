Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FF622576E
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 05:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788067585; cv=none; b=EcNEO5zjvp1b1++XuaqlzgoxKknICFF7ZNoKzK42fTium79SD6q9zWcPLkkIieEeuqtTijUxLx/38ARsECjJrGw8bawmin+7o1byVHQj6DLcpE+k5+6CDwm8qkwt1lp/MMNGC45zBNxry9dzIyey3cEK58ws5AEbPDlTrtjgH/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788067585; c=relaxed/simple;
	bh=dkolrt296w/FFLPPVUoAURG4lXsKO/1dTsatI9ta5fQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aZY+hWTvFibVbXLMgOQna55bcOOwl1bYyrUp7+H4vbS8cSe2d25Zf4RZU0SP5HRE/uqLsaf3gUG5hEW4zSWwX+y57tVhcOS0cWvjDiArpN9BT1te3nd8wlLalnnSmFEgL5IcabSE5o138+NQA8Rcl8oXs8atlQ94ulpwgSNy6M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5UYIRQc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5UYIRQc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408C81F00A3E;
	Sun, 30 Aug 2026 05:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788067583;
	bh=fVjTbTYVbAQfrJeXUcY9DfdNykJIkG4vCiXCP2pBgzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a5UYIRQcpeTTnRdUGApRnTTBIqWochiIABYcmXvMBgmOeek1/k33FBWmK4lah3WNX
	 uOvEhwGokaVD1xwWf6wvg9HymomShXh7mJ9x7zU5JlUWRB0CVtXaKOv8OefJzt6FHn
	 ZYVG29eZMCVd2X3e7wvVGg84jQIm43EKG26Aa/YN5rzLabc32WsXr+vmRHbJboOTJn
	 W68qb+kw9miHkG+ukpjyefEFNcdf3sqFGFM5ySemALwxWvkt2dA3pF5u5PjX4rWZug
	 9Thj3oKM9xQnOxctFqVXdrR36Ebi+5PMTb7A9K7G1rP/KuYjgZ7I330X93tLtz2/06
	 HLjfif8tTNDyA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next 8/9] net: phylink: wait for PHYs that are
 known to probe late
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksei Sviridkin" <f@lex.la>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260829052546.1152446-9-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
 <20260829052546.1152446-9-f@lex.la>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 05:26:22 +0000
Message-Id: <20260830052623.408C81F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] pl->phydev is left as a dangling pointer if phylink_bringup_phy() =
fails, causing an infinite -EBUSY retry loop and a subsequent double-free/U=
AF.
--

commit 041169a410024c4510d91d095a3546cc79dd0bb6
Author: Aleksei Sviridkin <f@lex.la>

net: phylink: wait for PHYs that are known to probe late

A PHY whose driver or firmware lives on a filesystem mounted after the MAC
probes cannot be connected when the port is set up. This commit allows a po=
rt
to specify slow-to-probe, polling for the PHY instead of failing. It waits
for the PHY's driver to finish probing and re-tries on failures.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 3ec3bb4391095..62e6059a18da3 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -2254,6 +2277,129 @@ int phylink_connect_phy(struct phylink *pl, struc=
t phy_device *phy)
>  }
>  EXPORT_SYMBOL_GPL(phylink_connect_phy);
> =20
[ ... ]
> +static void phylink_slow_phy_poll(struct work_struct *work)
> +{
[ ... ]
> +	if (!ret) {
> +		ret =3D phylink_bringup_phy(pl, phy_dev,
> +					  pl->link_config.interface);
> +		if (ret)
> +			phy_detach(phy_dev);

[Severity: High]
This isn't a bug introduced by this patch, but the existing lack of rollback
in phylink_bringup_phy() is exacerbated by this new background poller, which
turns it into an infinite background loop and a guaranteed crash on teardow=
n.

If phylink_bringup_phy() fails later in its execution (for example, if
phy_eee_rx_clock_stop() returns an error), it returns that error but leaves
pl->phydev pointing to the PHY:

drivers/net/phy/phylink.c:phylink_bringup_phy() {
    ...
    pl->phydev =3D phy;
    ...
    ret =3D phy_eee_rx_clock_stop(phy, pl->config->eee_rx_clk_stop_enable);
    if (ret =3D=3D -EOPNOTSUPP)
        ret =3D 0;
    ...
    return ret;
}

Because pl->phydev remains populated after the failure, the poller calls
phy_detach() which drops the refcount. On the next poll cycle,
phylink_attach_phy() will unconditionally return -EBUSY because pl->phydev
is already set.

Furthermore, when the interface is later brought down and
phylink_disconnect_phy() is called, it finds pl->phydev set and calls
phy_disconnect(). This calls phy_detach() a second time on the
already-detached PHY, causing a double-put and use-after-free.

Should phylink_bringup_phy() clear pl->phydev on error, or should the caller
clear it if the bringup fails?

> +		else if (!test_bit(PHYLINK_DISABLE_STOPPED,
> +				   &pl->phylink_disable_state))
> +			/* phylink_start() starts the PHY it finds attached,
> +			 * and ran long before this one turned up.
> +			 */
> +			phy_start(phy_dev);
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829052546.1152=
446-1-f@lex.la?part=3D8
