Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468925;
	b=QIQADfIA7s4eJqQDVaZ7L0MT/+CQhxgMPCieHtrBVc0t0UBpUl0wFBXBZdwStm0IBlRr
	 UaiFmQGc4VdTmsmD92h2vO9t82aCzOdmGUuPME8ThRrWYkW0OF8LOx7bTDSBX7gLDGRAk
	 2jTr6ykof9Ia2DMkEeVXL9XnH5ghodrr84jSk47tHCrE/dlvpUklGw/7iDcFzT+iMmqcW
	 /1FQCCWmlyzJYWvNHto7TaQC6RlWp+lryJy0bKVJc1GRno4tKKPdE4tiH65TlSF0pPOiI
	 AuY3tAoq6SziAZou4FOKNnESXj2W6AoF5bTj/U+XH71K21P1Eogu1YiC27WpceaXmWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468925;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iHvQScvW7jXvcnXbU6VuzVbGjbXD7QIbA/h+54rh/ko=;
	b=JY+4tVY442GfmKsGxiJXu3e1xcm0SBC1uVFiwlG3X+w9HF6CNJ/LXUTLhbG8Q5gzKi4N
	 hMYt6nbmKmy0k5Gbp0Th4JsMtjbPugOsDAjq9f1scV8eDB8N8wyVpyNuw89AeFVDSgj7B
	 TTRHFmnEHjCqfE9tci96+84H1Jq6sSbZrUV6EU280f0SAkX+ptyFLOBWbF0tv1NW85BhB
	 iCcyyzbAAbiXmWVqoOEgfQMuJ3IXkiwtmLcMZt2P7RJ4xaqnUB3oXvDewnTb4f9GUFyHK
	 h5zLdJtudpovGO8Xf+oTocWFb4YM1JG4HQGZ/ZbObtYqFNoaHfLpAe23t83NdpFb5/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAaZKPF0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6A1606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAaZKPF0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40C21F00A05;
	Thu, 12 Nov 2026 07:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794468925;
	bh=iHvQScvW7jXvcnXbU6VuzVbGjbXD7QIbA/h+54rh/ko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YAaZKPF09kgJL1IZbZ6LPcwHctA+HQqwUPboLgkc6Sw8TCX4fiGY/RtPkSPeVfw/w
	 1U/mFK3q2ZnrTRPekU3tNa45BRnbkQBudGAChKrILN91qNJD27eKeyMqmNL3UBzcBf
	 AbgOV3gI/EC4pZRqHSFxWQiEXP+Z816IXQHX83t+83MMFkqUZK9ArRWg+f7kpr1Q3I
	 f2kX/7MDQ9RaBYRsgI0tBJNxLLYiO6nhGfgYwZCMAg4S+9ehmV87LWJSG0bRBnMipg
	 +Fj5f9xqB/zO3GAa9Vp6xiJqW6hgxl826BIiTAwGg+cx8iswuJFCQyu4jscw8PKAxo
	 XDrg6wvjTJ9Qw==
Message-ID: <sashiko-outbox-210616@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] power: sequencing: qcom-wcn: support SW_CTRL
 wake IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linghui Wu" <linghui.wu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112072009.3815276-3-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-3-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:35:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] power: sequencing: missing wake IRQ trigger type in
  pwrseq_qcom_wcn_probe()
- [Low] power: sequencing: qcom-wcn: direct inclusion of
  linux/pm_wakeup.h
--

commit 832aa68ed4662747e202e91c3f57f19829c22253
Author: Linghui Wu <linghui.wu@oss.qualcomm.com>

power: sequencing: qcom-wcn: support SW_CTRL wake IRQ

This commit adds support for requesting the SW_CTRL GPIO and registering it
as a dedicated wake IRQ when the WCN PMU is marked as a wakeup source.

> diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/s=
equencing/pwrseq-qcom-wcn.c
> index e51b655add01c..26b436df9b93e 100644
> --- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
> +++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
> @@ -11,6 +11,8 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/pm_wakeup.h>

[Severity: Low]
include/linux/pm_wakeup.h forbids direct inclusion (#error "Please do not
include this file directly.") and is already included via <linux/device.h>.

[ ... ]

> @@ -525,6 +534,33 @@ static int pwrseq_qcom_wcn_probe(struct platform_dev=
ice *pdev)
>  		return dev_err_probe(dev, PTR_ERR(ctx->bt_gpio),
>  				     "Failed to get the Bluetooth enable GPIO\n");
> =20
> +	if (device_property_read_bool(dev, "wakeup-source")) {
> +		swctrl_gpio =3D devm_gpiod_get(dev, "swctrl", GPIOD_IN);
> +		if (IS_ERR(swctrl_gpio))
> +			return dev_err_probe(dev, PTR_ERR(swctrl_gpio),
> +					     "Failed to get the SW_CTRL GPIO\n");
> +
> +		wake_irq =3D gpiod_to_irq(swctrl_gpio);
> +		if (wake_irq < 0)
> +			return dev_err_probe(dev, wake_irq,
> +					     "Failed to get the SW_CTRL wake IRQ\n");
> +
> +		ret =3D devm_device_init_wakeup(dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to enable wakeup\n");
> +
> +		ret =3D dev_pm_set_dedicated_wake_irq(dev, wake_irq);

[Severity: High]
Does wake_irq ever get an interrupt trigger type configured?

gpiod_to_irq() maps the GPIO line with IRQ_TYPE_NONE, and
dev_pm_set_dedicated_wake_irq() calls request_threaded_irq() with only
IRQF_ONESHOT | IRQF_NO_AUTOEN.  Because neither supplies trigger flags,
__setup_irq() skips __irq_set_trigger().  On Qualcomm TLMM GPIOs,
msm_gpio_init() initializes the IRQ with IRQ_TYPE_NONE and handle_bad_irq,
relying on .irq_set_type to program hardware trigger registers and install
the real flow handler, so SW_CTRL wake interrupts will either fail to fire
or hit handle_bad_irq() instead of waking the system.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112072009.3815=
276-1-linghui.wu@oss.qualcomm.com?part=3D2
