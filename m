Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9584E3C8C65
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837930; cv=none; b=qGG/DRSLeKzVrre/x2Ei0WVOMnMLqIawOTvmKOJQkemI8Bx9ZV4InFMJp+0Fhy1KJ0Oz/HvNYjjzGtzaVLJlVK1inib5vXbwSjBNBEIvRgwuS2K0xiRCFF3lSp4EB1FnuZQaBFj5cxtEKkEEAgINlSu3yoPMiODTerRJjkBcjfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837930; c=relaxed/simple;
	bh=secz/UEC2J5pjwwD9Z77xbZpYh355aunRGszI39rdPI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ae733MwaAydD8TObPIa2CFzvzCxSOw+/PJ5vR4bulOG9K6qLLOkZXozqqkx2WNH2fCnkDhW6SZL+fsZd6mEiKUp1UQBw442+rsBcleL+bpFRD+uDOR1HkzrpXXCOJ5o+ejBDn4HnYL9Dt84pHX0vw6rYzuylch0ktVOyJKg8JgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCH0VU7q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCH0VU7q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E62CC2BCB0;
	Fri, 15 May 2026 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778837930;
	bh=secz/UEC2J5pjwwD9Z77xbZpYh355aunRGszI39rdPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GCH0VU7qmsw/4HNqxcavW92mlg5o3zCo/mfv6qY3xNplqx5NP5mcx4vSZGjrLvUAc
	 d81bjqXk9Wr/x4xz54nDLe1fktaOPt+xSKGf3HUtZeyYIswPIoQprJntsmCGEJlrZt
	 W+Q4SbDkvsHVR/0h1AXWg4fBEx7g21jrIegS/W1j1lCCCUUmMad+gHQmxQgS+Uw3VJ
	 1yGXRqCAdT2R0v2in5T7i8I3dPPQZEYpPRcs3dTwJ+jAvJcglDEY6nURDSRYWjgFIP
	 aOfAuO1MkhwN8jfLXhhOejKS9YRBC3REQAoQ6epJRJ0AkEYXZDoj7LqyzNinKclFSP
	 CtF5Co15Fd+TQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: add support for PAC1944
Reply-To: sashiko-reviews@lists.linux.dev
To: marius.cristea@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515092946.10791-2-marius.cristea@microchip.com>
References: <20260515092946.10791-2-marius.cristea@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 09:38:47 +0000
Message-Id: <20260515093849.4E62CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding defines GPIO controller capabilities but omits `gpio=
-controller` and `#gpio-cells` from the `required` list and `examples` bloc=
k.
--

commit a57d647e4dad8345f6c818b69281dba50b43a7f4
Author: Marius Cristea <marius.cristea@microchip.com>

dt-bindings: iio: adc: add support for PAC1944

This commit introduces the device tree schema for the Microchip PAC194X
and PAC195X series of Power Monitors with Accumulator. It covers variants
for high-side and low-side current sensing or floating VBUS applications.

> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,pac1944.=
yaml b/Documentation/devicetree/bindings/iio/adc/microchip,pac1944.yaml
> new file mode 100644
> index 0000000000000..eca1b25f038be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,pac1944.yaml
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - "#address-cells"
> +  - "#size-cells"

Should `gpio-controller` and `#gpio-cells` be added to this `required` list?

According to the dt-bindings guidelines, when a binding defines hardware
provider capabilities such as a GPIO controller, the standard properties
should be explicitly required to prevent incomplete device tree nodes from
passing schema validation.

[ ... ]
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        power-monitor@10 {
> +            compatible =3D "microchip,pac1954";
> +            reg =3D <0x10>;
> +            vdd-supply =3D <&vdd>;
> +
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;

Should `gpio-controller` and `#gpio-cells` also be included in this example
block?

If they are added to the required properties list, omitting them from the
examples section might cause dt_binding_check to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515092946.1079=
1-1-marius.cristea@microchip.com?part=3D1
