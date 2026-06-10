Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6ED5474E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075498; cv=none; b=LNfW/YyNwgB253IeLUEjURcl6Wwxo7WX2CFGN1pAQC84AUuygsWczCMJ7rfrcFVPwGAppjThOCA1PEuRssQHYjIMGmiETFmVwcXWCG5tpOf2xJBvKEdfa/nm+SRj71Uwic2SfSXVY331B8S3IigZRPRMwfvUUj/e0IqVvBNF4Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075498; c=relaxed/simple;
	bh=1OO4t4Grl2OW+LLXIPdqNnIbkyfNysrf3WTK/30c8AU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=dcWkz3wa3HpEZ67HmBVFncXxWYSgVVf34sZW01pkZxKuX7Ar85SUerSKGbpVkfjaTId8mtliSYDUx1uC3MKamSuxHteuCMMCIYGel2FdC7B3X1ZkHFY8NyIPAr+r5OerwwyWAwFB+xsd3URXdvxWtfVgM9JZj0XsQDm04a7efKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=S31bppgP; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="S31bppgP"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso4383176f8f.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781075494; x=1781680294; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NHfSgeA/fGjDjbLrs9feaMOJjE/ZZnjX2Fhpf1TFZoY=;
        b=S31bppgPXnPZDrJntbG9xJ6o6Fxk0Q1uH4Uirx4K2polM0HvtRpOX8mgr3xxC/gQ1t
         UWs0LLKLx9htDg0vdMG5ymLXCLSB/QydbGlX3k9NEzEmiGrtKW8GB39hJFWTK2gqLKuP
         OCq8rJnGMwtSWuXlxplrwSuIWiF6q020/W7WDdSEzcvhUBRVgAhnHIp5v9vyizzQZ8pi
         NDDsm5n/qMF8ErQmUilDmcZ9gEh87oK62n2kACzIUQw0gTG117uvOW3rNejIicqIqldU
         aDNk/un0SHgkRhfQcSwW6btUoZb+K9v0qJyKsszE/qUrYfEzc6Ev0kdCLAO2tYyMt+ew
         Rm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075494; x=1781680294;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHfSgeA/fGjDjbLrs9feaMOJjE/ZZnjX2Fhpf1TFZoY=;
        b=WmsYSBaBPqdXUqqhLe/PDkgAgMJypTD3K53qygPpZ9bXPlAJckuhIZ5uuHMlXYdsGO
         und7pm/JZ9fkzUuUN579Fz5Tumq3dsJlFueFufcfWsiVBg8T0DZLWrmh3UYDbkR9A1Jp
         Drl8fo6WN57bcbXi6sxYyXqHIB1qeEzHxu/j1ocIXel+AczK+D6bJtwSBYl869JIQUlK
         He13IsybbsEAZQ7aBIz9L/5SCHuSAYNQgepp0hHKQVebJByCww79NapfHvSFO+nHjIpK
         hdfTPgQw4kh/WGVLgtZATzWjVX6uHPPHjspVFsrTfFBe/qeT8DrQVISV6qd2Kdo41Xqb
         gAHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YPVL1HBtrS8Rq5w4ZeqeDd/TTC/Qg2M7BAabTLdXpF6mHDJ3PCpk0ibC5lNhNFGnn6hRUYTjKXuxc@vger.kernel.org
X-Gm-Message-State: AOJu0YxYz3kX8U1ONS3HWV8thMQEzDp9NvaJbTfKTp1yj5gQ7gbr7qYZ
	FpJYuy3YbDmitA9TnvPBuRSepD6fHkidq5OhrDVfiDjcRfIJPf7KLXZ1dyX1+wLEizw=
X-Gm-Gg: Acq92OFlw5L4sPQHQzRUyJ9HWQ9F5DLvdZuYj57napJfupzC03jaorpE3h6Ju7b8CtW
	zO6XfHDjCZ8XfLNnf1NrHxZLdK5VirkW4NbwuyEbJB4B/GGiVJVQradDiOmI82GtZxSpC1H8rbo
	Yu4+nU5pUEQujwVH36ffZNGfHOKpeUD2VRFDeDcY6iWqB9MksdPHgR7bl98S4bFrtieanmJc7Fg
	6wvZtNEHQoFWNAZCxMjMlyiUJ3GCLHZ1AtaDID9gtTGselQ1UuRdbKz5Ntxr662EzN6DcZctMQT
	EXq4j0GFyFpddODrtS2FNjJAkjPdBatNMe3UlrX9apVG+4YZSrTJFhYmiRUBYD6+/FPICHJAQf3
	mexQbwjYpAxra6CndldeyZZe5DxgPUI5x+olVLrLU5djr75gA69jxQH2Jv4aVe/i5AL0k4wgqZb
	J77K8JBdJg9Svg+rgpL3/cC29QY9JUk9o2um0MmbYG
X-Received: by 2002:a5d:4e03:0:b0:43d:740:fb37 with SMTP id ffacd0b85a97d-46030641a81mr28093929f8f.24.1781075494136;
        Wed, 10 Jun 2026 00:11:34 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:6881:1355:3b75:b347])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcae2sm73998699f8f.6.2026.06.10.00.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=994575abcf1e9190cecd15ed8f5aca86c3a1ed0abda2c617779b5e42dcaa;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 10 Jun 2026 09:11:22 +0200
Message-Id: <DJ56KCZMDJ35.3CKN0VT59QRJV@baylibre.com>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, "Nishanth Menon"
 <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "Judith Mendez" <jm@ti.com>,
 "Daniel Schultz" <d.schultz@phytec.de>, "Andrew Davis" <afd@ti.com>,
 "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Paresh Bhagat"
 <p-bhagat@ti.com>, "Bryan Brattlof" <bb@ti.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Devarsh Thakkar" <devarsht@ti.com>,
 "Beleswar Padhi" <b-padhi@ti.com>, "Francesco Dolcini"
 <francesco.dolcini@toradex.com>, "Stefano Radaelli"
 <stefano.radaelli21@gmail.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Sebin Francis" <sebin.francis@ti.com>, "Kendall
 Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, "Hari Nagalla"
 <hnagalla@ti.com>
Subject: Re: [PATCH v6 04/11] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com> <20260609-topic-am62a-ioddr-dt-v6-19-v6-4-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-4-16afba97fbe0@baylibre.com>

--994575abcf1e9190cecd15ed8f5aca86c3a1ed0abda2c617779b5e42dcaa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Jun 9, 2026 at 8:56 PM CEST, Markus Schneider-Pargmann (TI) wrote:
> The wkup_r5fss0_core0_memory_region was reserved with only
> 0x0f00000 but the MCU SDK linker for the wkup R5F firmware on

This and the var-som patch incorrectly mention the reserved size to be
0x0f00000 in the commit message while it should say 0x01e00000. I will
fix the commit message with the next version.

Best
Markus

> AM62P defines the DM code/data DDR footprint differently:
>
>     /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
>     DDR                         : ORIGIN =3D 0x9CAA5000 LENGTH =3D 0x1B63=
000
>
> which results in an end at 0x9e608000. For this memory region which
> starts at 0x9c900000 this means a length of:
>
>     0x9e608000 - 0x9c900000 =3D 0x1d08000
>
> Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/ex=
amples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti=
-arm-clang/linker.cmd
> Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boo=
t/dts/ti/k3-am62p-verdin.dtsi
> index 7ee894d59113aa727d41b7ecd6b2bc7e12760823..8a5ff5c457579c7b1be7157d2=
35fd4b4e5c6af11 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> @@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 =
{
> =20
>  		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>  			compatible =3D "shared-dma-pool";
> -			reg =3D <0x00 0x9c900000 0x00 0x01e00000>;
> +			reg =3D <0x00 0x9c900000 0x00 0x01d08000>;
>  			no-map;
>  		};
>  	};


--994575abcf1e9190cecd15ed8f5aca86c3a1ed0abda2c617779b5e42dcaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaikOHBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPa
gAEAyrybqnS6hv3Ovek0j7b14FzBa99hKAVYVQajdPf6WZYA/jNeWkQ0ZfOTfw7C
HBBAgvhweurSyFbfEsO3R2u7jS4M
=GC8Q
-----END PGP SIGNATURE-----

--994575abcf1e9190cecd15ed8f5aca86c3a1ed0abda2c617779b5e42dcaa--
