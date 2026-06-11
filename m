Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CBE30DEA6
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171888; cv=none; b=CjrD0oC44cJDN572LxG+2Og8Er6nPuEp9+REkU49jCRVQbXmdsWPWI9Y5XGfCnsvGEIVx9q171vaA65UDbb2QrqRfM1FTdCBHjRo1cDVHoAdMkeykCUbRbNe8Q05dLyn/twfX4LzoiWUznORn/lteocWKDS4CKgBTPEXs9uPDfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171888; c=relaxed/simple;
	bh=bqHbnrNqwl1WVLgYjH99IKCn8gfzRfGu/LP4Cb02ijU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YisR2dbnTB5cb9ODNQjk6GhCId3qYNi9yEY1OS1sQfxQYmclGvBqZbvnykLhDSv12Co+qKRt5wwwQTcnwc2tLrDUFL2vaz1dm76ru1ynv3Xcyn6qsaOmZx4ANNMre6dV3CRx6YfrjaIhoT7XP6PMWc7iRtnYkTkTROR6+dIU8y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGoN3KpZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGoN3KpZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2271F00893;
	Thu, 11 Jun 2026 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171887;
	bh=Rmz9AQgaqtdce+A7YODt8hlWX0/c55XL2wlzkiUuMgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BGoN3KpZywq0osVW5xMMaRHNq/DNpVrxgsrBRKU6rQPycORLdOH/rIQTItXI117gv
	 VnCGdOsf61ZR0mcAanW7nlI91FqpVDqL0+mLrm9aifVAYqoQNqgkIaATGljUL56oVa
	 /xQOIBjItCP2eFn0E5/gD4jWu2bPNhguM1BsJ6F0C+Hr3Y40+Gv4+ZXIzkconSLbb0
	 EaOxw/wjReO3pzkPdsFuMvXj0Tf1bKLvLuGMhUpNXSZME27jRu8F6uVe643uxNGFzO
	 WI9ah3ye2ayC6HtWtj6raOkWPW2BBClDP4QUzyytBysgN0mxOsT+tKAOlhl6/bLV3n
	 jRkZ69vVKbwoA==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v1 1/6] dt-bindings: net: dwmac: Add snps,use-ncsi
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610072420.64699-2-minda.chen@starfivetech.com>
References: <20260610072420.64699-2-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:58:05 +0000
Message-Id: <20260611095806.AA2271F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Introduces a vendor-prefixed property (`snps,use-ncsi`) for a ge=
neric, standard hardware feature (NC-SI) that is already widely used withou=
t a prefix.
--

commit 9f79574dbd128266dea8e1a64bd86e9a7c9ea506
Author: Minda Chen <minda.chen@starfivetech.com>

dt-bindings: net: dwmac: Add snps,use-ncsi property

Add snps,use-ncsi dts bindings property for Synopsys designware
ethernet MAC with RMII interface and used as sideband interface
network controller(NCSI).

> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index 2449311c6d28e..05b1d8428f653 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -545,6 +545,13 @@ properties:
>        Enables the TSO feature otherwise it will be managed by MAC HW cap=
ability
>        register.
> =20
> +  snps,use-ncsi:

[Severity: Medium]
Is a vendor prefix appropriate for this hardware feature?

NC-SI is a standard protocol supported by the kernel's core net/ncsi/
subsystem. It appears the boolean property use-ncsi is already a de-facto
standard used across the tree for this concept (such as in the ftgmac100
driver and ASPEED device trees).

Should this be formally documented as a generic property in
Documentation/devicetree/bindings/net/ethernet-controller.yaml and used
here without the vendor prefix to prevent fragmenting the ecosystem?

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Use the NC-SI stack instead of an MDIO PHY. Currently assumes
> +      rmii (100bT) but kept as a separate property in case NC-SI grows s=
upport
> +      for a gigabit link.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610072420.6469=
9-1-minda.chen@starfivetech.com?part=3D1
