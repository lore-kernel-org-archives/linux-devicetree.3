Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B683191BB
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838678; cv=none; b=C99Z3gN/EYoPvz898sDFd/TVg0rC9pB5/7Wb3qe6ELldqySHjLwOcGv+e7ZFvAk6kcq8Q3pLD5L+P/sePumdzodIeSasDNU0nyCiFCWLiIFqv5FfCed/4vpeEfPW9umSLhsdcxEE47W2XG2r4KhTqz5t8a8qBqGKePzFinMtc4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838678; c=relaxed/simple;
	bh=zWkCCsMRzagoh5KeqReWvxEssGrZDQxl1N/u+cbcfAU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lq58sBXqG5egLabhn7qDRf9+XR2ECocHTTR4Wax9YMu5cB7O3sqJ/FrFruxTvHQ1WiWE1mXTr8cxSCacQ33l42lFniPf9nOZLSPnayf2SlpkiIhcymDVp7xwE46LZwKPTkhNZsz7rOZqNXQnxZ/T9Jr2c2/UcxaU2ETC/z8C8Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7vwMH7j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7vwMH7j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F350A1F000E9;
	Tue,  4 Aug 2026 10:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785838677;
	bh=n2u/BaXQVvuC5mXZNKv9EHY6dsCWs6cD33KIlN/IATo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q7vwMH7jJxf/8pTghbcQtkwEEbKVUAgfo7SwSPLE1q/Fc59xNQ/hUx9DyuoUqzcsr
	 Ngfa7eMxKqe8m6FDv/D6BH9t75bG3VrwywUsl4ZEuWhugglBxVvME6d4oFR/DdjjEH
	 Rb6MJKBPtAdwoi++0Jbi3dMDFsnfc1ur7QY9k8AKVfpWkX7VxWfZjfXGGrUkgSGrNO
	 3zCbEwwW+nsRO81OS43eZ95HnxV4ARqp2wMfntzG33+dSPQVZkNx2zzEBS1dOOLnAB
	 dyO93HUoHQh64GtPB6GWQF4Q/OsJQZYWvK4Vp+16ykhcDjaueAbxGwlt17D1xzytou
	 ZAh9Hsk5DOX1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 3/3] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803101734.270821-4-a.shimko.dev@gmail.com>
References: <20260803101734.270821-1-a.shimko.dev@gmail.com>
 <20260803101734.270821-4-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 10:17:56 +0000
Message-Id: <20260804101756.F350A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect initialization order: RGMII delay settings are written=
 after the PHY software reset.
- [Low] Brittle error handling in read_poll_timeout relies on mathematical =
coincidence of negative error codes.
--

--- Patch [3]: [PATCH net-next v5 3/3] net: phy: add DAPU Telecom DAP8211R(=
I) Gigabit Ethernet PHY driver ---
commit a53a9ce41047cdc6842142dab15fe0303b0f860a
Author: Artem Shimko <a.shimko.dev@gmail.com>

net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver

Adds a new PHY driver for the DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY.
The driver implements extended register access for RGMII delay configuratio=
n.

> diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/phy/dap8211r.c

[ ... ]

> +static int dap8211r_config_init(struct phy_device *phydev)
> +{

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

[Severity: Low]
Should this exit condition explicitly check for val < 0?

If dap8211r_read_ext() returns a negative error code, this loop currently
terminates only because negative values in two's complement happen to have
BIT(15) set. Relying on this coincidence might mask errors if a different
register or bit is polled in the future.

> +				20, 200, false, phydev, DAP8211R_PHY_CON);
> +	if (ret)
> +		return ret;
> +	if (val < 0)
> +		return val;
> +
> +	ret =3D dap8211r_modify_ext(phydev, DAP8211R_RGMII_CON, DAP8211R_RGMII_=
CONFIG_MASK, set);

[Severity: Medium]
The function's docstring mentions "Software reset to apply settings", but h=
ere
the RGMII configuration is written after the reset completes.=20

Does this PHY require the settings to be written before the software reset =
in
order to latch them properly?

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803101734.2708=
21-1-a.shimko.dev@gmail.com?part=3D3
