Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633DA339872
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 02:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887067; cv=none; b=pIDFzHauRnF+WCgSsd/Y4q7Qpv3YVL24sRP6pHE9dP+YRI4MEhG4P3e/+CYT8fgF6iVw5suFn1kpX2Q3U0AkzCAbflg9yJajTtPnTGfqYjvo972/XyTnPmsgwcPjpC4mLuWBK8ao134gDHiDqEc1h9E5tdA3K7T+AvdUsPoF7Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887067; c=relaxed/simple;
	bh=+WTyU7SsSFBGbdcafbrDyG/8J4N4+jcATJOeU0I+Skc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NvQWjTCj4N2SDm/grahZFclck0DYV+Krs1y2c3mI+ZN8CTEN2+tW4lmxGJcq7cC+zeLCAwEYwfzW2OP2pe87QwGTueWpOcJJth2EjUkf4ww4ztuHrlWw9V5tBNFdlaaw5h65MIashtvz2ykyVodBl2exBBYbtxcb9eOXXZ8Ivew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pm+GNI+t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pm+GNI+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9761F00893;
	Mon,  8 Jun 2026 02:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780887066;
	bh=6ea7PXj6OU8kge9vWMJ2uS9AGPhSKcYWsd76cJ0Bd18=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pm+GNI+t4BTT6Yp/FFRoB7zSoK5zZ8HOwBr/fmTF9u6DrsBuKGGojidW0W0DacRS7
	 lzBlz86zn44ktk4iB8WIBM+TEAXUPlpCykjGUhtMnzNVuMmqP1xvsUsKb3TpO7sjAy
	 d3WFVXu2bcDXKeEICBrlCtQfWY9ZA8caM8dW3DjCaJJ0xbmU8m60dvWZm8sU6CQiQM
	 CB5ZqpRZ7yttOVHARMuKxHBUssWBYT6v4nva8r7tnfVo9mkQNqQTtI1zMKRSU+Ts6y
	 sCgq0d4wH3UDtf3TmyZCmw3QC64LA3kIj9375JMhopeG0M9y621XLhhkCqDPGmi4eY
	 KcMC92kqI5OKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2
 BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608-ventura2_initial_dts-v5-2-37ee5bcf58b6@gmail.com>
References: <20260608-ventura2_initial_dts-v5-2-37ee5bcf58b6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 02:51:05 +0000
Message-Id: <20260608025105.BA9761F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] `io_expander8` erroneously requests the same interrupt line (0) as=
 `io_expander0` on the `io_expander7` interrupt controller.
- [Low] Unit addresses for DAC nodes in `&i2c6` contain leading zeros.
- [Low] Unnecessary `#address-cells` and `#size-cells` properties in the `a=
dc@48` node.
--

commit d9f91d3abcec0ae2dcf56a7a83ec66a8e2eb98b9
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

Add linux device tree entry related to the Meta(Facebook) rmc-node.
The system use an AT2600 BMC. This node is named "ventura2".

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts

[ ... ]

> +&i2c6 {
> +	status =3D "okay";
> +
> +	dac@0c {
> +		reg =3D <0x0c>;

[Severity: Low]
Does this leading zero in the unit address trigger device tree compiler
warnings? Should these nodes be written as dac@c, dac@e, and dac@f instead?

> +		compatible =3D "adi,ad5612";
> +		vcc-supply =3D <&p5v_dac_aux>;
> +	};

[ ... ]

> +	io_expander0: gpio@20 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		interrupt-parent =3D <&io_expander7>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;

[ ... ]

> +	io_expander8: gpio@24 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x24>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		interrupt-parent =3D <&io_expander7>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;

[Severity: High]
Will this cause an interrupt conflict between io_expander8 and io_expander0?
Both nodes appear to request interrupt index 0 on the io_expander7 parent,
which might prevent the kernel from reliably demultiplexing the source of
the interrupt.

> +
> +		gpio-line-names =3D

[ ... ]

> +	adc@48 {
> +		compatible =3D "ti,ads1015";
> +		reg =3D <0x48>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;

[Severity: Low]
Are these cell properties necessary here? Since there are no child nodes
defined for this ADC, this will likely trigger a dtc warning about defining
#address-cells without children.

> +	};
> +
> +	temp-sensor@4c {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-ventura2_i=
nitial_dts-v5-0-37ee5bcf58b6@gmail.com?part=3D2
