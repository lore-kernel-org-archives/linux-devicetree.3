Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17F042E410
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637904; cv=none; b=XA1jpYATkP1q7mm+i+HrOxMjSTzYirsuFMCJqGbPFYUQXA7bQzFQeaqTDSDKtfYOpJyBvgzVvC/uXUTO3nhnNY3c4cu9jH8SOrJF3XcBcv1D+TJfFcfI4xA7/sqHduihGbo6wZ/wGwfATOvgsaUO8K3mduZdvidfNkRo05EmyEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637904; c=relaxed/simple;
	bh=z/+IH9h4oP6OmY2V9b12e5RAkJFU2Bv5Kcm/sg+JLH8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EwEFkNwFSeQsC28OoAm6FdeNtut208dyMpImyke/IPQ/91ZMvdIn67Kimh8lxYah9zKLcXTzpeEiQdIxDhAynNT64g6Zj/zDiOs1Am++GNsEOfkVeni7m9BcMkVd86IBd1x3nQXI2JjxC/VuM83vC71hH6QmVw/6zBuQPjOUimY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+uszi1+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+uszi1+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5993F1F000FF;
	Sat, 10 Oct 2026 13:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637903;
	bh=rUQkRSbkOi5ux3Z0GtBl/VS+xg2NHuPvihJ1KPGo6JU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V+uszi1+DengpxAVgMiEelI/y/rfrW6kWJnf8txxTbbxTBKXhyUPQNsSVcgSaq5LX
	 pHeX4dvrHyhhV6dyIuNpnUvsYbHKMr0gCO4I+tGIdpEQrsPDkHd0jETBzExNsAO26r
	 k1SMoy2awCB9G7zWnicXG2+ET51yQSdT0DqPr+3OjVs/Xq9rYJgvOmzSJq1GdZ1omo
	 I9znc2jSH0FJrQ66ns1qKGZwKHYKhdr/7qSxBSfB2uW1BGrEeFeaXV0KGivpOv3vcM
	 d2HsxIU7DaL5z20I3sVrBqFI3m+b7T6sfPVcs3Zd8xznq43ap5Ga1ex/27oK2KW/LC
	 vDQMh+59AykxQ==
Message-ID: <sashiko-outbox-166570@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 21/24] dt-bindings: usb: Add ZTE ZX279128S DWC3
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010130024.177503-22-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-22-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:11:42 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: use of deprecated snps,ref-clock-period-ns property in=
 example
- [Low] dt-bindings: missing minItems or items list for exactly 4 resets
--

commit cd8d3321ce805b3d8cf9f8b1e5a1c448f10bfc2c
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

dt-bindings: usb: Add ZTE ZX279128S DWC3 controller

This commit introduces the device tree binding for the ZTE ZX279128S
DesignWare USB3 controller. It documents the required compatible string,
clocks, resets, and other properties for the hardware integration.

> diff --git a/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yam=
l b/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
[ ... ]
> +  resets:
> +    description: The four reset bits of the controller and its PHYs, in =
the
> +      order they are released.
> +    maxItems: 4

[Severity: Low]
Does this schema unintentionally allow incomplete reset configurations?

The description explicitly mentions "four reset bits", but only specifying
maxItems: 4 implicitly defaults minItems to 1. An incomplete device tree no=
de
specifying fewer than 4 resets could silently pass validation.

Should an items list or minItems: 4 be added here?

[ ... ]
> +        resets =3D <&topcrm ZX279128S_TOP_RST_USB_B11>,
> +                 <&topcrm ZX279128S_TOP_RST_USB_B14>,
> +                 <&topcrm ZX279128S_TOP_RST_USB_B9>,
> +                 <&topcrm ZX279128S_TOP_RST_USB_B10>;
> +        dr_mode =3D "host";
> +        snps,ref-clock-period-ns =3D <50>;

[Severity: Low]
Is this deprecated property necessary in the example?

It is explicitly marked as deprecated: true in snps,dwc3-common.yaml with
instructions to use an appropriate reference clock instead. Since the examp=
le
already correctly specifies the reference clock in the clocks and clock-nam=
es
properties, providing the deprecated property appears redundant and propaga=
tes
a deprecated pattern.

> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D21
