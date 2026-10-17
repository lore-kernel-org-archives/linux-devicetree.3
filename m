Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777B63B71A7
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 18:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260449; cv=none; b=T0V/fySenmOGv2jBLCUJGQSi8Y/t1GTPUsaSIY4llU+Eo0fjRtA/OKv163/OhC/O3HQPNiavt5y1U7Arq7i2Fe1QkFGhf0D0KZAOYKV3KEDUGTeQCL27mh+lkbwDQxZfThY6lPGIdtDCgE2ckKcQVXmOa8SUuIm9wsg5xJn5/fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260449; c=relaxed/simple;
	bh=BMnZabUtt0oLcw1+pV0OzaZX6nCQs4BSpJaA8X4oBHk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=b/wf0LHlGHZiVsqaZejMOJ38wmPWPSpQWBCACRo+9ErU7k/w/YrMJpQ1uajawGqWGdEerxdBHhXK0YOtBQNmofk+S3EI2OLEdH1U3Xuv9VYB5N42nvNoJr/kDMBZQiC3pbVAkUdHbC2+Lj0GESQuFgO6q4I2kXWdeX0s3ta2di0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKH4LZby; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKH4LZby"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FC91F000C5;
	Sat, 17 Oct 2026 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792260448;
	bh=MaA4p0X0x8zbg4+eTY6MHIqdE6rwAMY5QhdeK7WAOfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SKH4LZbyOxN/z26YaLd3hG5jEorNU05TdIhRA3B0jxIJyIfucAe6WTtx+HfbAQ9+p
	 Bo0IaxvzCex1SQemj2gIBRSimVsgiyk4Vs+FBGn1BcnTAWK6ZYsam5GyRa3uwQoUOG
	 XWTG8lvM4BsbcGS5AZgVruLlwSIjIk07CEaSdd+1DIlfqnx5dta4ogc9zIsBmccFQX
	 oNne4f1s6A9WpGDGFdgul6yvlWHtsc4BfvwPsHmROV+t490nvd0uslHoExMmHRMvXg
	 a0FaWIo8lujfNOJvqVwBKMqwsOxjjs5Ub7FCTRLr8M1Ublh9539pVzZkJyBWPpS2xH
	 irxSQYSpwxbMQ==
Message-ID: <sashiko-outbox-175735@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices
 bootph-pre-ram
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hung-Chun Tseng" <alan.tseng.cs@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017180141.3477743-3-alan.tseng.cs@gmail.com>
References: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
 <20261017180141.3477743-3-alan.tseng.cs@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 18:07:27 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] riscv: dts: spacemit: missing bootph-pre-ram on i2c2/eeprom@50 f=
or OrangePi
--

commit 5b0574f2bdfb9fa217393dc3ab5d437d4cba162a
Author: Hung-Chun Tseng <alan.tseng.cs@gmail.com>

riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

This commit marks the board EEPROM, i2c2, the P1 PMIC, and QSPI NOR flash
nodes with bootph-pre-ram across SpacemiT K1 board device trees so that
pre-RAM SPL can access them.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-r2s.dts
> index eb77aae9d6008..5e2fde8be7692 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -187,6 +187,7 @@ &i2c8 {
>  	pmic@41 {
>  		compatible =3D "spacemit,p1";
>  		reg =3D <0x41>;
> +		bootph-pre-ram;
>  		interrupts =3D <64>;
>  		vin1-supply =3D <&vcc4v0>;
>  		vin2-supply =3D <&vcc4v0>;

[ ... ]

> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 790234f3550a3..d4adfc5b74374 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -214,6 +214,7 @@ &i2c8 {
>  	pmic@41 {
>  		compatible =3D "spacemit,p1";
>  		reg =3D <0x41>;
> +		bootph-pre-ram;
>  		interrupts =3D <64>;
>  		vin1-supply =3D <&vcc4v0>;
>  		vin2-supply =3D <&vcc4v0>;

[Severity: Medium]
Should &i2c2 and eeprom@50 also be marked with bootph-pre-ram in
arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts and
arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts?

The commit message notes that the SPL reads the board EEPROM at 0x50 on i2c2
to identify the board, and marks both i2c2 and eeprom@50 on the other K1
boards. Both k1-orangepi-r2s.dts and k1-orangepi-rv2.dts also enable &i2c2
and define the board identification EEPROM right above &i2c8:

&i2c2 {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&i2c2_0_cfg>;
	status =3D "okay";

	eeprom@50 {
		compatible =3D "atmel,24c02";
		reg =3D <0x50>;
		...
	};
};

Since i2c2 in arch/riscv/boot/dts/spacemit/k1.dtsi is not tagged with
bootph-pre-ram either, won't an SPL build that filters for bootph-pre-ram
strip both i2c2 and eeprom@50 on OrangePi R2S and OrangePi RV2?
(Alternatively, since every K1 board in the tree connects eeprom@50 on i2c2,
could i2c2 be tagged in k1.dtsi just like i2c8?)

[ ... ]

>
>
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017180141.3477=
743-1-alan.tseng.cs@gmail.com?part=3D2
