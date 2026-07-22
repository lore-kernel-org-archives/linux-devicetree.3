Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3344279EE
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752661; cv=none; b=GAe1fLzFx96SiWOmHEHSlXfONR+t4i8DF5DKL9esG0ovgudXY/TjFvXeGaHxnDEplZcWB0kdTLn5xl3pZaNbMq6aWdGY2rnOnXvMC75Prx42DZwH+q29BcbSxl+3VwIMq1o6XPFOFj/SFMD4FvN8otM+hfw+oKM82UNmfTujR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752661; c=relaxed/simple;
	bh=DfFltO63/sN0DvgQg+25f8Q6tV+XaQdH7SvNfOUcYcA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NQhmeROT/q/o9Jqjvl+oqOGQS+NkogNvQs3aDDgoCJ5PKI5jIp4dV+7R6LlubJrvlYiqShYSV8CIwekRJYzv2TyYZBn/HKFrkDsf41M/Nhp9ezea+SUkQPPTaHnc+z5nbKmu6J4A/mbuaj38JtwWa9SLQb+Auk/AmCX67BZvdUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPu4wnui; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPu4wnui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E5A1F000E9;
	Wed, 22 Jul 2026 20:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784752660;
	bh=RKfXrdyZ89OcpA7yA/gbvee+9VuSryYUbFN4zJUupgs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mPu4wnuiOrZItCJL/iEzizhwqaU2kzqc8FDDkczfDC/S6cGXilyY2BE7px7v9hgK8
	 KSBfVgNUli5CGIBp6gMGjJioIn1G4oE26PwsdAq0SQQ3H4NABPHOxHfKjtadSjwrIv
	 PsyxNnYyMPX5s/FlSPjPeljJlGXFEGtcEUtALFkr1UN0bjyMBg988U1tZiO4cKUb1O
	 9s3MqQBlPOFdWIs7DRkO7b8kmlMOCrWljuDNZcviC1XjMf+evSiWaS57A7+sT2yksO
	 FOQ/HbDeLW1kpLoZjahusy4E158ToZcPPJfFPpC18joeFsV5TIKqdAsBTghyDX0XwT
	 XRIkBu9FOeXxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3-com260-ifx: add eeprom on
 i2c1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jennifer Berringer" <jberring@redhat.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260722202848.1817988-3-jberring@redhat.com>
References: <20260722202848.1817988-1-jberring@redhat.com>
 <20260722202848.1817988-3-jberring@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 20:37:39 +0000
Message-Id: <20260722203739.C3E5A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The unprogrammed carrier board EEPROM is incorrectly marked `rea=
d-only`, preventing it from being programmed.
--

--- Patch [2]: [PATCH 2/2] riscv: dts: spacemit: k3-com260-ifx: add eeprom =
on i2c1 ---
commit 94048b36205e1670d5a85578a1cb608f4a7a0439
Author: Jennifer Berringer <jberring@redhat.com>

riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1

Enable i2c1 for the k3-com260-ifx board and attach a 24c02 EEPROM. The comm=
it
message notes that this carrier board EEPROM comes unprogrammed from the
factory on some boards.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/=
boot/dts/spacemit/k3-com260-ifx.dts
> index e7f76cd24b903..a5c08a7a781a9 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts

[ ... ]

> @@ -20,6 +20,21 @@ chosen {
>  	};
>  };
> =20
> +&i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1_1_cfg>;
> +	status =3D "okay";
> +
> +	eeprom@50 {
> +		compatible =3D "atmel,24c02";
> +		pagesize =3D <8>;
> +		reg =3D <0x50>;
> +		read-only;

[Severity: Medium]
The commit message mentions that some boards do not have any data programmed
on this EEPROM from the factory. Does marking this eeprom@50 node as
read-only prevent users or provisioning scripts from writing the initial
configuration data to the EEPROM from Linux?

> +		size =3D <256>;
> +		status =3D "okay";
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722202848.1817=
988-1-jberring@redhat.com?part=3D2
