Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8702B380FE2
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254695; cv=none; b=NiXuSnFhZM9soEhHd9jCY4NaIWU9i0/mQARNq+ubWBdl+NhBaypOF4iZWoS9YZRRO6LL53lq9gCUDOaKs40HbVSBne90opwz8wHhqijBIfLppDt7XWbO4Q487o2apQEWJeoLREBF8uV1p+A/+WIkunoTMIA3GMGYs6asL+EPG1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254695; c=relaxed/simple;
	bh=g/JOx1CkIb52wSOdSquqHawsYHGRJa/T2H8J+oLtevc=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UVGMJtK3kSUjRDKePNqLvG6oyW43LBv7LqgK1FtCilqazWgJ7PV4vL4Ms/OyvxmcBARxT1zAXlWlY2t9CaSmmLdFciRwFhljLnvwhScC3yXPLWFAV4v4SRcHtSpjrxKTrcrGKunrsX2NIil4sDQJYFaUgMh8dt21SoH/ZffblEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBC5mP5H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBC5mP5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA15D1F000E9;
	Fri, 12 Jun 2026 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781254692;
	bh=8lQseQlV7QMqWW1i8I5RE7OnB1hsXlVdzslZJwpTQvo=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=HBC5mP5HluvBe4vjiWpCAVsdubI7+7qBNSiCcvekdB7SKsc3cAgbqatEm7muCAXTS
	 4pSF+g6Do6dhv8g+xSGQMHmxWXvEoEk+guH6JZ0p38tJ3iVwaPX+naaiWMKk+1t+2b
	 mKJ1tLnI0fTopUz6zhLRGWXd12VZGrCskVGfSuXBJx2Mdqeg56yBKP/b972CBYJ0Mt
	 mAuttJERR8fvi/LeJpebUCegnjRzrHCKxjb4rVqAFTMd0ra+LQGNS+IplCAKS/eBB2
	 qommvQI/UI466D06/K+BW9ADvq+qLB6TPtdAT88TYnK/BJfNa03n7pMgQAyWNn4osb
	 C8mhgCOv9TFTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260612-clk-v10-v10-6-eb92484eda38@nxp.com>
References: <20260612-clk-v10-v10-6-eb92484eda38@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 08:58:12 +0000
Message-Id: <20260612085812.AA15D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The driver fails to link when compiled as a module (`CONFIG_COMMON=
_CLK_SCMI=3Dm`) because `clk-scmi.c` and `clk-scmi-oem.c` are built as sepa=
rate modules without exporting their shared symbols.
- [High] Incorrect unit conversion for spread spectrum percentage causes va=
lid spread values to be truncated to 0.

Pre-existing issues:
- [High] Missing bounds check on SCMI firmware-provided parent clock index =
leads to heap out-of-bounds read and wild pointer dereference.
--

commit 02412e4d55042034939e6eece844d1bd4d62d5e9
Author: Peng Fan <peng.fan@nxp.com>

clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver

Introduces clk-scmi-oem.c to support vendor-specific OEM extensions for the
SCMI clock driver. This enables querying OEM-specific features and setting
spread spectrum configurations.

> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 6a726331b6c9e..c2ae700ec0f2a 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -98,7 +98,7 @@ obj-$(CONFIG_COMMON_CLK_RP1)            +=3D clk-rp1.o
>  obj-$(CONFIG_COMMON_CLK_RPMI)		+=3D clk-rpmi.o
>  obj-$(CONFIG_COMMON_CLK_HI655X)		+=3D clk-hi655x.o
>  obj-$(CONFIG_COMMON_CLK_S2MPS11)	+=3D clk-s2mps11.o
> -obj-$(CONFIG_COMMON_CLK_SCMI)           +=3D clk-scmi.o
> +obj-$(CONFIG_COMMON_CLK_SCMI)           +=3D clk-scmi.o clk-scmi-oem.o

[Severity: High]
Will this fail to link when compiled as a module (CONFIG_COMMON_CLK_SCMI=3D=
m)?

It looks like Kbuild will treat clk-scmi.o and clk-scmi-oem.o as separate
kernel modules rather than linking them into a single composite module.
Since neither file exports their shared symbols (like scmi_proto_clk_ops
or scmi_clk_oem_init), won't this result in undefined reference errors?

Should this use a composite module definition instead?

scmi-clk-y :=3D clk-scmi.o clk-scmi-oem.o
obj-$(CONFIG_COMMON_CLK_SCMI) +=3D scmi-clk.o

[ ... ]

> diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
> new file mode 100644
> index 0000000000000..be11d359b4ec3
> --- /dev/null
> +++ b/drivers/clk/clk-scmi-oem.c

[ ... ]

> +static int
> +scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
> +				 const struct clk_spread_spectrum *ss_conf)
> +{
> +	struct scmi_clk *clk =3D to_scmi_clk(hw);
> +	int ret;
> +	u32 val;
> +
> +	/*
> +	 * extConfigValue[7:0]   - spread percentage (%)
> +	 * extConfigValue[23:8]  - Modulation Frequency
> +	 * extConfigValue[24]    - Enable/Disable
> +	 * extConfigValue[31:25] - Reserved
> +	 */
> +	val =3D FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_b=
p / 10000);

[Severity: High]
Does this integer division by 10000 inadvertently truncate valid spread
spectrum values to 0?

Since ss_conf->spread_bp is in basis points (where 100 basis points equals
1%), and standard configurations usually range from 50 to 500 basis points
(0.5% to 5%), dividing by 10000 will always result in zero. Could this
divide by 100 instead to correctly convert basis points to a percentage?

[ ... ]

> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index d88e78cc9a12e..2dd50c5b4ea8f 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c

[ ... ]

> @@ -406,7 +419,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
>  		 * to avoid sharing the devm_ allocated clk_ops between multiple
>  		 * SCMI clk driver instances.
>  		 */
> -		scmi_ops =3D scmi_clk_ops_select(sclk, transport_is_atomic,
> +		scmi_ops =3D scmi_clk_ops_select(sdev, sclk, transport_is_atomic,
>  					       atomic_threshold_us,
>  					       scmi_clk_ops_db,
>  					       ARRAY_SIZE(scmi_clk_ops_db));

[Severity: High]
This is a pre-existing issue, but is it possible for the SCMI firmware to
trigger an out-of-bounds read right after this ops setup?

Looking at scmi_clocks_probe(), it uses the parent index provided by the
SCMI firmware to directly access the dynamically allocated hws array:

drivers/clk/clk-scmi.c:scmi_clocks_probe() {
    ...
	for (int i =3D 0; i < sclk->info->num_parents; i++) {
		sclk->parent_data[i].index =3D sclk->info->parents[i];
		sclk->parent_data[i].hw =3D hws[sclk->info->parents[i]];
    ...
}

If the firmware provides an index greater than or equal to the total clock
count, won't this result in an out-of-bounds read on the heap, potentially
dereferencing a wild pointer? Should this index be verified against count
first?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-clk-v10-v1=
0-0-eb92484eda38@nxp.com?part=3D6
