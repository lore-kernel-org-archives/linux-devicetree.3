Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C8F31619C
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212186; cv=none; b=SzM+sJ4YWzIaVq6z6gCScLzuxZP/lfIdwWvJOS2uCQAC7Pgr75gWxOvtpoay2PI2xJatYJH+XUtRbtJ7MwhQivCl89Ad/SE1XtiYpdAfDOryHw12RkS2T8jE/AIpQ1XeW4LzA5dTsQYV15vvlTt9jOaK139dc9fH/lfig6/xKPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212186; c=relaxed/simple;
	bh=suI+HF47g0p/NLr0JdnWOV0YAeVde9fQaxh8M71slIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=INKODCPEHXuOSC+KW89CpQ8gaxTSwPObQNfq5ixootfW+WHZKzpxaoERFLsiW34b5+ijSJLo/U25YVQNo2bng1apb//BtxDHHow12Ha23AeLsXndf/nLAmJgI4wgYwTEUVlDM0QjVTQuCFI1wlMvHRXmm7vJ8A4mdJxlBOQJ+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEoaOxk+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEoaOxk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780F71F000FF;
	Thu, 24 Sep 2026 01:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790212184;
	bh=Ckhn7n5qZTxLqwdiZ7kY8b6nMQDT6+mxjPpIxwOB8o4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YEoaOxk+2BPTk1WlEOMLSzAXiLVLDdG5wrt1rpAf7Difuoxwx7hy8hOAaGLibTmcR
	 Q4mhFnls70VRr5EjJra6mfAMtbmPH4/qKE6+L8kcQRAtJ1wIePA7bvHr1+XIzllzve
	 x15IWHq5M+v3oZOCAh+jbRvDHEH7836wLwQxY7Wyr/1gc+xw852/3E2GJKXfACn0hV
	 bN++kJ8D3evj0l2qOhySM43BA1I4fPFcn/t1O3AvzaUuyfL5d7X0c0A3Alydoq/1yx
	 beBPhJU+k6qxwVuOEr3O2/RvlMFQVJJzziNRnT0bEUEhvPdsCz34VureMf75V1o99f
	 cjwHmaCWar8EQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC net-next 7/9] net: stmmac: support custom XGMAC
 register layouts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-7-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-7-4b1c682af70f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 01:09:44 +0000
Message-Id: <20260924010944.780F71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] mm: heap OOB write in ethtool register dump with custom MAC/DMA la=
youts
- [High] net: stmmac: SError panic during ethtool dump over unmapped sparse=
 MMIO gaps
- [High] net: stmmac: incorrect DMA channel offset scaling for odd/even bas=
es
- [Medium] net: stmmac: PPS registers ignore custom timestamp_base override
- [Medium] net: stmmac: zero-initialized dwxgmac_addrs fields silently over=
write critical MAC registers
- [Low] net: stmmac: socfpga explicitly hardcodes NULL for custom address o=
verrides
--

commit c3f13a2a3a2ef1c42853ddb7b0f741ba03e49292
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: support custom XGMAC register layouts

This commit allows platforms to override the MTL queues, DMA channels, and
timestamp register offsets via custom platform data, while retaining the
standard layout by default. It updates various macro definitions and driver
functions to use these configurable bases instead of hardcoded addresses.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 1d7f0a57d2889..331ba38abae66 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -365,7 +365,7 @@ static int smtg_crosststamp(ktime_t *device, struct s=
ystem_counterval_t *system,
>  	};
> =20
>  	num_snapshot =3D FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK,
> -				 readl(ioaddr + XGMAC_TIMESTAMP_STATUS));
> +				 readl(ioaddr + XGMAC_TIMESTAMP_STATUS(NULL)));

[Severity: Low]
Does explicitly passing NULL here break future compatibility? By hardcoding
the fallback state instead of using the layout configuration available via
the local priv context (e.g., priv->plat->dwxgmac_addrs), it seems this wou=
ld
fail to use a custom PTP base on future socfpga hardware revisions.

> =20
>  	/* Repeat until the timestamps are from the FIFO last segment */
>  	for (i =3D 0; i < num_snapshot; i++) {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net=
/ethernet/stmicro/stmmac/dwxgmac2.h
> index f8ab347f7b5b9..22b476358a202 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -220,12 +220,21 @@
>  #define XGMAC_CT			BIT(1)
>  #define XGMAC_OB			BIT(0)
>  #define XGMAC_RSS_DATA			0x00000c8c
> -#define XGMAC_TIMESTAMP_STATUS		0x00000d20
> +
> +/* Timestamp registers */
> +#define XGMAC_TIMESTAMP_BASE_ADDR	0x00000d00
> +
> +static inline u32 xgmac_timestamp_base_addr(const struct dwxgmac_addrs *=
addrs)
> +{
> +	return addrs ? addrs->timestamp_base : XGMAC_TIMESTAMP_BASE_ADDR;
> +}

[Severity: Medium]
Will this return 0 if a platform supplies dwxgmac_addrs for DMA overrides b=
ut
leaves timestamp_base uninitialized? If addrs is non-NULL but timestamp_base
is 0, this inline helper doesn't fall back to XGMAC_TIMESTAMP_BASE_ADDR, wh=
ich
could map critical operations to offset 0 (the MAC TX Configuration registe=
r)
and silently corrupt MAC state.

> +
> +#define XGMAC_TIMESTAMP_STATUS(a)	(xgmac_timestamp_base_addr(a) + 0x20)
>  #define XGMAC_TIMESTAMP_ATSNS_MASK	GENMASK(29, 25)
>  #define XGMAC_TXTSC			BIT(15)
> -#define XGMAC_TXTIMESTAMP_NSEC		0x00000d30
> +#define XGMAC_TXTIMESTAMP_NSEC(a)	(xgmac_timestamp_base_addr(a) + 0x30)
>  #define XGMAC_TXTSSTSLO			GENMASK(30, 0)
> -#define XGMAC_TXTIMESTAMP_SEC		0x00000d34
> +#define XGMAC_TXTIMESTAMP_SEC(a)	(xgmac_timestamp_base_addr(a) + 0x34)
>  #define XGMAC_PPS_CONTROL		0x00000d70

[Severity: Medium]
Should XGMAC_PPS_CONTROL and other PPS registers also use the custom
xgmac_timestamp_base_addr override? By remaining hardcoded to 0x0d70,
if a platform uses a custom timestamp_base, PTP PPS functionality will write
to standard hardware offsets rather than the custom relocated timestamp blo=
ck.

[ ... ]

> +static inline u32
> +xgmac_mtl_chanx_base_addr(const struct dwxgmac_addrs *addrs, u32 x)
> +{
> +	return addrs ? addrs->mtl_chan_base + x * addrs->mtl_chan_offset
> +		     : XGMAC_MTL_CHAN_BASE_ADDR + x * XGMAC_MTL_CHAN_OFFSET;
> +}

[Severity: Medium]
Similar to the timestamp base helper, does this properly fall back to
XGMAC_MTL_CHAN_BASE_ADDR if addrs is provided but mtl_chan_base is 0?
This could also silently overwrite offset 0.

[ ... ]

> +static inline u32
> +xgmac_dma_chanx_base_addr(const struct dwxgmac_addrs *addrs, u32 x)
> +{
> +	if (addrs && (x & 1))
> +		return addrs->dma_odd_chan_base + x * addrs->dma_chan_offset;
> +	if (addrs)
> +		return addrs->dma_even_chan_base + x * addrs->dma_chan_offset;
> +	return XGMAC_DMA_CHAN_BASE_ADDR + x * XGMAC_DMA_CHAN_OFFSET;
> +}

[Severity: High]
Does multiplying by the absolute index x here incorrectly double the intend=
ed
physical spacing for channels using split odd/even bases? For instance,
channel 1 will map to odd_base + 1 * offset, and channel 2 to
even_base + 2 * offset. Should this scale by (x / 2) to interleave the
odd and even channels correctly?

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/driver=
s/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 1a88cbaed70ca..d1099a1cf9ea5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c

[ ... ]

> @@ -292,7 +294,7 @@ static void dwxgmac2_dump_regs(struct mac_device_info=
 *hw, u32 *reg_space)
>  	void __iomem *ioaddr =3D hw->pcsr;
>  	int i;
> =20
> -	for (i =3D 0; i < XGMAC_MAC_REGSIZE; i++)
> +	for (i =3D 0; i < XGMAC_MAC_REGSIZE(hw->dwxgmac_addrs); i++)
>  		reg_space[i] =3D readl(ioaddr + i * 4);
>  }

[Severity: High]
Can this result in a heap out-of-bounds write? The ethtool register buffer =
is
allocated based on stmmac_ethtool_get_regs_len(), which uses
XGMAC_REGSIZE(priv->plat->dwxgmac_addrs) * 4 (the maximum DMA channel offse=
t).
However, dwxgmac2_dump_regs() writes up to
XGMAC_MAC_REGSIZE(hw->dwxgmac_addrs). If a platform configures a layout
where the maximum MTL offset exceeds the maximum DMA offset, the loop will
write past the end of the allocated buffer.

[Severity: High]
Could this linear read sweep also cause a synchronous external abort
(bus fault) on ARM/ARM64 devices? If a platform uses custom bases (like
dma_even_chan_base =3D 0x8500), it might create large unmapped MMIO gaps
between standard blocks and custom channels. Iterating through the entire
range with readl() would attempt to read from these unmapped physical
addresses.

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers=
/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index ff83858ebc1f3..65d5e2a828076 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c

[ ... ]

> @@ -118,16 +121,18 @@ static void dwxgmac2_dma_axi(void __iomem *ioaddr, =
struct stmmac_axi *axi)
>  static void dwxgmac2_dma_dump_regs(struct stmmac_priv *priv,
>  				   void __iomem *ioaddr, u32 *reg_space)
>  {
> +	const struct dwxgmac_addrs *addrs =3D priv->plat->dwxgmac_addrs;
>  	int i;
> =20
> -	for (i =3D (XGMAC_DMA_MODE / 4); i < XGMAC_REGSIZE; i++)
> +	for (i =3D (XGMAC_DMA_MODE / 4); i < XGMAC_REGSIZE(addrs); i++)
>  		reg_space[i] =3D readl(ioaddr + i * 4);
>  }

[Severity: High]
Similar to dwxgmac2_dump_regs(), could this loop read from unmapped memory
gaps if custom DMA channel offsets are used, potentially triggering a
hardware bus fault during an ethtool dump?

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drive=
rs/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 1cf0f8820b337..82ce81fb6a18b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -351,8 +351,9 @@ static int stmmac_ethtool_get_regs_len(struct net_dev=
ice *dev)
>  {
>  	struct stmmac_priv *priv =3D netdev_priv(dev);
> =20
> -	if (priv->plat->core_type =3D=3D DWMAC_CORE_XGMAC)
> -		return XGMAC_REGSIZE * 4;
> +	if (priv->plat->core_type =3D=3D DWMAC_CORE_XGMAC ||
> +	    priv->plat->core_type =3D=3D DWMAC_CORE_25GMAC)
> +		return XGMAC_REGSIZE(priv->plat->dwxgmac_addrs) * 4;
>  	else if (priv->plat->core_type =3D=3D DWMAC_CORE_GMAC4)
>  		return GMAC4_REG_SPACE_SIZE;
>  	return REG_SPACE_SIZE;

[Severity: High]
As mentioned above, this allocates a buffer bounded exclusively by the
maximum DMA offset, which can lead to an out-of-bounds write in
dwxgmac2_dump_regs() if the custom MTL offset is larger.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-qcom_xpcs_=
nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com?part=3D7
