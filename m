Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849CB374E73
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278621; cv=none; b=Eb5I3Ac/L1uwuKCdj3ePFP3U6qkGegInwFqGuB44RwJvbp1L+8KWfCcGuaJ8MutSycRNwKvWyQ0MxbqvPM8Dp2LK0C/8hcE8KrEmzqbxSZ+kmVWDJ59+56LY29C1eyQsqbPgiOa7lLaN/VQ3lu3UQO427CNDjj2K4exuM+H/Y6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278621; c=relaxed/simple;
	bh=CWbC2IOtY9vPGALQT02iij4k2rt8iPCwIGlsHXsmBqo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NeFDIN8gEspiuAjnKW5sFFWFGuHIQnXzdRrsIIyFw0rUx7qHrTXMehWQ/5vycaTlfLHJUn74SaQk6LhUmUydi7X9LMVV65w65u6DQvcXLEgjX+B6KdZmJvLmGSTvNFV9s9nmgTgx1VLeibiAukTzrrxxcqhJNwkEJn1P9zqpyC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxYhOKpq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxYhOKpq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57051F000E9;
	Tue,  1 Sep 2026 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788278620;
	bh=ygWHU6sDsHctj27NBca6SGN9ukb21zpCddkg56vRfs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AxYhOKpqYUw2i8LAZQdr5ZsQeHmbqUVXKF55LDcuGCZeciUs6ps22c+FUTTMi8JdH
	 lRMLlXbQu5BrNKvnPu20y7IZSqwN85/0ymtg6MZPfKZS9LwTM1qYUNa62+KGnYQWDd
	 NS1vMWsXlJ7roKQWKDoDKdftN9KRCGXxa9T+0ycp8W90JS2htQkM32A003fX4B/DZT
	 QM1VORdK9vhfNBiEESBPpWfefy1KSCwD+WiBgLQaOjyU/5O4mQTuI0Ds//W7k+C77q
	 LYTYG60iMBWxVef/ImUNFY6mE/8rtkGLtNt+LcVrjkxq5Dx0dl74Tmv934I5RQpLV+
	 O3IcqfXrInUDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] nvmem: layouts: Add Rockchip OTP CPUID layout
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901-rk3576-otp-cpuid-mac-v1-3-ea9135270fc2@flipper.net>
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
 <20260901-rk3576-otp-cpuid-mac-v1-3-ea9135270fc2@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 16:03:39 +0000
Message-Id: <20260901160339.C57051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but module unload le=
aves a dangling function pointer in the nvmem core, leading to execution of=
 unmapped memory when the cell is read.
--

commit eb43a3b0551c59093ae8bd5ad7028542c1ba58bd
Author: Alexey Charkov <alchark@flipper.net>

    nvmem: layouts: Add Rockchip OTP CPUID layout driver
   =20
    Rockchip SoCs customarily use the CPU ID programmed into their on-chip =
OTP
    memory to derive stable Ethernet MAC addresses even when a board doesn't
    otherwise have dedicated storage for those.
   =20
    Reproduce the same derivation in the kernel and expose the result as an
    nvmem cell named "mac-address", so that of_get_mac_address() picks it up
    through its standard nvmem fallback.

> diff --git a/drivers/nvmem/layouts/rockchip-otp-cpuid.c b/drivers/nvmem/l=
ayouts/rockchip-otp-cpuid.c
> new file mode 100644
> index 0000000000000..61f509c4a8cf2
> --- /dev/null
> +++ b/drivers/nvmem/layouts/rockchip-otp-cpuid.c

[ ... ]

> @@ -62,15 +62,15 @@ static int rockchip_cpuid_add_cells(struct nvmem_layo=
ut *layout)
> =20
>  	info.name =3D "mac-address";
>  	info.offset =3D data->offset;
>  	info.raw_len =3D ROCKCHIP_CPUID_LEN;
>  	info.bytes =3D ETH_ALEN;
>  	info.read_post_process =3D rockchip_cpuid_mac_pp;
>  	info.np =3D of_get_child_by_name(layout_np, info.name);
> =20
>  	of_node_put(layout_np);
> =20
>  	ret =3D nvmem_add_one_cell(layout->nvmem, &info);
>  	if (ret)
>  		of_node_put(info.np);
> =20
>  	return ret;
>  }

[ ... ]

>  static void rockchip_cpuid_remove(struct nvmem_layout *layout)
>  {
>  	nvmem_layout_unregister(layout);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does unloading this module l=
eave
a dangling function pointer in the nvmem core?

In rockchip_cpuid_add_cells() in drivers/nvmem/layouts/rockchip-otp-cpuid.c,
the module's function pointer is handed over to the core cell structure:

	info.read_post_process =3D rockchip_cpuid_mac_pp;
	ret =3D nvmem_add_one_cell(layout->nvmem, &info);

When the module is unloaded, rockchip_cpuid_remove() calls
nvmem_layout_unregister(), but that function is an empty stub in the nvmem
framework. As a result, it silently fails to remove the dynamically allocat=
ed
cells.

Because the cell outlives the module without a module reference protecting
the layout driver, a subsequent read of the cell (e.g., via sysfs) will
invoke the freed rockchip_cpuid_mac_pp() callback.

Could this lead to execution of unmapped memory and a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-rk3576-otp=
-cpuid-mac-v1-0-ea9135270fc2@flipper.net?part=3D3
