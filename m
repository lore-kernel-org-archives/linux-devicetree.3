Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A110F2F8EB0
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 14:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311197; cv=none; b=Q2vMi8+BTgxWSABR0bEHDdLKe2zBzPM+usX58TbDhmjEpD6KNzPHrP+D4q7R2fujSjWXzfvpG7ukLLjea8MbEBakoYtzGk2st0C7XnzTh0xZ040VBTFByLgRHKqAREA+pX+KLFZG92uy5wgs93eGdy72L4TqlrH8CsHmk2KYcj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311197; c=relaxed/simple;
	bh=unQCWB8mlBOHFX6T0aaVCE6djqON6w24wYfneHfmYRE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TIvPGjyx2xNOETpCh5q+xK2wBxHSkLXDWe+L8x9p4n94hiMy07+DvEnu+g0ZnPOCAbohUssY7nV3lRYLekOVecmLMmrU0zgHXZSljNl6655aIvDSJeP56auH3RhXz0Nl5kMHWrgFqd4Nz4yKuNwajVQyg1xjsQ11f0C6Ks28mfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwZ55Kz8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwZ55Kz8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2A51F000FF;
	Sun, 13 Sep 2026 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789311196;
	bh=THXMB0cwhof3F6EMJ7XVjHsXE/pd+3MulSn+hRcf4Fw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HwZ55Kz8uakXOzpd3kdwnb5MqgpOrWSKr4LYVXTuiVwO6LlZkxD6qp01c1769S4M/
	 ab3OzqlheoGd0co54Tyvok7Dk3Wyz/1VHDnyZPk8rZU5Fb/Usi6VFYFOzrX/Iam4+Z
	 bZru8gBLqEXcCpDQPbMB4mwmibZjM99ywxbHNs0dqWtbbco5RqtOEva5xde9en6oB3
	 b9QkM8+cRCktl94iN7/Tcn5llRksMbAC9b5zb1vIuRhMlO7mubhRck6Ob0kDHWTdXV
	 KSw0b2vLFgnI8w/9iRSalkfG6/7mjEOidRrG7BRhHL/+nXoIHOoMS9mwHWZexgdj2c
	 orThekKzKKGEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, vkoul@kernel.org
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-5-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
 <20260913-eusb2-interrupt-v8-v8-5-0f505b9c394b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 14:53:15 +0000
Message-Id: <20260913145315.BD2A51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Probe fails unconditionally if CONFIG_GENERIC_PHY is disabled beca=
use the error check misses -ENOSYS.

Pre-existing issues:
- [High] Missing lock and lifecycle protection when accessing xHCI drvdata =
leads to NULL pointer dereference during concurrent driver unbind.
--

commit fda37af83fa24f9ca3c0472a4d6f4d45d01b3ce6
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets

This patch modifies the interrupt handling for eUSB2 PHY targets in host
mode to configure wakeup interrupts differently based on the connected devi=
ce
speed. The driver now queries the PHY type and configures DP/DM edge
interrupts accordingly.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56b..e6b6beb38fcba 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
[ ... ]
> @@ -683,6 +705,17 @@ static int dwc3_qcom_probe(struct platform_device *p=
dev)
>  	if (ignore_pipe_clk)
>  		dwc3_qcom_select_utmi_clk(qcom);
> =20
> +	phy =3D devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy)) {
> +		if (PTR_ERR(phy) !=3D -ENODEV) {

[Severity: High]
Will this unconditionally fail to probe when CONFIG_GENERIC_PHY is disabled?

If the kernel is built without generic PHY support, devm_of_phy_get_by_inde=
x()
returns ERR_PTR(-ENOSYS). Since this check only allows -ENODEV as a benign
error, an -ENOSYS return will cause the driver to invoke dev_err_probe() and
abort initialization.

Should this check also handle -ENOSYS to allow graceful fallback when
the PHY subsystem is disabled, similar to how the DWC3 core handles it?
(e.g., if (PTR_ERR(phy) !=3D -ENODEV && PTR_ERR(phy) !=3D -ENOSYS))

> +			ret =3D dev_err_probe(dev, PTR_ERR(phy),
> +					    "failed to get usb2 phy\n");
> +			goto clk_disable;
> +		}
> +		phy =3D NULL;
> +	}
> +	qcom->has_eusb2_phy =3D (phy_get_type(phy) =3D=3D PHY_TYPE_EUSB2);
> +
>  	qcom->mode =3D usb_get_dr_mode(dev);

While reviewing the driver context, I noticed a pre-existing issue in the
surrounding codebase:

drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_read_usb2_speed() {
    ...
	/*
	 * FIXME: Fix this layering violation.
	 */
	hcd =3D platform_get_drvdata(dwc->xhci);

#ifdef CONFIG_USB
	udev =3D usb_hub_find_child(hcd->self.root_hub, port_index + 1);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does this missing lifecycle
protection for the xHCI drvdata lead to a NULL pointer dereference?

If the child xhci-plat driver fails to probe, or if a user unbinds it via s=
ysfs
(e.g., echo xhci-hcd > /sys/bus/platform/drivers/xhci-hcd/unbind), the driv=
er
core calls dev_set_drvdata(dev, NULL). This releases the PM usage count and
causes the parent dwc3-qcom controller to enter runtime suspend.

When dwc3_qcom_runtime_suspend() then calls dwc3_qcom_read_usb2_speed(), it
blindly retrieves the now-NULL drvdata via platform_get_drvdata() and
immediately dereferences it when accessing hcd->self.root_hub.

Could this race condition trigger a kernel panic during a concurrent driver
unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-eusb2-inte=
rrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com?part=3D5
