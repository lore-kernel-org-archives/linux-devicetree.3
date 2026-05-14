Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03683382F1
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778792954; cv=none; b=lx6gTMVGsZtwgFTC4ZQHREu9p663TdwzLwGHQkkDlhbfUXX/wAQJuXUFEjpUHLrUqvHgWXbDWv6f+LIJ4E4yCgPt4B8g3Kpe3lG3EfE5PZii0xK5wDb42Cv+OD/8i6m7MQ6s0r+dHwWyWGRz1s3DQ/03ISLYTOkHtvd9wCWPHBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778792954; c=relaxed/simple;
	bh=s+ehIgsTqHZ3cZluymbd9WY8V7KiVhRgABiFK48k70g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GNeyg7JYIiG8SqCq6PBYSSATRjvVC96EqgA8l+CLP4j6T02rV18JMw3vCI1MnmSYToYSW+E1i5wYd+hBBIl0WbQkalmD6r0MDbe1s7O8yKrp1E+AcPXwvZovWJ8R45Yr3gu8y9GwUbEROQE+Fd+4D9SEnBSvnlLFxHWtDRQo0CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHl+QoCc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHl+QoCc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42623C2BCB3;
	Thu, 14 May 2026 21:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778792954;
	bh=s+ehIgsTqHZ3cZluymbd9WY8V7KiVhRgABiFK48k70g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SHl+QoCcBnxvqhd5N3l9UvEMcqTnMW1Qeqhx4vDorrmE2w4SZbhvLV/rwPaegBqPi
	 G1u4x+PwZQlhPG2PwLM46VT/vRwFdLPWRpyOpnSzIivf3/vP+xDpbhATnh6wQDp1RT
	 zR6mkD/xvQOzxktH/L0OizOQYPDXHGDWzuyhXg6apCZHrAa+jNsG4Ga0pO55sfHx08
	 TezJ7mPu/Onc74O1Uf9wLnbeRftft8yUDBuS9HYDYcSMgPkyrJO8YLNmW+pKdhsPo2
	 0b99x1pQk67ErfYSTHmV045FmcNmAsdNH4BRbTYVd2B8oMPjNWF96Lvoh4mbyr9alc
	 Dntxx3WNTAG2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-3-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-3-28a5bde07483@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 21:09:13 +0000
Message-Id: <20260514210914.42623C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Memory allocated by reboot_mode_add_predefined_modes() leaks if =
driver probe fails before registration.
--

commit ee3620bd44dbaeea7086626f9b3f70bbf53b0350
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

power: reset: reboot-mode: Add support for predefined reboot modes

This commit extends the reboot-mode framework to handle predefined modes
alongside those defined in the device tree. Drivers can now define and
register their own reboot-modes via the framework using a centralized
initialization call.

> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
[ ... ]
> @@ -344,6 +375,55 @@ void devm_reboot_mode_unregister(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_reboot_mode_unregister);
> =20
> +/**
> + * reboot_mode_add_predefined_modes - Add predefined reboot modes
> + * @reboot: reboot mode driver
> + * @modes: array of predefined reboot mode entries
> + * @count: number of entries in @modes
> + *
> + * Add predefined reboot modes in a single call before registration.
[ ... ]
> +int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot,
> +				     const struct reboot_mode_entry *modes,
> +				     size_t count)
> +{
> +	struct mode_info *info;
> +	int ret;
> +	size_t i;
> +
> +	if (reboot->reboot_notifier.notifier_call =3D=3D reboot_mode_notify ||
> +	    !list_empty(&reboot->predefined_modes))
> +		return -EBUSY;
> +
> +	if (!modes || !count)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < count; i++) {
> +		info =3D reboot_mode_create_info(modes[i].name, modes[i].magic);
> +		if (IS_ERR(info)) {
> +			ret =3D PTR_ERR(info);
> +			goto error;
> +		}
> +
> +		list_add_tail(&info->list, &reboot->predefined_modes);
> +	}
> +
> +	return 0;
> +
> +error:
> +	reboot_mode_release_list(&reboot->predefined_modes);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(reboot_mode_add_predefined_modes);

If a driver successfully calls reboot_mode_add_predefined_modes(), but the
probe function fails before reboot_mode_register() is called, does this code
leak the dynamically allocated mode_info structures?

For example, if devm_reboot_mode_register() internally fails at
devres_alloc() and returns -ENOMEM before calling reboot_mode_register(),
the framework will not be registered. Since devres will later free the
reboot_mode_driver itself, the dynamically allocated list elements added to
predefined_modes appear to be permanently orphaned.

Would it be possible to provide an exported cleanup function for error
handling, or perhaps manage these allocations using devres?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-arm-psci-s=
ystem_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com?part=3D3
