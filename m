Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408774F55D2
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 19:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486006; cv=none; b=GXWPQVvNccfJ9infZfNuUkTYYKDUwpFif2KNtyZ9qRQFfaRidcEyfimDB0v6pRD3S/IbTFVtaZCG6JZLGj6JoLx8G+376Dt0omAq2dKuGvrnQZspgO4Zw5vDlv4NY2CQAoffzYjomchip7Pr3j44OXO0Auto0pNLeMCzroevc3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486006; c=relaxed/simple;
	bh=dDcXvDkXFpq3uMLkc0F91YmSoqfkmfIEKhJbze8B3AM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=B2vsFTaPU+miGOArjGwFgndx43wBx1gn6Y45xeHwpEvLSELTtibX7DSPaCrrPahfKKXpHYbH1cmbFIsEyU+2Tnbt1N48PF/Koa0QRMLxpadSYix/KBKKh8ojfRdqpmhFSgcRJ9YbeMFiRDgO+hN/v94sbbcaxXffu8We4+JNrQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ae590Gkn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ae590Gkn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CD91F000FF;
	Thu,  8 Oct 2026 19:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791486004;
	bh=jNxV/aI6ajI1vxguyUArK59U0rHe6biyvcPLOFioqU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ae590Gkn5YZVCCtzAKlKBYVUIpbCwBOBiX4uD/48yc6LAu/YxN4DLPopGplCmTJKg
	 3IwC3U51oPrPS1g2SLSGHwzeT17wHzOnMFTY3aApOZ2Bqi1Qyg8ZfmRFjCns00X9j0
	 uHQNp82TvVlflJRUs93EVcU4zMFs7IVX0u9Q8as3H/P4BW18PZSqREZ0xzbn/np1Y5
	 t/M56wERGSHOGghkQTGKYzCSObKbI/XIM4J1cQI088LYWmnsMBKJdAmmdLyvC95k9Z
	 xBTNX0kSkfYjnSR5hhVI1gAjVdGrwTAq05u0PTqPrWJa8DoGgglmL0BZLjDNHKCWOg
	 FvopF8fRY+AsQ==
Message-ID: <sashiko-outbox-164484@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 1/3] dt-bindings: ptp:
 renesas,rcar-gen4-gptp: Add R-Car Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261007185920.4042783-2-niklas.soderlund+renesas@ragnatech.se>
References: <20261007185920.4042783-1-niklas.soderlund+renesas@ragnatech.se>
 <20261007185920.4042783-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 19:00:01 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ptp: devm_ioremap_resource() conflict with rtsn Ethernet driver
--

commit 2999d29f8c3c04d8ff6cdf49a3fa0d43c2a42ee4
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

dt-bindings: ptp: renesas,rcar-gen4-gptp: Add R-Car Gen4

This commit adds device tree bindings for the R-Car Gen4 gPTP timer. The
timer provides clock synchronization and is shared among different Ethernet
devices across Gen4 platforms.

> diff --git a/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp=
.yaml b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +
> +    ptp@e6449000 {
> +            compatible =3D "renesas,r8a779g0-gptp", "renesas,rcar-gen4-g=
ptp";
> +            reg =3D <0xe6449000 0x500>;

[Severity: High]
Does this new node's memory region conflict with the existing Ethernet TSN
driver?

The existing renesas,ethertsn binding also claims this exact same memory
region for the generalized Precision Time Protocol target.

During probe in drivers/net/ethernet/renesas/rtsn.c:rtsn_probe(), the
existing Ethernet driver requests this region:

        res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp");
        ...
        priv->gptp =3D devm_ioremap_resource(&pdev->dev, res);

Because both drivers use devm_ioremap_resource(), which attempts to acquire
exclusive access to the underlying physical memory via
devm_request_mem_region(), whichever driver probes second will fail with
-EBUSY. This will cause a driver probe failure and make the device unusable.

How should this shared memory resource be managed so both drivers can probe
successfully?

> +            clocks =3D <&cpg CPG_MOD 2723>;
> +            power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +            resets =3D <&cpg 2723>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007185920.4042=
783-1-niklas.soderlund+renesas@ragnatech.se?part=3D1
