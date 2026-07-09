Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAC139E6C6
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617170; cv=none; b=cvYk0YRGkE9O+8zpFTCC98ZsHZnwtKYp1sFmVxW5YSs4ktmnmN2+QLA0koJ8SwTqQg4gi3dC8k0IDTX+aqRnPPdDpwt6sztTj+oXrp04iFkiqKC+uRkLVXw269l1Okc4ERBjOatzdsVp8e4bxZMGpGZlslGG5ipbWGo3AsRgcQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617170; c=relaxed/simple;
	bh=9fVDdtAS2JIhKf+sw55W0HkFz9SXJA+osdrXyCK81mk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pclX4Ips2kCuvY6MERnPwf8EHTDWem+gIcUph6+mcmxtNOrrSG6C8dXaohNPxYrA9Fi7MIoNeRnu1eZsTbI0w127gU0VMioqvEIhDeuRi3EyM/Gfah18xmASGNSxcHeaGH7w2WtWH01Oapln6cvHU4faIic0Njqt2+WFMiLTxIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpVGq2W3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpVGq2W3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB6A1F000E9;
	Thu,  9 Jul 2026 17:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617168;
	bh=C0frIkDkHIeZGlGGOCXlghSaVbdN4p8t6JYNFrzaxZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GpVGq2W3nwb+aUXjFuOQyjtB+Wrqrl0mlpfuP2oroWpiGMB4P/1t28e9m2dlKTbYk
	 WKvB/ZD4OfQGvElv3SXzeOvXfVzRbWgyZdd0TEHJV+G7FPup/Zhz8UjLPjzJfqabY3
	 BgezI60v4RnOSB8zPYfjsk1/GXpFjL6SC1Hs8joQMSsh+BtZr+I0N5y4UTL+X3EAV8
	 IB4tN08XQShm9BPIZ1Q/bFP/bUgEQ+Pj/vEfcLikAic83nsq6yZwRqzrWdX1T18u0m
	 JxYYjwrGFxaL5PmO23yhXyCFvDyD5SGjwMNx/yD3lCkgSfxvOFjSqMOPQ1u/6G4J0j
	 crhtlvBN9vd9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 01/15] dt-bindings: net: add onsemi's S2500
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-s2500-mac-phy-support-v7-1-478c877aa1a9@onsemi.com>
References: <20260708-s2500-mac-phy-support-v7-0-478c877aa1a9@onsemi.com>
 <20260708-s2500-mac-phy-support-v7-1-478c877aa1a9@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:12:48 +0000
Message-Id: <20260709171248.7EB6A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Device tree bindings must strictly describe hardware and remain =
OS-agnostic, but the example codifies an incorrect interrupt trigger type t=
o work around a Linux driver bug.
--

--- Patch [1]: [PATCH net-next v7 01/15] dt-bindings: net: add onsemi's S25=
00 ---
commit c5ba93a12722287e42d3e9292af727d174c00b8d
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

dt-bindings: net: add onsemi's S2500

Add device tree binding for the onsemi S2500 IEEE 802.3cg compliant Ethernet
transceiver device. The commit notes the use of an edge-falling interrupt
trigger as a workaround for a current framework bug, despite the hardware
specification calling for a level-low trigger.

> diff --git a/Documentation/devicetree/bindings/net/onnn,s2500.yaml b/Docu=
mentation/devicetree/bindings/net/onnn,s2500.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/onnn,s2500.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    spi {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      ethernet@0 {
> +        compatible =3D "onnn,s2500";
> +        reg =3D <0>;
> +        pinctrl-names =3D "default";
> +        pinctrl-0 =3D <&eth0_pins>;
> +        interrupt-parent =3D <&gpio>;
> +        interrupts =3D <25 IRQ_TYPE_EDGE_FALLING>;

[Severity: Medium]
Device tree bindings are meant to strictly describe the hardware and remain
OS-agnostic. Since the hardware specification calls for a level-low trigger,
does codifying IRQ_TYPE_EDGE_FALLING in the example to work around a Linux=
=20
driver bug risk creating an ABI compatibility issue?

When the framework bug is eventually fixed, device trees based on this=20
example might break, or the kernel might have to permanently maintain backw=
ard=20
compatibility for this incorrect hardware description. Would it be better f=
or
the binding to document the true hardware state (IRQ_TYPE_LEVEL_LOW) instea=
d?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-s2500-mac-=
phy-support-v7-0-478c877aa1a9@onsemi.com?part=3D1
