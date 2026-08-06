Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9024229D0
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007303; cv=none; b=Sr0030x4fu6VacsQBR6VL8RJIeWPddmffhEj9vQpqJQvF83sg+i8xse0uhrGU4Kg1e90Jb4pylm+3bSaCZpO9610bUx+hLTH//SXF+aCifXz9vetk1YJV6Z4DhoKDhNEYiQxlQz3tfU0QkKnulTipc78figdEfE2ih89u4iHYjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007303; c=relaxed/simple;
	bh=xjnTSkBRuRP4rwIGR9SoA8xewDE44n3DJMlNm5R6Umc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UoF+gv4/ZgDAlm6LYwoz6jGGhetzozq/+ybAgfSz4z58Hq6Ydmm3UeB6W1hrHSn/Wt4V3/5tBqZyIDSu3BD2iHJ+o+X8MAUGE2dn3BVwzwL2uw1E3ZR4SuFBpfSSbkcUsuHL6uh5j0qZAVlziJLP4415Yyo2TvCuR4kCj72brio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRg9vDVM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRg9vDVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FE91F000E9;
	Thu,  6 Aug 2026 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786007301;
	bh=kCoEmNQL87rXTnbViOXJ4RK1MwpASGh5UIPumexkuA8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nRg9vDVMlpv9rY5qet+tNHQixVErq57C4EQPpg9LaSseP0TZuSm8+i6Ns8f+Lf5k/
	 4LGZJ7AkeJBBgMrT3euckE7pWFB2XZ4wHv1fOV5ncPW/al4bwJLRc1+Z4uNCC13Zfg
	 hS5/nE5pyStDWL9k06KeBdMoZaeJoUtFq0kvVngF3IwGu7g0+61Qx+D2aCFZj45SM/
	 eOnYlpxRgrgJQ6b7vndr8sHCWxyMTXQnppmWlgEEgduSlzinIfjFNnuJ8JIpm3y2Rl
	 tvdw1iQ/OBKX5fniJ4CNPn43BhtGmU1+c7584lg8ZIiuV13jujGIT6KyHgYeYEzJ8M
	 CKWoCyFSHHXww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/17] nvmem: microchip-otpc: nvmem: add emulation
 mode and OTP access validation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806074024.531259-11-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-11-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:08:20 +0000
Message-Id: <20260806090821.44FE91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Modifying a global static `nvmem_config` structure in the `probe()=
` function causes a data race if multiple device instances are bound concur=
rently.
--

--- Patch [10]: [PATCH v6 10/17] nvmem: microchip-otpc: nvmem: add emulatio=
n mode and OTP access validation ---
commit 055a4dec457440d76a4443758162d8aa873a40cc
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

nvmem: microchip-otpc: nvmem: add emulation mode and OTP access validation

This commit adds validation for OTP memory accessibility and emulation mode
status during probe. It logs informational messages to help with debugging
when the boot packet is not configured or emulation mode is disabled.

> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otp=
c.c
> index a17f82afdc37d..6b0184423463e 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
[ ... ]
> @@ -343,7 +344,8 @@ static int mchp_otpc_probe(struct platform_device *pd=
ev)
>  {
>  	struct nvmem_device *nvmem;
>  	struct mchp_otpc *otpc;
[ ... ]
>  	ret =3D mchp_otpc_init_packets_list(otpc, &size);
>  	if (ret)
>  		return ret;
> =20
> +	if (!size) {
> +		dev_warn(otpc->dev, "Cannot access OTP memory\n");
> +		if (!emul_enable)
> +			dev_info(otpc->dev, "Boot packet not programmed and emulation mode di=
sabled\n");
> +	}
> +
>  	mchp_nvmem_config.dev =3D otpc->dev;
>  	mchp_nvmem_config.add_legacy_fixed_of_cells =3D true;
>  	mchp_nvmem_config.size =3D size;
>  	mchp_nvmem_config.priv =3D otpc;
>  	nvmem =3D devm_nvmem_register(&pdev->dev, &mchp_nvmem_config);

[Severity: High]
This is a pre-existing issue, but does modifying the global static
mchp_nvmem_config structure here cause a data race?

If multiple instances of this driver probe concurrently, such as through
sysfs bind or multiple device tree nodes, one instance could overwrite the =
dev,
size, and priv fields of the global configuration structure before the other
instance completes devm_nvmem_register().

This could lead to the core nvmem subsystem storing the wrong priv pointer
for the device, which might result in incorrect register accesses or a
use-after-free during operations.

Should this configuration structure be copied to a local variable within
mchp_otpc_probe() to ensure the probe function is reentrant?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806074024.5312=
59-1-varshini.rajendran@microchip.com?part=3D10
