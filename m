Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A16403EBA
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995040; cv=none; b=FsBXbv4uwtdp3U+pi7zM54jyR4PCuZmmv+CYo2FhsqG7u6WMscms/atAxYGNnWaNEFhlkPTPzSZM+RDioQqpAad1A5JVm7JwssbpxWTW5qNMH3ZM6YX4mI98e/ckUXPbIE2Bo+7r83kK2MK7Zo/IZh/TCcZ8HbuumOMm7VGmdn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995040; c=relaxed/simple;
	bh=u06sXgj0k0EHCrsAIn2j9aJnq7th0FArEGRtErE/5BY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DLy2/PO/0PHRyf7HNGG3I8siJ52F9OlkfJvCSiOYjWqkrbjtiG5xcLJJ7nOgb/vrHCu0CcV1f1fYyr6dk8NNVMomdChejmeiTo9WyZG5oIbeGFffRNSzVpDToY2+bqfulUEY79b++4576z8P/ZEQg1kvi5Zt6m7wp109tlr/b5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVLGepYd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVLGepYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFEE1F000E9;
	Thu,  2 Jul 2026 12:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782995039;
	bh=qrlDaebj67PK+CaUbNTnFJHqddgXuPGESHf1FdVZsWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OVLGepYdev4CXJ6DhhsHk7WV0OtpIFPWDMabhYOBNi/qxltYX20nfsn/pCaaO4xy3
	 msmtYehM2pvxYE7yiIyAVTXp4s660AYQ69P94Zsw9x8rLf1sP0KCf3ELTi44bY/9Tv
	 RpbMQoOGt9ez0nvD8mQh4eIPncmjk+FJyVwm3LXthY7hzW22Ybtfzen3xZe5ZLeZk2
	 E5P/aVllAsRKZbvQu54H9cnOmsKPGcy9GmExKttqdfyVl95QjyZuYrGtsDv+o3ZPHs
	 QrkvfIHvt1OkzuvVybj/eFUcFXDd34b4mSWw0xZ3wU8UMQIpIS660lSJAHZHv8Nrns
	 /OLnNfrb1wvYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] soc: apple: Add driver for Apple PMGR misc controls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702-pmgr-misc-v1-2-4f075a3a95c1@chaosmail.tech>
References: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
 <20260702-pmgr-misc-v1-2-4f075a3a95c1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 12:23:58 +0000
Message-Id: <20260702122359.0FFEE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect check for devm_platform_ioremap_resource_byname() return=
 value leads to ERR_PTR dereference
- [High] Missing NULL check for of_device_get_match_data() causes NULL poin=
ter dereference
--

commit 144dd044ce23e2ad7967536cb164bb8942aedf81
Author: Hector Martin <marcan@marcan.st>

soc: apple: Add driver for Apple PMGR misc controls
   =20
This commit adds a driver for managing miscellaneous PMGR controls on Apple
SoCs, implementing fabric and memory controller power state switching on sy=
stem
standby/s2idle to save power.

> diff --git a/drivers/soc/apple/apple-pmgr-misc.c b/drivers/soc/apple/appl=
e-pmgr-misc.c
> new file mode 100644
> index 0000000000000..d487a87ecddb0
> --- /dev/null
> +++ b/drivers/soc/apple/apple-pmgr-misc.c
[ ... ]
> +static bool apple_pmgr_init_device(struct apple_pmgr_misc *misc,
> +				   const struct apple_pmgr_misc_hw *hw,
> +				   enum sys_device dev,
> +				   const char *device_name)
> +{
> +	void __iomem *base;
> +	char name[32];
> +	u32 val;
> +
> +	snprintf(name, sizeof(name), "%s-ps", device_name);
> +
> +	base =3D devm_platform_ioremap_resource_byname(
> +		to_platform_device(misc->dev), name);
> +	if (!base)

[Severity: High]
Does this code handle the return value of=20
devm_platform_ioremap_resource_byname() correctly?

The function returns an error pointer on failure, not NULL. A failure here
would bypass this check and could lead to an ERR_PTR being dereferenced by
the readl_relaxed() call below.

> +		return false;
> +
> +	val =3D readl_relaxed(base + APPLE_CLKGEN_PSTATE);
> +
> +	misc->devices[dev].base =3D base;
> +	misc->devices[dev].active_state =3D
> +		FIELD_GET(APPLE_CLKGEN_PSTATE_DESIRED, val);
> +	misc->devices[dev].suspend_state =3D hw->dev_min_ps[dev];

[Severity: High]
Can hw be NULL here?

If the driver is bound manually via sysfs without a matching device tree no=
de,
of_device_get_match_data() in apple_pmgr_misc_probe() below returns NULL. T=
his
would lead to a NULL pointer dereference.

> +
> +	return true;
> +}
> +
> +static int apple_pmgr_misc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	const struct apple_pmgr_misc_hw *hw;
> +	struct apple_pmgr_misc *misc;
> +	int ret =3D -ENODEV;
> +
> +	misc =3D devm_kzalloc(dev, sizeof(*misc), GFP_KERNEL);
> +	if (!misc)
> +		return -ENOMEM;
> +
> +	misc->dev =3D dev;
> +	hw =3D of_device_get_match_data(dev);
> +
> +	if (apple_pmgr_init_device(misc, hw, DEV_FABRIC, "fabric"))

[Severity: High]
Is it possible for hw to be NULL here?

Passing an unchecked hw pointer to apple_pmgr_init_device() causes the
unconditional dereference of hw->dev_min_ps[dev] shown above.

> +		ret =3D 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-pmgr-misc-=
v1-0-4f075a3a95c1@chaosmail.tech?part=3D2
