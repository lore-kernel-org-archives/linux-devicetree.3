Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091003;
	b=1tzUmVLv4kpndG/0IsP4cLJB9I05unCQ8R7hN3xHXQ01/L2ML9VyloSVQlJls5377PNM
	 v+JPalw0fnbNZ3O/J+9iM76ePtxNC4FScJ3B6JuV+vEFrv+7+i/VZNjD6zpPyUBBwTRuK
	 kCv/hy+i81feqLQJRpdiaA5KYP1ELC9HvOJ5lkoVK/ERPnQqVwiVmbuqPNVVHC9OljZ/r
	 f4JMMuw2pJeZiIiz5N0adBmWvLHPikfONy8eA5fh9T+e0GbxFlmUgNTdtKt97Ne7l41vj
	 yszPH081ZL0DdKh9KKJR3vss3AnO6+C9or3FLUrjwsJZ1VDOxJSLHTr8FWR8Hiu36yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091003;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5EFAEjqalCpQmC13QtUMO0BxdXX+KAUF6W7F68d/WQw=;
	b=LdcF4Ugk9S5ccuHRinWoAoYOKBb359rQRm2CKXdF+7s5+XcRnyht4fthFgCfOGNhfZ7f
	 xQukOu6FvnsM7Uy6x7BHvsjlSKOV4IS/yYWzZPzLEiqbK5eGE8yfmZT0kMNjGRbN4saeQ
	 lKsWNEHWsmNnS4K9XmKVxsYK/9PqsqbbDqPLC3j+GVS+EsZdw40GYKNLqyB7F27RJfYzN
	 Rco1shtmDFdgvbdL4Pm0zB913BTtvBHIW6fz+9hQofNTj+YYm9n1WvfHM/cLGbz33mQyu
	 PzzPViKyrjKZ3ZB3ySIrbYzxObfSNJ1UkC95cOoNFEoDchYmyJDZg/b9odNqCMD03Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TvZSwC0S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E759606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TvZSwC0S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86E91F01825;
	Tue, 27 Oct 2026 08:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793091003;
	bh=5EFAEjqalCpQmC13QtUMO0BxdXX+KAUF6W7F68d/WQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TvZSwC0S+JnpMMcV4DQlOAjgChQi9Sd5Mjb/VMHjqQHaZogI1BqwobauaQXSI6dev
	 MyFfWjPmGwObk8AT5v/Pmx3RJ/pbAWzXV0jucQZei+hSTDQIjhg2yUmfE5YPd4Ql+g
	 10gzUePOt1Vk/ZPWQRLl45uR4/sUCHPf1Frrn8BOckOL3bimI1Qy+Qp7W0frK4ZSY5
	 pyj9QuPc3QWkoHf2zC92XDPqaB7VzVutRfa4KdU6WvmlimO4ft3fHmD0UL44ov5+ev
	 97318RYjGIUcYqSwlxjACOhDgBuSAsuvqRCQIzAl0Ks1jIxlg0Q8009Ju5kbwIl6FB
	 IU7NLxjCdR5fQ==
Message-ID: <sashiko-outbox-186303@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] soc: ti: Add TDA54 SCM configuration syscon
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Moteen Shah" <m-shah@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027083700.1964371-4-m-shah@ti.com>
References: <20261027083700.1964371-1-m-shah@ti.com>
 <20261027083700.1964371-4-m-shah@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 08:50:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] soc: ti: use-after-free on module unload in tda54_scm_conf_probe()
--

commit f2ead172cf9d7f3e5cd199e2a129679497527a10
Author: Moteen Shah <m-shah@ti.com>

soc: ti: Add TDA54 SCM configuration syscon support

This commit adds the TDA54 SCM configuration driver to provide regmap/syscon
access to the SCM register space with proxy-based register claim/unlock
handling, and registers TDA54 SoC identification info via k3-socinfo.

> diff --git a/drivers/soc/ti/tda54-mcu-sysconf.c b/drivers/soc/ti/tda54-mc=
u-sysconf.c
> new file mode 100644
> index 0000000000000..3ef82e737d095
> --- /dev/null
> +++ b/drivers/soc/ti/tda54-mcu-sysconf.c
[ ... ]
> +static int tda54_scm_conf_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct tda54_scm_conf *scm;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int ret;
> +
> +	scm =3D devm_kzalloc(dev, sizeof(*scm), GFP_KERNEL);
> +	if (!scm)
> +		return -ENOMEM;
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
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
Can unloading this module cause a use-after-free when consumers access the
syscon regmap?

TI_TDA54_MCU_SYSCONF is a tristate Kconfig option (defaulting to m on
ARCH_K3), and module_platform_driver(tda54_scm_conf_driver) generates a
module_exit callback that invokes platform_driver_unregister(). While
.suppress_bind_attrs =3D true hides the sysfs bind/unbind attributes, it do=
es
not prevent unloading the module via rmmod or modprobe -r.

In tda54_scm_conf_probe(), scm, base, and regmap are allocated with devres
(devm_kzalloc(), devm_platform_ioremap_resource(), and devm_regmap_init()),
and regmap is then published globally via of_syscon_register_regmap():

drivers/mfd/syscon.c:of_syscon_register_regmap() {
    ...
	list_for_each_entry(entry, &syscon_list, list)
		if (entry->np =3D=3D np) {
			ret =3D -EEXIST;
			goto err_unlock;
		}

	syscon->regmap =3D regmap;
	syscon->np =3D np;

	/* register the regmap in syscon list */
	list_add_tail(&syscon->list, &syscon_list);
    ...
}

Because of_syscon_register_regmap() permanently stores the raw regmap point=
er
on syscon_list without taking a module reference or providing an
unregistration path, unloading the module detaches the device and runs
devres_release_all(), freeing regmap, unmapping base, freeing scm, and
unmapping the module text (tda54_scm_conf_reg_read() and
tda54_scm_conf_reg_write()) while syscon_list retains the dangling regmap
pointer.

Any subsequent or existing consumer using syscon_node_to_regmap() or
syscon_regmap_lookup_by_phandle() will dereference the freed regmap and call
into unmapped module text, and reloading the module will fail with -EEXIST =
in
of_syscon_register_regmap().

Should TI_TDA54_MCU_SYSCONF be bool (using builtin_platform_driver()), or if
it remains a module, avoid registering a module_exit callback so it cannot =
be
unloaded once registered with syscon?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027083700.1964=
371-1-m-shah@ti.com?part=3D3
