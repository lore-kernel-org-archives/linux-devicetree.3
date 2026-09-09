Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF70835C1A6
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937634; cv=none; b=bOvmLNyzmKWgRIK02GcuduTeFxXbrmG0TxB++A5sc5T5GRWWfe2HbB6/O1wXubsKPTfaYB8mga9GJiehMc7469VcXrOQ2BCLsAT32pj6EJk5UFFSkEUTx/ZbhCLgclUUK+cYYfR2B6zb+YrZFKvWF1FCxpVE9F2rf09DhJqxzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937634; c=relaxed/simple;
	bh=QsGfwNge1A/U7f2ofNP/GMhsSTia3o8S8jgBTMUT1wE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h4K079iQzXKu82x7vNxZRS1zC/G9nVH7IN6ytlCNER3bK2eWEIAv1OvqH07Pc8m29Q4Cay3ZCRjTnnuV2g3ZPyxkmqWcuGYqRfL6MkpAPySqHMfvql5phCfKzWyA/qagDzodaZcFX2LK/eqfcH1W5uK0ZlRTUjbDURSAepjH18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2Di/Vn9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2Di/Vn9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB8E1F00A3A;
	Wed,  9 Sep 2026 07:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788937631;
	bh=Ca76rAgII9NhEMOf4KIkGHe956FpUIMOnnG6G8MaZSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z2Di/Vn9/JRElGnwXBHzB9eUbavwLrtqIRWnIbckeGPn8WwaK/ePPtCKP0/goDJIZ
	 5wNkJASLlRArUvjM4VRREcwSx6MVhs8pPBgQYFsmLtjJBJw/mxweyyTpRZGh2t7hVP
	 5RAY1f71kdoB/NOln373PYg01pgpO/MfzdzdxmPot2FnXE+WE0j8lxNyzER/nzPe7X
	 YWn2mqJNo04vhAiuBsmHm4XJAZPqT3tCK3wCnrU6KMCQXTr9Nz+NT25LnhWc4mSaTi
	 B3PvxSc0s1VdltrEnJRCF7ilme9O4MU7WEeO8Ys7H2238fY5r3VKlVjQfARAS2KrGD
	 SO7F1cXfRNS6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] dt-bindings: net: altr,socfpga-stmmac: Add
 altr,socfpga-stmmac-agilex5-tsn compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908070557.3585-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260908070557.3585-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260908070557.3585-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 07:07:10 +0000
Message-Id: <20260909070711.1EB8E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The conditional block applying Agilex5-specific constraints in t=
he dt-binding was not updated to include the new `altr,socfpga-stmmac-agile=
x5-tsn` compatible string, leading to incorrect validation constraints.
--

commit b74ca4590795b8666403b95078f84d25977f7624
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
> index db93436c96fa6..9150504e922be 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
[ ... ]
> @@ -44,7 +45,9 @@ properties:
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
Will this new compatible string cause incomplete schema validation for devi=
ce
trees because it is missing from the conditional block?

Looking at the allOf conditional block later in the file:

  - if:
      properties:
        compatible:
          contains:
            const: altr,socfpga-stmmac-agilex5
    then:
      properties:
        interrupts:
          minItems: 17

Should this block be updated to use an enum that matches both
altr,socfpga-stmmac-agilex5 and altr,socfpga-stmmac-agilex5-tsn so the corr=
ect
hardware constraints are applied?

Without this update, device trees for the TSN variant might fail validation
when they correctly have 17 interrupts, or pass validation when they
incorrectly have fewer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908070557.3585=
-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D3
