Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D134E0216
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983466; cv=none; b=RHFy9foxZzQUaoHOEOdQFBh/0CtQGME+6lw6hlA6DDTyebqzlTo8KItI2g2bmN7nFfmXnS87FapE5aPhotiGBjgSyF0W95kOMYVGJgo+MB56OYcTHGlZ8o7JUlO/KCVqGjspqKmyOq4Tn+dAf7f7Mx4v70oLgsUscp/dlGnphl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983466; c=relaxed/simple;
	bh=ZVGXxMb2C6ltKy97W2/fdduX+Fu2Hl2Ps7zha0/p/wU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QnHWvs2mhGy6Q5sHrFH2MTpm/C9RO1re74sTwObDL1a5sdLr2Iz0YDIoEmdbNksgteuWMfp8mevMLM1Ht/1oJ8F622z93Ir8dM74R9eHZ3XM1ksnOTNhs4t8qTFuSbP30Vuj3gPSMHuwC7AJLHsWp/5aQHYp1inOohc660aZbZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1B+nPnT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1B+nPnT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34BE1F000FF;
	Wed, 14 Oct 2026 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983465;
	bh=o8clkFwrTflVrvYlJ777tRm6kP0D9lTkVvxTP05dH8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W1B+nPnTfGrDqMOcDJWxPQutnWG47jND2WXkcA9qnB1tJ3NDjr5bxiQkKOkiahrlN
	 Q845JivOVE58wJFEH2ceJ5HtZuucsSfQNKjW0Yt3v0qnaFQtf3xsU0Y8EyhR/Hk5VN
	 H6rIXduprtOnbSjXmUa/akNb/Fiy0njXQqPHeLhQ3Pdpu7JembiegOqWwnqbu1B6UY
	 WypeiQgckA7esD1tukMfsIgRKnIVyyAGkeD+NZe1aluKjBqbHu/eqvm542yBN7vp18
	 7tIpYTCCbDDL6awMbZlxqlWMCHzG1YD3iBIUe+vaPIPRTvhRjagKk5L3sxrZdzVohY
	 NbFr97ojVbSqQ==
Message-ID: <sashiko-outbox-171319@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/5] dt-bindings: nvmem: Add UEFI variable NVMEM
 provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-b4-nvmem-efivar-v1-1-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
 <20261014-b4-nvmem-efivar-v1-1-187c85f65018@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:11:04 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: nvmem: use of deprecated direct cell syntax
- [Medium] dt-bindings: nvmem: efivar-guid omission allows variable spoofing
- [Low] dt-bindings: missing pattern constraint for efivar-guid
--

commit 648d72d2afdafd63b69b67763f6747f4034d85b2
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

dt-bindings: nvmem: Add UEFI variable NVMEM provider

This commit introduces a new device tree binding for an NVMEM provider that
exposes the contents of UEFI variables. It allows provisioned UEFI data to
be consumed via standard nvmem-cells bindings, optionally looking up the
variable by name if the vendor GUID is omitted.

> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-efivar.yaml b/=
Documentation/devicetree/bindings/nvmem/nvmem-efivar.yaml
> new file mode 100644
> index 0000000000000..cdc10bee3c6ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem-efivar.yaml
[ ... ]
> +allOf:
> +  - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#

[Severity: Medium]
Does this binding use the deprecated direct cell syntax?

The NVMEM subsystem guidelines state that defining fixed cells as direct
subnodes is deprecated and that no new bindings should use it. New NVMEM
providers should use the fixed-layout standard with an nvmem-layout child
node containing the cells instead.

[ ... ]
> +  efivar-guid:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Vendor GUID of the UEFI variable, in the canonical

[Severity: Low]
Would it be better to add a pattern constraint to enforce the documented
canonical format?

The schema validation will currently accept arbitrary strings since it
relies on the generic string definition without a regex pattern. Adding a
constraint such as "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-=
F]{4}-[0-9a-fA-F]{12}$"
would prevent malformed GUID strings from passing validation.

> +      "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" form. Optional; when omitted
> +      the variable is looked up by name across the whole variable store.

[Severity: Medium]
Does making the GUID optional introduce a risk of variable spoofing?

The UEFI specification states that variables are uniquely identified only by
the (Name, GUID) tuple. If an attacker with local write access creates a
variable with the same Name but under an unauthenticated GUID, could the
implementation return the spoofed variable depending on firmware enumeration
order?

[ ... ]
> +examples:
> +  - |
> +    nvmem-efivar {
> +        compatible =3D "nvmem-efivar";
> +        efivar-name =3D "ConfigData";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        cell_a: cell@0 {
> +            reg =3D <0x0 0x6>;
> +        };
> +
> +        cell_b: cell@6 {
> +            reg =3D <0x6 0x6>;
> +        };

[Severity: Medium]
Does this example propagate the deprecated direct subnode anti-pattern?

As noted above regarding nvmem-deprecated-cells.yaml, new NVMEM providers
should demonstrate the use of the fixed-layout standard with an nvmem-layout
child node instead of defining fixed cells as direct subnodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-b4-nvmem-e=
fivar-v1-0-187c85f65018@oss.qualcomm.com?part=3D1
