Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAD64A49B2
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686061; cv=none; b=FTZuyZ6q3mnSPbCMdtLsCHKZ3NJEh7zkOvJDSt+Uh37r51SsMJEOALp/+j52fubYpsyQ7BNoxfoRE8OhTrMc1Kdpe2kAXYpFmLxm2Z9B9togalHoOxZjBl+8jqwJtpFeFOYTqB4TzOZCW6eIE2NJsGTsmXZmngp78QnFGSxdhAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686061; c=relaxed/simple;
	bh=RR9oJMB6EfuXZi1SoFAn6tM1kupVWO7D+aSwGVlxOUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dPUv4o0XKcfNqXp9brSRyCUZL41Fxfr3OcZ20l78TFkriEuz1FY9UWLZ3vH4y/NYcqXaKekseOdcubIqQa+mvRuCEWSxBUgyDHxNAORm7rwa2AhFLk8Z57vSNM1N04TbyCQSJZfVgA1BvC7bT8ubqpBtO5Ydqokwfo8w2F30QtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKAXdRBY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKAXdRBY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47EF1F000FF;
	Thu, 17 Sep 2026 23:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686059;
	bh=GPrARY+C2Pg1Zrk7477h6/FZKZ4igEOeLhiwFhpaWrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LKAXdRBYRsMYgwnu0jfipdib+LctzJr0VEJVkmuK6ClrQO/+tYTrAwP+hPCyuos+P
	 TYwZupPdCitqAouD43Hb2tmpBZVVZ3tSxlUbVrZJCbGmeN+D2yjE3hbblF1GmRn8B1
	 xrD588iUFGSSSu0zYN1DkA5vKICRWptuzBQdV0+XsVnysUusLyVaNpHGJsItRRVH8L
	 Uy9XgfeSjIqRbuoHffGlSZIXmtTYvJ8QiYHlXCskzb+poqM5YB40KRjC2UZpyWfa2x
	 iGNdZmWdLOQgQ2T5A2GUn0Lqud8TtowifOktupgx2oQyd6/zBQz1uWPnwpHzAexohW
	 2iWxWwHMmAqGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm: dts: xilinx: parallella: Enable QSPI and NOR flash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksander Jan Bajkowski" <olek2@wp.pl>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917225317.319745-1-olek2@wp.pl>
References: <20260917225317.319745-1-olek2@wp.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:00:58 +0000
Message-Id: <20260917230058.D47EF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: uboot-env partition is marked read-only preventing fw_seten=
v updates
--

commit be87c0d3af6ecbab826ce9e10b9f662f4e9662e5
Author: Aleksander Jan Bajkowski <olek2@wp.pl>

arm: dts: xilinx: parallella: Enable QSPI and NOR flash

This commit enables the QSPI controller on the Parallella board and adds the
corresponding SPI-NOR flash node along with its fixed partitions.

> diff --git a/arch/arm/boot/dts/xilinx/zynq-parallella.dts b/arch/arm/boot=
/dts/xilinx/zynq-parallella.dts
> --- a/arch/arm/boot/dts/xilinx/zynq-parallella.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
[ ... ]
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			partition@0 {
> +				label =3D "uboot";
> +				reg =3D <0x0 0x4e0000>;
> +				read-only;
> +			};
> +
> +			partition@4e0000 {
> +				label =3D "uboot-env";
> +				reg =3D <0x4e0000 0x10000>;
> +				read-only;

[Severity: Medium]
Will this prevent standard userspace tools like fw_setenv from updating the
U-Boot environment?

The kernel MTD subsystem parses the read-only property and clears the
MTD_WRITEABLE flag for this partition. If a root user attempts to open or
write to the corresponding /dev/mtdX device, the operation will fail with
-EROFS or -EPERM.

While some board configurations intentionally restrict write access to the
bootloader environment as a policy choice, is it intended to structurally
prevent dynamic updates from Linux on the Parallella board?

> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225317.3197=
45-1-olek2@wp.pl?part=3D1
