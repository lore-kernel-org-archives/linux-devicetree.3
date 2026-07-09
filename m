Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2122B425CD2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600769; cv=none; b=Nzi/zYu8XvsBADzuADki5eIGdeTZ9cjLi0vT27Qu+ZLpMp1zKAlh/sfS0DJIojoYbcPx+ys7dHFjENXkADzUoiK++ecMAJ8E6dIQdYpiRO5HacCwdVC6DFYsEPM5AvfR6LHSTzI1Cp/wlTHRQ6NF4ePvMRIGf3zHY1w/YmKHoMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600769; c=relaxed/simple;
	bh=Gu/mfaCwUOZfbyd3j2jz9BUIQ2t6OtsdXr1YluxXw64=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QJ+Jh2LstfjWR8DF5Dmi5T8VERSl7F/utilcQoXRRNenncGBEINtD840TydgLVJtdH0xTwJctR2sY2PH7V+IKeN0YwIgM4B+BLSV+VozONOc0/fGo6YbaTFlSPoX+h8rBwFojxrv+BcMaAjTz52N4axetTCDilQG+nbnU8a8BD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLsrnEO/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLsrnEO/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BCF1F00A3A;
	Thu,  9 Jul 2026 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600767;
	bh=Glra8PM4NwvhMoMLMUELeGKOY0pVK6QZo2f4IdxRaAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZLsrnEO/ZcW59JRoT86lZ+E9E28AhGnpRErvAOVVnWPrRDW+wR1C395amEmkVL+V3
	 0CnScU3wO3EbvbZpWlp5oZo8b28t/FisJKOX0CZ+Pboh17WbYAYYCVny+HfhMobJli
	 1I36KtBSqFWe7tR2/4D56v/8QTUKAt5XiB0srZ/EmRqfrGiMcn8c1M3FUKqcYHZ0zD
	 qpjan/xwLbcLCrdUwSxm4wprEPn7C4JVbEAflOQLzUc9yPykPN+ZxaJSFplZXxbbf9
	 y/9C1nRDIxdcpCuHep5V86OZ9+yWrs1PFkO92xrKVoGcd40BUBu1b4YURuOZBIktTL
	 JCjWPjd5ZFZkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/4] arm64: dts: cix: sky1: add audss cru
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709120125.3997078-5-joakim.zhang@cixtech.com>
References: <20260709120125.3997078-1-joakim.zhang@cixtech.com>
 <20260709120125.3997078-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 12:39:26 +0000
Message-Id: <20260709123927.67BCF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Double decrement of the PM runtime usage counter in the probe erro=
r path.
--

--- Patch [4]: [PATCH v9 4/4] arm64: dts: cix: sky1: add audss cru ---
commit 37987ea88a502f3fe87d70d7d428d9f00deb012d
Author: Joakim Zhang <joakim.zhang@cixtech.com>

arm64: dts: cix: sky1: add audss cru
   =20
Add the AUDSS CRU device node providing clocks and software resets
for audio subsystem peripherals.

> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/=
sky1.dtsi
> index a77c52296ebd3..9b2d969f6bfe7 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi

[ ... ]

> @@ -558,6 +562,20 @@ mbox_pm2ap: mailbox@65a0080 {
>  			cix,mbox-dir =3D "rx";
>  		};
> =20
> +		audss_cru: clock-controller@7110000 {
> +			compatible =3D "cix,sky1-audss-cru";
> +			reg =3D <0x0 0x07110000 0x0 0x10000>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +			clocks =3D <&scmi_clk CLK_TREE_AUDIO_CLK0>,
> +				 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
> +				 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
> +				 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
> +			clock-names =3D "x8k", "x11k", "sys", "48m";
> +			power-domains =3D <&smc_devpd SKY1_PD_AUDIO>;
> +			resets =3D <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
> +		};
> +

[Severity: High]
While reviewing this device node, I noticed a regression in the correspondi=
ng
driver's probe error path in drivers/clk/cix/clk-sky1-audss.c:sky1_audss_cl=
k_probe():

fail_clks_set:
	pm_runtime_put_sync(dev);
err_pm:
	pm_runtime_put_noidle(dev);
	pm_runtime_disable(dev);

Does this sequence result in a double decrement of the PM runtime usage
counter?=20

The error path correctly calls pm_runtime_put_sync(dev) but then falls thro=
ugh
to err_pm which calls pm_runtime_put_noidle(dev).=20

Decrementing the usage counter twice when it was only incremented once caus=
es
it to underflow to -1, which corrupts the device's PM runtime state machine.

If deferred probing occurs or the driver is re-bound, will the next probe
attempt fail to properly resume the device because a single increment will =
only
bring the counter back up to 0?

>  		mbox_sfh2ap: mailbox@8090000 {
>  			compatible =3D "cix,sky1-mbox";
>  			reg =3D <0x0 0x08090000 0x0 0x10000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709120125.3997=
078-1-joakim.zhang@cixtech.com?part=3D4
