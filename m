Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC183A48E6;
	Thu, 16 Jul 2026 18:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226934; cv=none; b=B8YxiV1KE95Chkxal3cO7cDzjDNELvZB0fnq+OLos8iAS0pQ/t0YMVh9UBaNw/Vhu9z9TdQQY8DJgIIDcbBDYJg0wGD5pMd7CnW3XwVKFpEHYsxw+JtLlDF2/azbvr6Wp/MoUCvvMQeO/UF9KJBNxwwbXGux+b1nXEL+vCr94WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226934; c=relaxed/simple;
	bh=AYpFCeE71oHrJGeBPXxcs2phFtaDawuLEZxZ/8Wq3Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oJgm8byWmlPSF7SktUa1xitJwlxAlINyGek6RdySEvPc4XPuUUUhlVCndppGHXMuEqtBUDCZfV0r2W9FpxRsaj/0ncHieaJONGY33K2d8Wp7V0MSu1f/ZuBT4ZEp5qz1lYl3g/1RVs6r4rkObRo99oh9oyVxjV/fpHQMfZkRQ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=bHTiI4Au; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="bHTiI4Au"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CBtsWFuTDIg8IgjUhvZKzlGaiQ5mUGATekYrAmZco2A=; b=bHTiI4AuiFVT/lUiAEyL+dLyiO
	m7Y/rR1V0NP3iudbLx2AwYJ8g9Y1pdeTx3FjP63JHwB57cYyXFKIHZnEZu/eY36AsmHuumzxS0os8
	PXppavuiY0OX3jfZjXFUw4uvFlIQpvDx3k2WzSvWtSnXc84CEDxnCNY82ILl2CWp1zHYvU8BvXO54
	Ag39vN59yZ56ibhHr/TrxGKxFWSi0Ie6HfVf3K80J3sWmuI+muf/RqYvHFcO0z45rV+sbo1EfuEJh
	oXMheo6QY8HHbNrvxJH+qcsNRsJSxqdv8NadWJXMJIC5E5SiYXGnopyqiU0KV5zM3VSiL21RRN5ay
	WoOBqWCg==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Thu, 16 Jul 2026 20:35:21 +0200
Message-ID: <40552860.10thIPus4b@phil>
In-Reply-To: <20260716095101.2498464-1-gahing@gahingwoo.com>
References: <20260716095101.2498464-1-gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 16. Juli 2026, 11:50:59 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Jiaxing Hu:
> Add mainline support for the ArmSoM CM5, an RK3576 compute module, and
> its CM5-IO carrier board.
>=20
> Patch 1 adds the binding, patch 2 the module dtsi and the carrier dts.
>=20
> The on-module YT8531 PHY has no crystal and needs the SoC 25 MHz
> reference clock (clk_mac_refout). Ungating it for RGMII needs a small
> dwmac-rk change sent separately to netdev [1]; the clock is optional so
> this DTS applies without it.
>=20
> Tested on a CM5-IO: the YT8531 is probed by the motorcomm driver and the
> link comes up at 1000 Mbit/s; RK806, HYM8563, eMMC, microSD, the USB3
> hub and the PCIe root complex all probe. dtbs_check is clean.
>=20
> Changes in v3:
> - Remove the ES8388 codec from the file header and the i2c0 block
>   comment. The node was dropped in v2 but the comments still named it
>   (sashiko-bot on v2).
> - Use gpios instead of gpio in the vcc_3v3_pcie fixed regulator, to
>   match the other regulators in the file.
> - Pick up Krzysztof's Acked-by on patch 1.
> - The other v2 review notes need no change: the always-on plus
>   off-in-suspend state on vdd_cpu_lit_s0 and vdd_gpu_s0 matches every
>   rk3576 board upstream, and the eMMC full-pwr-cycle-in-suspend with no
>   vmmc-supply is the same pattern used across rk3576. dtbs_check stays
>   clean.
>=20
> Changes in v2:
> - Type-C DP alt-mode: name the altmodes child "displayport" and make
>   svid a /bits/ 16 value; drop the undocumented svid from &usbdp_phy and
>   add the missing mode-switch.
> - Move the FUSB302 role-switch endpoint into the connector's ports; the
>   fusb302 binding does not allow a port on the device node. Rename the
>   node to usb-typec@22.
> - Drop the ES8388 node (disabled, wrong compatible) and the unreferenced
>   gmac0_rst, bt_reg_on and wifi_host_wake_irq pinctrls.
> - Rename the wifi-poweren-gpio pinctrl node, it collided with
>   gpio-consumer.yaml.
> - Describe the PHY reset at the MDIO bus level rather than with the
>   deprecated snps,reset-gpios; a per-PHY reset-gpios is applied only
>   after the ID scan, too late for a PHY that boots held in reset.
>=20
> [1] net: stmmac: dwmac-rk: enable the reference clock for output mode
>=20
> Jiaxing Hu (2):
>   dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
>   arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

As Rob said in the v2 bindings, please slow down.
Additionally that is the 2nd "v3" today?

If something is a resend ... please mark it as such, i.e.
[PATCH RESENT x/y] ... and provide an explanation what went
wrong in the cover-letter.


Thanks
Heiko


