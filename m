Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825116;
	b=DzVv3zNXLenx/hiBZxGElQQT92zTbLgwC0dBDFqkGU4yTvQSDT9lmNDGU3AnXlqwPIKh
	 N59r9hHv4C2RELYHZ/ex9jvFWwVmEHrjUUiwf4crklxOM4jaehHdUS3q503A7SejXg+lD
	 cceVMk7AXstSI1SzXhjl4MAl1rJnPNti1O2dmWgjQSU1ChuCKMwMdA11BqXRRAOdFsea+
	 1VWyZXF64zJ1mp8OGdPq4W8LUpwn26ah4iVXxOBgTN7Umm7h1iZZHTunLDj+wZRK3Z4R6
	 w27WCjxi/I9yRJjMM2GB0BV467mYTC4a6SOfFbKC5mWU9DyE+2N8Wn+ny7KHkD2MBVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825116;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=66S9NgeMpWKkrQfL9aTNy4xRaqH133tIT5N+mjknsdw=;
	b=XqjHjXDXpgoyCCjukOz7fJ8mUYBu+/FLULsImHDGg6RoidJlGOX2fdkAL7K0rLqsqNBn
	 J2Mg/6pFlygOKAkdYYu89qlnowaWxVUGFyGOaNeNORscWXJNfBd/HOJrneXyCaM9jgast
	 Wz45qUTGsCMgeIUPMQB5aYrKB9WbfrNWljfI23h22b07ALdAWTP88SN4pX2hJb+ehBHht
	 fTOfLC6H7RFrAFn+OsLBM83QYmEWusr2DmQc+s/YYD0ZsK0dtO/Q9WHM5CcpxDzCvGLTy
	 PrVuyWK/gEWubNLfOI/mqZRyN8JPasXg1VQMw2hHzlis0q06pTcmbBWoDX4JMGLVz7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJMHPMhZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83823606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJMHPMhZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7C61F000C4;
	Mon, 16 Nov 2026 10:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825116;
	bh=66S9NgeMpWKkrQfL9aTNy4xRaqH133tIT5N+mjknsdw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJMHPMhZMv3hRhwwJ9MU0JxsyypDlP2pavy9dMbKmxbLyzPidUoa799HCkSaoVVoU
	 oTRDq7eDXtycedd/i6qTrHg6vbBsVOydJh8994U4OcOgK3+d2CKPIQKFLFMYlwUrCc
	 TvCcpuakF6k+ez7kbTq46EKrytg7qrR/RlvKZvRsx5cG8C8HdYve1F4gisvy7iSS2M
	 E/is4S/qLVA3EvqFlXt+8tdQnkTljF7dIUSddRdftpAATjF+wdBD4pZdmfCjqsrCt6
	 WGbjb95MqAOPSl4LOdbvWx4VJHfwkyC53JCi1uYP2MhDQPWZlVu1chZj7X3UtojtVN
	 LPLYmieJ1MUIQ==
Message-ID: <sashiko-outbox-216743@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: ux500: Remove DB8500 EPOD regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-ux500-powerdomain-dts-v1-3-e0f4459c3ab1@kernel.org>
References: <20261116-ux500-powerdomain-dts-v1-0-e0f4459c3ab1@kernel.org>
 <20261116-ux500-powerdomain-dts-v1-3-e0f4459c3ab1@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 10:31:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ARM: dts: ux500: msp nodes violate stericsson,ux500-msp-i2s.yaml
  schema
--

commit e90c23c3e45f366c116a480287c57c3050b7236b
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: ux500: Remove DB8500 EPOD regulators

This commit removes the db8500-prcmu-regulators node and drops the
associated regulator supply properties from the MSP, GPU, and MCDE nodes
in ste-dbx5x0.dtsi.

> diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/=
ste-dbx5x0.dtsi
> index b3b3cec696561..967444e4a618a 100644
> --- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
> +++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi

[ ... ]

> @@ -1118,8 +1027,6 @@ msp0: msp@80123000 {
>  			#sound-dai-cells =3D <0>;
>  			reg =3D <0x80123000 0x1000>;
>  			interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> -			/* TODO: delete and replace with power-domain handling */
> -			v-ape-supply =3D <&db8500_vape_reg>;
>  			power-domains =3D <&pm_domains DOMAIN_VAPE>;

[Severity: Low]
Does dropping v-ape-supply from msp0 through msp3 break dtbs_check against
Documentation/devicetree/bindings/sound/stericsson,ux500-msp-i2s.yaml?
That schema still lists v-ape-supply under required and sets
unevaluatedProperties: false without documenting power-domains.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-ux500-powe=
rdomain-dts-v1-0-e0f4459c3ab1@kernel.org?part=3D3
