Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C000C41F5C1
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006626; cv=none; b=r12OWhuY3Vi+lD9UqTFOIvaMJ4PEWmO4S/3y/ZYDvv3mlRQg9AKtHMz6HW4Z5aEuVGhWj8SzkRaSqb0VCQPRiLy9CWo4Y9t6TjlMOOLQhXADZSntvcyyJ3SFoMCdmlQhWG9aj2veWRTRQVSM+e0p4kmUx0Pn47yinG7DQJnFirM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006626; c=relaxed/simple;
	bh=UuWKyg3n6wVVyVNjUcJG8sG38oiDfNwyY0A372bpBpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Re3uKxWS4ZEHb9FYFS3mhV8dLUno+LwvYEWTdPmyg6cEG3S2HnKgJcMqq8SlRvmiT68FvXfsmVRnsPTfA4VP7LRZ7DnjR3zRFTdwv2L3R8siwwcf06ciDSjVR7uo0Ru4AoRWvgprjMWKspw6Kvq5YMRq48njNRldpe6Dp/5lxuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KK5qLM7l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KK5qLM7l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319D61F00A3A;
	Thu,  6 Aug 2026 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786006625;
	bh=RcSoPK6UvAOVMYDdVAyfe7NRzoDglAExfJG9Adu5Sv8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KK5qLM7lYTZr4exNvYK0VV55Nfh3QhH93KNV47yWJGlz0wdK7JUXQ7gHm6Qejod9O
	 pVtMBIf0EDkeEtvLIT36aYoeqr4LSrtvU9YSLn4+rzSmM1iKT1tkzmox/wamSJfKQB
	 MhcurB3znj5Xqv8iFiUrNTtbQiYTn6wAQXYZLZAagqKNnPFFCzc/EQeUGEbLz+d59+
	 DFvgbNkLMmf27xs77C97ed0ZgEgVRnZtVsFOXQJe5pQWWsOd0Qv7GpKKWWmBa7Ohg5
	 k/LCfwOAV1CAFv3RD5kZqxLbH2U8O784OieJ8WTWmeveNIM/2JXmAcOCOqYbh/Lm97
	 Cqm7Gt5h2kpEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 3/3] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805085540.452260-4-a.shimko.dev@gmail.com>
References: <20260805085540.452260-1-a.shimko.dev@gmail.com>
 <20260805085540.452260-4-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 08:57:04 +0000
Message-Id: <20260806085705.319D61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] RGMII configuration is written after the PHY software reset, preve=
nting delay settings from taking effect.
--

--- Patch [3]: [PATCH net-next v6 3/3] net: phy: add DAPU Telecom DAP8211R(=
I) Gigabit Ethernet PHY driver ---
commit 0de15848a30c891806ee2f58213d5a3b6475e080
Author: Artem Shimko <a.shimko.dev@gmail.com>

net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver

Add a new PHY driver for the DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY.
This driver implements extended register access and provides device tree
support for RGMII delay configuration.

> diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/phy/dap8211r.c

[ ... ]

> +static int dap8211r_config_init(struct phy_device *phydev)
> +{
> +	u16 set =3D 0;

[ ... ]

> +	set |=3D FIELD_PREP(DAP8211R_RGMII_RX_DEL_MASK, rx_internal_delay);
> +	set |=3D FIELD_PREP(DAP8211R_RGMII_TX_DEL_MASK, tx_internal_delay);
> +
> +	ret =3D dap8211r_modify_ext(phydev, DAP8211R_PHY_CON, DAP8211R_PHY_SW_R=
ST, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for reset self-clear (from low active to high) */
> +	ret =3D read_poll_timeout(dap8211r_read_ext, val,
> +				(val & DAP8211R_PHY_SW_RST),
> +				20, 200, false, phydev, DAP8211R_PHY_CON);
> +	if (ret)
> +		return ret;
> +	if (val < 0)
> +		return val;
> +
> +	ret =3D dap8211r_modify_ext(phydev, DAP8211R_RGMII_CON, DAP8211R_RGMII_=
CONFIG_MASK, set);

[Severity: High]
Will these delay settings take effect? The function documentation notes tha=
t a
software reset is required to apply the settings, but the RGMII configurati=
on
is written to DAP8211R_RGMII_CON after the software reset has already been
issued and completed.

Should dap8211r_modify_ext() for DAP8211R_RGMII_CON be called before
triggering DAP8211R_PHY_SW_RST so the PHY latches the new delay values?

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805085540.4522=
60-1-a.shimko.dev@gmail.com?part=3D3
