Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C463DE42B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 06:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493007; cv=none; b=Vw0s/p8pQfPDf7xj8/AgwXXoXZ7uNRDS1BXRJsHzrrJMliGMmeiIoClLA3o5QgPDEqnSU8gUitKet+eC+VLwQEefl08/K+a5pTstV3BBY0iK3+NYkVzk63csdpbjebDnB758U0hXhccU9VOCJ3qm6sB8Byz2IY9a5FNvD0k2WEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493007; c=relaxed/simple;
	bh=VvR0I6b1SaFip5pAQWjswdBd/y04KKMnsFQ8IFCG/jE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hBRs2sGJ8OzVYU4NbWYsoovqte+bZoRFW4YHhW5UsunJEtFtz0NXkHpbzHogAbf024MW5QalWID4iukCFcqjy+Q+Mfjme1q1FsNT3On4be2ZCcnMnaHLDIFin2qF1xAa+rpsa2xgZh8hF5rg2qbjZkAGm7mx4Zvfkim2sx47wok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgXGgJ+8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgXGgJ+8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AA11F01559;
	Wed,  8 Jul 2026 06:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783493004;
	bh=txL4kb+hcFaqWiayDInYVgFVG30OUPAq3czAPGaykHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bgXGgJ+8mYOvHLDYf3h1NyPFQrG78o4DUuDUdYBa7mWTf2dy2yBr3sN92/nfpK1nF
	 6vaWrrLDL0Vl0QAYH86AqemQclidAwM9lTzZ5wDY1vnGp7AaUeUJdFlWtjvYTHRKrB
	 Zh1UljrsRa9V9PCDZmzG33O6fkbZMircsbn4u2dppj/sG9U71l+teve4rY1sadwCrR
	 gZ9Yjpu0ISDET6U+egeo0+ksln2pBi8vl90QfSHpOP/0knJUAjvZGd0+4m3b76d4ce
	 Cohf6wFdb7+iiiQGPAupGI8nDZmd2KQPcpGu+jSrtnB9S6qoIZJFlYRk7lTRTNyOy3
	 B6zHiO9FUd6XQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 2/4] dt-bindings: ethernet: eswin: add
 EIC7700 eth1 RX clock inversion variant
Reply-To: sashiko-reviews@lists.linux.dev
To: lizhi2@eswincomputing.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260707064159.1299-1-lizhi2@eswincomputing.com>
References: <20260707064033.1265-1-lizhi2@eswincomputing.com>
 <20260707064159.1299-1-lizhi2@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 06:43:23 +0000
Message-Id: <20260708064324.45AA11F01559@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The 'rx-internal-delay-ps' and 'tx-internal-delay-ps' properties=
 were removed from the schema's 'required' list and examples, but the platf=
orm driver still strictly requires them, causing predictable boot failures =
for device trees following the updated schema.
--

--- Patch [2]: [PATCH net-next v10 2/4] dt-bindings: ethernet: eswin: add E=
IC7700 eth1 RX clock inversion variant ---
commit 2e11e791f4a16ddedd931815efa250107b187a70
Author: Zhi Li <lizhi2@eswincomputing.com>

dt-bindings: ethernet: eswin: add EIC7700 eth1 RX clock inversion variant

This commit introduces a new compatible string for the EIC7700 eth1 MAC to
handle RX clock inversion. It also models the TX internal delay as a base
range and updates constraints based on the compatible string.

> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml=
 b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> index 4e02fedae5c67..ba49fd6a086cb 100644
> --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml

[ ... ]

> @@ -140,3 +161,29 @@ examples:
>              snps,wr_osr_lmt =3D <2>;
>          };
>      };
> +
> +    ethernet@50410000 {
> +        compatible =3D "eswin,eic7700-qos-eth-clk-inversion", "snps,dwma=
c-5.20";
> +        reg =3D <0x50410000 0x10000>;
> +        interrupt-parent =3D <&plic>;
> +        interrupts =3D <70>;
> +        interrupt-names =3D "macirq";
> +        clocks =3D <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
> +                <&d0_clock 194>;
> +        clock-names =3D "axi", "cfg", "stmmaceth", "tx";
> +        resets =3D <&reset 94>;
> +        reset-names =3D "stmmaceth";
> +        eswin,hsp-sp-csr =3D <&hsp_sp_csr 0x200 0x208 0x218 0x214 0x21c>;
> +        phy-handle =3D <&gmac1_phy0>;
> +        phy-mode =3D "rgmii-id";
> +        snps,aal;
> +        snps,fixed-burst;
> +        snps,tso;
> +        snps,axi-config =3D <&stmmac_axi_setup_gmac1>;
> +
> +        stmmac_axi_setup_gmac1: stmmac-axi-config {
> +            snps,blen =3D <0 0 0 0 16 8 4>;
> +            snps,rd_osr_lmt =3D <2>;
> +            snps,wr_osr_lmt =3D <2>;
> +        };
> +    };

[Severity: Medium]
Will this example cause a probe failure if copied by device tree authors?=20

The new example omits the tx-internal-delay-ps and rx-internal-delay-ps
properties, but the platform driver rigidly enforces their presence:

drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:eic7700_dwmac_probe() {
    ...
    } else {
        return dev_err_probe(&pdev->dev, -EINVAL,
            "missing required property tx-internal-delay-ps\n");
    }
    ...
}

If someone uses this example as a template, it looks like eic7700_dwmac_pro=
be()=20
will unconditionally return -EINVAL during boot. Does the driver need to be=
=20
updated to handle these missing properties, or should the delay properties =
be=20
added back to this example?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707064033.1265=
-1-lizhi2@eswincomputing.com?part=3D2
