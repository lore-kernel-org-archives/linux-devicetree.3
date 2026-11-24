Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521768;
	b=yJXzFmL+cIKyfZm62XCjBAy4+gxGQQnn2KQskfi7YzVDrvOStOIK3j7LiFD2eXanzSH2
	 po7M4gFAOOLzEJevzSwpI7W9v9tZlNVp+hoISRJ4yb1gwLkRlPU/uVTJdNyUH+gF/lwsK
	 A+JIA9lJPS+5sqUC7g0K/iWAfT3Hho+82M2bCky3/mNbYiTIDTXHqsZpYKPcRWTZDhesK
	 ZyZw9tP/sGXfN1zJiaznpTTZogIsB5eT58rLNFh3GliJ98DL6vn8ZKqOBlWWH4IBYBSB+
	 Dv0WZLll+xzIOIeh5muKmQqmy2XCi7Bz+x5UWDbB497pki9/BsJ8lxcghlTS/5ekvKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521768;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=njjx8+oQtzyGAC1NugS2WX1liqLqjY/p8JrPnTCC5tw=;
	b=Ys13w1pLWspoCBZPobVbM6U34pnnzq3dkEfLw6cgDYul55+m17eYN6PQvAVi8aA+1znI
	 QAS6JP+flmmmkzw0DlDjAEN2BYYnSRpMxyM0ZVM9frbXIubD2v2A3Id2acqkmS0QnWhi1
	 qmr+0Rjaa+hUkSPvBMW1HmoL33GEZimRt5msvM9U5wgzrrl/tJPcATWzHod00QAbBsgWR
	 Y75Ayt+zEc/hfrrYDSs3nVmd47J/I5tiK95DtgH9brJUNUPLpmLQloErFLKTRFJSIx3J+
	 xY9gBfuWrfhVo5XwlYpcihOb7OQ6B9avksFyIDE9tvlkIQSqWuMgTnYQrZbeKqFkA3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5sA80UE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F83606A31E;
	Tue, 24 Nov 2026 12:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5sA80UE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681591F000C0;
	Tue, 24 Nov 2026 12:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521768;
	bh=njjx8+oQtzyGAC1NugS2WX1liqLqjY/p8JrPnTCC5tw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T5sA80UElmTUAuIRL5pUw6nY1Si5Bdm8QwlmsCPUJ/48JEa1fPf1cgtnLhmY55jC7
	 AZvJ44RmX7x40HuogE96i423f6vu34ng8Ak6+7MykRRfxLVWjEZk4/c5/ipxkSlFbe
	 nVJMjnjHL0GZ+vW36PdD8/RCuT1d86YiG1kP2q/1+nVqQQKiZqKAi8qT1uul7L7z5h
	 JaLs/x6BNcvWdfLWok5RTLgp4A1J3qYZUOOVtv6K2LeFbbK32YI3op32Y8muACGY7e
	 hunqr6LsGluVTI4NCdWJ58A4IvvJS86EZWBIHM+N+YaFL2iPUERBSQqqif9PtDSi3T
	 xnh3yi+1YV9FQ==
Subject: Re: [PATCH net-next v3 3/7] net: ethernet: oa_tc6: Add support for
 MDIO indirect access
From: netdev-bot+sashiko@kernel.org
To: iustin.stolniceanu@analog.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, parthiban.veerasooran@microchip.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, marcelo.schmitt@analog.com,
 alvin.sipraga@analog.com, ciprian.regus@analog.com,
 Selvamani.Rajagopal@onsemi.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 12:02:46 +0000
Message-ID: <179552176696.3135.1446966801724449711@kernel.org>
In-Reply-To: <20261123115743.29523-4-iustin.stolniceanu@analog.com>
References: <20261123115743.29523-4-iustin.stolniceanu@analog.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] SPECULATIVE (this depends on MAC-PHY MDIOACC trigger semantics
  that I could not check against the OA TC6 specification).
- [Low] In indirect mode, oa_tc6_mdiobus_register()
  (drivers/net/ethernet/oa_tc6.c:674) installs read_c45/write_c45, which…

--

net: ethernet: oa_tc6: Add support for MDIO indirect access

This patch reads STDCAP when the OA TC6 MDIO bus is registered. If direct
PHY register access (DPRAC) is not supported but indirect access (IPRAC)
is, the Clause 22 and Clause 45 MDIO operations go through the MDIOACC
registers. On a turnaround error, reads return 0xffff so the PHY bus scan
skips the address, and writes return -EIO.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index c05480b7920ea..ca33df9f045eb 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c

[ ... ]

> @@ -434,24 +435,149 @@ int oa_tc6_write_register_mms(struct oa_tc6 *tc6, u8 mms, u16 address,
>  }
>  EXPORT_SYMBOL_GPL(oa_tc6_write_register_mms);
>  
> -static int oa_tc6_check_phy_reg_direct_access_capability(struct oa_tc6 *tc6)
> +static void oa_tc6_handle_link_change(struct net_device *netdev)
>  {
> -	u32 regval;
> +	phy_print_status(netdev->phydev);
> +}
> +
> +static int oa_tc6_mdioacc_wait_done(struct oa_tc6 *tc6, u32 *regval)
> +{
> +	int ret, err;
> +
> +	ret = read_poll_timeout(oa_tc6_read_register, err,
> +				err || (*regval & OA_TC6_MDIOACC_TRDONE),
> +				100, 30000, false, tc6, OA_TC6_REG_MDIOACC(1),
> +				regval);
> +	if (ret)
> +		return ret;
> +
> +	return err;
> +}

[ ... ]

> -	return 0;
> +static int oa_tc6_indirect_mdiobus_read_c45(struct oa_tc6 *tc6, int addr,
> +					    int devnum, int regnum)
> +{
> +	u32 reg_val;
> +	int ret;
> +
> +	reg_val = FIELD_PREP(OA_TC6_MDIOACC_OP, OA_TC6_MDIOACC_OP_ADDR);
> +	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_ST, OA_TC6_MDIOACC_ST_C45);
> +	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_PRTAD, addr);
> +	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DEVAD, devnum);
> +	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DATA, regnum);
> +
> +	ret = oa_tc6_write_register(tc6, OA_TC6_REG_MDIOACC(0), reg_val);
> +	if (ret)
> +		return ret;
> +
> +	reg_val = FIELD_PREP(OA_TC6_MDIOACC_OP, OA_TC6_MDIOACC_OP_RD);
> +	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_ST, OA_TC6_MDIOACC_ST_C45);
> +	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_PRTAD, addr);
> +	reg_val |= FIELD_PREP(OA_TC6_MDIOACC_DEVAD, devnum);
> +
> +	ret = oa_tc6_write_register(tc6, OA_TC6_REG_MDIOACC(1), reg_val);
> +	if (ret)
> +		return ret;
> +
> +	ret = oa_tc6_mdioacc_wait_done(tc6, &reg_val);

[Severity: Medium]
This one depends on how a MAC-PHY executes the MDIOACC frames. The code
doesn't describe that, and I couldn't check it against the OA TC6
specification, so this may well be fine.

The ADDRESS frame is written to MDIOACC0 and the READ frame to MDIOACC1,
in two separate SPI control transactions. Nothing waits for TRDONE in
MDIOACC0, and oa_tc6_mdioacc_wait_done() only polls MDIOACC1.
oa_tc6_indirect_mdiobus_write_c45() uses the same split sequence.

For Clause 22, oa_tc6_indirect_mdiobus_read() and
oa_tc6_indirect_mdiobus_write() write their only frame to MDIOACC1:

	ret = oa_tc6_write_register(tc6, OA_TC6_REG_MDIOACC(1), reg_val);

The adin1110.c driver uses the same register layout. It puts its single
C22 frame in MDIOACC0 (ADIN1110_MDIOACC, 0x20) and polls that register.

Suppose a MAC-PHY starts at MDIOACC0 and stops at the first entry that
already has TRDONE set. Would a C22 frame written only to MDIOACC1 ever
run? Would the C45 sequence stop after the ADDRESS frame, because MDIOACC1
still has TRDONE set from the previous transaction?

In that case oa_tc6_mdioacc_wait_done() would time out after 30ms. The
error would propagate out of the C22/C45 bus scan, and mdiobus_register()
and oa_tc6_init() would fail.

On a MAC-PHY that runs one frame per register write, could the MDIOACC1
write arrive while the ADDRESS frame is still on the wire?

This sequence apparently works on the ADIN1110. The framework, though,
claims support for any MAC-PHY that reports IPRAC. Would it be more robust
to write both C45 frames in one burst with
oa_tc6_write_registers(tc6, OA_TC6_REG_MDIOACC(0), vals, 2), and to use
MDIOACC0 for C22 as adin1110.c does? That would also save one SPI transfer
per C45 access.

> +	if (ret)
> +		return ret;
> +
> +	return oa_tc6_mdioacc_read_data(reg_val);
>  }

[ ... ]

> @@ -533,8 +673,21 @@ EXPORT_SYMBOL_GPL(oa_tc6_mdiobus_write_c45);
>  
>  static int oa_tc6_mdiobus_register(struct oa_tc6 *tc6)
>  {
> +	u32 regval;
>  	int ret;
>  
> +	ret = oa_tc6_read_register(tc6, OA_TC6_REG_STDCAP, &regval);
> +	if (ret)
> +		return ret;
> +
> +	if (!(regval & OA_TC6_STDCAP_DIRECT_PHY_REG_ACCESS)) {
> +		if (!(regval & OA_TC6_STDCAP_INDIRECT_PHY_REG_ACCESS)) {
> +			netdev_err(tc6->netdev, "MDIO direct/indirect access not supported\n");
> +			return -ENODEV;
> +		}
> +		tc6->mdio_indirect_mode = true;
> +	}

[Severity: Low]
In indirect mode, oa_tc6_mdiobus_register() still installs read_c45 and
write_c45, and it doesn't set phy_mask. Does this make the phylib C45 bus
scan very expensive over SPI?

In direct mode, oa_tc6_mdiobus_read() ignores addr. The C22 scan fills
mdio_map[] at every address, and mdiobus_scan_bus_c45() then skips all of
them because they are already populated.

In indirect mode, PRTAD is encoded, so the integrated PHY answers at only
one address. __mdiobus_register() then runs the C45 scan over the other 31
addresses:

drivers/net/phy/mdio_bus_provider.c:__mdiobus_register() {
    ...
	prevent_c45_scan = mdiobus_prevent_c45_scan(bus);

	if (!prevent_c45_scan && bus->read_c45) {
		err = mdiobus_scan_bus_c45(bus);
    ...
}

mdiobus_prevent_c45_scan() only blocks the scan for Micrel OUIs.

At each empty address, oa_tc6_mdioacc_read_data() returns 0xffff on
TAERR. get_phy_c45_ids() therefore sees devices-in-package as all ones and
walks every MMD, which is about 62 indirect C45 reads per address.

Each of those reads is an MDIOACC0 write, an MDIOACC1 write and at least
one MDIOACC1 poll read, usually with a 100us sleep in read_poll_timeout().
That comes to roughly 31 * 62 * 3, or more than 5,700 SPI control
transactions during probe.

adin1140.c sets phy_mask = GENMASK(31, 1) on its OA TC6 MDIO bus, and
adin1110.c sets phy_mask = ~GENMASK(2, 0). Could the scan be limited with
phy_mask here as well? Alternatively, could the C45 pass be skipped once
the C22 scan has found the PHY?

>  	tc6->mdiobus = mdiobus_alloc();
>  	if (!tc6->mdiobus) {
>  		netdev_err(tc6->netdev, "MDIO bus alloc failed\n");

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123115743.29523-1-iustin.stolniceanu%40analog.com
