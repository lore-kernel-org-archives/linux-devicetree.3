Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A143B83FB
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632270; cv=none; b=Mr7CJl0KaP73a6nrPA1FdCPUN5SSwYLOIs+yIADng+ZHPRJgGcbhVSHJifttZ+TYTJB5J83P29M2BA85saVlGtwmzziONwsrkAqaGxwtr5kaoy1n/aUvze/uR5SGkH0ddxzaZxRx8j/oL0BbGtMi+WNFvFps90Mg5+b10K17hMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632270; c=relaxed/simple;
	bh=neZSQLZgswaL311z+q1SVyD6vtDb7V1A/OqEhgXfhNA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ndUyxK1iHmMofsOYXNUpV7JE9Ezq6+i3n3m11fgOHxVDMhiCvK1D/QwNs8EHvbRZZy7AEZMARfkTZD47h628Siv5jm9MVlAkSOrdeXyflLkT+Y1mKtiHX3tEemG3y7tD8Duz4AU/Q3Pzzg5UGAw2WAderUP7G5njfk8/Kc9frQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHgLCZgm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHgLCZgm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82151F000FF;
	Thu, 17 Sep 2026 08:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632269;
	bh=a8BBQxNn64XRw1bBmCBOWjXfwnCj4rIcIE4wUyMsE/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jHgLCZgm6wjWax0tX4hrfrzgJT+x0x4nAnvEm9hcqRaN0XQugynxeDq6VHGSyaUFz
	 3hNE+YNNrutec6XDBAC4PB9mgAFcNwtrnMmS3Z4VPeac13EX4sEWZoYtjHe2F4nvNp
	 faV9JZSL9w6R8IPD1ywSPXluUZuAVwEKD6sEsFlGLrTpxUsyEzQI2gdPCtem9Fqu7J
	 lPk8ARWV+AaGnzlt7BDSdu8IC3RfUxo7wVhFr1+T8r+TjRBiPtf1BoXacqpLVjTyED
	 w/58V0L+VUAWr5kPlbb3YV/EfW8xwGFGXIaa2ra8h7YJirmiElQ+3cV7odEyA1VWCo
	 7mwCNNDHWk8hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] pps: clients: gpio: propagate probe error codes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliav Farber" <farbere@amazon.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917075611.47881-2-farbere@amazon.com>
References: <20260916182641.9768-1-farbere@amazon.com>
 <20260917075611.47881-1-farbere@amazon.com>
 <20260917075611.47881-2-farbere@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 08:04:28 +0000
Message-Id: <20260917080428.B82151F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] pps: log spam on deferred probe due to dev_err()
--

commit 7ffb1c8320d0b6933d1ffc7e8877c00811256618
Author: Eliav Farber <farbere@amazon.com>

pps: clients: gpio: propagate probe error codes

On the two probe error paths that map and request the interrupt, probe
overwrote the error from gpiod_to_irq() and request_threaded_irq() with a
hardcoded -EINVAL, hiding meaningful codes such as -EBUSY, -ENOMEM or
-EPROBE_DEFER from the caller. The request_threaded_irq() failure message
also logged the IRQ number but not the errno.

> diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpi=
o.c
> index 73ec2c7335e51..038c55c5f7d4a 100644
> --- a/drivers/pps/clients/pps-gpio.c
> +++ b/drivers/pps/clients/pps-gpio.c
> @@ -165,7 +165,7 @@ static int pps_gpio_probe(struct platform_device *pde=
v)
>  	ret =3D gpiod_to_irq(data->gpio_pin);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to map GPIO to IRQ: %d\n", ret);
> -		return -EINVAL;
> +		return ret;

[Severity: Low]
Does propagating `ret` here risk console log spam if `-EPROBE_DEFER` is
returned? Since `dev_err()` is used unconditionally, it could cause log spam
during system boot if probe deferrals happen repeatedly.=20

Would `dev_err_probe()` be more appropriate to handle deferred probes
silently?

>  	}
>  	data->irq =3D ret;
> =20
> @@ -197,8 +197,8 @@ static int pps_gpio_probe(struct platform_device *pde=
v)
>  			  data->info.name, data);
>  	if (ret) {
>  		pps_unregister_source(data->pps);
> -		dev_err(dev, "failed to acquire IRQ %d\n", data->irq);
> -		return -EINVAL;
> +		dev_err(dev, "failed to acquire IRQ %d: %d\n", data->irq, ret);
> +		return ret;

[Severity: Low]
Similarly, does propagating the real error here risk logging spam on
deferred probes? Repeatedly deferring could trigger this `dev_err()`
multiple times.=20

Would `dev_err_probe()` be more appropriate here as well?

>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917075611.4788=
1-1-farbere@amazon.com?part=3D1
