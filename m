Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C5364EA6
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810386; cv=none; b=MQPy+OyYav9GPJoEKLnAXzOlBI/AI27p2dT1WQ8ruW2EfwT8x0axgYQNaMIV+oHN4W6UqhwxdT26Pmx0UwUnvvAMpBvqIwKLQckh07ibVXRceiq36CLDmb28/zqrOt7q1i12VLzz90F3Zs3gGST3zXPXBvEScyttX5CcDPuOYkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810386; c=relaxed/simple;
	bh=23l35d1g+CmWtrzcfHGicPVJtXzve1VMgWH3lWIqWn4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GHvZvxSkGJvsfn+pK2zogSw8/WKXsA/gICWdgPx157Jqv+aQOH3stew7MBz8pcDbMV+Sf1AsC4Hs5g3JBLDdpMGk3hJp1W9U/x7sHGnMi3lO4BhTXT2WJ28019tNVorzUNT1juLGgTDk0RoWbxrG/43SQqDo/foZWF1fCSvdh7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3TRoLQy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3TRoLQy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6791F00A3A;
	Mon,  7 Sep 2026 19:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788810385;
	bh=Ss8c6xrgJtNuNTfWzBB6vIW6D02zKq/kEwzB/p18Nvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S3TRoLQyPKVmzbGlhoBvkfkZOuuzGEs7qY/zoEpkGGUfxTGdsPIjPkRSD96ZQ5GvL
	 qs4spTusIE10Qnd+jVEJ64hTS4K4a0wQExL9iR5DngI8E6vbTynt29Ox0SDNUsB/+Q
	 DK8NoF4EOuHeIyxGRMYGh2bI4u1wRd3Civh4b5csqFXAo+W+oqjZo+9cFV0QqUhiuR
	 XjeYqLCqGxpGvEiCgvnFylv6MeT2pNIfzcSnSWp7lPf+N8VCKcACdEc80DbpyIcJkT
	 qLQW/+1xDKFcbVoZ346LzMu9HY6tohH502Azua46vzMh/6l/3KKUK1JLN7ehqITF8K
	 cbfxGKAXF2F/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: BCM5301X: AC56U: add nvram node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907194032.20042-1-rosenp@gmail.com>
References: <20260907194032.20042-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 19:46:24 +0000
Message-Id: <20260907194624.EC6791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `gmac0` node override at the top level of the DTS file is missi=
ng the `&` ampersand prefix, causing a syntax error and build failure.
--

commit b3e9863f98ae6b1a8bec5d68e2e1b2a375393644
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: BCM5301X: AC56U: add nvram node

This patch adds an nvram node to the AC56U device tree based on bootlog
sizes. It also sets up the nvmem cells for the gmac0 node to supply its
mac address.

> diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/=
arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> index c80ac16ad9496..550cc67f5ba6c 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts

[ ... ]

> @@ -92,3 +101,8 @@ button-wps {
>  &usb3_phy {
>  	status =3D "okay";
>  };
> +
> +gmac0 {

[Severity: Low]
Is this missing an ampersand prefix? Overriding an existing node from the t=
op
level of the device tree requires an ampersand like &gmac0, otherwise this
will cause a syntax error in the Device Tree Compiler and break the build.

> +	nvmem-cells =3D <&et0macaddr 0>;
> +	nvmem-cell-names =3D "mac-address";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907194032.2004=
2-1-rosenp@gmail.com?part=3D1
