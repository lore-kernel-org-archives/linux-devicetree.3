Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB37E4AA02A
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637711; cv=none; b=j3IPSRPeden5WXYeh8sDnGMxErUN9fuMtKSrq7LCYK7pd51xjXcvN3y1mxuUYZwz/GyFsWABMi+KiBIMCtRWTtwhdTGdPBRqN31GYiL//CSM7DQZIK1su9c6nt5Umn/HaMMKaFUwFDL3zUYKy5ldmjVOCUvGbyTOjDYlVup+Z7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637711; c=relaxed/simple;
	bh=hTnwrE29rWvMsm9QbkiY9ALu46DCCEcBPoXKAMMrRiw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JuFlA1vQsbtXtP4tlu1b74dkb8FhXzIbaCekeeUqH7g0ewMm3Nn4CJpHiBOq0e44sx3YD7LXT7m+QpzvcV7yAjSkZt894XUfQ5FdabMcJG6sLfTm5GRO4JM6FUD+ikMo/8qseUzIRlylRZ+80ySgZpbDL0j2V+dhm64cxN841Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4sKR9W1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4sKR9W1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DE01F00893;
	Sat, 10 Oct 2026 13:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637708;
	bh=oPKTNifDd12aCVHxU9McRC3jga/jgRNiHAlytMQPSlE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A4sKR9W1C8/CM9iOjWdnRIovBIps0ziDMY92gpMpmntdqedCnYue7Opmv7CTu4EOf
	 R5JUsqfLg4nY8fc2U07SWKfGquB4yZO1W8C540+MUUlBW8vRSFznM/hA7/uSxLVrI4
	 IKihJJ7Jj9fMN/y5Dm19gZZaU/F8pvZTfdH/avi1c+6FwBatSUBrYXzhy/kc+BBxBN
	 jPFufIiBWHPYICPgvZyv1uyEh4YT6GKBsJLOTaw90C/LprJOXEqQ0hjo5Q9+bs6oTI
	 PGN2fJi3a/ppXeQ3ybe6Sy0d/n4qy4YNJ0Vv07rM8eb2bwr8bSgglG3IZSp6PemBtf
	 6XpqCL0sFVNBw==
Message-ID: <sashiko-outbox-166565@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/24] dt-bindings: mfd: syscon: Add ZX279128S system
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010130024.177503-12-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-12-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:08:27 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: syscon: missing provider properties for zte,zx27912=
8s-crm2
--

commit 942a9a1a223eab1257c9aca18072ed465ea30ecf
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

dt-bindings: mfd: syscon: Add ZX279128S system controller

This commit adds the zte,zx279128s-crm2 compatible string to the generic
syscon list in mfd/syscon.yaml to describe the remaining system-control
syscon for the ZX279128S platform.

> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
[ ... ]
>                - ti,j784s4-acspcie-proxy-ctrl
>                - ti,j784s4-pcie-ctrl
>                - ti,keystone-pllctrl
> +              - zte,zx279128s-crm2

[Severity: Medium]
The commit message explicitly notes that this hardware involves PCIe clock,
reset, and PHY modeling. If this compatible string acts as a hardware
provider for these capabilities, shouldn't standard properties like
#clock-cells, #reset-cells, or #phy-cells be documented in the schema and
added to a required list with appropriate constraints?

Without these constraints defined, a device tree using zte,zx279128s-crm2
might pass schema validation even when missing required properties.
Alternatively, valid nodes could fail validation if unevaluatedProperties is
enforced without these cells being defined in the schema.

If these provider capabilities require detailed modeling, would it be better
to document this hardware variant in a dedicated YAML file rather than addi=
ng
it to the generic syscon schema?

>            - const: syscon

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D11
