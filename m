Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD57036A01D
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238843; cv=none; b=TjsQkJU+/ujI1pLeCdsC27vEX/yT1Qqcs0ELyLwgjpZ6jWic8kRXJO5eTSSWknDVBTnd83+48NCDpAb/UYtyONGpRO0ZWdsUP+1ewzRyrc3R7kTM4XT8Uj10bc2PjzRmgiAfPo0sDVnbYSWaPOb7ZWU2LcDqcDfff7TuNg5ThAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238843; c=relaxed/simple;
	bh=3yV6WB1FTwEIsZNEk8WeV/poGWLRERLovKTBixzA9xk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FniGhmQG5j9fCsmIfXMnmhUe6+AvRJ71WYK9u4kWCPE/xWOLfmS6Wpzq0DHy8Jkm9KrBE3nLpQogpNP7eWf8boYbah/akS/6OcLe4TdolIsGiLLiofX5OcBEwzKxFLWbI2KmAtPNmH0ezZA5JX2uF5V87UHv3TYdnK1bh8nqnTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3bgbpNv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3bgbpNv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2C51F000E9;
	Sun,  5 Jul 2026 08:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783238840;
	bh=cEVYz5Nhmqec5ecwTr1IhTC6lpM1heAqJayBhgPgxHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R3bgbpNvwSMBtvRVdHnCaMpeI96FDxvkpPaqnAdMlL6AtNKxtfFJin+JxkswZ2vMC
	 U4IbIWF4n/y3q8629oXxBg71/xvni/iTZxuTrvHQTkiGaSj1cASHPbIo9yo9OTEOSx
	 vcf5VjolCbUBUNlt22JizVHAbGQCBaAGsjHBUZJvD5UGdHSJW974bY60X4ukmKV0on
	 6CCRPe77QJ+Dy4RSK+r9276ylGpRO2ifoYc66Cvac1NQmNTqO+BuKoz6qo18skjCBH
	 +JpAqr6gRW9qqKA3U+M+9rbrjIsYPL0M/NB0Vkjcql1OAj6w9H2AtML93e68sx/lQ4
	 /MQrpfs8XfIwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] ARM: dts: ti: cpcap-mapphone: use charger
 detection interrupt for CPCAP USB PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260705075809.1793784-4-ivo.g.dimitrov.75@gmail.com>
References: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
 <20260705075809.1793784-4-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 08:07:19 +0000
Message-Id: <20260705080720.5C2C51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree patch appends the `chrg_det` interrupt to the en=
d of the arrays, violating the strict positional ordering defined in the `m=
otorola,cpcap-usb-phy.yaml` schema and breaking `make dtbs_check` validatio=
n.
--

commit cf71076312e1b822a677c10b23613d38d2cce1b0
Author: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

ARM: dts: ti: cpcap-mapphone: use charger detection interrupt for CPCAP USB=
 PHY

Update the CPCAP USB PHY interrupt mapping to use the charger
detection interrupt and corresponding "chrg_det" interrupt name.
This matches the driver and binding updates for DCP detection.

> diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arc=
h/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> --- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> @@ -106,11 +106,13 @@ cpcap_usb2_phy: phy {
>  			interrupts-extended =3D
>  				<&cpcap 15 0>, <&cpcap 14 0>, <&cpcap 28 0>,
>  				<&cpcap 19 0>, <&cpcap 18 0>, <&cpcap 17 0>,
> -				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>;
> +				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>,
> +				<&cpcap 13 0>;
>  			interrupt-names =3D
>  				"id_ground", "id_float", "se0conn",
>  				"vbusvld", "sessvld", "sessend",
> -				"se1", "dm", "dp";
> +				"se1", "dm", "dp",
> +				"chrg_det";

[Severity: Medium]
Will this order of interrupt-names cause a failure during make dtbs_check?

The device tree binding schema motorola,cpcap-usb-phy.yaml expects chrg_det
to appear before dm and dp in the items list.

While the driver uses platform_get_irq_byname() so the runtime behavior wor=
ks
regardless of order, appending chrg_det to the end of the array here violat=
es
the positional ordering defined in the schema and breaks validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705075809.1793=
784-1-ivo.g.dimitrov.75@gmail.com?part=3D3
