Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2158048C8A2
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863169; cv=none; b=nxC8fwVXEkFvJTH8EpR+JXlrJWAOYSCDY7574q27DNuXMcW1H299zh54Il4yVolWcnT4lL+wao0iV+KwYjACmBQE8yJqD7moULCf2Mi2RP4TUODEVAzpQy8l2g4EpV9/xeoYsnnbNcIFYrbaBNRgsfJd1gUPoLqYs6gIL9U3bv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863169; c=relaxed/simple;
	bh=67LF8obc+HdTUMSojTi+dPpz0NGPpSKq8fetZaOX38U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iGjzs6DUa+FqO15SORgYxNSBrEws0Ljb1K+oan2xEnYxyl4CPb1JHQDDJqPGYYDw7CruU6m4LnvWfnoLDo9rLYl5EU9cVMeNEeVQLDKXcUEaIbNtxcXkFlpBZMufmUfUOrgG4xKMqnvsEsVx0Im8AiNAPMz6HchVgg+KyV8h990=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4bhMvin; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4bhMvin"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AE91F00AC4;
	Tue,  4 Aug 2026 17:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785863155;
	bh=b4D2igZ20H4SOp91/fZluLVcYFnye5U7VU1CHht3iwo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a4bhMvinJb4pITSquR1MGl9UV/FsdFZxZLSU2S8iSL3K9Aqmdtw+yDRDlDmNkt2yg
	 FE1D4exXNzFQSf3EWa6U74tLsU/N6VzGDocuatC/AEsc1QemLnTJuor4unCWSeVKVX
	 HYKbZC2hymATuFjNJrwU+ZihTqpL/TUwtpi1q+HYL5lzf7mGs/EkHesvjUblTNueAh
	 SEOJ0ISb+6L9SPDcuSe6PIOzld7ETUwudAQEepW5mOEnOBurfVAeVG0TWc7vW+EHIY
	 5RqeVW2CmA1VwFjVdlD9RAv53HWV2Bxkr10JN2yK/TwfXhxlxI/KNq5QJiwmFCA8L2
	 9tnW5wM5QB9Mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 10/11] clk: realtek: Add RTD1625-ISO clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804163807.1285869-11-eleanor.lin@realtek.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
 <20260804163807.1285869-11-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 17:05:53 +0000
Message-Id: <20260804170554.C2AE91F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The `.suppress_bind_attrs =3D true` flag was not removed, contra=
dicting the v12 changelog explicitly claiming its removal.

Pre-existing issues:
- [High] Race condition during module teardown leading to NULL pointer dere=
ference in clock operations.
--

--- Patch [10]: [PATCH v12 10/11] clk: realtek: Add RTD1625-ISO clock contr=
oller driver ---
commit 5805b8768a6198942f7b7e93baa5ff2d182a3863
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add RTD1625-ISO clock controller driver

Add support for the ISO (Isolation) domain clock controller on the Realtek
RTD1625 SoC. This controller manages clocks in the always-on power domain,
ensuring essential services remain functional even when the main system
power is gated.

Because the reset controller shares the same register space with this ISO
clock controller, this driver also acts as the parent device and registers
the reset controller as an auxiliary device on the auxiliary bus.

> ---
> Changes in v12:
> - Replace of_device_get_match_data() with device_get_match_data().
> - Use module_platform_driver().
> - Add spaces near {}.
> - Remove .suppress_bind_attrs and add .remove callback.

[Severity: Medium]
This isn't a bug, but the v12 changelog mentions removing
.suppress_bind_attrs, yet it is still present in the driver definition belo=
w.
Was this accidentally left in during a rebase?

[ ... ]

> diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/=
clk-rtd1625-iso.c
> new file mode 100644
> index 0000000000000..6025c148adf83
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-iso.c
> @@ -0,0 +1,142 @@

[ ... ]

> +static struct platform_driver rtd1625_iso_driver =3D {
> +	.probe =3D rtd1625_iso_probe,
> +	.remove =3D rtk_clk_remove,

[Severity: High]
This is a pre-existing issue, but does setting the .remove callback here
expose a race condition leading to a NULL pointer dereference during module
unload?

In rtk_clk_probe(), clocks are registered using devm_clk_hw_register(),
meaning they are not deregistered from the Common Clock Framework until aft=
er
the .remove callback completes.

However, rtk_clk_remove() manually clears the regmap pointer before devres
has a chance to deregister the clocks:

drivers/clk/realtek/clk-rtk-common.c:rtk_clk_remove() {
    ...
	for (int i =3D 0; i < desc->num_clks; i++)
		desc->clks[i]->regmap =3D NULL;
    ...
}

If a concurrent operation (like reading /sys/kernel/debug/clk/clk_summary or
a consumer calling clk_enable) accesses the clock ops during this window,
would it dereference the NULL regmap pointer inside regmap_read()?

> +	.driver =3D {
> +		.name =3D "rtk-rtd1625-iso-clk",
> +		.of_match_table =3D rtd1625_iso_match,
> +		.suppress_bind_attrs =3D true,
> +	},
> +};
> +
> +module_platform_driver(rtd1625_iso_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804163807.1285=
869-1-eleanor.lin@realtek.com?part=3D10
