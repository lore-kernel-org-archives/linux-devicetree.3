Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA76480DD2
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 21:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694735; cv=none; b=c9xisN+tmoOe8d8jCGsEbImVHEJc2ywiKuGsfpZ40yDshJDwNZphUiRkfXzLeIMWnd85lPVXVn3EgMLwKe5mEEJY3DJzGHKV1EORCa77szKOwRMw/u+uEtWZ3d+9UWxyMpX3VfVXUl9iTbyphFN1acW0K52LwrVdN5+Yx7pS43k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694735; c=relaxed/simple;
	bh=9urqaBXMRvdeKmTitin4n24CTwpU6Hx/UTxyGnxq+lc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WOCJYwmKRrryXC6Xx74D9MjJXoHZA/yx27CSFlN9VXkb4gymRYYFEJmlmQtCMh66M2tkp1SSGsVym41ZkQ2OTy+4cEl7d5xfqpqogRTqBOtSHiTiCkjOQlzQeNYY451L6iQJmKKzx3Fs7MxnQE4c/xaFdz2MaqpVZr809IfcH64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Adl2XUf/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Adl2XUf/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D231F00893;
	Fri,  5 Jun 2026 21:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780694733;
	bh=1i7DG+oE+Jvh+dFd9b7fGMC8VHle/z7ECBioH8hhsJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Adl2XUf/i9UbFL2Vd4zcDLv29HZc6v6S6QcHizS8OfdBql4QuA3a61nnZ6sN57xbl
	 /8Z2kulb4F9GvP25SY9zYWoJIi9waL2o8rOJcfZJYoyem0Oh0dGFRe6gwSIrworFge
	 dVY+0mszz5846mgOPVctOoqpQcJyLVG+NdbYG9rvWa4fPhMncLLuE69JosbpVTgx4j
	 Hq3pdfkBRJ9RY0OZZ5pPtaofHXl63k3HKhWa4pFFG7oBowoIxHj4vdF78xXFToitu6
	 Lg6ELtpP6RP3L+eMIoPfJm197knpgP3p4Z9xb09Gzxcje99t4O6yF67uL1HkTf7rE8
	 5Z4d1TQ3n7WMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller:
 realtek,rtl-intc: Allow 2 interrupt cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605211646.2101652-2-markus.stockhausen@gmx.de>
References: <20260605211646.2101652-2-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:25:33 +0000
Message-Id: <20260605212533.75D231F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The cell-count property `#interrupt-cells` uses an `enum` constr=
aint instead of a `const` constraint, violating dt-bindings subsystem rules.
--

commit 11a7c1b034a74e6212dca3ea81cd1ec7e513c49c
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

dt-bindings: interrupt-controller: realtek,rtl-intc: Allow 2 interrupt cells

This commit updates the #interrupt-cells property to accept either 1 or 2
cells to support explicit hardware interrupt routing to multiple parent CPU
interrupt lines.

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/realt=
ek,rtl-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/r=
ealtek,rtl-intc.yaml
> --- a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-=
intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-=
intc.yaml
> @@ -32,8 +32,9 @@ properties:
> =20
>    "#interrupt-cells":
>      description:
> -      SoC interrupt line index.
> -    const: 1
> +      First cell is the SoC interrupt line index. Optional second cell
> +      specifies the parent interrupt index to route to.
> +    enum: [1, 2]

[Severity: Medium]
Does this change violate the subsystem requirements for cell-count properti=
es?

The device tree binding subsystem rules require that each cell-count proper=
ty
must have a const constraint matching the hardware (for example, const: 2).
Changing this constraint to use an enum instead of a const can lead to
incomplete or unreliable schema validation during dt_binding_check, as
downstream node references rely on a fixed cell count constraint to validate
interrupt specifiers properly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605211646.2101=
652-1-markus.stockhausen@gmx.de?part=3D1
