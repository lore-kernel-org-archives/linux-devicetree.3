Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA1A33C1B7
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779624647; cv=none; b=lKKRpwl2sVbwfc1eTeai384x1URigXGvWcS/ytj90DFEuF18YD2az7Z8P/QvNqqav5yIP11DPiut+yxwL25Qi6/UNSwTkvuroQL6cpmXJvojmq0+cy+sWdyuTYaWuGrlLEdyapBdm5QW+2geJH0CAz8LRoOmc5NCZZjEqPyRU0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779624647; c=relaxed/simple;
	bh=GUcR5s9oeaAtdV0SkTE9j2eYlKH6/e8cOSzfmrv2gak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jmH+Xqhe0J8MjUEbkUTD8bx1uXIWa3/Z/gHNhoC2d5x64nzTMN1bBaY1Q744lHFHXgrXoTniF3jt73yds66Tl5SEFsz4DUBaxoU+kIzE4GtL+bxtQr2dLO88Otz3Wj3ndKGUz+esJrH+mFwEhMF1P9c2LMUMNKBuM2bPhpUU1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkMPkGL9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkMPkGL9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CA01F000E9;
	Sun, 24 May 2026 12:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779624646;
	bh=sgt5UVXmRFTysS+wTZMOdSgxHqq2V2jCkuRyxZgAprk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XkMPkGL99fSH3uJQZfFsWSdu4V1xnS6A3ZWm3ylYES98MZTuBGSffp4zOrKMybx42
	 5mc/9Hl8uGpjg/WyYe8an9Nl5lD/y8L6rcv/yE/hsNOepsCxQpN3mBFI/myjofcWGr
	 AoqncY6sX0mIuoZUdJVXFsq/u5K2a/BGvcr1Z/2C9H9HQsUutUbX90eRJeaNY4LREp
	 YXeqrEoDa0sS3DFotFjOFbQRBIVFnYJw5XRx2hV/oa+UsD8qN/q5KvauqfSnyG8i7f
	 6Y0Ia2vfERDj193W2madSAw2+lkaE5gd+LzIrqIQw8EPRUqgqxVs55M/C4XX9PC3qQ
	 xYRYSRyYNEoGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Set MDP MMCX corners to
 LOW_SVS per Windows
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel J Blueman" <daniel@quora.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260524115704.9442-1-daniel@quora.org>
References: <20260524115704.9442-1-daniel@quora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 12:10:45 +0000
Message-Id: <20260524121045.E0CA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The commit incorrectly applies a Windows ACPI sleep/idle-state vol=
tage vote as the active-state voltage requirement for all MDP MMCX operatin=
g frequencies, severely breaking the DVFS curve and risking hardware instab=
ility.
- [Medium] Board-specific power optimizations derived from a single device'=
s ACPI tables are inappropriately applied globally to the SoC base device t=
ree.
- [Low] The commit message claims to update 7 MMCX OPP packages, but the im=
plementation differs.
--

commit 4a04fd599f313f3ace74e7b33f9120e9295f92fa
Author: Daniel J Blueman <daniel@quora.org>
arm64: dts: qcom: hamoa: Set MDP MMCX corners to LOW_SVS per Windows

This commit updates the MDP MMCX operating performance points to use the
LOW_SVS voltage corner based on Windows ACPI DSDT F-state tables.

> On the Lenovo Slim 7x with Qualcomm X1 E80100, the current Windows ACPI
> DSDT votes LOW_SVS (0x40) for all 7 MMCX OPP packages in the _SB.PEP0.G0MD

[Severity: Low]
Is this description accurate? The commit message states it updates 7 MMCX O=
PP
packages, but the mdp_opp_table in hamoa.dtsi only contains 5 OPP entries a=
nd
this patch modifies 4 of them.

> F-state EXIT package:
>=20
> "FSTATE",
> Zero,
> Package (...)
> {
>    "EXIT",
>    Package (0x02)
>    {
>        "NPARESOURCE",
>        Package (0x03)
>        {
>            One,
>            "/arc/client/rail_mmcx",
>            0x40
>        }
>    },
>    ...
> },
>=20
> Apply the same in Linux for power saving opportunity.

[Severity: High]
Does this apply an idle state voltage requirement to active operating
performance points?

The F-state EXIT package defines the power requirements when a device
transitions out of a functional state into idle. By mapping this low power
state to active OPPs up to 575MHz, could this regression severely undervolt=
 the
MDP?

During the multi-monitor high-resolution validation, the DisplayPort
controllers may have independently cast high voltage votes on the shared
RPMHPD_MMCX power domain, masking the MDP's lower vote. Would a user
connecting a low-resolution display experience regressions like hard lockup=
s or
visual artifacts due to this voltage drop?

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -5657,22 +5657,22 @@ opp-200000000 {
> =20
>  					opp-325000000 {
>  						opp-hz =3D /bits/ 64 <325000000>;
> -						required-opps =3D <&rpmhpd_opp_svs>;
> +						required-opps =3D <&rpmhpd_opp_low_svs>;
>  					};

[Severity: Medium]
Since this voltage optimization was derived from the ACPI tables of the Len=
ovo
Slim 7x, should it be applied as an override in the board-specific .dts file
rather than globally in the SoC base device tree?

Could applying this to the base hamoa.dtsi cause regressions across all
Snapdragon X Elite/Plus devices, which might have different power delivery
designs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524115704.9442=
-1-daniel@quora.org?part=3D1
