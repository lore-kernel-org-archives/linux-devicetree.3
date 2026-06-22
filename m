Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4914E360ED5
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782112275; cv=none; b=H+e0YME6iyTctPhg2/vUB/A3qCSUY5HtnqH2AkEnH0oKhY2kG9qkuL2aAH/wRu9TY4SoeVry3qgv2yl/S5E7BIBbcBffUv6qc/dgXoQrVRHsmyeZ1e9KGiRlb/nlzOfbobEmGvXOZgMREL2BuqB+oB9kI3BoWfSqhmOY12Wva7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782112275; c=relaxed/simple;
	bh=Yk55AEy6k+YvFrqdMZ1QqYS+yHgT0dWoHHUQRshoB5s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XK1MCXlAMuVFPHJaAMItG9ZBbNFUihio5ojz2RzNzB2UXZUolrCXX5Ub689SMB5Rt3Gfes+Mxi+Q5j+fX3J2nVJJs+cV25/JJOA7gy6Rak+ezbGF+8Y8eBJNPyy8msj7eeo0I24wn9Bc9b3qycBmCruNCOFxUShDeD4agXjZZ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAN1trb6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAN1trb6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A4C1F00A3A;
	Mon, 22 Jun 2026 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782112274;
	bh=nxPx5JrA5c4tH2FjQ4armtKIAHePyOu7Xj/y/kwrX4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cAN1trb6+BqvFcgrgAPhymk/WJseyv1cWh2PVBBoGerhJXmZLCp0Fozkt7+BXPUbr
	 AydjZRD/GjL5nb6VjSenEddAR+UWfOTCkzX4bdd1xf7zm9p2vTl02BoNuIySJWO0il
	 Ga3oKJ4/NShmUh3ZH9bEPVMVjPmci2kNsU7mSB/3vc/0OGHUpMYZ336eRFH8Wur1tB
	 b0A8X4yFPPkBC5Lcctb9MtaSAynyBvrirngUeuwxKSivOGFOr3HZWhGOyA3Ha8fYm6
	 LF4qQY6ndXCJow0rHBrqmjtuKMGRQgiX2zW0UPKX/KJULNuseXmGozJ382Q7eLrf+h
	 sz+0LApoZlj+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] drm/tegra: vic: Add Tegra264 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikko Perttunen" <mperttunen@nvidia.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260622-t264-host1x-v2-6-ff7364d9ff7b@nvidia.com>
References: <20260622-t264-host1x-v2-0-ff7364d9ff7b@nvidia.com>
 <20260622-t264-host1x-v2-6-ff7364d9ff7b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 07:11:13 +0000
Message-Id: <20260622071113.D2A4C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Error paths in vic_load_firmware leave a dangling pointer in v=
ic->falcon.firmware.virt, causing Use-After-Free and Double Free.
--

commit c58aa87e57c2ab3ec5383df99d29ec8f6a79e162
Author: Mikko Perttunen <mperttunen@nvidia.com>
Subject: drm/tegra: vic: Add Tegra264 support

Add support for VIC on Tegra264. The Tegra264 VIC uses a RISC-V based
Falcon microcontroller instead of the traditional Falcon previously,
and has the TRANSCFG register in a different place.

> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> index 332c9b563d3f4..46c7e00de3473 100644
> --- a/drivers/gpu/drm/tegra/vic.c
> +++ b/drivers/gpu/drm/tegra/vic.c

[ ... ]

> @@ -302,7 +330,6 @@ static int vic_load_firmware(struct vic *vic)
>  	return err;
>  }
> =20

[Severity: Critical]
This is a pre-existing issue, but I noticed a potential use-after-free and
double-free in the error handling of vic_load_firmware().

When memory allocation succeeds, the pointers are assigned:

	vic->falcon.firmware.virt =3D virt;
	vic->falcon.firmware.iova =3D iova;

If a subsequent step fails (such as falcon_load_firmware() or
dma_map_single()), the code jumps to the cleanup label, frees the memory,
but does not clear the pointer:

cleanup:
	if (!client->group)
		dma_free_coherent(vic->dev, size, virt, iova);
	else
		tegra_drm_free(tegra, size, virt, iova);

	mutex_unlock(&lock);
	return err;

If vic_load_firmware() is called again (for example, during the next PM run=
time
resume), it sees the non-NULL pointer, assumes the firmware is loaded, and
returns 0.

Will this cause the driver to program the hardware to DMA from the freed me=
mory?

Furthermore, when the device is unbound, will the teardown path uncondition=
ally
free vic->falcon.firmware.virt again causing a double-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-t264-host1=
x-v2-0-ff7364d9ff7b@nvidia.com?part=3D6
