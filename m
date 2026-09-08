Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4855921E5
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888260; cv=none; b=IquVVisKcCAo/M6VFlM1Ohvj5RDEnofswfXBE+Dxx3+i1IkKlBd/wtOvdu9pJoQ2WkGFU4kh1vGvxQ5+Z5pIzLxKPYJY48EdLn276BTQM/ai1hdCKqAI7Iy/3+1/k+9x/Xqz1sM9BJHDEMpXKKcuz2tKhNJCuo11Amcxe4sdht4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888260; c=relaxed/simple;
	bh=jN/EDqYjXZcJsfkoCdWgB28W/zXx3INidwBYsg6uZIE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ud8JYWkGNjJi5DHVyKzf5N4xrApxuvX1yr+pTvGoLnzxyvgN5l7/YlHFjyxD+VcId0m5BJrkmFgSjxXZpXVm508LKkS6ia3duunj9K6/yDoDTwhroHDsxVwE/3XtXGfBvZFkHA6yFfgKFIi3JllVBC3VrMGcSzKaPWhC/ZJu9iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9qXcTPc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9qXcTPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FC21F00A3A;
	Tue,  8 Sep 2026 17:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888259;
	bh=rgkKA0Ei1Zpa3bJl2/BhNZavSR35VLYNqStak3lJKAM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A9qXcTPcVmxc7N+A/xMrVg/6+RG7RkQsDHOMESneurETu1JEwEd9rnDMc5RJODhJ9
	 S0JrzZbG9gMEUrZ6WZAEPsZlZHZvXzIAcI1b17AoIYNAxOnWg6GXrNPSabA8s5G62S
	 K4qnb9LzhTvvq4beKCh826lY7jg9kwa0Qabh+YKpRdefIdRlrRj13r8s9Sf1wk9HML
	 Ncg1sFeToHftS4I3l49XK6YUbgpK1/1/d1sfoIyL51aZMdY7NaZCHnynV3m5S2st/s
	 J2CGFW4MtbU7MhwVZ20S0UR/tTXyqcBgcF0VlpkNWUTe1C1EZaBCLHzvyihCJW7B1h
	 RzXMbtY5O5Zkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: usb: add Altera Agilex5 DWC3
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <44ba8639fb41b7c576c0795cb1474a6797754600.1788886615.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <44ba8639fb41b7c576c0795cb1474a6797754600.1788886615.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 17:24:18 +0000
Message-Id: <20260908172418.B3FC21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding uses `additionalProperties: false` alongside an `all=
Of: - $ref` to a common schema, which breaks inheritance of common properti=
es.
--

commit 6228c1d4fc3d3337f401a374921c27cd7ee4aba2
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

dt-bindings: usb: add Altera Agilex5 DWC3 controller

Add a binding for the Altera Agilex5 SoC integration of the Synopsys DWC3
USB controller (compatible "altr,agilex5-dwc3"), covering clocks, resets,
PHYs, and optional IOMMU support.

> diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> new file mode 100644
> index 0000000000000..610ddcb632e28
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

[ ... ]

> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: altr,agilex5-dwc3

[ ... ]

> +  reset-names:
> +    items:
> +      - const: core
> +      - const: ecc
> +
> +  dr_mode: true
> +
> +  maximum-speed: true
> +
> +  snps,dis_u2_susphy_quirk: true
> +
> +  snps,dis_u3_susphy_quirk: true

[Severity: Medium]
Are these properties redundantly declared as true to work around the
limitations of additionalProperties being set to false?

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - phys
> +  - phy-names
> +  - resets
> +  - reset-names
> +  - snps,dis_u2_susphy_quirk
> +  - snps,dis_u3_susphy_quirk
> +
> +additionalProperties: false

[Severity: Medium]
Does this strict constraint incorrectly reject inherited properties from the
DWC3 common schema?

Since this binding uses an allOf inclusion for snps,dwc3-common.yaml, using
additionalProperties: false breaks the inheritance of common properties. Va=
lid
common properties from generic DWC3 or USB schemas will be wrongly rejected=
 by
dtbs_check unless explicitly duplicated in this file.

Should this be unevaluatedProperties: false instead, which would allow
evaluating properties from the included common schema and remove the need to
redundantly declare the inherited properties above?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788886615.gi=
t.adrian.ho.yin.ng@altera.com?part=3D1
