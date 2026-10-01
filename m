Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865983B7B71
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852287; cv=none; b=r2MhEQuL2TaKamWojMVnMupHl1lm96OsSSWlktOgJ0UFgfQ7xL2wuNK6fMfW2pDWzgdf+XDa0wS3nm7tsj3gz3nw6BY2AFx9MdPrcW4Ay9QqHXUhVPrzVEGGIcitziC0SOPPSY2mmtJS30aI7oQT1fL/tMs66QXldaAc+cj/IgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852287; c=relaxed/simple;
	bh=YAT36XauiPNBc3VsVkE7wI72Jiw3/FNU7IHcbRLWqYA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RthsBSINfn5NtUfhdhAOMTE3KjEMzojyCD+no9El9lCei5+NjHohswLgR5DUrQv1R+L+KPb8AvW5HkVPjqKuJrckRPF18btWujWOv0ytaeMETnlxR7dlmT+GLzFM92Y+OZn7cFz7iQOCBOQi5QRm8nTXvQHRSz/ir7xRaLWisLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNPiwfWp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNPiwfWp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9021F000FF;
	Thu,  1 Oct 2026 10:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790852286;
	bh=46e6+19mi2I4PGfiBeqGnzJ5h8H5A7H9qZrsrhXKAWc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XNPiwfWpAFsdw2P8aET2gc7ShN7S82lGwoWFVAfXQisMDeGtgEueFBP9QeH4E2qJ9
	 nP7SMUXGNbE8WKtLcvxpLFngkUUF5vLP/z6dqKIAwH2Q4lu7oalgsJGu4FdLMq3FLw
	 Z/9cVbU78i9IVLKFGCT13Os4HtvcJMJkc4qL0rqF8vr3Q0w7YDG1VBJy3ofy3LL4NC
	 GXnoBqgPpe5Gmv9VooG1TehApZOJ3O6+HcW75pgG/IBc6C6Iw1vWZUTetK6PvpXeI/
	 T0hPUvKL6Da1078pM1jFRCmaRXigSVveeqfEbnGy56YOBFhLuph1JotzlS9IimFFxt
	 AIItvPYU905wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 9/9] arm64: dts: renesas: Add LVDS overlay for RZ/G3L
 SMARC EVK with ITE6263
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261001094041.135697-10-biju.das.jz@bp.renesas.com>
References: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
 <20261001094041.135697-10-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 10:58:05 +0000
Message-Id: <20261001105806.1B9021F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm: rz-du: rzg3l_lvds: pm runtime usage counter leak on error pat=
hs
- [Low] dts: build failure due to unresolved du and lvds node references
--

commit 7ca002208d8868213743e7114cf32df2e06ea2b6
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with ITE6263

Add a Device Tree overlay (r9a08g046l48-smarc-lvds-ite6263.dtso) for the
RZ/G3L (R9A08G046) SMARC EVK board to support LVDS-to-HDMI output via the
ITE 6263 HDMI transmitter.

> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index 8c6a448907151..3cecc40204e90 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
[ ... ]
> @@ -190,6 +190,9 @@ dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc.=
dtb
>  dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc-dsi-adv7535.dtbo
>  r9a08g046l48-smarc-dsi-adv7535-dtbs :=3D r9a08g046l48-smarc.dtb r9a08g04=
6l48-smarc-dsi-adv7535.dtbo
>  dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc-dsi-adv7535.dtb
> +dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc-lvds-ite6263.dtbo
> +r9a08g046l48-smarc-lvds-ite6263-dtbs :=3D r9a08g046l48-smarc.dtb r9a08g0=
46l48-smarc-lvds-ite6263.dtbo
> +dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc-lvds-ite6263.dtb

[Severity: Low]
Does this rule cause a build failure?=20

When attempting to merge the composite DTB here, fdtoverlay will fail to
resolve the &du and &lvds targets because they are missing from the base
device tree.

This results in an FDT_ERR_NOTFOUND error.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.=
dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
> new file mode 100644
> index 0000000000000..3c64db8d22e9e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
[ ... ]
> +&du {
> +	status =3D "okay";
> +};

[Severity: Low]
Is the du label defined in the base device tree (r9a08g046.dtsi or board
dts)?

Referencing this undefined label here will cause an fdtoverlay resolution
failure.

[ ... ]
> +&lvds {
> +	status =3D "okay";
> +
> +	ports {
> +		#address-cells =3D <1>;

[Severity: Low]
Similarly, is the lvds label defined in the base device tree?=20

This missing label will also cause an fdtoverlay resolution failure.


Also, reviewing the DRM driver in drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.=
c:

drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c:rzg3l_lvds_atomic_enable() {
    ...
	if (WARN_ON(pm_runtime_get_sync(lvds->dev) < 0))
		return;
    ...
}

[Severity: High]
Does this error path leak the PM usage counter?=20

pm_runtime_get_sync() increments the device's PM usage counter even if it
returns an error (< 0).

Returning early here without dropping the reference (e.g. via
pm_runtime_put_noidle()) leaves the counter permanently incremented, which
can prevent the power domain from suspending.

drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c:rzg3l_lvds_atomic_enable() {
    ...
	bridge_state =3D drm_atomic_get_new_bridge_state(state, bridge);
	if (WARN_ON(!bridge_state))
		return;
    ...
}

[Severity: High]
Does this early return also leak the PM usage counter?=20

If drm_atomic_get_new_bridge_state() returns NULL, the function hits the
WARN_ON and returns without calling pm_runtime_put_sync() to decrement the
usage counter acquired earlier.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001094041.1356=
97-1-biju.das.jz@bp.renesas.com?part=3D9
