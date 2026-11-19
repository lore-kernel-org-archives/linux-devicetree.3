Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067645;
	b=Z7kDrvH2/xvqltRlDBF9d6A1dw5Dx68jEv/Ugiq9pB6pGV2d0w2Htb3euO4RHBZp4888
	 o35401Enu21z7IPulDbxYdy/5bWCJ6gzq6170PggwpEu8+2UrkkNWdSliynNeNPX9OcPb
	 orC40qpRGBFoFDv9hWWCM21IsQv0xuakS0h5oTkqSUiSIa11P5xWXwsPnyS9hMt52VX8l
	 kiVSJ9AFShqChdhED/tqY4Rt1DUEtRII8Mekiq+7sMmFSCv/CDH+guizMDywjcmgkBKq3
	 nf5P9p5945wafIIvJvgryhw3adMkhx03o7ZMDpkq0hPpvjLUEO6amdcMsD/gK2eCFdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067645;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wOlFTsWCj5IQP2ufLf/ape389szjtQ5znHXcGvL3Fk8=;
	b=Gx3o9m0l3NZv683Oz+p2YGsin7Mq5xOp14kXkPERZofPcWLWwlQZmHMf2PxObYVgycKK
	 dHBa//IN/sbwypLAbLP0GFpClISXe4IBX01nEgVL5jFwvYShgkYorwrzcLU+qbnXpAsUU
	 +uRH+eOHqUY3nyhfXiytRtVIejFbWsTCQrByLfSvr314l2aSQOaIP0CAx8IHOP8NcvyV/
	 9+2v3zdcwVCEWMC6hPcv57pzym2pODmDWmlT/Dz0K3dJQptdk9fOgBJ7iaKydpmNgdepF
	 RbiaIey/yYhY+ua4gHMGOF6YKcOdAPevXvrGnmfXADn4Nq+ynINCKu7ZeC1vfen5pOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rv56GJGa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7BA606A320;
	Thu, 19 Nov 2026 05:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rv56GJGa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADC91F000C4;
	Thu, 19 Nov 2026 05:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795067644;
	bh=wOlFTsWCj5IQP2ufLf/ape389szjtQ5znHXcGvL3Fk8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Rv56GJGaU0wL3Kb1T288rpx2AaJE1vfUPNIXMf2OalLoFtgK4gd2TVHWtPRA106VJ
	 rtcexr3bMfJDuXxyHSPVBjvjwJV7CxMlIjwcG1pfhbzMnJIgRpuFkLLHtnT3/SvAA0
	 kjXyMfL9/rtgOJcdb92H4wKF3FyaoDcrA2T3E/bUxFHybSj0f245XTsYWsMgJbbgbc
	 O8FVmr26fJ71LLwFXjRMZbIx/6HPifcv5SztepuQsXn19bWsPTrVeGiVrOjM8wVVSR
	 3vcBSczQX2w8E1G/IFyurASsYidhy1xp0hR+O701gd4/bPdcypEb9XC+b/R+9+WJDj
	 B2VOr4Cny3M8Q==
Subject: Re: [PATCH net-next v2 2/3] net: pse-pd: realtek-pse-mcu: ensure MCU
 does dynamic power management
From: netdev-bot+sashiko@kernel.org
To: jonas@jonasjelonek.de
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 sander@svanheule.net, russell@personaltelco.net
Date: Thu, 19 Nov 2026 05:54:03 +0000
Message-ID: <179506764349.3136.14504567519359431973@kernel.org>
In-Reply-To: <20261116115224.1454885-3-jonas@jonasjelonek.de>
References: <20261116115224.1454885-3-jonas@jonasjelonek.de>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] rtpse_mcu_register() (drivers/net/pse-pd/realtek-pse-mcu-
  core.c:854-857) now fails probe on any error from the new…
- [Low] The commit has no Fixes: tag, but it fixes a user-visible defect
  in the original driver commit 44566e614d84 ("net: pse-pd: add Realtek…
- [Low] In this commit, the comment above the 'disable-ports' GPIO
  request in rtpse_mcu_register() (drivers/net/pse-pd/realtek-pse-mcu-…

--

net: pse-pd: realtek-pse-mcu: ensure MCU does dynamic power management

This adds a command that switches the Realtek PSE MCU to dynamic power
management with port priorities. It uses opcode 0x17 on gen1 and 0x10 on
gen2. rtpse_mcu_register() sends the command after discovery and before
the disable-ports gpio is released, and probe fails if the command fails.

> The MCU may have any power management mode configuration by default
> but the driver should ensure that the MCU performs dynamic power
> management with priorities as advertised. On certain devices, the
> default MCU configuration ships with another default, possibly
> preventing any power delivery.

[Severity: Low]
This describes a user-visible problem in the original driver. Should the
patch carry a Fixes: tag?

Since commit 44566e614d84 ("net: pse-pd: add Realtek PSE MCU core"),
rtpse_mcu_register() has set PSE_BUDGET_EVAL_STRAT_DYNAMIC and
pis_prio_max. It has never put the MCU into the matching mode. That
commit's message says "Power budgeting is left to the MCU firmware; the
driver advertises PSE_BUDGET_EVAL_STRAT_DYNAMIC accordingly".

Without the tag, the stable and backport tooling won't pick this up for
kernels that already carry the driver. Perhaps:

Fixes: 44566e614d84 ("net: pse-pd: add Realtek PSE MCU core")

If the patch is meant to stay in net-next with the VMAIN budget work,
could the commit message still name the commit it fixes?

> diff --git a/drivers/net/pse-pd/realtek-pse-mcu-core.c b/drivers/net/pse-pd/realtek-pse-mcu-core.c
> index c70b09ca20122..d8b6e05039397 100644
> --- a/drivers/net/pse-pd/realtek-pse-mcu-core.c
> +++ b/drivers/net/pse-pd/realtek-pse-mcu-core.c

[ ... ]

> @@ -826,6 +850,12 @@ int rtpse_mcu_register(struct rtpse_mcu_ctrl *pse)
>  	if (ret)
>  		return ret;
>  
> +	/* ensure the MCU does dynamic power management with priorities */
> +	ret = rtpse_mcu_set_power_mgmt_mode(pse);
> +	if (ret)
> +		return dev_err_probe(pse->dev, ret,
> +				     "failed to set power management mode\n");

[Severity: Medium]
Could this break probe on boards that worked before this patch?

Both dialects now define the opcode (0x17 for gen1, 0x10 for gen2). That
means rtpse_mcu_set_power_mgmt_mode() never takes its -EOPNOTSUPP path.
It turns any non-zero status byte from the MCU into -EIO:

	return (resp.payload[0] == 0x0) ? 0 : -EIO;

A NOT_READY reply only gets the three resends inside
rtpse_mcu_do_xfer(). It does not get the bounded boot-retry window that
rtpse_mcu_discover() uses.

Some firmware variants may reject the command, or fail it with -EAGAIN,
-EBADMSG or -EBADE. In that case rtpse_mcu_register() returns before the
disable-ports gpio is requested and before devm_pse_controller_register()
runs.

On boards with the disable-ports gate, that leaves no PoE at all. On
boards without the gate, the MCU keeps its old policy but the kernel
registers no PSE controller. Before this patch, those boards probed as
long as the firmware default policy was usable.

Is it known that every supported gen1 and gen2 firmware accepts this
command? The changelog mentions "change error handling", so a softer
variant seems to have been considered. If warning and continuing is not
safe, could the commit message explain why the failure needs to be
fatal?

> +
>  	/*
>  	 * Some boards gate all ports through a hardware line; deassert it only
>  	 * after the MCU is confirmed, so a discover failure never ungates the

[Severity: Low]
This isn't a bug, but this comment still names only discovery as the step
that has to succeed before the ports are ungated. The new
rtpse_mcu_set_power_mgmt_mode() call above is now a precondition too.

The next patch in the series, "net: pse-pd: realtek-pse-mcu: configure
global power budget", rewrites this comment to "deassert it only after
discovery, budget setup and management-mode selection succeed". That
fixes it by the end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116115224.1454885-1-jonas%40jonasjelonek.de
