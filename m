Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2666B474246
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355247; cv=none; b=DTpWenm9qBFEqQgG94F7042AaaBP2rvJINy4dApy2YpmkcwlYhwIbvmF5SthA4mCkij1+SCaAT/yiKSEKo1Cu0y7dYxYXI2BWuJPT8xKk4qyhKrVNhU+MnUVlwkLaIb9tPofwqnQTELrTytD1R6zUytUvUTIPY8+xPLqRuRrEZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355247; c=relaxed/simple;
	bh=DHFGOfX1mcAexnQm5OFvWjPD/bn0qiWn8VdnuCWkFXo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sqRdFFmhyirxi2vRUngT1IwokqsFnGOfZqNuc3rZd1N5JBfMgrZekRF3ZM4Ek/bh45OMwR0135Z5YE5UOocXUaPJSE5dY29s8pNVum4q/BzPnUNm7r90dCzODj62UL9tuDBMZzEOh+6sDvcLIBFTUw9zcgBfTCAmqE0bDBMvQto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egbKetE4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egbKetE4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697601F000E9;
	Wed,  2 Sep 2026 13:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788355245;
	bh=tbxUnPUqM53Z+fE7AfzwUUUMltCb3jZovyQxTpy27Mg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=egbKetE4cqXqIoO3UVv51mVHovfc7ZhmE1Ao70nvpmdHMrBr3iKwhYmCg0Du0RHu1
	 XiPU3QzGSnU1to8UOMW2uXU2gZJc928BOp5aWkg72NA6oGPdNhEjS9M8u0rGdrJsND
	 AuFttIZFp4SlVDWYeY2sUFv84dX35yyyDCu1Z8BYVE1UOkcYcwTUX+kdG4q+G+lw0f
	 534WCkzVsmycv+SXvC/b6ngBjTyVEHrvGcbv0n/5O8MuDZDxURiLOKNuhNtHuu9Dfy
	 S/Kukw5a1SJe9vX01id6KNGdLKLrINVCtxt6iHp8bznR4dtv4eOCw6e3LAj0EogJcU
	 aG/wrDs83FD2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] nvmem: layouts: Add Rockchip OTP CPUID layout
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-3-e4b7fe2ab13f@flipper.net>
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
 <20260902-rk3576-otp-cpuid-mac-v2-3-e4b7fe2ab13f@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 13:20:44 +0000
Message-Id: <20260902132045.697601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Module unload leaves dangling function pointer in nvmem core, lead=
ing to UAF.
--

commit 98e250115f0c3368e5e5888d572a646b22e0ad3d
Author: Alexey Charkov <alchark@flipper.net>

nvmem: layouts: Add Rockchip OTP CPUID layout driver

This patch adds an nvmem layout driver for the CPU ID in Rockchip OTP
memory. It exposes the CPU ID as an nvmem cell named "mac-address" to
reproduce the derivation done by bootloaders.

> diff --git a/drivers/nvmem/layouts/rockchip-otp-cpuid.c b/drivers/nvmem/l=
ayouts/rockchip-otp-cpuid.c
> new file mode 100644
> index 0000000000000..61f509c4a8cf2
> --- /dev/null
> +++ b/drivers/nvmem/layouts/rockchip-otp-cpuid.c
> @@ -0,0 +1,119 @@

[ ... ]

> +static int rockchip_cpuid_add_cells(struct nvmem_layout *layout)
> +{

[ ... ]

> +	info.name =3D "mac-address";
> +	info.offset =3D data->offset;
> +	info.raw_len =3D ROCKCHIP_CPUID_LEN;
> +	info.bytes =3D ETH_ALEN;
> +	info.read_post_process =3D rockchip_cpuid_mac_pp;
> +	info.np =3D of_get_child_by_name(layout_np, info.name);
> +
> +	of_node_put(layout_np);
> +
> +	ret =3D nvmem_add_one_cell(layout->nvmem, &info);
> +	if (ret)
> +		of_node_put(info.np);
> +
> +	return ret;
> +}

[ ... ]

> +static void rockchip_cpuid_remove(struct nvmem_layout *layout)
> +{
> +	nvmem_layout_unregister(layout);
> +}

[Severity: High]
This isn't a bug introduced by this patch, but is a pre-existing design flaw
in the nvmem core that this new layout driver inherits.

When this layout driver is unloaded, does it leave a dangling function
pointer behind?

The remove function calls nvmem_layout_unregister(), but since that is an
empty stub in the nvmem core, the registered nvmem cell and its sysfs
attributes remain intact.

If the cell is later read via sysfs (e.g., through
/sys/bus/nvmem/devices/.../cells/mac-address) after the module is unloaded,
will it invoke the dangling read_post_process function pointer
(rockchip_cpuid_mac_pp) without taking a module reference, leading to a
use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-rk3576-otp=
-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net?part=3D3
