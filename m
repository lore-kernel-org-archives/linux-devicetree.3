Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BC93B14DD
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301606; cv=none; b=iOe92rMg3/oPrVmocPMrqidgnpMFAN5HX77L3QaRDZ5oO354+TTDiMWKdH68W4y6MV5vxe5fc/OcDjn92ji+1jJml+KXxIbHSZLy3fsi73w8clFRgcm+6dx1FvOBdDxa50bOMDWYYMbapBVE56HnGizAJbJ0grBLHLQBo4pzrvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301606; c=relaxed/simple;
	bh=Y9P3Rpqczg36R4MBvxJIJTy49lHpE83Xma28nBd90qU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iRiNuLiKYjjdC2OD2u9eEFO2vWbAL9j3/HEMMw/ktIIA2E8/ZIgCuWz3rCMRRlCOvU+31n1/Au5VGGr6S6u5wktN0+rqUJaLKbOetqcIxR6J+ymjvRF/tqDdHArG3mNEOgzrSPROZMWZnaZuiwFAbJ2kd5R/8LdGedfdl/5VcT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AH6AymMX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AH6AymMX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAE71F000E9;
	Fri, 21 Aug 2026 08:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787301605;
	bh=NM0b3rA/SiMYehuFw9SNM1ytDyw+E4fAEXuIWs17CyY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AH6AymMXJdS4yI+bNRg+WO1T7ag12R25a1SOc/NayS8YbOVYp6GAVW6aRXq522BJh
	 8dDm2fE61+VRKZO+VOmaETeQQwaeL2OE1nnJ442MsS4X8dsEzgRGew3sP9lRI/5uDQ
	 2cr1fD6f3vJOkGRmMnmof+pM9+8a76p3mW77oH69cx0xguN7tVM26SOmHC5F+jwoxO
	 Hu6JW0nFZQ3L0oJaSrAYvEYLV3IVUlQUDs2i/JHxOTTOzVDWgO8h5Q9A4sjKlKAguo
	 QN7fsjWzSR+TzuKlDbkLJnO3j2JOX32s8Ej7Zy9K+Ke0aRIrRd79jeOFjWDzYucZn7
	 IJC6FagUOwFNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] usb: typec: tipd: Add sn201202x support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260821-tipd-ace3-v5-3-3244ed3bdc3f@chaosmail.tech>
References: <20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech>
 <20260821-tipd-ace3-v5-3-3244ed3bdc3f@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 08:40:04 +0000
Message-Id: <20260821084004.CCAE71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The `tipd_sn201202x_data` structure fails to initialize the `.read=
_power_status` callback, causing a NULL pointer dereference when invoked.
- [Medium] Enabling `CONFIG_TYPEC_SN201202X` does not guarantee compilation=
 because the Makefile skips the `tipd/` directory if `CONFIG_TYPEC_TPS6598X=
` is disabled.
- [Medium] Missing `spmi_command_sleep()` on wakeup completion timeout leav=
es the controller awake on error paths.
- [Low] Pointer to integer cast of different size in `sn201202x_probe` trig=
gers compiler warnings on 64-bit architectures.
- [Low] Implicit positional structure initialization in `sn201202x_of_match=
` bypasses designated initializer syntax.
--

--- Patch [3]: [PATCH v5 3/3] usb: typec: tipd: Add sn201202x support ---
commit cf60ef5ec1afc63ccae95643a77a2844f4dd0245
Author: Sasha Finkelstein <k@chaosmail.tech>

usb: typec: tipd: Add sn201202x support
   =20
Add support for sn201202x (aka ACE3), a tipd variant that uses a very
similar register map, that is exposed over a "logical register"
interface on the SPMI bus.

> diff --git a/drivers/usb/typec/tipd/Kconfig b/drivers/usb/typec/tipd/Kcon=
fig
> index c87cbe6109ca6..8177f860f89de 100644
> --- a/drivers/usb/typec/tipd/Kconfig
> +++ b/drivers/usb/typec/tipd/Kconfig
[ ... ]
> @@ -14,3 +14,15 @@ config TYPEC_TPS6598X
> =20
>  	  If you choose to build this driver as a dynamically linked module, the
>  	  module will be called tps6598x.ko.
> +
> +config TYPEC_SN201202X
> +	tristate "TI SN201202x USB Power Delivery controller support"
> +	depends on SPMI
> +	select TYPEC_TPS6598X_CORE

[Severity: Medium]
Does enabling CONFIG_TYPEC_SN201202X guarantee that this driver will be
built?

It appears that the parent drivers/usb/typec/Makefile only descends into
the tipd/ directory if CONFIG_TYPEC_TPS6598X is enabled. If someone selects
CONFIG_TYPEC_SN201202X without CONFIG_TYPEC_TPS6598X, could this module
be silently excluded from the build entirely?

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 36fccd45858bf..296bc8adcc91e 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
[ ... ]
> @@ -1950,11 +1950,31 @@ static const struct tipd_data tipd_tps25750_data =
=3D {
>  	.connect =3D tps6598x_connect,
>  };
> =20
> +static const struct tipd_data tipd_sn201202x_data =3D {
> +	.irq_handler =3D cd321x_interrupt,
> +	.irq_mask1 =3D APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
> +		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
> +		     APPLE_CD_REG_INT_PLUG_EVENT,
> +	.tps_struct_size =3D sizeof(struct sn201202x),
> +	.remove =3D cd321x_remove,
> +	.register_port =3D cd321x_register_port,
> +	.unregister_port =3D cd321x_unregister_port,
> +	.trace_data_status =3D trace_cd321x_data_status,
> +	.trace_power_status =3D trace_tps6598x_power_status,
> +	.trace_status =3D trace_tps6598x_status,
> +	.init =3D cd321x_init,
> +	.read_data_status =3D cd321x_read_data_status,
> +	.reset =3D cd321x_reset,
> +	.switch_power_state =3D cd321x_switch_power_state,
> +	.connect =3D cd321x_connect,
> +};

[Severity: High]
Is the .read_power_status callback intentionally omitted here?

Without it, the uninitialized callback defaults to NULL.=20

Would this result in a NULL pointer dereference during device probe? In=20
tipd_init(), if a plug is present (status & TPS_STATUS_PLUG_PRESENT),=20
the code invokes the callback unconditionally:

    if (!tps->data->read_power_status(tps))
        goto err_unregister_port;

This same NULL dereference could also happen in cd321x_interrupt() when a
power status update is received (event & APPLE_CD_REG_INT_POWER_STATUS_UPDA=
TE).

> diff --git a/drivers/usb/typec/tipd/spmi.c b/drivers/usb/typec/tipd/spmi.c
> new file mode 100644
> index 0000000000000..15976d15d9bce
> --- /dev/null
> +++ b/drivers/usb/typec/tipd/spmi.c
[ ... ]
> +static const struct of_device_id sn201202x_of_match[] =3D {
> +	{ .compatible =3D "apple,sn201202x", (void *)TIPD_VARIANT_SN201202X},

[Severity: Low]
Is it intentional to use positional initialization for the data field here?

Mixing designated initializers (.compatible) with positional ones can
bypass designated initializer syntax and be error-prone if the structure
changes. Should this explicitly use .data =3D (void *)TIPD_VARIANT_SN201202=
X?

> +	{}
> +};
> +
> +static int sn201202x_probe(struct spmi_device *device)
> +{
> +	const struct of_device_id *match;
> +	const struct tipd_data *data;
> +	struct sn201202x *sn;
> +	struct tps6598x *tps;
> +	int irq_select, irq_sleep, irq_wake;
> +	int ret;
> +
> +	match =3D of_match_device(sn201202x_of_match, &device->dev);
> +	if (!match)
> +		return -EINVAL;
> +	data =3D tipd_hw_variants[(enum tipd_hw_variant)match->data];

[Severity: Low]
Could this direct cast from a pointer (match->data) to an enum cause
compiler warnings?

On 64-bit architectures where pointers are 64-bit and enums are 32-bit
(like ARM64), this might trigger a -Wpointer-to-int-cast warning. Should
this cast through an unsigned long or uintptr_t first?

[ ... ]
> +	ret =3D spmi_command_wakeup(device);
> +	if (ret)
> +		return ret;
> +	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies=
(100)))
> +		return -ETIMEDOUT;

[Severity: Medium]
If this wait_for_completion_timeout() times out, should the hardware be
put back to sleep?

By returning -ETIMEDOUT without calling spmi_command_sleep(), could the
device be left in an active state indefinitely and drain power?

[ ... ]
> +static int __maybe_unused sn201202x_resume(struct device *dev)
> +{
> +	struct tps6598x *tps =3D dev_get_drvdata(dev);
> +	struct sn201202x *sn =3D tps_to_sn(tps);
> +	int err;
> +
> +	reinit_completion(&sn->wake_completion);
> +	err =3D spmi_command_wakeup(sn->sdev);
> +	if (err)
> +		return err;
> +	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies=
(100)))
> +		return -ETIMEDOUT;

[Severity: Medium]
Similarly here in the resume path, does this error return need to send a
sleep command to revert the hardware state if the wakeup times out?

> +	return tipd_resume(tps);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-tipd-ace3-=
v5-0-3244ed3bdc3f@chaosmail.tech?part=3D3
