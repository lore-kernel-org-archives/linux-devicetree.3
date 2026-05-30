Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272AD3AB482
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780163169; cv=none; b=IeSkOljwxy7icBxeU4RGq8n04D1pggmq+LOvvE+FFiQbw0ZvJ5nOs4GOUL4Ad4j6bP1p1ATL0pTjMkbUceN1da+tOzSAJFniGQHfvNbMyouGJuB/0o86If8hmJ4XESpaP5mHZUWZViDnl0fJz4mSqcrdsnywgKhTXn7o60VToGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780163169; c=relaxed/simple;
	bh=UOuQrPTmH+s4+UrMogh2qBK6J7N2chfgdwA7SeCyTBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=thxsrLe8pvnuHQLDoGaXuwihGtra1m3mTjqVCEgvpuX0Ist2b3jaZMQSCi7BgkYKMLffKOE5w63lh2TuSF0ubeRhfur+zJOm6MafLJkYivEMDmwJ0jNujI7y37cEtPCHK2pSIZOHoeixx+i6xxnNhaz9QRSOb0fXA7tvVY3rAhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UxmAi2xO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxmAi2xO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5AD1F00893;
	Sat, 30 May 2026 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780163168;
	bh=hhNKpfIopQbnQGWcr1jZLOhw5byzac0k/fu2j6DrRjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UxmAi2xOJri/i5ww0UP92JPDsDFmpMiQKPNflJCyYHrK5mlYhtwxBrh2b1jG9HIjB
	 2MXgjdF9WHodCl2dLSo4MCXIPx5MprW45TzDfh2N6L1esH8unKluOsvmyMwYcZxm7D
	 B1t83ucQ8TeMUC5EqJ4DCmvV6w0nUh93Nj/FpiVje/FIe26/xddqb6e+gSrl5TJdvK
	 qK7aAeF1PlC/cQh3B498EQAQT3uewFzgdiBhUSEh59NYwlefVCX7cRu+loKyqbFyd9
	 BpLpsrEEMwJucQJHU1DwQfNfYhQrcbjOPqSgpSoa+My1DodbCYECBJISn7ms0anH68
	 kCU0GChtP6y4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 RESEND 2/5] arm64: dts: sophgo: add initial Milk-V
 Duo S board support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Milas" <josh.milas@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260530173347.33533-3-josh.milas@gmail.com>
References: <20260530173347.33533-3-josh.milas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 17:46:07 +0000
Message-Id: <20260530174607.BE5AD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree enables several hardware peripherals (emmc, gmac=
0, i2c4, mdio, sdhci0, sdhci1, spi3, uart0) without defining or assigning t=
heir required pinctrl configurations.
--

commit 562d6189b640dfe9eda31b9948bcc49d22497758
Author: Joshua Milas <josh.milas@gmail.com>

arm64: dts: sophgo: add initial Milk-V Duo S board support

Adds initial arm64 support for the Milk-V Duo S board making it possible
to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm=
64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..8632470f43ab0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

[ ... ]

> +&dmac {
> +	status =3D "okay";
> +};
> +
> +&emmc {
> +	bus-width =3D <4>;
> +	no-1-8-v;
> +	cap-mmc-hw-reset;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status =3D "okay";
> +};

[Severity: Medium]
Should these hardware peripherals have their pinctrl configurations defined?

Several nodes are enabled here (emmc, gmac0, i2c4, mdio, sdhci0, sdhci1,
spi3, uart0) without pinctrl-0 and pinctrl-names properties assigned.

Without these properties, the kernel will not initialize the pin
multiplexing and relies entirely on the bootloader to have set up the
pinmux correctly.

If the bootloader behavior changes, or if a driver attempts to manage power
states by suspending and resuming the device, these peripherals might fail
to function.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530173347.3353=
3-1-josh.milas@gmail.com?part=3D2
