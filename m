Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3127D3955EC
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786209154; cv=none; b=J7uguTYhLBY44dvq1VpiXafiTnrJt7ch+dbzV675LcyhWHe2P1iBqryKF7QvCazBZ/5nWSkTLWIrohI45n3hEvQiRrUBlWcS3c96aoh6V4/UwvAY3xnlhV46F5IKYq5g8tzmYk38QZpdL6TfcyGPk8R0JkXYj/VTjaEOiONghB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786209154; c=relaxed/simple;
	bh=mJADRUnmsM8UKRPABIAoAXLwJNlREwQ4Jpm9GsQaLFc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oGohWn9rEJsd/EA2QQC/hIzfoGUj0iy8HMBrLLzlzEqadiwP60Mg2E18MshJ0vYzVHG2lWbd8H8TL5aiyj2WsmikAk4K3T/apCJvkxKMPRCwh/4skBkfntJd48yf/akm9G+hR2ML54igFjlghjWsDuAPv1LCyIUNP3E2TWgPzmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XlZwPd1c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XlZwPd1c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57AE1F00A3A;
	Sat,  8 Aug 2026 17:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786209152;
	bh=Rb3z3Mhnqt6OfTEvyep4T+NUJVcz8ghZ76fL3jzWBbU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XlZwPd1cR4q9uCCDukhGN/Jyy0HQCdPOLa8o9gCWR4B+1HJaqHzl9tv6YJeluR6p/
	 FWFHFkuFXjMkO0x0L3b/F/e3XRcCQDQvy6PlZgCNy70ekG1cSGSmjuCnGN50hxKAba
	 3+xjgemKLAX1UzAMZeI87ffC3Q2bNFGwhhUTirPNYdbPkkb8jMDdWL+zmEVAcY/DMe
	 +UilycoCEKn8AeFVH2c7OIrPWPxxsvPmrz0p2JU/4V1SXWdbrE1jPbDGVSdQdfUfDt
	 34hIjEuGrxjKAVp7Usxa5ebYcvSB4RpyLpD3SM6Ji4JPhVEJ0HXiFWu/xE4Jn0TR3c
	 Pd1NvC3QAkFvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 09/11] net: mdio: realtek-rtl9300: Add
 support for RTL838x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807171058.522833-10-markus.stockhausen@gmx.de>
References: <20260807171058.522833-1-markus.stockhausen@gmx.de>
 <20260807171058.522833-10-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 17:12:31 +0000
Message-Id: <20260808171231.C57AE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Omitting C45 read/write callbacks causes C45-over-C22 fallback, wh=
ich races with the hardware polling engine and silently corrupts PHY MMD re=
gisters.
--

--- Patch [9]: [PATCH net-next v13 09/11] net: mdio: realtek-rtl9300: Add s=
upport for RTL838x ---
commit d55bec9024e95e7ae2bc08007789dc929916fc94
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Add support for RTL838x

This commit adds support for the RTL838x (maple) series to the RTL9300
MDIO driver. It introduces new hardware definitions, C22 access functions,
and controller setup for RTL8380.

[ ... ]

> @@ -868,6 +927,26 @@ static int otto_emdio_probe(struct platform_device *=
pdev)
>  	return 0;
>  }
> =20
> +static const struct otto_emdio_info otto_emdio_8380_info =3D {
> +	.addr_map_base =3D RTL8380_SMI_PORT0_5_ADDR_CTRL,
> +	.cmd_fail =3D RTL8380_PHY_CTRL_FAIL,
> +	.cmd_read =3D RTL8380_PHY_CTRL_READ,
> +	.cmd_write =3D RTL8380_PHY_CTRL_WRITE,
> +	.cmd_regs =3D {
> +		.c22_data =3D RTL8380_SMI_ACCESS_PHY_CTRL_1,
> +		.c45_data =3D RTL8380_SMI_ACCESS_PHY_CTRL_3,
> +		.io_data =3D RTL8380_SMI_ACCESS_PHY_CTRL_2,
> +		.port_mask_low =3D RTL8380_SMI_ACCESS_PHY_CTRL_0,
> +	},
> +	.num_buses =3D RTL8380_NUM_BUSES,
> +	.num_pages =3D RTL8380_NUM_PAGES,
> +	.num_ports =3D RTL8380_NUM_PORTS,
> +	.poll_ctrl =3D RTL8380_SMI_POLL_CTRL,
> +	.setup_controller =3D otto_emdio_8380_setup_controller,
> +	.read_c22 =3D otto_emdio_8380_read_c22,
> +	.write_c22 =3D otto_emdio_8380_write_c22,
> +};

[Severity: High]
Will omitting the .read_c45 and .write_c45 callbacks here cause the PHY
subsystem to automatically use the C45-over-C22 software fallback via
mmd_phy_indirect() when MMD registers are accessed?

The commit message mentions keeping the C45 helpers out of the driver until
needed. However, if any kernel PHY code (like EEE initialization) or usersp=
ace
tool accesses MMD registers, the software fallback performs multiple non-at=
omic
C22 writes to registers 13 and 14.

Since the hardware polling engine autonomously and continuously writes to t=
hese
same registers in the background, could the software fallback interleave wi=
th
the polling engine and silently corrupt the PHY MMD configuration?

If C45 access should be disabled for now, would it be safer to provide dummy
C45 callbacks that return an error, or to have otto_emdio_write_c22() inter=
cept
and reject writes to registers 13 and 14?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807171058.5228=
33-1-markus.stockhausen@gmx.de?part=3D9
