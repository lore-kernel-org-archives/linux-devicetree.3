Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500BA346E6C
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164947; cv=none; b=dxpPROCV74UhRmDlXbEs8JGRzMZUvv13hLDYJ03J8p2FHYB61Qn/FI6HhH0XEawL7QoJTut/l+kRIYLuCz/MZhm+HLap6Lxlwe3ngtYNQEnAifS4FnXys5eXkyUB4yh7i7PZ10SES0+Lo8yHfgw74jUzTyf9vrR5PNe4cdM+Hy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164947; c=relaxed/simple;
	bh=oNgC/5DMFu7bNxug7YjyWIHE6bVfPI4EiyTZAZ9J2Gk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NIHTNMgFT67EJvUCEK0suRmU+IOzuS2JiK+xUZPxUmm+wVU4aUEUnHre0ut/TW+wMtQqf7G+BNuSDUlJm1rBMip0HI8ErrLlsf84WOh0sJOG/CUpY/o+w4V8xi+x7kHXxftYTqP0DqmxHtvLsYKnZ9tT6adOQU9a4k2lp+rl/rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwA0pS85; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwA0pS85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE9D1F00893;
	Thu, 11 Jun 2026 08:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781164946;
	bh=EQM1VJawKxw/i2NTQxcq+FzM1j2cLHvSGsarXEBjE+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LwA0pS85c9MvgFTu+PKSLtkJVFRrr0IoIDrH6iNGdUqaBo4Ra7ZOrmPhBh+EM4N3L
	 rMQZVdUVwrnBIJEU6jDocfVtlr87yPg+NCDNsITr9lNLDett1aqYwcyGHZiQURLjKf
	 OmdO+64goh01XyjNPXlCKhN6BrRutIvXJk9627R/i9SmQXSjN/gRwFaEkTa3JDgwMs
	 gSACu9S8bNKSFpX/dkWGLqFDz0G1bx5PTaHNgVG/TU2/lvwpykIP4hjbFB2y26xcIW
	 RPz4V/mypdofg49vUAcXqkJtUnV7iA3cZ/Tma46AhTFR1d0QiGq/CvquK2SyL1o5nb
	 cVdLopW9imd1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/2] pinctrl: meson: amlogic-a4: support
 gpiod_to_irq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao via B4 Relay" <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260611-gpio-to-irq-v1-2-12201716f23f@amlogic.com>
References: <20260611-gpio-to-irq-v1-2-12201716f23f@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 08:02:25 +0000
Message-Id: <20260611080225.BBE9D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Premature `of_node_put()` in `aml_get_of_irq()` creates a dangling=
 pointer, leading to a Use-After-Free.
--

commit 682e8ff8b51a310ddf41177d04828ab2fd8a5670
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

pinctrl: meson: amlogic-a4: support gpiod_to_irq

This patch adds the to_irq() callback implementation so that gpiod_to_irq()
can map GPIO lines to IRQs correctly.

> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl=
/meson/pinctrl-amlogic-a4.c
> index 5ae0c19d007d7..663681887f35c 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c

[ ... ]

> @@ -836,6 +839,32 @@ static int aml_pctl_parse_functions(struct device_no=
de *np,
>  	return 0;
>  }
> =20
> +static struct device_node *aml_get_of_irq(struct device_node *np)
> +{
> +	struct device_node *of_irq;
> +
> +	of_irq =3D of_irq_find_parent(np);
> +	if (of_irq && of_device_is_compatible(of_irq, "amlogic,meson-gpio-intc"=
)) {
> +		of_node_put(of_irq);
> +		return of_irq;

[Severity: High]
Does this premature of_node_put() call create a use-after-free risk?

of_irq_find_parent() returns a device node with an incremented reference
count. By calling of_node_put() before returning the pointer, the reference
is dropped while the pointer is still passed back and cached in bank->of_ir=
q.

Later, aml_gpio_to_irq() dereferences this pointer:

    fwspec.fwnode =3D of_fwnode_handle(bank->of_irq);

If the device node is dynamically freed (for example, during Device Tree
overlay removal) between caching and use, this would lead to a
use-after-free. Should we retain the reference here until driver teardown
instead?

> +	}
> +
> +	if (of_irq)
> +		of_node_put(of_irq);
> +
> +	return NULL;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-gpio-to-ir=
q-v1-0-12201716f23f@amlogic.com?part=3D2
