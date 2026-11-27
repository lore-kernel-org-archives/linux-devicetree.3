Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794458;
	b=OSUcj5FPCia8z1GvN3u9D/cL1942d97mGreYaCd2nGi3X6/Vw6d3lOrL1eJuQpUjvs5u
	 Sx8Pmv77ksYzmyG6PEcIE4yvwRZ9vu1rpFMx3hvTfgEKSBrJeHProd6AL89YKVAq66jGa
	 ErjkH22C4xs/12827lLtoyECuVpXc+1ilMzyRqmYxzRLuu3YlGfLBw6KR9kTY3AwPAtuw
	 HCXjedTTkuaosaBUnd6kCky0PhAbIqBLKxJUmv3LKaVPEfBaoQIImod/x3rikBorJ0MGK
	 axEa/smXm5/6ZhGcqt3jqkfq+VdyLSiMyY35DL15uT9eri7ndccCa6dNHGq7fYvmAng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794458;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=xewmcd1sRaXw7lWObsFUBw4FbcUqkt5Mw98oDGjzbD8=;
	b=b3yqfsHoaK9ZAyBMa2aOfxb5TlH1pGc3EkEVRaIzGgDvX/RJ2Se8ErRrL32vSqPbdTth
	 CamiZ7jP1xjK+D6WzZW3yDYJ3i9f/th5DfMdPY2Wt0wzeB73pYjGcqv7N+lpBYJrR7GLy
	 /axK0RTnaAKNGjh1DlAhzTndYoJTr9xO/EyDIkVwncs+agPHWoOrU49XLxtqpy7YINQ3b
	 Fdp8HFZWv89D8oWhuxIdj3Kgnf7umFXnQp02bnn3eYu10uMOrr3D2AzQhZZLYVHBxFn5G
	 UxUSmoD33AQ4ZzMl4/HyiMs/yDYP50Vlh0qh/UX3RTSjoRgEi13oGjbD3YRv1f+up8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nKVEVYog;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE0F606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE0F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nKVEVYog
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C696D4E417C6;
	Fri, 27 Nov 2026 15:47:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 895D76049C;
	Fri, 27 Nov 2026 15:47:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D13811E90C56;
	Fri, 27 Nov 2026 16:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795794454; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xewmcd1sRaXw7lWObsFUBw4FbcUqkt5Mw98oDGjzbD8=;
	b=nKVEVYogTIBJEQhHWS+ofSAhtVNrPnLTARl8t82BupdvGrZQstmssMeCDNtNJPwOCjbIyY
	EHxHi6e3uOo1n7SBwr+BKQo6ujFormYFzQR3hszdMjHixUdzjy0BrsMhNI+SPTyAsoEewJ
	j5kbKtjTYHjIC3fUj/NUHaSL6Wupk79Va5/y5KHOnYVzMdcLoz98A0SJfgjqvskONqvZCT
	PaK1+00YrrpJnnAfLSeiyViKMjSHy8QvV8jde5RtFkIbjJhyTi4r8FyurtQDgEvZeg/4ok
	Nc9AvAxeNazIqJGZqw4Dj+wXrnsye7acmEesMAmLXdeqvLzN7DVTZ2SVpvNgUw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 6/7] ARM: dts: helios4: use hyphens in fan pinctrl node
 names
In-Reply-To: <20261126023856.767961-7-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
 <20261126023856.767961-7-rosenp@gmail.com>
Date: Fri, 27 Nov 2026 16:47:32 +0100
Message-ID: <877bhy1dkb.fsf@BLaptop.bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Rosen Penev,

> dtc W=3D1 warns about the underscores in the fan pinctrl group node
> names:
>
>   Warning (node_name_chars_strict): .../helios_fan1_pins: Character '_' n=
ot recommended in node name
>
> Use hyphens like every other pin group in this file. The labels are
> unchanged, so no references need updating.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index d4ed47ae73c5..b62730b949a4 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -300,11 +300,11 @@ helios_io_led_pins: helios-io-led-pins {
>  						       "mpp54";
>  					marvell,function =3D "gpio";
>  				};

A small nit with this change: please move the nodes to keep the
alphabetic order. They should be placed before helios-io-led-pins`.

> -				helios_fan1_pins: helios_fan1_pins {
> +				helios_fan1_pins: helios-fan1-pins {
>  					marvell,pins =3D "mpp41", "mpp43";
>  					marvell,function =3D "gpio";
>  				};
> -				helios_fan2_pins: helios_fan2_pins {
> +				helios_fan2_pins: helios-fan2-pins {
>  					marvell,pins =3D "mpp48", "mpp55";
>  					marvell,function =3D "gpio";
>  				};
> --=20
> 2.56.1
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
