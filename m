Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A443A0E81
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782508670; cv=none; b=hro0LL8kxD8jziR/6aY2XIPrvKcA6qeNrgMx4vyYYGD8icW6sKoF0vFGdBopV4ghjiFXad9r/M8W+YLowWoQy1FAAJPPKm7VoXUF/dk8kJ6Wrr14BCXgMhYKdbYZ+MPRvT90ljX10uj3UWYcHuBPmhDcwPXHvvkJODlVR6dH+Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782508670; c=relaxed/simple;
	bh=BTlu3F9lPw0wqV2ccWKUd40pZHNMzoH3KD4mfxaYc2k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nzACCImyTfvGd7weuOYv+UDwHxIWv+yBMWqNbdsAUfkINMIKo+ew450Wp6Ke7KeWPogzAQ7JmObx8wbYMg0wdQziTakzUJij8Yo5elc+m8W6umqJG6tf7aW8XeLVYgLdQ9P8SZDNnyMzW7zeXuz+wfjLQpYZeVi5lYlxlK7czCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMUW4Ef6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMUW4Ef6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF691F000E9;
	Fri, 26 Jun 2026 21:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782508668;
	bh=m0dy4UkM4Vp8svrKYfbkw79OIu4z8Qbu6Ly7oV7dbpo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MMUW4Ef6sL+xomGVarpWj6e0ZiSMekL1pKSC+71R0VsQq7kbAJQvzI+rKutcaQs79
	 e3UnphhBUlVuowqqgxyT7IrMOfIzUdvHWOCSpCiGpwRUE1dry43UYjSQalP9MzekZF
	 xBdovrwAQKiO1y+9++U+knUnqm0m+TrrYpcLGe1FZPb7y4KWa1gGTy3baPskr5OitA
	 S1RnCWZSZco/M6VmYZpgvb94d7Um2UjOZYLwkq9iQijrq0YRfa18JPSGjkmr1jd1JX
	 7xwuHrHm9q2VmptsxCllW8x1j4c5Vw2mM+pe0b7yjFdoTPiPMc9rexXmvMtQiPY82l
	 d5gtSkKSddINg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 24/29] phy: rockchip: usbdp: Support going from
 DP-only mode to USB mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-24-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
 <20260626-rockchip-usbdp-cleanup-v8-24-47f682987895@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 21:17:47 +0000
Message-Id: <20260626211748.4DF691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The logic introduced to restore USB functionality fails on subsequ=
ent adapter replugs because `udphy->status` permanently retains the `UDPHY_=
MODE_USB` flag.
--

commit b83098c186ec9041e5338df8dff07f7fa436a60c
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Support going from DP-only mode to USB mode

When a USB-C adapter, which maps all Superspeed lanes to DP is plugged
in, the USB support is disabled in the PHY. When the adapter is
unplugged and a different adapter with USB functionality is plugged in
afterwards, USB functionality is not restored as the USB controller
keeps the PHY enabled for the entire time.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 837a4cb3e4b60..4566822d70c4a 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -1347,6 +1362,17 @@ static int rk_udphy_typec_mux_set(struct typec_mux=
_dev *mux,
> =20
>  	rk_udphy_set_typec_state(udphy, state->mode);
> =20
> +	/*
> +	 * If the new mode includes USB, but it has not yet been powered
> +	 * (because the previous mode was DP-only) and the USB PHY was
> +	 * already initialized by the USB controller, we need to power on
> +	 * the USB side now since no subsequent phy_init call will come
> +	 * from the controller.
> +	 */
> +	if ((udphy->mode & UDPHY_MODE_USB) && !(udphy->status & UDPHY_MODE_USB)=
 &&
> +	    udphy->usb_in_use && !udphy->hs)
> +		return rk_udphy_power_on(udphy, UDPHY_MODE_USB);

[Severity: High]
Does this logic handle subsequent replugs correctly if a USB device is plug=
ged
in first?

Since the USB controller keeps the PHY enabled during hotplug (as noted in =
the
commit message), the UDPHY_MODE_USB flag in udphy->status is not cleared.

If the user then plugs in a DP-only adapter, the PHY is reinitialized for DP
and physically disables the USB3 port.

If the user later unplugs the DP-only adapter and plugs in a USB-only adapt=
er,
won't !(udphy->status & UDPHY_MODE_USB) evaluate to false because the flag =
was
never cleared? It seems this would skip the call to rk_udphy_power_on() and
leave the USB3 port disabled.

> +
>  	return 0;
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-rockchip-u=
sbdp-cleanup-v8-0-47f682987895@collabora.com?part=3D24
