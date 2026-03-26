Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7533B311C11;
	Thu, 26 Mar 2026 06:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774506338; cv=none; b=HwQO8WTOqepD8SeoAeSTQNNaNkiLHU8a/ccRhHPhHum83r8mzkLx/LX07wDpSAOzKWqHu4g2r/DLalRfnS8cQ9+VPEO+Yf7rHVuZtwAL4LgEeXez6F4O+0tDHIPg2Uxw9Xfxw9g2G6kpkvFtqDqfiBvrKVQ4CCLq4q9S9otHIAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774506338; c=relaxed/simple;
	bh=raWvA7R2GZ1Ic17nJin0P24yloyYXkRv5ZmyOw3YXZo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mFstyH6tPl5MImpb8s3L5vIwlm+xoSciuuRhh+RPm2uCsMjymq9ClIDqWqySmuY4Vl8dTm0Lji4gnYKC1WdHvldxT0bkIJKFGwQ7iPv4b7mHZxCuPI7+Q8axiQs+JH2iia/VH+auvsGKfP/C1UV7wmXjd2ogHb+77CRTOIQoTQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=m2F1VRLu; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="m2F1VRLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774506335;
	bh=qyl2tRm9hwQuxiJfS+7z0mBBb4tN3hi0dNEI5cPRQeU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=m2F1VRLu/z3h8YIiv7trbgAiAAm6P5Qmqlm2K8m0WMAkklBjdOHKK2qH+3jKOg808
	 87SnMIqU08U0frdGWu0lwmFPUhoe/efmKqSOtLbUtzQkqL3r8jrjZv1lPf+wLPqoFl
	 l+7v57m9JyoPSY8k0pua4Gz3vbWGjN92YBBw7Y8V6jqjNilu/9b5AJsLFetf3X3qqq
	 ABSANVeY/39ywVNSZb/QZxqE8zKty2pJ7Kxb03mXUy9sDhCND2xX8nw6cmQZgesXBz
	 zstN6KwZaLRvPieyfHtF7oQvWXP+3exgqvkPZAXUKgGuUVdMkQ21H2VoxdXfukWxqA
	 KunTFnm1d75WQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1AF006597C;
	Thu, 26 Mar 2026 14:25:35 +0800 (AWST)
Message-ID: <eacfdc8637a7e59457c3c7d29e1044426d5c7f75.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: anacapa: Add eeprom device node
 for NFC adaptor board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: carl.lee@amd.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org,
 peter.shen@amd.com, colin.huang2@amd.com
Date: Thu, 26 Mar 2026 16:55:34 +1030
In-Reply-To: <20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v2-1-91c7dde4b79d@amd.com>
References: 
	<20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v2-1-91c7dde4b79d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Carl,

Sorry for the delayed in review.

On Mon, 2026-03-09 at 11:46 +0800, Carl Lee via B4 Relay wrote:
> From: Carl Lee <carl.lee@amd.com>
>=20
> Add eeprom device node for NFC adaptor board FRU.
>=20
> Signed-off-by: Carl Lee <carl.lee@amd.com>
> ---
> Add eeprom device nodes used to store FRU data for the PRoT
> module and NFC adapter board on Anacapa platform.

This patch note seems inaccurate for the purpose of v2?

Doesn't matter too much in this instance, but should be fixed for any
subsequent revision. Which, speaking of ...

> ---
> Changes in v2:
> - Remove PRoT module eeprom commit since it is already included in anothe=
r series under review.
> - Only include NFC adapter board eeprom node.
> - Link to v1: https://lore.kernel.org/r/20260309-arm-dts-aspeed-anacapa-a=
dd-eeprom-device-v1-0-45092310e0e6@amd.com
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> index 2cb7bd128d24..69c41532fdfb 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -815,6 +815,11 @@ i2c13mux0ch7: i2c@7 {
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> =C2=A0
> +			eeprom@50 {
> +				compatible =3D "atmel,24c128";
> +				reg =3D <0x50>;
> +			};
> +
> =C2=A0			nfc@28 {

... these nodes are out of order.

Can you please order them by ascending unit address, as per the DTS
coding style?

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-=
nodes

Andrew

> =C2=A0				compatible =3D "nxp,nxp-nci-i2c";
> =C2=A0				reg =3D <0x28>;
>=20
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260309-arm-dts-aspeed-anacapa-add-eeprom-device-a1aabe06a35b
>=20
> Best regards,
