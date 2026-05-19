Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317AF49251D
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189654; cv=none; b=RnMN2RnV0RbvP1859N1CFKN639kuiIg9IhNK8YTO5Mr074J6P5HGdjRoEvJSg2pBMMFAuQl+Qvrk4RYhnx2/reh0YgfvzbB7mPmhNaARF/5TUr5E4tKm2pTQoADbYJ9f36i2pl3vgJ6s2meBmZoE4yh5SLEEtF6n4StZOu3oywA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189654; c=relaxed/simple;
	bh=sCSBoVz4DecWamqd5qWOE7ZMimI/epb/9SurpARq93Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NbE4htmv+FOAFzc45AXkZmMwccE9sbU6O648JEAEW+Gpvu4krJqpgsuPNTLQ9oibDxKQykjp3KAHsSvIErLCeJ+wDEqFsBv8QdNLZvaTB2VwYTc5NpWbyT+f+bNNF9K9GKoBNL2ggkgu2W8OMNTZSISHhnZuY0V2ggbHsSynkR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2TuQlkL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2TuQlkL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3474C2BCB3;
	Tue, 19 May 2026 11:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189654;
	bh=sCSBoVz4DecWamqd5qWOE7ZMimI/epb/9SurpARq93Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=p2TuQlkLEtj+2ZxJIq6wWxwW619CDx2Tn7EaiqntbJDwUemdN+/L5llqRIB6sPXWF
	 cz5njkRVVWarkUWnPQBZp2m9DTfJDe5wWvYwWmMG0XLc4Cix0PN3Q3xFn6+oZGYJOx
	 4LwcdfLLwvXe8ZLvfKv3r8hJamkljK7phyUcFvWQastblVLEMvIDny+CGVlAIY7A+H
	 m4Ma5NC+s1FQe9C1+HoNEIQrbTxudq0eR/gl3rUOESITD5RmBRTJF6N9gCgj6pJ/Kt
	 1IJ8AO3V8XD0THPVIN/vBLa88DLcp1ki2ZHotd0sUsRfcbDf8fdhJXGH3knJrZBYLR
	 qj3tltVyQfrXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:20:53 +0000
Message-Id: <20260519112053.B3474C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Use-After-Free of `struct powercap_zone` due to `devm_kcalloc` all=
ocation mismatch with sysfs lifecycle.
- [Medium] Phantom power limit constraints are exposed for domains lacking =
hardware support and register definitions.
- [Medium] Writing the time window register completely overwrites it, clobb=
ering reserved or unmapped bits.
- [Medium] Missing bounds check for time window values causes silent trunca=
tion.
--

commit ea2fae1431dc06b5cc4040ca37ee79438a5a76d5
Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

powercap: qcom: Add SPEL powercap driver

This commit adds a new powercap driver for the Qualcomm SoC Power and
Electrical Limits (SPEL) hardware. It provides hardware-based power
monitoring and limiting capabilities for various power domains.

> diff --git a/drivers/powercap/qcom_spel.c b/drivers/powercap/qcom_spel.c
> new file mode 100644
> index 0000000000000..fed5647959a53
> --- /dev/null
> +++ b/drivers/powercap/qcom_spel.c
[ ... ]
> +static int spel_write_pl_data(struct spel_domain *sd, int pl,
> +			      enum pl_ops_type pl_op, unsigned long long value)
> +{
[ ... ]
> +	case PL_LIMIT:
> +		new_val =3D spel_unit_xlate(sd, POWER_UNIT, value, 1);
> +		if (new_val > POWER_LIMIT_MASK)
> +			return -EINVAL;
> +		reg_val =3D (reg_val & ~POWER_LIMIT_MASK) | new_val;
[ ... ]
> +	case PL_TIME_WINDOW:
> +		/*
> +		 * Encode time window: upper 7 bits to [22:16], lower 15 bits to [14:0]
> +		 * Time window register is separate from limit register (different off=
set),
> +		 * so we write only the time window bits without preserving any enable=
 bit.
> +		 */
> +		new_val =3D spel_unit_xlate(sd, TIME_UNIT, value, 1);

Could this silently truncate the time window if the user provides a value
that exceeds the hardware's 22-bit capacity (0x3FFFFF)?=20

It looks like there is no bounds check here, similar to the one for PL_LIMIT
above, so the bitwise operations would just discard the upper bits.

> +		reg_val =3D (((new_val >> 15) & 0x7F) << 16) |
> +			  (new_val & 0x7FFF);

Does this assignment clobber reserved or unmapped bits in the register?

The original register value is read into reg_val via readl(), but this
directly overwrites it, discarding bit 15 and bits 23-31. Should this
perform a read-modify-write by masking out only TIME_WINDOW_MASK_H and
TIME_WINDOW_MASK_L instead?

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	writel(reg_val, reg_addr);
> +	return 0;
> +}
[ ... ]
> +static void spel_init_domains(struct spel_system *sp)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < SPEL_DOMAIN_MAX; i++) {
> +		struct spel_domain *sd =3D &sp->domains[i];
> +
> +		sd->sp =3D sp;
> +		snprintf(sd->name, SPEL_DOMAIN_NAME_LENGTH, "%s",
> +			 spel_domain_names[i]);
> +		sd->id =3D i;
> +		sd->status_reg =3D sp->node_base + domain_offsets[i];
> +
> +		/* PL1 is always supported (required for powercap registration) */
> +		sp->limits[i] =3D BIT(POWER_LIMIT1);
> +		sd->pl_name[POWER_LIMIT1] =3D pl_names[POWER_LIMIT1];

Does this expose phantom power limit constraints for domains lacking hardwa=
re
support?=20

The constraints array only defines register offsets for SPEL_DOMAIN_SYS and
SPEL_DOMAIN_SOC. If POWER_LIMIT1 is unconditionally enabled for all domains
like CL0 and IGPU, any userspace read or write to these constraint attribut=
es
will fall back to get_pl_ops_offset() and return -EOPNOTSUPP since there are
no matching entries.

Since the powercap framework supports zones with 0 constraints, should the
driver rely purely on the hardware capabilities register to discover suppor=
ted
limits instead?

> +	}
> +}
[ ... ]
> +static int spel_init_system(struct spel_system *sp, struct device *dev)
> +{
> +	int i, ret;
> +
> +	/* Read unit configuration (common for all domains) */
> +	ret =3D spel_check_unit(sp);
> +	if (ret) {
> +		dev_err(dev, "Failed to read unit config\n");
> +		return ret;
> +	}
> +
> +	sp->domains =3D devm_kcalloc(dev, SPEL_DOMAIN_MAX,
> +				   sizeof(struct spel_domain), GFP_KERNEL);

Can this lead to a use-after-free if userspace holds a sysfs file open?

The driver embeds a struct powercap_zone inside struct spel_domain, which is
allocated via devm_kcalloc() here.

When the driver is unbound, powercap_unregister_zone() is called, which cal=
ls
device_unregister() to drop a reference. If user-space holds a sysfs file
open, the device reference count remains > 0. When remove() returns, devres
will immediately free the memory. Once the file is closed, the final kref_p=
ut()
will attempt to invoke the .release callback on the already-freed memory.

Should structures embedding reference-counted devices be dynamically alloca=
ted
and freed inside their .release callback?

> +	if (!sp->domains)
> +		return -ENOMEM;
> +
> +	spel_init_domains(sp);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-qcom_spel_=
driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com?part=3D2
