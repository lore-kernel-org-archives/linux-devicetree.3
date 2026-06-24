Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3523421638D
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336832; cv=none; b=uy7awmLh1v1wEmvNjy8CCovXkf4CO7PepbC65KIT3Ecfd7ZBmL/kmPuhFN1xci/BhY0BYdR2KlEIWbnHMXNUpdILu36V5DCDTlwzr9lICWrBUJKNuN3LjB99LmLFHn4Xb3eQ92V3MOeo/cLd/aidgA4BBkgBh8Z0RTmNuDWf7xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336832; c=relaxed/simple;
	bh=XC9DvcdxfRqH6e+QHvEsTY6CIcqVX5td/OvX3btUxiw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qdKJAhT/URbKkfN3UEREVO1WmkTwlMM2S4qIifTdwmbYFAtckfPq+z/O/gWVAOrYwkHxNsXTVHBVDIcsSCFg3339FK2gtgqeekvd6VzJp5JYQVrFAtKSfhVfpL34i/bzGIf5xNb0W4+t0XDTIL9268VqVjXNbKZf9SzCl+jm/XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWkmZG5v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWkmZG5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B16E1F000E9;
	Wed, 24 Jun 2026 21:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782336830;
	bh=VEecx2ukaNUiHmEgy5hxp8Wsgrlbl9rJjXH3rungH+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WWkmZG5vjEAA5oUx6WHiaJX7ku+5CwVJ8yyHOF+RfezziKhb8gHUrEb7O6wqdSdTm
	 MjqyYY3zmMPsJJnsQlxA80Z1ofA7lZ8dTM8MYfDBmchIPhM7NOPQMZlC65GLjV0HrG
	 QW+6MlgDgwUC2CENmzoF9Pz3gmEMWYy4nPgxaxYZJFor+QIYnsH1KcYdqJ8lRx0LQu
	 Hf4fzgtva0+tkdJCEWLuC733NEG8nI4fIj65h5YRj/t7DlldyK9g2BlFdeZ2A52LAp
	 XYfhBfjrmf5A6AhJ6y6iSiK4G9J2EHNJPN7SN7JYDnUP3rTx5iHfbW1uDgW2WRVW8l
	 R6LnCwYWHzk5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: edac: Add bindings for Xilinx
 Versal XilSEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rama devi Veggalam" <rama.devi.veggalam@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624212545.2850787-2-rama.devi.veggalam@amd.com>
References: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
 <20260624212545.2850787-2-rama.devi.veggalam@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 21:33:49 +0000
Message-Id: <20260624213350.7B16E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Adding a third mandatory item to `reg` and `reg-names` breaks =
backward compatibility for existing device trees, causing schema validation=
 and driver probe failures.
- [Medium] Unrelated XilSEM hardware registers are incorrectly merged into =
the DDR Memory Controller (`xlnx,versal-ddrmc`) device tree node, violating=
 DT design principles.
--

commit 4759b2e3e1d7757d4a16075824d7a25fd86d0c73
Author: Rama devi Veggalam <rama.devi.veggalam@amd.com>

dt-bindings: edac: Add bindings for Xilinx Versal XilSEM

Update versal edac device tree bindings for Versal Soft Error Mitigation
(XilSEM).

> diff --git a/Documentation/devicetree/bindings/memory-controllers/xlnx,ve=
rsal-ddrmc-edac.yaml b/Documentation/devicetree/bindings/memory-controllers=
/xlnx,versal-ddrmc-edac.yaml
> index 12f8e9f350bcf..568d2af7de81a 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-dd=
rmc-edac.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-dd=
rmc-edac.yaml
[ ... ]
> @@ -23,11 +37,13 @@ properties:
>      items:
>        - description: DDR Memory Controller registers
>        - description: NOC registers corresponding to DDR Memory Controller
> +      - description: SEM RTCA Controller registers

[Severity: Medium]
Is it correct to merge unrelated XilSEM hardware registers into the DDR Mem=
ory
Controller device tree node?

The device tree describes an inaccurate hardware topology by grouping physi=
cally
separate register bases under a single compatible string simply because a s=
ingle
EDAC driver handles both. Should XilSEM be represented by its own distinct
device tree node?

[Severity: Critical]
Does adding this new required register break backward compatibility with ol=
der
device trees?

Because this adds a third mandatory item to the list without specifying
minItems: 2, older device trees lacking the "semrtca" register will fail
schema validation.

Additionally, does the driver unconditionally require this new register in
mc_probe(), causing probes to fail on existing systems? If the driver code
looks for the new register:

drivers/edac/versal_edac.c:mc_probe() {
    ...
    sem_baseaddr =3D devm_platform_ioremap_resource_byname(pdev, "semrtca");
    if (IS_ERR(sem_baseaddr))
        return PTR_ERR(sem_baseaddr);
    ...
}

This will return an error when the DT node lacks the semrtca register, lead=
ing
to immediate probe failure on existing setups.

> =20
>    reg-names:
>      items:
>        - const: base
>        - const: noc
> +      - const: semrtca

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624212545.2850=
787-1-rama.devi.veggalam@amd.com?part=3D1
