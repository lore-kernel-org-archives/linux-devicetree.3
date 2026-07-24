Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FD43E8C78
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883837; cv=none; b=EvJ7S9TRy96D1oPXfXarZCKk0XkL7MAN467Nsw3KKNZKkkkjNrGxLrlP1GS+G4P1LD6n0Ej8SyEy9xZmPOY2MLr2hRNGrNf0jMCpiZi8r0g0NTiohbw8JBc0LtCXnaN2H0JAbXX48auwoerj+2bkpj4fVyjJvH+gox/MmFxqqvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883837; c=relaxed/simple;
	bh=H7g3MKzWegN3llG/sJFTsbJ3FyEqP1sghPi2eKCGgGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ekepl+xEGFYF08OcrWCvvSG9gajdtrtcwO86wxkaSKmyduz/kMXy1SSETKWkMt/ERx3yS5mtqj+CQ9O2LnlrnWUm+e67mVQTIz9xja4v78Hg1LeVG1Qkk7wuYiV05C+aRzFJ/Kn1WLVPop7As06ntnSHqoa0qVB4RNkBUtEOyrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHRt55V/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHRt55V/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F111F000E9;
	Fri, 24 Jul 2026 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883836;
	bh=1h38LOy4FjEaQlQgb/gmv90Ewzg8QatvkTadeBnCREI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DHRt55V/F0WF4/OYmJ4HoDEr8ztG+RtpPFNgWKeM5sEBbYXh8+15Nw3OWy0rbluQC
	 +w+JEB5YmUOLosXB9YiH1j219zBTy8C2d6eY7w0SVv3trymVJScg8ZfRZAmT10qxZi
	 IsfYuZhU2JXvnOY6ieTDakdzNUoVK32GJsI0+Y/I8cT4QIFNhoeOnjmQJVTGe1SbH+
	 GQ3zi7SsSm83PPbgvjB4jrjBgx9pwitOX+z6B/L6G4ENHfaKiJSiN8GjslQCcJkR9d
	 p4Z9X7u66LKy1wEak3LnuuPLDYgYodanuttE4siFYRCfUmZNGCFOf9/6qtXO9nhm5V
	 8S+aRD4EgM+3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 15/16] arm64: dts: mediatek: mt8195-cherry: Add M.2
 E-key slot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724084328.3943997-16-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
 <20260724084328.3943997-16-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 09:03:55 +0000
Message-Id: <20260724090355.C9F111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removal of the `wifi@0` device tree node silently breaks Wake-on=
-WLAN (WoWLAN) capability for the MT7921 WiFi device.
--

--- Patch [15]: [PATCH v7 15/16] arm64: dts: mediatek: mt8195-cherry: Add M=
.2 E-key slot ---
commit f3cf400c3b922d9936d6cc4d1a7c83d4b85941b6
Author: Chen-Yu Tsai <wenst@chromium.org>

arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo cards.
This patch adds the proper representation for it, replacing the PCIe wifi n=
ode
and supply properties under the PCIe controller and xhci3 nodes.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195-cherry.dtsi
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi

[ ... ]

> @@ -791,14 +832,14 @@ pcie@0 {
>  		reg =3D <0 0 0 0 0>;
>  		device_type =3D "pci";
>  		num-lanes =3D <1>;
> -		vpcie3v3-supply =3D <&pp3300_wlan>;
>  		#address-cells =3D <3>;
>  		#size-cells =3D <2>;
>  		ranges;
> =20
> -		wifi@0 {
> -			reg =3D <0 0 0 0 0>;
> -			wakeup-source;
> +		port {
> +			pcie1_ep: endpoint {
> +				remote-endpoint =3D <&wifi_ep>;
> +			};
>  		};

[Severity: Medium]
Does removing the wifi@0 node silently break Wake-on-WLAN capability for the
MT7921 WiFi device?

Looking at the driver in mt7921/pci.c, it probes the device and explicitly
checks for the wakeup-source property on its associated device tree node.

Since the wifi@0 node is completely replaced by the OF graph port node here,
which does not represent a PCI device and has no reg property, it appears
the PCI core will no longer assign an OF node to the MT7921 device. Will
this cause the wakeup-source check to fail and leave WoWLAN permanently
disabled?

>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724084328.3943=
997-1-wenst@chromium.org?part=3D15
