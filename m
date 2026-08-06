Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A43490C0A
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786046549; cv=none; b=fuohZsPP8jYLELKW/SwLCs72PBU4yYa45GfuvQy8qSPQaF9zYuYxr+/HlVnnLcLzK+9syDFo1s0mPY9frmNFub553wU+Y44HTtFsnkhJVSaduKSjqCP1JZDn5owB3J5QLKUHjhIdn49DNwicCB8RaDdjEkdqBucss4owqw6c1+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786046549; c=relaxed/simple;
	bh=aR3A6mk8uzbtXPX6FLpgzVjX8G4iWv9KAg2DGvDsU0U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NXBZx/5TWkY1/yOY+zimyHKcfmASgrDZzjhCEKQhqcw/B9pYACIdAYZh28L4hGH3KMGNe8Y/vVwTUM6HbeLYwekXRMgHY4yLqhqWRVfaFDJ27xgm075Znq93gl4eRPR3ko11lDGAqFuh1DBPckBU2luLqW+Uu8RjWiI8Y89WIZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEaww4xU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEaww4xU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AAC1F000E9;
	Thu,  6 Aug 2026 20:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786046543;
	bh=ljLUzDMrnlgQ2ju5bVN6zPAhJWKCi756tC48t65rmNI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YEaww4xUFnc9E/mrhVJYf5cQ8IM2q5yUaY81EFvnDj4jngBLJKRMYcM1bG6GzZJih
	 2msKy/X+PBMx/1Q7YI0TZ2d4wQrCuX3B7vG5n1vOdS++tqmI6fyPaRfjpemhWPOoLh
	 qDD6glIQkHE4mNH4Knr1fMdg5veeMgqQQs5JqY1lSq2KiiOVnVtoBBK9dP40kKpcq2
	 /rITXdEBVyFNV05nmvUCIiEO6ufBLrDiyNHeFNusx1ZKMO437nM1C2/bKt1VvPDjR3
	 CMheN1cwJnG+/1jj71X5SinsPYwUfnzBZB6AqJOT1xa4qWrp8LySdykVIGTpljQNl8
	 xBtQLo549FZqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807-gp2ap070s-v4-2-74f6a67b6272@disroot.org>
References: <20260807-gp2ap070s-v4-0-74f6a67b6272@disroot.org>
 <20260807-gp2ap070s-v4-2-74f6a67b6272@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:02:22 +0000
Message-Id: <20260806200223.94AAC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Calling `regmap_reinit_cache` in device teardown path allocates me=
mory and debugfs nodes improperly.
- [High] Using `REGCACHE_FLAT` without `reg_defaults` breaks threshold boun=
ds checking logic.
- [High] Race condition between IRQ handler and IIO device unregistration l=
eads to Use-After-Free.
- [Medium] Inaccurate timestamping due to unnecessary use of threaded IRQ.
--

--- Patch [2]: [PATCH v4 2/3] iio: proximity: add driver for Sharp GP2AP070=
S proximity sensor ---
commit cd2088367308936b58996051286de0d57904dcfc
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

iio: proximity: add driver for Sharp GP2AP070S proximity sensor
   =20
The GP2AP070S is a proximity sensor designed and manufactured by Sharp
Corporation. This sensor is used in mobile devices, including, but not
limited to - the Samsung Galaxy J6.
   =20
Link: https://github.com/Exynos7870/android_kernel_samsung_universal7870/bl=
ob/lineage-16.0/drivers/sensors/gp2ap070s.c [1]

diff --git a/drivers/iio/proximity/gp2ap070s.c b/drivers/iio/proximity/gp2a=
p070s.c
new file mode 100644
index 0000000000000..49770c308ddbb
--- /dev/null
+++ b/drivers/iio/proximity/gp2ap070s.c
@@ -0,0 +1,491 @@
[ ... ]
> +static const struct regmap_config gp2ap070s_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.volatile_reg =3D gp2ap070s_regmap_volatile,
> +	.max_register =3D GP2AP070S_REG_MAX,
> +	.cache_type =3D REGCACHE_FLAT,
> +};

[Severity: High]
Does using REGCACHE_FLAT without providing initial hardware defaults break
the threshold bounds checking logic?

Because PS_THD_LO_LE16 and PS_THD_HI_LE16 are not written during probe, the
flat regmap cache implementation satisfies reads from its 0-initialized arr=
ay
and does not fall back to hardware. This causes unwritten registers to be
cached as 0, which breaks the bounds check in
gp2ap070s_iio_write_event_value().

[ ... ]
> +static int gp2ap070s_iio_write_event_value(struct iio_dev *indio_dev,
[ ... ]
> +	case IIO_EV_DIR_RISING:
> +		ret =3D regmap_bulk_read(drvdata->regmap,
> +				       GP2AP070S_REG_PS_THD_LO_LE16, &value,
> +				       sizeof(value));
> +		if (ret)
> +			return ret;
> +
> +		/* Ensure lo_threshold < hi_threshold */
> +		threshold_other =3D le16_to_cpu(value);
> +		if (threshold_other >=3D val)
> +			return -EINVAL;
> +
> +		value =3D cpu_to_le16(val);
> +		ret =3D regmap_bulk_write(drvdata->regmap,
> +					GP2AP070S_REG_PS_THD_HI_LE16, &value,
> +					sizeof(value));
> +		if (ret)
> +			return ret;
> +
> +		return 0;
> +	case IIO_EV_DIR_FALLING:
> +		ret =3D regmap_bulk_read(drvdata->regmap,
> +				       GP2AP070S_REG_PS_THD_HI_LE16, &value,
> +				       sizeof(value));
> +		if (ret)
> +			return ret;
> +
> +		/* Ensure hi_threshold > lo_threshold */
> +		threshold_other =3D le16_to_cpu(value);
> +		if (threshold_other <=3D val)
> +			return -EINVAL;

[Severity: High]
Could this reject valid writes to the falling threshold?

If a user writes the falling threshold before the rising threshold,
threshold_other will be incorrectly read as 0 from the uninitialized cache.
The check (0 <=3D val) will always evaluate to true for positive values,
returning -EINVAL.

[ ... ]
> +static irqreturn_t gp2ap070s_irq_handler(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev =3D private;
> +	s64 timestamp =3D iio_get_time_ns(indio_dev);

[Severity: Medium]
Will this timestamp suffer from thread scheduling latency?

Since the IRQ is requested with a NULL primary handler, this entire routine
executes in a kernel thread. Capturing the timestamp in threaded context
rather than hard IRQ context can introduce jitter to the IIO event
timestamps.

> +
> +	iio_push_event(indio_dev,
> +		       IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 0, IIO_EV_TYPE_THRESH,
> +					    IIO_EV_DIR_EITHER),
> +		       timestamp);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int gp2ap070s_reset(struct gp2ap070s_drvdata *drvdata)
> +{
> +	int ret;
> +
> +	ret =3D regmap_write(drvdata->regmap, GP2AP070S_REG_COM1, 0);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_reinit_cache(drvdata->regmap, &gp2ap070s_regmap_config);
> +}
> +
> +static void gp2ap070s_reset_action(void *private)
> +{
> +	struct gp2ap070s_drvdata *drvdata =3D private;
> +
> +	gp2ap070s_reset(drvdata);
> +}

[Severity: High]
Is it safe to call regmap_reinit_cache() during device teardown?

When the module is unloaded or unbound, the devres group executes
gp2ap070s_reset_action(), which calls gp2ap070s_reset(). Calling
regmap_reinit_cache() allocates memory and attempts to re-create debugfs
nodes.

The I2C subsystem cleans up the client's debugfs directory before devres
actions run, so attempting to create files in a destroyed parent directory
can lead to kernel warnings or memory corruption.

[ ... ]
> +static int gp2ap070s_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +					gp2ap070s_irq_handler, IRQF_ONESHOT,
> +					"gp2ap070s-irq", indio_dev);

[Severity: Medium]
Is it necessary to use a threaded IRQ here?

Since the interrupt handler only captures a timestamp and pushes an event
without performing blocking operations like I2C reads, could this run as a
primary hard IRQ handler to improve timestamp accuracy?

> +	if (ret)
> +		return ret;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

[Severity: High]
Does registering the IRQ before the IIO device introduce a use-after-free
race during module unload?

Due to devres LIFO ordering, devm_iio_device_register() cleanup runs first
on removal, calling iio_device_unregister() and destroying the event
interface.

If an interrupt fires in the window before the IRQ is freed,
gp2ap070s_irq_handler() will execute and call iio_push_event(), which races
with the teardown thread and can dereference the freed event interface.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-gp2ap070s-=
v4-0-74f6a67b6272@disroot.org?part=3D2
