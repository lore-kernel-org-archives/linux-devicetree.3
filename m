Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447803;
	b=pY/l1XwVqDqDor0s3W1rAHt3L9e6kjerPtbcQLL/NXWT5PNXqk1fp0JepVDthkun+jYE
	 wevwO8e/LrXN0hf9R8ottE0MYV6i3GJMJge+Y4UxU5PbJGFyNZ00nwEj3HX5TTispxknz
	 4Ctx86PJO9PwXLywwV1rVB/pKHMAv3gEaqNA6v52E12fEhORjz0WKvCu+bsAmm+trvQvd
	 kNvSZay+fQZ3EwhWLzUDtjrdauV8HZ59p2ce5Smgg/XXV2VttgGerN4l4/NFqGLibasx5
	 lG5S9Kcu8wgIcIqiiHMRzDUrvs/PkKOnoE8hJR6jrFCNfCNBmlv9+LS3yJlG+NzIJRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447803;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QbbOjKPiP7/Giffknf4o2ffv+gF7BckCe7EiFtp3dVo=;
	b=D2F9ZEn5yGhWgP/ODk0r1RApMzGGB5GEqt0khAfyOKgIP1KIyHNdaOIM6k+MNqp8B2SM
	 vb4z6LXTfSLb8DlLBwYFcLqFRBotnug+GcL+NlRJg2NmMlIeUtvo4zqu1qDOvrBcPIB8A
	 Q2u7FX+o19nHiBjjcN/GEV5aA/NDkBQrw8fcN+ig2dsyNkrOyHAxQprlWD4th7r2fPASy
	 cHROUIbW8cIB/ROYzUQKiIOWcDla0FT8HBgVygGVSbzVwDSiTRPZccAS3U220vixDPlka
	 1BRZrz4pQExfwb92FH6tF/3XaR8QT8tI1vNVbGpHVfjNifcAdOXKcGteotuIo0rOY1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eH3RKYAc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17720606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eH3RKYAc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA231F000C4;
	Mon, 23 Nov 2026 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447802;
	bh=QbbOjKPiP7/Giffknf4o2ffv+gF7BckCe7EiFtp3dVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eH3RKYAc5X3Ypc4KYncOwcJtGnkbF+IcN5wRWv5TespUt3jPGymyAyy6zXKbzSPzA
	 1L9l3nDgGx+6e0P/+oeLyCNwtShuFkZ7UQ7AQ3QJBWTsNMRVCOG52drPSaMYEzZnPh
	 tEJq8C4DRE/H03R0tftP9yxO0S5R3Ko/YxrOl0C7m3JKhe4OLiAedRQ69Kd5DHRNDH
	 76fG/uaI9ZOPozdCTHuwATtEWRRCU3n2QwYSrKNTyxH/t4bSFLeE2XzP58vo44qfFd
	 TlFCqR8tbp9gcrImFxoQ9xCpd0teFOLeRAMu2pYt/yz7K92BEeiaBo1kAsNhSYYlwq
	 1SBZtedp9c4Wg==
Message-ID: <sashiko-outbox-229569@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/4] media: dt-bindings: Add Rockchip JPEG decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123-rockchip-jpegdec-v8-1-3316cd31b043@pengutronix.de>
References: <20261123-rockchip-jpegdec-v8-0-3316cd31b043@pengutronix.de>
 <20261123-rockchip-jpegdec-v8-1-3316cd31b043@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:30:02 +0000
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
- [Low] dt-bindings: media: interrupts listed before clocks in
  rockchip,rk3568-jpegd
--

commit 2a31a76d52b3850d44cf64921cfb2c3b8b1937c3
Author: Sascha Hauer <s.hauer@pengutronix.de>

media: dt-bindings: Add Rockchip JPEG decoder

This commit adds a devicetree binding schema and MAINTAINERS entry for the
Rockchip JPEG hardware decoder on RK3568 and RK3588 SoCs.

> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-jpeg=
d.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
> new file mode 100644
> index 0000000000000..27d85f17922ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
> @@ -0,0 +1,92 @@

[ ... ]

> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: AXI clock
> +      - description: AHB clock
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: ahb

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    video-codec@fdb90000 {
> +        compatible =3D "rockchip,rk3588-jpegd";
> +        reg =3D <0xfdb90000 0x400>;
> +        interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
> +        clock-names =3D "axi", "ahb";
> +        resets =3D <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER=
>;
> +        reset-names =3D "axi", "ahb";
> +        iommus =3D <&jpegd_mmu>;
> +        power-domains =3D <&power RK3588_PD_VDPU>;
> +    };

[Severity: Low]
This isn't a bug, but in devicetree binding schemas interrupts should be
listed after clocks and clock-names in the properties, required, and
examples sections to follow the canonical property ordering.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-rockchip-j=
pegdec-v8-0-3316cd31b043@pengutronix.de?part=3D1
