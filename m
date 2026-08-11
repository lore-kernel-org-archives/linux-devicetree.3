Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458BE321F5E
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477620; cv=none; b=NML1Gbz8174FUodcOYzbDp1q1LBqvYQDG82GFuuwN0WS10aTiW18iTT1AjDDx66EzyopDIhV02mK9rLqSe03fQ0qAFscAiOajHEkxvYrJCgGWNJbs8XQLGwSdhNnaMTZdtBZe2C2m9XyxnEj3XieL/JIUTi5sW7VN1GR7fMtjPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477620; c=relaxed/simple;
	bh=syaQej+rPT30wHRuQyzcxUWp6MEb4VWJ6GTu1DFmUSw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dn3Ah7+K7FvRwsjh3yImFoi1HgVIesJjjtiS/WYj+Rsu5dTJuLCRiDu2jxDASoNlLcjw7IhQ+qceVZ8o2YnSBQeiWBj5ouXW4LBqDWPrr1MwiuC3DCAEhjq8F7/OKMHncDILFDbEb1am8/4+saR+UtndiQ2ab9O0YD2yDf82m4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JX5ifFb2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JX5ifFb2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981A11F000E9;
	Tue, 11 Aug 2026 19:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786477618;
	bh=EzBAzmmXm+E6bCRZUZyAsXPC35Mr3QczWLJQphdGNCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JX5ifFb2C7AMj6if+ghRZCqBPRwubUrhHd7dJlnGnixkDCgVj+9VTkl3uHaOKusT6
	 p+bA1kLBWDCF3BWLZvYgtfWNkwAddSNd61dF8GGdz1TTeOjia3sJO8U9WgL9BO3Qg4
	 +teqQoDLWZZ6vI7vXFhlr+7rZ1UDdKOzY2x/+5g+FfoAXTmPSbCblPpEjKCv8TIDlH
	 zInOUn46koPxYmlem6EboNhVVt0YhCVVjKnzA3scj4ASD6KsTsxoWR7A9RKWu3ofuy
	 Q2qDPSuKIbKvXjh+kNi78NPYHYC4rmiF44hbWrWrx0yXuuvhpRM2bdAK9Zp49Y/Inx
	 7m5Mjlm1ncURA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 RFC 2/2] ARM: dts: BCM5301X: change Luxul XWR-3150
 CPU port from 5 do 8
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260811193658.14304-2-zajec5@gmail.com>
References: <20260811193658.14304-1-zajec5@gmail.com>
 <20260811193658.14304-2-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 19:46:56 +0000
Message-Id: <20260811194658.981A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch assigns the exact same MAC address nvmem cell to both `g=
mac0` and `gmac2`, while leaving `gmac0` enabled, causing a ghost interface=
 and MAC address collision.
--

--- Patch [2]: [PATCH V2 RFC 2/2] ARM: dts: BCM5301X: change Luxul XWR-3150=
 CPU port from 5 do 8 ---
commit 0c244661a37f1cbd846bc54d786e2d6320794031
Author: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
ARM: dts: BCM5301X: change Luxul XWR-3150 CPU port from 5 do 8

This commit changes the CPU port for the Luxul XWR-3150 from port 5 to port=
 8
to utilize full switch functionality. It assigns the MAC address originally
intended for the first Ethernet interface to the third Ethernet interface a=
nd
updates the switch port statuses accordingly.

> diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/=
arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
> index 8e487f60a2cca..7969f0f331b56 100644
> --- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
> @@ -81,6 +81,11 @@ &gmac0 {
>  	nvmem-cell-names =3D "mac-address";
>  };
> =20
> +&gmac2 {
> +	nvmem-cells =3D <&et0macaddr 0>;
> +	nvmem-cell-names =3D "mac-address";
> +};
> +

[Severity: High]
Since gmac0 is not marked as disabled and uses the exact same MAC address c=
ell
(&et0macaddr 0), won't the bgmac Ethernet driver probe both gmac0 and gmac2
and register two distinct network interfaces with the same MAC address?

Because gmac0 retains its fixed-link property but switch port 5 is now
disabled, does this leave a ghost interface that is reported as UP but
disconnected from the switch, potentially blackholing traffic?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811193658.1430=
4-1-zajec5@gmail.com?part=3D2
