Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB32E62A9
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 06:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887855; cv=none; b=rYaQy62kem94af615kqPdRG3kV9CBCsFWBVeYs5Seb4f71qEfthQy3ITpLFI1zgUY4MAtGtOMzM6u5uYkPEzV9JkJgn9f0y0oL+XsEjj2UsnC8NFieZc+aUrVGI1GdhoA0oCu/0IciwHep2g7mxm8H5dU5jSYDxZbLkptypf/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887855; c=relaxed/simple;
	bh=wq5rSIvHPThUhJF9SvKGmLTgwa3y7LTrs7SGZ4TlR9g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fzLP16gxkbJ27WwBcjy9s8SyadpjSOvnYkUpu+Fyu6uJjeWaTM0gdFBBbHiP/PGUbl9VlHpcrgL0YN91mP8ZUXY2QZnfdk8KGCDqw5ZV9jPIAd47EnbuPxuOxGrbcURL9OYT/xmz62/Az8UC3pAUl9XW5ODxjFgEW6gPNekMEvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9bF8bwk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9bF8bwk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEE51F000E9;
	Wed,  1 Jul 2026 06:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782887854;
	bh=y1Y8Irmvxl7dGEKEafIIACcXekx3V6IpoGY1h5G27uU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E9bF8bwk9IPp0DCuz5YsZoCPriapk5n2kefgrYlQ7lVNQB2tM4PJzcEUAZQBoTRkz
	 SuEGAAG/tdT9I8rlGpGGO20NhqfDPj8n+onNMBDtJFzpkPfaCt3MvyD8YtKaQaYirO
	 +Q43ci/IJwSoLq53s88A/PWLw5+5lctc/MkJ4trbsoH8ujeJ902a1YTsgq9r/Y1VZT
	 uY8kF4/X1ZBx1VhVbiC2MjdSHzd1mmWERZjPNmPiZPxUQWIb6aYoQExnpsUPmeMbS0
	 MEEeNgbRhLuXHtyhsT5p94eRG4757Y8OMC95395FPB9m1jygW01TW+Zxswcc5xqV9m
	 B9jBlOQPaLFOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 4/7] qcom-tgu: Add TGU decode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Songwei Chai" <songwei.chai@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260701055529.445819-5-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
 <20260701055529.445819-5-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 06:37:33 +0000
Message-Id: <20260701063733.EEEE51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The local variable `index` is used uninitialized in `tgu_write_all=
_hw_regs()`, leading to unpredictable return values.

Pre-existing issues:
- [High] Probe error paths fail to remove manually created sysfs groups, cr=
eating a Use-After-Free vulnerability.
- [High] Sysfs attributes are exposed to userspace before their internal da=
ta structures are allocated, exposing a window for a NULL pointer dereferen=
ce.
- [High] TOCTOU race conditions in `enable_tgu_store` and `reset_tgu_store`=
 allow concurrent executions to permanently leak PM reference counts.
--

commit 02dfd241f8e959109566cea8502a03ef77cfcf4f
Author: Songwei Chai <songwei.chai@oss.qualcomm.com>

qcom-tgu: Add TGU decode support

This patch adds condition decode support to the Qualcomm Trace and Gating U=
nit
(TGU). It introduces registers to establish conditions for triggers or step
movements.

> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 7d69986c3e3d2..937211923d937 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c

[ ... ]

> @@ -91,8 +161,10 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata =
*drvdata)
>  	for (i =3D 0; i < drvdata->num_step; i++) {
>  		for (j =3D 0; j < MAX_PRIORITY; j++) {
>  			for (k =3D 0; k < drvdata->num_reg; k++) {
> -				index =3D calculate_array_location(
> +				index =3D check_array_location(
>  							drvdata, i, j, k);
> +				if (index =3D=3D -EINVAL)
> +					goto exit;
> =20
>  				writel(drvdata->value_table->priority[index],
>  					drvdata->base +
> @@ -100,9 +172,23 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata=
 *drvdata)
>  			}
>  		}
>  	}
> +
> +	for (i =3D 0; i < drvdata->num_step; i++) {
> +		for (j =3D 0; j < drvdata->num_condition_decode; j++) {
> +			index =3D check_array_location(drvdata, i,
> +						TGU_CONDITION_DECODE, j);
> +			if (index =3D=3D -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->condition_decode[index],
> +				drvdata->base + CONDITION_DECODE_STEP(i, j));
> +		}
> +	}
>  	/* Enable TGU to program the triggers */
>  	writel(1, drvdata->base + TGU_CONTROL);
> +exit:
>  	TGU_LOCK(drvdata->base);
> +	return index >=3D 0 ? 0 : -EINVAL;

[Severity: High]
Could index be used uninitialized here?

If the hardware reports 0 for drvdata->num_step (e.g., via TGU_DEVID_STEPS),
the nested loops in tgu_write_all_hw_regs() are bypassed entirely.

The function then evaluates index >=3D 0 ? 0 : -EINVAL using the uninitiali=
zed
stack value of index, leading to unpredictable initialization failures or
spurious successes.

>  }

[ ... ]

> @@ -131,16 +217,26 @@ static void tgu_set_steps(struct tgu_drvdata *drvda=
ta)
>  	drvdata->num_step =3D TGU_DEVID_STEPS(devid);
>  }
> =20
> +static void tgu_set_conditions(struct tgu_drvdata *drvdata)
> +{
> +	u32 devid;
> +
> +	devid =3D readl(drvdata->base + TGU_DEVID);
> +	drvdata->num_condition_decode =3D TGU_DEVID_CONDITIONS(devid);
> +}
> +
>  static int tgu_enable(struct device *dev)
>  {
>  	struct tgu_drvdata *drvdata =3D dev_get_drvdata(dev);
> +	int ret;
> =20
>  	guard(spinlock)(&drvdata->lock);
> -	drvdata->enabled =3D true;
> =20
> -	tgu_write_all_hw_regs(drvdata);
> +	ret =3D tgu_write_all_hw_regs(drvdata);
> +	if (!ret)
> +		drvdata->enabled =3D true;

[Severity: High]
This isn't a bug introduced by this patch, but is there a TOCTOU race
condition in enable_tgu_store() and reset_tgu_store() that allows
concurrent executions to permanently leak PM reference counts?

enable_tgu_store() checks drvdata->enabled under a spinlock, drops the lock,
and acquires a PM reference via pm_runtime_resume_and_get() before calling
tgu_enable().

Two concurrent writers can both bypass the check and acquire references, but
a subsequent disable will only drop one reference, preventing the device and
its hierarchy from entering low-power states.

> =20
> -	return 0;
> +	return ret;
>  }

[ ... ]

> @@ -288,6 +392,7 @@ static int tgu_probe(struct amba_device *adev, const =
struct amba_id *id)
> =20
>  	tgu_set_reg_number(drvdata);
>  	tgu_set_steps(drvdata);
> +	tgu_set_conditions(drvdata);
> =20
>  	ret =3D sysfs_create_groups(&dev->kobj, tgu_attr_groups);

[Severity: High]
This is a pre-existing issue, but does this early sysfs creation expose a
window for a NULL pointer dereference?

In tgu_probe(), sysfs_create_groups() exposes the device attributes to user
space before drvdata->value_table and its nested arrays are allocated.

If a user process accesses the sysfs files immediately, the sysfs handlers
(like tgu_dataset_show) will dereference a NULL value_table pointer, causing
a kernel panic. Any unprivileged user or udev rule can read the 0644 sysfs
files during this window.

>  	if (ret) {
> @@ -310,6 +415,16 @@ static int tgu_probe(struct amba_device *adev, const=
 struct amba_id *id)
> =20
>  	drvdata->value_table->priority =3D priority;
> =20
> +	condition_size =3D drvdata->num_condition_decode * drvdata->num_step;
> +
> +	condition =3D devm_kcalloc(dev, condition_size,
> +				sizeof(*(drvdata->value_table->condition_decode)),
> +				GFP_KERNEL);
> +	if (!condition)
> +		return -ENOMEM;

[Severity: High]
This isn't a bug introduced by this patch, but doesn't this error path fail
to remove manually created sysfs groups, creating a Use-After-Free
vulnerability?

If memory allocations fail after sysfs_create_groups() is called in
tgu_probe(), the function returns -ENOMEM without calling
sysfs_remove_groups().

The driver core then frees the devm-managed drvdata, leaving dangling sysfs
files on the device's kobject. Any local unprivileged user can read the
0644 sysfs files, triggering a UAF on the freed drvdata pointer.

> +
> +	drvdata->value_table->condition_decode =3D condition;
> +
>  	drvdata->enabled =3D false;
> =20
>  	pm_runtime_put(&adev->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701055529.4458=
19-1-songwei.chai@oss.qualcomm.com?part=3D4
