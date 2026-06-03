Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0DE30594F
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 07:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472002; cv=none; b=II0CXoaeJB9/DhZDH2CUIPW6Ghd//8oncX7twcYevbvZfB8e2nc96RJFVtDaLgYJAKvFwoPhctEwXRTb6b487VNuCPeSGp8/PLCrJvORSuULtzHmnLfyeK1JaageyotbpnauItb67hDFmvsU7bJTAnXEL/4wAWYO3uKa8tl9nfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472002; c=relaxed/simple;
	bh=UpdF3IRRrg9XVHbdMoGU6ASW6goYD89gVgypcsuPiCk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jRjkfEmUnF79ECv1uWQV2alM2dzSIMQnvKtbYodNCsf6NcStkww+YOA7g64MqevJLJj2kTNX+y5zU6Mf/ICBabWyMqT86BahlRmzNOPG3T2StqpSwl9YbWKS3BueNnYVNlLtNOlE5E/wjdEr1dfgxAncbVYER96RJLaAUzuQoRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M36xNn/c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M36xNn/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90AF1F00893;
	Wed,  3 Jun 2026 07:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780472000;
	bh=SderxonXwFmWDc2/aGp/cUBwjfknf4pdhKRMHHel5gk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M36xNn/c1d6w44CuqknbKnzazduzBUdpUtxvW4tCgxo0GbJqvmRdV01xOFGrMZIW+
	 FqtbMicAReZx+Eq42aJ+vLGRiOSGAj19LRe2PS/S2N+58YPEY3jwZYwEA/YnxuhkHU
	 oNadv2TCmw6L4uXUyT1jqKBCNSpBnqqU0Rwhkj2RvgRRXFAetjNVj7GBst1f2jFOPe
	 aefPherX6YfbMj7vWJtOSwlYy2lnGBzxt3LYI1oKwnAgNIKF076dsrpEcd/XI8tNG2
	 GZ/ZDos3fqe45FbbZ3nMiTLwKdZl/tWlb/dmrKZ8XNyw8lEs2Ez6nSnizT/MvlTKLr
	 Rqo4m/nysQVzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] power: supply: max8903: add DC and USB input
 current-limit GPIO controls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603071519.807604-3-github.com@herrie.org>
References: <20260603071519.807604-3-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:33:20 +0000
Message-Id: <20260603073320.A90AF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Stack out-of-bounds read and endianness corruption due to `bitmap_=
from_arr32` with a 4-byte `u32`.
- [High] Missing upper-bound validation on `dc-current-limit-gpios` array l=
ength leads to out-of-bounds read and undefined behavior.
- [Medium] Incorrect source selection in get/set properties when DC is acti=
ve but only USB has a configured GPIO.
- [Medium] Negative current limit requests bypass the minimum bounds check =
due to a signedness bug.
- [Low] Memory leak of temporary parsing buffer `map` due to devm_kcalloc.

Pre-existing issues:
- [High] TOCTOU data race between IRQ handlers due to prematurely dropped `=
source_lock`.
--

commit e36685a3d0ef54240804ea29cb948b482e9cc91e
Author: Herman van Hazendonk <github.com@herrie.org>

power: supply: max8903: add DC and USB input current-limit GPIO controls
   =20
This commit adds optional current-limit controls for both DC and USB power
inputs via the POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT property. It parses
device tree nodes for GPIO values and limits, then dynamically steers
requests to the currently active source (DC or USB) while introducing a
mutex to serialize source state changes.

> diff --git a/drivers/power/supply/max8903_charger.c b/drivers/power/suppl=
y/max8903_charger.c
> index 45fbaad6c6470..19c2b348a0456 100644
> --- a/drivers/power/supply/max8903_charger.c
> +++ b/drivers/power/supply/max8903_charger.c

[ ... ]

> @@ -47,6 +76,24 @@ static int max8903_get_property(struct power_supply *p=
sy,
>  		union power_supply_propval *val)
>  {

[ ... ]

> +	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> +		if (ta_in && data->dc_current_limit_gpios)
> +			val->intval =3D dc_limit;
> +		else if (usb_in && data->usb_current_limit_gpio)
> +			val->intval =3D usb_limit;
> +		else
> +			return -ENODATA;
> +		break;

[Severity: Medium]
If both sources are active (where hardware prioritizes DC) but the device
tree only configures USB GPIOs, won't this fall through to the USB branch?

This could result in reporting the inactive USB limit while the hardware
continues drawing unmanaged power from the DC input. Should the code reject
requests for the active source if its GPIOs are missing instead of falling
back to the inactive source?

[ ... ]

> +static int max8903_set_dc_current_limit(struct max8903_data *data, u32 l=
imit_ua)
> +{
> +	int i, best_idx =3D -1;
> +	u32 best_gpio_value;
> +	/*
> +	 * gpio_value is a u32 in the DT mapping and is parse-time
> +	 * validated to fit in BIT(ndescs); size the bitmap to the full
> +	 * width of the source u32 so a DT with up to 32 dc-current-limit
> +	 * GPIOs cannot overflow this stack buffer.
> +	 */
> +	DECLARE_BITMAP(values, BITS_PER_TYPE(u32));

[ ... ]

> +	best_gpio_value =3D data->dc_current_limit_map[best_idx].gpio_value;
> +	bitmap_from_arr32(values, &best_gpio_value, BITS_PER_TYPE(u32));

[Severity: High]
Can this cause a stack out-of-bounds read and endianness corruption?

The bitmap_from_arr32() macro casts the 4-byte pointer to best_gpio_value
to an 8-byte unsigned long pointer on 64-bit systems. This would pull
4 bytes of adjacent uninitialized stack memory into the values bitmap.

On big-endian 64-bit systems, this could incorrectly interpret the value,
placing the intended value in the upper 32 bits and garbage in the lower.

> +	gpiod_set_array_value_cansleep(data->dc_current_limit_gpios->ndescs,
> +				       data->dc_current_limit_gpios->desc,
> +				       data->dc_current_limit_gpios->info,
> +				       values);

[ ... ]

> +static int max8903_set_property(struct power_supply *psy,
> +		enum power_supply_property psp,
> +		const union power_supply_propval *val)
> +{
> +	struct max8903_data *data =3D power_supply_get_drvdata(psy);
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> +		/*
> +		 * Hold source_lock across the source check and the
> +		 * resulting hardware write so the IRQ handler cannot
> +		 * flip ta_in/usb_in between them and have us program the
> +		 * limit for a source that has just gone offline.
> +		 */
> +		mutex_lock(&data->source_lock);
> +		if (data->ta_in && data->dc_current_limit_gpios)
> +			ret =3D max8903_set_dc_current_limit(data, val->intval);
> +		else if (data->usb_in && data->usb_current_limit_gpio)
> +			ret =3D max8903_set_usb_current_limit(data, val->intval);
> +		else
> +			ret =3D -EINVAL;
> +		mutex_unlock(&data->source_lock);
> +		return ret;

[Severity: Medium]
Could a negative requested limit bypass the minimum bounds check here?

The requested limit in val->intval is a signed integer, but it is passed
to functions like max8903_set_usb_current_limit() which expect an unsigned
u32 limit_ua. If a negative value is requested, the implicit cast to u32
would create a very large unsigned value. This would bypass the upper bounds
check and silently configure the maximum possible current instead of
returning -EINVAL.

[ ... ]

> @@ -91,12 +272,21 @@ static irqreturn_t max8903_dcin(int irq, void *_data)
>  	 * library as the line should be flagged GPIO_ACTIVE_LOW in the device
>  	 * tree.
>  	 */
> +	/*
> +	 * Sample the line under source_lock so a concurrent
> +	 * max8903_set_property() observes either the old or the new
> +	 * state consistently, never a torn read where the lock is held
> +	 * but the cached flag is about to be updated.
> +	 */
> +	mutex_lock(&data->source_lock);
>  	ta_in =3D gpiod_get_value(data->dok);
> -
> -	if (ta_in =3D=3D data->ta_in)
> +	if (ta_in =3D=3D data->ta_in) {
> +		mutex_unlock(&data->source_lock);
>  		return IRQ_HANDLED;
> +	}
> =20
>  	data->ta_in =3D ta_in;
> +	mutex_unlock(&data->source_lock);
> =20
>  	/* Set Current-Limit-Mode 1:DC 0:USB */

[Severity: High]
This is a pre-existing issue, but does dropping the lock before evaluating
data->usb_in and calculating the charger enable state expose a race conditi=
on?

If DC and USB states change simultaneously, the threads could interleave.
For example, a DC unplug could evaluate the charger enable state using a
stale data->usb_in =3D 0, while a concurrent USB plug updates usb_in =3D 1.
Could this result in writing the wrong enable state to the hardware?

Should the mutex coverage be extended over the entire state evaluation block
in both max8903_dcin() and max8903_usbin()?

[ ... ]

> +static int max8903_parse_dc_current_limit(struct platform_device *pdev,
> +					  struct max8903_data *data)
> +{

[ ... ]

> +	map =3D devm_kcalloc(dev, map_size, sizeof(*map), GFP_KERNEL);
> +	if (!map)
> +		return -ENOMEM;

[Severity: Low]
Does this leak the temporary map buffer?

The array map is allocated using devm_kcalloc() to temporarily hold device
tree properties for parsing. Once parsed, the buffer isn't explicitly freed,
meaning the devres allocation will persist and waste memory until the
device is unbound.

Would it be better to use kcalloc() and explicitly kfree() it at the end
of the function?

[ ... ]

> +	for (i =3D 0; i < data->dc_current_limit_map_size; i++) {
> +		u32 gpio_value =3D map[i * 2 + 1];
> +
> +		/*
> +		 * gpio_value is the bitmap programmed across the
> +		 * dc-current-limit GPIOs, so it cannot represent more
> +		 * bits than the GPIO array width. A larger value would
> +		 * be silently truncated by gpiod_set_array_value() and
> +		 * select the wrong limit; reject it at parse time so
> +		 * the bogus DT is visible to the integrator.
> +		 */
> +		if (gpio_value >=3D BIT(data->dc_current_limit_gpios->ndescs)) {

[Severity: High]
Does this missing bounds check on ndescs lead to undefined behavior?

The ndescs value is populated from the device tree, and the stack values
array is sized to 32 bits. If the device tree provides an ndescs value of
32 or greater, the BIT(ndescs) macro would trigger undefined behavior on
32-bit systems.

Additionally, passing an unvalidated ndescs to gpiod_set_array_value_cansle=
ep()
could read out of bounds from the values stack array. Should we ensure
ndescs is strictly less than 32 during initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603071519.8076=
04-1-github.com@herrie.org?part=3D2
