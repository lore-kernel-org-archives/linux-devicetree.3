Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA81439C011
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 22:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778278946; cv=none; b=iB+OfShkCZnlVPeAlALQELasJZ5LF+LZoQmP2Egq8VBRKH44P/Z013szDofVfDy0ekvl9AnApy2uzLhFcntlNw4p3UiMD/wGG1mva794Isq8ngMY6QH6n47Yg1fF3U18vXvnizwNIAQKdzpet4rNdHKBu7dcZ/wi423po34zF4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778278946; c=relaxed/simple;
	bh=yAdEZ5EU8lZ581zGxLIAGEJDKMZb5yAsNiIsnhNE08c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lRPDqShkhedU8UK4TUdWCpcEzTDvicHqf60yRzXx1i6TJggdXj4oCgRpoKja3budLp0zuz8BYNOxRT6IC6Mc8vommCXSgQQ0Lvtbp2ghtS0KB2swT5qn4PgwG7/wUqJq7w6e3xseMT1D3Whnc2CORJ1XJeAi1S7t7KGhV7Pn2+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIY2CHED; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIY2CHED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E854C2BCB4;
	Fri,  8 May 2026 22:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778278945;
	bh=yAdEZ5EU8lZ581zGxLIAGEJDKMZb5yAsNiIsnhNE08c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SIY2CHEDDrE7+hMk1ApDraaoGXS+vLEhQnxZAO1lhY2YtnIIgZ42ecXODNdc6nxN5
	 qzWAdyiwJ9f0bSJp4cbwfQZyf7ivVAFnIVFNt3Giwr9n6JOhYmwHszQ2dyQyRQ7d8p
	 StEAUNVm74Lyd6yxWeTju2O53KBaaa7MhoEffFlG7popLpOYa78yXhRxtIuo4g+rC3
	 ydnJrnf8mnoWHi9BZJtWMYB4bfxgG5X3f1s1hQq5Qo+9R9cI+nByXU7fpK2JP9FqYb
	 W+ubV6ZOiG5G+udnmEPMwCwCIkdDeK+KlwWmoe0qVBb+C+IY0bZJurCwQnk99nC5NF
	 /a8e1+AhH3/jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: mmc: st,sdhci: convert to DT schema
Reply-To: sashiko@lists.linux.dev
To: "Charan Pedumuru" <charan.pedumuru@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508-st-mmc-v3-2-81c329ed28e8@gmail.com>
References: <20260508-st-mmc-v3-2-81c329ed28e8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 22:22:24 +0000
Message-Id: <20260508222225.1E854C2BCB4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `minItems: 1` for `clock-names` and `reg-names` restrict=
s them to exactly two items, breaking schema validation for existing device=
 trees.
--

commit 66ec88f9e00b102af921864d0e0bf8b1b9e7f38d
Author: Charan Pedumuru <charan.pedumuru@gmail.com>
dt-bindings: mmc: st,sdhci: convert to DT schema

This commit converts the STMicroelectronics sdhci-st MMC/SD controller
binding to DT schema. It updates the clock and register properties to
support backward compatibility for single-item entries.

>     - In the legacy text binding, 'icn' was optional. Keep the clock list
>       flexible to preserve compatibility, although all existing in-tree D=
TS
>       files already provide both clocks.
>     - Document the optional "top-mmc-delay" register region and correspon=
ding
>       reg-name in the YAML binding, as existing in-tree DTS files already=
 use
>       both "mmc" and "top-mmc-delay" entries.

Are these descriptions accurate regarding all existing in-tree DTS files?

In arch/arm/boot/dts/st/stih407-family.dtsi, the mmc1 node defines only a
single register name (reg-names =3D "mmc"). Other device trees such as
arch/powerpc/boot/dts/fsp2.dts also define a single clock and register.

> diff --git a/Documentation/devicetree/bindings/mmc/st,sdhci.yaml b/Docume=
ntation/devicetree/bindings/mmc/st,sdhci.yaml
> new file mode 100644
> index 0000000000000..10e0e1ee6d5cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/st,sdhci.yaml

[ ... ]

> +  reg:
> +    minItems: 1
> +    items:
> +      - description: MMC controller registers
> +      - description: MMC delay/auxiliary registers
> +
> +  reg-names:
> +    items:
> +      - const: mmc
> +      - const: top-mmc-delay

Because items lists without an explicit minItems default to the length of
the list, does this strictly require two items for reg-names?

Will this cause make dtbs_check to fail for existing nodes like mmc1 that
only provide "mmc"? Should minItems: 1 be added here to allow single entrie=
s?

[ ... ]

> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Clock for the MMC controller
> +      - description: Interconnect (ICN) clock
> +
> +  clock-names:
> +    items:
> +      - const: mmc
> +      - const: icn

Similarly, does clock-names require minItems: 1 to match the flexibility
added to the clocks property and prevent schema validation errors on
single-clock configurations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-st-mmc-v3-=
0-81c329ed28e8@gmail.com?part=3D2
