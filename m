Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150D03A383C
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817765; cv=none; b=qRhmiKvSvQ8sX9slkU0CIsF1DlKtOP+0+JKSj1P6FOFmoGsPJtmxLwO67+GzTrHDmDOleMd17D8fVl0qjqencfQwVE8VCEntoqdEHGLrnMPiO7vpMSsOd0Z39vEZyhFWiB5cV6N++hiUpK77sQOkHe7YqgCrxFSPHzyQtmft/yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817765; c=relaxed/simple;
	bh=n7mC8yrofsnqYCErYbnAAfalnfrcrl65lPNLQx0dhqk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SaX2Vf6D6H2GT7hTLCINsoGt1EUci+UW4RgDI/+fKCXLQQ4ZEd1jHYnWxuPY30mSYANXsFz9doDDld9CoAeheg1qxR1DXRjfBieexjhGgRNP2ORNBZGKnlxhNQptX1ZUPyOZGnJv4uwA113fxj+vvezc/jODMiekQsCxhqwsB9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqxsee+D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqxsee+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1F01F000E9;
	Thu, 27 Aug 2026 08:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787817763;
	bh=gQf67oxu9Db5Xs6mBPXjNtrU8uM9WV61r/QyUVqpSlM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mqxsee+Dn/CLPeQc0otwXrAPVMBuc/QEzJHvRxw0BXAJ7LPEo0CPAB05miEGYWwpf
	 EhYTucvM/ljN9cqy9qrYBoFuiGRAMrmlEIG2LSqS+AJEdxxZhAQJ+CUiW2IP5RjZIA
	 mAZ4SZp+QW/CO7R/JdsTy1bBH9DtbuMxyQ3OJ6RvAf6NzhO1EALzyE9J41MA41xCsn
	 opVXUuDMYUuUX8a43Nb+yMGexO8G2IDq+tOvOlxs28gLak/Jnt0DI9+ZqG4WqAwEVr
	 DPyvvLVVqA/JmYDjJeFBKCBFQFoy5NqL07NRaHTUezUTLqDh/8ZhWbmQen69E6pgzK
	 Db+/CnxD83R4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] dt-bindings: beagle: Add BeagleConnect Freedom
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: ojeda@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827-gb-uart-transport-v2-6-a03bb1f5fbd1@beagleboard.org>
References: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
 <20260827-gb-uart-transport-v2-6-a03bb1f5fbd1@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 08:02:42 +0000
Message-Id: <20260827080243.5B1F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The binding incorrectly enforces SPI constraints globally and re=
jects standard properties for non-SPI buses.
- [Medium] Typographical error in the maintainer email domain causes misdir=
ection of patches.
--

commit c9a38c235f36e95264430893cbbb7407d8fc8ad8
Author: Ayush Singh <ayush@beagleboard.org>

dt-bindings: beagle: Add BeagleConnect Freedom

This commit adds devicetree bindings for the BeagleBoard.org BeagleConnect
Freedom board based on the TI CC1352P7. The board exposes an MCU that can
be attached to a host over USB, UART, SPI, or I2C. It also adds a new
MAINTAINERS entry for the Greybus UART node drivers.

> diff --git a/Documentation/devicetree/bindings/beagle/beagle,beagleconnec=
t-freedom.yaml b/Documentation/devicetree/bindings/beagle/beagle,beagleconn=
ect-freedom.yaml
> new file mode 100644
> index 0000000000000..be051a39acdc6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freed=
om.yaml
[ ... ]
> +required:
> +  - compatible
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:

[Severity: Medium]
The commit message mentions this MCU can be attached to a host over USB,
UART, SPI, or I2C. Does this unconditional reference to the SPI peripheral
properties combined with unevaluatedProperties: false prevent standard bus
properties from passing dt_binding_check?

For example, if the device is configured on a UART bus with a standard
property like current-speed =3D <115200>;, the toolchain will reject it bec=
ause
it is not in the local schema or the referenced SPI schema. Additionally,
does this inadvertently enforce SPI constraints, such as limiting reg values
to a maximum of 256, on I2C addresses?

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 61f3fd5c509ca..a9888ace2f916 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
[ ... ]
> @@ -11271,6 +11271,12 @@ L:	greybus-dev@lists.linaro.org (moderated for n=
on-subscribers)
>  S:	Maintained
>  F:	drivers/greybus/gb_softsvc.rs
> =20
> +GREYBUS UART NODE DRIVERS
> +M:	Ayush Singh <ayush@beagleboard.com>

[Severity: Medium]
This isn't a runtime bug, but is the email address domain in the MAINTAINERS
entry correct?

The patch authorship and the dt-binding maintainer field both use
@beagleboard.org, but this entry uses @beagleboard.com. Will this cause
scripts/get_maintainer.pl to return an incorrect email address and misdirect
future patches?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-gb-uart-tr=
ansport-v2-0-a03bb1f5fbd1@beagleboard.org?part=3D6
