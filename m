Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B750E324B33
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791670138; cv=none; b=QWP4X2ISXmIeOqGGQEa7cLhjUD/xuWdxo8rAKgulydAGx0v2hUR529NJjZKa2TO6Va4als79qSVRT6UnQJ9W26frwi16e+UlGbbqFmJxx4kPp2EuxNE1fjLgYHeapDZKxDeXhbE6kKGM6hjnduj3EU9fviBJd94MWMMWmCBVarU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791670138; c=relaxed/simple;
	bh=+7PzV3NGNfXz6WtdO/QviMVPmAWB9Whff6jdbDg8Zoo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QUn12jwOOspOie6TmyE5HPrBBquQY+aBu4id2gNX8DLmM58qURi1zzQV7qRLq8EoEoPz6NnCj6U9z5RZ9jqNKTKjCiDcy0jTCI+BIk8c/Ijin17VhB/nY9XoWI4/JaXFSAekNhQzpkYhOp4dw4YAvOs07TPvezR8cBh8PYV+d1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXuUNCa0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXuUNCa0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01CE1F000FF;
	Sat, 10 Oct 2026 22:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791670137;
	bh=TPDW5XOGa2UIR09n7oxRooPqiXOPMzaMGdFIleu+vMI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hXuUNCa0d+aZzZaCueWMJQuSvFqLeSSjMcsN8W7CjZZk77NWgkCx70raVnR4Madbk
	 wa5rJxFX/jSRUpwpbBCbOZcvKhmDUWPpC62DN7MSO2MNq196fYs1bzuQ4S86/QvsKj
	 WlT4+d5ecu4jqNC0CNtG1P6E0L8s2H8MMHTJv5FYfj504bV5dA7UxIlPgj4Ka/R9SL
	 36WwKTO6OrlJc7Q7kMuEMjpTrFTCSBN4jEnqge6KaCygWwLHXYIY4pUulsOyD1HyhG
	 FpqxAiLGFgTesNIgyQRNCMUTLeoHM+jlIBqulYzkZo4c8+b5qmmCVxUyF7dPEAjSO7
	 DCmZH8jOHHRew==
Message-ID: <sashiko-outbox-166900@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add the GPU to Kobol Helios64
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Velkov" <iav@iav.lv>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv>
References: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 22:08:56 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: rockchip: missing regulator-initial-mode for vdd_gpu c=
auses panfrost timeouts
--

commit e9e84838a5d23aecac47c2c16bd51c1be53464af
Author: Igor Velkov <iav@iav.lv>

arm64: dts: rockchip: Add the GPU to Kobol Helios64

This commit adds the GPU core description to the Helios64 device tree,
using a silergy,syr828 regulator on i2c0 at 0x41.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arc=
h/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> index 63ad79b4c8ac3..1f50982291bfe 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
[ ... ]
> @@ -453,6 +458,25 @@ regulator-state-mem {
>  			regulator-off-in-suspend;
>  		};
>  	};
> +
> +	vdd_gpu: regulator@41 {
> +		compatible =3D "silergy,syr828";
> +		reg =3D <0x41>;
> +		fcs,suspend-voltage-selector =3D <1>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vsel2_pin>;

[Severity: High]
Does this regulator definition need regulator-initial-mode =3D <1>; to force
PWM mode?

Without forcing PWM mode on the SYR828 regulator, sudden GPU current demands
cause transient voltage droops that lead to Panfrost job timeouts.=20

The vdd_gpu regulator uses silergy,syr828, which is handled by the fan53555
regulator driver. Without regulator-initial-mode =3D <1>;, the regulator
remains in its default Auto (PFM/PWM) mode, which cannot respond fast
enough to large current spikes during active GPU workloads.

Adding regulator-initial-mode =3D <1>; forces the regulator into fast PWM m=
ode
(REGULATOR_MODE_FAST), preventing the voltage droops and resulting job
timeouts.

> +		regulator-name =3D "vdd_gpu";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <712500>;
> +		regulator-max-microvolt =3D <1500000>;
> +		regulator-ramp-delay =3D <1000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-b4-helios6=
4-gpu-v1-1-bd83c6ecd19e@iav.lv?part=3D1
