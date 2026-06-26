Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CE61C84A6
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472219; cv=none; b=ntZaV7fEuJAi+q+SSYesstrin7Cyw03rrIW+eeO8Pf4YPflOiDpRbJG8eu+k0rPWP3VFDkjmkAINmY763jVeqmCZM32pSq/POq+/vkYsDRwLeXHEzKsh5Z5zPLKIvUvUPFvoFBsXxgQf9O0MPnDF+lSiXUkZENjm8C8XJT6+fLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472219; c=relaxed/simple;
	bh=JZ6X4Bl7x64rsajdBLeuSwl+BJpnpd7jPfF3t9KaxWU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BSCAWeZWwqVS6ZstEqcTrNaae9U/AzO5DfGK91mxovL5BNlGr3xShTNunPrwxNmv4Pj4HZayiMXEOhTryED0XvijNkiLDTo24wX74VSDbJh2cQMQVIYmHH8AgwwHxkTru/BOBEITOvNuSoHrJjyKFhRKOaDhi25fXxJTnrI7Sq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtHFzkDm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtHFzkDm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262C51F000E9;
	Fri, 26 Jun 2026 11:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782472218;
	bh=V1+3ByO9sZTBOPPaag1NOlKHNCayeOkBmlsCMLPFYpU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BtHFzkDmWcTgOoz7uqsCTEuQpHmEWGygCQtTB8J79LL3p6JQ9VNNys0EDN+XP9uar
	 RjoGTPftrjTuNrsYF5LFlNDqfCR+7RMNpNkRKb1JstOt/6Z7Oy7QqZ4WNAHNQBZZaL
	 8Ylnq+q0oXWoLtQ52kzI6unlPjPjoy6H7KLZ/BloQAWiB35YmewmCgz6DeWrifSx6h
	 tAI86STRHozPqCxSnQEpd/EUzI7z2kYgjxNMdlW3hfKxcL8LCr/CuzikPn6/F1l5RX
	 u+R52nJzqGk2mS67x96JsaEgHOA6TA4GhhLGE+OEz56W6RcPvwbTzPqjnBGK08WRVy
	 X7UELYXhRtiew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 carrier
 board DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiqi Li" <lijq9@lenovo.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260626105625.600156-3-lijq9@lenovo.com>
References: <20260626105625.600156-1-lijq9@lenovo.com>
 <20260626105625.600156-3-lijq9@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 11:10:17 +0000
Message-Id: <20260626111018.262C51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree erroneously disables the QSPI NOR flash controll=
er (`spi@3270000`), breaking OS-level access to the SOM's boot firmware.
--

commit 0ad71e09cd3382aee8aca7f31b76da55ec8f3499
Author: Jiqi Li <lijq9@lenovo.com>

arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS

This commit adds a standalone device tree file for the Lenovo ThinkEdge
SE70 carrier board, which is based on the NVIDIA Tegra194 Xavier NX SOM.
It configures the 40-pin header pinmux, an external SD card slot, and
disables unused PWM and SPI nodes to reflect the passively cooled platform.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dt=
s b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
[ ... ]
> +		pwm@32f0000 {
> +			status =3D "disabled";
> +		};
> +
> +		spi@3270000 {
> +			status =3D "disabled";
> +		};

[Severity: Medium]
Will disabling spi@3270000 break OS-level access to the SOM's boot firmware=
?=20

This overrides the 'okay' status inherited from the carrier board DTSI,
disabling the QSPI controller needed to access the internal SPI NOR flash.
Without this controller, userspace tools may be permanently prevented from
updating the bootloader or firmware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626105625.6001=
56-1-lijq9@lenovo.com?part=3D2
