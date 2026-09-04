Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E7F3CD8D4
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512882; cv=none; b=I4wBN7gXyP0cweMHW64O3jG3aern18ILRRV+BwA2fJ/NppxSBWkrTBjnsqKfMn+DZzcPSmcpSi6iW3MUmRRncuq0BzHRMBrejyGBpRwwIBmQE2wVF4TpO/GnNGDF3syivAdXK4iuLVOEN8L6dW2OJ30S5iuiBz9jfwS/osE2GeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512882; c=relaxed/simple;
	bh=Xm8KGFNufJp2H5lSvgjhTalNt8xecd0PMruQSIZPWOY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QpNHK+eWMqbM3lhD+bwMNwDkWZiGdwxWVu5wHRq5RuP8ECYvLX4UGtpei3a6RIKRRTjTbqJDt32dDx6ErvgGN49+XSrsyTHpyvcwO7fubn3+8y+cC1YtjWMEkreUNq9YH0/BdHXa200+x4OmvhWZgI02NT6tIXE3xOWHSfc5Abg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dngh2ff7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dngh2ff7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7CD1F00A3D;
	Fri,  4 Sep 2026 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788512881;
	bh=Uw06pGTh6+zP84vvpZx2dFPOOZ9TxtfuB4OGSsqE9hg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dngh2ff7no4R5cJQUi+fYcS22INo7j4AV+ZOfXKO1/GkRhgUl2ZZRsan3nl6YAEVy
	 YFGz0KD724dSGDC2AhoPFcf3alUINIre387i47ECsacjW3OB/TniGLKffMmTLiv6/o
	 vhiP89LDeTy6BWGL4KUpQ7TA9FED/xfV88cn0Wg6vlivAlpVoXm9NAHDeFxs/0C6cF
	 Xoo9B6PbBK4XBRRSVyO0tU1t7ZUVUt75duOE3U7Imf1LLV4LCV6tlXYs4u+KamG+8V
	 uHBTgqNazATCfH+ely4W5FiEJKgDm98hQKj3dInrdkF+12Y+wzNSu8k+54jBxeQWKT
	 Gs6j1bp2uCk4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 14/16] power: sequencing: pcie-m2: Split Bluetooth
 unit based on interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904084158.1341550-15-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-15-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 09:08:00 +0000
Message-Id: <20260904090800.CA7CD1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Splitting the Bluetooth unit into separate UART and USB units in=
troduces a hardware state conflict where one interface can unexpectedly phy=
sically power off the device while the other is still using it.

Pre-existing issues:
- [High] Teardown asymmetry and lack of synchronization in the provider dri=
ver allows active consumers to trigger a UAF and kernel oops.
--

commit 04bd68356c9e71e9f7432f78d28c9d647b96c081
Author: Chen-Yu Tsai <wenst@chromium.org>
Subject: power: sequencing: pcie-m2: Split Bluetooth unit based on interface

This commit splits the Bluetooth power sequencing unit for M.2 PCIe connect=
ors
into separate UART and USB units. This allows either interface to independe=
ntly
toggle power, specifically enabling hardware resets during initialization or
recovery for serdev-based drivers.

> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/se=
quencing/pwrseq-pcie-m2.c
> index 987faa9f3b3ba..f7bcc8bb4c775 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
[ ... ]
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
> +	.deps =3D pwrseq_pcie_m2_unit_deps,
> +	.enable =3D pwrseq_pci_m2_e_bt_enable,
> +	.disable =3D pwrseq_pci_m2_e_bt_disable,
> +};

[Severity: Medium]
Since both pwrseq_pcie_m2_e_bt_uart_unit_data and=20
pwrseq_pcie_m2_e_bt_usb_unit_data use the same w_disable2_gpio in their
disable callback, does this split introduce a hardware state conflict?

If userspace or the USB core disables the USB interface, the USB unit's
refcount will drop to 0 and physically assert the shared GPIO. Can this=20
unexpectedly cut power to the Bluetooth controller while the UART consumer=
=20
is still actively using it, violating its state machine?

[ ... ]

drivers/power/sequencing/pwrseq-pcie-m2.c:pwrseq_pcie_m2_remove() {
    ...
	pwrseq_pcie_m2_remove_serdev(ctx, NULL);
	mutex_destroy(&ctx->list_lock);

	regulator_bulk_free(ctx->num_vregs, ctx->regs);
}

[Severity: High]
This isn't a bug introduced by this patch, but could manually freeing the=20
regulators here create a use-after-free window?

Because devm_pwrseq_device_register() is used in probe, the logical
sequencer device is unregistered by devres after pwrseq_pcie_m2_remove()
returns.=20

If an active PCIe or USB consumer (which are not created by this driver and
lack device links) invokes pwrseq_enable() during this window, it will call=
=20
pwrseq_pcie_m2_vregs_enable() which dereferences the freed regulator pointe=
rs
inside ctx->regs:

drivers/power/sequencing/pwrseq-pcie-m2.c:pwrseq_pcie_m2_vregs_enable() {
    ...
	return regulator_bulk_enable(ctx->num_vregs, ctx->regs);
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904084158.1341=
550-1-wenst@chromium.org?part=3D14
