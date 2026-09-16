Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04158448B85
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546453; cv=none; b=sMFn3eyMPBxjGV5ZpomztJT24MGeHz5jLLm/IRTyBkeKSW9j7FiM6/4fWftXAe5CulN3j1RN4CiTCM/qVpkO2xZSKxXiUHQHKYFJ14hnevM5F0pYJqWMp7z5nO4HC/EQKHsvvfaQ+mLO9GoXjJEYb22NglFZWQkqQNE83yk3RGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546453; c=relaxed/simple;
	bh=kSC2WRVwY7fjDq2Kz9jllXrGNgpF3Lb37/YNl9MuBV4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OHvMTqAvn5LbqYM9sVGcKRDtjTun8FZas0GstlkQ1L/M/NQCObeGGOaNowJZrtC9HGQIx60rMBJt7H0WEsO7e77CSbWH708eXjVbxja+oqRPKstw1nvZ82FN81oeh0AhH0ZZVt/IMj0mN7M2egUWugSkM1yCs+oGpd0Bi5P315c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nG7ZeS+h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nG7ZeS+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEC91F000FF;
	Wed, 16 Sep 2026 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789546438;
	bh=jpkwvQCsjhRsuBsBYl1dGf0Q4TxRv6pymnwNbJFvSkI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nG7ZeS+hp4KiZL05UYkbrh3D3v5feKCPFf5Wl8NjYeaEfVlkiDO1bapCaPAUrnGpe
	 0UlBqlUfARo139HWsNCSYq65QPyegqhFJm+lEBhKl0BHNKAOE0HZoigmE0iIiWQWGG
	 bR2jVwao2OXg/mB6TWFwXPGmglNJuiwd4py4xuc1ctb/Bg2+XuFASj89/iyDguTJC1
	 I2LDML7fr1ki1ucwuom/tYiE44BF7S0eNusSHB9iws7aRmabe0vnFhHQoaK79BsuDc
	 uRQhSm31aGUlSz4NsqkEuvD5SSO1zBE5iKbDnlSKrnCGq3nsnIfIqvF+zYHVhgSvHF
	 4zY4ty5ut+dWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 13/15] power: sequencing: pcie-m2: Split Bluetooth
 unit based on interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916075745.3549953-14-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
 <20260916075745.3549953-14-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 08:13:58 +0000
Message-Id: <20260916081358.9CEC91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pwrseq: conflicting hardware state toggles between USB and UART
--

commit 93617e3cd28ec70ace0cc6829369a35a56e3ca15
Author: Chen-Yu Tsai <wenst@chromium.org>

power: sequencing: pcie-m2: Split Bluetooth unit based on interface

This commit splits the Bluetooth unit into two (USB and UART) to allow
either interface to independently toggle power, unbreaking the Qualcomm
Bluetooth serdev driver.

> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/se=
quencing/pwrseq-pcie-m2.c
> index 2066e3f1900df..bf5ebc2a82f53 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -83,8 +83,22 @@ static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_de=
vice *pwrseq)
>  	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
>  }
> =20
> -static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data =3D {
> -	.name =3D "bt-enable",
> +/*
> + * XXX There are two Bluetooth units to allow either one to be able to p=
ower
> + * off and thus reset the controller. In practice only one of the interf=
aces
> + * is used, so there is no conflict. However userspace could power off t=
he
> + * USB unit by disabling the associated USB port, without the UART unit =
or
> + * its consumer ever knowing.
> + */
> +static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_uart_unit_data =
=3D {
> +	.name =3D "bt-uart-enable",
> +	.deps =3D pwrseq_pcie_m2_unit_deps,
> +	.enable =3D pwrseq_pci_m2_e_bt_enable,
> +	.disable =3D pwrseq_pci_m2_e_bt_disable,
> +};
> +
> +static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_usb_unit_data =
=3D {
> +	.name =3D "bt-usb-enable",
>  	.deps =3D pwrseq_pcie_m2_unit_deps,
>  	.enable =3D pwrseq_pci_m2_e_bt_enable,
>  	.disable =3D pwrseq_pci_m2_e_bt_disable,
> +};

[Severity: Medium]
Will this bypass unified reference counting for the physical GPIO line?

If the USB subsystem (e.g., via sysfs port disable or fault recovery) disab=
les
its unit, pwrseq_pci_m2_e_bt_disable() unconditionally drives the shared GP=
IO
to 1.

Could this forcefully reset the hardware and abruptly drop the active conne=
ction
of the UART driver, even if its reference count is still greater than 0?

Although the comments and commit message acknowledge this flaw, without an
exclusive lockout mechanism, does this expose the active subsystem to state
corruption from independent events and violate the PM consistency model?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916075745.3549=
953-1-wenst@chromium.org?part=3D13
