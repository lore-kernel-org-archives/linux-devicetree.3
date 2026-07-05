Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152522472B8
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246794; cv=none; b=dniWh/cLHtmO2HblHNu8gOrGHBkTH/jJC8tQAnfsAuflE5DrW0OHfJ2aLiBRe/akrOp+pH631/5dPeuP8fVKgBTV8j9bzyA538HCgR72GTqvG/s1v1psBIKwQxuuOTFfCtyShrxhul9FnUfsKCxTMhaIuzJC92UHC6tcWvoMdRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246794; c=relaxed/simple;
	bh=EhheuWa0B0KUsdLsS8pd7TMEJLpCf0Ci8XbU8ihqsiQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O9sEXwyDlwMhBt8+Mr1SvL4J1WWDyuIvqK9/ZC52fxICftd2KxlTDwbGTP3NWVbnzhHTGqB47DkGDd9IG7f8x9dppVA1Jl68JJjWMoHj/iagDCfusiWUbNXnMs5PSAp/Vy6XCXjSdsnQG+p/UYF/ZUxGcmgtgcitt+vdNigm5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=limaXQ4Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="limaXQ4Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D76F1F000E9;
	Sun,  5 Jul 2026 10:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783246792;
	bh=vLPkzF0A560kYNyxKCvHMFB2LDMQOoEAEr7vl1kmp7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=limaXQ4YM89tyf4VdqFqN7YDt50eED5m2dj3QvTNv0R73pU9I7ECeuk6QoTHN0rbl
	 jvmW4aFiG+QgmUfCbXXXrAeNJe05aDMLCqzMxVaRzWhOfK32g6pSxhWOFZjWN/OnWU
	 XT79tCDYY1CNHavDNKLO317cl44EJDdATodoCVHaMcRi+C3aC1uOO42aNXjPccL2Bi
	 yZY0TZKHHlhTZXN2g7DWdoZAhVYB/DhXyWRKMyfMD97TsjD3zMYcnYr0MlNyu23LRh
	 1W9awYyf+b7nADo22HwNlQYbo7mDn6rG+0qec1EOxNRNt4+o7HQYJuymzN+6bZbQ5B
	 sf7VKgOG7CmGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: motorola,cpcap-usb: add
 chrg_det interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260705101105.1798069-2-ivo.g.dimitrov.75@gmail.com>
References: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
 <20260705101105.1798069-2-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 10:19:51 +0000
Message-Id: <20260705101952.3D76F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Adding a new interrupt to the items list without specifying `m=
inItems` breaks backward compatibility for existing device trees.
--

commit 7e8931dde2ba82b58d38efd0314e63d294e5301f
Author: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt

This commit updates the motorola,cpcap-usb-phy binding by appending a new
charger detection interrupt for DCP detection and updating the example.

> diff --git a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy=
.yaml b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> index dd345cbd0a0b4..7488c46cc6193 100644
> --- a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> @@ -30,6 +30,7 @@ properties:
>        - description: se1 interrupt
>        - description: dm interrupt
>        - description: dp interrupt
> +      - description: charger detection interrupt
> =20
>    interrupt-names:
>      description: Interrupt names
> @@ -43,6 +44,7 @@ properties:
>        - const: se1
>        - const: dm
>        - const: dp
> +      - const: chrg_det

[Severity: Critical]
Does appending these items implicitly change the required number of interru=
pts
from 9 to 10?

In dt-schema, defining an items list implicitly sets both minItems and maxI=
tems
to the length of the list unless explicitly overridden. By appending the 10=
th
item to interrupts and interrupt-names without adding a minItems: 9 fallbac=
k,
it appears schema validation will strictly mandate exactly 10 interrupts.

Is this a regression that will cause existing device trees with 9 interrupts
to fail validation?=20

If the driver is updated to unconditionally require this new interrupt, cou=
ld
this also cause the driver to fail to probe on hardware using older device
trees?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705101105.1798=
069-1-ivo.g.dimitrov.75@gmail.com?part=3D1
