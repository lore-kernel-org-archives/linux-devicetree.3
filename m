Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5281C2853E9
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135935; cv=none; b=NflHT5x2Yu5dT94cNdl49u89KxEtOC6c0sPfg5JEH11ieXL6YxQh4un+TmUZNHhPsaSqC+3K8AzA6Kgq36QwG5PSexUJo2RNrIN6HS6PQQOOArKGMVRamfmXNykvS17m0GBc1W5DYL0WLW44+8W5uvY3bgYtVlbHzsSz5eb6sPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135935; c=relaxed/simple;
	bh=ALZtofDvuO+lxRUuzuaKOH0Sc6Qt+qasAxhRtSyMgik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CTK8DRf4KBYUAcbxfakTTn4RqBwxyzlgJqxWFm+a+gbNVQE6XY07a+o6e5a9QWuP+lbBsj0ILQInUd90eUenGQbxviTdc/Wtcds7W4c8FIO/vmVCo2ud4IvHtCGtMrceHKTdwpPnezVNEH4yyn0h4TeqC5igbNIR6uc2yG1arx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTJnfBwS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTJnfBwS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563EAC2BCB7;
	Mon, 18 May 2026 20:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779135934;
	bh=ALZtofDvuO+lxRUuzuaKOH0Sc6Qt+qasAxhRtSyMgik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KTJnfBwSCS3CXiwEO4brOcTlG4qD31P/mckoRFBvMZbVInTzKs93Xl+/MAXEK3nIE
	 HcEzA1BP15DjOMCqvbv08Y4aLLS5VpOBYcZ6roYgNF79Cgp7F8qpDprGBaiesyXtQ4
	 JscguIZzBlszTXj3UxpCvvJmfxY9Mjnl1toYY/B/YTV11Ytb/pPJwI+WBUXquXbHgh
	 q/NZkuoRiVQXHxDDjBE46ufzs6j5uSM9OwL5PieLwhSo1u7AWfGSgvcMaoc2l3Ke2U
	 +TV5RsBbwfxUv5WIzHSRFFVsAbXR7ARJkFpUP3enkhooyk7MAgvmTSYs7Z+oqEWIak
	 xLlTuODc5NNVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V8 03/10] iio: imu: inv_icm42607: Add inv_icm42607 Core
 Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518200526.458421-4-macroalpha82@gmail.com>
References: <20260518200526.458421-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 20:25:33 +0000
Message-Id: <20260518202534.563EAC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unsafe hardware reset polling loop with premature timeouts and mis=
sing delay.
- [High] Strict DT requirement for `interrupt-names` breaks compatibility w=
ith valid bindings.
--

commit 32920ed238e36be6e7fdd4fa2b84b2b710397641
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add inv_icm42607 Core Driver

This commit adds the core component of the new inv_icm42607 driver. It
includes setup functions and the full register definition in the header fil=
e.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> new file mode 100644
> index 0000000000000..b270d48335ba6
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> +static int inv_icm42607_setup(struct inv_icm42607_state *st,
> +			      inv_icm42607_bus_setup bus_setup)
> +{

[ ... ]

> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_SIGNAL_PATH_RESET,
> +			   INV_ICM42607_SIGNAL_PATH_RESET_SOFT_RESET);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read_poll_timeout(st->map, INV_ICM42607_REG_INT_STATUS,
> +				       val, val & INV_ICM42607_INT_STATUS_RESET_DONE,
> +				       INV_ICM42607_RESET_TIME_MS * 100,
> +				       INV_ICM42607_RESET_TIME_MS * 1000);

Could this polling loop fail prematurely if the device returns a read error
while resetting?

Since regmap_read_poll_timeout() evaluates the loop condition as
__ret || (cond), any read error will immediately abort the loop and
return the error. If the device is unresponsive on the bus during reset
(e.g. returning an I2C NACK), it will instantly defeat the polling mechanis=
m.

Additionally, could the timeout of exactly 1ms cause spurious probe failure=
s?

Since 1ms is the typical hardware reset time, this doesn't leave any margin
for scheduling variations or natural hardware differences.

Would it be better to add a mandatory sleep before polling, and increase the
timeout margin?

[ ... ]

> +int inv_icm42607_core_probe(struct regmap *regmap, const struct inv_icm4=
2607_hw *hw,
> +			    inv_icm42607_bus_setup bus_setup)
> +{
> +	struct device *dev =3D regmap_get_device(regmap);
> +	struct inv_icm42607_state *st;
> +	int irq;
> +	int ret;
> +
> +	irq =3D fwnode_irq_get_byname(dev_fwnode(dev), "INT1");
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "Unable to get INT1 interrupt\n");

Does this break compatibility with valid device trees that omit the
optional interrupt-names property?

If interrupt-names is not provided in the device tree, fwnode_irq_get_bynam=
e()
will return -EINVAL and abort the probe.

Could this be modified to fallback to fetching the interrupt by index
(e.g. fwnode_irq_get(dev_fwnode(dev), 0)) if the named lookup fails?

> +
> +	st =3D devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518200526.4584=
21-1-macroalpha82@gmail.com?part=3D3
