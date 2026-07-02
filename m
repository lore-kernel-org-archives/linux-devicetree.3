Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B90B477994
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983216; cv=none; b=HAelYPTUho7oPz64jJejWaftv5v+FSLGK1kcnDzhwjwjWm0fZ3HujndLgGZjY34iJVpbxuqjsum1IjjeEBdKldhlFl7Ku5PN3KBdrir76uU6K9UhfF9qRI+SKreu4QamicoOgY5oOadyqDG1W3PtGt7moXC6uOCy9QJjiqNozUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983216; c=relaxed/simple;
	bh=3B5YVrg7PyOfeLo8CYFAgby5vFyFfgSOLFtg9xv2HkA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J84gf3ZU/mAZN8yFpg0D73tHtd301RBqD6GZ5sViv9XIN3+5yy/0EwfXNjqnTUzJSdda4ECpIRnYmZEenMmuPeeffRSILAQrydFhiizTTNNALD6b2QeLHNmX/lk7aEPZ7zZ7GPIHUDQr3UDqvJJHf+ECMbwfEYgaEA9o+k4Tn/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+AjUmQ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+AjUmQ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5C21F000E9;
	Thu,  2 Jul 2026 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782983214;
	bh=OSXsVQN81jTAyK6Dkmk6ZkrNkTlcZYkfPyNJPDaImNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f+AjUmQ2MT6llkX4s1mNnddxzns9YOw76OluW1adFAnt1yzWsaGUEpsWOxWip09+U
	 P6qZ/PgxvcfeW53YKvgFVYUg/oYwVybW3IpsFYwyPjl4tBDlgwCAyuXE2jardgRppm
	 tOYZhkWB3BPaQhpFTrBrkEK+FRLAxZxzXojGMhKsGSNtCdNEFc+aKXkpsQOBqq7oLI
	 hxrAq/dzGBbwsNmIyCdVRVoT+Nfj/NrxOQVcXo/okm5Le6gUvKXU5p/x4xTig+Zxnz
	 aEsRhXTY+7UH5y+TiYskJmaEXOgMLbYsSuvpdKuoV5+w/isXfbP12w9T3jc//tt0KB
	 3/zUCQAEo6w0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: ptp:
 renesas,rcar-gen4-gptp: Add R-Car Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260701090607.1108208-2-niklas.soderlund+renesas@ragnatech.se>
References: <20260701090607.1108208-1-niklas.soderlund+renesas@ragnatech.se>
 <20260701090607.1108208-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 09:06:53 +0000
Message-Id: <20260702090653.AE5C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The newly added gPTP timer binding creates a standalone device tha=
t maps the exact same `reg` memory region already claimed by the existing `=
renesas,ethertsn.yaml` binding, leading to an I/O memory conflict.
- [Medium] The binding schema is missing the `interrupts` and `interrupt-na=
mes` properties, which are necessary to describe the gPTP timer's hardware =
interrupts.
--

commit 0657e0644601b93ec990ead2a5e82dc9dbbb0baf
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

dt-bindings: ptp: renesas,rcar-gen4-gptp: Add R-Car Gen4

Add bindings for the R-Car Gen4 gPTP timer. The timer enables accurate
synchronization of the clock in the control system. The timer is
system-wide and used by different Ethernet devices on each Gen4 platform.

> diff --git a/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp=
.yaml b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> new file mode 100644
> index 0000000000000..3edd64d400387
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> @@ -0,0 +1,64 @@
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a779f0-gptp # S4-8
> +          - renesas,r8a779g0-gptp # V4H
> +          - renesas,r8a779h0-gptp # V4M
> +      - const: renesas,rcar-gen4-gptp

[Severity: Medium]
Should interrupts and interrupt-names be included in the allowed properties?

On the S4-8 (r8a779f0) SoC, the gPTP timer's hardware interrupts (gptp0_sta=
tus,
gptp1_status) are currently described in the rswitch node.=20

Modeling the gPTP timer as an independent device requires defining its
interrupts in this new standalone node, but they will be rejected because
additionalProperties is false.

> +
> +  reg:
> +    maxItems: 1

[Severity: High]
Does this standalone gPTP timer mapping conflict with the existing
renesas,ethertsn.yaml binding?

The newly added gPTP timer binding creates a standalone device that maps the
exact same reg memory region already claimed by the ethertsn binding.

For example, in arch/arm64/boot/dts/renesas/r8a779g0.dtsi, the gptp node us=
es:

    reg =3D <0 0xe6449000 0 0x500>;

While the tsn0 node also uses:

    reg =3D <...>, <0 0xe6449000 0 0x500>;
    reg-names =3D "tsnes", "gptp";

Because the RTSN driver and the new gPTP driver both call
devm_ioremap_resource(), won't whichever driver probes second fail with -EB=
USY?
Removing the region from tsn0 would violate the unmodified
renesas,ethertsn.yaml schema, which strictly requires the gptp region.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701090607.1108=
208-1-niklas.soderlund+renesas@ragnatech.se?part=3D1
