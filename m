Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D983FD121
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418807; cv=none; b=lZdWzmwKh67TXFJH/X5BYomcfm1Yl3TA+/eVNqOMUtLgWEhIw3SLemD2aNVAEpIhIIQ6D/+ywklbc8Vfg8TrWZIjQruo9f7tSmi4p4B3KFTDEPPHloM+6U5tpF9i7lL036RaacIFfF3h27WwCS+fID6Fm0LiBdLSryicVEW0NuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418807; c=relaxed/simple;
	bh=r4rGDNhZl1lZNbNcsKWplSA6cMU+PQHiX6EJ/uSwqZw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bs4HdWjZMy/+U/M2cgAP+x5XWTTYEp9AGo9IcU8ucgmKfZdDuiMMeqWsDeBmg63SHrPhtOc9aQkuak8DNwr3Ce+boXR75WcodXUMffkV7wNZhIgqkph2fOjPKtO5KFrYOcemwp3Uxo0wi+jXcfmyYEBZevnpfdX+pT/SazoPm98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NofsKjwE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NofsKjwE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09C51F000FF;
	Sat, 26 Sep 2026 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790418799;
	bh=a4Ygu7sOYV13Idki6jOKfdc/8IU5i0YITAD2Bhl7Bt0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NofsKjwE2yPeM9OYx9U1ty1kJGPaCR4wg9rmepa81fPZo2N+gMYwNbxzj6CRAlKLI
	 /6jhH92EjaVtBhgJSJ+IaN0i25MKhocINeZdt5n1ot7mya9HdhLtk9RfMmO+9FfGM2
	 t+X9p9jiIoXC9PxSFoJPXerGKOdAIxFnEwTj2hYecnYRCE8YlXP0ADR84fnPdBDGuM
	 2IVqGONu4x0mCj0sWsm1ZLa1IT2Dt4Pt2XjuGi7V2VngMc2z9KULfJ13tGTJ71x4F/
	 FOioxcVfhWMrObrSSQSdfukbSy6FYEJTTz4+Zit7y0EQpx/sa3KkbjtoWwCQXZQfIH
	 Zfy3WpMNkZ5lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260926-pdx213-upstream-3-v1-5-1609c18b5c1d@erebion.eu>
References: <20260926-pdx213-upstream-3-v1-0-1609c18b5c1d@erebion.eu>
 <20260926-pdx213-upstream-3-v1-5-1609c18b5c1d@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 10:33:18 +0000
Message-Id: <20260926103318.B09C51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: silent pinctrl override failures on UART pins due to missin=
g /delete-property/
--

commit bed8cbd842a7138947e9a27eb01373050b147335
Author: erebion <erebion@erebion.eu>

arm64: dts: qcom: sm6350-lena: Enable Bluetooth
   =20
Configure the required regulators for Bluetooth and enable it on the
Xperia 10 III.

> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 146c7c5c45ea2..cb749cc121abf 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
[ ... ]
> @@ -392,6 +396,40 @@ &qupv3_id_1 {
>  	status =3D "okay";
>  };
> =20
> +/* UART1: HS UART for Bluetooth */
> +&qup_uart1_cts {
> +	/*
> +	 * Configure a bias-bus-hold on CTS to lower power
> +	 * usage when Bluetooth is turned off. Bus hold will
> +	 * maintain a low power state regardless of whether
> +	 * the Bluetooth module drives the pin in either
> +	 * direction or leaves the pin fully unpowered.
> +	 */
> +	bias-bus-hold;
> +};

[Severity: Medium]
Since device tree overlays merge boolean properties rather than replacing t=
hem,
both the new and inherited properties will be present in the node.

The generic pinctrl parser evaluates properties in a fixed order, which cau=
ses
the inherited bias-disable to be evaluated after bias-bus-hold. Does this n=
eed
an explicit /delete-property/ bias-disable; to prevent the bus-hold from
being silently ignored and causing power leakage?

> +
> +&qup_uart1_rts {
> +	/* We'll drive RTS, so no pull */
> +	drive-strength =3D <2>;
> +	bias-disable;
> +};

[Severity: Medium]
Will this silently leave the pull-down enabled?

Similar to the CTS pin above, if the base node has bias-pull-down, merging
bias-disable doesn't remove it. The parser will evaluate the inherited
bias-pull-down after bias-disable, causing the pull to remain active.=20
Should this include /delete-property/ bias-pull-down; to ensure the bias
is actually disabled?

> +
> +&qup_uart1_rx {
> +	/*
> +	 * Configure a pull-up on RX. This is needed to avoid
> +	 * garbage data when the TX pin of the Bluetooth module is
> +	 * in tri-state (module powered off or not driving the
> +	 * signal yet).
> +	 */
> +	bias-pull-up;
> +};
> +
> +&qup_uart1_tx {
> +	/* We'll drive TX, so no pull */
> +	drive-strength =3D <2>;
> +	bias-disable;
> +};

[Severity: Medium]
Does this face the same property merging issue with the inherited pull-up?

If the base node defines bias-pull-up, it will be evaluated after bias-disa=
ble,
silently overriding it. Should this include /delete-property/ bias-pull-up;
to ensure the pin bias is disabled as intended?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-pdx213-ups=
tream-3-v1-0-1609c18b5c1d@erebion.eu?part=3D5
