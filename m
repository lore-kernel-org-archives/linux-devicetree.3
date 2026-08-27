Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AB9367B72
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833671; cv=none; b=i7W+xk5P0VYXFHtH99cdzn7wanHDmTaPNp5e4/MKdQr9EN+qe4AzvQXlrGTk0Yv1lbP0GsAxP3VkY2LfZbPs0vtdKIWtLlSqof35ltBp1RrU72yDwK/lbT8WUXWzgdnsP8VK9OrSdYBdAr33bUJKjaiBCJF5enYOfuRdPO2Kezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833671; c=relaxed/simple;
	bh=pmZB/R4yx8Tcu7XfrHyxexKJ4N+/BvGE8z8PhUFWFyk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TiOSxQtGFOH0MMfAe09+zFXx63r5qRkKA9E0ou6ttZnq4f37BsjatbrVYtlsrw9TtqJ9M56Rrd+dkwDeE7DKyfJQtvUsZTaeJCZv/434mej7ZKGgxE7lVhnKT+GIjmsvtNDYAwRys60nqSzZdSsPv2PfmrsxrRkd32Bpyn8A0KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+P+ANz0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+P+ANz0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E951F000E9;
	Thu, 27 Aug 2026 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787833670;
	bh=xyBFU6QHKR6ecAhSYV8LeuOSeRQ2LwpRS1CYpJvTRZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C+P+ANz00L4mj4y0Tl5EnAAXphhAVO2hgAhe9XxzeKMFslNs78LtibbDr6dsn2tb3
	 0Mdu3Q5D2q9QygNGCloqw5pZYtllHypv86piCfntTPOMPndS92LLivv8ptLbhAad5N
	 q6XExqFYvr7rjE07ZHrWhFKGRULUBbP7Oz1AkxNREpfNplZsPi4gfgNnCJomkV9sgl
	 MLAPFWOCoC7x+VxKQT2O4vHW6yMZzmVknnoVtQ4jrYWRjjSm9Lli8SqC0e1SJAKpV5
	 MJq51+IGE35FBdvLI5mMeWntNJ33K1Ku5bqWrJWdLYLeywD5U3RA2i36+L4XIflvV0
	 1tnKX+YdF5hHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: airoha: Document support for
 AN7583 Gen3 PCIe PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260827122127.18874-2-ansuelsmth@gmail.com>
References: <20260827122127.18874-1-ansuelsmth@gmail.com>
 <20260827122127.18874-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 12:27:49 +0000
Message-Id: <20260827122749.85E951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect memory region size in the device tree example (0xfff inst=
ead of 0x1000).
--

commit 41aa642fd5dfb10ea2b50d62af99f95cc040fb55
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY

Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
work. Add the required register to configure the PCIe PHY and provide an
example for it.

> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen=
3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-=
phy.yaml
> new file mode 100644
> index 0000000000000..07bb20152c0a7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.y=
aml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/phy/phy.h>
> +
> +    phy@1fc7f000 {
> +        compatible =3D "airoha,an7583-pcie-gen3-phy";
> +        reg =3D <0x1fc7f000 0xfff>,
> +              <0x1fc7e000 0xfff>,

[Severity: Low]
Are these memory region sizes off-by-one?

Since the base addresses (0x1fc7e000 and 0x1fc7f000) are exactly 4KB (0x100=
0)
apart, a size of 0xfff (4095 bytes) mathematically leaves the last byte of =
the
4KB block unmapped.

While ioremap rounds up to the page size meaning there is likely no functio=
nal
failure in practice, should this specify 0x1000 instead to prevent propagat=
ing
off-by-one size errors to consumers of this example?

> +              <0x1fc30044 0x4>,
> +              <0x1fc35030 0x4>;
> +        reg-names =3D "g3-ana", "g3-pma",
> +                    "xr-dtime", "rx-aeq";
> +
> +        phys =3D <&pcie1_phy PHY_TYPE_PCIE>;
> +
> +        #phy-cells =3D <0>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827122127.1887=
4-1-ansuelsmth@gmail.com?part=3D1
