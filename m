Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C07C346FBC
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 10:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233628; cv=none; b=Gw+ZUE9FTtm6zkPR3N4ybhWOORn4iAkjl1bqoTMe5JPzT3edWXVEVyMlYStzIF7Z4zuQ2Huut/9/JQV22OREUShqPqfe/luJRJlW7BJhyFJhHGqzvJlOFUAVC22J1WANL4XJrGiEcsC3K77Psc/KPkPqioR1ruWf8P1tfmnFvy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233628; c=relaxed/simple;
	bh=Bpu6zNfJu2Ta7JfdoqtxmB4a3UmoQdm+W/vkhANH2kA=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=sugmzr4QCF9PTaQ0MZDPAW0SAFjW1/3I5QGdyvOfiQm65PqnwRMhf0mfS2b12AX+araIizenB+RmoupRosCudYPPXOzlXIFk+6EZpMc2rRpLEmMqT1Kw/TnwzmzEppdjz9q/08xc4tOzX6CbtQxLt3gKhlkuqPZsioiAQGXf8ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0gfthU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0gfthU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CE41F000C4;
	Sat, 17 Oct 2026 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792233626;
	bh=1QZjwI+cDcElcbu9/ejo3/YhyXEdaDVUkWYGSGtY240=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=O0gfthU26dDEALI+Y1XdlznaG/WDKAPcW3vy2hBPPfDv9YpsL4TjYy3QzdsI7Jsbl
	 5n/Q3Ny5GwWwvDGFWBYWwvqc4RZ+2FxprOy1m2ikGU3JoWzwIeypTE7iV7wIWu0WBh
	 i3ce4sAkuXA9nMhHA9aew7fy7Tv+xaDYWr8pkZLdX8r3oPchSTDYbDwkShteDNXKAi
	 +RFM6XIp9kHLRp1Qh08y+XGBb/6ZyocNte8TOO6ZI9UCmYQQgtmjsiZ5YTmCeXwGML
	 ZCtfSTCtGNjfRq+iSqvimhPs5XfQ2VgkgJIXelVl5Nu5c9eGORdxpRi6X/pZSFTNgB
	 rZWgN2QKI8sjQ==
Message-ID: <sashiko-outbox-175473@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 7/8] ARM: dts: microchip: sama5d27_wlsom1: read MAC
 address from QSPI SFDP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, linusw@kernel.org, arnd@arndb.de, pengpeng@iscas.ac.cn, gregkh@linuxfoundation.org, mathieu.dubois-briand@bootlin.com, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <e756cb8a61a93caed4b68ff8e7c69c184ebfd47e.1792145382.git.manikandan.m@microchip.com>
References: <cover.1792145382.git.manikandan.m@microchip.com>
 <e756cb8a61a93caed4b68ff8e7c69c184ebfd47e.1792145382.git.manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 10:40:25 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] nvmem: sst26vf-sfdp-eui: infinite probe deferral on missing EUI-48
--

commit 2233a3452b4615481340768cbd46d9b4bfaf12ac
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

ARM: dts: microchip: sama5d27_wlsom1: read MAC address from QSPI SFDP

This commit configures the QSPI flash SFDP as an NVMEM provider on the
sama5d27_wlsom1_ek board to read the factory-programmed MAC address. It
adds the nvmem-cells property to the macb0 node so it can retrieve the
EUI-48 identifier.

> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts b/ar=
ch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
> index 35a933eec5738..5e87bf04bc47c 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
> @@ -97,6 +97,8 @@ uart6: serial@200 {
> =20
>  &macb0 {
>  	status =3D "okay";
> +	nvmem-cells =3D <&mac_address_eui48>;
> +	nvmem-cell-names =3D "mac-address";
>  };

[Severity: High]
Will this lead to an infinite probe deferral loop if the QSPI flash EUI-48
marker is unprogrammed, missing, or corrupted?

The commit message notes that boards without an EUI-programmed part simply
do not reference the cell. However, if the flash part is present but the
marker is missing or corrupted, it appears the macb0 interface will fail to
initialize entirely instead of falling back to a random MAC address.

Looking at the nvmem layout driver:

drivers/nvmem/layouts/sst26vf-sfdp-eui.c:sfdp_eui_add_cells() {
        if (marker !=3D SFDP_MCHP_EUI48_MARKER) {
                dev_dbg(dev, "EUI-48 not programmed (marker 0x%02x)\n", mar=
ker);
                return 0;
        }
}

This silently returns 0 without adding the cell, which leaves the layout
bound.

When macb_probe() requests the cell, the nvmem core sees the bound layout
but missing cell:

drivers/nvmem/core.c:of_nvmem_cell_get() {
        ret =3D nvmem->layout ? -EPROBE_DEFER : -ENOENT;
}

This causes of_nvmem_cell_get() to return -EPROBE_DEFER indefinitely.

Then in the ethernet driver:

drivers/net/ethernet/cadence/macb_main.c:macb_probe() {
        err =3D of_get_ethdev_address(np, bp->netdev);
        if (err =3D=3D -EPROBE_DEFER)
                goto err_out_free_netdev;
}

Because macb_probe() treats -EPROBE_DEFER as a fatal error that requires
deferring, it skips the fallback path and never brings up macb0.

Could the layout driver return -ENOENT instead when the marker is missing,
or is there another way to ensure the ethernet interface can fall back to a
random MAC address in this scenario?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792145382.gi=
t.manikandan.m@microchip.com?part=3D7
