Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301347;
	b=kD77I0SJO6AxASnDmVtNPE05YZ3QFBAoEGaGPcxg7OrlE0NyKDT7GaXIWR6umqpb04XY
	 54HymTlFH3P2u8txafNed61H3tynzEb9OJsXgegzSXnFnXrHSxJTLTPGR4dRgpHLTxv1n
	 f987GOshlE2LzO/gEDWIHKeVJXYrt8BDn+8CasCBR6q9RpdpGRxtY+XKkB7wPhtAod2Gw
	 yFWpqrzpjkLP5Of7Y+BAkXVHofDCsTHnMBcpE+FTjor//z2J57JYGX0Ilc+pImyzeSduK
	 QNt7CWr/EVd8NGXgt4+Sg7GZRQPK8MU7MouJdNKoi0fuFp0GspxjqC8euIw4WszqarA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301347;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r2sNiGCsEa9CtytmUaN3lzMp1u51FtD+MuUaE6YBnHM=;
	b=vw/8aXSZGnRFtceVFwhUZuypwiHnIOf47ZbGdN8qHQgY7u42Rb99jlPYqCYudRlxzXQb
	 ugAqP19kX+u69gE89C8CxMOzDJY8riEDOej/gScKi3yNsgZHWMgYniYaloXqFBF4y4feq
	 +HDXs80Kd05YEA0hXPwgLxwalnWesl8dahTJaT1xMoEe8ifCHRMwSGYO+W5L+xsTkUm/J
	 dnTU+LSa19d7oCnGyBCaZ2SmkKSRm4/zk6Ji6sJzb2nXrvcITF9lBh+E3Lutg5R+htXe0
	 APHM8rB5KnM7Bs7bkKsSsOhzX9dbc9BjUOGt1dwL8dTgx1YuSurXEkomdnXDNcn5Yaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hhhoQyeN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC24606A33E
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hhhoQyeN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E270A1F0089F;
	Tue, 10 Nov 2026 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794301347;
	bh=r2sNiGCsEa9CtytmUaN3lzMp1u51FtD+MuUaE6YBnHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hhhoQyeNp3UAxCx5QqgvhlzOxP34RCCbx8uLxJmdL0g3dWL1L2ILkYLkSM5zTty01
	 l3jcRgRJVO8BVmndcmfYSJ+LcBfhiZTvw+yZ87TWTzUNeZ51cCzCx1nkgrhiSLjQc8
	 QnB6QCQI4bvijmn19LffYvJVMYSj9XCzZznF3hIXcB6BVmcY66ZcfKNLMJyYlW5v9y
	 lUTS5SgjoHv1nWTqf5adL/NRBqGSeOueQGqaeUvbbTPjtRE/rlhU9CZshgIa0q7M4b
	 sxy9uyIMe4GxmKcGpb5gXGWnFepM/yiXzWWFqzT77y8oDqFe36/sih7QZJ6q3Pv/Jf
	 Qo9yzrg/z1afQ==
Message-ID: <sashiko-outbox-206699@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 7/7] net: ethernet: adi: adin1110: Add OA
 TC6 protocol support for ADIN1110
Reply-To: sashiko-reviews@lists.linux.dev
To: "Iustin Stolniceanu" <iustin.stolniceanu@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109085952.105331-8-iustin.stolniceanu@analog.com>
References: <20261109085952.105331-1-iustin.stolniceanu@analog.com>
 <20261109085952.105331-8-iustin.stolniceanu@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 09:02:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] net: adin1110: NULL netdev_ops dereference in
  adin1110_oa_tc6_probe()
--

commit a8946759404622a473f14b5de5bca9f8c82eea9c
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: adi: adin1110: Add OA TC6 protocol support for ADIN1110

This commit adds OPEN Alliance TC6 SPI protocol support for the ADIN1110
using the oa_tc6 framework when the adi,spi-oa-tc6 property is present.

> diff --git a/drivers/net/ethernet/adi/adin1110.c b/drivers/net/ethernet/a=
di/adin1110.c
> index 53fac3dc8be62..3f054565acb0e 100644
> --- a/drivers/net/ethernet/adi/adin1110.c
> +++ b/drivers/net/ethernet/adi/adin1110.c

[ ... ]

> +static int adin1110_oa_tc6_probe(struct adin1110_priv *priv)
> +{
> +	struct adin1110_port_priv *port_priv;
> +	struct oa_tc6_quirks quirks =3D {0};
> +	struct net_device *netdev;
> +	struct device *dev;
> +	u32 val;
> +	int ret;
> +
> +	dev =3D &priv->spidev->dev;
> +
> +	if (priv->cfg->id =3D=3D ADIN2111_MAC)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "OA TC6 isn't supported for ADIN2111\n");
> +
> +	netdev =3D devm_alloc_etherdev(dev, sizeof(*port_priv));
> +	if (!netdev)
> +		return -ENOMEM;
> +
> +	port_priv =3D netdev_priv(netdev);
> +	port_priv->netdev =3D netdev;
> +	port_priv->priv =3D priv;
> +	port_priv->cfg =3D priv->cfg;
> +	port_priv->nr =3D 0;
> +	priv->ports[0] =3D port_priv;
> +	SET_NETDEV_DEV(netdev, dev);
> +
> +	quirks.hwreset_settle_us =3D 50000;
> +	quirks.softreset_settle_us =3D 10000;
> +
> +	port_priv->tc6 =3D oa_tc6_init(priv->spidev, netdev, &quirks);
> +	if (PTR_ERR_OR_ZERO(port_priv->tc6) =3D=3D -EPROTO)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "no OA TC6 reply, check the SPI_CFG1 strap and adi,spi-oa-tc6\n=
");
> +	if (IS_ERR(port_priv->tc6))
> +		return PTR_ERR(port_priv->tc6);
> +
> +	priv->read_reg =3D adin1110_read_reg_tc6;
> +	priv->write_reg =3D adin1110_write_reg_tc6;
> +
> +	ret =3D devm_add_action_or_reset(dev, adin1110_oa_tc6_remove, port_priv=
->tc6);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D adin1110_read_reg(priv, ADIN1110_PHY_ID, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (val !=3D priv->cfg->phy_id_val)
> +		return dev_err_probe(dev, -ENODEV, "PHY ID expected: %x, read: %x\n",
> +				     priv->cfg->phy_id_val, val);
> +
> +	/* The OA TC6 framework doesn't append the FCS, let the MAC do it. */
> +	ret =3D adin1110_set_bits(priv, ADIN1110_CONFIG2, ADIN1110_CRC_APPEND,
> +				ADIN1110_CRC_APPEND);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (device_get_ethdev_address(dev, netdev))
> +		eth_hw_addr_random(netdev);
> +
> +	netdev->if_port =3D IF_PORT_10BASET;
> +	netdev->netdev_ops =3D &adin1110_tc6_netdev_ops;

[Severity: High]
Does calling oa_tc6_init() before setting netdev->netdev_ops cause a NULL
pointer dereference when CONFIG_NET_SHAPER is enabled?

oa_tc6_init() calls oa_tc6_phy_init() -> phy_connect_direct() ->
phy_attach_direct() -> phy_link_topo_add_phy() -> netdev_need_ops_lock(),
which dereferences dev->netdev_ops->net_shaper_ops while netdev->netdev_ops
is still NULL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109085952.1053=
31-1-iustin.stolniceanu@analog.com?part=3D7
