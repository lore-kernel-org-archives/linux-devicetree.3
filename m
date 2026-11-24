Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543098;
	b=MrfuQrfy/zk9C6/arBuo0KpWSoPaT99iNyL6Y9gRYTfqZpCwmIMDd+xAHJSKI/zDNooU
	 +ev6htIImyJFjRAAzkFnwpioX969EnxtN7tnlXt/N5kchL/l/qfK7WvvevRvXugaMrMh8
	 1vDJX4My3+aG74sLjO8V1rhADcjI/FMpfmUwz6dYN4BmRvSPzrCFHFt9U+FjYWI3A4+rO
	 8ht1D1ed1OWQj5d+JJsaredGbFXx5/zWqndHd9H9y+nQ/Sio6dgUM6eh7EWv39GYRba92
	 lfyincKeC4dBjOPKR8gE1ZLhuT6Eg5Visuadn6DrKt9c9B4hRqwVIPViiP0qChOThng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543098;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M1CE+hBX3IDnET7Gsn87wedzV1yqfQfJYw1/6Q2t2u8=;
	b=dONyly0IDsdCUEe+6yc/pNu6xynZ05PBM8LebzJhHBD8Gb6jPfIxnDajFwglGOf38NkE
	 fQ4BZwkuKZEFEtTTxUiOxd66KveUU/twFLa0Y8FXmWr7IECPgT7ME9sR8s38ZuYKTjM6c
	 a2EfNHFAoRBbUApb5LZxPH+V5wRpEfhlBT6hjgyeNdGHxG1NPxOnODJH49PBBEiYh3nIu
	 mobi/mgeUzivcann/K9bqWTOLDKBWWfmpQ8ThfPFuZj1rOG1N2iRNOSG3SIIYO0HuMGZ8
	 MkyWA4352bEjIKHDrf7gpnccdWPv8rQRCX24kQJv2w0deuwkyx4kEamlpqqMGVgg1WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjXpSDwE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F71606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjXpSDwE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B921F000C0;
	Tue, 24 Nov 2026 17:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795543098;
	bh=M1CE+hBX3IDnET7Gsn87wedzV1yqfQfJYw1/6Q2t2u8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TjXpSDwELqySkR2dqriO7JxRq4JVeIpf9mSFgzdGm9+f1Gg2zh8omElwPwkQqY3Gd
	 8Sw0vp2EE/8/4OfBMucO045pAAldIJ22pUTuDdYNe+dlrVkTLolmzNYI/6qRu942q9
	 nfF6mnnIuE4ghgeTByBf3dWu7VnWL+Zyr8jEFjP4iOBSq73qKZzmezpZHkE5eY3inL
	 /WU8aOehva7RTNtPFaQzFbxczebzA4/uer+LNuuNJOzkjeAlwDgrUp1EDklQV4+OPS
	 N6mfhPmKQi+AHjSBjHuqr8fKMLLlKaEGp5GnykErXIha/9aPsD9ggHqETLiT8j4wPu
	 ORYwsYDa9MdEQ==
Message-ID: <sashiko-outbox-231760@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] power: supply: Add Maxim DS28E16 battery cycle
 counter driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armandas Kvietkus" <armandas.kvietkus@proton.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-ds28e16-v1-2-bed431df0578@proton.me>
References: <20261124-ds28e16-v1-0-bed431df0578@proton.me>
 <20261124-ds28e16-v1-2-bed431df0578@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:58:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] power: supply: ds28e16: sleeping GPIO direction calls under
  local_irq_save()
- [Medium] power: supply: ds28e16: unmasked counter underflow in
  ds28e16_set_property()
- [Medium] power: supply: ds28e16: push-pull high drive in
  ds28e16_read_bit()
- [Low] power: supply: ds28e16: raw GPIO accessors bypass DT flags in
  1-Wire I/O
- [Low] power: supply: ds28e16: duplicate crc16() in ds28e16_crc16() and
  unused macro
- [Low] power: supply: ds28e16: hardcoded PRESENT=3D1 and undocumented
  writable ABI
--

commit 1d14a8e7dbd2abdb56c7c466b16af18109974ace
Author: Armandas Kvietkus <armandas.kvietkus@proton.me>

power: supply: Add Maxim DS28E16 battery cycle counter driver

This commit adds a power supply driver for the Maxim DS28E16 battery
authenticator that reads and increments the battery cycle count over a
GPIO-driven 1-Wire line.

> diff --git a/drivers/power/supply/ds28e16_battery.c b/drivers/power/suppl=
y/ds28e16_battery.c
> new file mode 100644
> index 0000000000000..f23201eb63694
> --- /dev/null
> +++ b/drivers/power/supply/ds28e16_battery.c
> @@ -0,0 +1,335 @@

[ ... ]

> +#define DS28E16_CMD_READ_ROM	0x33
> +#define DS28E16_CMD_SKIP_ROM	0xcc
> +#define DS28E16_CMD_START	0x66
> +#define DS28E16_CMD_READ_MEM	0x44
> +#define DS28E16_CMD_RELEASE	0xaa
> +#define DS28E16_CMD_DECREMENT	0xc9
> +#define DS28E16_RESULT_OK	0xaa
> +#define DS28E16_DC_PAGE		2
> +#define DS28E16_DC_INIT		0x1ffff
> +#define DS28E16_PAGE_LEN	32
> +#define DS28E16_READ_DELAY_MS	50
> +#define DS28E16_DEC_DELAY_MS	50
> +#define DS28E16_TRIES		10
> +
> +struct ds28e16 {
> +	struct device *dev;
> +	struct gpio_desc *gpio;
> +	struct power_supply *psy;
> +	struct mutex lock;
> +	int cycle_count;
> +	bool valid;
> +};
> +
> +static int ds28e16_reset(struct ds28e16 *ds)
> +{
> +	unsigned long flags;
> +	int presence;
> +
> +	local_irq_save(flags);
> +	gpiod_direction_output_raw(ds->gpio, 0);
> +	udelay(50);
> +	gpiod_direction_input(ds->gpio);
> +	udelay(7);
> +	presence =3D gpiod_get_raw_value(ds->gpio);
> +	udelay(50);
> +	local_irq_restore(flags);
> +
> +	return presence ? -ENODEV : 0;
> +}

[Severity: High]
Can gpiod_direction_output_raw() and gpiod_direction_input() be called
under local_irq_save() here, in ds28e16_read_byte() -> ds28e16_read_bit(),
and in ds28e16_write_byte()?

Both helpers call gpiod_line_state_notify(), which takes the non-raw
rwlock_t desc->gdev->line_state_lock (triggering
CONFIG_PROVE_RAW_LOCK_NESTING splats and sleeping in atomic context on
PREEMPT_RT) and runs line-state notifiers 24 times per read byte inside
the 1 us and 5 us 1-Wire Overdrive bit windows.  gpiod_direction_input()
also calls gpio_set_bias(), which takes pctldev->mutex on pinctrl-backed
GPIOs when bias flags are set, and ds28e16_probe() never checks
gpiod_cansleep(ds->gpio) to reject sleeping GPIO expanders.

> +
> +static int ds28e16_read_bit(struct ds28e16 *ds)
> +{
> +	int v;
> +
> +	gpiod_direction_output_raw(ds->gpio, 0);
> +	udelay(1);
> +	gpiod_direction_input(ds->gpio);
> +	v =3D gpiod_get_raw_value(ds->gpio);
> +	udelay(5);
> +	gpiod_direction_output_raw(ds->gpio, 1);
> +	udelay(6);
> +
> +	return v;
> +}

[Severity: Medium]
Does gpiod_direction_output_raw(ds->gpio, 1) cause bus contention on the
open-drain 1-Wire line when reading a 0 bit?

In 1-Wire Overdrive mode, the DS28E16 pulls the line low for 6 to 16 us to
transmit a 0, so actively driving the GPIO high in push-pull mode 5 us
after releasing the line shorts the master's output stage against the
slave's pulldown transistor.

> +
> +static void ds28e16_write_bit(struct ds28e16 *ds, int bit)
> +{
> +	gpiod_set_raw_value(ds->gpio, 0);
> +	udelay(1);
> +	if (bit)
> +		gpiod_set_raw_value(ds->gpio, 1);
> +	udelay(10);
> +	gpiod_set_raw_value(ds->gpio, 1);
> +	udelay(6);
> +}

[Severity: Low]
Should ds28e16_reset(), ds28e16_read_bit(), ds28e16_write_bit(), and
ds28e16_write_byte() use the logical gpiod_direction_output(),
gpiod_get_value(), and gpiod_set_value() helpers instead of the _raw
variants?  Using raw accessors bypasses GPIO polarity and open-drain flags
from Device Tree.

[ ... ]

> +static u16 ds28e16_crc16(u16 crc, u8 data)
> +{
> +	static const u8 oddparity[16] =3D {
> +		0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0
> +	};
> +	u16 d =3D (data ^ (crc & 0xff)) & 0xff;
> +
> +	crc >>=3D 8;
> +	if (oddparity[d & 0xf] ^ oddparity[d >> 4])
> +		crc ^=3D 0xc001;
> +	d <<=3D 6;
> +	crc ^=3D d;
> +	d <<=3D 1;
> +	crc ^=3D d;
> +
> +	return crc;
> +}

[Severity: Low]
This isn't a bug, but ds28e16_crc16() duplicates crc16() from
<linux/crc16.h> (with select CRC16 in Kconfig).  Also,
DS28E16_CMD_READ_ROM is unused.

[ ... ]

> +static int ds28e16_read_cycle_count(struct ds28e16 *ds)
> +{
> +	u8 page[DS28E16_PAGE_LEN];
> +	int i, ret =3D -EIO;
> +
> +	for (i =3D 0; i < DS28E16_TRIES; i++) {
> +		ret =3D ds28e16_read_page(ds, DS28E16_DC_PAGE, page);
> +		if (!ret)
> +			return DS28E16_DC_INIT -
> +			       (page[0] | page[1] << 8 | page[2] << 16);
> +	}
> +
> +	return ret;
> +}

[Severity: Medium]
Can ds28e16_read_cycle_count() return a negative non-errno value when any
of bits 7..1 in page[2] are set?

DS28E16_DC_INIT is 0x1ffff (17 bits), but page[0..2] forms an unmasked
24-bit value, so non-zero upper bits in page[2] produce values down to
-0xfe0000 that ds28e16_set_property() returns directly to VFS as an error
code.  In addition, ds28e16_set_property() does not reject writes when cur
has reached DS28E16_DC_INIT and the hardware decrement counter is already
0.

> +
> +static int ds28e16_get_property(struct power_supply *psy,
> +				enum power_supply_property psp,
> +				union power_supply_propval *val)
> +{
> +	struct ds28e16 *ds =3D power_supply_get_drvdata(psy);
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CYCLE_COUNT: {
> +		guard(mutex)(&ds->lock);
> +		if (!ds->valid) {
> +			ret =3D ds28e16_read_cycle_count(ds);
> +			gpiod_direction_input(ds->gpio);
> +			if (ret < 0)
> +				return -ENODATA;
> +			ds->cycle_count =3D ret;
> +			ds->valid =3D true;
> +		}
> +		val->intval =3D ds->cycle_count;
> +		return 0;
> +	}
> +	case POWER_SUPPLY_PROP_PRESENT:
> +		val->intval =3D 1;
> +		return 0;

[Severity: Low]
Should POWER_SUPPLY_PROP_PRESENT check whether the DS28E16 responds on the
1-Wire bus instead of always reporting 1 when no battery pack is
connected?

Also, ds28e16_psy_desc makes POWER_SUPPLY_PROP_CYCLE_COUNT writable on a
POWER_SUPPLY_TYPE_UNKNOWN supply, while
Documentation/ABI/testing/sysfs-class-power documents cycle_count as
read-only.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-ds28e16-v1=
-0-bed431df0578@proton.me?part=3D2
