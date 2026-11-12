Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475507;
	b=yTMS8G69V5iJcYY2JzU57jbMaN2EckuX6pr5XLhQYdveV0AF6Vojtx35uCsSslMiHtre
	 IQn4j1DahmvhY009dGxHUcmCWFlyMr0eMru81ds4PTTeUfIgnL0LqbpN/UjndTnLK9ssj
	 /7iz8LrcuTpHtqNNgkC/ah9AhXmr7u8wqpQaNuZMIk7jQrPh75D54tJpWckOOsgHwanT9
	 Tpap3xsV67Pc8tRjdQOmYvKBOmzs/ASVKlv+YPIAS+uWQC/qX9IcLGZLP/JxIrpYB5Nnq
	 OoTHXQ/ybshoJevBOaJrunzErVNCt8iS8cnNPeplyxGpGMgaJiLoi5/99WAQbxPY4MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475507;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=390OdYzmCQAadg96QRQKIN+ZoBY670eiolK32zVDr8w=;
	b=nVnNxh8ZYXY9QSErRtz48YHZv4DZ4/5+RYiSFfAI/BUNWrpUpZxbFx81MLP2WMn7IRrP
	 0DUDAC5zplbSHm/lJrQq3GzwVLJR//IPjjOAOAgqfmzJFtO2/IEibFZ04sBAZsMNKQmAH
	 FIjKP5ZZcgOeYFZU4phKp7TM/1PWZdXG+Wh+k6nRQT6+LrFk64kWkDNWU+luyaDLJOGJj
	 Ag0tcstoqWpjkxUtL76N2g2jyCRQPWTG8hsCftKmv3gsjQtvW/DhKBfC5dj+YRwzces3V
	 96BYp+98xxtK9Bbrh1YdNeyPKWRAbHv5CcOL9lKhr8FVijOl/SlmaEvAnHKwZomCWkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LkMbi7hx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DAE606A33F
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LkMbi7hx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F55C1F00A09;
	Thu, 12 Nov 2026 09:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475507;
	bh=390OdYzmCQAadg96QRQKIN+ZoBY670eiolK32zVDr8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LkMbi7hx6+4ZmeNw1UzvaXH3RPuTng1AKDFCscC7jygObYKwP+zThMkPm/jPkTH/+
	 TvxM6FDUt6bjFCbQ/Gp/rjdlgvq/YY+aLkj0KTP2dthxhkYuG5GmuDb/BZwGACERzN
	 cr880FZBEOraEVGkI51rTHI4Q3DxOLJJOJDcF5mUWe/YwhDiqvxxmg7FdIDpv30czw
	 kL5gGXRKUXzaG1s/RAMOCyMaw7qaLzXiTWMuelYIgoi7PIiA4a6piqcZGFDBpKEumc
	 FHNX7Dy6bPDchceqXsOy6oP5SLHRWdF+wr7QTemhxUc6XDspkxfPisNKp6JA3V/PIK
	 ZNpJLkP2sdizw==
Message-ID: <sashiko-outbox-210874@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] soc: ti: Add TDA54 SCM configuration syscon
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Moteen Shah" <m-shah@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112091027.1601122-5-m-shah@ti.com>
References: <20261112091027.1601122-1-m-shah@ti.com>
 <20261112091027.1601122-5-m-shah@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 09:25:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] soc: ti: dangling syscon regmap on module unload in
  tda54_scm_conf_probe()
--

commit 7e23274fb2904b304448cf5fedb029681da31a63
Author: Moteen Shah <m-shah@ti.com>

soc: ti: Add TDA54 SCM configuration syscon support

This commit adds the TDA54 SCM configuration syscon driver, handling
proxy-based register access, SCM unlock/claim, and K3 SoC info
registration.

> diff --git a/drivers/soc/ti/tda54-mcu-sysconf.c b/drivers/soc/ti/tda54-mc=
u-sysconf.c
> new file mode 100644
> index 0000000000000..3ef82e737d095
> --- /dev/null
> +++ b/drivers/soc/ti/tda54-mcu-sysconf.c
[ ... ]
> +	regmap =3D devm_regmap_init(dev, NULL, scm, &tda54_scm_conf_regmap_cfg);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	writel(TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL, scm->base + scm->pdata->lo=
ck_offset);
> +	writel(TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL, scm->base + scm->pdata->lo=
ck_offset + 4);
> +
> +	/*
> +	 * There is no way to unregister a syscon regmap, so publish it only
> +	 * once nothing else in probe can fail.
> +	 */
> +	ret =3D of_syscon_register_regmap(dev->of_node, regmap);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register syscon regmap\n");
[ ... ]
> +static struct platform_driver tda54_scm_conf_driver =3D {
> +	.probe =3D tda54_scm_conf_probe,
> +	.driver =3D {
> +		.name =3D "k3-tda54-scm-conf",
> +		.of_match_table =3D tda54_scm_conf_of_match,
> +		.suppress_bind_attrs =3D true,
> +	},
> +};
> +
> +module_platform_driver(tda54_scm_conf_driver);

[Severity: High]
As reported by Andrew Davis on v1 [1], does unloading this module leave a
dangling regmap pointer on the global syscon_list?

TI_TDA54_MCU_SYSCONF is tristate (default m on ARCH_K3) and uses
module_platform_driver(), while .suppress_bind_attrs only disables the
sysfs bind/unbind files.  When the module is unloaded, devres frees regmap,
scm, and the MMIO mapping, and the module text containing
tda54_scm_conf_reg_read() and tda54_scm_conf_reg_write() is unmapped, while
syscon_list retains the freed regmap pointer.  Any syscon consumer that
has looked up or later looks up the regmap triggers a use-after-free and
calls into unmapped module memory, and reloading the module fails in
of_syscon_register_regmap() with -EEXIST.

Registering the driver with builtin_platform_driver() (or module_init()
without module_exit()) like other of_syscon_register_regmap() callers
allows building it as a loadable module while preventing module unload.

[1] https://lore.kernel.org/r/b5bc4c10-b364-4992-ae84-63e5b86771a3@ti.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112091027.1601=
122-1-m-shah@ti.com?part=3D4
