Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FE22ECD32
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737307; cv=none; b=tI6AMI0bSBuQ/XkyELE38toL+8hwzSIrUSFbGrYp2idubqX7enm5ni0zS6Jc3FQyIcZDfVKyJ0j3WO/dI3XYx/2t1WVlKQs777sw2TW/B6giiaEMKXLf7ufnihFM+FmXL/w9qI+MwP1+akxjx+M/DGs7/G7aia2fPzvjWJl6v6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737307; c=relaxed/simple;
	bh=ws8eSBi5O4xhlKI3L/eDaSWcAUgiTKl9VmzdrrhC0wQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fmcG6MV+EInpsMrBPlFGHQ1pdbaexgEHZM25gw25iAidl+bID5YzDUr6mO4NntNXaeKwjZGlC39ggSHwFUMekwOwwjE9QjklRh8p5B3efCnTrBbyXSeDaAVVEiyvgSKqCBXv1uspiTNRdzQx9cR2IoYl8Zo9vitTz9+yP2+UISM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F121G+5M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F121G+5M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5951F000FF;
	Fri, 18 Sep 2026 13:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789737305;
	bh=ejWF9YTTFpG/VIg+tKAIa2lxOwMJQuRB06/s7toA4+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F121G+5MCRRQkMYXYkqeNenBTUi76GFTU5HbDqJyIarwGn+80+mo+Kr6EP90BJwYv
	 xcgcYzgTaX+wwQYaRLurprV77Nfy3ogz7MmiPfqPsw1nBUIUbYlXDhyIAZ79IH90eI
	 iI6Xkb8erXGSAsxoeRoulqzgs+O2GsElT+VBMM8HgF8Tq4pp5lBNLOxDqR9uAaGbtt
	 jxS3m+mN7fZlO+P/ArwUndXTJijGZH9qHOYQBqVOL9n23PEfNBffwXTBhOA95RlKMY
	 1Urkv+H6cL8buOXZkqJRTVHRydrXHoVmjnJM1x9lwrCt5przlhr7DH5Vt3LlgtwZ+B
	 UdrGFMoL5owbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 1/3] dt-bindings: net: Document Motorcomm
 YT8824 PHY package
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Switch" <kyle.switch@motor-comm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917131441.3428554-2-kyle.switch@motor-comm.com>
References: <20260917131441.3428554-1-kyle.switch@motor-comm.com>
 <20260917131441.3428554-2-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:15:05 +0000
Message-Id: <20260918131505.AE5951F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: unit-address mismatch with reg property in example
--

commit 21a69a542a09b6b2571122c2f9f0dadf390d6020
Author: Kyle Switch <kyle.switch@motor-comm.com>

dt-bindings: net: Document Motorcomm YT8824 PHY package

This commit introduces device tree binding documentation for the Motorcomm
YT8824 Ethernet PHY, describing it as a package of 4 PHYs.

> diff --git a/Documentation/devicetree/bindings/net/motorcomm,yt8824.yaml =
b/Documentation/devicetree/bindings/net/motorcomm,yt8824.yaml
> new file mode 100644
> index 0000000000000..9737364744a07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/motorcomm,yt8824.yaml

[ ... ]

> +examples:
> +  - |
> +    mdio {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        ethernet-phy-package@0 {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +            compatible =3D "motorcomm,yt8824-package";
> +            reg =3D <9>;

[Severity: Low]
Does this unit-address cause a validation warning during make
dt_binding_check? The node name uses @0, but the reg property is assigned
<9>. This mismatch typically triggers a unit_address_vs_reg warning from
the dtc compiler.

> +
> +            phy-mode =3D "internal";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917131441.3428=
554-1-kyle.switch@motor-comm.com?part=3D1
