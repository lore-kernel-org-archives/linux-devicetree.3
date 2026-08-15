Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12F37E5E2
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 21:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786831062; cv=none; b=rGEnPCkr1Gd2ic+QKVktbrs4aWDi9MEMv/0EsJM0HQXgrenEsXtSFBUmWuiitCZFqMIjyAOtawSjKjclQuK74dBdPc4Bgz4mPMom4yY2tlCRcsWhKIWO8HlKtW8s5lanlqAavq1KpEAdk2hH9oXsyYsv9gvpIaFLNBIwDB52Sh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786831062; c=relaxed/simple;
	bh=ug7QN0DsirlA8pDr/qsj9gDVfCp0syXLRJlQUzEOH0k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=psPlWR5mtxNVJ/YFQm6QbtePncS40K8iczdIP8P5fwj06pMBntwbuCfU1Wh8CxKrQ9aXQRO/PIsfXiUZsthzE9kqHlwnDOQa0P7e0GjODWdZGoJErusDUFL4918b4MEm7aQ2JMJp/upUHcpSWiVYBapwjfvs5/BxX6ECtLc4yKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYhDVjFw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYhDVjFw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0411F000E9;
	Sat, 15 Aug 2026 21:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786831060;
	bh=WFY9a1hH640Vmk+dQCCAfuq4zGZTljcRG9JrhWoRkeE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OYhDVjFwtYnYSfwnBuO/YX73fEHCNJ27kYequQo+YsSuboyXH7Et4D5+8xOCQ4nra
	 9vk8IQYFB3zssS4tBSQ+svYtdPOaK9szEqJ9nuztlpd7NdQYcmXJrA4WkSz91RLjzr
	 KvKl1TcMr72kmS0FlT4SEK05R1fxmuuXU5Iz7Cj/+HoLUpGC3a330I13Cm/tjQPHKq
	 vcP58q+fXe84apbz/Ov1wBdhmeNOEqpqG2w8o6DO70M7+KRHAq6WBerIwad9PKy7qM
	 RTEjtxa3SMSoyR3WBD7vxAvNOz/kmJ8V2+5zSYEC2tiHCbjLyMndu/+pS2LlU94FxK
	 LAU3YpQxj4Fcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: ti: keystone-k2l: Remove obsolete
 ti,davinci-spi-num-cs property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260816-ti-davinci-spi-v1-1-a7f57dfd5262@gmail.com>
References: <20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com>
 <20260816-ti-davinci-spi-v1-1-a7f57dfd5262@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 21:57:39 +0000
Message-Id: <20260815215740.5D0411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing `ti,davinci-spi-num-cs` without replacing it with the s=
tandard `num-cs` property permanently discards the correct hardware capabil=
ity limits, such as the 5 chip selects for `spi2`.
--

--- Patch [1]: [PATCH 1/2] ARM: dts: ti: keystone-k2l: Remove obsolete ti,d=
avinci-spi-num-cs property ---
commit 09741cd34d52c73b4d50caafab226d5b1bedeba4
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

ARM: dts: ti: keystone-k2l: Remove obsolete ti,davinci-spi-num-cs property

The commit removes the obsolete ti,davinci-spi-num-cs property from the SPI
nodes in keystone-k2l.dtsi, as it is not documented or used by the driver.
The driver relies on the standard num-cs property instead.

> diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/b=
oot/dts/ti/keystone/keystone-k2l.dtsi
> index 330b437b667f6..65fdb45e83681 100644
> --- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
> +++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
> @@ -400,16 +400,7 @@ mdio: mdio@26200f00 {
>  		/include/ "keystone-k2l-netcp.dtsi"
>  };
> =20
> -&spi0 {
> -       ti,davinci-spi-num-cs =3D <5>;
> -};
> -
> -&spi1 {
> -       ti,davinci-spi-num-cs =3D <3>;
> -};
> -
>  &spi2 {
> -       ti,davinci-spi-num-cs =3D <5>;

[Severity: Medium]
Does removing this property instead of converting it to the standard num-cs
property permanently discard the correct hardware limits?

By removing the property entirely, these nodes will silently inherit the de=
fault
num-cs =3D <4> from keystone.dtsi. This discards the intended capabilities
(5 chip selects for spi0/spi2, 3 for spi1) rather than fixing them. The file
itself documents SPI2CS4 (the 5th chip select) for spi2 pinmux.

Should these be replaced with num-cs =3D <5> and num-cs =3D <3> respectivel=
y?

>         /* Pin muxed. Enabled and configured by Bootloader */
>         status =3D "disabled";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-ti-davinci=
-spi-v1-0-a7f57dfd5262@gmail.com?part=3D1
