Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A182D356742
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 06:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888351; cv=none; b=C9KpIBHySilAW7UgN8W5ysCr/0muaH/2CAt7R7dDFMhfdyOwtthtCd9qn0lvtTKimBQDkx40lhYWrqiUUzxqVrwvekhdZQoh5D0hVLJfqaxl4/ctTWbquZgYnGVXf36Q71sFEIIEFfXpJX5ls0a/qAEogjqaZVpimtMVEFI1CFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888351; c=relaxed/simple;
	bh=sKXeI2WLHjQobC6aKFyWdEiRk1AHVyppZazZEmAEPUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GWzR3R08Drn3ZUe6lEUYLVsJhMQuXRVwHPr5i5AZABjcAwW1eZjEl0eTkujPWXzOzeVwsGkee0tYUQU2diUseqRcQiz2Na3TkkupmxBVtUqKsq7DjeJSGHuAsqreWQJI8Bo3puNh1vjp5lVIlrdm2cZlpwDR1TmTC16qexo1hW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzHg0tsv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzHg0tsv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AE31F000E9;
	Wed,  1 Jul 2026 06:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782888350;
	bh=R2TrApxByrNzKkekKoK3WzOtEkGq/ONuI3qTJSHlQ2E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LzHg0tsvuoWyI5/yuRmzRhL1EgSgAKNTJhzjrounMj+P20eds9qeMx8orStIUd8BH
	 jEcT9q1DNW2Qs2NrqpCbSPS1YZsBOVj0lk2SWUb5zyBf6F0Fi7Y+sq+aVA/zc+mz8b
	 L37IexpHt4/kYX6Jz0YdF3bpCLS1z/uR4Tq6r1USxgLbeEN/0+NyyZMmeT3FQu+w5z
	 tra3jkPWAVzvrtH2NyQgOEjFfOQhEf2/RxwYCoPKjZiwB6DvXGop+xGSvG3/aCqjY7
	 iFw7nkYyy48Gc5dA0cp41Ntkpwvx/50lfUiMTDSNhVD/pTDubOyr79+g79tr1jOEfk
	 uFOtD/pvCyfJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 5/7] qcom-tgu: Add support to configure next action
Reply-To: sashiko-reviews@lists.linux.dev
To: "Songwei Chai" <songwei.chai@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260701055529.445819-6-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
 <20260701055529.445819-6-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 06:45:49 +0000
Message-Id: <20260701064550.09AE31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [High] Modifying `attr->name` dynamically inside the `is_visible` callbac=
k permanently mutates a statically allocated and globally shared sysfs attr=
ibute.
- [Low] The dynamically renamed `default` sysfs node is missing from the AB=
I documentation.

Pre-existing issues:
- [High] Sysfs groups are exposed to userspace before internal data structu=
res are fully allocated, creating a race window for a NULL pointer derefere=
nce panic.
- [High] Missing cleanup of sysfs groups on probe error paths leads to orph=
aned interfaces and Use-After-Free.
- [High] TOCTOU race condition in `enable_tgu_store` causes `pm_runtime_put=
` underflow.
- [High] Runtime PM usage counter leak on module removal.
- [Medium] Uninitialized variable `index` is used in the return statement w=
hen hardware configuration loops are skipped.
- [Medium] `tgu_dataset_show` accesses array elements without holding `drvd=
ata->lock`, leading to data races.
--

commit 321ab56e90d93dd3077807f4f183c67363243eb4
Author: Songwei Chai <songwei.chai@oss.qualcomm.com>

qcom-tgu: Add support to configure next action

This commit adds support to configure the next action for each step by
introducing a select node. It allows configuring triggers, counters, and ti=
mers.

> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Docum=
entation/ABI/testing/sysfs-bus-amba-devices-tgu
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
[ ... ]
> @@ -21,3 +21,10 @@ KernelVersion:	7.2
>  Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songw=
ei.chai@oss.qualcomm.com>
>  Description:
>  		(RW) Set/Get the decode mode with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0=
:3]
> +Date:		July 2026
> +KernelVersion:	7.2
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songw=
ei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the next action with specific step for TGU.

[Severity: Low]
Is the default node missing from the ABI documentation?

The logic in tgu_node_visible() renames the final register in the
condition_select region to default, making it available to userspace, but it
does not appear to be documented here.

> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
[ ... ]
> @@ -71,6 +74,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
>  	case TGU_CONDITION_DECODE:
>  		return sysfs_emit(buf, "0x%x\n",
>  				drvdata->value_table->condition_decode[index]);
> +	case TGU_CONDITION_SELECT:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->condition_select[index]);

[Severity: Medium]
This is a pre-existing issue, but does tgu_dataset_show() need to hold
drvdata->lock when reading these arrays?

Arrays like condition_select are zeroed and updated under the lock in
reset_tgu_store() and tgu_dataset_store(), so reading them locklessly here
might lead to torn reads or intermediate states being observed.

[ ... ]
> @@ -146,6 +156,13 @@ static umode_t tgu_node_visible(struct kobject *kobj=
ect,
>  		if (tgu_attr->reg_num < drvdata->num_condition_decode)
>  			return attr->mode;
>  		break;
> +	case TGU_CONDITION_SELECT:
> +		/* 'default' register is at the end of 'select' region */
> +		if (tgu_attr->reg_num =3D=3D drvdata->num_condition_select - 1)
> +			attr->name =3D "default";

[Severity: High]
Does dynamically renaming attr->name here permanently mutate the globally
shared static sysfs attribute?

The struct attribute instances are defined via statically allocated compound
literals at the file scope. Modifying attr->name here changes it for all TGU
instances.

If a system has multiple TGU devices with varying num_condition_select
values, or if the driver is unbound and rebound, the name remains default.
Could this cause a sysfs collision (-EEXIST) when registering subsequent
devices?

[ ... ]
> @@ -184,6 +201,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvd=
ata *drvdata)
>  				drvdata->base + CONDITION_DECODE_STEP(i, j));
>  		}
>  	}
> +
> +	for (i =3D 0; i < drvdata->num_step; i++) {
> +		for (j =3D 0; j < drvdata->num_condition_select; j++) {
> +			index =3D check_array_location(drvdata, i,
> +						TGU_CONDITION_SELECT, j);
> +			if (index =3D=3D -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->condition_select[index],
> +				drvdata->base + CONDITION_SELECT_STEP(i, j));
> +		}
> +	}

[Severity: Medium]
This is a pre-existing issue, but is the index variable uninitialized if all
the num_step loops in tgu_write_all_hw_regs() are bypassed?

If drvdata->num_step is 0, the function jumps to the exit label and returns
index >=3D 0 ? 0 : -EINVAL. This evaluates uninitialized stack garbage and
could result in a non-deterministic return value.

[ ... ]
> @@ -425,6 +464,16 @@ static int tgu_probe(struct amba_device *adev, const=
 struct amba_id *id)
[ ... ]
>  	drvdata->value_table->condition_decode =3D condition;
> =20
> +	select_size =3D drvdata->num_condition_select * drvdata->num_step;
> +
> +	select =3D devm_kcalloc(dev, select_size,
> +			     sizeof(*(drvdata->value_table->condition_select)),
> +			     GFP_KERNEL);
> +	if (!select)
> +		return -ENOMEM;

[Severity: High]
This is a pre-existing issue, but does sysfs_create_groups() happen earlier
in tgu_probe() before these internal structures are allocated?

If sysfs nodes are exposed to userspace before memory like condition_select
is fully allocated, could an early concurrent sysfs read or write trigger a
NULL pointer dereference?

[Severity: High]
This is a pre-existing issue, but if devm_kcalloc() fails and we return
-ENOMEM here, are the sysfs groups orphaned?

Because sysfs_create_groups() is used instead of a devres managed
alternative, failing probe here without calling sysfs_remove_groups() could
leave sysfs files active while freeing the underlying driver memory,
potentially causing a Use-After-Free if accessed later.


Additionally, there are a couple of pre-existing regressions in the driver
PM handling:

[Severity: High]
This is a pre-existing issue, but is there a race condition in
enable_tgu_store() that causes a pm_runtime_put() underflow?

If two threads concurrently write "0" to enable_tgu, they sequentially pass
the lock and both observe drvdata->enabled =3D=3D true:

scoped_guard(spinlock, &drvdata->lock) {
    if (!drvdata->enabled)
        return -EINVAL;
}

Both threads then proceed locklessly to call tgu_disable(dev) and
pm_runtime_put(dev). Since there was only one matching
pm_runtime_resume_and_get(), this would result in a PM usage counter
underflow.

[Severity: High]
This is a pre-existing issue, but does tgu_remove() neglect to release the
runtime PM reference if the device is currently enabled?

tgu_remove() calls tgu_disable(dev) to stop the hardware, but does not seem
to call pm_runtime_put() to balance the PM reference acquired during
enablement, which might leak the PM reference and keep the parent bus awake.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701055529.4458=
19-1-songwei.chai@oss.qualcomm.com?part=3D5
