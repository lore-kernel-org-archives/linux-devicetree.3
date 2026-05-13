Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88532A3DA
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 19:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700248; cv=none; b=nJiIB5sgMd7qTFj8MHyzEAJ8bFD0OQD99UKQYRJNSJyPglnUyfzqDura/Qe4L1cfJVbsc35kZm3xvNlkJ2AA/ED3r+hewNQgBKoi1Uyk+ibFcC8JuBGSa/Zb+MC3iEMVj1DpAcbFd24090/oJ02S2vj5ba7l/4FHFpFs9E5YlbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700248; c=relaxed/simple;
	bh=2O/qVUYXOjZKDX/NKEEZFisr/xAFwHtQLYuiHnAWdIM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g0Tg4Fs9oxN1EI9vdSPltkfTm087fZ1aeECYqKVpD8msllurHoW019oYmv3eI0a0RHIHCBN2jxfYA9ER18s5okGAooXMOH9b6zErPVo7Kaz1CiWt/UINrOP3k3T+1nyh2uy3xVm7rYWTvLIAvq6IRbVfoBnhI3HlKMSl1vCIpL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgpSkK/h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgpSkK/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E350C19425;
	Wed, 13 May 2026 19:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778700248;
	bh=2O/qVUYXOjZKDX/NKEEZFisr/xAFwHtQLYuiHnAWdIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pgpSkK/hMNoXg3ULDXWmZ2W8Nx9J3Mwr8FC+CBK8jbFLCWoihuT7e2GhOTPt+8/Kp
	 So8b//xl0aiBPaSD6MHEoJN8ykfZ57wTEha8CFk6m/NVuFc+GN+C89A5pYxBQ2vxK2
	 wkjR7998fl4i8RMZepn7kkRXLy/19SIGQdw7KbM1smRm1f/4xgJbw2OKybeYsaqBw1
	 qTHXCN9f6CN4nrThvYdIBAZC9ggf4vwnA46tPRTOdYne9nbsELiXKz0LVgdD1JxJVm
	 1A2FAfeX0IKSjiVxLjUh8i/Q8pVa8ndWIQIy02W4HnYfPEV3OUER3b0mUR0WEqnWv+
	 rMylQA3qb8SXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/16] nvmem: add mt6323 PMIC EFUSE driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512-mt6323-v2-6-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-6-3efcba579e88@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 19:24:07 +0000
Message-Id: <20260513192408.5E350C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unsafe device topology assumption leads to a NULL pointer derefere=
nce and kernel panic.
- [Medium] Direct 16-bit assignments to the output buffer cause endianness =
corruption and potential unaligned memory access.
- [Low] Kconfig help text documents an incorrect module name.
--

commit 4bbd96ffdcf57f8479b893cecdcd10f45fef30fa
Author: Roman Vivchar <rva333@protonmail.com>

nvmem: add mt6323 PMIC EFUSE driver

This commit adds support for the EFUSE controller found in the Mediatek
MT6323 PMIC. It registers an nvmem device to provide access to 24 bytes
of hardware-related data, such as thermal sensor calibration values.

> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 74ddbd0f79b0e..db248a3c4e879 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
[ ... ]
> @@ -227,6 +227,17 @@ config NVMEM_MTK_EFUSE
>  	  This driver can also be built as a module. If so, the module
>  	  will be called efuse-mtk.
> =20
> +config NVMEM_MT6323_EFUSE
> +	tristate "Mediatek MT6323 PMIC EFUSE support"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on MFD_MT6397
> +	help
> +	  This is a driver to access hardware related data like sensor
> +	  calibration, etc.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called efuse-mt6323.

This isn't a bug, but the help text says the module will be called
efuse-mt6323, while the Makefile specifies the build target as
nvmem_mt6323-efuse.o.

[ ... ]
> diff --git a/drivers/nvmem/mt6323-efuse.c b/drivers/nvmem/mt6323-efuse.c
> new file mode 100644
> index 0000000000000..52db62784adda
> --- /dev/null
> +++ b/drivers/nvmem/mt6323-efuse.c
> @@ -0,0 +1,86 @@
[ ... ]
> +static int mt6323_efuse_read(void *context, unsigned int offset, void *v=
al,
> +			     size_t bytes)
> +{
> +	struct regmap *map =3D context;
> +	u32 tmp;
> +	u16 *buf =3D val;
> +	int ret;
> +
> +	/*
> +	 * Manual regmap_read with loop is needed, because PWRAP is not
> +	 * a continuous MMIO space, but rather FSM which doesn't implement
> +	 * necessary read callback for the regmap_read_raw and regmap_read_bulk
> +	 * functions.
> +	 */
> +	for (size_t i =3D 0; i < bytes; i +=3D sizeof(*buf)) {
> +		ret =3D regmap_read(map, MT6323_EFUSE_DOUT_BASE + offset + i, &tmp);
> +		if (ret)
> +			return ret;
> +
> +		*buf++ =3D (u16)tmp;

Does this assignment cause alignment faults or endianness corruption?

The val pointer passed by the NVMEM API is a generic void pointer. Casting =
it
to a u16 pointer and dereferencing it directly can trigger alignment faults=
 on
architectures that do not support unaligned memory access.

Additionally, this writes the data in the CPU's native byte order, which
results in swapped bytes on big-endian architectures compared to little-end=
ian
architectures. Downstream consumers might expect a consistent data layout.

Could this use put_unaligned_le16() instead to ensure safe memory access and
consistent byte ordering?

> +	}
> +
> +	return 0;
> +}
> +
> +static int mt6323_efuse_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct nvmem_config config =3D {
> +		.name =3D "mt6323-efuse",
> +		.stride =3D 2,
> +		.word_size =3D 2,
> +		.size =3D MT6323_EFUSE_SIZE,
> +		.reg_read =3D mt6323_efuse_read,
> +	};
> +	struct nvmem_device *nvmem;
> +	struct regmap *regmap;
> +
> +	/* efuse -> mfd -> pwrap */
> +	regmap =3D dev_get_regmap(dev->parent->parent, NULL);

Can dev->parent->parent evaluate to NULL and cause a NULL pointer dereferen=
ce
here?

The driver registers an of_match_table, meaning it can be instantiated
directly from a Device Tree node. If a malformed or overlay Device Tree pla=
ces
the node at the root level instead of within the expected PMIC/MFD hierarch=
y,
the device is instantiated by the top-level platform bus.

In that case, dev->parent is the platform bus, which has no parent, so
dev->parent->parent would be NULL. Passing a NULL device pointer to
dev_get_regmap() will cause an immediate NULL pointer dereference when
devres_find() attempts to acquire the lock.

Would it be safer to verify the existence of the expected parent hierarchy
before dereferencing it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-mt6323-v2-=
0-3efcba579e88@protonmail.com?part=3D6
