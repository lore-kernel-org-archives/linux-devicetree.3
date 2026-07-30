Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C22DC76A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399435; cv=none; b=OZuWr2RU5qOD7+sRrcg5GH4WVLONcD4Y71OuMHawjehs4UuKru2D9bpPajOiARF7Id7xHcXfgoDaHfBX5YLCitox3vENgk0G1MtYCUjWa1o5IdVyTRIBi8mhyhb13fXCWlzhbn23kgIyf2qvAjdXUgPoiDSTTfoC4Pnz3JD3R8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399435; c=relaxed/simple;
	bh=WAlkGgW7iYWGRMm6a/xMXxIQHV+Er9e5Xs8t5CIpR7Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fnVcPr2h1okvk/k9UM5e0dcuETFBcuG3zBwO0hHDOCB1QH4vjcjbapdoOMChSA8+7dGjY/zHQUafS5Q1+2wznrbW5QGFHGTFmeb9HHKou2pv4NpkSXzmJycSFPkjZQmuYvn7QcLJ31xvypo/49pIthLQFDHV3pTgL4zoS0DnnbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoSAxhHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoSAxhHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118D31F000E9;
	Thu, 30 Jul 2026 08:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785399434;
	bh=Xn/QRenQjErJkjtOKAsDj02Yvu4O8bYMmPIG+vgmw+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RoSAxhHs/jPcJFaTNqU/bwckKqTlWdqOuhPt3p33SoZEOl27YvT9oTGdfailK3x73
	 sd3YKVmL4Yq9rgpNn23A0Hco6Yx8xicahsRFdaE4AQw2e2af0vUmvc8NbhLZUiXguW
	 Hz8ONP1lLsxLX25pPFCcx4QpH3pOunn/YuUZHAfm5LZ5s+BpSEpjRdqYn0HDoSu7pM
	 NCZzCog2lNlPoCaK7FFxzhZD8G+JBLYEC0cPA949/Q4Xr/r0hr1Cdq1kTFeg0HCwji
	 ZWQNYyAR45eUE4UDzEHrp2QGnpDmioBVU6eQKq9+u/JDwZTPQ48qzCJrkSBVym1QFd
	 GQwdeTR6OR1DQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 3/7] qcom-tgu: Add signal priority support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Songwei Chai" <songwei.chai@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730080704.2903540-4-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-4-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 08:17:13 +0000
Message-Id: <20260730081714.118D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] tgu_dataset_store allows writes while the device is enabled, cau=
sing silent software/hardware state desynchronization.
- [Medium] tgu_dataset_store silently truncates out-of-range priority value=
s on 64-bit systems.
--

--- Patch [3]: [PATCH v16 3/7] qcom-tgu: Add signal priority support ---
commit 8afece15a767b432d65a919119df2e97aca2bed5
Author: Songwei Chai <songwei.chai@oss.qualcomm.com>

qcom-tgu: Add signal priority support

This commit adds signal priority configuration support to the Qualcomm TGU
driver. It introduces sysfs attributes to configure the priority of sensed
signals for each step, and stores these configurations in a dynamically
allocated table.

> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 9c7dd4a09f027..0e88b437f191f 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c

[ ... ]

> +static ssize_t tgu_dataset_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t size)
> +{
> +	struct tgu_drvdata *tgu_drvdata =3D dev_get_drvdata(dev);
> +	struct tgu_attribute *tgu_attr =3D
> +		container_of(attr, struct tgu_attribute, attr);
> +	unsigned long val;
> +	int index;
> +	int ret;
> +
> +	ret =3D kstrtoul(buf, 0, &val);

[Severity: Medium]
Does this code silently truncate out-of-range priority values on 64-bit
systems?

The function uses kstrtoul() to parse user input into an unsigned long.
Later, it directly assigns this value to
tgu_drvdata->value_table->priority[index], which is an array of unsigned in=
t.

On 64-bit systems, inputs exceeding UINT_MAX will be silently truncated
without returning an error like -ERANGE. Would kstrtouint() be more
appropriate here?

> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&tgu_drvdata->lock);
> +	index =3D calculate_array_location(tgu_drvdata, tgu_attr->step_index,
> +					 tgu_attr->operation_index,
> +					 tgu_attr->reg_num);
> +
> +	tgu_drvdata->value_table->priority[index] =3D val;

[Severity: Medium]
Can this cause a silent desynchronization between software and hardware
state?

If a user writes to this attribute while the TGU is actively tracing
(tgu_drvdata->enabled =3D=3D true), the driver updates the software backing=
 array
and returns success, but the hardware is not dynamically updated. Subsequent
reads will return the new value, giving the false impression that the hardw=
are
configuration has changed.

Should this check if the device is enabled and either return an error, or p=
ush
the update to the hardware registers?

> +
> +	return size;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730080704.2903=
540-1-songwei.chai@oss.qualcomm.com?part=3D3
