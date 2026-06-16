Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9DD42189F
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603121; cv=none; b=hujjQG6luSPpJmyV2Ze0/SdR0yzHYjMjYX5OIRh3Ga1S5oWzamXi391mOPCmXdtwLJBLsjTjUOp3kwavO7j4/5IPw9Sbbp3TXETD2upXAg/k2wpXPeC8q1F2fsZyTzec+iRDE7cKBIuX6HC0mSQtfe/YaJYCxCQdU6TQ1fGoE5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603121; c=relaxed/simple;
	bh=WVLgNVfq8X7GKcycuWyeOCuyMDhj/g3YCdTYvkK+Xt4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B6rCZTFYeSY7G6cxfHHYx2WBvQY96ufAHTEU9cm7BEf5Mq/wy0wtkAPQRWc8DaupSivU3hm5NS0TnJz9tHuYgHP+i7WlfLeEEOPNYGfpnauQlBIQJukG1sPRryT8DGi2f7hrDIaeuGmWnLMuaUc6dwfIDyN6iv4mUqHMCSt3o3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDWt4d2s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDWt4d2s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376531F000E9;
	Tue, 16 Jun 2026 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781603120;
	bh=+5PUF1hAvaDtYB5v2b9lwTTOmSDsIgbephWFv+C36jA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FDWt4d2smXlqp1NHhrUS9dUgr0/1/ykXsWYmzpfRDtPAPStK9bXOi7JX5wtOY3Re6
	 WbeOmJaSLFK7mbAwr7Lacyklv3/P6jt/VkJPmy6DYKxCodwoxRrUGfkmgtAfxqUIGa
	 26OBMaEqd84gwEhoPEyLetEG8FwQJkHq4MIOM7g3olAmSd0gbIPhkrrsbZ1meRV0Qw
	 xRwv/P5Mf97/rRGbYXye/ScNIgjNsKdtHLdmHG0bx+kjasfLcifS66NwMB6hyYIgnu
	 D3anEk14aC8/3kzB8pGiCiD+JtF3tl9DT8NzI5ebNL5xKej1j2YSUBGmmL5l45XpfS
	 F5ifhs+pAicgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/8] pinctrl: qcom: Acknowledge IRQs for PDC
 interrupt controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maulik Shah" <maulik.shah@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260616-hamoa_pdc_v3-v3-6-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-6-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 09:45:19 +0000
Message-Id: <20260616094520.376531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds `IRQCHIP_EOI_THREADED` to `msm_gpio_irq_chip.flag=
s`, which alters the EOI timing for all threaded interrupts, but this funct=
ional change is completely undocumented in the commit message.
--

commit c69ba699fb1e70baa301113c62200fca65540992
Author: Stephan Gerhold <stephan.gerhold@linaro.org>

pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller
   =20
This commit updates the MSM GPIO driver to properly acknowledge incoming
GPIO interrupts for the PDC interrupt controller. For edge-triggered IRQs,
it uses handle_fasteoi_ack_irq() as the IRQ handler and forwards the
irq_ack() callback to the parent IRQ chip.

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 11db6564c44df..17665e1a9dbcb 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c

[ ... ]

> @@ -1395,6 +1408,7 @@ static const struct irq_chip msm_gpio_irq_chip =3D {
>  	.flags			=3D (IRQCHIP_MASK_ON_SUSPEND |
>  				   IRQCHIP_SET_TYPE_MASKED |
>  				   IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND |
> +				   IRQCHIP_EOI_THREADED |
>  				   IRQCHIP_IMMUTABLE),
>  };

[Severity: Medium]
The commit message does not mention the addition of IRQCHIP_EOI_THREADED.

Does this change belong in a separate patch, or should the commit message
be updated to explain why it is needed?=20

Adding this flag alters the EOI timing for oneshot threaded interrupts
handled by this chip, deferring the irq_eoi() callback until after the
threaded handler completes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-hamoa_pdc_=
v3-v3-0-4d8e1504ea75@oss.qualcomm.com?part=3D6
