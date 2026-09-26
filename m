Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F9B29C328
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429693; cv=none; b=hWQ1ExAx72qvCZxMu8UHnECWKF8d/ftFVogQHKjHrbUCmKI3H1h6MHb/P+N3tzGw67X/qmSpMJRwMz43JN71s6hSUAhOxx+fllexewk+hao8hORD2V2LzRXfdmy96TPa2cKSr4AB/vFQthG9BHB1eoSg3oEIHrOxRQyDUuT6d/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429693; c=relaxed/simple;
	bh=BFFFJg9Lda9YtMA4Yi9prz9ly0tsr76JdPyTZJASwG8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uvgvpZN8zrjt4VYQNw+xIwetwzzxu9WnCf3t4dD2dHpyJxV+M0YJ4CJJROfWFpqFrpe3sueMaxJZAV+X5LN+V6lRzfcgYkbpCSyl1ZZ47BiesJI7Qmu6xgHwc7HYVZB2N5JZBl9VrgLcoAbEJd7WVAVK62JDyGUK20nC21QABoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTyeVKbj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTyeVKbj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA0B1F000FF;
	Sat, 26 Sep 2026 13:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790429692;
	bh=mow9sZAOA2VyS42xb6KYWm248iqCkvXjpRhsPkIwsQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lTyeVKbjHzRmG5pnDpEIRW/rnAsaUyeCf3d9b9aeCeJhhOVgF2q5fQjPH0ODLjw9o
	 K/FdJ235DnHlVM2duG72oUUXgKBYdPb0JSmY4jWFh8J324iMylyTptZDRGwrZV2Ie/
	 lNjIJjIWWwSoQAy8MMo7iehgVlYbOhpQrVIrPW0ui0Mjrm3eL8EMhzOlgXN6dTFxHF
	 T6yzNy/UOZafBlzXk0SHgcn8dhWsZdFXfbtPJ1dNdYNO3VCMtuahGkuqyMuXwCcLaq
	 6vnNOSQ3HWHWV5cUPd74hSlYTOO4b4v/RZofSrYkOaJv7N/T4JgYwNktPEEDvK+aEv
	 7buOlt14xKWxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/17] arm64: dts: apple: t6030: add avd nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260926-avd-v2-16-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
 <20260926-avd-v2-16-ecebe6a3648e@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 13:34:51 +0000
Message-Id: <20260926133452.1FA0B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: undocumented compatible string 'apple,t6030-dart'
--

commit a86b2ab51c200171749c5b4ddd9cf551f1bd6ec3
Author: Sofus Forstreuter <sofus.c@icloud.com>

arm64: dts: apple: t6030: add avd nodes

This commit adds the AVD DART and video codec nodes to the Apple T6030
devicetree.

> diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/a=
pple/t6030.dtsi
> index dda9568af11f9..805042bd9270d 100644
> --- a/arch/arm64/boot/dts/apple/t6030.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6030.dtsi
> @@ -361,6 +361,38 @@ pmgr_gfx: power-management@290e80000 {
>  			/* child nodes are added in t6030-pmgr.dtsi */
>  		};
> =20
> +		avd_dart: iommu@30b010000 {
> +			compatible =3D "apple,t6030-dart", "apple,t8110-dart";

[Severity: Low]
Is this compatible string defined in the devicetree bindings?

The patch adds an IOMMU node with the compatible string 'apple,t6030-dart',
but this string does not appear to be defined in
Documentation/devicetree/bindings/iommu/apple,dart.yaml.

Will this omission leave the hardware interface undocumented and cause
make dtbs_check validation to fail for the new devicetree?

> +			reg =3D <0x3 0x0b010000 0x0 0x4000>;
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 795 IRQ_TYPE_LEVEL_HIGH>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-avd-v2-0-e=
cebe6a3648e@icloud.com?part=3D16
