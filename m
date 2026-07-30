Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83A438B14B
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429480; cv=none; b=K/el+4HReExFfylxBU6plsy1/2mcQ8h7UsUpOQyFf9mN+ivU5ka6vt0wFzXzT61LHlW698g5Ih+rUrhRLktcyz3lvaufydYwnP6iY8TkLMWZUuKDhdRKs/dDMyP65OKSCbln0epTgo5HsVkjFVOMjTT72gfBNmRIlP/MUBkdGBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429480; c=relaxed/simple;
	bh=oDCy5ncKOqvGn5JPuAGy1eFoCEzXS3xwiIJ+XPbSGiM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fbs8yoSisHE7BqvQyovZ3U/XWGIUatzq72hXS3GoBaU7vGOzw/4eUgXuC36xjvEIAZzU71ZJcCULeyTpx6J1UYU1/xM672HuF1niJp38/9L2FaE+0FiiUKBSt6s5pf5Jpkgf42XXIYBs4W+auSi2y/8aUBz50JQEmNd20LCYM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqnZ/yRA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqnZ/yRA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659C91F00A3A;
	Thu, 30 Jul 2026 16:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785429478;
	bh=WjZ3rijSUJvFts5uo0Y6P2tL7dxdfplMsYresCPkO7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QqnZ/yRAAzrs9HeB3/YLZcX+zjdUBIND4NnOvi3beBiZF3bJEYEOswLfYefxRfmbG
	 9TPbxAqeZKaut3f3ViwCIu7qyVx+P7nu3jyybX5LK+8BbWaiA+KbfYYVjLu+d16bA/
	 +b+RyQJ4aG6zDaaKufXsodiwNmmRcEvQ+YxoSi/cNrrl+hg66lwVWNsAqMVjJYVWbo
	 zDz8eZFZ3xpieYz4I6nePHnekoe3X53KViKX0JrfkLzIdie2q6csPeXOI3pViCK7+x
	 P1VvnmUJBPW+SMYvELU8IngbYEHN2ewSqZS0bdFXGQpfoHOMoaiSFngruICADy6oeL
	 VwIYtrMRkmgzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] net: dsa: soce: Add initial driver support for MRS
 switches
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729-devel-vstrassheim-soce-dsa-ml-v1-4-be569dae1b20@linutronix.de>
References: <20260729-devel-vstrassheim-soce-dsa-ml-v1-0-be569dae1b20@linutronix.de>
 <20260729-devel-vstrassheim-soce-dsa-ml-v1-4-be569dae1b20@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 16:37:58 +0000
Message-Id: <20260730163758.659C91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Incorrect error check for `devm_of_iomap()` leads to potential NUL=
L pointer dereference on mapping failure.
- [High] The `ds->phys_mii_mask` is never initialized, causing the driver's=
 custom MDIO bus to silently ignore all PHY reads and writes.
- [High] Concurrent MDIO accesses via `slave_mii_bus` and `user_mii_bus` ra=
ce on shared hardware registers, causing state corruption.
- [Medium] Missing bitmasks on input parameters in MDIO hardware register c=
onstruction allows out-of-bounds values to corrupt adjacent register fields.
- [Medium] The driver unconditionally issues a flush command to the hardwar=
e FDB controller even if the previous command is still being processed.
- [Medium] Asynchronous, switch-wide FDB flush is performed instead of a sy=
nchronous, per-port flush.
--

--- Patch [4]: [PATCH 4/4] net: dsa: soce: Add initial driver support for M=
RS switches ---
commit 4ad10a20f72f216349a16415f424608c5d3e5c86
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

net: dsa: soce: Add initial driver support for MRS switches

This commit adds initial support for SoC-e switches based on FPGA IP cores.
It provides MDIO access helpers for supported IP register layouts and common
STP/FDB handling.

> diff --git a/drivers/net/dsa/soce/soce_common.c b/drivers/net/dsa/soce/so=
ce_common.c
> index 0000000000000..f7f345a690e46
> --- /dev/null
> +++ b/drivers/net/dsa/soce/soce_common.c

[ ... ]

> +static void soce_fast_age(struct dsa_switch *ds, int port,
> +			  const struct soce_layout *layout)
> +{
> +	struct soce_priv *priv =3D ds->priv;
> +	struct soce_dsa_local *local;
> +	void __iomem *p_mes_ctrl;
> +	u32 val;
> +
> +	local =3D &priv->local;
> +	if (!layout || !local->base_addr)
> +		return;
> +
> +	p_mes_ctrl =3D local->base_addr + layout->fdb_ctrl;
> +	if (readl_poll_timeout(p_mes_ctrl, val,
> +			       !(val & SOCE_FDB_CLEAR_UNDER_PROCESS),
> +			       SOCE_FAST_AGE_POLL_US, SOCE_FAST_AGE_TIMEOUT_US))
> +		dev_warn(ds->dev, "SoC-e fast_age timeout on port %d\n", port);
> +
> +	writel(SOCE_FDB_CLEAR_FLUSH_MSTID, p_mes_ctrl);

[Severity: Medium]
Does this code continue to issue the flush command even if the hardware is
still processing the previous one? If readl_poll_timeout() fails, it prints
a warning but unconditionally executes the writel() below it.

[Severity: Medium]
Will this flush the entire MSTID globally rather than just the specified po=
rt?
The command ignores the port argument. Additionally, it appears to return
immediately without waiting for the clear operation to complete.

> +}

[ ... ]

> diff --git a/drivers/net/dsa/soce/soce_dsa_core.c b/drivers/net/dsa/soce/=
soce_dsa_core.c
> index 0000000000000..b88d00c56d718
> --- /dev/null
> +++ b/drivers/net/dsa/soce/soce_dsa_core.c

[ ... ]

> +static int soce_phy_read(struct dsa_switch *ds, int port, int regnum)
> +{
> +	struct soce_priv *priv =3D ds->priv;
> +	struct soce_dsa_local *local;
> +
> +	local =3D &priv->local;
> +	if (!local->mdio_ops || !local->mdio_ops->phy_read)
> +		return 0xffff;
> +
> +	return local->mdio_ops->phy_read(ds, port, regnum);
> +}

[Severity: High]
Can concurrent MDIO accesses race on the shared hardware registers here?
The DSA core implicitly registers the slave_mii_bus, and the driver explici=
tly
registers a user_mii_bus. Both buses have their own independent mdio_lock
mutex, but they share the same underlying MMIO routines.

[ ... ]

> +static int soce_sw_probe(struct mdio_device *mdiodev)
> +{
[ ... ]
> +	local->base_addr =3D devm_of_iomap(dev, switch_node, 0, NULL);
> +	if (IS_ERR(local->base_addr)) {
> +		dev_err(dev, "failed to map switch register space for %pOF\n",
> +			switch_node);
> +		of_node_put(switch_node);
> +		return PTR_ERR(local->base_addr);
> +	}

[Severity: High]
Does devm_of_iomap() return NULL on failure rather than an error pointer?
Checking IS_ERR() here will evaluate to false if it returns NULL, leading t=
o a
potential NULL pointer dereference later when accessing the MMIO base.

[ ... ]

> diff --git a/drivers/net/dsa/soce/soce_mdio.c b/drivers/net/dsa/soce/soce=
_mdio.c
> index 0000000000000..241fc373de8b8
> --- /dev/null
> +++ b/drivers/net/dsa/soce/soce_mdio.c

[ ... ]

> +static int soce_user_phy_read(struct mii_bus *bus, int addr, int reg)
> +{
> +	struct dsa_switch *ds =3D bus->priv;
> +
> +	if (ds->phys_mii_mask & BIT(addr))
> +		return ds->ops->phy_read(ds, addr, reg);
> +
> +	return 0xffff;
> +}

[Severity: High]
Is ds->phys_mii_mask ever initialized? It appears to default to 0 when
allocated in soce_sw_probe(). If it is always 0, this check will fail and
all user PHY reads will silently return 0xffff.

[ ... ]

> +int soce_user_mii_bus_register(struct dsa_switch *ds)
> +{
[ ... ]
> +	ds->user_mii_bus->parent =3D ds->dev;
> +	ds->user_mii_bus->phy_mask =3D ~ds->phys_mii_mask;

[Severity: High]
Since ds->phys_mii_mask defaults to 0, will setting phy_mask to the inverted
value instruct the MDIO core to ignore all PHYs and prevent probing entirel=
y?

[ ... ]

> +int soce_mdio_20_03_write(struct dsa_switch *ds, int portnumber, int reg=
num,
> +			  u16 val)
> +{
[ ... ]
> +	/* Then write control */
> +	regvalue =3D (mdio->phy_addr << SOCE_MDIO_20_03_CTRL_PHY_ADDR_SHIFT) |
> +		   (regnum << SOCE_MDIO_20_03_CTRL_REG_ADDR_SHIFT) |
> +		   SOCE_MDIO_20_03_CTRL_OP_WRITE |
> +		   SOCE_MDIO_20_03_CTRL_START |
> +		   mdio->mdio_output;
> +	writel(regvalue, ctrl);

[Severity: Medium]
Should the phy_addr and regnum inputs be bounded or masked before shifting?
If an oversized regnum is passed in via userspace ioctls, or a malformed DT
provides a large soce,phy-addr, the shifted bits could overflow into adjace=
nt
control register fields.

[ ... ]

> +static int soce_mdio_23_02_read_c22(struct dsa_switch *ds, int portnumbe=
r,
> +				    int regnum)
> +{
[ ... ]
> +	regvalue =3D (regnum << SOCE_MDIO_23_02_CTRL_REGADDRDEVTYPE_OFFSET) +
> +		   (mdio->phy_addr << SOCE_MDIO_23_02_CTRL_PHYADDR_OFFSET);
> +	writel(regvalue, params);

[Severity: Medium]
Similarly here, can the addition of unmasked values risk arithmetic overflow
into adjacent bit ranges if the inputs are out-of-bounds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-devel-vstr=
assheim-soce-dsa-ml-v1-0-be569dae1b20@linutronix.de?part=3D4
