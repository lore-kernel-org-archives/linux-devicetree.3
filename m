Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291CD433058
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108080; cv=none; b=PjZLm9W1Spk4MOuU/NkAbp6lQw2o+gdI9AZiMn2F336w2zQN5T3qNoQuzT4yXETspzxMSt7lIg8GaRSMBOBFLmDESl3GBXrTDj3IxCPw9IrNLLs6l4crHxbzplQfr8BMzBd4pqJJvSosKzt7BuEx5KDHSBPOGqL2m6pO3Ovt7Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108080; c=relaxed/simple;
	bh=WpZfNFKGjumO8+Z/Bho1volJmGE/eUifvTrmGF9sf/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=REBI1Kf56mCwPPjHSi5TBGIwvylZ7gJ8jAsDgsUXvBMGzEejDUm3mSC01LEDOok6CbzqSBOyuFcOAiq6JpYeDkkQc6utnpapwWcbMVlsxWFaDF81Gyj8mTg0tG1ks2Fd2wb6XF0hbax7qGQDePyzNjY9c1fiGDu2QV/MU+7Scho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+cO8QWN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+cO8QWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EAC1F000E9;
	Wed, 15 Jul 2026 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784108073;
	bh=7WDn2+djxYXvbq4lHIUhtDS8np7JlOdc7QDeFYFki4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A+cO8QWNdyuXacHjTJABv7Q4bCZEoS02DZPGBq+Ryst6HIxO2pYPX/4ivLiFVcIDZ
	 B8fBa9+0YS5RrGdkYZ4ce6npOa5ZlksYVitRzV3aEOf/J2+UXEku+40rD4w4ckNLo8
	 ccf7dZVMmFRobxWvsyD1WuVgjvuDz4R3sqQALnKhnNPPYh9YrEzpmQwtIAsYE0ol7m
	 waIGDW2ocdf/FQsnLzXRtaaFeDtA8qLBh6qQ9Rn9xpOAovSkr3H0MtGWm3HcYA2wWI
	 LAOv6YL3yE7+n0sEmu3x2qg4ZvNaCgI7zfXif++iDH6DN7LJ0gjPm+ouM/hg2FZnNI
	 VAygDWAbuH3uQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/16] power: sequencing: pcie-m2: Split Bluetooth
 unit based on interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715085348.3457359-15-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-15-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:34:32 +0000
Message-Id: <20260715093433.32EAC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Splitting a single shared physical reset GPIO into two logical pow=
er sequencing units bypasses the core's refcounting, causing the USB subsys=
tem's runtime PM to inadvertently power off the Bluetooth controller while =
it is actively in use by the UART driver.
--

--- Patch [14]: [PATCH v5 14/16] power: sequencing: pcie-m2: Split Bluetoot=
h unit based on interface ---
commit 87ef77e2c86fea3f38f875c67c427d48fa406c76
Author: Chen-Yu Tsai <wenst@chromium.org>

power: sequencing: pcie-m2: Split Bluetooth unit based on interface

This commit splits the Bluetooth power sequencing unit into two distinct
units (UART and USB) to allow independent control. It aims to fix
initialization and recovery for serdev drivers by letting either interface
toggle the power.

> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/se=
quencing/pwrseq-pcie-m2.c
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -83,8 +83,22 @@ static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_de=
vice *pwrseq)

[ ... ]

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

[Severity: High]
Does splitting a single physical reset GPIO into two logical units bypass t=
he
power sequencing core's refcounting?

The commit message notes there is no conflict in practice, but won't the USB
subsystem's runtime PM automatically turn off the Bluetooth controller while
the UART driver is actively using it?

Because a power sequencing target exists, the USB core removes the PM QoS
constraint for the port:

drivers/usb/core/port.c:usb_hub_create_port_device() {
    ...
    /* Userspace owns the policy, drop the kernel 'no_poweroff' request. */
    retval =3D dev_pm_qos_remove_request(port_dev->req);
    ...
}

If the USB port on the M.2 connector is physically empty (since Bluetooth is
using UART), runtime PM automatically suspends the empty port and powers it
off:

drivers/usb/core/port.c:usb_port_runtime_suspend() {
    ...
    retval =3D usb_hub_set_port_power(hdev, hub, port1, false);
    ...
}

This calls into the power sequence disable callback for the USB target. Sin=
ce
both logical units control the exact same physical w_disable2_gpio, won't
this disable action blindly assert the reset GPIO and yank the power state
from underneath the active UART driver without any user interaction?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.3457=
359-1-wenst@chromium.org?part=3D14
