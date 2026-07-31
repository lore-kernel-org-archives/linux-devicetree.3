Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3202E7367
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509620; cv=none; b=DspkzVCgNyH4GZsygFiszw8Q9dtsNSdjgU3oCdqRh7XWCP0XDKENfbvxKzXz88Gn7etgJI4SgPKrn4vjK06Y477y+vFtvYV9JJsLaNX6iSaqvnzn9OvfW+uj7o6MRKVNgT95iou59DP2SiU9UuIklQfmH/7aPAYZ/MgHXewbd/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509620; c=relaxed/simple;
	bh=0kyD+6cxKLXvg8dmQ7olFyYB4x4Qr/h1llWPOYGrWkM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JGF9ab2x73capOXcCngnd3nnTfhufbD+JxqaJnbkoqY/NJ2AeapPVjruldSzpTlApCD25neoZfvoCGrAGS+Z0b4u0kQjwnmH48JB/37KT4GEgq9dDeVN0lrxOmxlKahwy20i2izqlTMHviNPfjjhv2VZ9ZCjeep/eE5rg0wOYQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2WH51jY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2WH51jY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4479A1F000E9;
	Fri, 31 Jul 2026 14:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785509618;
	bh=HZURHhSenVkA9tbK/c8ENpdnOheRQBgcBgL1m8ydzyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m2WH51jYnemAIv++AIltVm26UbhpDVDARvnpMxx3sEAZAYZ8R4VZpbsyjNHbOsDP2
	 X/rr42h7xjqiTmdftsxJ9kZ3Q1aMugVnYLz1itx5mY+M9EnT4l1y0gEvA9UndASTXv
	 RymkOxg0xe+VW1LMUVXWRCUcOo/9WYkm9BimL5a4ReRpjIf1bkNs7+nCPMpU5MNofh
	 pV0DfaqFLxaplWHKyfhhlMFl//L4s89DH9prdDLuc+dQno+wm8MN6XTADsbn9F37EQ
	 Hm9wbgjn2bcn3Bgpq2cULEpfQLXVJGsviHOK8TdNWXhYIGqMX4MqOP0PhO1Cg1cMiz
	 G8xANvwRSSUJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] dt-bindings: mfd: x-powers,axp152: Document
 AXP318W
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260731-axp318-regulator-v6-3-b4e745552a35@baylibre.com>
References: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
 <20260731-axp318-regulator-v6-3-b4e745552a35@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 14:53:37 +0000
Message-Id: <20260731145338.4479A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The compatible string `x-powers,axp318w` is omitted from the con=
ditional block that makes the `interrupts` property optional.
--

--- Patch [3]: [PATCH v6 3/5] dt-bindings: mfd: x-powers,axp152: Document A=
XP318W ---
commit 0a2fd6c8b0d8fd1a45bf4a464bf3e71df8fa62f6
Author: Andre Przywara <andre.przywara@arm.com>

dt-bindings: mfd: x-powers,axp152: Document AXP318W

This commit documents the AXP318W PMIC in the x-powers,axp152 bindings.
It adds the new compatible string to the lists of PMICs that lack PWM
frequency properties, and adds new input supply properties.

> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b=
/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> index 45f015d63df16..38556c32417b3 100644
> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> @@ -83,6 +83,7 @@ allOf:

[Severity: Medium]
Was the x-powers,axp318w compatible string intentionally omitted from the
interrupt requirement conditional block earlier in this file?

Looking at the block just above this hunk:

  - if:
      not:
        properties:
          compatible:
            contains:
              enum:
                - x-powers,axp15060
                - x-powers,axp305
                - x-powers,axp313a
                - x-powers,axp323
    then:
      required:
        - interrupts

Since x-powers,axp318w is missing from this exclusion list, the interrupts
property will be strictly enforced during schema validation. Does
this match the expected configuration for this PMIC?

>            contains:
>              enum:
>                - x-powers,axp313a
> +              - x-powers,axp318w
>                - x-powers,axp323
>                - x-powers,axp15060
>                - x-powers,axp717

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-axp318-reg=
ulator-v6-0-b4e745552a35@baylibre.com?part=3D3
