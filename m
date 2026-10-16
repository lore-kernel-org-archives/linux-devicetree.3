Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8783A784E
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161547; cv=none; b=Gg8rLXjXwbZEiBwSiAcShA/BWUS/2Peh3qPOgpxmQ64pRQTqI0WiGANdEIrTwD3RagRk81E0PoUV9t0LyydxPcSDZqYBPW/6mykU6BSK+8neakSPR4Yae9o+FIHKJf+vmNPWUULWesvlxIh/TJMn5kJ2Qtod62tgbhiJmXU6yEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161547; c=relaxed/simple;
	bh=0xexCFQw4BJI2ZMOblzdvQ4XEIF+NxdU+/AH+gb9Eck=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QYlRPK2LHGQRtc9hshqftGF2ul46NkSBW7ikz7fLOA9xZLrdUS4L2vqTOwu3sNr4GCWbcaLaQpNr52/nYCW+T5Mu8d460Xu9RIF1BcYvmDOYc0PXKFllD1KiB/WXGS8IGlvsY0cAVI3+Ai0GDgCdxaRXpzoYE66sIlzrmPlwVtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0QApaid; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0QApaid"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E287F1F000C4;
	Fri, 16 Oct 2026 14:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161546;
	bh=rGZxtRNAatdpLgd4KzeblxZriGxV1lJw+7YEorx8mnI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o0QApaidOvyPXT1ZCUz/iuvYlwzqwFKXpa7A8MJJHrzMpS3CRvpZwZm0vIt3nQ0So
	 YtZnf4yQ/q6AfX+p5ov2QQuz2HI7ZVOjcADw4qPY6Kn64fY3Pz9nyrNCJ+AlItiWUD
	 ZMLqQeOxHrS08sHSgJDyzaGWbu+RFstoajHAI8O1n2LlGqQ8sGaPq/CD6npmaIVR4F
	 wSLApyp+laF4pz5vWyK8AK64ub+wBxOPU3w5ck23dsJCnaGEIsIn0gEtWnT33BZL1g
	 aEX1y3PD0AUhAwjOo0otgZ7Q/lLoY7mc5ntDW+lKG9VBM5PKZqgw5CIN6IZGjna4jG
	 OnWb82pLbw+tA==
Message-ID: <sashiko-outbox-174466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: phy: qcom: qca808x: Add regulator
 management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015143849.483339-3-elder@riscstar.com>
References: <20261015143849.483339-1-elder@riscstar.com>
 <20261015143849.483339-3-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:39:05 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: phy: qca808x: missing PHY reset pulse after enabling regulato=
rs
--

commit e2b47da72c4cf5c697d4c2078b3f0f943b751123
Author: Daniel Thompson <daniel@riscstar.com>

net: phy: qcom: qca808x: Add regulator management

This commit adds logic to power on GPIO-controlled regulators during the
probe of the QCA8081 PHY device. It uses an always-on approach, turning on
regulators if present and sleeping for the reset assert delay.

> diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808=
x.c
> index bab26e4c61408..4aba513b9a512 100644
> --- a/drivers/net/phy/qcom/qca808x.c
> +++ b/drivers/net/phy/qcom/qca808x.c

[ ... ]

> @@ -181,15 +182,43 @@ static void qca808x_fill_possible_interfaces(struct=
 phy_device *phydev)
>  		__set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
>  }
> =20
> +static int qca808x_power_on(struct phy_device *phydev)
> +{
> +	static const char * const regulator_names[] =3D {
> +		"avdd18", "vdd", "vdd18", "vdd125"
> +	};
> +	struct device *dev =3D &phydev->mdio.dev;
> +	u32 count =3D 0;
> +	int ret;
> +
> +	for (u32 i =3D 0; i < ARRAY_SIZE(regulator_names); i++) {
> +		ret =3D devm_regulator_get_enable_optional(dev, regulator_names[i]);
> +		if (!ret)
> +			count++;
> +		else if (ret !=3D -ENODEV)
> +			return ret;
> +	}
> +
> +	if (count)
> +		fsleep(phydev->mdio.reset_assert_delay);

[Severity: High]
Does this sequence successfully initialize the PHY hardware? The driver app=
lies
power here and sleeps for the reset delay, but doesn't seem to explicitly
toggle the reset line.

Since the MDIO core deasserts the reset line before invoking the driver's
probe() callback, the PHY appears to power up with the reset line already
deasserted. Could this regression result in the hardware failing to initial=
ize
properly and leaving a dead link?

Perhaps an explicit assert and deassert (e.g., via phy_device_reset()) is
needed here to provide a valid reset pulse after the power is stable.

> +
> +	return 0;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015143849.4833=
39-1-elder@riscstar.com?part=3D2
