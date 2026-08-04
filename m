Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240B7418A46
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 06:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785826395; cv=none; b=oZyF3w3pJycbM1kVoOAfNOP+RvO9TgACpvFjQ3h30EOx3bhm0pYb88dbdr56DkIO+IpzUXSl+Evu4iFZvA3BM9J0K4kstXcZgpEufGI6H8/cTKDjt/RTimkioJ2faIDTnHX9+S9K3g55vEezUpPAUhblAXWi+JEY3k3+yz/Yo+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785826395; c=relaxed/simple;
	bh=2J6C6PHVV2N1z/ITLDdmNOZ4Wzl68pzga4v7WHL7h0I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H/kAU0Gdqv7N+i+5Uqt3+pCfh4c0h/8PBLaujpzDDodZXuc25W5QYqB75/1XR8qmVqbdCIbC0u6IP16gZIgLT0frd7blcQKCOq3XNy6TuPQvhHsShRPqHPebS+iJFWOK94DAtbTLQIZCosMduiRzTLgpSgSN3FHaMH04HMGkTfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlydOIWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlydOIWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2811F000E9;
	Tue,  4 Aug 2026 06:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785826394;
	bh=Eik3r6Jp/EP791WgVEk7Onnx0pv8uz4qrUAfqjwlkBw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZlydOIWeR2M+HeMtSIIfm20Qqgr3O0+Qc9pBsJQOv1qAlBnbU2OD+Xjv9gY+4ovvG
	 BoSjqyqgT1w3nEptdbjYkcTF/avxbYThp3fjupMlxgXoS2hmtvto/OBv4Di79rRMUh
	 OL0p1jJ+Q5F3IjA2nP1JBJNhSP4SNwHbamWaZmFuF3Mx4Glx4h5ST98IGL/6e0rqtH
	 sfxx+pJkFECGHbA1GfatMDY3BcCH2vhIGdqYVc049NFWiLLpXmiBRSaGLFtapyrZge
	 QB2oqn8jTGtoGzF9WfrhdBpHUq9heb7soQOIeTiaWYUZ6u8/DcD+zFYDM3SBTBwkoa
	 NDJpHDdN6r7pQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] ARM: dts: qcom: Add Samsung Galaxy S4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre MINETTE" <contact@alex-min.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804-mainline-send-v1-sending-v5-6-149dd4372ac8@alex-min.fr>
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
 <20260804-mainline-send-v1-sending-v5-6-149dd4372ac8@alex-min.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 06:53:13 +0000
Message-Id: <20260804065313.BA2811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `muic` node contains invalid properties `safeout1-supply` and `=
safeout2-supply` which violate the device tree schema.
--

--- Patch [6]: [PATCH v5 6/6] ARM: dts: qcom: Add Samsung Galaxy S4 ---
commit 71d3822fee0022c24c538ba38400b342e55f2d78
Author: Alexandre MINETTE <contact@alex-min.fr>

ARM: dts: qcom: Add Samsung Galaxy S4

This commit adds initial device tree support for the Samsung Galaxy S4 (jfl=
te).
It covers UART, USB peripheral mode, networking, front LED, and physical bu=
ttons.

> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts b/arch=
/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts
> new file mode 100644
> index 0000000000000..75ae19af96e54
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts

[ ... ]

> @@ -115,14 +115,14 @@
> +			interrupts =3D <55 IRQ_TYPE_EDGE_FALLING>;
> +			pinctrl-0 =3D <&muic_int_default_state>;
> +			pinctrl-names =3D "default";
> +
> +			muic: muic {
> +				compatible =3D "maxim,max77693-muic";
> +				safeout1-supply =3D <&esafeout1_reg>;
> +				safeout2-supply =3D <&esafeout2_reg>;

[Severity: Low]
Are safeout1-supply and safeout2-supply supported by the maxim,max77693-muic
device tree binding?

The schema validation fails here because the binding does not define these
properties. This causes a validation failure during make dtbs_check.

> +			};
> +
> +			regulators {
> +				esafeout1_reg: ESAFEOUT1 {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mainline-s=
end-v1-sending-v5-0-149dd4372ac8@alex-min.fr?part=3D6
