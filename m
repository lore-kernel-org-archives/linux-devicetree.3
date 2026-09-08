Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27BB4BC005
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861637; cv=none; b=jnvOQvWC7Qda8ghkcRe2JkXHiWClkXOJ+Z6mFbwmBwFYQvYwlTsI1xYKjnajbjYtDvysefm7LwxymrmOvqEov2RROGIgGoLJpbSRC3p7PGSGH07kbyRMPAm5MGI/s6XBNuKfzG0xMthUwUPULN0N0envwxvnuKMUSVQyQZDKQ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861637; c=relaxed/simple;
	bh=srQ2A5VV/cyEGiwcpTMvDn8T73Ze1isj1ybuGgjyvLI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RomogCcJL+omwBLKdCbQ+2WIRIFs5nPVgQ8+7eqfzVuKjVn3zKNNhpdHPg12075DbwBc8VpLTFtd+9IJtg9HNMHUcGzdF9lVdI3WExFMfQPay5yOXQybrHcxHD4WJOtHJr3YSN43NFG04Y8UWfisDw+hwMyJRML637kCq1nETqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUDnKKkP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUDnKKkP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF431F00A3A;
	Tue,  8 Sep 2026 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861636;
	bh=7W77UbWEUusZJJ5q0PGhRgmH4tl2obP0MFjMpRjzx4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AUDnKKkPsm2bdYx9zl7ol9hni5kq+3h/bTOWvLSrDJUo6V0vFjPuWEXM8+akvxwgp
	 7SCjCvAR+jvy/vUzFLaohi7ZJ/mcr2Jt8Kl/hLTO0Oa6PvXAvCEeiT8PYHCd6tg3dl
	 uK4yJ0zcY0FR6AOINSNrEAZcQAQ2EsZ0KswqVq6bHzOSYE4VU6T3D3NxL04gOJzI6G
	 nbgTcTeQ4nHRc16YAMyIGZ1H0iJdhYw3ps4tL2zAR8ou3jleFG5H/gO7wJK+oF3p1C
	 2NrC4QaUF2Q5mriy12Wnpd2y+I0gXG/V0J625ErdD34thP/Pk1cpJKZ1GSkHp7Xf+v
	 NzNAD3qMsgzWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/9] usb: chipidea: usb2: add optional reset support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-4-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
 <20260908-b4-spacemit-k1-usb2-v2-4-f07342ffa051@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:00:35 +0000
Message-Id: <20260908100035.EBF431F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Double clock disable and hardware reset ordering issue in driver t=
eardown.
--

commit 13027fbf78c576199d06490bac312974df846e8a
Author: Junzhong Pan <panjunzhong@linux.spacemit.com>

usb: chipidea: usb2: add optional reset support

This commit adds optional reset support for the USB2 controller on the=20
SpacemiT K1 SoC to maintain hardware compatibility.

> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/c=
i_hdrc_usb2.c
> index 6fae2d4a053a1..f81673edca3c1 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c

[ ... ]

> @@ -75,6 +77,11 @@ static int ci_hdrc_usb2_probe(struct platform_device *=
pdev)
>  		return dev_err_probe(dev, PTR_ERR(priv->clk),
>  				     "failed to get or enable the clock\n");
> =20
> +	priv->reset =3D devm_reset_control_get_optional_exclusive_deasserted(de=
v, NULL);

[Severity: High]
Could adding this devm-managed reset trigger a hardware hang during driver
unbind?

Since ci_hdrc_usb2_remove() manually disables the clock:

ci_hdrc_usb2_remove() {
        ...
        clk_disable_unprepare(priv->clk);
}

Devres actions execute in reverse order (LIFO) after remove() completes, so
the hardware reset will be asserted automatically by devres after the clock
is already manually disabled. Asserting a reset synchronously without an
active clock can hang the bus or lock up the SoC on many platforms.

Additionally, since the clock was previously updated to be acquired using
devm_clk_get_optional_enabled(), the manual clk_disable_unprepare() in
remove() results in a double-disable of the clock when the device is unboun=
d,
triggering clock framework warnings.

Does this require cleaning up the manual teardown in ci_hdrc_usb2_remove()
to ensure proper ordering?

> +	if (IS_ERR(priv->reset))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset),
> +				     "failed to get or deassert the reset control\n");
> +
>  	ci_pdata->name =3D dev_name(dev);
> =20
>  	priv->ci_pdev =3D ci_hdrc_add_device(dev, pdev->resource,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-b4-spacemi=
t-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com?part=3D4
