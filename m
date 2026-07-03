Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFFC3E5EF2
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086533; cv=none; b=hYBfw3wIdrFqL6OuiY/89GyNubMbxInq19rj0jrOZmbZwBuDQ66b/dml9rEIuG4Bx5aCDCmYsDotAiUnL20TxB7/cGCMu1QAMpvR1uLz6CNDq6uoj9yDYWCE0gFc4cjyTK57WkJd+RcKHRJew9oLdT/DofLDoA/grmAHcjgE4Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086533; c=relaxed/simple;
	bh=cyTn81F+Rah8itBaFEQYq1m0kVD/7vlqwnp63VA9uDs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WNtQwlaXf71uIFj0YAwbnQmJrD//+S1k7EiCpOJxacoYM36VtU+SyeZKv6i6eVmtOGXDMVlj5DYufIbsC4SHY/CbAcbe+4QsqxZkyho+oN7wRSsBTm/+Cw0Pa7CmmENxR7Q7B+50HYKoVMecNGLRcCIMSJA5zdDmV4/76l0gBu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjYJB1IP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjYJB1IP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DE51F000E9;
	Fri,  3 Jul 2026 13:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783086532;
	bh=YW+2Rwf63CFBpMSC9PfDV18j05VZjRA0AMa82pg2ros=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AjYJB1IPmaHIWC1rjx88mgg+yIvm/Rnz/C/AiDDcWmNpzcxfcMR2WJj1WylNHea+3
	 F8LK2NzLS2lOu569+rfuF6k+JJyepIeF/ONwMClBMHruXRD9Gooj176Sw5aFxfX+ci
	 ceTVdokrTZBmz712DibHdtrSx9be66jU+fII1YgFQXf+krwPzfDiQ0dsqEGBbwnJiI
	 bUPbIGbbr67LksD3JSbXC9r4XbDNBvI07CrY/WWcSiNSEdjjR9w63LndRlcw/5I4vK
	 tEOj8yD2Asha8Yx1l1VYS+onnMf0ZXNvtGrNRJTeID5v0T7DvhigrCWgg829n+hcED
	 nHjnuNtorYLbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/12] soc: fsl: qe: Add support of IRQs in QE GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703-qe-pic-gpios-v1-12-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-12-6c3e706e27dc@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 13:48:50 +0000
Message-Id: <20260703134851.41DE51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device node reference returned by `of_irq_parse_raw()` is le=
aked in both the error and success paths of `qe_gpio_to_irq()`.
--

commit 2a534a80a5cfc86c1f2f49ad1709de185cee4a4b
Author: Paul Louvel <paul.louvel@bootlin.com>

soc: fsl: qe: Add support of IRQs in QE GPIO

This commit adds interrupt support to the QE GPIO controller driver by
implementing the to_irq() callback. It uses the interrupt-map nexus node
to map GPIO lines supporting IRQs to the parent QE PIC interrupt domain.

> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index 66828f2a35774..f8919642f40df 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c

[ ... ]

> @@ -135,6 +137,29 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, uns=
igned int gpio, int val)
>  	return 0;
>  }
> =20
> +static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct qe_gpio_chip *qe_gc =3D gpiochip_get_data(gc);
> +	struct of_phandle_args oirq;
> +	struct irq_domain *domain;
> +	int ret;
> +
> +	oirq.np =3D qe_gc->np;
> +	oirq.args_count =3D 2;
> +	oirq.args[0] =3D gpio;
> +	oirq.args[1] =3D 0;
> +
> +	ret =3D of_irq_parse_raw(NULL, &oirq);
> +	if (ret)
> +		return ret;
> +
> +	domain =3D irq_find_host(oirq.np);
> +	if (!domain)
> +		return -EPROBE_DEFER;
> +
> +	return irq_create_of_mapping(&oirq);
> +}

[Severity: Medium]
Does this leak the device node reference stored in oirq.np?

When of_irq_parse_raw() successfully parses the interrupt, it increments the
reference count of the returned device node in oirq.np. It looks like
of_node_put(oirq.np) needs to be called before returning to avoid leaking t=
he
reference on both the -EPROBE_DEFER error path and the success path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-qe-pic-gpi=
os-v1-0-6c3e706e27dc@bootlin.com?part=3D12
