Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E562C17A3
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978589; cv=none; b=c5AWtjsqj3ft44efR3PjJ8kfP6iSJnPM4ZpzAB2og+D23B2+F4KLzH3dss4JvHrcUXiTU70cnYMAUD6ybSx8xssGVpon2wcEgXKANNAFZGRn6JbXJp3ponn04gSCEhsmPQNQjieItnjdR3twmoG3CV3A1Lix7fmDD9iM1ieb8lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978589; c=relaxed/simple;
	bh=KMaTfYt6wxdt8KIwgxKDuJ3zIZ8AQCsh2hPjsB4AuAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tiHXf/BWKaHZT8XX/dn+osYqKoNmIfI+T9ubQ+TroNsTIhD7yrp9neghU3RMztrdVwEg6K7DCwjRnHDytlbFa/fd8LCfFyejwXxVJK6F1dhjmo9KYQe0QO/BqO23Ok/2aAlEBYa9v275c7PXHLFQazCI9/Uck8KbEpCrtutz5n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLp5G4wH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLp5G4wH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8051F000E9;
	Thu,  2 Jul 2026 07:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782978587;
	bh=i94FNgnCSp7KpZH9772R/FKkYZ6R9k3eroSfUbMW7+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZLp5G4wHJQMvjcVAFVnstYa6HgvtAvVbFUBT59EXHEySckpe2e/lundr6lCU22wHr
	 UKINVEialRdDmJVDsvGP3nxu6U2zm1AnyP+J7Aeg/56a+5YBJK+bmwJxCz/rDDEdjT
	 fW6AfRy1L4uJuflUd2NKEkVmtVqhp1mJ2ZiTifGoLTZuIWctx1CHEJP9D+p4lqxnsT
	 KjX8M6cetKlsN5A72naSGVO8WYLKDpXZ+WBDv6Jcw3hJ8XxV5By+HfadCvF+NyWnk+
	 zaXB0ftIlxGSSfjqeQKUJkdvaB+cEfTLnUKYEDmLEnjYfUyEnnvf92NoSgssFXI6S9
	 4lsFhkH2ZRrLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 10/12] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgenc compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260702072614.10373-11-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
 <20260702072614.10373-11-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 07:49:46 +0000
Message-Id: <20260702074946.DF8051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The schema update adds support for MT8196 but omits definitions fo=
r its newly advertised hardware features. While DVFS relies on existing sta=
ndard `power-domains` properties without needing schema additions, the adve=
rtised SMMU support introduces a hard dependency on a new `mediatek,smmu-co=
nfig` property in the child nodes (implemented in a subsequent patch 'media=
: mediatek: jpeg: add jpeg smmu sid setting'). Because `additionalPropertie=
s: false` is enforced, any device tree attempting to specify this property =
will fail schema validation. Conversely, if the property is omitted to sati=
sfy validation, the driver will fail to probe.
- [Low] The `iommus` property description incorrectly references the MediaT=
ek IOMMU binding for hardware that explicitly uses an SMMU.
--

commit 375a0f1aaa853e038449c5b8176a2c5ea4a805df
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc compatible

This commit adds the mediatek,mt8196-jpgenc compatible string to the bindin=
g.
It notes that the MT8196 hardware uses an SMMU instead of an IOMMU and
supports dynamic voltage and frequency scaling.

> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpeg=
enc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.=
yaml
> index 596186497b684..e2d772ea0fb01 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> @@ -14,7 +14,9 @@ description:
> =20
>  properties:
>    compatible:
> -    const: mediatek,mt8195-jpgenc
> +    enum:
> +      - mediatek,mt8195-jpgenc
> +      - mediatek,mt8196-jpgenc

[Severity: Low]
The commit message notes that MT8196 uses an SMMU instead of the proprietary
MediaTek IOMMU. Does the existing description for the iommus property need
updating to reflect this?

Currently, the property definition explicitly points to the IOMMU bindings:

  iommus:
    maxItems: 4
    description:
      Points to the respective IOMMU block with master port as argument, see
      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for detai=
ls.
      Ports are according to the HW.

Could this static reference cause confusion for developers configuring the
new MT8196 hardware?

[ ... ]

> @@ -44,7 +46,9 @@ patternProperties:
> =20
>      properties:
>        compatible:
> -        const: mediatek,mt8195-jpgenc-hw
> +        enum:
> +          - mediatek,mt8195-jpgenc-hw
> +          - mediatek,mt8196-jpgenc-hw

[Severity: High]
Since this child node is enforced by additionalProperties: false, will addi=
ng
support for MT8196 without defining its new SMMU features cause validation =
or
probe failures?

The commit message advertises SMMU support, which introduces a dependency
on a new mediatek,smmu-config property in the child nodes. Because the child
node enforces additionalProperties: false:

    required:
      - compatible
      - reg
      - iommus
      - interrupts
      - clocks
      - clock-names
      - power-domains

    additionalProperties: false

If device tree authors provide the mediatek,smmu-config property, it will
cause dtbs_check validation failures.

If they omit it to pass validation, the driver will fail to probe since it
won't be able to look up the syscon regmap.=20

Should mediatek,smmu-config be added to the properties list for the child
node to prevent this issue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702072614.1037=
3-1-kyrie.wu@mediatek.com?part=3D10
