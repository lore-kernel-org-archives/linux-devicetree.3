Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149C941D640
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059410; cv=none; b=hZmlq99O0wSEbquDoowYZ+OjVYK3R3X/liQHPzxwAUn9PtmCx3lJAQXW0B6D1UoxY5zV+1tlX89iwXFk/EkMVXGt5GpPgoqgehfmWdSpgIsAkyYivSGFA+ZFKUDuLEL5D/ciSpXrfo6qxqXuOo4CsAUfkuvVbnAgJk3lQA9nkWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059410; c=relaxed/simple;
	bh=dxdRVgxKi+FnCUC+KAJii4pxkYYJ9xPjBatmB+sibTE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OLzEsvdvg9y9qamWaymtk5Es9FigbbU5NEwSdClOjpcfFdif7GZLZnUFjwMiT2js78K543r9xirlImgwOI74l305ronQ9K6VFJUONMmOm+flgJ6WH44zgwMhQQcgiULHjg8nnlKKa+CBxHL2yvGzkTsZmPdYws7wkarJbR0R7BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgknFs7F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgknFs7F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13D51F00A3A;
	Tue, 14 Jul 2026 20:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784059403;
	bh=cQtB/9gmuDtsjTSXmfGDwguH+t2INntnsFfQTcRQfmc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BgknFs7Fu+QSZ38a4z9tjhWjHTp1Ib+d8vNiiOkafIzjc+Iwx57GCe+Kf3z7HpDav
	 0ypQ0SmcATqSU4tWm5h6IfQdmpJ1LTpnyCQvMR187hRR1lcDciJZEM56Rg2Tuya5Dd
	 QO2rnuVpF2oTOf6g1DVcZK0ysTe/PNzBS8iaY/Div/gv6jHDdJrsRDGlZOl7Bkhtdu
	 m5KRNmn30trPMudwdPCPoMAI5PXi5D6fCUY35cXDOALxIVNmoWvmgliIf94RD8ki/0
	 gzVMBtzBtgq9gacw+SoCFqpTQJqCLCeR4qyu72fR/0P3hHzEEixPG6AA5L5uA1lcgJ
	 wId5ykZKiuikA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 17/35] phy: rockchip: usbdp: Drop DP HPD handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-17-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <20260714-rockchip-usbdp-cleanup-v13-17-6cb3e769d4c5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:03:22 +0000
Message-Id: <20260714200322.F13D51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The Type-C mux handler ignores standard USB and Safe mode reset ev=
ents, preventing dynamic recovery of USB 3.0 functionality when exiting DP =
Alt Mode.
--

--- Patch [17]: [PATCH v13 17/35] phy: rockchip: usbdp: Drop DP HPD handlin=
g ---
commit 7a23b9358d639150ae95d06261a789689b085a0c
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Drop DP HPD handling

This commit removes the HPD handling logic from the USBDP PHY, delegating
the responsibility to the displayport controller itself. It also adjusts
the Type-C mux set routine to ignore mux events not involving DP AltMode.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -1309,6 +1267,14 @@ static int rk_udphy_typec_mux_set(struct typec_mux=
_dev *mux,
>  	struct rk_udphy *udphy =3D typec_mux_get_drvdata(mux);
>  	u8 mode;
> =20
> +	/*
> +	 * Ignore mux events not involving DP AltMode, because
> +	 * the mode field is being reused, e.g. state->mode =3D=3D 4
> +	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
> +	 */
> +	if (!state->alt || state->alt->svid !=3D USB_TYPEC_DP_SID)
> +		return 0;
> +

[Severity: High]
This is a pre-existing issue, but does this early return cause the PHY to
ignore standard TYPEC_STATE_SAFE and TYPEC_STATE_USB reset events?

When a dynamic exit from DP Alt Mode occurs (for example, via VDM), TCPM
typically sets the mux to TYPEC_STATE_SAFE and then TYPEC_STATE_USB. During
these transitions, state->alt will be NULL.

Because this early return completely ignores those states, udphy->mode
appears to get stuck in UDPHY_MODE_DP, leaving the PHY lanes permanently
mapped to DisplayPort.

Could this cause subsequent USB power-on attempts to fail the
!(udphy->mode & mode) check in rk_udphy_power_on() and silently abort,
breaking USB 3.0 SuperSpeed functionality until a physical replug occurs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-rockchip-u=
sbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com?part=3D17
