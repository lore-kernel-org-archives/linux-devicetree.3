Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3E93A1A22
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113575; cv=none; b=Oatc9XnTQG/gXjqKpQiQurqclQWle53z5Lg7qlSJZUEk2Qnc7boHlisA28a3C7o3MuEOYhZNcAVYemjfQpMBmOKWXMt9J1HahRrfSk0/7znOhvK4PFzyPntvijP8p/hFxv/gFd2k1s12On0G2+wJWQd3kzjH+PJN/1p+scPqp2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113575; c=relaxed/simple;
	bh=3vysSe90lxS+HP8trmE1r4wyLsNrPYJfe+KYVf+UU74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q2bLJi61DYZRwK56arI8Xcpj7I/yAGUTYw9FALP0FucyybhlC2723/M1ngsBAZSV2xN2u1tfiElK2DG0t2M15LZ0h68LNDsoC+lectxP86zyQscJ72KGPcu2F5DiJ3E+WKU1ttH+lb0m11UmXihsd5lcQ/7wGwsadXCvyRfQPE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mE2fDLvw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mE2fDLvw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301141F000E9;
	Fri,  7 Aug 2026 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786113568;
	bh=LfBzBH9SIZM1qLjY+zCid1ws+vnmnwFrYtLsL0Gpyf4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mE2fDLvww+hFeWKx9h8UpuZufcqATk/5QpJ0txnstlMb1BQBpgSqNKceeCVfADxyE
	 BhbIcEg5XnaZiS4hbKrAAnzpM0jGLKh9YEow0kkasOPXNS0QQGHl9nxQM/djPoZPov
	 YiUiNbRr6lP+VgQbv75p1RL61nauwZ5SYnB08UWwiMPoM2CtPnLerKqmiHwzgzAaG4
	 brMxmfbxYvIiR9XHZoB/KLBdYS3ymS943Maw+OVYnDfOgIaS5VCI5noTn8p3Gf2lQD
	 MZQ+08FwQGh9rEohZoQEgOMOtdkuWcl2fuwsJk4XO9DvN6nMFS39EakBYKXt9yFNne
	 gWZJhs/Pax7jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 03/10] dt-bindings: bluetooth: qcom: Add NVMEM BD
 address cell
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-block-as-nvmem-v10-3-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
 <20260806-block-as-nvmem-v10-3-be598b2a5606@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 14:39:27 +0000
Message-Id: <20260807143928.301141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing C implementation for Bluetooth NVMEM cell consumption.
--

--- Patch [3]: [PATCH v10 03/10] dt-bindings: bluetooth: qcom: Add NVMEM BD=
 address cell ---
commit fd2db3f3069a2b6bb144aea20efff2a8e20aaf2a
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>
dt-bindings: bluetooth: qcom: Add NVMEM BD address cell

This commit adds support for an NVMEM cell provider for local-bd-address
in the Qualcomm Bluetooth device tree binding. It intends to allow the
Bluetooth stack to retrieve the controller's BD address from non-volatile
storage.

> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetoo=
th-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluet=
ooth-common.yaml
> --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-comm=
on.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-comm=
on.yaml
[ ... ]
> @@ -22,4 +22,13 @@ properties:
>      description:
>        boot firmware is incorrectly passing the address in big-endian ord=
er
> =20
> +  nvmem-cells:
> +    maxItems: 1

[Severity: Medium]
Is the C code implementation to read this cell missing from this patch seri=
es?

The commit message mentions this allows the Bluetooth stack to retrieve the
controller's BD address from non-volatile storage. However, unlike the
networking stack (which natively resolves mac-address NVMEM cells via
of_get_mac_address_nvmem()), the Bluetooth stack currently only reads the
static local-bd-address firmware node property via
fwnode_property_read_u8_array() in net/bluetooth/hci_sync.c.

Does there need to be a corresponding patch that implements nvmem_cell_get()
for local-bd-address in the Bluetooth core or Qualcomm drivers for this
binding to actually be functional?

> +    description:
> +      Nvmem data cell that contains a 6 byte BD address with the most
> +      significant byte first (big-endian).
> +
> +  nvmem-cell-names:
> +    const: local-bd-address
> +
>  additionalProperties: true

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-block-as-n=
vmem-v10-0-be598b2a5606@oss.qualcomm.com?part=3D3
