Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079582;
	b=eB6aU6Y/EjgjF5OQ+Gb4Khx14/d+v7nOONjqlZiUe7ByygJvE/o7tSCFf3J7/FKrlfUu
	 Ls5IYPvBdVFvdTsnzDCu3QqfZIY2rO4ttC7M0vg0kiTin2IQCeUVdqVAYxBX8DKJeQ3RE
	 GkUm1TSESXEHJOe2HEIiNZjVo7NBtk2JMm+JH4rd6yeKq8eHqEU4//HzV3P2gmsvxljUT
	 4fd95GkcKaGmlXGVYhOkZMJyAZ8kCea+Plj1wmwEDUTuA1MF6uugtJLzYk+lUKlofx9qY
	 3O0fiwo0toGtIU9xSHwG4sF6+SrX4uuB/8qMUQJSCqIRLvRB09uHv8SnkAzhItS6rKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079582;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jlFS/kBFYTuoWKam/VI/N1W/vwbdnKAh7bEnPbIzmes=;
	b=2iJdP3nVTzKEWi37+rQH1uQaUYSLNHbXaqWn/HmAecyUjJTPrJkGtgyZJl6eGYk9gZyu
	 6aZ1dT0JYxAZGcxORpzRq7GMlSIqvYW03CJ0SIDo4DY/zMn7Vc4E4hT6HK1/ZGPr5//CY
	 50yFhu+FQH363JCUp0syTPgDhWyZ5fuSRT/u+jx4PkJordDWif+zccOZ4kzP6QtlsJGIf
	 CZ6gmVMO6NweQW+ziC29RErzmn0JTiHZMSCsAk4PoRBu5MMuXKUj/XSTtdxWQqVI6uEq1
	 ZdcBT4tPPumyAEHca1FdIRjTCMhjPWbUrUmKIR3dJ0wc9ZnrQgXqcLnRiMLAh+i81jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dvzFYij1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85CB606A333
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dvzFYij1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1351F000C5;
	Thu, 19 Nov 2026 09:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079581;
	bh=jlFS/kBFYTuoWKam/VI/N1W/vwbdnKAh7bEnPbIzmes=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dvzFYij1eAxyFI8Mq/KRuo8Znju+a4nSuQeg1OaiaVqM0ihiIf6d4IZBdt9E7kFob
	 bFTKf1tPselkY7Orno768pHuafFB9cDZGhrFiLUqlYL3PU+VRpf1XockbwQmZ+y51o
	 WTkEZGQq6Kygr0JDtvZn4L2E2TEnElOadt76+Aud+DszCObPGVeWytzcmCbmPRHFlg
	 NNbD0mEAv31onCZ9ysc2nXddXPA/U3d1aGtDgCDrOfGYMwF9vneXzP23K3G58nj69V
	 lMFifULI1kIAP1TAMlZE4HAjdLxHYcgE/Ry+TNcLw3pBktIpuu3TAMfzbbCMr9k+8O
	 xj1V/OD0I+OnQ==
Message-ID: <sashiko-outbox-222796@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 22/22] ARM: dts: BCM5301X: enable GMACs in boards
 that use them
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119085452.75708-23-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
 <20261119085452.75708-23-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:13:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ARM: dts: broadcom: gmac2 left disabled in
  bcm53016-dlink-dwl-8610ap.dts
- [Low] ARM: dts: broadcom: duplicate &gmac2 block in
  bcm4708-netgear-r6250.dts
--

commit c0782627fd863018b57e6570e61b8093bae3e6d0
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: BCM5301X: enable GMACs in boards that use them

This commit disables all four GMACs by default in bcm-ns.dtsi and
enables the active GMACs in each board DTS.

[ ... ]

> diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/=
arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
> index 81c2e6652a27e..1b33265d897f2 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
> @@ -146,3 +146,7 @@ port@8 {
>  		};
>  	};
>  };
> +
> +&gmac2 {
> +	status =3D "okay";
> +};

[Severity: Low]
This file already defines an &gmac2 block earlier for nvmem-cells:

arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts:
    &gmac2 {
    	nvmem-cells =3D <&et0macaddr 0>;
    	nvmem-cell-names =3D "mac-address";
    };

Should status =3D "okay" be placed inside that existing &gmac2 block
instead of adding a second one?

[ ... ]

> diff --git a/arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts b/a=
rch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts
> index c1f54391746fa..9f14d78f66f60 100644
> --- a/arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts
> @@ -80,11 +80,15 @@ et1macaddr: et1macaddr {
>  };
> =20
>  &gmac0 {
> +	status =3D "okay";
> +
>  	nvmem-cells =3D <&et0macaddr>;
>  	nvmem-cell-names =3D "mac-address";
>  };
> =20
>  &gmac1 {
> +	status =3D "okay";
> +
>  	nvmem-cells =3D <&et1macaddr>;
>  	nvmem-cell-names =3D "mac-address";
>  };

[Severity: Medium]
Should &gmac2 also be enabled on this board?

bcm53016-dlink-dwl-8610ap.dts does not enable the srab switch node, so
following the rule for boards without a switch node, leaving gmac2
disabled will break Ethernet connectivity if the bootloader leaves CPU
traffic routed to port 8.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119085452.7570=
8-1-rosenp@gmail.com?part=3D22
