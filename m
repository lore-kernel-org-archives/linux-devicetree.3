Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2752D6E5A;
	Mon, 13 Jul 2026 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783957932; cv=none; b=o1NWsH7ivYjRtT2ZZyQPsPGLTiabu+qUeuWNt+h8b8gvbdAmMgNrS0kpIeJ2OgzisoU7lNPLsRQ42ClL4ebrOAZNupBu3aIeRJGUzXXGjAlDXKm8Nc+NDheDJmToVg4DELdjM6lFlra8m9CyLMYDmEDKYP+ZuE3H2+LwZPybEew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783957932; c=relaxed/simple;
	bh=B62UYWkUqwSlYYMH3eS7Mb0JWv7LVhT6ajqZIJoeRMI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gh2lJZAgVSEuCLa90lbJpXfCRmOzdN9w+dzuFtsWmEPYLZTUpXYY59A747JPqcHAxP8/EL9z0AdT1/nJyR5Ql43hx0llXpZ4eaDLDpSiSWIFGSRcFMQRFo98Uscm6A1KSrDeDZMkRaQFWkCBA8H+3aXyoI9nclQwDC7DOjVh0/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wFAo7Aun; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wFAo7Aun"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C61B81A0FA0;
	Mon, 13 Jul 2026 15:52:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 993E860345;
	Mon, 13 Jul 2026 15:52:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89E6011BD22AD;
	Mon, 13 Jul 2026 17:52:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783957924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BHnLSken2nxzqxRuJHgo1Iepw2h57jn7vd+PGFLRjFQ=;
	b=wFAo7AunDzvnlqEemCbJAZ4mns2JTynkuYk6NKtMCsyr/ZWdNdJWkMMomZikRrc1KRN7Kz
	xM0y+uw+o3SsGg8YkhAGbuZYvqKY2E0ns35ZIY8iKPMWEdKt7pgzdOK0/6hmR1b2lbpcgd
	NQ1Q7rfGg7RLaAuLAcfX6j3CjZDeOa4iTzhfv0w2FlwAqNLOg4blyBveGTccOpniJgeTx4
	Z9oqBcK2QVfJheWljYqgoOnETYJzjBR6mvbozUwDgOIe2ur5B++4+glH6UhnMTcDTwy6yb
	02OjbFBMqy0XNhN/EYHPKSo7MD5kuiMe9wZmvDstJesBRP1oHYbvisGkdRBd5w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: marvell: armada: Correct indentation
In-Reply-To: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:52:01 +0200
Message-ID: <877bmy7uqm.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-ch=
eck-style).
> ---
>  arch/arm/boot/dts/marvell/armada-370.dtsi  |  8 ++++----
>  arch/arm/boot/dts/marvell/armada-xp-gp.dts | 14 +++++++-------
>  2 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-370.dtsi b/arch/arm/boot/dt=
s/marvell/armada-370.dtsi
> index 2013a5ccecd3..cf73287501da 100644
> --- a/arch/arm/boot/dts/marvell/armada-370.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-370.dtsi
> @@ -63,8 +63,8 @@ pcie0: pcie@1,0 {
>  				interrupt-names =3D "intx";
>  				interrupts-extended =3D <&mpic 58>;
>  				#interrupt-cells =3D <1>;
> -                                ranges =3D <0x82000000 0 0 0x82000000 0x=
1 0 1 0
> -                                          0x81000000 0 0 0x81000000 0x1 =
0 1 0>;
> +				ranges =3D <0x82000000 0 0 0x82000000 0x1 0 1 0
> +					  0x81000000 0 0 0x81000000 0x1 0 1 0>;
>  				bus-range =3D <0x00 0xff>;
>  				interrupt-map-mask =3D <0 0 0 7>;
>  				interrupt-map =3D <0 0 0 1 &pcie0_intc 0>,
> @@ -91,8 +91,8 @@ pcie2: pcie@2,0 {
>  				interrupt-names =3D "intx";
>  				interrupts-extended =3D <&mpic 62>;
>  				#interrupt-cells =3D <1>;
> -                                ranges =3D <0x82000000 0 0 0x82000000 0x=
2 0 1 0
> -                                          0x81000000 0 0 0x81000000 0x2 =
0 1 0>;
> +				ranges =3D <0x82000000 0 0 0x82000000 0x2 0 1 0
> +					  0x81000000 0 0 0x81000000 0x2 0 1 0>;
>  				bus-range =3D <0x00 0xff>;
>  				interrupt-map-mask =3D <0 0 0 7>;
>  				interrupt-map =3D <0 0 0 1 &pcie2_intc 0>,
> diff --git a/arch/arm/boot/dts/marvell/armada-xp-gp.dts b/arch/arm/boot/d=
ts/marvell/armada-xp-gp.dts
> index d1d348b91c0a..65cc0373fe04 100644
> --- a/arch/arm/boot/dts/marvell/armada-xp-gp.dts
> +++ b/arch/arm/boot/dts/marvell/armada-xp-gp.dts
> @@ -34,13 +34,13 @@ chosen {
>  	memory@0 {
>  		device_type =3D "memory";
>  		/*
> -                 * 8 GB of plug-in RAM modules by default.The amount
> -                 * of memory available can be changed by the
> -                 * bootloader according the size of the module
> -                 * actually plugged. However, memory between
> -                 * 0xF0000000 to 0xFFFFFFFF cannot be used, as it is
> -                 * the address range used for I/O (internal registers,
> -                 * MBus windows).
> +		 * 8 GB of plug-in RAM modules by default.The amount
> +		 * of memory available can be changed by the
> +		 * bootloader according the size of the module
> +		 * actually plugged. However, memory between
> +		 * 0xF0000000 to 0xFFFFFFFF cannot be used, as it is
> +		 * the address range used for I/O (internal registers,
> +		 * MBus windows).
>  		 */
>  		reg =3D <0x00000000 0x00000000 0x00000000 0xf0000000>,
>  		      <0x00000001 0x00000000 0x00000001 0x00000000>;
> --=20
> 2.53.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
