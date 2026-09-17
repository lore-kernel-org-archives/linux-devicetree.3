Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE53EC2E6
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632609; cv=none; b=MVIoAt3vfsiy81z52eloqK19sFN+xpWmAzaeCOpOp4AGyK8+Sa/bkaPxGTYJGrBPszhvTcF3hPyOkC/z+KC2R3/s/Cs1l1nFDdBarrRQkl3za2kzf9wego7/0EJmNAgcNN0ol4V5rPiPV62OG5Yaip5MUq5CG1LqHHFR4NPYpOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632609; c=relaxed/simple;
	bh=ca5E9e0MExLH6dSG1rQKq5B9WmpPyS1ZmJrX7bVuUHg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SyAKU2ft2RLxueflCVxZVdTQxctVTPCSU/DJ5kMEcbwRXOmiO2F6ItLO275TMF7TxxqlqKssyVz5Yh8ot62G8tX27sjaIid7DLeHS+gDy0HoQwAOXIfM1BdW/NKL9CJJkBX5CTP1aHX2MpvAK5OofGHbghyJmSi5mWyDvghDjTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6F6tmnJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6F6tmnJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B611F000FF;
	Thu, 17 Sep 2026 08:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632608;
	bh=NGjTgldjlXcYF+YIbmdSz9TlLg0T9cmtip1P4v1IERY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D6F6tmnJFp0jYOEwLm3XkXBdI0EypIO8kOT4E0hRF122SoJCa7Y6POmmUuxXWAzbl
	 ttIMzihQaDD5/hnmYhw8FOw59wYKBnMa6tGxzCo12mrToEKaWxmx3/cou7dUF21FwN
	 8qaVo8uDVmGpLOLvirDH2EhFiBmLLeBkPre1MjV0cvlqTY1naL4/8K3HcO9Q7j86F8
	 5oom7oGRXtPYckpSl+UhViaXtcc98pKy2agwBY+lZKym3VYpknZQBm0mx6HbTZWEQv
	 nR6C7Hnf08FiMAHr4i9Z5hibLLhOYpVR97/HJd5isS2L1GRjZxG3rFUPxsWRVoz4AK
	 MVhPMbuQbigGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliav Farber" <farbere@amazon.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917075611.47881-4-farbere@amazon.com>
References: <20260916182641.9768-1-farbere@amazon.com>
 <20260917075611.47881-1-farbere@amazon.com>
 <20260917075611.47881-4-farbere@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 08:10:07 +0000
Message-Id: <20260917081007.B1B611F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pps: probe failure in pps_gpio_setup() leaves pins in default st=
ate
--

commit c39f475f46d4d918a014f1945bfb60ecc434ce54
Author: Eliav Farber <farbere@amazon.com>

pps: clients: gpio: release pins to an inactive state on remove and shutdown

This commit introduces logic to transition PPS GPIO pins to an "inactive"
pinctrl state when the driver is unbound, shut down, or fails to probe.

> --- a/drivers/pps/clients/pps-gpio.c
> +++ b/drivers/pps/clients/pps-gpio.c

[ ... ]

> @@ -161,11 +224,16 @@ static int pps_gpio_probe(struct platform_device *p=
dev)
>  	if (ret)
>  		return ret;

[Severity: Medium]
If pps_gpio_setup() fails here, will this early return bypass the newly
introduced err_release_pins label? Since the pinctrl "default" state is
applied by the driver core before probe(), it seems returning directly here
might leave the hardware pins stuck in the "default" state instead of putti=
ng
them into the intended "inactive" state on probe failure.

Could pps_gpio_get_pins() be moved earlier in the probe sequence so that
the inactive state is available to be restored consistently across all fail=
ure
paths?

> =20
> +	/* pinctrl setup (optional states) */
> +	ret =3D pps_gpio_get_pins(dev);
> +	if (ret)
> +		return ret;
> +
>  	/* IRQ setup */
>  	ret =3D gpiod_to_irq(data->gpio_pin);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917075611.4788=
1-1-farbere@amazon.com?part=3D3
