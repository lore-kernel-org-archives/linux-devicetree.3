Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953B73CF217
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 02:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790216326; cv=none; b=NOCgpokkJKV+TqgLFQq8L0o8vWa/oXyoRb110ep5bDgYeK95c9uHy+X9WR27IXECymrKXNCbjMgHvDA6+kOET/w0ip9r8HtsU2aq9LCMe03mk9nyk4DPd+WMEviZSrAcyZs+/jeNiwOzhyxSMO94VMchNEBZKfFftpfjuG8NibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790216326; c=relaxed/simple;
	bh=pR7SIiXiLJvcP04f1zB3hxD7FXW0xRw4EYgtE6CQohQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LcgHXlbp4iMTkssefqDdZzUfKeD4NlR8Cvk3qZD4nQdH0PkG31b8DrzvBBi7dtTjg/T/RbqoA153s+ePPNPYlh115LSbaTNSSsQvDEjmBeXg+k7okYLaWYJOH30TS4dZ49tgmc7Hnm655ewoLD8dnt2d856DoPVkgA/j2UN2czI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfHG3GIU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfHG3GIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D2A1F000FF;
	Thu, 24 Sep 2026 02:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790216324;
	bh=zL7JtMfNecyQWi4O0iy/2Tg3hTaG2r0UhdpVlg/Xzuk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LfHG3GIUwP7vtGAjX+PYPn8zgcgtyBHN4q6o/gMdl5xjLXIuRZwFM5bM4q0cbKb1R
	 3WIwEhq9Hj7Hqbpvnm2d2zKCE3Krg4bL2FrAdwFxZ0LA+lbM/i45LHwCUgV7urL8/d
	 iePSvhM6E/bWZ12KiQBDrMZFVygl00j8X2CxVIo2Gj7qY3q1A/jSeguYWV7X0TGYbU
	 Q0cpmIJPR9IM8KvBesoFpUnZl1NaehcZ5goyrXcB2kszDBT4phyZk6E8MT7x+NT97T
	 HxqYxp0lsSuRWhRe27CaCoBkKLQmwXOdj7HeucE6PjdsbMxcIIbN8qfkFUwjIWCRHh
	 /7p6xA5hLLlhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: altr,socfpga-stmmac: Add
 altr,socfpga-stmmac-agilex5-tsn compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260923021823.46649-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260923021823.46649-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260923021823.46649-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 02:18:44 +0000
Message-Id: <20260924021844.89D2A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing agilex5-tsn compatible in allOf constraints
--

commit da393d02e6d50cb4f0bb95604f9b3890a2fc868b
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

dt-bindings: net: altr,socfpga-stmmac: Add altr,socfpga-stmmac-agilex5-tsn =
compatible
   =20
The Agilex5 SoCDK TSN Config2 gmac1 path includes an FPGA soft-IP
GMII-to-RGMII converter between the DWXGMAC and the PHY. The converter
provides the RGMII TX/RX delays and presents GMII toward the MAC, unlike
a plain altr,socfpga-stmmac-agilex5 port with no such converter.

> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.ya=
ml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index d8f90d36d2469..ca768937d8905 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
[ ... ]
> @@ -42,7 +43,9 @@ properties:
>            - const: snps,dwmac-3.74a
>            - const: snps,dwmac
>        - items:
> -          - const: altr,socfpga-stmmac-agilex5
> +          - enum:
> +              - altr,socfpga-stmmac-agilex5
> +              - altr,socfpga-stmmac-agilex5-tsn
>            - const: snps,dwxgmac-2.10
> =20
>    clocks:

[Severity: Medium]
Since this adds a new Agilex5 compatible string, should it also be included
in the allOf conditional block further down in the file?

Currently, the schema in this file enforces Agilex5 constraints:

allOf:
  - if:
      properties:
        compatible:
          contains:
            const: altr,socfpga-stmmac-agilex5
    then:
      properties:
        interrupts:
          minItems: 17
        dma-coherent: true
    else:
      properties:
        interrupts:
          maxItems: 1
        dma-coherent: false

Without adding the new TSN compatible to this if condition, nodes using it
will incorrectly fall into the legacy else branch, restricting them to 1
interrupt and disabling dma-coherent.

Does this new hardware variant share the 17 interrupts and dma-coherent
constraints of the base Agilex5?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923021823.4664=
9-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D1
