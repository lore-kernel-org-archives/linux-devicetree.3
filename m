Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642443EEAEA
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 21:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383794; cv=none; b=HL6Xtk9KPjE0TW1heAk2jYRu6aPT2szWympzkjcmmsB+g/OYiVMnRo81twblcZl25Veyineduj0bDjkGLYDrxkv2OGYw6xIKHk3IRelI2KQxU71KZonx9j3Jal4SQsoo8NnBwGz0YvHY9pJlW3hkFwSxVWhfYykglbOjBPG93h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383794; c=relaxed/simple;
	bh=CZxptKijPiSjpm6jV8HUIkUDY22ndpAsvAXt+JuqisA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p+osQ7/2Cl/ZEfTIeuWYBOoRnv2AHMDIpgR/bMb0hxdrpWVVFFa61q+bvh+aDSG/vAlDQ+5CXiGVlED8rjZGcKpsOJ0YBlbDYFnrW8ykGFdWV0Vimy7yp+nWwqJR5CyuM9DinmY9KsG81Gk5iww8T6ynItWN/RPDjF7IojkN8AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzN2h2E7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzN2h2E7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAAF1F000E9;
	Wed,  2 Sep 2026 21:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788383785;
	bh=7x1gBqxy+ymepWISN/3A8+PosYiLNhTUGebPPY7TApU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NzN2h2E7/iTB5/vMWtjqX3v8oDxymK5y9SbGqgZymZTRssjfEjD1aVVfYZ/vIlFG6
	 MXhBOFYv+sGWx6YkOXnFV7DWQ6PQczRqkT1jVVXVI+FoQgelRHxgOB2PSDRFg0LGDN
	 i9J22qhySfj9Qo7bLqCygOhBqVy7ilRfVRUf2vkFw06tZgwIFVxSMsVI+mTCa7HwVZ
	 A0T3wcnZSNiic2jvVY4fxD2hLkcFSnyggVkvJjjxYX9EVKdgl58subNaXCqAzQ3yww
	 ngx2Mbdf3paU8+ltKkS3l8TWv4P4dRtkpSRMPNmE4661bs92FYgs68OFyhAt6GpE9g
	 rI3jD4jvNqg2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: ti: k3-am62: use ti,am62-m_can
 compatible for m_can devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kendall Willis" <k-willis@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-smth-v2-1-b3678ca44c7b@ti.com>
References: <20260902-smth-v2-0-b3678ca44c7b@ti.com>
 <20260902-smth-v2-1-b3678ca44c7b@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 21:16:25 +0000
Message-Id: <20260902211625.7EAAF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces a new device tree compatible string 'ti,am62-m=
_can' without updating the corresponding device tree binding schema, which =
will cause dtbs_check validation failures.
--

commit aab89344d119641f5683480ba4bd99f51381ae13
Author: Kendall Willis <k-willis@ti.com>

arm64: dts: ti: k3-am62: use ti,am62-m_can compatible for m_can devices

This commit prepends the "ti,am62-m_can" compatible string to the m_can
devices in the k3-am62-mcu device tree. This change reflects the out-of-band
wakeup functionality available for these devices during deeper low power
states.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/dt=
s/ti/k3-am62-mcu.dtsi
> --- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
> @@ -152,7 +152,7 @@ mcu_rti0: watchdog@4880000 {
>  	};
> =20
>  	mcu_mcan0: can@4e08000 {
> -		compatible =3D "bosch,m_can";
> +		compatible =3D "ti,am62-m_can", "bosch,m_can";

[Severity: Low]
Will adding "ti,am62-m_can" here trigger a dtbs_check validation failure?

The existing schema for the Bosch M_CAN controller in
Documentation/devicetree/bindings/net/can/bosch,m_can.yaml expects the
compatible property to strictly be bosch,m_can.=20

Changing it to an array without updating the YAML schema will likely cause
DT validation tools to fail during the build process.

Should the binding schema be updated alongside this change?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-smth-v2-0-=
b3678ca44c7b@ti.com?part=3D1
