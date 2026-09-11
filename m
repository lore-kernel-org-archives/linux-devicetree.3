Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F6D3254B0
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 20:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789159795; cv=none; b=GWVogedNT4/KTtlaWUv8tFBjycvpTT/84jiLo1kAtWWFfYjsGBtgn2R3TGwYwn60BoLZpqwMWwjwflqW0l7nN9HvHtDRg2yAVVx4i4gDsdjHWqCjiNAa4xr05iHGqMy9R0cNZRj/zATECixNvcfm5+3Q8BfX3dgOHyt4rPaE6RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789159795; c=relaxed/simple;
	bh=9Y5uNL2Se8nA2isLEu5sQLLsEFM3vde3sg1N50yYJis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JndqM5vB5cbGvoUo+zMe22yx00bnnjoMBo1LlPMkSnSPhfW++14mD6dXMb4ZHPkepS9EhxIsuid0jsRyoEQSP8b+BSk0EoNCcuyO3SscqeM9v97ivfOWfTeS8z3h1ng51yzNH7R79p+f0g1XMcafFsEz8uTQo0/dOJjwAFf83Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfbWYLUk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfbWYLUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703B61F000FF;
	Fri, 11 Sep 2026 20:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789159793;
	bh=O8HgjgUtWJjgaVQ1iMOqjaRZwbUBiGOQZAGfaNWlq6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KfbWYLUkQo0EEBPk75ebg6ancWkIA5RGyp9WFFjXtPtrrmo69NWyoNdUBhjiZVEcP
	 oOfhxjbHijkCtJA64fSjrLtmeoV0pgjZRwNX/EdC2CkBEgYNib34LRsAfsikRR2PpG
	 +JD0JSLlYdJ0rKTxtZ9Kw0bEFgxpui+QgZB052shD6OGowkGcIaByblNYBbPndDeHW
	 Erej5SmI1MSePcGuuj0FVAXT9CmpAe6ciFYW9W2VzZCe6L1DUmKL+ukEpm/0/4lrgs
	 0Avechg+jlMvySzbr3sgRGDWzvl1kWWXjZIgxtAW1+b/DVf46BINOqc0XfYHahssns
	 1XWyZ5poBmJFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: R7000: add nvram node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911203522.105474-1-rosenp@gmail.com>
References: <20260911203522.105474-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 20:49:52 +0000
Message-Id: <20260911204953.703B61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but a malformed NVRA=
M variable causes the entire brcm_nvram driver to fail probe.
--

commit 1557e665e36010df6961b214ff9a34a470e52acd
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: BCM5301X: R7000: add nvram node

This commit adds the nvram node and sets the MAC address for gmac2=20
to avoid userspace handling.

> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/=
arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
> index 24ba8f8f9bf36..6ea845f3ac1d3 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
> @@ -25,6 +25,15 @@ memory@0 {
>  		      <0x88000000 0x08000000>;
>  	};
> =20
> +	nvram@1c080000 {
> +		compatible =3D "brcm,nvram";
> +		reg =3D <0x1c080000 0x180000>;
> +
> +		et0macaddr: et0macaddr {
> +			#nvmem-cell-cells =3D <1>;
> +		};
> +	};
> +

[Severity: High]
This isn't a bug introduced by this patch, but enabling this driver on
more devices exposes a pre-existing issue in the brcm_nvram driver if
the NVRAM contents are malformed.

Could a malformed NVRAM variable cause the entire brcm_nvram driver to=20
fail probe?

Looking at brcm_nvram_add_cells() in drivers/nvmem/brcm_nvram.c:

drivers/nvmem/brcm_nvram.c:brcm_nvram_add_cells() {
    ...
    for (var =3D data; var < data + len && *var; var +=3D strlen(var) + 1) {
        eq =3D strchr(var, '=3D');
        if (!eq)
            break;
    ...
}

If a string lacks an '=3D' character, the loop breaks early, but does not
update priv->ncells to the actual number of successfully processed cells.

This leaves the trailing cell structures zero-initialized (name =3D=3D NULL=
).

When passed to devm_nvmem_register(), nvmem_add_cells() calls
kstrdup_const(NULL) for these uninitialized cells, which returns -ENOMEM
and causes the entire driver probe to fail.

Since this breaks dependent devices like Ethernet controllers needing MAC
addresses, should the driver be updated to handle malformed strings more
gracefully?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911203522.1054=
74-1-rosenp@gmail.com?part=3D1
