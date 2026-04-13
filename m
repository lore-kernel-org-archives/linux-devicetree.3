Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEBE38F239
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 19:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776108516; cv=pass; b=UIv2v+sYOS8pLC+Fj/nhVMdOyS+UU+jXzSCoLQR5uW/8z0ENJMNuq7DXeV7Lff+vHR7xU2r8Fl945oyp77qcwmPG4dH1PJ81GFEMkAU8JR+C3KZEcn9xBHzGTIZf6wgiSfsPl/dOBY2LUnRgWTLPkNf0RimKiv11wZ3Mcz6QMDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776108516; c=relaxed/simple;
	bh=at1sLsxz7zG/NI4eVz+XUTJj1sDPXHu9VBu5AMReNzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/Bs2Vizu9ugMVRkemqun+RMWZwUQ4lSkdoPGBZFAdOoloD8F/uuwhAx7r3tGcZ4sdbRy0hxsA3JDNfNRNNd+DNVdqmjs5CLcPHsimWznuNwWTqWH7yYnaeOy5prlHIqz4eB9EDUmDXG+Va3iL7biUsqwULZWz5RHfLJkvrYoic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojlFCLVm; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojlFCLVm"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso637827866b.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 12:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776108512; cv=none;
        d=google.com; s=arc-20240605;
        b=V3Mwi9FLTiHpdwFGDWVZRQ0OjZTk1aN3nAEZDgzHnln0CK7/rJ7LaN5uKDPVaZVVew
         DC4c3ADmO+amWkFIVZU2VELfwI5BGJgUA4kO//V3LHQAtEkzpYne6Y7yXXiR6nmo9SrD
         mGsQIXj2tBJVOruna+GjWfAFBTWcPLBGOGz8rwhsewgCu1WZN4VHzQ7tvu2itt482N+3
         VYaTk4g8mQtkVb27b2uo8k1LcZk1pe3ZIZFxRxsdCbYgzyknDx1H0cihLx6UTH7fEkb4
         lYuPmj1FQtYOa/epgK1AZDGUrmGrp+MR+ff+W/gs4V85+7qtNwrKKy3+11aRg1K7kTxc
         e3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9bF/zvI2KpjlnALCVbm2BiZRYcKLJLbXhP543C6RUbg=;
        fh=Y+2FrDqcVhmGT8VnS8Jj+DUby/neAEzCJDRSL5vh6iA=;
        b=boYpkGRsTKT30kD8Y0aZj98GQbCsAPcU5JpVK2axoSACmxYGL2iilpuv3DT3sBVWEA
         Fg8jGBmvTOwV1vj9A2UUp+idsIuVVF0Ccm3wkFjZSOzkAIt0DLfwfffXSQHdIlrZZSuy
         M3FRt63rnUC4Gew8wJiVj21Pgzj+B1vLtovoxlp3ccs5XCIL+/vvpGzkrcqO7S7n+v3B
         oAV6M0n9pI/XUQwCfX2aCmn9W+NKRLMBpw655k58Fk/AvTWNm6TtVGqMARwkgkPJXeWI
         vB67y1OshRJH203B3996NSCsVbaiotJy7w5AIEOBFeJdrYj+ilIYahaB8dtPoTuw5InK
         bqJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776108512; x=1776713312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bF/zvI2KpjlnALCVbm2BiZRYcKLJLbXhP543C6RUbg=;
        b=ojlFCLVmQ3JjaI/LwRrziMPxHWOtchfdQtjaizbgUnhs2dfVSKLN67sSOZLKU7dodg
         lCpPSRBelfP/uxuC52nThYAVfHZhWn5gBCW7KRfGNwmSea+oexzZdpCvYHfRsVEol29C
         9/4uUpEmU4DJc0IzAps0qOY3qAuZ4MtMg63WYIr8ALzQ1agEFt/PLJG+ymddbIJxa1Sy
         2ivgZnbkLm6f9S6ls6cJJRkJrm2wofjrazc6iMIV9b1U1H26hNVnrOUlxzuh9XPgoBgN
         WjbzWLH5hi86THBcYgFdDzE30P7oebZWt+3+DvihgNHkZPZbKYUYgzbWC2FONWfEfWLU
         LvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776108512; x=1776713312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9bF/zvI2KpjlnALCVbm2BiZRYcKLJLbXhP543C6RUbg=;
        b=G50sVQZ3yHfRtsSWlrITCNs4ZArpgSYntyTsVzlrGO766NzVsgssYdMdq+MNd3Txcd
         nJVfhrliBdE8zsdO7LXyOL0vIfsl9VRePn0KoyLh9agU+2mnD409Oi3BXUF9dpoW8Pu/
         6vVK4GMq228IY6KKZa/2B/4qiH25S7rKrVpT7emrlgGXvr6JWfBAtl9W1lYwgfOALMwp
         /aMAz1HpnjVrWOHTHPhqNnygKppvUn5m894OTXp9FgvTItNsRWvqZDOIituPyYf1S7iw
         CDiAlfzOt10h2cJqfnRBWTzYkgcHK3mwMcc33PcsAz3WrUjzIVb6EbA34vq0GkGVNqaq
         KkwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+802qPFnJk8F220eNPdexBSRGuSVVqY6Iz+Z+ridqicXQWT1a5YJcabZpoRycTBzg1ScEZdkHs0LPO@vger.kernel.org
X-Gm-Message-State: AOJu0YwderO3SnjLUNcUvml9px1oKhClq7nxZSywlEbc7cAdgpdjFP0p
	svE12B7KzCtz+tvyOGFpGNhdpJxBBBF8IP/2EY000lkZd9+ugSjqbG005OJpqgef/aLzpdEhfsR
	1IEpzeWYT7AOZfj9YOubsHbjf4NSKa9M=
X-Gm-Gg: AeBDiesANQ/2Umne0e5nhaPXPWdplGZPvP5ctIvrNzkHsbeUJ4naw/Jwm/KDi7yjbUu
	jP61MzMwe2sgsX/SWVxjfuE6MMIhFbOVg4fJejax0VJtgBpdG1Wr4MMH7556/B29fjB7r63zMIP
	aQFwkY1TbhHIxdhKJuqnfzOmkcQcHUT7syXXidDoV5ZiTIfAvPTdcvFwLglhrGDmtKSGy+RfjZY
	+w9nW6TiAzxJH/MHG04gCK4U6ETlZSTvo/vMCFkgFfvAgILe+eCd4ICK626//BT45eJYtVSg1He
	+QVqKR8HI/pfigiP09CdgQhOsnAkJfcYURtOzo7kP8GR9oF9j8UGWgMhkZxPHiY/qDfVdeQN+bn
	7pSqXxw==
X-Received: by 2002:a17:907:6c0f:b0:b97:e32f:7ee8 with SMTP id
 a640c23a62f3a-b9d7298ffe1mr758494466b.37.1776108511829; Mon, 13 Apr 2026
 12:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413092148.3870746-1-arnd@kernel.org>
In-Reply-To: <20260413092148.3870746-1-arnd@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 13 Apr 2026 12:28:19 -0700
X-Gm-Features: AQROBzDRhEA53Q6D19izUguGZUF4CJzwH_A7MqptLtlQ6pim0lENIBLGjdUpTss
Message-ID: <CAKxU2N9iBwbt2frA5v3=BgAdUgQm6zSdVU01ZVV2AqOJb-ntRw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: bcm4709: fix bus range assignment
To: Arnd Bergmann <arnd@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 2:21=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The netgear r8000 dts file limits the bus range for the first host
> bridge to exclude bus 0, but the two devices on the first bus are
> explicitly assigned to bus 0, causing a build time warning:
>
> /home/arnd/arm-soc/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:1=
42.3-27: Warning (pci_device_bus_num): /axi@18000000/pcie@13000/pcie@0/pcie=
@0,0/pcie@1,0:bus-range: PCI bus number 0 out of range, expected (1 - 255)
> /home/arnd/arm-soc/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:1=
42.3-27: Warning (pci_device_bus_num): /axi@18000000/pcie@13000/pcie@0/pcie=
@0,0/pcie@2,0:bus-range: PCI bus number 0 out of range, expected (1 - 255)
>
> I could not find any reason why this is done in the first place, but
> this can be easily addressed by reassigning the two devices to
> bus 1, or by dropping the bus-range property in order to allow
> secondary bus 0 to be assigned.
>
> Assuming the bus-range is intentional, fix this by moving the
> devices to the first valid secondary bus number.
No, bus-range is not intentional. It should be removed instead.
>
> Fixes: 893faf67438c ("ARM: dts: BCM5301X: add root pcie bridges")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/=
arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
> index d170c71cbd76..355be5014943 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
> @@ -147,7 +147,7 @@ pcie@0,0 {
>
>                 pcie@1,0 {
>                         device_type =3D "pci";
> -                       reg =3D <0x800 0 0 0 0>;
> +                       reg =3D <0x10800 0 0 0 0>;
>
>                         #address-cells =3D <3>;
>                         #size-cells =3D <2>;
> @@ -162,7 +162,7 @@ wifi@0,0 {
>
>                 pcie@2,0 {
>                         device_type =3D "pci";
> -                       reg =3D <0x1000 0 0 0 0>;
> +                       reg =3D <0x11000 0 0 0 0>;
>
>                         #address-cells =3D <3>;
>                         #size-cells =3D <2>;
> --
> 2.39.5
>
