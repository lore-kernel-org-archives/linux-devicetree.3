Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1258C23E342
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 06:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782886639; cv=none; b=AIhQwG3DVKwK4Ow6hvQqwcIq5rksT8lHnnbdCctoMuixpFSxsbs8Ha8kjjeguhD5jhEqO/C4UmhXcqe3XiO7ol4kBNbtUSo4NBb6W99n8dDquxHJa9rKu6Fhv+5G/VaFkmYRuurhaQ8pIPKXvPDLmP34+bVQSYHUcrL+tggwhMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782886639; c=relaxed/simple;
	bh=cSIcdyneBfm1+GTzxRROhhQH+ax8RDsQtNCF0VEjRIo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cUMgfzcP6ShGEsUOGqWhUOkdnIchV3pRlyjVDvJHTLezO9mMOnQdWO4oSBtroe6eyvKDsZ5b7ZJbXDIQBWVmqNFSrduIh0BETytkihdpSH01fvuV1L5PDkXmZXN1n9VFEKlg7fmp/Q+VYesl0wFzCYP6wqFrfXYA3cnCF9Xc8VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLN7cne+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLN7cne+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765931F000E9;
	Wed,  1 Jul 2026 06:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782886637;
	bh=QW05j+B/0oWot7YX2rgJshdv2JHkkdmnYGD0nGedSFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dLN7cne+Gxf6pAxv4bMwKpP1dVhFurvIu5V1IoOp3QVJR/H3NlVuBYWMUXTY28S4i
	 b9y67TJITduuqhT7zkzqKidsWfuoyHW8W5GvY7PuaUJx5p91WKJGVQXxriwOADfdp8
	 dig/ddRW71l+WK9FoN61tfAVBx/XH1l1W0+eC/8nVwkC78O2A/kM9EmY1aPhP3Vfvg
	 i7K3JXMa3FO2SWEjnhLG/JBONtZCl0omQX6cPcNe1n0+IhsX+EeV7x22VziPkVOhX0
	 pN5IqSiXsYq7vynsnBeCyf+bpT+yLmFGRqfAQ9FLcMrvw2xbYhZVOeaFTrl+BpBJeO
	 o6dvthvsFyahA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 2/7] qcom-tgu: Add TGU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Songwei Chai" <songwei.chai@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260701055529.445819-3-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
 <20260701055529.445819-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 06:17:17 +0000
Message-Id: <20260701061717.765931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Time-of-Check to Time-of-Use (TOCTOU) race condition in `enable_tg=
u_store` causes unbalanced PM runtime usage counter.
- [High] Missing `pm_runtime_get_sync()` and unbalanced sysfs PM references=
 in `tgu_remove()` lead to PM usage counter underflow or leaks.
--

commit e9711e322428fa7e4360329e125f890c5dceb36f
Author: Songwei Chai <songwei.chai@oss.qualcomm.com>

qcom-tgu: Add TGU driver

Add driver to support device TGU (Trigger Generation Unit).
TGU is a Data Engine which can be utilized to sense a plurality of
signals and create a trigger into the CTI or generate interrupts to
processors. Add probe/enable/disable functions for tgu.

> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> new file mode 100644
> index 0000000000000..49c8f710b9318
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.c

[ ... ]

> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
> +static ssize_t enable_tgu_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf,
> +				size_t size)
> +{
> +	struct tgu_drvdata *drvdata =3D dev_get_drvdata(dev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret =3D kstrtoul(buf, 0, &val);
> +	if (ret || val > 1)
> +		return -EINVAL;
> +
> +	if (val) {
> +		scoped_guard(spinlock, &drvdata->lock) {
> +			if (drvdata->enabled)
> +				return -EBUSY;
> +		}
> +
> +		ret =3D pm_runtime_resume_and_get(dev);

[Severity: High]
Is there a time-of-check to time-of-use (TOCTOU) race condition here?

Because scoped_guard releases the lock immediately after checking
drvdata->enabled, two threads could concurrently write '1' to this sysfs
attribute and both pass the check.=20

This would cause pm_runtime_resume_and_get() to be called twice, leaking a =
PM
runtime usage counter since the internal boolean state only changes once.

[ ... ]

> +	} else {
> +		scoped_guard(spinlock, &drvdata->lock) {
> +			if (!drvdata->enabled)
> +				return -EINVAL;
> +		}
> +
> +		tgu_disable(dev);
> +		pm_runtime_put(dev);
> +	}
> +
> +	return size;
> +}

Similarly, if two threads concurrently write '0' to the sysfs attribute, co=
uld
the lock being released early allow both threads to bypass the state check,
causing the PM usage counter to decrement multiple times?

[ ... ]

> +static void tgu_remove(struct amba_device *adev)
> +{
> +	struct device *dev =3D &adev->dev;
> +
> +	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
> +
> +	tgu_disable(dev);
> +}

[Severity: High]
Since tgu_probe() called pm_runtime_put(), doesn't tgu_remove() need to call
pm_runtime_get_sync() to balance the counter?

Without this, the AMBA bus framework might underflow the PM usage counter t=
o -1
during remove.

Additionally, if the device is removed while it was enabled via sysfs,
tgu_disable(dev) is called to turn off the hardware, but it doesn't seem to
call pm_runtime_put(). Does this leak the PM runtime reference that was
acquired in enable_tgu_store()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701055529.4458=
19-1-songwei.chai@oss.qualcomm.com?part=3D2
