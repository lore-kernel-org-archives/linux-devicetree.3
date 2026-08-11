Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0031E41DEE1
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 22:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485907; cv=none; b=IyRBC0BOlafkzA4nVmC4txPZDWNs8JI4rhr+rGaf6LuZIYwqaCshtC+tphGoc5dTW5Z0KQfmoL1EYHg114wGnjbLs+qcRSStkCB2r1QDekBicl6aCyX7MyXmWC+ARm9U1FXLH2UkAn0+Zzlh56EFdZY443wl/W/g2tSj5vSlDG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485907; c=relaxed/simple;
	bh=z4111N4xBhHKupRahtq1+BDyRtLiaJIEtdX8LNqkeuc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O7iqF5EBkTGPAcJiyWqJe4IfKExxphIGGjiC891cKwVxyzZlCdD7Pe6W8ZHl6TblEvdREcE5YHyhn0rw6PKWs42axto7YiCv0b/czMYXGY9qCZnhVxw6oKWcvBoYZvu8vcefBoAzPt1F2ukVBZFgAp3awK82XseHE15yhLCka1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7O+CPi8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7O+CPi8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DB31F000E9;
	Tue, 11 Aug 2026 22:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786485905;
	bh=krQBRe2hNc3LKRVXvxCk2bvxCiWRNADa3nTuqldrxyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n7O+CPi8E6QhXhCPs6Fclcur5dhBNEjBIPl1aT7My1tkQ89pRtHPwnNGpAprAPH8N
	 WujSDqM4XYTRkKw3Di+jXyxKL9G/cvEvFF0Cj3RsWlhlLWGJcwcDbOGie1k6DmiRQe
	 dB1Mo4TQ0cOqpqV9l0iX8L7tWQne3vZg2mlzmSelXDUf/wMDb95FQQBjNevNOc8G3R
	 BbAPwVxQ8HMcfgMJI4JP6UzwwS6RZTDXaUi5Ei/mBkGnQfOiRVKox139cu9TaYKje0
	 Dqn3U/jzfkwi3IUqCPSkKUeoEkOMAJSyyzZkCKmZJG/KWWu4UiCSTSo+5XtkQ7+48z
	 L6e7m3l6vee4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path
 using child node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260811213610.2956147-9-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-9-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 22:05:04 +0000
Message-Id: <20260811220505.76DB31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Nesting the OF graph inside `eud-path@0` breaks the existing `qcom=
_eud` driver's ability to find the USB role switch, and violates the curren=
t device tree binding.
--

--- Patch [8]: [PATCH v6 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI p=
ath using child node ---
commit 760fcd42e7f50583cc87820f4812ba19895c4e27
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Update EUD device tree graph

This commit updates the EUD description to explicitly model the topology
using an eud path child node. It also associates the endpoint mapping
with the primary controller and enables the EUD by default.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index f2da3706d5c8..30b62b406906 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi

[ ... ]

> @@ -4753,16 +4747,28 @@ eud: eud@88e0000 {
>  			      <0 0x88e2000 0 0x1000>;
>  			interrupts-extended =3D <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
> =20
> -			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> =20
> -			ports {
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;
> +			eud0: eud-path@0 {
> +				reg =3D <0>;
> +				usb-role-switch;
> =20
> -				port@0 {
> -					reg =3D <0>;
> -					eud_ep: endpoint {
> -						remote-endpoint =3D <&usb2_role_switch>;
> +				ports {

[Severity: High]
Will this nested structure prevent the qcom_eud driver from finding the
USB role switch?

In drivers/usb/misc/qcom_eud.c:eud_probe(), the driver calls
usb_role_switch_get(), which traverses the OF graph to locate the switch:

    chip->role_sw =3D usb_role_switch_get(&pdev->dev);
    if (IS_ERR(chip->role_sw))

The graph traversal functions look specifically for immediate child nodes
named "port" or "ports". Because this patch nests the "ports" node inside
an "eud-path@0" child, the traversal will find zero endpoints. This will
cause usb_role_switch_get() to silently return NULL and leave the debugging
functionality non-functional.

Additionally, does this change violate the current device tree bindings for
the EUD?

The schema in Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
specifies "additionalProperties: false", which will reject properties like
"eud-path@0", "#address-cells", and "#size-cells" at the root of the eud
node.

> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					port@0 {
> +						reg =3D <0>;
> +						eud_usb: endpoint {
> +							remote-endpoint =3D <&usb_1_dwc3_hs>;
> +						};
> +					};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811213610.2956=
147-1-elson.serrao@oss.qualcomm.com?part=3D8
