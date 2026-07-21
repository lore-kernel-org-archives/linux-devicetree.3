Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10682446050
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628330; cv=none; b=NW5QxkjGhXb1NIko9wryMph+kKBJKl5J1KNIqQemiJ3QKYoJOiCzIN8HHx2ABp8azkCXNztKMsOa2nHZx9cm9tFC6ZHFEYxKcEkMADojX/QrqVE4BDHpMASTM2fyRmGYUWnYNaKrr6N8Bp19dsPrd1uwhLzoE+QL3t3ZEXUouZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628330; c=relaxed/simple;
	bh=jJmBkPYzc3dzosisYFHlRYlNdrkA3sWN/FbzukjuKLU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OjadSYbXTiqJaAC80RZVPjSZ/MHMgQQDSP329C/bxRPXnK3NkB/EVPb717P8cMTRk7a32bhkT6QLO1KnvBtoRhC05N76ebTMohVAy0LFQlpfENEOsUfhvpH0a4V+VRdZuN1j2X4rHsyN6bVOeCfx6GTGew/uToeI3efOid1HhD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoaCgy7f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoaCgy7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674541F000E9;
	Tue, 21 Jul 2026 10:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628327;
	bh=DaITeyCbV6n26MVKAvhy9rVAODGPrkPH5c2yDJLCTV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KoaCgy7fVuf5HflAPuEiC1IEhq5W/Hf9FraA3nwnDJp8P06COuTE7DLInnYLjGtSg
	 EKy3WjupVvBfFsnMw4Sr0jo5eopIdg5teZRLf0TwygR9By0yOpelytbCZMEhXfmWe8
	 QpittBG8YRmZysf4E4OEusL2kVVu8pdvLxx1UWMT3qGmXIJyzRBVfhrux7m5AXe3QA
	 f6/O0LVV3sR0H66nGs0bnePW5pnCaDiU+GawbkN37h0qkx35ZAEZkTOZr8SUgFK8N5
	 kY4fNmCw97BYZTenvtOyi4ZXBbV7nanqnTET9Eq0s+nJ9RZETPXXC2pf2DdwTD4FHF
	 5jgRr2S/Y3avw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/18] dt-bindings: clock: mediatek: Make
 '#clock-cells' required for MT8192
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-2-8e6d99ab3ad2@collabora.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
 <20260720-mt8189-clocks-system-base-v3-2-8e6d99ab3ad2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:05:27 +0000
Message-Id: <20260721100527.674541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The `mediatek,mt8192-infracfg` hardware variant acts as a reset =
provider, but `#reset-cells` is not conditionally enforced as a required pr=
operty in the binding schema.
--

--- Patch [2]: [PATCH v3 02/18] dt-bindings: clock: mediatek: Make '#clock-=
cells' required for MT8192 ---
commit 39883f8dbf989e459d5a15ed6a9ba37e9a9a274b
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8192

This commit adds '#clock-cells' to the required properties list in both the
MT8192 clock and sys-clock device tree bindings. It ensures that clock
provider nodes define this property, as it is required for proper validatio=
n.

[ ... ]
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-=
clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-cl=
ock.yaml
> index bf8c9aacdf1e7..0ebd0d60e2f68 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.y=
aml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.y=
aml
> @@ -35,6 +35,7 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - '#clock-cells'

[Severity: Medium]
This isn't a bug introduced by this patch, but should an allOf block be add=
ed
here to conditionally enforce '#reset-cells' as required for the
mediatek,mt8192-infracfg variant?

The mediatek,mt8192-infracfg hardware variant acts as a reset provider, but
without enforcing '#reset-cells' in an if-then block, incomplete device tree
nodes will silently pass dt_binding_check validation. This can lead to
potential runtime failures when dependent subsystems try to consume the res=
et.

Additionally, the example node for infracfg is missing '#reset-cells =3D <1=
>;':

Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml:
  - |
    infracfg: syscon@10001000 {
        compatible =3D "mediatek,mt8192-infracfg", "syscon";
        reg =3D <0x10001000 0x1000>;
        #clock-cells =3D <1>;
    };

Should the example be updated to properly validate the reset provider
capabilities?

> =20
>  additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-mt8189-clo=
cks-system-base-v3-0-8e6d99ab3ad2@collabora.com?part=3D2
