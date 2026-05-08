Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A7D40DFBF
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260490; cv=none; b=oBVCDwtTMYIZ6HS9+AbZyjLTifvntyTkQGkA8uFXJamwo3/t6weaZWQhfBd7VwKaa8otPGhk6QXcFBzSI4pYNSkmQ59vh6br9jyukWoCBfDSUKUKufj/CLWCDHSzyCoUx/f4ZGW7cboK4IbrSPB/9Z1YIAftaYYk1R+HOXhNOMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260490; c=relaxed/simple;
	bh=/+5YOWfAyFlc7tSRH9NT31OWdj1ZFZgkOWg9Xnf/xj8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KPf1NtoIJANbh78M0p2TN+CmCr7IrRMB2h7zyPvsUmHAZDpo8jv4nIApraabCUQJLCZKKlzJo6PE2RPlj6BQdSzRg4HB85Z75eBlJkbvAQzwFv/YKT8onMn9jFbHGn7zm0YKSw/lG+WR72UNPAxDVt0M3E4qoeTKf8OZryOCPdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gklyp4PK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gklyp4PK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CACC2BCB0;
	Fri,  8 May 2026 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778260489;
	bh=/+5YOWfAyFlc7tSRH9NT31OWdj1ZFZgkOWg9Xnf/xj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Gklyp4PKyejUy0ia3EQy9k4cNwDj0DrhNcVToIRjfS+VYq9mdXTK3nYP7jv/xuR82
	 SYEP9E2LTerF3fbxWLJEEPZ/Fpn9rVl1UXMd/xXchQevBLjMCZhJy46R1hT78yJik2
	 XaVx4IjfXdfUm/DYipbNaUJabi1gIChLKkQaW4N7vFKIUGEA0Rc6f85Pfq7QYX6yUX
	 nccOPC1Z+c9lUfBDehIB/OUYrlqhjCYsMi8p26EIijRXPB9nG57kGWMydFYqXtvHRa
	 OuqPUzOtgkUbA10/amZiY/Adj9x1b5p5owU8SDHPN2ILInJATlggoMQU/LEYq6sgG9
	 WiKRanTiJTY/g==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v3 2/5] dt-bindings: net: starfive,jh7110-dwmac: Add
 jhb100 support
Reply-To: sashiko@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260507094115.8355-3-minda.chen@starfivetech.com>
References: <20260507094115.8355-3-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 17:14:48 +0000
Message-Id: <20260508171449.62CACC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The compatible string 'starfive,jhb100-dwmac' incorrectly uses '=
starfive,jh7110-dwmac' as a fallback, violating Device Tree ABI backwards c=
ompatibility rules.
- [Medium] The schema logic for 'starfive,jhb100-dwmac' relies on the inval=
id fallback string, resulting in incorrect nesting and missing 'select' val=
idation.
--

commit 99d98f58cde78e6cc89acf897a5b4bac3713e9c4
Author: Minda Chen <minda.chen@starfivetech.com>

dt-bindings: net: starfive,jh7110-dwmac: Add jhb100 support

This commit adds support for the jhb100 GMAC, which is based on the Synopsys
designware GMAC core. It introduces a new compatible string and updates the
interrupt and reset constraints, as the jhb100 hardware has only one reset
signal and one interrupt line.

> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.=
yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -30,6 +30,10 @@ properties:
>        - items:
>            - const: starfive,jh7110-dwmac
>            - const: snps,dwmac-5.20
> +      - items:
> +          - const: starfive,jhb100-dwmac
> +          - const: starfive,jh7110-dwmac
> +          - const: snps,dwmac-5.20

The starfive,jhb100-dwmac hardware physically provides only 1 interrupt and
1 reset, but the fallback starfive,jh7110-dwmac strictly requires 3
interrupts and 2 resets. Does this break Device Tree ABI backwards
compatibility?=20

An unmodified legacy operating system matching the fallback would expect the
missing resources and might fail to initialize. Should the
starfive,jh7110-dwmac fallback be removed from this list?

[ ... ]

> @@ -107,20 +111,39 @@ allOf:
>            contains:
>              const: starfive,jh7110-dwmac
>      then:
> -      properties:
> -        interrupts:
> -          minItems: 3
> -          maxItems: 3
> -
> -        interrupt-names:
> -          minItems: 3
> -          maxItems: 3
> -
> -        resets:
> -          minItems: 2
> -
> -        reset-names:
> -          minItems: 2
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              const: starfive,jhb100-dwmac

These interrupt and reset constraints for jhb100 are nested inside an outer
condition checking for starfive,jh7110-dwmac. If the invalid fallback is
removed from the compatible array above, will jhb100 nodes fail this outer
condition and silently bypass their specific constraints?

Furthermore, if a device tree correctly drops the jh7110 fallback, will
dt_binding_check silently ignore the jhb100 node entirely because it is
missing from the custom select block at the top of the schema?=20

Could these constraints be evaluated in an independent if block, and the
new compatible string be added to the select block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260507094115.8355=
-1-minda.chen@starfivetech.com?part=3D2
