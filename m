Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB732F7F15
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 10:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789814165; cv=none; b=P8XqR5xFuOVOVw2LdaO0olz426ZNmikPgeX4gZHivKaQdgGGA/CIs9Hwo7p9RRfEC+u9fNt+by5/72cS3FRmZWQesuve/Xs2+rcwANKmUWCwI4HBmnz8d6BbPB3kahb2NwnI9OMA5PYY06oJy6tSw26UVDwhG11+GhefN2OybNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789814165; c=relaxed/simple;
	bh=fnYSpO6wiAedaXGhaIUDzhgoY0DKBgsKUBj5JNyoOkg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CotsImMrBsBz8CglpGCPMO74G5Z57X16hKqLE2kZCgkxNPz0sA2jhm78tf9MWeN8VUHqfgNjSUey4uwndMhhXTIoJ2MhZkJzVlxMk4fA1UW0F9BqJeVdd87cc98o/Rc5NED6xmMvRPaGTeyB91+/zFVlCUgKed5dDtfmrGLPS7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/ilqDTX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/ilqDTX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84DA1F000FF;
	Sat, 19 Sep 2026 10:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789814163;
	bh=7riI3k0Pe+aUcigPpX03i9Hj15JnH0Ss1MaHSMeoMYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F/ilqDTXWc6Ph1IVmpSh0AYn3GzIBa0vVJdcXP8x+tQI+Gntcf3IaJZrLPEAVNDt3
	 Xhxh2FsyZFt2HFfn/9ydUMjQa1X9koUa8Etb8sFp0ickG2xJSTyi0cBwGcgmBvo7fj
	 0ww5uXXhhR7EsuM7yq9c+HYbCOSR1yUpH9Blav+0cqEzZdRaYdvKLwX1l7c7CpcN4k
	 PCydpSGKCDAfNWSA/lhY36+qptybK+amjKRXxSsXYlL/N0YQaxrQz1L0Yh2F62vmX7
	 +MhWQY5eMqiMeoL+xOWvYwa3Su6Dbi0TalnypBQjhYfaQAsiXgZe+Ax5YdYz9CKTbY
	 YsgO2zLpNxZ0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] arm64: dts: rockchip: Add devicetree for the
 FriendlyElec NanoPi R28S
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?5a6J5a65?= <HystericalDragons@proton.me>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260919-r28s-upstream-v7-3-e80a6f8ef521@proton.me>
References: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me>
 <20260919-r28s-upstream-v7-3-e80a6f8ef521@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 10:36:02 +0000
Message-Id: <20260919103602.E84DA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: unused pinctrl definitions for wifi and bluetooth pins
--

commit 745cf672aded254ac32cf444a084e38df95384e1
Author: =E5=AE=89=E5=AE=B9 <HystericalDragons@proton.me>

arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S

This commit adds devicetree support for the NanoPi R28S router board based =
on
the RK3528 SoC. It shares most of its design with the NanoPi Zero2 and enab=
les
various peripherals including SDIO, UART, and networking interfaces.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts b/arch/a=
rm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
> new file mode 100644
> index 0000000000000..294b66f60e47b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
[ ... ]
> +&pinctrl {
> +	bluetooth {
> +		bt_wake_host: bt-wake-host {
> +			rockchip,pins =3D <1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +
> +		host_wake_bt: host-wake-bt {
> +			rockchip,pins =3D <1 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};

[Severity: Low]
Are these bluetooth pinctrl nodes intended to be used or configured as hogs?
They are defined here but appear to never be referenced by any device node.
Without an explicit reference, such as a pinctrl-0 property on a device or
a hog definition, the configured pull states will not be applied.

[ ... ]
> +	wifi {
> +		host_wake_wl: host-wake-wl {
> +			rockchip,pins =3D <1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		pwr_wf: pwr-wf {
> +			rockchip,pins =3D <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		wl_wake_host: wl-wake-host {
> +			rockchip,pins =3D <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +};

[Severity: Low]
Similarly, are the host_wake_wl and wl_wake_host nodes meant to be referenc=
ed
somewhere? Like the bluetooth pins, they are defined but do not seem to be
used by any device or set up as a hog, meaning their pull states will not t=
ake
effect.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-r28s-upstr=
eam-v7-0-e80a6f8ef521@proton.me?part=3D3
