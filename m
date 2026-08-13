Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05C9348465
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 21:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657541; cv=none; b=FZymftTbI2VyPQ3gD2dxEe67J9I+dqVQ+/U5fzpSw+QoC9+5M+tZJy+ERM0cOFQsT7IDRg90DRBDhijzyovSR7wpnZ7HoeOn3i1FqjdKSANmDvgFnYwM4xY1K4bOIw9s8ou8ZNu2J0K+2PP7r6roq8e3ey353PubUA+AsyO4xs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657541; c=relaxed/simple;
	bh=q1TZMkXecxtrKDD5h9kEM0cKQAbY9FywvotBR3hokmg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kc5MUv3t812V4NSvM4JIjioPyJ7RCwOQ7xWHlY4DbJy8xcV9LYZmTSKbu+bAKw86iiAvZs39FaQ4nGfbtqtp0+jgFLyI7aQQCMIyUa5EBX3P/lsEqIFR6CUcacso4ZqEb/xAe9kxjqEUbXMPBnxVHehd6dCowLIOLfB6IP1wprg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGtM8rMM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGtM8rMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557071F000E9;
	Thu, 13 Aug 2026 21:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786657539;
	bh=+pu2HzxD5+hB/eNI+M0NeGilstdMbJJmcBabd4ew98E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kGtM8rMM1R063ZQ7oad4bnmzsZt42XSBVeYuZVDeaJA0M+fHqpAg9FGGgyN7OjX4Z
	 SnT5NF3Pi9pARsjqAdeymd5cjXHce8RSuhaj9SJYiuRqd6uH03/ndaONTbiTdaFtrp
	 GVfXUzEkm7mpkQc8l+wkGiFcoYRMmRrG/aRtztS54kGfK6IuiA1U8tfmbN+eiFDqZu
	 5QVc2xH1qpOiJU5TNsHuMZWQfsVdrOtvYaQVvhF7x3OJ8dhw8M7t3okTx9Ve3xghOt
	 U+kql6Wt12zarcXgo0Y66qkpBi/QolfI0NIDROY+5wG9Keo2VEHqPb7tkPnkoeLHmC
	 kx+jav27ejtUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 4/7] qcom-tgu: Add TGU decode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Songwei Chai" <songwei.chai@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260317032639.2393221-5-songwei.chai@oss.qualcomm.com>
References: <20260317032639.2393221-5-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 21:45:38 +0000
Message-Id: <20260813214539.557071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The local variable `index` is used uninitialized on the return pat=
h of `tgu_write_all_hw_regs()`, causing undefined behavior.

Pre-existing issues:
- [High] Sysfs attributes are exposed to userspace before their underlying =
data structures are allocated.
- [High] Probe error paths fail to remove manually created sysfs groups, le=
ading to Use-After-Free/NULL pointer dereferences.
- [High] The driver mismanages runtime PM usage counters, leading to underf=
lows and permanent leaks.
--

--- Patch [4]: [PATCH v12 4/7] qcom-tgu: Add TGU decode support ---
commit 9ed009439c45349e788fcf926637cdd6928ba5be
Author: Songwei Chai <songwei.chai@oss.qualcomm.com>

qcom-tgu: Add TGU decode support

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. This patch programs the condition
decode inputs for TGU steps.

> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 14d6ad410d89f..85fe1140eab58 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c

[ ... ]

> -static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
> +static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>  {
>  	int i, j, k, index;

[ ... ]

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
Can index be used uninitialized here?

In tgu_write_all_hw_regs(), index is declared without initialization. It is
conditionally assigned within nested loops bounded by values read from
hardware like num_step, num_reg, and num_condition_decode.

If the loops are bypassed because the hardware reports 0 for these limits,
index remains uninitialized. The function then evaluates index >=3D 0 ? 0 :
-EINVAL, which evaluates uninitialized stack memory and can cause
unpredictable device enablement success or failure.

[ ... ]

> @@ -278,6 +382,7 @@ static int tgu_probe(struct amba_device *adev, const =
struct amba_id *id)
> =20
>  	tgu_set_reg_number(drvdata);
>  	tgu_set_steps(drvdata);
> +	tgu_set_conditions(drvdata);
> =20
>  	ret =3D sysfs_create_groups(&dev->kobj, tgu_attr_groups);

[Severity: High]
This isn't a bug introduced by this patch, but are sysfs attributes exposed
to userspace here before their underlying data structures are allocated?

If a userspace process like udev reads the sysfs attributes immediately
after sysfs_create_groups() completes, callbacks like tgu_dataset_show()
will execute. These callbacks unconditionally dereference the unallocated
value_table pointer, leading to a NULL pointer dereference and a kernel
crash.

>  	if (ret) {
> @@ -300,6 +405,16 @@ static int tgu_probe(struct amba_device *adev, const=
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
This isn't a bug introduced by this patch, but does returning -ENOMEM here
fail to remove manually created sysfs groups?

If an allocation like devm_kcalloc fails, the probe function returns an err=
or.
The driver core cleans up devm resources and sets drvdata to NULL, but leav=
es
the manually created sysfs nodes untouched since they were not managed via
devres.

If a user subsequently interacts with the remaining sysfs files, callbacks
like enable_tgu_show() will fetch a NULL drvdata and dereference it. Should
sysfs_remove_groups() be called on this error path?

[ ... ]

[Severity: High]
This is a pre-existing issue, but does this driver mismanage runtime PM
usage counters?

In drivers/hwtracing/qcom/tgu.c:enable_tgu_store():

    } else {
        tgu_disable(dev);
        pm_runtime_put(dev);
    }

Writing 0 to the enable_tgu sysfs node unconditionally executes
pm_runtime_put(dev) even if the device is already disabled, leading to a
usage count underflow.

Additionally, during device unbinding in drivers/hwtracing/qcom/tgu.c:tgu_r=
emove():

    sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
    tgu_disable(dev);

If the device was previously enabled, the removal path fails to call
pm_runtime_put(dev), leaking the PM reference acquired in enable_tgu_store()
permanently.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260317032639.2393=
221-1-songwei.chai@oss.qualcomm.com?part=3D4
