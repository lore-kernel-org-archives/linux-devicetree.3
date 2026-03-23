Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8317250BEC;
	Mon, 23 Mar 2026 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278448; cv=none; b=WZbsc3G5ECE7+V0Dgr4kI86bVXlPtHKsxTFDA+uyrKSS3cjLuqpoeAaxHnMqAmla2iuoserdzsaTC3lQLUrVARCSG3M9Tz0HLIbOt5B5QXaJB39fgaWQTlSGlWUbJjkmhuCJ8J0DF3mUyzlxUnezNJV0yZ0TJAAAoQnIzkqT2OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278448; c=relaxed/simple;
	bh=Sn+iziREEqQDWP4l42ZYHE8YzQzkg+xncuXN3me7X5o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Uye1v+xMKcg6RVSsSFhjrmBHRMLMwMdq11tftNhC/zt6+hvkFXBhAxYRKsXUYLmK+wfs8qhjcKIZyTbIov/kx0WkwgfwjwVEJmWpp5yBQHM1izxg1POTHnGKhlT4d86HPR4SyHR4kYkCoZREhxLk6zrEDna+rYpNVCRK0eUJDKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pddg8evV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pddg8evV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0CD90C58081;
	Mon, 23 Mar 2026 15:07:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAA495FEF6;
	Mon, 23 Mar 2026 15:07:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B553E10450FC6;
	Mon, 23 Mar 2026 16:07:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774278444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Gqyh445RFNhCMpOGQ+ZUm8h8QVvK3gHOuBtceouwcw=;
	b=pddg8evVZ/u+oX5Z3HmeCu6mTDmmsG29OJWSy/T0XDbuYnmjBZLPs9dQoicD8wTQEK41OY
	jHJW7mYb14w4rBY+u2mBTdAEJjCRj2Fya6QLbH9wxp2MP40VodcnojcQV20wkC3AjC/qDz
	TX7gt4mc7IWyc7oHN4/qY2OAf35HyqP8St/OCjjJFCyfFTDE+ZIy3GygwNeGiZIJ+fT1fr
	3UnNKIWiTjO2JjR/VhVc0LZ33mC3tM4cG1CxcvQcAMW3RxDJfgf1pY+ejG2GGC4a3fZGPA
	OIauvxitAsKvf+KEGtEAG7hNsY/Oa4ksa9VS8dL06jyIhYeBk8uvilHnAeQcLw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v3] arm64: dts: marvell: armada-37xx: drop
 'marvell,usb-misc-reg' from USB host nodes
In-Reply-To: <20260319-armada-37xx-drop-usb-misc-reg-v3-1-8585c8a0a8ba@gmail.com>
References: <20260319-armada-37xx-drop-usb-misc-reg-v3-1-8585c8a0a8ba@gmail.com>
Date: Mon, 23 Mar 2026 16:07:19 +0100
Message-ID: <87tsu64mag.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Gabor Juhos <j4g8y7@gmail.com> writes:

> The 'marvell,usb-misc-reg' property is present both in the EHCI and
> in the XHCI USB host device nodes, however it is not documented. Thus
> 'make dtbs_check' produces warnings like these:
>
>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell,arm=
ada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-re=
g' was unexpected)
>           from schema $id: http://devicetree.org/schemas/usb/generic-xhci=
.yaml
>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,arm=
ada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-r=
eg' was unexpected)
>           from schema $id: http://devicetree.org/schemas/usb/generic-ehci=
.yaml
>
> Apart from the fact that the properties are not documented, those are
> not even used by any USB host drivers. Due to this, drop the properties
> in order to get rid of the warnings.
>
> Note:
>
> With the same name, there is a property used for the Armada 3700 USB
> UTMI PHYs of which dt-bindings documentation has been added in commit
> e60958699afa ("dt-bindings: phy: mvebu-utmi: add UTMI PHY bindings").
>
> Additionally, the property is handled by the 'phy-mvebu-a3700-utmi'
> driver since commit cc8b7a0ae866 ("phy: add A3700 UTMI PHY driver").
>
> When the nodes of the UTMI PHYs has been added to the SoC dtsi by
> commit 05d168a56fae ("arm64: dts: marvell: armada-37xx: declare USB2
> UTMI PHYs"), the properties has been added to the USB host controller
> nodes also. According to the commit message this was unintentional,
> however in regard to the USB hosts, neither the respective documentation,
> nor driver support has been added into the tree since that.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>


Applied on mvebu/dt64

Thanks,

Gregory


> ---
> Changes in v3:
>   - s/intentional/unintentional/
>   - add Reviewed-by tag from Miquel
>   - Link to v2: https://lore.kernel.org/r/20260317-armada-37xx-drop-usb-m=
isc-reg-v2-1-ddff72114414@gmail.com
>
> Changes in v2:
>   - add Reviewed-by tag from Andrew
>   - change subject and reword commit message
>   - Link to v1: https://lore.kernel.org/r/20260304-armada-37xx-drop-usb-m=
isc-reg-v1-1-800c1b746b7a@gmail.com
> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/bo=
ot/dts/marvell/armada-37xx.dtsi
> index ea1824f5321fbb32fc4373c08a0d94bca1dc793b..44c47409f8793ae1266303607=
812ef481edbfbc5 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -369,7 +369,6 @@ usb3: usb@58000 {
>  				compatible =3D "marvell,armada3700-xhci",
>  				"generic-xhci";
>  				reg =3D <0x58000 0x4000>;
> -				marvell,usb-misc-reg =3D <&usb32_syscon>;
>  				interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&sb_periph_clk 12>;
>  				phys =3D <&comphy0 0>, <&usb2_utmi_otg_phy>;
> @@ -393,7 +392,6 @@ usb32_syscon: system-controller@5d800 {
>  			usb2: usb@5e000 {
>  				compatible =3D "marvell,armada-3700-ehci";
>  				reg =3D <0x5e000 0x1000>;
> -				marvell,usb-misc-reg =3D <&usb2_syscon>;
>  				interrupts =3D <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
>  				phys =3D <&usb2_utmi_host_phy>;
>  				phy-names =3D "usb";
>
> ---
> base-commit: 98226a594f313442fcba38cefc1df0b6c1691c7e
> change-id: 20260304-armada-37xx-drop-usb-misc-reg-e9635498cae6
>
> Best regards,
> --=20
> Gabor Juhos <j4g8y7@gmail.com>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
