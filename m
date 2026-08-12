Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5002B2045AD
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550210; cv=none; b=d/uAO9wrcPFwrwRZvcud4l+aHaB/AWauAf1jO20Uqk3GlUbFPy5erXh3F+xtSGXZ0qtlqUPygR2JlEiaD5KQmS8ZJ9QtpvivbwbXirRdFgJPISDG4UdTSQT/KIuK2yD6spNfbUeKu/SF88J+h9LK1b7WYlGfVl+QLZdTfXdKWGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550210; c=relaxed/simple;
	bh=1DxZ2IMafjzmXIo2QQKG+j+MOL3GkJrdG1S62KV7IR4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nbL1nV1OxxEWiQpgbgyQCCe03FFyrhwYaQ/vWUMfgXNs+4lOm9S3RFYPN/YjNzxa08JOWB17UUk+JbURQrF/jKFMMzg9pxDqcoyZOCpe8OdwEM6aDnsaP4CuhWd2E2o341TXwhNeAT2ipQ3n4McssFBrfVw0dFZjcR0xG++8p6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqOsGk9w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqOsGk9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A531F000E9;
	Wed, 12 Aug 2026 15:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550209;
	bh=BARCKBj+TJvtnb5dbVICrpXKEn4GuTXuaacq6YavPuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kqOsGk9wC8GRagBhR7iSlwRXiYv7OkssQtAmEN9IFmjiYMAoBtANgIMI7JaPwVrk9
	 DscgPTbLSGe3WfVJVQ0tYQt4PganUrIrhXzJQ8h0dUUkbTOYCfBDNOjnk/SFMn76xJ
	 lGWRo/vPNYBt0CXigb30VIR56ViNCrM7DX4QhPNYxta+ojjxTttNDY61vNwj+rLd4t
	 Z4Mouq/OhFHEhcpnYL0vdzrRrDBVOj2FdDxbKwlc8G4Pzp8uLMg2BtCEhbltGQlivj
	 azio4VmagCFgdLpVeSjls4hZhM1zzyqIKKLEhjxZxqONhUIpF0brp+lfrYXsAvF68T
	 DLkA2bHd52LSA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/3] nvmem: uniphier-efuse: Add ti,am62p-efuse
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812154442.3379851-4-jm@ti.com>
References: <20260812154442.3379851-1-jm@ti.com>
 <20260812154442.3379851-4-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:56:48 +0000
Message-Id: <20260812155648.C4A531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Using byte-wise register reads (`readb()`) on TI K3 AM62p efuse re=
gisters will cause a synchronous external abort (bus fault).
- [Medium] Reusing a vendor-specific driver (Socionext Uniphier) for an unr=
elated vendor's SoC (Texas Instruments AM62p) purely for simple MMIO reads =
is a design anti-pattern.
- [Medium] The new `ti,am62p-efuse` compatible incorrectly inherits legacy =
NVMEM device tree binding behavior.
- [Medium] The driver does not ensure that clocks and power domains are ena=
bled before accessing hardware registers.
--

--- Patch [3]: [RFC PATCH 3/3] nvmem: uniphier-efuse: Add ti,am62p-efuse co=
mpatible ---
commit 364e40673a46df742ec59f8dd05432dba10e9a3a
Author: Judith Mendez <jm@ti.com>

nvmem: uniphier-efuse: Add ti,am62p-efuse compatible

Add ti,am62p-efuse compatible to uniphier-efuse. Leverage the
nvmem provider to supply silicon revision information from GP_SW
efuse registers on AM62p device.

> diff --git a/drivers/nvmem/uniphier-efuse.c b/drivers/nvmem/uniphier-efus=
e.c
> index 6ad3295d31951..35977e1864135 100644
> --- a/drivers/nvmem/uniphier-efuse.c
> +++ b/drivers/nvmem/uniphier-efuse.c
> @@ -60,6 +60,7 @@ static int uniphier_efuse_probe(struct platform_device =
*pdev)
> =20
>  static const struct of_device_id uniphier_efuse_of_match[] =3D {
>  	{ .compatible =3D "socionext,uniphier-efuse",},
> +	{ .compatible =3D "ti,am62p-efuse",},

[Severity: Medium]
Is it appropriate to reuse a vendor-specific driver (Socionext Uniphier) for
an unrelated vendor's SoC (Texas Instruments AM62p) purely for simple MMIO
reads?

If a simple generic MMIO-based NVMEM provider is needed, would it be better=
 to
use a generic nvmem-mmio driver or syscon-based nvmem rather than piggyback=
ing
onto another vendor's specific driver?

[Severity: High]
Will the byte-wise register reads in this driver cause a synchronous extern=
al
abort (bus fault) on TI K3 AM62p hardware?

The uniphier-efuse driver hardcodes a 1-byte word size and stride, and uses
readb() to read data:

drivers/nvmem/uniphier-efuse.c:uniphier_reg_read() {
    ...
    *val++ =3D readb(priv->base + reg + offs);
    ...
}

Since TI K3 SoC peripherals strictly require 32-bit aligned reads (readl()),
could performing 8-bit reads on these hardware registers result in an
external bus exception and crash the system?

[Severity: Medium]
By binding the new TI compatible to this driver, does the AM62p incorrectly
inherit legacy NVMEM device tree binding behavior?

The driver unconditionally enables legacy parsing:

drivers/nvmem/uniphier-efuse.c:uniphier_efuse_probe() {
    ...
    econfig.add_legacy_fixed_of_cells =3D true;
    ...
}

This tells the NVMEM core to fall back to the deprecated #address-cells and
#size-cells parsing. Shouldn't new NVMEM providers use the standard
nvmem-layout binding?

[Severity: Medium]
How does this driver ensure that clocks and power domains are enabled before
accessing hardware registers on the AM62p?

The uniphier-efuse probe function performs raw memory-mapped reads without =
any
prior runtime power management, such as pm_runtime_enable() or
pm_runtime_get_sync().

On TI K3 platforms, accessing peripheral registers when the corresponding
TI SCI power domain is disabled typically leads to a system hang or bus fau=
lt.

Are there protections in place to prevent this if the domain is ever
power-gated?

>  	{/* sentinel */},
>  };
>  MODULE_DEVICE_TABLE(of, uniphier_efuse_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812154442.3379=
851-1-jm@ti.com?part=3D3
