Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102735;
	b=alRt8u3kMR3b0t6CeVfh4hu2LPN0NBgmo+sQoxN0vAtk/vi9mu93VtV2zbw28rBDwxDN
	 FID3QnhoNFj59Fs9bTpPGBNjMf68IrFOlxdpjOtYpbobFPRXMifRcc6H5OqZeKsEYflk5
	 Cc6iiktXc2OnQ8X0rjxoQzd9Qwa5LxBbkryBeC7VoqJwkR+vZSCnuud0DuLCNErYtZHjc
	 fC8+KCIBKTiaH40QTDtCZbSupMzptvYfzprEXfFQxsvnPWhPEJPAtwbHIoTnpbpdqqLNu
	 1p8FNXBpujJBWtS4vO1DVdTAT79WGqIc6/GLlUS/Onc+Wj+UA6G6kk/S36h6wbEvNxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102735;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BWVt66ESFVSUXbCTIU8y7MwuRRlqZGMqjmshW8+W7es=;
	b=gFClUKikVQpIUELJgguk4Yp3XSBfMcggTuJYNSalVkN/qZa/YSxi043yxKTPh4vQZobE
	 Nn9k4Zk0sv941mp4SSbEDwgmxcqbzE7lIsdrDfZeBUpi5ClXa04/uww/7D8zBh/rs43Z7
	 9Qi2S1Wr0hRApsua7GL/qFGO2PllJcevDE3U90JMe9p99q1pSQvN3iMU7YF5vaWCfDw6t
	 8puX3XwGvlbzQOz9HOoL+PK3+nviE4d5Ai46XQA/I3hLo/wcMeqIBub18EnxOGNRMcVmR
	 Cfwvyk6bvdOu6l52odGVdLi+KY6qI49aNFdARtSU7gurNH+vw/utcu2QOFGvM4a7j9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HznkqgZs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0862606B317
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HznkqgZs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 259AE1F000C7;
	Thu, 19 Nov 2026 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795102735;
	bh=BWVt66ESFVSUXbCTIU8y7MwuRRlqZGMqjmshW8+W7es=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HznkqgZsarhfdbvkb/GtuJKMKb3kbrgPJTrk39wwnRiMFTs+aTgYmQOOhcnDPSz01
	 pvxxlF4IPJUektp7B/aFaDopQYQbhroplLmXfFfbMnfPMJRwA/h31jt7VysG3pxUh9
	 fl0AfftGTY6U+WynbG69rTFLiucGqci1ZP5t6MKaPIvljkVRBIdhTPUDifVCfrxzJH
	 1wABGl6+PaJW4avNjWZ2ZESRsRHLoxOjUGod67gnueu+4iN6oHAEJachVYZ0EzkF9D
	 ULlNn7IWUyobkSXSMZ/HD1Gql79o04UDvVcoUh2GkwdtVwegzbiVBuqtI08Usytn40
	 tM+xSVSsjmpvw==
Message-ID: <sashiko-outbox-223397@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: add Marvell MHU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Cercueil" <paul.cercueil@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119152944.276763-2-paul.cercueil@bootlin.com>
References: <20261119152944.276763-1-paul.cercueil@bootlin.com>
 <20261119152944.276763-2-paul.cercueil@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 15:38:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: mailbox: marvell,mhu: broken .yml path and order in
  MAINTAINERS
- [Low] dt-bindings: mailbox: marvell,mhu: indentation and style issues
  in DTS example
--

commit 4caa249d5ea1d3d9950edc33feb82a1fda934ec0
Author: George Cherian <gcherian@marvell.com>

dt-bindings: mailbox: add Marvell MHU

This commit adds the device tree binding schema and MAINTAINERS entry for
the Marvell Message Handling Unit mailbox controller on OcteonTX and
OcteonTX2 SoCs.

> diff --git a/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml b=
/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
> new file mode 100644
> index 0000000000000..228607165f850
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
> @@ -0,0 +1,60 @@

[ ... ]

> +examples:
> +  - |
> +    ecam {
> +        #address-cells =3D <3>;
> +        #size-cells =3D <2>;
> +            mailbox: mailbox@1c,0 {
> +                compatible =3D "marvell,octeontx2-mhu";
> +                reg =3D <0xe000 0x0 0x0 0 0>;
> +                #mbox-cells =3D <1>;
> +            };
> +    };

[Severity: Low]
In this DTS example, the child node mailbox@1c,0 is indented by 8 spaces
relative to ecam instead of 4 spaces, is missing a blank line after
#size-cells =3D <2>;, and defines an unused mailbox: label.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65e8a4b5c90b1..b592a62a5c563 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15959,6 +15959,12 @@ R:	Vamsi Attunuru <vattunuru@marvell.com>
>  S:	Supported
>  F:	drivers/pci/hotplug/octep_hp.c
> =20
> +MARVELL MHU MAILBOX DRIVER
> +M:	Sujeet Baranwal <sbaranwal@marvell.com>
> +M:	George Cherian <gcherian@marvell.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mailbox/marvell,mhu.yml
> +
>  MATROX FRAMEBUFFER DRIVER
>  L:	linux-fbdev@vger.kernel.org
>  S:	Orphan

[Severity: Low]
Should this F: entry end in .yaml instead of .yml to match the file created
by this commit?  Because the path does not exist, scripts/get_maintainer.pl
will not match the binding file and --self-test=3Dpatterns reports a broken
file pattern.  Also, MARVELL MHU MAILBOX DRIVER is placed after MARVELL
OCTEON HOTPLUG DRIVER rather than in alphabetical order between MARVELL
MACCHIATOBIN SUPPORT and MARVELL MV643XX ETHERNET DRIVER.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119152944.2767=
63-1-paul.cercueil@bootlin.com?part=3D1
