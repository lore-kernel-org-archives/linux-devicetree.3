Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011748;
	b=glvFfaZgVQY76KSv04wbPOZmDVq95bBOMozrX2s9NzfUM+tX/6Pv24pnIFbkA5aw4dVp
	 7EfTQAk6rJSbUcNuZPaBa1QC80UksSVhnyzl47v6/H6zknH4G53E49dkfVNn78sPYdud4
	 /0A8CLtmNJUpRPLhrRBwuogBiF2Qgqj2vRNwg214ugfRoNeRJhdbX+zqw1JuL25PHTBgv
	 tre1T86xsUf390t3NgI8K+oVTwDg32nS5L6gRV6broVFt44v5IZpLDPQ+RhUKgsWkXSjW
	 QStdLqpgzJLfXPROhbS0QP6zOiHqTFr5bchRiNEUk4WkfFO6TSHhcZbOgT1JExFflJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011748;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j19LIDJy8KeaWyelQ8109vYmNgKcFuTo+6y9SSzXPh0=;
	b=Og8n1WigCE1tguEknyVCzPbCClfWqJ2M09XlUF6aPwr44FDi3ieT0XWQmAMK7sMVwoBQ
	 lMEKQKsZraa6I6Y3SxBfmfvHYYfh0aijfapUFyKfnFo8hb91ZAGISUTQmVrER7UVYBSXf
	 QfO5tOn2rpycEY2LJ4evhg8Z1nXjNbMFpzokVCwvkE3Sqd12lHM4ap4ODf1bAuH+qezkv
	 uytrMEtvPciO8HKm8nfjo0IkO6ZSSqQBhXCNM9Zq7sAoZd7vM8sKJxwAo6IU7nVi2p3/W
	 C0rdSz0e9yAddquX8s61IwiveKTQnmpfC6npqw4adPxW7jL40K4g1qDATIF3XC8OobA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSVEIEzF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7685606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSVEIEzF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B75E1F01825;
	Mon, 26 Oct 2026 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793011747;
	bh=j19LIDJy8KeaWyelQ8109vYmNgKcFuTo+6y9SSzXPh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iSVEIEzFP5Mms3xAUJPErsws1ztCCxHw4t1QFYDg5fpjLwhmaNJgANYZbakYgi2Tg
	 rt8+P5lIOpW1PyBrWTWiQVSGENyUFVwVOh69GVHt+WHyEWPS64RIibF4rtOrNFH+VK
	 nhqR4bmttQva3jXb2/dAsYVReX+jVrBjKZhG3NksLvDD0Og3ybkFqTXDpaRQhmau5z
	 X5KCwyB6ToJgaNYKXQUNQqUPR5zThCUttcVpJDbHDqt9soHYAFWtCEwWvVcfjYRfZA
	 Q1w54Ihw78OPwQbjfOiat48vC2UjiDC1TKZjlwXyWZ8+5geKTRqEuEVnbkaPTsFuAP
	 kihsBzM2B/Ddg==
Message-ID: <sashiko-outbox-185015@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Document support for
 Airoha AN7581 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026102138.36786-1-ansuelsmth@gmail.com>
References: <20261026102138.36786-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 10:49:07 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: mmc: mtk-sd: missing clocks constraints for airoha,=
an7581-mmc
--

commit c2ecb5aa718b8cb2478402c7db169bd4c820f420
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: mmc: mtk-sd: Document support for Airoha AN7581 SoC

This commit adds the airoha,an7581-mmc compatible string to the MediaTek
MMC controller binding and updates the register count constraint for two
register regions.

> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Document=
ation/devicetree/bindings/mmc/mtk-sd.yaml
> index a4d032224dcee..49ad2a8a390d6 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - airoha,an7581-mmc
>            - mediatek,mt2701-mmc
>            - mediatek,mt2712-mmc
>            - mediatek,mt6779-mmc
> @@ -238,6 +239,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - airoha,an7581-mmc
>                - mediatek,mt7986-mmc
>                - mediatek,mt7988-mmc
>                - mediatek,mt8183-mmc

[Severity: Medium]
Should airoha,an7581-mmc also be added to a clocks and clock-names
conditional block under allOf in
Documentation/devicetree/bindings/mmc/mtk-sd.yaml?

The commit message notes that this compatible is added to permit defining
only 2 clocks, and in drivers/mmc/host/mtk-sd.c, msdc_drv_probe() ->
msdc_of_clock_parse() requires the source and hclk clocks.

However, the top-level properties:clocks and properties:clock-names
definitions in Documentation/devicetree/bindings/mmc/mtk-sd.yaml only bound
the array length:

  clocks:
    description:
      Should contain phandle for the clock feeding the MMC controller.
    minItems: 2
    maxItems: 7

  clock-names:
    minItems: 2
    maxItems: 7

While per-SoC clock counts and clock-names constants are constrained in
allOf conditional blocks such as:

  - if:
      properties:
        compatible:
          enum:
            - mediatek,mt2701-mmc
            ...
    then:
      properties:
        clocks:
          minItems: 2
          items:
            - description: source clock
            - description: HCLK which used for host
            - description: independent source clock gate
        clock-names:
          minItems: 2
          items:
            - const: source
            - const: hclk
            - const: source_cg

Without a corresponding allOf constraint for airoha,an7581-mmc, device tree
nodes using this compatible can specify between 2 and 7 clocks with
arbitrary clock-names and pass dt_binding_check, only to fail at runtime in
msdc_of_clock_parse().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026102138.3678=
6-1-ansuelsmth@gmail.com?part=3D1
