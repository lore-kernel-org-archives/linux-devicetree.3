Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1454A2E2286
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 17:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791740178; cv=none; b=EWn63P5B0dX5bEnAokO55VvXmLXarK/DErIql6TzLKYOxZA5aZPU0Vopqad6dgN/EFBKsolJlqllqRjN7dK7zKnvfXY/PQ+8Wwri6B4UXp5ov90DdTap/5MPorXOd3djfFjuQHo5Fydcs0825kzfCAvxZCW+vGdDpbyR4Ab9g+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791740178; c=relaxed/simple;
	bh=n54LriDgz000hxZWtRYayI5/jAYpVr9SwEKmP/Ki2HY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=d3oTDM8lUPU8DZcCullQO7tSi2xzi8jUeJ17463dBbzCwaBet8kYwc4mGzV1pa+ULB6J/4Di50IjvZqV0d7j6ShvxYASNOUffxLNB27+cbis9MUSH+vgmtlxLPG8FLZQX/AUb32NSfeDkoLqPCyY4jebPVtAfgl1THf9p2Pr9hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1PYp7k7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1PYp7k7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D291F0089B;
	Sun, 11 Oct 2026 17:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791740176;
	bh=+jAI4Uwu+5jXMaXbGmLEH+L8QlCnPTSZ09nYSvJBG8s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G1PYp7k7zBhkYO2oXxagbv0+FMTDuMtxhe+6xrO1lqU8SuSSQAglC/DNtXFku8gme
	 DUhUr9sGV9M2H6LDPqFL4CS7ot5D+WZZdtfRNx+mwYmrTEnEpdMym7iZZvu7ktbV1i
	 UFZ4WCpJOnQ1lZvcqZYApE7aZLFnbBvFRr3CF5X+IBWW8uAhCpxDlacOa48R35ynkw
	 mdoUxFT1k4w5oRgqQMFM8UHV+u0opThbXV21Rh+cS1byNQiGB5aLavr4A+nc0ubuiK
	 aRQAw0qg93yauImPw0HiVASdN9imQ1bkZIOMBd7dfslZIJzxa9VwRdR9+9sTA+0th4
	 MUpzz2Kvacu2g==
Message-ID: <sashiko-outbox-167352@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261011-dell-xps-9345-ec-v5-3-2ab1258b84c1@vinarskis.com>
References: <20261011-dell-xps-9345-ec-v5-0-2ab1258b84c1@vinarskis.com>
 <20261011-dell-xps-9345-ec-v5-3-2ab1258b84c1@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 17:36:15 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dts: duplicate gpio-reserved-ranges entry for GPIO 65 in tlmm node
- [Low] dts: subnodes of pmk8550_vadc are not sorted alphanumerically by un=
it address
--

commit b2ae087bb3abb0aa89d56fa01c7818e7b495008d
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC

This commit describes the embedded controller, its interrupt and required
thermal zones. It also adds the EC's reset GPIO to the reserved range to
prevent device operation from triggering an unrecoverable state.

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch=
/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index f48e6bc350063..6d99dc47eb163 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts

[ ... ]

> +&pmk8550_vadc {
> +	sys_therm0: channel@14c {
> +		reg =3D <ADC5_GEN3_AMUX3_GPIO_100K_PU(1)>;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,ratiometric;
> +		label =3D "lpddr5_therm";
> +	};
> +
> +	sys_therm1: channel@14d {
> +		reg =3D <ADC5_GEN3_AMUX4_GPIO_100K_PU(1)>;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,ratiometric;
> +		label =3D "usb_charger_left_therm";
> +	};
> +
> +	sys_therm2: channel@144 {
> +		reg =3D <ADC5_GEN3_AMUX1_THM_100K_PU(1)>;

[Severity: Low]
Are these subnodes ordered correctly? The newly added channel@... subnodes
under &pmk8550_vadc are sorted sequentially by their labels (sys_therm0,
sys_therm1, sys_therm2, etc.) rather than by their unit addresses.

As a result, the unit addresses appear out of order (@14c, @14d, @144).
Standard Devicetree style guidelines strictly require that child nodes be
sorted alphanumerically by their unit address.

[ ... ]

>  &tlmm {
>  	gpio-reserved-ranges =3D <44 4>,  /* SPI11 (TPM) */
> +			       <65 1>,  /* EC Reset, accessible but yields system unusable */
>  			       <76 4>,  /* SPI19 (TZ Protected) */
>  			       <65 1>, /* EC reset */
>  			       <238 1>; /* UFS Reset */

[Severity: Low]
Is the duplicate <65 1> entry here intentional? The patch adds a <65 1> ent=
ry
for the EC Reset pin to the gpio-reserved-ranges array in the &tlmm node,
but an identical <65 1> entry for the EC reset is already present
immediately after the <76 4> entry.

This creates a duplicate, overlapping reserved range in the Devicetree
configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-dell-xps-9=
345-ec-v5-0-2ab1258b84c1@vinarskis.com?part=3D3
