Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3522750FB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625719; cv=none; b=RxTD6qDoG7pIlW7FmhufFRgOMOrlWnA2z6NItw1u9w+OMwHeqOXQmc87kcBKSmh3L8XHtJIk/JynLF0+VPZMAO+Wfx/5/YRzTCePRcXdomvSK5jv38f6mmJe2Jt3xlbYjmFwKDXQVYtp96BucUvSFUfW4nsa3xfHiaW3XcKLsiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625719; c=relaxed/simple;
	bh=Z1FAHzyyIlanru70sK083xzig2a1TTSocdQkwiK8RGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Eso9veswo+fQdZahKi2vRxSxJw2hsbpCJSwvHdc1eV+foRzTbjlm+g3dPXouvm1qhf3N0miYO4CWyzJ4ZX1F7wg0MbGz9y/y0dhxZl4wF6n+U+YkUdVfxoPmyfcx87aROHNkfoHTBPn9sse+FhXoP+mgvAHF9+eQVsCCyE2L7HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GptAQ2xB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GptAQ2xB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B1B1F000E9;
	Thu,  9 Jul 2026 19:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625717;
	bh=KdPym2xiaUT1pfCT2Mz1W1YaeXtHAZ3K+dbcH4NtUb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GptAQ2xB6Puzk2rTRtWlyI5AKFmcr0kfBdQLMTJ3tg/31V5PNRPQfuco7q8GR8oNc
	 LnR6HR5O2S4NEgRBnut/SzsTtCZI6Mv31UFFMRdEdDkbg5z/h8lLs0fRc+CERqYDo/
	 dQqHrGtlEeJB3DasD6XaVGis6b8abnuG+MiQBKP15G2XnJ5mlXPT5n64oss51a3c54
	 kw/kyeaayhDQBLWr2F3i1ihH2dKHc2hf8rsh9wSh8L0nP8oXJr5bpLECfDtJvmftMI
	 X17ea3IKjVP5m6dRN8004kxeJxLYDUlLhMS1XCP7KtUVlfrQQk+E9fXMifalRumDPJ
	 K9F/6bxhbx0Gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 28/36] phy: rockchip: usbdp: Only enable USB3 when
 not in high-speed mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-28-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
 <20260709-rockchip-usbdp-cleanup-v11-28-a149ac60f76c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 19:35:16 +0000
Message-Id: <20260709193517.52B1B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The USB3 port is unconditionally disabled during PHY re-initializa=
tion but never re-enabled, permanently breaking USB3 functionality after a =
mode change.
--

--- Patch [28]: [PATCH v11 28/36] phy: rockchip: usbdp: Only enable USB3 wh=
en not in high-speed mode ---
commit f42d06c6d124fe98eab8964760884de8f170d304
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Only enable USB3 when not in high-speed mode

Ensure that USB3 mode is not accidently enabled during PHY re-init
for systems that are configured as high-speed only via DT.

Closes: https://sashiko.dev/#/message/20260626212424.C215E1F000E9%40smtp.ke=
rnel.org

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1009,7 +1009,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  		if (ret)
>  			return ret;
> =20
> -		if (udphy->mode & UDPHY_MODE_USB)
> +		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
>  			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->phy_needs_reinit =3D false;
>  	} else if (udphy->phy_needs_reinit) {
>  		rk_udphy_u3_port_disable(udphy, true);
>  		udelay(10);
> =20
>  		ret =3D rk_udphy_init(udphy);
>  		if (ret)
>  			return ret;
>  		udphy->phy_needs_reinit =3D false;
>  	}

[Severity: High]
This is a pre-existing issue, but does this missing re-enablement permanent=
ly
break USB3 functionality after a mode change?

If the PHY is already active and a mode change occurs (such as plugging
in a DP monitor or a Type-C cable flip), udphy->phy_needs_reinit is set
to true.

When rk_udphy_power_on() is subsequently called, the U3 port is disabled
in this branch to avoid xHCI SErrors, but there is no corresponding call to
rk_udphy_u3_port_disable(udphy, false) to restore it after rk_udphy_init()
completes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-rockchip-u=
sbdp-cleanup-v11-0-a149ac60f76c@collabora.com?part=3D28
