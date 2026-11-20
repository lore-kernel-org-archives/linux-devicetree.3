Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167133;
	b=UPhlJImgr0ZDZpc4fSiSwqKy5BvyeCnPsj6VsD0k2OixUoyrNq9pvHUawdMVNU5NmznU
	 1cp+ubTnMiL5bvERArhV9QapxL/CshwUDgURNhmRaX7DnJkyAD5MZ5UtmmJKvGuOWaVcS
	 obYDx+GzJHk2oibCqhY6FROOfhYIcmq7ctXm0akPH7UFSZOM8FnbAvsu7d58H0YJb5LN+
	 wzGVcrSaWRCzeP9fDxKpaNzhWAMMxB9O5xYLCYvOKRFYPmGngWzvnrrZI23cH2WMYPNJp
	 s4hjopp6kZAVorPMB3UT7xm0QVQ9O1WEaGVYuQZwyYLR8Cnk8ADsW4wUI3s6DpUPwRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167133;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LBOFLRV4Yo+qz5QZVpgBc2ud9nMOQvGU8zo0zsZxmNM=;
	b=KZ0W8GagCOoFIrkUULFZ8s3xrTHi8Jt4f+dqqevNDaaryOWB1mRuxDMpaasTYrIx0+CT
	 iouw1uVsjhGrQ26ZbyFSBqMC7LHlcMqSRMPDNBrgEVHUD5GvaiiQL5cAiBFotmemzl6Mh
	 tcnox/GqCO/FcIRn23o1Znrh8dn5pSlZR6eZYEmcYTO4mt28CbMixfasY2nXwuGWJNVtC
	 bXRgWTG0CyIez9qwmeMJVZLyqiXY8MtGo4EslFZTJPoYxjnZjpk3Ycay04OqRBYtKVCDy
	 gi1nlJDju1HX327bgTQMkAXZr9k//zRxNrsxonSYIIkZ0lHi6VwlrpMkn7shd7BiJTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JnTwHjSZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A2B606A33B
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JnTwHjSZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A330D1F000C4;
	Fri, 20 Nov 2026 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167132;
	bh=LBOFLRV4Yo+qz5QZVpgBc2ud9nMOQvGU8zo0zsZxmNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JnTwHjSZI6pQQ+G0jz+nqFY36YMMnf4T5OBb29Lv1YTSPQo0U/E5I3r+/zMHSI7gF
	 EcsgJ7ZrUR9RRMMKiLKjjfn3MY4H0lIVv6tPpqvIPDHJjDfp/qQ2wM1cYnfzpRgdVv
	 xor7hoVtAUXC0zGoJZfyCweB9XIPPyr3vkPKPbC2ZQz+GSuqCHmv+VGPG2yhp+Da8s
	 vI32d7OsdfMkTBmpWS0wm3OTdSH47SZ5I+QaHEvOuJDKJ47DKlwoRXf1xOfbtgTRKR
	 uyeh58ByRO5unwtz6AU1ccEqV/T8z2D3LrfQePixKpsHB/NEd2DCwfyHUiO6KqToed
	 cJ2Ytdeg4g27w==
Message-ID: <sashiko-outbox-224852@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: bus: Add Altera AXI Timeout Bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-feature-timeout-ip-v3-1-affcc644af5e@bruker.com>
References: <20261120-feature-timeout-ip-v3-0-affcc644af5e@bruker.com>
 <20261120-feature-timeout-ip-v3-1-affcc644af5e@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 09:32:12 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: bus: non-canonical property order in
  axi-timeout-bridge example
--

commit f9313b89c46a716fd7317e81e51cf84dd43ee870
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

dt-bindings: bus: Add Altera AXI Timeout Bridge

This commit adds a devicetree binding schema for the Altera AXI Timeout
Bridge FPGA IP core.

> diff --git a/Documentation/devicetree/bindings/bus/altr,axi-timeout-bridg=
e-1.0.yaml b/Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-=
1.0.yaml
> new file mode 100644
> index 0000000000000..2cf1ab537595b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.y=
aml
> @@ -0,0 +1,86 @@

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    bus@10000 {
> +        compatible =3D "altr,axi-timeout-bridge-1.0";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        reg =3D <0x10000 0x10>;
> +        interrupts =3D <0 12 IRQ_TYPE_LEVEL_HIGH>;
> +        ranges =3D <0x0 0x10010 0x1000>;

[Severity: Low]
In the bus@10000 example node, reg and ranges should come immediately
after compatible, before #address-cells, #size-cells and interrupts, to
match the DTS coding style and pass scripts/dtc/dt-check-style in strict
mode without property-order warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-feature-ti=
meout-ip-v3-0-affcc644af5e@bruker.com?part=3D1
