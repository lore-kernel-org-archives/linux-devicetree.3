Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2B627BF79
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 07:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889570; cv=none; b=qmuZxvmWpnESUmBYDP47wNYCsWB/JC+wQHoKVEIhi1v137HCvsIklFbS5NMrZhrgqxgvoVsLn2JzmtfzFust2EfhVULBWbA6RkQDxpn8606WwBcOC7gx7WRQULgAVnYVXikh1icPXuL1BtWYxfRSQkuKFpuFw3bXLNqKSxD/L6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889570; c=relaxed/simple;
	bh=A/RJV+fkcJ447eyysr4p8fHhoNsYZ8qO3fcFUhgX6qY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qVZ05A4w+zyYRrdSPk5zO9sVHIbsHidvmPqn5kyRVRogqLnE6exFETJT+edJNUqjQBcuzPE1vHRVZZySv32RJ4nWHG+jx6agSarvftACULks6EM/DuWYqp7Cymkq2oaqeZjGdWpFnl+8bOUvojba2RJd5XFDQU2vNydBvb8T7u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmUrq0O0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmUrq0O0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD411F00A3A;
	Wed,  1 Jul 2026 07:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889569;
	bh=J9/5GtIJHuE5/Zf4e4BPbE0f22V3WYkZYtKMiComHzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gmUrq0O0PAb/lzyEHOBxbgCVGJfRFjIKjbdvag9NGEtnGkBfBvs7VfWPlYS5q5uUx
	 ZltjC6cM/W0oDr7njz0upUMBP9uS4BZt+9pwV2ZJenqvrL56NzoWgjkUkjTlLmEuEC
	 +jUUYX+pjL5DXgpTXBgLT2N1WXQJM6Kp7/7oMDUKYczPuCJRVxT3whwtqSCuwRxhMw
	 eWMIlzM3PPuo9Ty1jiH+5GLMQncM3sri/PwaIP4p5L7V2uAh+fI7EI2kbyXD5sqsW0
	 IutS4UEiEvclSgPgxVU2mwI6VH+AG9vNrXj/VMsHKK2NwDn3jIA49d1ic8f4Vn/RSz
	 W0L2s/bDiG74g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 7/7] qcom-tgu: Add reset node to initialize
Reply-To: sashiko-reviews@lists.linux.dev
To: "Songwei Chai" <songwei.chai@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701055529.445819-8-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
 <20260701055529.445819-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 07:06:08 +0000
Message-Id: <20260701070609.5BD411F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] A TOCTOU race condition in `reset_tgu_store` leads to a permanent =
PM reference leak.

Pre-existing issues:
- [High] A TOCTOU race condition in `enable_tgu_store(0)` causes a double `=
pm_runtime_put()`, leading to PM usage counter underflow.
- [High] A TOCTOU race condition in `enable_tgu_store(1)` allows multiple t=
hreads to enable the device concurrently, leaking PM references.
- [High] Missing `sysfs_remove_groups()` on the `tgu_probe()` error path le=
aves sysfs files accessible, leading to a NULL pointer dereference.
- [High] The `tgu_node_visible` function incorrectly modifies a shared glob=
al attribute name, corrupting the sysfs structure.
- [High] The PM runtime usage count is leaked if the device is unbound whil=
e enabled.
- [Medium] The function `tgu_dataset_show` reads shared array values withou=
t holding the required lock.
--

commit 609c4b01711040b0d5156593e5d5c7a06ebc7c31
Author: Songwei Chai <songwei.chai@oss.qualcomm.com>

qcom-tgu: Add reset node to initialize

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 6d5bf2621cb05..9fb51f2a912f9 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
[ ... ]
> @@ -420,8 +420,82 @@ static ssize_t enable_tgu_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(enable_tgu);
> =20
> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	struct tgu_drvdata *drvdata =3D dev_get_drvdata(dev);
> +	struct value_table *vt =3D drvdata->value_table;
> +	u32 *cond_decode =3D drvdata->value_table->condition_decode;
> +	unsigned long value;
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value !=3D 1)
> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->lock);
> +	if (!drvdata->enabled) {
> +		spin_unlock(&drvdata->lock);
> +		ret =3D pm_runtime_resume_and_get(drvdata->dev);

[Severity: High]
Does unlocking to get the PM reference introduce a TOCTOU race condition?

If a concurrent enable_tgu_store(1) enables the device and increments the
PM usage count before this thread reacquires the lock, reset_tgu_store()
will unconditionally disable the hardware and clear the enabled flag.

Since the device state is now disabled, would the PM reference acquired by
the concurrent enable_tgu_store(1) be permanently leaked?

> +		if (ret)
> +			return ret;
> +		spin_lock(&drvdata->lock);
> +	}
[ ... ]


This is a pre-existing issue, but does enable_tgu_store() have TOCTOU race
conditions?

drivers/hwtracing/qcom/tgu.c:enable_tgu_store() {
...
	if (val) {
		scoped_guard(spinlock, &drvdata->lock) {
			if (drvdata->enabled)
				return -EBUSY;
		}

		ret =3D pm_runtime_resume_and_get(dev);
...
	} else {
		scoped_guard(spinlock, &drvdata->lock) {
			if (!drvdata->enabled)
				return -EINVAL;
		}

		tgu_disable(dev);
		pm_runtime_put(dev);
	}
...
}

[Severity: High]
For enable_tgu_store(1), if two threads concurrently observe !drvdata->enab=
led
within the scoped guard, both will drop the lock and acquire PM references.
Both would then independently call tgu_enable(dev), setting the flag to tru=
e.
Would this increment the PM usage count multiple times, while disabling the
device only decrements it once?

[Severity: High]
For enable_tgu_store(0), if two threads concurrently verify
drvdata->enabled =3D=3D true inside the scoped lock guard and then drop the=
 lock,
the first thread calls tgu_disable(dev), sets the flag to false, and calls
pm_runtime_put(dev). The second thread calls tgu_disable(dev), which returns
early because the flag is now false, but then unconditionally calls
pm_runtime_put(dev). Would this double-put cause a PM usage counter underfl=
ow?


This is a pre-existing issue, but does tgu_probe() leave sysfs files
accessible if subsequent allocations fail?

drivers/hwtracing/qcom/tgu.c:tgu_probe() {
...
	ret =3D sysfs_create_groups(&dev->kobj, tgu_attr_groups);
	if (ret) {
...
	}

	drvdata->value_table =3D
		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
	if (!drvdata->value_table)
		return -ENOMEM;
...
}

[Severity: High]
If devm_kzalloc() fails, the probe returns an error, and the driver core se=
ts
drvdata to NULL. Because sysfs_remove_groups() is not called on this error
path, the sysfs attributes remain. If a user subsequently accesses these
dangling attributes, would dev_get_drvdata(dev) return NULL, causing a panic
when dereferencing drvdata?


This is a pre-existing issue, but does tgu_node_visible() incorrectly modify
a shared global attribute name?

drivers/hwtracing/qcom/tgu.c:tgu_node_visible() {
...
	case TGU_CONDITION_SELECT:
		/* 'default' register is at the end of 'select' region */
		if (tgu_attr->reg_num =3D=3D drvdata->num_condition_select - 1)
			attr->name =3D "default";
...
}

[Severity: High]
The attributes in tgu_attr_groups appear to be statically allocated. Since
this dynamically executes attr->name =3D "default", does it destructively
overwrite the shared global attribute structure, permanently altering the n=
ame
for all TGU devices?


This is a pre-existing issue, but is the PM runtime usage count leaked if t=
he
device is unbound while enabled?

drivers/hwtracing/qcom/tgu.c:tgu_remove() {
...
static void tgu_remove(struct amba_device *adev)
{
	struct device *dev =3D &adev->dev;

	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);

	tgu_disable(dev);
}
...
}

[Severity: High]
If the user enables the TGU via enable_tgu_store(1), a PM reference is
acquired. When the device is later unbound, tgu_remove() calls tgu_disable(=
),
which turns off the hardware and sets the enabled flag to false. However, it
fails to call pm_runtime_put() to balance the PM reference. Does this
permanently leak the PM reference?


This is a pre-existing issue, but does tgu_dataset_show() read shared array
values without holding the required lock?

drivers/hwtracing/qcom/tgu.c:tgu_dataset_show() {
...
	case TGU_PRIORITY0:
	case TGU_PRIORITY1:
	case TGU_PRIORITY2:
	case TGU_PRIORITY3:
		return sysfs_emit(buf, "0x%x\n",
				drvdata->value_table->priority[index]);
...
}

[Severity: Medium]
This function reads values from drvdata->value_table without acquiring
drvdata->lock. Since sysfs store operations can concurrently modify or
memset these arrays while holding the lock, does this expose a data race
where sysfs reads might observe partially written values?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701055529.4458=
19-1-songwei.chai@oss.qualcomm.com?part=3D7
