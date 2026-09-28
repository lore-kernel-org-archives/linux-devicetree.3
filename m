Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7850437467
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576801; cv=none; b=ql0M8Z2J3n07jUHn0r2tT0I05ojKPk6z0sw82ktRS7mlLaUJGdnY2yBeWixLcXt+iBepUZGnnRi9HSJktz8uPEGPNKlM+R9tRg2FEXfacdxc5gZUOP8e5hIMxLsvgcEk27EAEs9w4Y5sLVCfutSAD4X54d4diLgN2zM0j6+cUKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576801; c=relaxed/simple;
	bh=Jdw2LNBSl7gkAip6/0T+IabpIwec8rsL3Ok3Or0c4cM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gca7x8aIqZTuZlecKJYhxOydu5KZAQrccrNJOX8Q5+mHYOR2/Yb+m+1gmSZh2NLQDQuHrYl1cbtCfKN+3u21RsvbMuUrGFRLCwnaxx+qQPy74Bv7gTob9tyeYoDLfvugxtSfm0vOvjAvKXLdkRspTOPphGSZ+8nhOMSf8X/t3rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRU0sdyI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRU0sdyI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3753D1F00899;
	Mon, 28 Sep 2026 06:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790576799;
	bh=ca1F7D4yKs/11p6nliyJ+n+T7z1RMKMJeFPJf4QcOOw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JRU0sdyIbubBm90A0nJx9usZnQikI4weDsKVF7CprTSfbRYHX90adSsPYkPUl0efy
	 MV1AHGNm2JpsjaG9HEeLEMhdXcHfftsQZKBj6CkBSXWNvlTI4XPZowKOZcOlAB4NVM
	 1GEBmHWB2g9Xw1X+UDY5VMMXdpLvUB7ofw9uVpkKZlt451exvlZigwZ6Qs6TCeoNFr
	 v/o3nmo583XChtJt8YNcT/4MxibX4VseBviJI/1o8pw5ObMn2ejt94wYbqBpw62rC2
	 GXgr8UmupYs+dxZPmsLSvPHeJwsfm9fLPQuUWmfyGhbNu0EhTp5SQJbd0/F/noJ4Zd
	 4PCXpRu8neC5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v26 02/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-2-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
 <20260928-arm-psci-system_reset2-vendor-reboots-v26-2-b24e2348e8e1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 06:26:38 +0000
Message-Id: <20260928062639.3753D1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] power: reset: reboot-mode: duplicate sysfs entries for predefine=
d modes
--

commit 613bc6d4edd9d0928986367eb5de6c3fc84d4d4e
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

power: reset: reboot-mode: Add support for predefined reboot modes
   =20
reboot-mode based drivers can define a reboot-mode by adding it under
the reboot-mode node in device tree. This limits such drivers, to define
any predefined reboot-modes statically within the driver and creates a
dependency on device-tree.

> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> index 328fa37598df3..fd61de2263836 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
[ ... ]
> @@ -160,11 +234,38 @@ static int reboot_mode_create_device(struct reboot_=
mode_driver *reboot)
>  	return 0;
> =20
>  error:
> -	reboot_mode_release_list(priv);
> +	reboot_mode_release_list(&priv->head);
>  	kfree(priv);
>  	return ret;
>  }
> =20
> +static int reboot_mode_add_predefined_modes(struct reboot_mode_driver *r=
eboot)
> +{
> +	const struct reboot_mode_entry *modes =3D reboot->predefined_modes;
> +	struct mode_info *info;
> +	size_t i;
> +
> +	if (!modes)
> +		return 0;
> +
> +	for (i =3D 0; i < reboot->predefined_mode_count; i++) {
> +		if (modes[i].name && strpbrk(modes[i].name, "\n ,/"))
> +			return -EINVAL;
> +
> +		if (!modes[i].count || modes[i].count > ARRAY_SIZE(modes[i].magic))
> +			return -EINVAL;
> +
> +		info =3D reboot_mode_create_info(reboot->dev, modes[i].name,
> +					       modes[i].magic, modes[i].count);
> +		if (IS_ERR(info))
> +			return PTR_ERR(info);
> +
> +		list_add_tail(&info->list, &reboot->head);

[Severity: Medium]
If a predefined mode shares a name with a device tree mode, does this
unconditionally add it to reboot->head, resulting in a duplicate entry?

Since reboot_mode_create_device() directly iterates over reboot->head and
copies these modes into priv->head:

reboot_mode_create_device() {
    ...
    list_for_each_entry(info, &reboot->head, list) {
        ...
        sysfs_info->mode =3D kstrdup_const(info->mode, GFP_KERNEL);
        ...
        list_add_tail(&sysfs_info->list, &priv->head);
    }
}

Will this cause the reboot_modes sysfs attribute to emit duplicate string
values (e.g., 'normal normal') to userspace?

> +	}
> +
> +	return 0;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-arm-psci-s=
ystem_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com?part=3D2
