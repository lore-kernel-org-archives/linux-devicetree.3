Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FC7258EFF
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176568; cv=none; b=MnZDhvVlnzSdT/BBc5k1dU250IHAYyEc/qrK5rmzSDPhfgkrliKGClGSux+JXodMCK8yPZBFJdh/jiaqrjrBITa3Y8nVux6fCmGp9b905NBOBmWzA2CgpA2gvW0XtCGz5YvKrZ07C3uvOdfbIHVeolVQmmDsv1VgSqY+cdsY2CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176568; c=relaxed/simple;
	bh=S+1yT9QNCg4U2wTY+xErMx2KLqloWK/YRpR7n8/6flI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e6SwkVc2X7NmKARkQTa/PPhVAID8kZwv0soSAduetTdvGfPJJN++rnRJLsM7VWv4qew/x75j3OY4OCoAMfsV1Ob41LJgm+BOBqIDi8ZX9uaNQuXcJgjpL98fH02mT/62Dap3T3N5G4m5OZmBsOpYpPG7GmZbjDf2LFgXBwP4U28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vOLZWgQo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vOLZWgQo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5643C2BCC6;
	Tue, 19 May 2026 07:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176568;
	bh=S+1yT9QNCg4U2wTY+xErMx2KLqloWK/YRpR7n8/6flI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=vOLZWgQozu2ywLUFLOdLGJn4nvrktvCeF+mBNto+1+ARG+5z6rMIATO6JZH2yDnRV
	 GO58z5ZFlmQ77rcpjVilYLIiDvg0OYfyS6TSkWIC+kQWzSmrv2AM3cv1epOq2sYIYu
	 LeAb5shIOwq+agVNPN6tyW1shDkf0Z0q0KHvajMU4ZiU4ot7HlQiuZaGdNK7xaTyTe
	 nyIzFPTqg14aqg2l834KrPa5CEe1CBeHGCycLjY7TIWFShNqDsPbYSNfm5xB293E4G
	 iWPKycZHqSds5KQuwIeXHX/dIqS89+M89D/f9/XJzMq+DVWGJ6FD4i2BeW2s3FcCvH
	 p7OP4gH5JojZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/8] dt-bindings: extcon: qcom,pm8941-misc: Add
 PM8921 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre MINETTE via B4 Relay" <devnull+contact.alex-min.fr@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519-mainline-send-v1-sending-v3-2-3dd7aa125353@alex-min.fr>
References: <20260519-mainline-send-v1-sending-v3-2-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:42:47 +0000
Message-Id: <20260519074247.C5643C2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The parent PMIC schema (`qcom-pm8xxx.yaml`) is not updated to allo=
w the new `qcom,pm8921-misc` child node, causing validation errors for any =
DT using it.
- [High] The `if` condition uses `const: qcom,pm8941-misc` instead of `cont=
ains: const: qcom,pm8941-misc` for the `compatible` property, inadvertently=
 making `reg` optional for `qcom,pm8941-misc` devices.
- [Medium] The schema allows `qcom,pm8921-misc` devices to have a `reg` pro=
perty, even though the hardware variant does not use a register resource.
--

commit 8b3e7ba33de64864005f6ce3e91467d662e5662d
Author: Alexandre MINETTE <contact@alex-min.fr>

dt-bindings: extcon: qcom,pm8941-misc: Add PM8921 compatible

This commit adds the qcom,pm8921-misc compatible string to the PMIC USB
ID Extcon binding. It makes the reg property optional since the downstream
PM8xxx misc device does not use a register resource.

>     The device is modeled as a child of the SSBI-connected PM8921 PMIC.
>     Unlike PM8941, the downstream PM8xxx misc device is not instantiated =
with
>     a register resource for this path, and the mainline extcon driver only
>     needs the named USB ID interrupt. Allow qcom,pm8921-misc without requ=
iring
>     reg.

The parent schema (qcom-pm8xxx.yaml) enforces additionalProperties: false
and strictly defines permitted children via patternProperties.

Without an update to the parent schema, will device trees including the
qcom,pm8921-misc node fail dt_binding_check?

> diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.ya=
ml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> index 6b80518cbf629..4e3d0aadb83cc 100644
> --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
[ ... ]
> @@ -37,10 +38,18 @@ properties:
>            - const: usb_vbus
>  required:
>    - compatible
> -  - reg
>    - interrupts
>    - interrupt-names
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: qcom,pm8941-misc

Devicetree schemas evaluate the compatible property as an array of strings.
Because comparing an array to a scalar string always evaluates to false,
this condition will never match, and the reg property will silently stop
being enforced for qcom,pm8941-misc devices.

Should this condition use "contains: const: qcom,pm8941-misc" instead?

> +    then:
> +      required:
> +        - reg

Even though reg is no longer globally required, the global properties block
still defines it. This means the schema will silently accept a bogus reg
property for qcom,pm8921-misc without an explicit disallowance.

Since the PM8921 variant is not instantiated with a register resource,
should this block include an "else" clause specifying "reg: false"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-mainline-s=
end-v1-sending-v3-0-3dd7aa125353@alex-min.fr?part=3D2
