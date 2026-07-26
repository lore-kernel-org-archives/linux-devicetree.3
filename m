Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84AD1DED63
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 18:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785090658; cv=none; b=cnhzW2hkbWRgeYzlX5vlwXdTSUHX2LxV97oSSuRXWCKKcnZo/BVHtUnj9OMwAePaDzNJ0BlLL0jM3feganYecD0w83pDnbAE2kGTdNYaAKqxJ3f8yyc/Zy3i8XDNSOUwzzV77fwgKA7asb1GYkK7plYJmOxrabQvlPDY0cRGhsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785090658; c=relaxed/simple;
	bh=FLLHKXrABF79E4+CztD3OQtykIiZFrNBLmsl83fsNcw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I5HUbbXsfmHbbyicyMXmRveJDKTsHhSg7C7/e5iX2TbyNhhgKojI596aoNhk8r/KPEuhDR82xfuY9grSwSLETs1p3+lF3wMwGnY7oa8/xIwVfSAPN01jYA++Zdp1XSEEdWOC83mbMu2KGPJYsoWY/M4LJHq342UJzBAy6/qPQH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0tGwCIj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0tGwCIj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D501F000E9;
	Sun, 26 Jul 2026 18:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785090657;
	bh=8tTb/aXgBZ6FyLReP7eNJ+grwDk5bdOdFeGZtIqJGUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M0tGwCIj0AyE6uVq6rGwwxMOxJbnpZPgj69hxFJxMCsU3RbFbHyCbhACNb0BDb60q
	 XkMh8SgCMBvIzAAbqrr7wtoqygqjr6kfTKkvmV+boDbnby/HBY8LDtFo6zwrK8VCE8
	 lHOh8YSrWPyLNIERPzLKUPcBhbF+nGI/sNAzWbVhzD87a+4F8nlnFO1SHf9vzI1Lbh
	 rhBAzSEcBUZ8GZ7K3Mjaniwnq4QcZvnFGMllOMhYnPUt+ZwP85n3qrFY1q+azU6ZUb
	 1UYr5zPutehPmrJXZLYbRdeCcu6omHUWXNynMuxMK2p0NoNKLmesccS2yFNUhb7Lpv
	 NJ8ogRexeaO9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] powerpc: wii: Add the fixed OTP layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260726181921.16269-1-linkmauve@linkmauve.fr>
References: <20260726181921.16269-1-linkmauve@linkmauve.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 18:30:56 +0000
Message-Id: <20260726183057.02D501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Device tree node names use underscores instead of hyphens, which wi=
ll trigger `dtc` build warnings.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but concurrent reads=
 from the NVMEM driver lead to interleaved I/O operations and corrupted dat=
a returns.
--

--- Patch [1]: [PATCH] powerpc: wii: Add the fixed OTP layout ---
commit 50a0e49ef16272487c2bdbc82035d4dd0bfb8e87
Author: Link Mauve <linkmauve@linkmauve.fr>

powerpc: wii: Add the fixed OTP layout

This commit exposes the 128-byte fixed layout of the Wii OTP as cells
for either kernel or userspace consumption.

> diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
> index 473d9feb9cdb8..0d1806273d43c 100644
> --- a/arch/powerpc/boot/dts/wii.dts
> +++ b/arch/powerpc/boot/dts/wii.dts
> @@ -233,6 +233,44 @@ control@d800100 {
>  		otp@d8001ec {
>  			compatible =3D "nintendo,hollywood-otp";
>  			reg =3D <0x0d8001ec 0x8>;
> +
> +			nvmem-layout {
> +				compatible =3D "fixed-layout";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <1>;
> +
> +				boot1_sha1@0 {

[Severity: Low]
This isn't a bug, but does using underscores in device tree node names
violate standard devicetree naming conventions?

It looks like this will trigger dtc build warnings when compiling with stri=
ct
checking enabled, such as "Character '_' not recommended in node name".
Would it be better to use hyphens here, for example boot1-sha1@0?

[ ... ]

While looking at how these new cells are consumed by the NVMEM subsystem,
I noticed a behavior in the underlying provider code:

drivers/nvmem/nintendo-otp.c:nintendo_otp_reg_read() {
    ...
    iowrite32be(OTP_READ | bank | addr, priv->regs + HW_OTPCMD);
    *val++ =3D ioread32be(priv->regs + HW_OTPDATA);
    ...
}

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but
is there a missing lock around this two-step I/O sequence?

If two threads concurrently read from the NVMEM provider, could their
command and data I/O register accesses interleave?

For example:
Thread A writes to HW_OTPCMD.
Thread B preempts, writes to HW_OTPCMD, and reads HW_OTPDATA.
Thread A resumes and reads HW_OTPDATA, incorrectly receiving Thread B's dat=
a.

Since the NVMEM core does not serialize reg_read callbacks, should the
provider implement locking to prevent silent data corruption on concurrent
accesses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726181921.1626=
9-1-linkmauve@linkmauve.fr?part=3D1
