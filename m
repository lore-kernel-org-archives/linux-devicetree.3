Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2381A1F936
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786889583; cv=none; b=C+ydx5fSx9y2w53E82YLZO9q0nfSvZ/tH2HP9lKSea+BNYU5qLZP3cdQWg+YTUk1xMDCGm0+9xF6dN3qmCR3/vVYWjEIDOURd2t5JBMaePO0xSlDMWR9l4AwGNgqUBw1Juz5AQtg68Y/slcRR1ZEybrXCANerOApoDRwOiqRa1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786889583; c=relaxed/simple;
	bh=uAcb7LWTU3iWOZpNG7gk7cDNmICk8F1tdaA4dSM9CP8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XoWz+UCMLJhk0kb3KKYY40XfTQiP/Ih9vA03oY4dxPUZZXHBnZWnkH5glz2YoIzFL5J++0Yk/DN17Pp0aphyPUP6zM7Grw7ZYvO6IeUmJtEzYNhm7kiwkl5GBASuoY4jN+7YrloPKmzIIs3DBupinoPvE0XZlxJt8iX5WhUx56E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UE345Vg7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UE345Vg7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599D71F000E9;
	Sun, 16 Aug 2026 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786889581;
	bh=l1QZPl/tceDt7rjvwQgpO08fJ1JcCsaQkuLZ65wWNZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UE345Vg7pe7eMGO66riEFuXjYc8Ed779pF4QeydSiCQoirS6kh3tXQ0Xd7fXqim18
	 cgSSxuhGd1IAUrQyeiHUx890R7Gl+zTYyE2+WWxkZG4niBaUBSj/GS60V2GFVmZeed
	 MMdA6IopsDRoSc+tNqAPAnAFr74Sy56lsM9J360gFNPNZMhUp7Wsdy3kNRggM9dX/Z
	 QxdFUFPn8oPNVL1glTcZ8nbpO2LMBHwV6XRXC9CSVexvI0FXKcla2wqw69pdDrtd+z
	 kiPhh/gsr5MyOi2lYPVNn9abJdAn8AaLJD9/omtOIcNvQCofsIJMcCUWgVxUpLUa+x
	 rmY+ezMfcx+Mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] drm/vc4: Drop the undocumented brcm,vc4-v3d
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816-vc4-reset-control-v1-1-896444373716@igalia.com>
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-1-896444373716@igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 14:13:00 +0000
Message-Id: <20260816141301.599D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Removing the 'brcm,vc4-v3d' compatible string breaks Device Tr=
ee ABI compatibility with older Raspberry Pi firmware.
--

--- Patch [1]: [PATCH 1/4] drm/vc4: Drop the undocumented brcm,vc4-v3d comp=
atible ---
commit 0d9402a3018a535c49f9c7ef653bfa693de83e10
Author: Ma=C3=ADra Canal <mcanal@igalia.com>

drm/vc4: Drop the undocumented brcm,vc4-v3d compatible

This commit removes the "brcm,vc4-v3d" compatible string from the VC4 drive=
r's
match tables. It notes that the string was never part of the upstream device
tree bindings and was only kept for older Raspberry Pi firmware.

> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -279,7 +279,6 @@ static const struct of_device_id vc4_dma_range_matche=
s[] =3D {
>  	{ .compatible =3D "brcm,bcm2835-hvs" },
>  	{ .compatible =3D "brcm,bcm2835-v3d" },
>  	{ .compatible =3D "brcm,cygnus-v3d" },
> -	{ .compatible =3D "brcm,vc4-v3d" },

[Severity: Critical]
Does removing this compatible string break Device Tree ABI compatibility?

The commit message mentions that firmware device trees predating v4.6
(released in 2016) use this string. Since the Linux kernel generally
treats Device Tree as a stable ABI, will dropping this cause users
who upgrade their kernel but not their boot firmware to lose DMA
range matching and 3D hardware acceleration?

>  	{}
>  };
> =20
> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
> @@ -531,7 +531,6 @@ static void vc4_v3d_dev_remove(struct platform_device=
 *pdev)
>  const struct of_device_id vc4_v3d_dt_match[] =3D {
>  	{ .compatible =3D "brcm,bcm2835-v3d" },
>  	{ .compatible =3D "brcm,cygnus-v3d" },
> -	{ .compatible =3D "brcm,vc4-v3d" },

[Severity: Critical]
Similarly here in vc4_v3d_dt_match, does removing this prevent the VC4
V3D driver from successfully probing on those older firmware device trees?

>  	{}
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-vc4-reset-=
control-v1-0-896444373716@igalia.com?part=3D1
