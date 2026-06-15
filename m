Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D604314D34
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524948; cv=none; b=LXa/ejLdChD0I3KsLg2BCoaJ2tgTCg9VupbH3PDI37mbXzouwVH9BDmGTbaYHseYx5fI/9tAgPTEg8BHIUvJDOqPLjHQE4ZmtuaSKjSVCTyz+oZlpJhgiiY4yaPKi3TC3jMZpRMGFqBNS995nsD6kpYD3Prp4GEsIhxEbK/C91c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524948; c=relaxed/simple;
	bh=JabcIFDWHCK1PsNFIrYquqiojPWEDu1RpMqYHQd2zhg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RU9ZoD7KkwZ69I9ZfStqrvHNYNz7fMOhd/x5j/EY1kOm55xpYqgbw9n2wHZk7fSCBasMj2gDRO2zLIk0pFkkuOS3DWTd14sQ7zLeYHYU5J6vApur/S70NQW8NxAFLcKHtkwkeNzG2Xask3ff/8jjdtgk6p2KirPvs4aS/wwcNtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rkq3wNn9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rkq3wNn9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17EC1F000E9;
	Mon, 15 Jun 2026 12:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781524946;
	bh=RmDX/M7xnJb4C3pQTkG+hyxAiz9urY8oyK+fzzAo/RA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rkq3wNn9ED9SQcv0kIqL0iUYyz6rWSi1qFqbdUPyWzfDP2nEyrimGcn+Pa1y6sQoj
	 vdmSctfkT9rbk14f6gMyiIuPt4RuGXn1GNAThE75bIbGqMdSxSsZ5u9YrtRJJBdviO
	 ygbO7UBTIH00LcrOuqomMhM+0l5v+U7pPzeZVFA2ECZtuTZ4L+jIAyCnDXEew8s0Rv
	 THII9EtFQN2u7J9pehTo7SbH5PERRxJ5SyV0AuOG0XHJhRzeQb77X3K3vHxC9P6J6t
	 j/nlYa/H0u03Tjs5GDyT9VTH2gqfgYcj4LLncNaXcv3Fn80SJquZghuot5H3MIiWN9
	 SVzjIS7lST11Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: Add LCDC overlays for
 RZ/T2H and RZ/N2H EVKs with ADV7513
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260615115455.1412098-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 12:02:26 +0000
Message-Id: <20260615120226.A17EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Mismatch between commit message and implementation regarding LED=
9.
- [Low] Typo in the overlay header comment swapping I2C1 SDA and SCL pin ma=
ppings.
--

commit ab4b9f4219de83b53cbe289e906c4c7c0bf82541
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with ADV7=
513

Add DT overlay support enabling the DU/LCDC pipeline on the RZ/T2H and RZ/N=
2H
evaluation kits.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso =
b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
> @@ -0,0 +1,50 @@
[ ... ]
> +/*
> + * RZ/N2H LCDC configuration:
> + * ----------------------------------------------------------
> + * Function        Pin     SW Setting
> + * ----------------------------------------------------------
> + * LCDC_DATG0     P11_0, DSW12[3]: ON, DSW12[4]: OFF
> + * LCDC_DATG3     P14_3, DSW18[5]: OFF, DSW18[6]: ON
> + * LCDC_DATG6     P14_6, DSW15[8]: ON, DSW15[9]: OFF, DSW15[10]: OFF
> + * LCDC_DATB2     P18_1, DSW18[9]: OFF, DSW18[10]: ON
> + * I2C_SDA1       P03_3, DSW7[1]: ON, DSW7[2]: OFF
> + * I2C_SCL1       P03_4, DSW7[3]: ON, DSW7[4]: OFF
> + * ------------------------------------------------
> + */

[Severity: Low]
This isn't a bug, but is there a typo in the I2C1 pin mappings documented
here?  The base hardware pinmux assigns SCL to P03_3 and SDA to P03_4, which
suggests these comments have SDA and SCL swapped.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arc=
h/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
[ ... ]
> -#if LED9
>  		led-9 {
> +#if LED9
>  			/*
>  			 * USER_LED1
>  			 * DSW15-5: OFF, DSW15-6: ON
> @@ -185,8 +187,10 @@ led-9 {
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			function =3D LED_FUNCTION_DEBUG;
>  			function-enumerator =3D <1>;
> -		};
> +#else
> +			status =3D "disabled";
>  #endif
> +		};

[Severity: Medium]
Is this base DTS conditional for led-9 actually utilized by the overlay?

The commit message states that moving this conditional allows the LCDC
overlay to reference and disable LED9 when its pin is reassigned to display
functions. However, the overlay (r9a09g087m44-evk-cn20-lcdc.dtso) does not
reference or disable led-9. Additionally, the display functions do not
reassign LED9's pin (P14_7) since LCDC_DATG7 uses P17_6.

Does the commit message need updating to match the implementation, or should
led-9 be disabled in the overlay?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615115455.1412=
098-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D5
