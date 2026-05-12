Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4C21CC5C
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778553887; cv=none; b=VlKFhO9tBoSO4knhdvfaoBX9ENV3NUq7mTSxzjAzQkS43xW7B0PHOcG/OXkoBwIlS8qxoKHAC9MA/2fgGqQhADgPja1iE0bUsyoD97UWSgp3NMrsTF9xyPwD85S+oRIm44g0LgQcnSPcmKlmm9medcZZtqxsX1SsRdPZ26/BmGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778553887; c=relaxed/simple;
	bh=HqrBhn6IenYOFcvikaorOExT5ng2y6nghQpchsV/brA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dplx8CYs0zSJH0gXrsXWsZ3FXVXmLwgE96e9Kv42Lyy/r/fdFph9HIh5lZ1kPpd+P2YWzmn6d3spP11i5V1swF5ORPIPXLKD7nqtriZx06oiNb2hpf2P5T92GNa5lrNGd5t3KcjcvhZqk8HFpoYVjAI/ibejhUwoAkImEr5H+UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkHI0J2u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkHI0J2u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FBAC2BCB0;
	Tue, 12 May 2026 02:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778553887;
	bh=HqrBhn6IenYOFcvikaorOExT5ng2y6nghQpchsV/brA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fkHI0J2uZODqFcCJ+ruqRXEdSlPgVj66JdNcjmwtaGYCnJYtXqteJ5qIrLSq2nj1l
	 z9Bf4TbLnjXsOebfqz02YoUOzugE9WvhfagOyeB8pBw+dXtFPNiN9tjd7sZ+eGOVXh
	 9PjtXNXzr1zRk1vwyvVs8Ej1fqSPEk9xRbnBmKBLkCqyGwD/z9sVaZs1zoCxUHNpRq
	 oPPNr69gPt+aQ6u8eaEKPcr/tRagWnjKy7gzzK94iyHuC9YJcGNeR2mKWL0eTdFxER
	 JaQ0i0pEIUm99Z1h1Qe7XN3OGTXS1T6YPx6QMeLzcThv3eZ6rk1J4sC+vC9e0jtJBD
	 yoiCRkxxhsK8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/5] mfd: Add support for MediaTek SPMI PMICs and
 MT6363/73
Reply-To: sashiko@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511101355.122478-6-angelogioacchino.delregno@collabora.com>
References: <20260511101355.122478-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:44:46 +0000
Message-Id: <20260512024447.15FBAC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Double free of the IRQ domain on probe error handling.
- [High] Completely broken IRQ unmasking logic causes out-of-bounds shifts =
and targets incorrect registers.
- [High] Out-of-bounds array read in chained IRQ handler due to double inde=
xing.
- [High] Uninitialized variable dictates control flow on regmap read failur=
e.
- [High] IRQ allocation loop overwrites the same descriptor and leaves subs=
equent ones uninitialized.
- [High] Race condition causing lost interrupts due to delayed W1C register=
 clearing.
- [Medium] Failure to properly check for a mapping error from `of_irq_get()=
`.
--

commit 4bb145c21ce1c6663167ab05057b958ba97cdc22
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

mfd: Add support for MediaTek SPMI PMICs and MT6363/73

This driver adds support for MediaTek SPMI PMICs and their interrupt
controller. It sets up a regmap from the SPMI bus and initializes an
irqchip to handle chained interrupts for sub-devices.

> diff --git a/drivers/mfd/mtk-spmi-pmic.c b/drivers/mfd/mtk-spmi-pmic.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/mfd/mtk-spmi-pmic.c

[ ... ]

> +static void mtk_spmi_pmic_irq_set_unmasking(struct irq_data *d, bool unm=
ask)
> +{
> +	struct mtk_spmi_pmic *pmic =3D irq_data_get_irq_chip_data(d);
> +	const struct mtk_spmi_pmic_variant *variant =3D pmic->variant;
> +	struct regmap *regmap =3D pmic->regmap;
> +	irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +	unsigned short i;
> +
> +	for (i =3D 0; i < variant->num_groups; i++) {
> +		const struct mtk_spmi_pmic_irq_grp *irq_grp =3D &variant->pmic_irq[i];
> +		u32 con_reg;
> +		u8 irq_en_bit;
> +
> +		if (hwirq < irq_grp->hwirq_base)
> +			continue;
> +
> +		con_reg =3D irq_grp->con_reg + (variant->con_reg_len * i);
> +		irq_en_bit =3D hwirq - irq_grp->hwirq_base;
> +		regmap_assign_bits(regmap, con_reg, BIT(irq_en_bit), unmask);
> +
> +		break;
> +	}
> +}

Does this loop evaluate correctly for hwirq? Since the first group has a
hwirq_base of 0, the check (hwirq < irq_grp->hwirq_base) will always be
false for any unsigned hwirq. This means the loop will process every
interrupt as if it belongs to group 0, and then immediately break.

Additionally, could this result in an out-of-bounds shift? If hwirq is 40,
irq_en_bit evaluates to 40 - 0 =3D 40. Using BIT(40) can result in undefined
behavior for 32-bit values or a shift out of bounds for the register.

Finally, is the register offset calculated correctly here? The code uses the
group index i to calculate the register offset rather than the chunk offset
((hwirq - base) / 8), which seems to target incorrect registers.

[ ... ]

> +static int mtk_spmi_pmic_irq_alloc(struct irq_domain *d, unsigned int vi=
rq,
> +				   unsigned int nr_irqs, void *data)
> +{
> +	struct mtk_spmi_pmic *pmic =3D d->host_data;
> +	struct irq_fwspec *fwspec =3D data;
> +	irq_hw_number_t hwirq;
> +	unsigned int irqtype;
> +	int i, ret;
> +
> +	ret =3D mtk_spmi_pmic_irq_translate(d, fwspec, &hwirq, &irqtype);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < nr_irqs; i++) {
> +		irq_set_lockdep_class(virq, &mtk_spmi_pmic_irq_lock_class,
> +				      &mtk_spmi_pmic_irq_request_class);
> +		irq_domain_set_info(d, virq, hwirq, &mtk_spmi_pmic_irq_chip,
> +				    pmic, handle_level_irq, NULL, NULL);
> +	}
> +
> +	return 0;
> +}

When nr_irqs is greater than 1, does this loop repeatedly initialize the
same descriptor? Because virq and hwirq are passed directly without adding
the loop index i, the first IRQ is overwritten multiple times while the
remaining descriptors are left uninitialized.

[ ... ]

> +static int mtk_spmi_pmic_handle_group_irq(struct mtk_spmi_pmic *pmic, in=
t group)
> +{
> +	const struct mtk_spmi_pmic_irq_grp *irq_grp =3D &pmic->variant->pmic_ir=
q[group];
> +	struct regmap *regmap =3D pmic->regmap;
> +	struct device *dev =3D pmic->dev;
> +	int i, ret;
> +
> +	for (i =3D 0; i < irq_grp->num_int_regs; i++) {
> +		u32 status, saved_status;
> +
> +		ret =3D regmap_read(regmap, irq_grp->sta_reg + i, &status);
> +		if (ret) {
> +			dev_err(dev, "Could not read IRQ status register: %d", ret);
> +			return ret;
> +		}
> +
> +		if (status =3D=3D 0)
> +			continue;
> +
> +		saved_status =3D status;
> +		do {
> +			irq_hw_number_t hwirq;
> +			u8 bit =3D __ffs(status);
> +
> +			/* Each register has 8 bits: this is the first IRQ of this group */
> +			hwirq =3D MTK_SPMI_PMIC_VAL_BITS * i;
> +
> +			/* Offset by this group's start interrupt */
> +			hwirq +=3D irq_grp->hwirq_base;
> +
> +			/* Finally, offset by the fired IRQ's bit number */
> +			hwirq +=3D bit;
> +
> +			status &=3D ~BIT(bit);
> +
> +			generic_handle_domain_irq_safe(pmic->dom, hwirq);
> +		} while (status);
> +
> +		/* Clear the interrupts by writing the previous status */
> +		regmap_write(regmap, irq_grp->sta_reg + i, saved_status);
> +	}
> +
> +	return 0;
> +}

Could this write-one-to-clear implementation lose interrupts? If a child
device triggers a new interrupt after being serviced but before the
regmap_write() call, writing back saved_status (which has the serviced bits
set) will clear the newly arrived interrupt without it ever being handled.

[ ... ]

> +static void mtk_spmi_pmic_handle_chained_irq(struct irq_desc *desc)
> +{
> +	struct mtk_spmi_pmic *pmic =3D irq_desc_get_handler_data(desc);
> +	const struct mtk_spmi_pmic_variant *variant =3D pmic->variant;
> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +	struct regmap *regmap =3D pmic->regmap;
> +	bool irq_handled =3D false;
> +	int i, ret;
> +	u32 val;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	/* If irq_grp_reg is present there are multiple IRQ groups */
> +	if (variant->irq_grp_reg > 0) {
> +		ret =3D regmap_read(regmap, variant->irq_grp_reg, &val);
> +		if (ret)
> +			handle_bad_irq(desc);
> +
> +		/* This is very unlikely to happen */
> +		if (val =3D=3D 0) {
> +			chained_irq_exit(chip, desc);
> +			return;
> +		}
> +	} else {

If regmap_read() fails above, handle_bad_irq() is called, but it returns
void and does not abort the handler. Does this mean the code will proceed
to evaluate val =3D=3D 0 and val & group_bit using val as an uninitialized
stack variable?

> +		val =3D BIT(0);
> +	}
> +
> +	for (i =3D 0; i < variant->num_groups; i++) {
> +		const struct mtk_spmi_pmic_irq_grp *irq_grp =3D &variant->pmic_irq[i];
> +		u8 group_bit =3D BIT(irq_grp[i].group_num);

Are we double-indexing the irq_grp array here? Since irq_grp is already
defined as &variant->pmic_irq[i], accessing irq_grp[i] effectively evaluates
to variant->pmic_irq[i + i]. For MT6363 which has 6 groups, this will read
out of bounds when i >=3D 3.

[ ... ]

> +static int mtk_spmi_pmic_irq_init(struct device *dev, struct regmap *reg=
map,
> +				  const struct mtk_spmi_pmic_variant *variant)
> +{
> +	struct fwnode_handle *fwnode =3D of_fwnode_handle(dev->of_node);
> +	struct mtk_spmi_pmic *pmic;
> +	int ret;
> +
> +	pmic =3D devm_kzalloc(dev, sizeof(*pmic), GFP_KERNEL);
> +	if (!pmic)
> +		return -ENOMEM;
> +
> +	pmic->irq =3D of_irq_get(dev->of_node, 0);
> +	if (pmic->irq < 0)
> +		return dev_err_probe(dev, pmic->irq, "Cannot get IRQ\n");

Does this properly handle the NO_IRQ case? of_irq_get() returns 0 on mapping
failures. If it returns 0, the check passes and the driver may attempt to
configure hardware IRQ 0, which is typically reserved.

> +
> +	pmic->dev =3D dev;
> +	pmic->regmap =3D regmap;
> +	pmic->variant =3D variant;
> +
> +	pmic->dom =3D irq_domain_create_tree(fwnode, &mtk_spmi_pmic_irq_domain_=
ops, pmic);
> +	if (!pmic->dom)
> +		return dev_err_probe(dev, -ENOMEM, "Cannot create IRQ domain\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, mtk_spmi_pmic_irq_remove, pmic);
> +	if (ret) {
> +		irq_domain_remove(pmic->dom);
> +		return ret;
> +	}

Could this lead to a double-free of the IRQ domain?
devm_add_action_or_reset() automatically executes the cleanup action (which
calls irq_domain_remove) if it fails. Manually calling
irq_domain_remove(pmic->dom) again in the error path will free the domain a
second time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511101355.1224=
78-1-angelogioacchino.delregno@collabora.com?part=3D5
