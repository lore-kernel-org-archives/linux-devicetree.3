Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4FE257851
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102144; cv=none; b=ZbynAaApfhJbkbvyUoNZWNH5Dqv8N1O6y7gDQ+/Vze4A7qpmqDkNjttlcw2PLx99FPIhW0/XLRBzfZgp8RyuN+bQPSyDBlFNR59dbpGldo7n5L8Ijt1+1VQWYXk2vMZeuQ865r+K0c1tOsMBQH6g1bEqUZ1nhxSQbwu+GDL+li8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102144; c=relaxed/simple;
	bh=2B2H+HplEWSNzmbOwOMQuOZe/T+5XzEda2beBtrDOaA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K0X4d9H7SJukyCl/8sqAIGNc839jZQXpl8w9iOyYsKHtlmXeiihhRm0AIzj4WCSSQi8ClY36BbrENH1p0Z5B17hfJkAaKTW1BrFIhUsAJc49lRfCEUHYgLVS9q80AkF57nNh3697XXBiy3qO205eGtCvsrLEjhTtosldFN3PM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iesj9xAd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iesj9xAd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC381F00898;
	Sat, 30 May 2026 00:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102143;
	bh=8dJeArgNGYjG6GWzBvdqdKVslm7D/cDFmoggC3WfFDo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iesj9xAd9P4yGMpnQPQF1mKrZJkarzPXyFqV9I4nUNdq1LCMRrrG+NQkRS6a18VVh
	 TK4FCyRUlUrDdCjjkGfUleOSmxKJdkpSBLRPvYalvsOuZnUbg7CICOL/O6vyhjylnc
	 Q0NvWxRmxHKNuu36P6b83yDKxUl5X9fcZWPfAZUzS4NLJnTjBCOaQtGuJ3okCDUN9C
	 WuK7DwyYGDbBlvByl4yEJqKh8eGy7dlbkVqpobIPQqwkFZ8qJ8RuwU9A+yKwU2CLs5
	 Vq0wqm9qPa52zOsWy8o7je2hUhLLePW1E/0CXcNJYlk1P1OZ5irKnf77seRzh536ku
	 ENWpb0H6sSfEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 5/5] net: dsa: ks8995: Delete surplus driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260526-ks8995-to-ksz8-v3-5-c530f651989f@kernel.org>
References: <20260526-ks8995-to-ksz8-v3-5-c530f651989f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:49:02 +0000
Message-Id: <20260530004902.BCC381F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Silent loss of switch driver functionality on kernel upgrade due=
 to missing Kconfig migration.

Pre-existing issues:
- [High] The replacement driver (ksz_spi) fails to probe for devices instan=
tiated via platform data (non-DT) because it lacks driver_data in its spi_d=
evice_id table.
- [High] The replacement driver fails to explicitly enable the Port 5 PHY m=
ode, a required initialization step performed by the old driver.
- [High] The MTU limit logic in ksz8863_change_mtu is completely inverted f=
or packet sizes between 1523 and 1536 bytes, causing hardware packet drops.
--

commit 19ced6cb5c2f1c58320168d553069a57634b8e9d
Author: Linus Walleij <linusw@kernel.org>

net: dsa: ks8995: Delete surplus driver
   =20
The Microchip ksz driver now handles all switches that the
old driver was handling, but better.
   =20
Delete the old driver.

> diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
> index e704ab702c189..7e6d98ebbd522 100644
> --- a/drivers/net/dsa/Kconfig
> +++ b/drivers/net/dsa/Kconfig
> @@ -97,15 +97,6 @@ config NET_DSA_RZN1_A5PSW
>  	  This driver supports the A5PSW switch, which is embedded in Renesas
>  	  RZ/N1 SoC.
> =20
> -config NET_DSA_KS8995
> -	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
> -	depends on SPI
> -	depends on !NET_DSA_MICROCHIP_KSZ_SPI
> -	select NET_DSA_TAG_NONE
> -	help
> -	  This driver supports the Micrel KS8995 family of 10/100 Mbit ethernet
> -	  switches, managed over SPI.
> -

[Severity: Medium]
Will completely removing CONFIG_NET_DSA_KS8995 cause a silent loss of switch
driver functionality on kernel upgrades?

By not providing a Kconfig transition path, users with CONFIG_NET_DSA_KS8995
enabled will have the driver silently dropped from their configurations dur=
ing
make oldconfig.=20

Does it make sense to leave a dummy NET_DSA_KS8995 config that selects the
new NET_DSA_MICROCHIP_KSZ_SPI driver to ensure a smooth transition?

> diff --git a/drivers/net/dsa/ks8995.c b/drivers/net/dsa/ks8995.c
> deleted file mode 100644
> index 77d8b842693c1..0000000000000
> --- a/drivers/net/dsa/ks8995.c
> +++ /dev/null
[ ... ]
> -static int ks8995_check_config(struct ks8995_switch *ks)
> -{
> -	int ret;
> -	u8 val;
> -
> -	ret =3D ks8995_read_reg(ks, KS8995_REG_GC0, &val);
> -	if (ret) {
> -		dev_err(ks->dev, "failed to read KS8995_REG_GC0\n");
> -		return ret;
> -	}
> -
> -	dev_dbg(ks->dev, "port 5 PHY %senabled\n",
> -		(val & KS8995_GC0_P5_PHY) ? "" : "not ");
> -
> -	val |=3D KS8995_GC0_P5_PHY;
> -	ret =3D ks8995_write_reg(ks, KS8995_REG_GC0, val);

[Severity: High]
This isn't a bug introduced by this patch, but removing this driver exposes=
 a
potential regression in the replacement driver.

The replacement generic Microchip ksz driver does not appear to configure
KS8995_GC0_P5_PHY (BIT 3 in REG 0x02) in its setup path for KSZ8995XA
switches. According to the datasheet, the hardware default for this bit
is 0 (disabled).

For hardware designs that rely on software to configure Port 5 into PHY mode
rather than hardware strapping, won't this missing initialization leave the=
 PHY
disabled and break network connectivity for migrated users?

[ ... ]
> -static int ks8995_change_mtu(struct dsa_switch *ds, int port, int new_mt=
u)
> -{
> -	struct ks8995_switch *ks =3D ds->priv;
> -	unsigned int max_mtu;
> -	int ret;
> -	u8 val;
> -	int i;
[ ... ]
> -	if (max_mtu <=3D 1522) {
> -		val &=3D ~KS8995_GC2_HUGE;
> -		val &=3D ~KS8995_GC2_LEGAL;
> -	} else if (max_mtu > 1522 && max_mtu <=3D 1536) {
> -		/* This accepts packets up to 1536 bytes */
> -		val &=3D ~KS8995_GC2_HUGE;
> -		val |=3D KS8995_GC2_LEGAL;
> -	} else {
> -		/* This accepts packets up to 1916 bytes */
> -		val |=3D KS8995_GC2_HUGE;
> -		val |=3D KS8995_GC2_LEGAL;
> -	}

[Severity: High]
This is a pre-existing issue in the replacement driver, but forcing users
off the old driver will expose them to it.

The old driver correctly overrides the 1522-byte limit to allow frames up
to 1536 bytes by setting KS8995_GC2_LEGAL (BIT 1). However,
ksz8863_change_mtu() in the ksz8.c driver appears to have the exact
opposite logic:

    if (frame_size <=3D legalsz)
        ctrl2 |=3D KSZ8863_LEGAL_PACKET_ENABLE;

For frame sizes between 1523 and 1536 bytes, this condition is false, leavi=
ng
ctrl2 =3D 0.=20

Doesn't this clear the bit and strictly enforce the 1522-byte limit, causing
the hardware to drop these packets instead of allowing them?

[ ... ]
> -static const struct spi_device_id ks8995_id[] =3D {
> -	{"ks8995", ks8995},
> -	{"ksz8864", ksz8864},
> -	{"ksz8795", ksz8795},
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(spi, ks8995_id);

[Severity: High]
This isn't a bug introduced by this patch, but migrating non-DeviceTree
setups to the ksz_spi replacement driver will result in probe failures.

The deleted driver successfully supported non-DT SPI instantiation because
it read the variant directly via spi_get_device_id(spi)->driver_data.=20

The replacement ksz_spi driver relies on device_get_match_data(), which
requires the spi_device_id table to populate the .driver_data field for
fallback matching on non-DT systems. Since ksz_spi_ids only provides string
names (e.g., { "ks8995" }) with a default 0/NULL driver_data,
device_get_match_data() will return NULL and the probe will immediately
abort with -EINVAL.=20

Will this stranding of non-DT users require an update to ksz_spi_ids in the
replacement driver before deleting this one?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-ks8995-to-=
ksz8-v3-0-c530f651989f@kernel.org?part=3D5
