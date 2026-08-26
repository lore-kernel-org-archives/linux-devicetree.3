Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADCC3D9547
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744165; cv=none; b=CRNej/9iT5FwEnfhM+4FoQVB0uCXT1xkpO58EbHYTMEhnK/ZPeHIalC6D9Jp4SQhX7zCYeD/m4FlE/GdlDRwFfHycf0R7RygIofPWKdja/C/+3wVotnSTUsC9IUAPB+ABz27/uluET6x+GD2Bk2PZpGTammwYHHRvHEfHxCuBmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744165; c=relaxed/simple;
	bh=6Ugk8Mngf5Dc03u6UaLr8GjpblBbn7SrwcChYLyz+ek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=to0tyOcJlmvEu9A47EW2xwhH9fLjA2ecgGhuiUqs2OQfJwRvigkYwbYyXzIjmo+hYvnT1eIEf0+jI9NVqsXgt0YylcAzjdrcUWJBJasWSv+qpJUclYSrfB78shJO75dzp7YKzlZkTh6vdAkHCGAxonsWWTT1/qmEnUxbWBL3zHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrHAifol; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrHAifol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010C01F000E9;
	Wed, 26 Aug 2026 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787744164;
	bh=a60xpuJ3U3PQOvyqmUNzFKTf/u4xyp6rZ8M+0cQkjbk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UrHAifolgZ/FEVGQrnlUX9j6rqlXy6s2Xu7+TaYqgTEB1tcvlRw0h6VnVvyOl/JDa
	 RKX5lvIFwsSytpCnps9uDdcofrh6yHlQoUz7+hATbRV27rOUvfsqVJMuNEcoxhE26M
	 TUxAp1+rL2RgCxA2Mgv8k11CYZ24z59OB0HYJBhGT8jB//zr0RZWDGQ+iwEn/S+521
	 2eaNFEEWXQKwAsO8lhdWCRMsw6bIwnMlIPuGrtOZaic9pb8LKQ5fxnDGDEbbu0BEeo
	 KXsRqdP3TtlUyBA/hSttu0dMXNfD4yqSCEuT9lBC1ar7s8LawnzyoNHKs1tSS8LP4I
	 dKhiGDpaJkdPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of/irq: Fix device node refcount leak in
 of_irq_get_affinity()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fuad Tabba" <fuad.tabba@linux.dev>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260826112234.1033974-1-fuad.tabba@linux.dev>
References: <20260826112234.1033974-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 11:36:03 +0000
Message-Id: <20260826113604.010C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Device node reference count leak when resolving MSI domain RID via=
 'msi-parent' fallback.
- [High] Pre-existing memory leak of device node reference in `gic_irq_get_=
fwspec_info`.
--

commit 105954fbf27e6537ca0c4da266eb89a3c31643fd
Author: Fuad Tabba <fuad.tabba@linux.dev>

of/irq: Fix device node refcount leak in of_irq_get_affinity()

This commit fixes a device node reference count leak in of_irq_get_affinity=
().
The of_irq_parse_one() call raises the refcount of the interrupt controller
node on success, and of_irq_get_affinity() returns without putting it. The
fix drops the reference once irq_populate_fwspec_info() has run.

> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 967c191008797..ec035367c9500 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -563,7 +563,9 @@ const struct cpumask *of_irq_get_affinity(struct devi=
ce_node *dev, int index)
>  	of_phandle_args_to_fwspec(oirq.np, oirq.args, oirq.args_count,
>  				  &fwspec);
> =20
> -	if (irq_populate_fwspec_info(&fwspec, &info))
> +	rc =3D irq_populate_fwspec_info(&fwspec, &info);
> +	of_node_put(oirq.np);
> +	if (rc)
>  		return NULL;
> =20
>  	return info.affinity;

[Severity: High]
This isn't a bug introduced by this patch, but there appears to be a
device node reference count leak when resolving MSI domain RID via
msi-parent fallback.

drivers/pci/msi/irqdomain.c:pci_msi_domain_get_msi_rid()
> 	of_node =3D irq_domain_get_of_node(domain);
> 	rid =3D of_node ? of_msi_xlate(&pdev->dev, &of_node, rid) :
> 			iort_msi_map_id(&pdev->dev, rid);
>=20
> 	return rid;

If the mapping falls back to msi-parent in of_msi_xlate(), the
un-refcounted of_node pointer is overwritten with a newly refcounted
pointer in of_check_msi_parent():

drivers/of/irq.c:of_check_msi_parent()
> 	if (!ret) {
> 		/* Return with a node reference held */
> 		*msi_node =3D msi_spec.np;
> 		return 0;
> 	}

Since pci_msi_domain_get_msi_rid() returns the mapped RID without calling
of_node_put() on the updated of_node, does this leak the MSI controller
device node on every invocation?

[Severity: High]
This is a pre-existing issue, but is there also a memory leak of the
device node reference in gic_irq_get_fwspec_info()?

drivers/irqchip/irq-gic-v3.c:gic_irq_get_fwspec_info()
> 		fw =3D of_fwnode_handle(of_find_node_by_phandle(fwspec->param[3]));
> 		if (!fw)
> 			return -ENOENT;
>=20
> 		for (int i =3D 0; i < gic_data.nr_parts; i++) {
> 			if (gic_data.parts[i].partition_id =3D=3D fw) {
> 				mask =3D &gic_data.parts[i].mask;
> 				break;
> 			}
> 		}
>=20
> 		if (!mask)
> 			return -ENOENT;
> 	} else {
> 		mask =3D cpu_possible_mask;
> 	}
>=20
> 	info->affinity =3D mask;
> 	info->flags =3D IRQ_FWSPEC_INFO_AFFINITY_VALID;
>=20
> 	return 0;

The call to of_find_node_by_phandle() acquires a new reference on the
device node, but the function returns on various error and success paths
without calling of_node_put() to drop it. Does this leak the GIC PPI
partition device nodes during IRQ affinity retrieval?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826112234.1033=
974-1-fuad.tabba@linux.dev?part=3D1
