Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A2F3D6CB0
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 21:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383824; cv=none; b=ivhiaoMaxgW5BDB0vcvaWdMOjw9EjKCxWKfMl2Ud/LcfCbKoFmTqnaJ6mieUfTeD7vrfdbk3ABUvoAINymu8nd12VrDdifm4MIud/zUJAQOaWVYkX4YjQ3hlKv0jcWrmaB4eBXEj9GE/aShPwaEtwmRXBbKh+zFzW4FOEVTuKM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383824; c=relaxed/simple;
	bh=jC8uGwa+OhVAyffHo4JatldyvUgbzBIqSFGdamstgUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ShlkPKcLloGwU79wQsQa/DIlqIN3EHXRlcXMOoo6Vls5Lvkw/QOUHprSWsMTNBYEw4dxChMtmG5cXUlypZ9uVRIiiO+2QTZhpbba/qkWM8+xoZAKIkBzlYwhS50JEhFJv6+uduNggp71szhruAxrV/hxbeB8NkQsGRFkYZhO6zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSPcOccC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSPcOccC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F091F000E9;
	Wed,  2 Sep 2026 21:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788383816;
	bh=mgXCRpzkBkl34bvW6Aga1Lqh1TW/QOGc+exDYzsfTtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fSPcOccCIfTiFmAb5ud5lvCWwn+IZz4guIb6oTfFCyZJLaO26cQeTt9MceVL/IKBv
	 KRKxuJwmkilE2y5XGkUgZMyzrkDvImDM0yu5M+a2RIihzIBpi1QL4OaFmmooL/RupR
	 0goXy7boRBxChMpkSg6mN8OuIW6U+V6uvcMoVLlO2vm/LbBTi109iiFJZSBMaJUlx6
	 vU37bf6KAmWYSbELIZCGoLZLpqtOR2qsTvrt7Jz9M6BhO6EYxm/NJy6XfvDLr5dHnG
	 C3mp7NrvzTlkPgwwSBhcGXs+XFFU19+M8i+i1AKbqcoR+LIr1u8wXL8g2Xipla10NZ
	 bT14f+6c/6KeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: ti: k3-am62a: use ti,am62-m_can
 compatible for m_can devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kendall Willis" <k-willis@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260902-smth-v2-2-b3678ca44c7b@ti.com>
References: <20260902-smth-v2-0-b3678ca44c7b@ti.com>
 <20260902-smth-v2-2-b3678ca44c7b@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 21:16:55 +0000
Message-Id: <20260902211656.38F091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch introduces a new compatible string 'ti,am62-m_can' wit=
hout updating the corresponding device tree binding schema, and lacks the k=
ernel driver support and devicetree properties needed to implement the clai=
med out-of-band wakeup functionality.
--

commit 71acd1ade37c4bc66e5c6dc0a75ca7bcf4cda1e9
Author: Kendall Willis <k-willis@ti.com>

arm64: dts: ti: k3-am62a: use ti,am62-m_can compatible for m_can devices

This commit prepends the "ti,am62-m_can" compatible string to the m_can
devices in the k3-am62a-mcu device tree to enable out-of-band wakeup
functionality.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/d=
ts/ti/k3-am62a-mcu.dtsi
> index d22caa7c346b3..7026c15ef8e3d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> @@ -152,7 +152,7 @@ mcu_rti0: watchdog@4880000 {
>  	};
> =20
>  	mcu_mcan0: can@4e08000 {
> -		compatible =3D "bosch,m_can";
> +		compatible =3D "ti,am62-m_can", "bosch,m_can";

[Severity: Medium]
Does this new compatible string violate the existing device tree binding sc=
hema?

The devicetree bindings in Documentation/devicetree/bindings/net/can/bosch,=
m_can.yaml
currently require const: bosch,m_can, so adding ti,am62-m_can here causes a=
=20
failure when running make dtbs_check.

Additionally, the commit message claims this introduces out-of-band wakeup
functionality, but is the driver support for this compatible string missing
from the kernel? It appears the necessary devicetree properties (like
wakeup-source) and the driver implementation to back this capability are
absent from this patch series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-smth-v2-0-=
b3678ca44c7b@ti.com?part=3D2
