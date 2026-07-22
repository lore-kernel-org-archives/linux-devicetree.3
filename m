Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7E402BA9
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722350; cv=none; b=POJSfL90LrhFDZ5i2agWNt+LBqgS4C+wAGas3H+z5G5SyxAwWN/8rMN9FbNLJdQsQmpWw2rDWpmDK9EakoQN9Msdf25byEInFEy5+xbxcUR/qstjmWfvxma4aoK8bENE8CJKxKgpqqUspCyGWwDtxgQO4fZnNyVbTarq20iIRL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722350; c=relaxed/simple;
	bh=KaDykfqq8EaCs9fZDw8QK5YFf+RtJd2OIF4FfAqhywE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CXb59xtG+kfAejagZSuhRssfiuwXhB/4DYfxN5bpm3FwETI5t8WVumpIJElxJPfTSWjeZYgKzteyt/g18QTZxm9ZxQEhqFhsW0OIiH8zK954gw7YoEmifR0Mmp6vhVj1ufNa9baYAB2NxdeTf9gfxJs6NB9nDaJ3ZoGXxPIKdjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zf4NoTbS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zf4NoTbS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FD51F000E9;
	Wed, 22 Jul 2026 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784722349;
	bh=6pB4HNdr6DOuedoZ8DPxoD5TFEVrMtB6Jxu2cW5Npt4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zf4NoTbSmjrKuwWdxUwD/NXJFxijvv+ZtIpSv+Wavh+VyGkCyJml8II/gNKbHyXES
	 oMLs/U3bP9vnHV15iETWjwOZchpjSedibIqwNCflKBJ1i9/Z2f+j2/U+vUtHvh6z/S
	 qW8n4y8xUwwwXgo90khV9WFGwJjcNlkLaBk9G2PfImculp4f+kJaL38WzwPlu3L2wa
	 Rcl+RuoNWahpbQuoSRTAaK5F3zHDQRiZH6fpmk36IgyrcV6ECqIp7ggz02jq3zf1oZ
	 DVh9abldTA9uFZT931Y2qRgroLJ/eDAMq+3LBcUQQuU4RRvk0zEKJQIN6arNiejIC4
	 J6u2rqJD8hF6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 2/2] dt-bindings: memory-controllers: mtk-smi:
 Add support for mt8189
Reply-To: sashiko-reviews@lists.linux.dev
To: "Congcong Yao" <congcong.yao@mediatek.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-8189-smi-support-v3-2-ae00e13deeac@mediatek.com>
References: <20260722-8189-smi-support-v3-0-ae00e13deeac@mediatek.com>
 <20260722-8189-smi-support-v3-2-ae00e13deeac@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 12:12:28 +0000
Message-Id: <20260722121228.E1FD51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new `mediatek,mt8189-smi-common` compatible string is omitte=
d from the generation 2 `if-then` conditional blocks, leaving its clock pro=
perties improperly validated.
--

--- Patch [2]: [PATCH RESEND v3 2/2] dt-bindings: memory-controllers: mtk-s=
mi: Add support for mt8189 ---
commit d5e16a85dd349bccf5a7d931ef7d615e65bdc612
Author: Congcong Yao <congcong.yao@mediatek.com>

dt-bindings: memory-controllers: mtk-smi: Add support for mt8189

Add smi larb, common and sub-common binding descriptions for mt8189.

> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediate=
k,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/me=
diatek,smi-common.yaml
> index 0762e0ff66ef0..4e1deeff92b14 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-c=
ommon.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-c=
ommon.yaml
> @@ -25,6 +25,21 @@ description: |
>    SMI generation 1 to transform the smi clock into emi clock domain, but=
 that is
>    not needed for SMI generation 2.
> =20
> +  The smi-common connects with smi-larb and IOMMU. The maximum inputs nu=
mber of

[Severity: Medium]
The generation 2 SoC list just above this hunk in the description was not
updated to include mt8189. Should it be added there as well?

> +  a smi-common is 8. In SMI generation 2, the engines number may be over=
 8.
> +  In this case, we use a smi-sub-common to merge some larbs.
> +  The block diagram something is like:

[ ... ]

> @@ -108,6 +125,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - mediatek,mt8189-smi-sub-common
>                - mediatek,mt8195-smi-sub-common
>      then:
>        required:

[Severity: Medium]
Is mediatek,mt8189-smi-common missing from the conditional blocks further d=
own
in this file?

The allOf blocks for gen2 hardware enforce exact clock counts and names:

  - if:  # for gen2 HW that have gals
      properties:
        compatible:
          enum:
            - mediatek,mt6779-smi-common
            ...

Without being included in either the gals or non-gals gen2 if-then blocks,
the clock constraints for mt8189-smi-common fall back to the loose top-level
properties (allowing 2-4 clocks with no strict naming). This would allow
device trees with missing or improperly named clocks to silently pass
dt_binding_check validation.

Could mediatek,mt8189-smi-common be added to the appropriate conditional bl=
ock
to properly validate its clocks, similar to what was done for the sub-common
variant here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-8189-smi-s=
upport-v3-0-ae00e13deeac@mediatek.com?part=3D2
