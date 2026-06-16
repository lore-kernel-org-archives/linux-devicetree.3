Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6063911CA
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602585; cv=none; b=m2Rrr6w1Opq466X7DEbHU/FskrrC1w+mGPzrlg8jO8nOSu1TgI9h+PZQeMTXgnlqm4s1aSkX+Kcw43AtHMVXYH/D2+QJ8tGLqyiSzHzceChgpSBGjWuEF0BvOu7hJXMj6+Kf0Cq3FeTQLelsCzE1hFKgzRzBUZsflFPCo/sz1U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602585; c=relaxed/simple;
	bh=YpSgsOBX5ZrIXMTKHBQmLupXFsPxOohYbjQt0ZYOZSg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nyy9Z4woXa/4TJwqPDU+EzJwjSacRGnHRTGJtjxE8vWDqi5Gxp36FAF4ykvO+oQoNwMISY7xHPN+zDCLzoKvRO5fRApb20m7Xr+rO9uWzhtLqdaNdWmO17NOdw53pBzxIB3vEka0s0Gh9GdyVCFuMz9joByOMeiy6tjyF8hu6us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nafq/uxz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nafq/uxz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936991F000E9;
	Tue, 16 Jun 2026 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781602583;
	bh=vydmwUmA81FSz3gMEqDDYmNv81l+LHUpKbJnZ/aLZ1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nafq/uxzEX/3xRKgpE8WUM61/ATlr7AqVXGW6Le+GIIEIp9s2VdhNPTltCZhOaKjU
	 FQIQFadhpZ0/NMeH1JFuoiaOsYsOXNoY5GX3wucP61KtLGxViQ1bPg1L2ltkGDNXYX
	 znB570/A2+a/j1zxryeuI4+5QcSFmK6rpBJw95vEeN53WdGgj0N6fgnJCpWZS7sYMF
	 PJD7wWGWPiiqAZYb4uOa3K/myAp6xh6+ZLcsulURYSbIkIQQ34xH+S/EgV12Y0+4k2
	 ejRn3nZTyTCw4ySk07PQJJJbJrCv7dAQ7tFeODnfB74pcSysvD6Gf85ztIeyJv15Lf
	 XlF0C+cBWGIbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr()
 wrapper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maulik Shah" <maulik.shah@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260616-hamoa_pdc_v3-v3-3-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-3-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 09:36:23 +0000
Message-Id: <20260616093623.936991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Uninitialized spinlock acquired during driver probe.
--

commit ff89675171bbba82a63beea5300191b24d1a290f
Author: Maulik Shah <maulik.shah@oss.qualcomm.com>

irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper

This commit removes the pdc_enable_intr() wrapper and moves its locking
into pdc_enable_intr_bank(), as the lock is only needed for the shared
bank and not for individual IRQ_CFG registers.

> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index b9acb0f25c9c8..6c556464d37c0 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -206,6 +206,8 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
>  	index =3D FIELD_GET(IRQ_ENABLE_BANK_INDEX_MASK, pin_out);
>  	mask =3D FIELD_GET(IRQ_ENABLE_BANK_BIT_MASK, pin_out);
> =20
> +	guard(raw_spinlock)(&pdc->lock);

[Severity: High]
Does this cause an uninitialized spinlock to be acquired during driver prob=
e?

Looking at qcom_pdc_probe(), the lock is initialized after setting up the p=
in
mapping:

qcom_pdc_probe() {
    ...
    ret =3D pdc_setup_pin_mapping(dev, node);
    ...
    raw_spin_lock_init(&pdc->lock);
    ...
}

And pdc_setup_pin_mapping() invokes pdc->enable_intr() for each pin:

pdc_setup_pin_mapping() {
    ...
    for (int i =3D 0; i < pdc->region[n].cnt; i++)
        pdc->enable_intr(i + pdc->region[n].pin_base, 0);
    ...
}

Previously, pdc_setup_pin_mapping() bypassed the lock because it was held in
the pdc_enable_intr() wrapper, not the enable_intr() callback. By moving the
lock down into pdc_enable_intr_bank(), won't the probe sequence now attempt=
 to
acquire a zero-initialized lock before it has been initialized with
raw_spin_lock_init()?

> +
>  	enable =3D pdc_reg_read(pdc->regs->irq_en_reg, index);
>  	__assign_bit(mask, &enable, on);
> =20
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-hamoa_pdc_=
v3-v3-0-4d8e1504ea75@oss.qualcomm.com?part=3D3
