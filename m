Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FCE37757A
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 23:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789254774; cv=none; b=j5hnOBH1otHC7ypWWuMogoEoN4vksMFy9La6jZ2iOOWu1SXXq/t43x042vRnlL3upgW1TCz7YZviwbg5MOQcJ3sFoF02/3+1KB3yBE4+ubRWFUvIuiAqmPBFtYTp4Xr8LN3EFzbXPqQWOk38V/mdhG5aZQAqR5J/G1aF6Yx0qNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789254774; c=relaxed/simple;
	bh=78CjYAI5vEjSw2g5XR9RVeaDfUES/hud8Wg2lGx3qe8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kobsUOp9RBzm4UPHEti+DCj9A87xQy0kqFGpIFuXk8rBnARhcnsG1Bmgrm9sDKouGbCN//rSIhhQpZRXN3l7vc89sWBKRAeddvzXpJdUlfPazc5WR8s+w+S9hcUX1dPRu6pA7+R4o8qgaDqOdK2avmBc9EZR/9UZWnbTq0JavN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/vFnuiq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/vFnuiq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163761F000FF;
	Sat, 12 Sep 2026 23:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789254773;
	bh=FkK3LJZFW2vJvCOul1qYZojco27Ltz+vNl3aNlOpOdA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K/vFnuiqsMPy2jByQS4PnWBW4xW5X4Q1MBwbKykTP9Hsg7NJiN9vGBhUaIiWs3tAu
	 M1Jyqw8GZWULORTr9h5oY0jMraDVguOMRjB4+2t7XFqgitzTbkY3UO4uPA1alEDqel
	 fuDLBXydX3W8fX8ILJKn59TQXnf5v6wI2GZRu1kvcwHOmkJi6c1wslkIkPQmFlDOhr
	 ykUY431iW/1O9qWJkdgbupqY/B2LvuAPeJH5L1BqVwujtIavzhmAo56O2PuStDDhy3
	 O6c2DSjDPIYs55WmNqKUg2xSBI6IvFW4fP7DkBnO+fffbGsLVULVCxMpMR60bG7Bit
	 a9KnR54B4RJ1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 7/8] usb: misc: qcom_eud: fix virtual attach/detach
 event handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260912225301.3396556-8-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
 <20260912225301.3396556-8-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 23:12:52 +0000
Message-Id: <20260912231253.163761F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Disabling EUD while virtually detached leaves the USB controller=
 stuck in a disconnected state.
--

commit 29002e5f224d237570095828a981e93ede8860c1
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: fix virtual attach/detach event handling

EUD provides virtual USB attach/detach events to simulate cable plug/unplug
while maintaining the physical debug connection. This commit fixes virtual
detach handling by setting the USB role to NONE instead of HOST.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 1ed81e0c7dc8e..423320cdc704a 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -313,10 +313,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, v=
oid *data)
>  	if (!chip->enabled || path->curr_role !=3D USB_ROLE_DEVICE)
>  		goto out;
> =20
> [ ... ]
>  	if (chip->usb_attached)
>  		ret =3D usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
>  	else
> -		ret =3D usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
> +		ret =3D usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);

[Severity: Medium]
This is a pre-existing issue, but does disabling EUD while virtually detach=
ed
leave the USB controller stuck in a disconnected state?

If EUD is enabled via sysfs, a physical connection is made, EUD triggers a
virtual detach (setting the controller role to NONE), and a user disables
EUD via the enable sysfs node.

The driver disables EUD, but no role restoration is performed for
path->controller_sw to reflect the physical path->curr_role:

drivers/usb/misc/qcom_eud.c:enable_store() {
    ...
	} else {
		ret =3D disable_eud(chip);
		if (ret) {
			dev_err(chip->dev, "failed to disable eud\n");
			return ret;
		}
	}
    ...
}

Does the controller remain functionally disconnected (USB_ROLE_NONE) despite
being physically connected (USB_ROLE_DEVICE) until a physical unplug and
replug occurs?

>  	if (ret)
>  		dev_err(chip->dev, "failed to set role switch\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912225301.3396=
556-1-elson.serrao@oss.qualcomm.com?part=3D7
