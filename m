Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4243E47F2EB
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629435; cv=none; b=BhxqWRDEGopghJgcqxKpkyHLzftUnJEjdSVKHBV8Zm/yeuz0qvLpctLo4z3osQK83Vq+li3+2hX9kbpTq2IzlnFGz07D7bPstr+0XjiWuXn7wTJ8nCd0zjqATeYoY0Jj3tDJEHBqOmhl3SX8IbUP7i52ma1xxXB2r1jMnb/KIuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629435; c=relaxed/simple;
	bh=dourCACK8HPHCFUAAp6vJdhanLob1Kdld8wYHHBL6Jc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E6lcM/Fy1IDBObri73SJrDcAMRThirw4dmYOo6+wtPL+rBUalwu0aap/Ut1x7nFexqr4eEaL9PHskGHGY9u7p103nyX6GWdpH8sP13D5OhD2xERBVhlQ5EvOOx0/AjEPCUpiCPXgHgLdP4aDLSjpHCCgUGLYiUFikUbcPgrWQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFb3s6CA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFb3s6CA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C976D1F01559;
	Tue, 21 Jul 2026 10:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629421;
	bh=7SmzI6AewH/FBIKaC21ndRHM6R6dJUngCdHI6mYH+04=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AFb3s6CATbN/vgq2Mot+JnGYedRdEMLsHzq8UxsqlylgNosqokqa5/TKhU1fd2lUE
	 VL8g8e6BAhzB7qaP7FetEIaCdk3jSj67IX0Q9YjoyD5QGA28pDHv/n1lax/z5IbjyP
	 uqfo6Jv6tR0DfgmCj4qxFh+63LfyCTwxF7luxi729uNotMFx9zt4kVExhHbOUrhoKG
	 F3Rb6D2h4YqMXKRD26JywWpJ11zqOJMzD1HRNEWqWPkmRq7+pRyIYbNJcA7fWVcu82
	 8Ia6p/IaslqbE4ZDF1XjZh9qnmRn3VXmntHoYRzRKQditPu31JgIE1HrEOrpyZlx1w
	 lVEI+5F6+uKiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/10] ARM: tegra: tf701t: Configure UART-B line used
 for GPS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721101059.451699-10-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-10-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:23:40 +0000
Message-Id: <20260721102340.C976D1F01559@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Undocumented compatible string `nvidia,tegra114-hsuart`.
--

--- Patch [9]: [PATCH v2 09/10] ARM: tegra: tf701t: Configure UART-B line u=
sed for GPS ---
commit de78632e3f3da744e644c7f7a6023ab3e302145b
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: tf701t: Configure UART-B line used for GPS

This commit configures the UART-B line on the Tegra114 Asus TF701T device
to use the high-speed UART (hsuart) driver. This change is necessary
because the GPS device is linked to this specific serial port.

> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index 32d55c18c7446..0d182fa5c1af2 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -1283,6 +1283,11 @@ drive-gma {
>  	};
> =20
>  	serial@70006040 {
> +		compatible =3D "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart";

[Severity: Low]
Is it expected for "nvidia,tegra114-hsuart" to be undocumented in the
device tree bindings?

Using this compatible string here will trigger a dtbs_check warning during
build validation since it is missing from the YAML binding located at
Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.yaml.

> +		reset-names =3D "serial";
> +		/delete-property/ reg-shift;
> +		status =3D "okay";
> +
>  		/* GPS */
>  	};
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721101059.4516=
99-1-clamor95@gmail.com?part=3D9
