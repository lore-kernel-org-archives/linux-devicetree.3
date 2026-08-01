Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DEC344D83
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 08:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785571994; cv=none; b=pCuxoYuXlr4gqv630bstEouqV1e+FILc5ptukGfuZ7CD3kWn5mW/pYUOe809n5z1tDHf5Zwme2JdEpxV2YcmUwwqPeySdNr+U752/R1sAMzZqEhm6Dfl/AOlOKnwZ1uEfN8wZyi+L65nSQkAl8UlOZsAEMxZiUaEul16vn640sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785571994; c=relaxed/simple;
	bh=f/IgRRHU2FyUfgsQi8FXp++ptlv3ENgKKgpALCXPXdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JSn6eYlFMbufef8/sbuoB4tTJAApqqvhE86Hy4Azk4B5n5xe4rQScjXi7GAeMK6OeAClOJeoRk1DLzK4oGyOCJKkljrkW65J8iLR3nKQdx7sb7n/EitAVmrC1HRBgik5KuQDR2ezP90bbQFjrfhBofyBPvsDX32UoZhxH3gYtnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWHITkl6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWHITkl6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E546B1F00AC4;
	Sat,  1 Aug 2026 08:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785571993;
	bh=46GBln5W02AQIHozgS4ZKPTYwXsYGxPVKFCZmsqzHxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gWHITkl6YeOCOLWzT9KVk8NQEp3Nq0E2dHy8CwoL1yw3wNQqJo6yxZAvykl5aR/xL
	 Gdu8ozsbcnJ7prSPKXxEouu7T8ZifpHG6p5gwmoxHCCvV3KVTV7zKw9adsadmR7c7v
	 AZMsOn95stBIdj2ej1TKi95UcY7dMh68e9IPiSsY4tkfe2CwhluxdC7yoSiqSqD9Nz
	 jdkW66XcWfX2pusQw+kZMQELqjPT14+iN7ATH+l04WmnqPGofrsDewQA3pI6gDJdei
	 ZA/3JyAvfii1aLdKbxpIGUCii6UEcrKSYWcS06vw9sS03PrbdnsU3xpL7gPJWXt0SV
	 KRklt/AqsOluA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add MangoPi M28K
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chukun Pan" <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260801080018.3220034-3-amadeus@jmu.edu.cn>
References: <20260801080018.3220034-1-amadeus@jmu.edu.cn>
 <20260801080018.3220034-3-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 08:13:12 +0000
Message-Id: <20260801081312.E546B1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unused pinctrl definition `wifi_wake_host_h` in device tree.
--

--- Patch [2]: [PATCH v2 2/2] arm64: dts: rockchip: Add MangoPi M28K ---
commit 5c35fa24023c282c8d840265113ad72db0aa147d
Author: Chukun Pan <amadeus@jmu.edu.cn>

arm64: dts: rockchip: Add MangoPi M28K

This commit adds device tree support for the MangoPi M28K development
board based on the Rockchip RK3528 SoC. It details various interfaces
such as USB, Ethernet, MMC, and regulators.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-mangopi-m28k.dts b/arch/=
arm64/boot/dts/rockchip/rk3528-mangopi-m28k.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-mangopi-m28k.dts

[ ... ]

> +	wifi {
> +		wifi_reg_on_h: wifi-reg-on-h {
> +			rockchip,pins =3D <1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		wifi_wake_host_h: wifi-wake-host-h {
> +			rockchip,pins =3D <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};

[Severity: Low]
Is this wifi_wake_host_h pinctrl intentionally left orphaned?=20

It doesn't seem to be referenced by any device node in this file. It looks
like the AIC8800 WiFi module doesn't have a child node under &sdio0 (perhaps
due to lacking an upstream binding), which makes this pinctrl configuration
unused.

Would it be better to omit this pin configuration until the corresponding
WiFi node that uses it can be added to the device tree?

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801080018.3220=
034-1-amadeus@jmu.edu.cn?part=3D2
