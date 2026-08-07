Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BD5287247
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126397; cv=none; b=AWmkCA9sKMfhvCZQ6VH2u5273jxg8vqbaL2dCHIMLKU0EFynvC0Hyz3Ssmx3E/BjZFN6Vtv5fQmEyD9uCndDDbYt870Y17Y5RAUsVBf0aYqXIBopXw8IKCUksIpRAahHiPP1b7i9+3Fop5enyjfKkacqYV7q6u/wmnB8DFMoyfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126397; c=relaxed/simple;
	bh=tsvYgHM+2G/3rb5RzHl9h6vFt0CwfW0W0VsnOoe78qU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tKVof04HaBMwt3d3gQNB3BghtWwJ4hG6vEcLLwub1bvzN5odtEHVkuGK9jX982c/jyIG4KLTf+zH8vLv2lbY3B0z4XaW2uX4kV4eXGaFUJzcXkzpAYLwZ0pcKGqdGW3KXJ+sqjH5/0ADbQqg5ESsYRRk/2OmZD+eDSl/aUg0Gn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcsAFk5V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcsAFk5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7D71F000E9;
	Fri,  7 Aug 2026 18:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786126396;
	bh=psk3Divzq0joZBw7b0Yze5a5ckSlA6Pvh9R0zshQYxo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OcsAFk5VqynPC2vpY9MLhtkrFFu9O+/ScfzWCuK7OlsSqdDFtZXq52W7fMbkIV0yl
	 2QdhYj3DdTLTKKWYLdW2m2AM/gxTTELB73zjluOT3lBW+y+FPcb0ZBV5UM9ShDfb20
	 X1syJnYw2ARbwNhjqA/DkdwrGv3jT7fxdMpWPAWVLGEJDoFNUTXZWFixKybf2Q7OUU
	 OkU2IIXLIgjmj9VCoqw29ESrLOR0ixDSGHQ5LDG9gHH0Nnew+MRp6MkHoNde+i5SY3
	 H3LqmmBugBQTfYuU9++f6uqnGhas/A0wlVYMZ9VvwQOCV+5y17lCybOXWLEaKgZgG9
	 mTTsakjdPuTzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 4/7] net: xilinx: axienet: Add 10G/25G (XXV)
 ethernet support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806181153.1213996-5-suraj.gupta2@amd.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260806181153.1213996-1-suraj.gupta2@amd.com>
 <20260806181153.1213996-5-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 18:13:15 +0000
Message-Id: <20260807181316.1A7D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver advertises runtime speed switching capabilities for the=
 10G/25G MAC but fails to implement the logic to actually switch the MAC sp=
eed, causing a speed mismatch if the negotiated speed differs from the MAC'=
s default.
- [High] XXV MAC falsely advertises Pause frame capabilities but does not i=
mplement flow control programming.
--

--- Patch [4]: [PATCH net-next v2 4/7] net: xilinx: axienet: Add 10G/25G (X=
XV) ethernet support ---
commit 8e3220d85fee82772624219e408ac95ba32403d4
Author: Suraj Gupta <suraj.gupta2@amd.com>

net: xilinx: axienet: Add 10G/25G (XXV) ethernet support

The AXI Ethernet driver currently supports only the AXI 1G Ethernet IP.
This commit adds support for the Xilinx XXV Ethernet IP which implements
a 10G/25G Ethernet MAC. It adds the XXV-specific logic in new files and
describes the MAC through an axienet_10g25g_config.

[1]: https://docs.amd.com/r/en-US/pg210-25g-ethernet

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c b/drivers/n=
et/ethernet/xilinx/xilinx_axienet_xxv.c
> new file mode 100644
> index 0000000000000..46b48a773c15a
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
> @@ -0,0 +1,329 @@

[ ... ]

> +static void axienet_xxv_phylink_set_capabilities(struct axienet_local *l=
p,
> +						 struct phylink_config *cfg)
> +{
> +	u32 core_speed;
> +	bool rtsw;
> +
> +	core_speed =3D axienet_ior(lp, XXV_STAT_CORE_SPEED_OFFSET);
> +	/* Bit[1:0]: 00=3D25G, 01=3D10G, 10=3Druntime-switchable 25G,
> +	 * 11=3Druntime-switchable 10G. A runtime-switchable core can operate at
> +	 * either speed, so advertise both; a fixed core advertises only its
> +	 * configured speed.
> +	 */
> +	rtsw =3D core_speed & XXV_STAT_CORE_SPEED_RTSW_MASK;
> +
> +	if (rtsw || (core_speed & XXV_STAT_CORE_SPEED_10G_MASK)) {
> +		cfg->mac_capabilities |=3D MAC_10000FD;
> +		__set_bit(PHY_INTERFACE_MODE_10GBASER,
> +			  cfg->supported_interfaces);
> +	}
> +
> +	if (rtsw || !(core_speed & XXV_STAT_CORE_SPEED_10G_MASK)) {
> +		cfg->mac_capabilities |=3D MAC_25000FD;
> +		__set_bit(PHY_INTERFACE_MODE_25GBASER,
> +			  cfg->supported_interfaces);
> +	}
> +}

[Severity: High]
The driver advertises both 10G and 25G capabilities for runtime switchable
cores here, creating the expectation that it will support speed switching.

However, the axienet_10g25g_config structure below omits the .mac_link_up
callback. If phylink negotiates a speed that differs from the MAC's default,
how is the new speed written to the hardware via
XXV_SWITCH_CORE_SPEED_OFFSET to prevent a mismatch?

[ ... ]

> +const struct axienet_config axienet_10g25g_config =3D {
> +	.sw_padding =3D true,
> +	.internal_pcs =3D true,
> +	.regs_n =3D XXV_REGS_N,
> +	.clk_init =3D axienet_10g25g_clk_init,
> +	.setoptions =3D axienet_xxv_setoptions,
> +	.probe_init =3D axienet_xxv_probe_init,
> +	.gt_reset =3D axienet_xxv_gt_reset,
> +	.mac_init =3D axienet_xxv_mac_init,
> +	.get_regs =3D axienet_xxv_get_regs,
> +	.phylink_set_caps =3D axienet_xxv_phylink_set_capabilities,
> +	.pcs_ops =3D &axienet_xxv_pcs_ops,
> +};

[Severity: High]
The shared axienet_probe() function unconditionally adds MAC_SYM_PAUSE and
MAC_ASYM_PAUSE to the mac_capabilities for all configurations, including the
XXV MAC.

Without a .mac_link_up callback provided here to program the hardware flow
control registers (like XXV_CONFIG_TX_FLOW_CTRL1_OFFSET), could this lead to
a silent mismatch of flow control configuration if pause frames are negotia=
ted
with the link partner?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806181153.1213=
996-1-suraj.gupta2@amd.com?part=3D4
