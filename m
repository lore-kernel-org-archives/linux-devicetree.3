Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D20345CCE
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813255; cv=none; b=fCefx7tzvkP+IxK8037UkXRpy1Euf2hVvZWedifeKQjI1gIJILtS00XyeB6alii7dr/FkOfzFj4VyEMY7zzt+z160X3jMqEPGN3F/HMCAhSKfx/5l/RKxGXO3SZ3Enmw3yuM91ecfc9iUuAphswpuGjLc+vXsqGAtXYqO0ZcDok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813255; c=relaxed/simple;
	bh=E8/AJjMDbXk1zPY34G1AYnTuDYcIQSs+LTFx9wEnE5Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O7L0udBgf1rzmVDY9yPrc/oygPuDcYt/zfQiWc4wg0Q2mY39pNhJabyuAfzH9uCXmXSqTyexlcwM5gqxZihC54GNtrF2b+V/eKjWakyMKssCVvlkz3DKIfCUSQj2EQwoD/pXoe7mlEqA7d2P9GF1YWAz24PmUl9of6Fev+gioVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wB894-00024B-BF; Fri, 10 Apr 2026 11:27:22 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wB892-004fJl-2Z;
	Fri, 10 Apr 2026 11:27:20 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wB892-000000005x8-3035;
	Fri, 10 Apr 2026 11:27:20 +0200
Message-ID: <631d4d65fdbda29cfbc0b96987b5f56fcd5116ea.camel@pengutronix.de>
Subject: Re: [PATCH v1 3/5] irqchip: starfive: Use devm_ interfaces to
 simplify resource release
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Ley Foon Tan <leyfoon.tan@starfivetech.com>
Date: Fri, 10 Apr 2026 11:27:20 +0200
In-Reply-To: <20260410090106.622781-4-changhuang.liang@starfivetech.com>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
	 <20260410090106.622781-4-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

On Fr, 2026-04-10 at 02:01 -0700, Changhuang Liang wrote:
> Use devm_ interfaces to simplify resource release. Make clock and reset
> get optional as they are not used on the JHB100 SoC. Replace pr_ logging
> with dev_* logging.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/irqchip/irq-starfive-jhb100-intc.c | 44 ++++++++--------------
>  1 file changed, 15 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-starfive-jhb100-intc.c b/drivers/irqchip=
/irq-starfive-jhb100-intc.c
> index 2c9cdad7f377..312a4634870a 100644
> --- a/drivers/irqchip/irq-starfive-jhb100-intc.c
> +++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
[...]
> @@ -127,48 +125,44 @@ static int starfive_intc_probe(struct platform_devi=
ce *pdev, struct device_node
>  	if (!irqc)
>  		return -ENOMEM;
> =20
> -	irqc->base =3D of_iomap(intc, 0);
> +	irqc->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (!irqc->base) {
> -		pr_err("Unable to map registers\n");
> +		dev_err(&pdev->dev, "unable to map registers\n");
>  		ret =3D -ENXIO;
>  		goto err_free;
>  	}
> =20
> -	rst =3D of_reset_control_get_exclusive(intc, NULL);
> +	rst =3D devm_reset_control_get_optional(&pdev->dev, NULL);

Please use devm_reset_control_get_optional_exclusive() directly.

>  	if (IS_ERR(rst)) {
> -		pr_err("Unable to get reset control %pe\n", rst);
> +		dev_err(&pdev->dev, "Unable to get reset control %pe\n", rst);

Consider using dev_err_probe() to stop printing -EPROBE_DEFER.

regards
Philipp
