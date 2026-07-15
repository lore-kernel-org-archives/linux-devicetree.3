Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A892429CF7;
	Wed, 15 Jul 2026 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115800; cv=none; b=ZnmrnbLfh8NVmivJM8pgj8PpycVLhzOQo0miB8IFjfIYloQLnElhUtL7VD6OS4SyFOdZ6yyNbFA8vTupgPxddLAel25HmSYijrzsc8VumtgAMJDoSx5rfm30ORGYWokHcdq0MOF//0Q/tytBPcpiYBqT8evGaGRGRU4zZsSmjJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115800; c=relaxed/simple;
	bh=3fKkJ+8VSp3RuD1LCoKdNbYWp8LCSrBoSq7Q3RPsn/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DT7mHW9ZbLg2sM5f0K81E4HOfwKk8Hio9Wei69D5Ckhaa8XNacGFG/PDCtCLwfC47TNJv6iUaDBatYVa9dN76a2EOKsLLs7jCBqrO1CxurHSOYXG09t6XKrN+zpBIgRf33kflYhMdKfHHXjoFhJwobKpL+olprqvAExxND1GD1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=sWAGpdJC; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="sWAGpdJC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4iI7cm50TUfbt29M1XzW54/S6U86vKbruO9GvSiUuH0=; b=sWAGpdJCjLiATuC2iZfg0E1iT8
	5rxsKju5Y4nlh3QLn3hMx6qr69JvQ1H46Qx/HsW0jfcCJ9E1uEAmYxCjAQk2N1mtHLO9iWgx3hQs8
	hURR00Tun5XOsU60sNFUfEPbTRh8BX9ZGBbA93gw79jfPTfSrl2OZEsjqWvI64QdLJvaUQ5Wx/+G5
	KKAilP1EEdH8GzlFbgiWs3V+WrQiRkVrbjAZc+M5qkCbE2v7zdTBdvkCY5p0xCv7498A0R+kbF7Uu
	OXI6aZs476f1wARdihN6FYfJJSsSUK9FYe2uyZvk04uj3HRJz4PWbcZoATcASfIVPLNZLOCeHh7bx
	6hx4xtyw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: srini@kernel.org, Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject:
 Re: [PATCH 1/2] dt-bindings: nvmem: rockchip-efuse: add
 rockchip,efuse-write-enable property
Date: Wed, 15 Jul 2026 13:42:56 +0200
Message-ID: <2363663.KTMopqUuYO@diego>
In-Reply-To: <20260715110107.409204-2-hrushirajg23@gmail.com>
References:
 <20260715110107.409204-1-hrushirajg23@gmail.com>
 <20260715110107.409204-2-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 15. Juli 2026, 13:01:06 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Hrushiraj Gandhi:
> Add an optional boolean property to explicitly opt in to write (OTP
> programming) support. eFuse bits are one-time-programmable and
> permanently set once written; write support must therefore not be
> enabled by default on arbitrary boards.
>=20
> Boards that intend to use software-initiated eFuse programming (e.g.
> factory key provisioning) must declare this property and must ensure
> the required VQPS programming supply (1.8V to 1.98V per RK3399 TRM)
> is present and correctly sequenced during writes.
>=20
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  .../devicetree/bindings/nvmem/rockchip-efuse.yaml     | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml =
b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> index b80fd8d1ae5b..8a7195245c84 100644
> --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> @@ -46,6 +46,17 @@ properties:
>        this property is defined.
>      $ref: /schemas/types.yaml#/definitions/uint32
> =20
> +  rockchip,efuse-write-enable:
> +    type: boolean
> +    description:
> +      Enable write (programming) support for this eFuse block. eFuse bits
> +      are one-time-programmable; setting a bit is permanent and cannot be
> +      undone. This property must only be set on boards where irreversible
> +      OTP programming from software is an intended use case (e.g. factory
> +      provisioning), and where the required VQPS programming voltage
> +      (1.8V to 1.98V per RK3399 TRM) is guaranteed to be present and
> +      correctly sequenced by the board's power design during writes.

Devicetree is not a configuration space, and I think this really does count
as configuration - as the efuse will be writeable on every board.

You mention the VQPS voltage. If I'm reading schematics and application
notes correctly, this is a separate input used solely for writing efuses
and _needs_ to be 0V (off?) during reads.

You mention "needs to be present and correctly sequenced", who is supposed
to turn on/off that regulator?

So you very likely need to define that regulator and can even use its
absence as an indicator to disable writes.


Heiko


