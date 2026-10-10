Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF6A4A6899
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638066; cv=none; b=G2DBlrfIl8j7Jp6iVwcqI6swUJ1aGZ0l5i655VhuBtbyGxlx91pTe9peijfAgWyPM+U5Z1Lqf6W12QsvofGuZ/0FpQ7/emKXmVzYGA867p5wMByHkgkAJOPrMX9xUWPzrC+mJb0zcoNVwF6A7VZ1/FQ5vSwLdgKmCRdOqYGtlfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638066; c=relaxed/simple;
	bh=GNRBWT8yYXHHEsIAytU3+dV3B028eP7CKV4TG2CISyY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XCIR7MA+QhKVEqw8E2XYgaUTBkf0Zayse7WlP2bMN486RdqD//q531wusTSmMCG4wdsJEpCLIC9oGaYQQY8TFk2GjOLR2eOxNm6m37fpNajavZHNhr3T7caLbRcbzWAas0gnr0BHRHm+M5dZtwJy07CcTOz9VMyUIO9FehT+egI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BsO7nhP1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BsO7nhP1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017021F000FF;
	Sat, 10 Oct 2026 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791638065;
	bh=PKyFaaqJxA35FvMlgRpmv2FVYmpCS2eM9Cpc0o3SQNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BsO7nhP1C0zJ/fphWhBUD+r9i+ItfniDmNgOZk2gDYr7pUJ9Jr2jKAs1OdSGbyNOc
	 /35khOUhsjqVZbPmLt3JMVLXlNLv0BPU9wLGm4F0xo4r/rlgAvq20yHaYWAgxq6FXx
	 TVCvJq8dhZAZ8ybGsTI8ZP9XDn9ZsCGuTAd7arhLg2IEHrT8y5hcgQX92skgm0CVTT
	 J87a7klZDK56ASuMDgWBC6fTvQQYt4IGtmXp302tDMO0LXculP6tQza4fU0mVXjPsU
	 ThgTM+6It0TyE2QDyNlAlCrs7J2INgbGn4e8N6zbAqRbKSDnebPOOtdaDCvzUBG9a7
	 biyjo9dqeOE1g==
Message-ID: <sashiko-outbox-166579@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 23/24] ARM: dts: zte: Add ZX279128S SoC description
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010130024.177503-24-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-24-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:14:24 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: incorrect interrupt configuration for Cortex-A9 TWD watchdog
--

commit bc197aaf9d71e07d72ae7dee27293f05bc2999cc
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

ARM: dts: zte: Add ZX279128S SoC description

This patch adds the initial Device Tree representation for the ZTE
ZX279128S SoC. It defines the dual Cortex-A9 CPUs, along with clocks,
timers, GIC, L2 cache, and various peripheral controllers.

> diff --git a/arch/arm/boot/dts/zte/zx279128s.dtsi b/arch/arm/boot/dts/zte=
/zx279128s.dtsi
> new file mode 100644
> index 0000000000000..e2bbc70de319f
> --- /dev/null
> +++ b/arch/arm/boot/dts/zte/zx279128s.dtsi
> @@ -0,0 +1,397 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause

[ ... ]

> +		timer@800600 {
> +			compatible =3D "arm,cortex-a9-twd-timer";
> +			reg =3D <0x00800600 0x20>;
> +			interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RI=
SING)>;
> +			clocks =3D <&topcrm ZX279128S_TOP_A9_PERIPH>;
> +		};
> +
> +		watchdog@800620 {
> +			compatible =3D "arm,cortex-a9-twd-wdt";
> +			reg =3D <0x00800620 0x20>;
> +			interrupts =3D <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_H=
IGH)>;

[Severity: Medium]
Will this interrupt configuration drop interrupts for CPU 1 and break
symmetric SMP lockup detection?

Since the system has dual cores (cpu@0 and cpu@1), it seems like this
should use GIC_CPU_MASK_SIMPLE(2), similar to the timer@800600 node above.

Also, is IRQ_TYPE_LEVEL_HIGH the correct trigger type? The Cortex-A9 TWD
watchdog interrupts are inherently edge-triggered. Configuring an
edge-triggered private peripheral interrupt as level-triggered can cause
missed or spurious interrupts in the GIC state tracking.

> +			clocks =3D <&topcrm ZX279128S_TOP_A9_PERIPH>;
> +			status =3D "disabled";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D23
