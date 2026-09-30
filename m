Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C453B47C3
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749229; cv=none; b=FrIvMGp9zK1Slkh+2G7u7b4OyxpwnhgzMmg8+ChBbORdAKJFr3vVdBBL0hZ10LbjTU/PM2Zd7xzZLNFhTXwz1pUnXPKXDx/Kn6AzSmqGLcFbVxFCqjqJQmyqWRBa5uv//+wjT2mlu+hstoz5D9rx/uwHBN0/ZhCdJVXCiFml8Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749229; c=relaxed/simple;
	bh=AtW184GEVNMwK8i6raKZS8TGanlEFuDwYykozLL+XJc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h9kwkVhYfa0o39Z6ZsrIeY7X2QdDDmxtiP02NWDwNteJSu7Xl8yHiCHHHScGpXZUm3Q5a9mp6BFbkPJKyRC11kigkOaXb5tgK1nOfbdXFt3Q7piD+lr8KKjVSXIc2M2JFH2sBNuMkXU1ZTAktviaqyvcuKr+54lFvUpsgz8ws4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOg3svvE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOg3svvE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26AF1F000FF;
	Wed, 30 Sep 2026 06:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790749228;
	bh=etJFnIHWVBtwYdfENnKP81rvc8vh8b+shEt3yJiB5+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EOg3svvEMXBiERkvSa52aOE4ot68vMg5MYznn/3UP9vVWMi40hQF3xmSIhfuA6g0/
	 4Oqz62bYkSq9V11fY0GAkfxTAxcnmhJX8qOaG8ImWAdp+zQoh5Q+Hru7IWmG4mAjMX
	 rIebyRPN0rt3lVjo4bhHAQkh5h4YZbWeJ/whP+DqJrKIUsSFeDvO53joaLs16z273f
	 6pQRTj/bSaHhkAbs0U7iE0y6j2s/cTz833u3WjyHf9oHw79z2DZ7iBE6OS0YKQU23b
	 Mc3YiphK148n3PpCy/+1S7lPt89uu6xu4XZAa1OsTohlv0cftE1nm3ZcJAWknZt6ws
	 Loa1QXH8k8hZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 14/15] ARM: dts: aspeed: anacapa: Update EDSFF power
 status signals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260930-anacapa-devlop-phase-devicetree-v9-14-f08aa0d7182d@gmail.com>
References: <20260930-anacapa-devlop-phase-devicetree-v9-0-f08aa0d7182d@gmail.com>
 <20260930-anacapa-devlop-phase-devicetree-v9-14-f08aa0d7182d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 06:20:27 +0000
Message-Id: <20260930062027.D26AF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: aspeed: anacapa: missing SGPIO line rename for EVT1
--

commit cde2dbf50bae37ad4a486fdf1cafec415093ffef
Author: Rex Fu <rex.fu.amd@gmail.com>

ARM: dts: aspeed: anacapa: Update EDSFF power status signals

The CPLD definition for the EDSFF power status signals has changed
from PG to FLT. Update the corresponding SGPIO line names to match
the CPLD definition.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dt=
si b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
> index 5c0d874fa24af..766aa26b6cea5 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
> @@ -370,7 +370,7 @@ &sgpiom0 {
>  	"L_PRSNT_EDSFF1_N", "",
>  	"R_PRSNT_EDSFF2_N", "",
>  	"R_PRSNT_EDSFF3_N", "",
> -	"HPM_EDSFF_PG", "",
> +	"EDSFF_BOOT_FLT", "",

[Severity: Medium]
Are we intentionally leaving the old "PG" naming scheme in EVT1 hardware?

If userspace daemons depend on the updated "FLT" SGPIO line names for EDSFF
power status monitoring, they might fail to find these lines on EVT1 hardwa=
re
and break power management or monitoring logic.

For example, arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
still contains this legacy name under sgpiom0:

    "HPM_EDSFF_PG", "",

Should this update be applied to the EVT1 devicetree as well?

>  	"", "",
>  	"", "FM_BMC_READY_PLD",

[ ... ]

> @@ -416,10 +416,10 @@ &sgpiom0 {
>  	"PDB_ALERT_R_N", "",
> =20
>  	/* L0-L7 line 176-191 */
> -	"L_EDSFF0_PG", "",
> -	"L_EDSFF1_PG", "",
> -	"R_EDSFF2_PG", "",
> -	"R_EDSFF3_PG", "",
> +	"L_EDSFF0_FLT", "",
> +	"L_EDSFF1_FLT", "",
> +	"R_EDSFF2_FLT", "",
> +	"R_EDSFF3_FLT", "",

[Severity: Medium]
Similarly, arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
still contains these "PG" lines under sgpiom0:

    "L_EDSFF0_PG", "", "L_EDSFF1_PG", "",
    "R_EDSFF2_PG", "", "R_EDSFF3_PG", "",

Is EVT1 deprecated, or did it miss this SGPIO line rename?

>  	"HPM_CPLD_HEART_BIT", "",
>  	"RBB_CPLD_HEART_BIT", "",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-anacapa-de=
vlop-phase-devicetree-v9-0-f08aa0d7182d@gmail.com?part=3D14
