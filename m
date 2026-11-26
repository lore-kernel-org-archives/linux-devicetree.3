Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653868;
	b=1OWkCqVhkmt8xdTaSXXENWlV+/ns/A0AdEa7SwoiHeB+7No+5Z7ixZMHdBi3Td2f7pAj
	 PehRGdvdYb9nBkN4ZZQOYLLP2fRTzg6fQmxkSpYxoL7kZYZ6zbNrP3E2D0grCWl+NRuP3
	 V8D02J8XgMYGjRJB5ZE97Sui8KlyAdkcma3dfXoDT1PeqTIXhm/9eTD32fs1pi8FcP8Um
	 9IKWnKk1/GGrPA2+aCl6iTqrYcHQSyV/0eUjRRumpAhVlLBrdp2CYB1PfR1tLN0ecb/dk
	 G+YfOkjsvPb540Qp9KBsHw8zfOltN9dvrx4B5COlludIgHLCOylbWVL+gkXgMo6wbog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653868;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iRQIC/zHVkISiEjWdegfg3gAGGSA6vblrJPIviV+BbA=;
	b=GGlPtf0T0R3bUfCOQCOPNmnQ2Gr2/exOPH4yGvezOUvPkrKN6qtw2hF8fIQngFbKFwfZ
	 9AVnR9SO3wULEyVBNrPl5amoosOMhhmLs0tctNWLwWaWzbi0doY9nY5CTYl6FVs5DwWEY
	 LKTe0xZRasDtP0KEY68JyVdnYXFLlHCBC8Q2rZ/f3Gt8tSCz1jxvSdnMTt0Y3JcvBsaSH
	 aaXzK2YU3NFfVkDrdSbq3Y9EX7yusIW8ZC9EAfuxb8bkJbQCKmPqvQziSKDjQQH7QMnIO
	 5qu3dUvfmcKHOwLeLBaPraX1znmPzqJVvBXBNl7E91IYFWmX081tIsNF7+cmbDbQwQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=afSNnM4J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D52606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=afSNnM4J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4359C1F000C4;
	Thu, 26 Nov 2026 00:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653868;
	bh=iRQIC/zHVkISiEjWdegfg3gAGGSA6vblrJPIviV+BbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=afSNnM4JvNrjoQcJZewVvjRa9evSNDf1V3E+2R6BNQCaDNMwOafkAjkPvVfeVOyTN
	 oEjhOyhOqOWwTAef3y7S+CLkErs2JikjNWQXmsrsLlzSsTWIkV0BDB3Nz0ALiH6nqt
	 ThgtQJlLxC2YYLZkxmHi49rk5AE7avp7OGCLAyBQhMIxB05Np03Rg+DqgM6PFq9h0i
	 9WjhzmGiAZcpEiywDHgljCLc4yPNmaHYkmK4MKqiy128yP7Y/m3rTNH6RPY1CczzBK
	 ARWbkCrJtA0jI2K+FTIlskjBJaqgrSBbNRjM0mZ17CUTjarldBZQy1z/pGV2UrgRMq
	 k6yVzb4YAPmEw==
Message-ID: <sashiko-outbox-234495@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/20] ARM: dts: ux500: Correct GPIO key descriptions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-11-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
 <20261126-ux500-dts-after-powerdomains-v1-11-791cd62d8870@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 00:44:27 +0000
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
- [Medium] ARM: dts: ux500: ste-hrefprev60 button-139 override clobbered
  by include order
--

commit 74611616ae4903ecabb271e7f61330d70fa4af45
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: ux500: Correct GPIO key descriptions

This commit updates ux500 GPIO key nodes to drop unit addresses, unused
address/size cells, and vdd-supply properties, and renames the pre-v60
HREF proximity sensor key override node to match.

> diff --git a/arch/arm/boot/dts/st/ste-hrefprev60.dtsi b/arch/arm/boot/dts=
/st/ste-hrefprev60.dtsi
> index c87fd27b44345..5686d777311f3 100644
> --- a/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
> +++ b/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
> @@ -10,7 +10,7 @@
> =20
>  / {
>  	gpio_keys {
> -		button@1 {
> +		button-139 {
>  			gpios =3D <&tc3589x_gpio 7 GPIO_ACTIVE_HIGH>;
>  		};
>  	};

[Severity: Medium]
Does the button-139 override in ste-hrefprev60.dtsi take effect?

Both ste-hrefprev60-stuib.dts and ste-hrefprev60-tvk.dts include
ste-hrefprev60.dtsi before the UIB dtsi:

arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts:
	#include "ste-hrefprev60.dtsi"
	#include "ste-href-stuib.dtsi"

Because ste-href-stuib.dtsi and ste-href-tvk1281618-r2.dtsi are evaluated
afterward, their button-139 definitions overwrite gpios back to
<&gpio6 25 GPIO_ACTIVE_HIGH>, leaving the proximity sensor on pre-v60
HREF boards bound to the wrong GPIO and conflicting with the tc35892@42
interrupt line on <&gpio6 25>.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-ux500-dts-=
after-powerdomains-v1-0-791cd62d8870@kernel.org?part=3D11
