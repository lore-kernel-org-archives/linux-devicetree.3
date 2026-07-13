Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31AF30AACD
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940864; cv=none; b=uAXu2kDp3e+mAMb/AqKvOV3/HiEBUDYTRL4C+To+EmehfSHo06tiO0BMMwfBVOKMocSrzYSzqcC6KkQzPjnNXyJZu95Ke+UqzQYeLJOIZHjPyAMp3Lg4MSGBBsbA6Hx7lx+6hr6YQPNZl0vL0MKkwqbdyixdeCt4yIkw/oSWxG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940864; c=relaxed/simple;
	bh=7nX9DM7G5kX8iz7Wd8cgPhTaFNeHJDgBhY1EQrpAAno=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NxPT79XyZo3ZEq78EX3DpcnJjvvO+NfzeKNOlg0C72+JHRoq1sACI4fDhRsp+0RW7TFac8E79rVPGWZFfSQLVbc2xSxvy5uSPThc0U1sZWgLAVFU0YpTYnV6IlNa9meRFCvNr7Sn10yfh1Pg10tCh1rZ7aS8deKV3lMdbDzq8n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErdDRiIy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErdDRiIy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2348B1F000E9;
	Mon, 13 Jul 2026 11:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783940863;
	bh=VNwibY/K2KQYxTvlrD7WBiXc6oby0lC/w73kbJExj8s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ErdDRiIy+WlEsFuqLKgvl5fxctqiPw1BL0AjkHcoucF/83W1sGSleTpoO9RelPDeI
	 7vTwuehuRatJndYkM2MuDZPU0Ktykkoyy0NxLiq1qSjzS9XWT1g30Pe2MakRaM5Etp
	 0Aq16c9IeujTX/DYmwjzsOU8n+auA3vmWWuW7eMyLLC2zWRFuK7tWkIISQslwZDa3X
	 ai3mwvbcHDStn/EyeYIXCMa4yJeFKx3wu/5ydPpiGexzcanq78649a9eBAessnw6nk
	 YQa9Wx0BJ64OAfYB4zdD7iVj4FF4+jzFZ3ehO51UjzwMGnC1Y3LK7kxouEfOu6gaKU
	 tzWR1Dbt9Qatg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] ARM: dts: mstar: unitv2: Link cpu to core regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Palmer" <daniel@thingy.jp>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713105950.1346962-5-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
 <20260713105950.1346962-5-daniel@thingy.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 11:07:42 +0000
Message-Id: <20260713110743.2348B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete hardware description: `cpu-supply` is omitted for `cpu1`=
 on a dual-core SoC.
--

--- Patch [4]: [PATCH 4/8] ARM: dts: mstar: unitv2: Link cpu to core regula=
tor ---
commit 15b5fb30c26091d181dfb33beb3faccbf6865c52
Author: Daniel Palmer <daniel@0x0f.com>

ARM: dts: mstar: unitv2: Link cpu to core regulator

This commit adds a reference to the core voltage regulator as the CPU
supply, ensuring the regulator is correctly described as feeding the CPU.

> diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.=
dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
> --- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
> +++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts

[ ... ]

> @@ -85,6 +85,10 @@ reg_vcc_wifi: regulator-vcc-wifi {
>  	};
>  };
> =20
> +&cpu0 {
> +	cpu-supply =3D <&reg_vcc_core>;
> +};
> +

[Severity: Low]
Since the SSD202D is a dual-core SoC and both Cortex-A7 cores share the same
physical voltage domain fed by reg_vcc_core, should there also be a matching
cpu-supply property added for &cpu1?

While the cpufreq-dt driver might infer the shared supply via the opp-shared
property when processing cpu0, would adding it for cpu1 provide a more
complete OS-agnostic hardware description for the device tree?

>  &pm_uart {
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713105950.1346=
962-1-daniel@thingy.jp?part=3D4
