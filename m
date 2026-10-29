Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259507;
	b=nsIlRlnDDpkYZiotAc83xzvV0QD3SfVca3HXydcsjWGdPiSU/BGazlxxdK+WqouzjiQw
	 8WXvBHLv1+RsnSTn3zp8T+vcobB/J1b7NDMgF4opqTZX6PiwsZGKKqT6iyPtil33e6wtO
	 55Z3hHIlghGcAHGeUATN88ynkhLqZaG9SgwYccEf+9caK0q9y6MqSf+vYLVWWI1ye9Q6X
	 WSyW2LJTWlFcPDuMVCWjt7kYqTjp19+LgzEwssx64dGFMxe/zQtGHl1iNNEwdDrJB/UoL
	 Gn6yHleqdcuMB9Gx5FkYHYOBKrkM6qIoPKmm5leGxtwJMjzrf3l1jq64a//VYDF1nSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259507;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HdaCpG3xHjPbAuRqgGQwJZPQZPsjTAPVx96jWcykvuM=;
	b=UvQjzTxNEYJyVE47bzGrqoRpHUsCrXujAyylZvcYGATVvLJvxVjR7sRD3g54HwATAZaa
	 hFkDieyc46EnzNrDTuj3d5f5NVx6GNwkOAmL+zrDlAK1Qrf985h42zUJLoH8kLjKMNwIq
	 GqATP4NUgH+AayImbj8dAdJWaiJJ9iOPTjlZpEsoDMSFCNZjIZNmLAvuJjTu2sztseLkc
	 AfeDF7ebT6rPsifVEK9AizmsrvCyprF8NWwMMEBBV3pAeQJyMfRGH9ULDDgchKPyUyN8z
	 BKN3GlQmSeSmJmJX63PFY97EWnshLdBo0oa32l0u0N/yiUhqGto4qUfjZGFfCVe0DPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bdsGPa7h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920FF606A31D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bdsGPa7h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4451F01829;
	Thu, 29 Oct 2026 07:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793259507;
	bh=HdaCpG3xHjPbAuRqgGQwJZPQZPsjTAPVx96jWcykvuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bdsGPa7hJoxzwmUnMvvsALtlxwxJNAs/QNSsHrMKWgSGH6y5n120niWoszoTMMx0c
	 KK9oekaA5G5PxaD93A6XZnePHZmpl6XoW+MqyssnJ5xcg2HKWzOszo47Y54pF9CRCe
	 PJy9lVQGm5+VWVvRwTPlUewI9zn+NttSB+xpyiLFuikRk65v4BRdVnApidkL+eQ6Om
	 R+mj3ByRPFZoov+nRPW2hNBrZvkGGkJwRoSCaypHULPwP6oeSFwOFEZcqUJ4mNr2pL
	 u9OO+ftfmKotXFuFx9Snrk9rsUeaA30FyLLezYj7tYT7ZmA5Q64t91bJE1ISMbHiRD
	 BMwN63AunW6vw==
Message-ID: <sashiko-outbox-188884@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] power: supply: add LT8491 battery charger driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029073012.1498-3-johnerasmusmari.geronimo@analog.com>
References: <20261029073012.1498-1-johnerasmusmari.geronimo@analog.com>
 <20261029073012.1498-3-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 07:38:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] power: supply: lt8491: missing psy_cfg.fwnode init in lt8491_pro=
be()
--

commit 04ac7bfe3dd376e9c91848a21ebd5b60545acb14
Author: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

power: supply: add LT8491 battery charger driver

This commit adds a power supply driver for the Analog Devices LT8491
buck-boost battery charge controller over I2C, reading resistor
configuration from the devicetree and exposing telemetry and temperature
limit properties.

> diff --git a/drivers/power/supply/lt8491_charger.c b/drivers/power/supply=
/lt8491_charger.c
> new file mode 100644
> index 0000000000000..eab5ea72060fc
> --- /dev/null
> +++ b/drivers/power/supply/lt8491_charger.c

[ ... ]

> +static int lt8491_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct lt8491_info *info;
> +	struct power_supply_config psy_cfg =3D {};
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_READ_WORD_DATA))
> +		return -EOPNOTSUPP;
> +
> +	info =3D devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	info->client =3D client;
> +	psy_cfg.drv_data =3D info;
> +
> +	ret =3D devm_mutex_init(dev, &info->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D lt8491_read_serial_number(info);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Can't read serial. Hardware error.\n");
> +
> +	ret =3D lt8491_configure_telemetry(info);
> +	if (ret)
> +		return ret;
> +
> +	info->psp =3D devm_power_supply_register(dev, &lt8491_desc, &psy_cfg);

[Severity: Medium]
Should lt8491_probe() also set psy_cfg.fwnode =3D dev_fwnode(dev) (or
psy_cfg.of_node =3D dev->of_node) before calling devm_power_supply_register=
()?

In drivers/power/supply/power_supply_core.c, __power_supply_register() sets
the power supply device's firmware node from cfg->fwnode:

	if (cfg) {
		device_set_node(dev, cfg->fwnode);
		dev->groups =3D cfg->attr_grp;
		psy->drv_data =3D cfg->drv_data;
		psy->supplied_to =3D cfg->supplied_to;
		psy->num_supplicants =3D cfg->num_supplicants;
	}

Leaving psy_cfg.fwnode unset leaves psy->dev.fwnode as NULL, which prevents
power_supply_check_supplies() from parsing the power-supplies property and
prevents __power_supply_find_supply_from_node() from matching this supply
when referenced by phandle in the devicetree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029073012.1498=
-1-johnerasmusmari.geronimo@analog.com?part=3D2
