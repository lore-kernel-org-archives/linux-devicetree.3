Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3526446C09
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628330; cv=none; b=Qg3/n82m5futTFruig2gPvrMeEbljA74+NnpK2Rwtj/4hKKwSI4d9tGU5Nt695zRLfQht6kcEidmEKyi/4DQDvxe8GfGT1EfFtVz/M9Li2wK/1Wew/X8c6lm5cQXQI708HQc5XWVYrQsLJkSll0HeEaK/rCVG/XcuuqHWdP8HY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628330; c=relaxed/simple;
	bh=mTVvh8aoQb0GzpyZQXZSJzI7LDLxLLkzZDV2lDc8+A8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PZxn1Bl190+/0HKva8MAuFU3UKSbvXfDfLjWMfestgHs4+jKWXmMrj1YkjBSMRvECpBuBI76NudmruXplMpU9dJxBlN+xFBKvw9MNs5kKcx4Re5MYVol1bcDDMLzE22sTju+8HDDQ465AuKQBfZZjE1fJH7yTxswgNLoJX79ZMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Spkfvznt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Spkfvznt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336371F00A3A;
	Tue, 21 Jul 2026 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628328;
	bh=kETIPRCTA3XapPG642iDb5Zfp9xmBAz4OnOx6+ypF6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SpkfvzntBwqu3oNPegNgSxeYazzwI7WUnnMsGfgni2glyIzNLY/J8SEd+qMiP8fwj
	 j5xNLJ2Gp0JiJ7Ia4mSZI1DHmRRLRyRVYDbEaV1I8b0wMstdYe5H0h+W4aQNGOiexx
	 9mGC2ZeQfvMWRP3zmN6DuPFuLg3Gz81NwTh7NSgqPDT9Pn2gujrl3n1Ome9LDvGydv
	 7IbBYLjZr6yOqRg6srTEoASZZYL1AS+H0RUj7YXgBQIrmHXN4I6E+gclByADnH1hB0
	 5f8OB25KXLKQgY2rf4751elfPCv8LPcbAlWavFurO1AZIeRdoLNbhHwajGM43Lfjwc
	 qTAAqI94mnDXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/18] dt-bindings: clock: mediatek: Make
 '#clock-cells' required for MT8195
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-3-8e6d99ab3ad2@collabora.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
 <20260720-mt8189-clocks-system-base-v3-3-8e6d99ab3ad2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:05:27 +0000
Message-Id: <20260721100528.336371F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The `mediatek,mt8195-sys-clock.yaml` binding documents `#reset-c=
ells` but fails to enforce it as a required property for the `mediatek,mt81=
95-infracfg_ao` hardware variant, which acts as a reset provider.
--

--- Patch [3]: [PATCH v3 03/18] dt-bindings: clock: mediatek: Make '#clock-=
cells' required for MT8195 ---
commit e850c4d6a26f7542acffe18dab094b9f9089cde6
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8195

Both MT8195 clock controllers dt-bindings (clock and sys-clock)
document the #clock-cells property but do not enforce it as required
property. This commit adds it to the required property list in both
dt-bindings files to ensure clock provider nodes define this property.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-=
clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-cl=
ock.yaml
> index 69f096eb168d1..ba1b36fa01699 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.y=
aml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8195-sys-clock.y=
aml
> @@ -43,6 +43,7 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - '#clock-cells'

[Severity: Medium]
This is a pre-existing issue, but the mediatek,mt8195-sys-clock.yaml binding
documents #reset-cells but fails to enforce it as a required property for t=
he
mediatek,mt8195-infracfg_ao hardware variant, which acts as a reset provide=
r.

Should #reset-cells also be added as a required property for the reset
provider variant, perhaps in an allOf conditional block? A missing
conditional constraint allows an incomplete device tree missing #reset-cells
to pass schema validation, and dependent drivers attempting to use the rese=
ts
could fail at runtime.

Additionally, the example for infracfg_ao omits the #reset-cells property:

    infracfg_ao: syscon@10001000 {
        compatible =3D "mediatek,mt8195-infracfg_ao", "syscon";
        reg =3D <0x10001000 0x1000>;
        #clock-cells =3D <1>;
    };

Does the example need to be updated to demonstrate all provider capabilities
to properly pass dt_binding_check validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-mt8189-clo=
cks-system-base-v3-0-8e6d99ab3ad2@collabora.com?part=3D3
