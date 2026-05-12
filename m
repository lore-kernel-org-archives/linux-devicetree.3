Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD43735A398
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628589; cv=none; b=iKz/8bogZZKQF64kj8JFzL+sX0oF6Gmrjiq5sEaQDS3XcFkIZsLN1BdEW0b970jTF9WJ8jNCHgyR3ZACi5GJRZXvE2CjBhrW4t9o14y9+dw9XdDO92kXja+sNlftlkmsBzEpKPRoe8b1v5B6LLNfOSGHkIhWMTX21YGmethLP0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628589; c=relaxed/simple;
	bh=Phvim/89ff0uCEi93PKL577+gi18W7Cu7eVSwxkmdjA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aNuuuZCetIkgPJoW7SamSQkLIP/DgbI2X6DvdEvTZdyLu/LKZuDGUjocnD+1DO9/L4Pe1aYZSHp1Hr6ZGQozqnFtEPEkWaVxfZCim+8PdPF6oA9A15R2LReFc7luhrCej8Pz2CccKWuuZ222n9RpEt/6x77fj3VRS1gljpdQ1FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvR+BrRB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvR+BrRB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D5AC2BCB0;
	Tue, 12 May 2026 23:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778628589;
	bh=Phvim/89ff0uCEi93PKL577+gi18W7Cu7eVSwxkmdjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AvR+BrRBpZ+cRdNRTOuQTGj325oL81MQOlk3Th9FIH558WlQDO7380LYLLgzWVQuj
	 HHyhpK6LcNKTXbnZewCoZyYjAKbthAb83YCY3QnTmQHRacI1L+f46BKIn/WWEyPPa5
	 fPESS/UqJoGF8nHOGNJPaXp0X2A6AeluxTCuJqBzzZ9LHbWwhRylm+J/hH+HN9923+
	 xL3Z0ssvwnO/AEdYLHHMowi4Uti5Zl7VHlvOFBxIwYBjqtAbcnLNjd+V0/70NJ3a+i
	 ToNkMZp4IVUuLSw6+z8bWrSHouww9NBbKEK0ZOKoW5oq+znUGo8jRrQPbC9pNp2KZN
	 ZDtcrty9yrtQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/6] usb: chipidea: tegra: Avoid controller/PHY init
 if bus is externally controlled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260511135703.62470-3-clamor95@gmail.com>
References: <20260511135703.62470-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:29:48 +0000
Message-Id: <20260512232949.35D5AC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unbinding the `tegra_usb` driver when `nvidia,external-control` is=
 present causes a NULL pointer dereference.
- [Medium] Unconditional call to `usb_phy_shutdown()` in `tegra_usb_remove(=
)` on an uninitialized PHY triggers a kernel warning.
--

commit 3826697c3ab50338add8e2c889c119f3dae6b570
Author: Svyatoslav Ryhel <clamor95@gmail.com>

usb: chipidea: tegra: Avoid controller/PHY init if bus is externally contro=
lled

If the USB controller and PHY are externally controlled, the registration
of the controller and the PHY initialization are skipped. This delegates
configuration to the device that controls the bus.

> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 372788f0f9701..593390a818d12 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c

[ ... ]

> @@ -342,12 +348,14 @@ static int tegra_usb_probe(struct platform_device *=
pdev)
>  	if (of_usb_get_phy_mode(pdev->dev.of_node) =3D=3D USBPHY_INTERFACE_MODE=
_ULPI)
>  		usb->data.flags &=3D ~CI_HDRC_SUPPORTS_RUNTIME_PM;
> =20
> -	usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
> -				      pdev->num_resources, &usb->data);
> -	if (IS_ERR(usb->dev)) {
> -		err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
> -				    "failed to add HDRC device");
> -		goto phy_shutdown;
> +	if (!usb->externally_controlled) {
> +		usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
> +					      pdev->num_resources, &usb->data);
> +		if (IS_ERR(usb->dev)) {
> +			err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
> +					    "failed to add HDRC device");
> +			goto phy_shutdown;
> +		}
>  	}
> =20
>  	return 0;

When nvidia,external-control is present, usb->dev is left uninitialized
and remains NULL. Does the unbind path still try to use it?

Looking at tegra_usb_remove(), it unconditionally calls
ci_hdrc_remove_device() with usb->dev:

    static void tegra_usb_remove(struct platform_device *pdev)
    {
        struct tegra_usb *usb =3D platform_get_drvdata(pdev);

        ci_hdrc_remove_device(usb->dev);
        ...

This looks like it could lead to a NULL pointer dereference, as
ci_hdrc_remove_device() dereferences the pointer immediately without checki=
ng:

    void ci_hdrc_remove_device(struct platform_device *pdev)
    {
        int id =3D pdev->id;
        ...

Could this regression cause a crash on device unbind or module removal
when the controller is externally controlled?

Additionally, when the PHY initialization is skipped during probe, does
tegra_usb_remove() still attempt to shut it down?

    static void tegra_usb_remove(struct platform_device *pdev)
    {
        ...
        usb_phy_shutdown(usb->phy);
        ...

Since the PHY wasn't initialized, its frequency will be 0. Calling
tegra_usb_phy_shutdown() on this uninitialized PHY appears to trigger
a warning regression:

    static void tegra_usb_phy_shutdown(struct usb_phy *u_phy)
    {
        struct tegra_usb_phy *phy =3D to_tegra_usb_phy(u_phy);

        if (WARN_ON(!phy->freq))
            return;
        ...

Should tegra_usb_remove() be updated to check if it is externally
controlled before calling the shutdown and remove functions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511135703.6247=
0-1-clamor95@gmail.com?part=3D2
