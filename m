Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521772;
	b=grwPIqM8dMhVR6vObihh9B8JaX9nT/KzlzbjQSPO1Y+Iwh3D1F+mm5qqChA3HqAX7BaD
	 KNS7DI4mUly9vLcAek6RCrOna3tjAui02HAWEk0Sj6KLbxNDL6nL1C6hYuiGWYHnPxACW
	 sLsvFrc3tn7ipl0lB6FpBtwf82gZEwLoWlv/6UH92a4BW1iTfqgDxys3wSCvJzISkUDQU
	 A6pGnIL7bdI1gWYKnBq122CO6vPws+88laexBnOiUqSV8LSUoGK0Y82hgq/CQNY4+KgxC
	 D4DaONCpISwVG1J9I3AmugNRvDd2BZwqkT/HKeppkAkfU0xi+DTFneCdBEUJ7J2TaNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521772;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=rewfV1m5OFcwBF5amvlQEJwVXgllZw90S5HnVUN5hT0=;
	b=wPCm8KzjqElNVrdBO11olMt/QwElGyUlBZmZNttSw0TgGZWCr2rq6WAc/Z5xvXxTfjSo
	 t8LCSaxNcYG58C6AhLbILKeScd8v+OdoNkiR6KQ2Dg4DzbUNR+kIK43vzsp0J9vs48M51
	 ApRpgmmHGu4fWc1WgPDjBOon4EClGYLABo7+BlCg8U3GwZALgG2Rly0Ssf0QZMKoImJsj
	 Ehzv2pAlXTEwFDwtHwbiIS2WgiPlYxuIqxdPkR29XhjU7IC8GgEtNaUpdKgWcqCMpLP8m
	 izMSErPCEoaX0XBmZTel6fEvJXw2n0fct6xM8Q53fA3zaEKURh6biY1F2Pad/WGiPEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="d7/CpJlP";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D6A606A32E;
	Tue, 24 Nov 2026 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7/CpJlP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA1D1F000E0;
	Tue, 24 Nov 2026 12:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521771;
	bh=rewfV1m5OFcwBF5amvlQEJwVXgllZw90S5HnVUN5hT0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d7/CpJlPkIjsmuJJc/koRUsJg/Mm5wogMzwtHuRSxIifQTpK43ny3RQ2+us5ZFNQe
	 Bk6bTil4QTtKX6bpF9kLk8I8pgEJePRboP6Z4Q/VRWbkag7plupWwnxDUV1jzrfKVK
	 dgd+3u89HJnE2IgsyJsvRwWGq47dUz71ArG8DHkdfpv/93MXJcAh4RNJHw0QouLHnN
	 jpXeXxfTrEZviy7OY7xs6Ta1O0b/kKEUe0rJ/G6K0Id7X4tXyq62/aW08dCKe4lDbi
	 9RZNGWUm97DVMUZysfxigpmVOc8QyHA1FvDIOMCG5wdX7UYYLLYPEmBz3Qu8U7R40p
	 9B8K4aJBAn1GQ==
Subject: Re: [PATCH net-next v3 7/7] net: ethernet: adi: adin1110: Add OA TC6
 protocol support for ADIN1110
From: netdev-bot+sashiko@kernel.org
To: iustin.stolniceanu@analog.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, parthiban.veerasooran@microchip.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, marcelo.schmitt@analog.com,
 alvin.sipraga@analog.com, ciprian.regus@analog.com,
 Selvamani.Rajagopal@onsemi.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 12:02:50 +0000
Message-ID: <179552177040.3135.10993155208943619451@kernel.org>
In-Reply-To: <20261123115743.29523-8-iustin.stolniceanu@analog.com>
References: <20261123115743.29523-8-iustin.stolniceanu@analog.com>
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

- [Medium] On the new OA TC6 path, the ADIN1110 hardware reset is left to
  oa_tc6_init(), which does not follow the reset constraints the driver…
- [Low] The strap/property hint in adin1110_oa_tc6_probe()
  (drivers/net/ethernet/adi/adin1110.c) is printed in the wrong cases.

--

net: ethernet: adi: adin1110: Add OA TC6 protocol support for ADIN1110

This adds OPEN Alliance TC6 SPI protocol support for the ADIN1110. It uses
the oa_tc6 framework and is enabled by the adi,spi-oa-tc6 property.
Register accesses go through read_reg/write_reg callbacks so the MAC
configuration code is shared by both protocols, and the ADIN2111 is
rejected with -ENODEV in TC6 mode.

> diff --git a/drivers/net/ethernet/adi/adin1110.c b/drivers/net/ethernet/adi/adin1110.c
> index 10e7ef33be108..72710d3edd7b3 100644
> --- a/drivers/net/ethernet/adi/adin1110.c
> +++ b/drivers/net/ethernet/adi/adin1110.c

[ ... ]

> @@ -1115,14 +1230,91 @@ static int adin1110_check_spi(struct adin1110_priv *priv)

[ ... ]

> +static int adin1110_oa_tc6_probe(struct adin1110_priv *priv)
> +{

[ ... ]

> +	/* oa_tc6_init() attaches the PHY, which looks at netdev_ops. */
> +	netdev->netdev_ops = &adin1110_tc6_netdev_ops;
> +
> +	quirks.hwreset_settle_us = 50000;
> +	quirks.softreset_settle_us = 10000;
> +
> +	port_priv->tc6 = oa_tc6_init(priv->spidev, netdev, &quirks);

[Severity: Medium]
Does the reset done by oa_tc6_init() meet the ADIN1110 reset requirements
that this driver documents?

The generic SPI path does this in adin1110_check_spi():

	if (reset_gpio) {
		/* MISO pin is used for internal configuration, can't have
		 * anyone else disturbing the SDO line.
		 */
		spi_bus_lock(priv->spidev->controller);

		gpiod_set_value(reset_gpio, 1);
		fsleep(10000);
		gpiod_set_value(reset_gpio, 0);

		/* Need to wait 90 ms before interacting with
		 * the MAC after a HW reset.
		 */
		fsleep(90000);

		spi_bus_unlock(priv->spidev->controller);
	}

The TC6 path does this in oa_tc6_init():

	if (tc6->reset_gpio) {
		...
		fsleep(10);
		gpiod_set_value_cansleep(tc6->reset_gpio, 0);
		fsleep(tc6->quirks.hwreset_settle_us);
	}

The two sequences differ in three ways:

- Reset is held for about 10 us instead of 10 ms.
- The SPI bus is not locked. On a shared bus, another device's transfer
  could drive MISO while the ADIN1110 comes out of reset. The earlier
  commit in this series, "net: ethernet: oa_tc6: Allow custom reset settle
  time values", says the ADIN1110 tristates its SDO pin during reset.
- hwreset_settle_us is 50 ms here. The comment in adin1110_check_spi()
  says 90 ms is needed.

If the 90 ms wait or the bus lock is really required, could the first
control access in oa_tc6_check_ctrl_protection() reach a device that is
not ready? That would return -EPROTO, which is then reported as a strap
problem with -ENODEV. Or is the 90 ms comment in adin1110_check_spi()
stale?

> +	if (PTR_ERR_OR_ZERO(port_priv->tc6) == -EPROTO)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "no OA TC6 reply, check the SPI_CFG1 strap and adi,spi-oa-tc6\n");
> +	if (IS_ERR(port_priv->tc6))
> +		return PTR_ERR(port_priv->tc6);

[ ... ]

> +	ret = adin1110_read_reg(priv, ADIN1110_PHY_ID, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (val != priv->cfg->phy_id_val)
> +		return dev_err_probe(dev, -ENODEV, "PHY ID expected: %x, read: %x\n",
> +				     priv->cfg->phy_id_val, val);

[Severity: Low]
The commit message says:

  If the MAC-PHY gives no valid OA TC6 reply during initialization, or
  the PHY ID does not match, probe fails with -ENODEV and a message
  pointing at the strap and the property.

This PHY ID mismatch message in adin1110_oa_tc6_probe() has no strap or
property hint. The matching check in adin1110_check_spi() gains one in
this same patch:

	"PHY ID expected: %x, read: %x, check the SPI_CFG1 strap and adi,spi-oa-tc6\n"

Should the two messages match?

There is a related question about the -EPROTO check above it. Does
-EPROTO from oa_tc6_init() really mean "no OA TC6 reply"? In oa_tc6.c it
is the generic result of any failed control reply check. For example,
oa_tc6_check_ctrl_read_reply() has:

	if (*tx_buf != *rx_buf)
		return -EPROTO;
	...
			if (complement != ~reply)
				return -EPROTO;

oa_tc6_check_ctrl_write_reply() also returns -EPROTO when its memcmp()
fails.

These checks run on every control access in every phase of
oa_tc6_init(): the protection check, soft reset, interrupt unmask,
PHY/MDIO init and enabling data transfer. oa_tc6_init() passes the errno
up unchanged.

A correctly strapped device could get one corrupted reply later in init.
Would that be reported as a strap or DT misconfiguration, with probe
returning -ENODEV instead of -EPROTO?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123115743.29523-1-iustin.stolniceanu%40analog.com
