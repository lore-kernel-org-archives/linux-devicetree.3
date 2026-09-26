Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49796547065
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 00:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790381547; cv=none; b=dzVtcA625620cQ6Ehr3SvMSJhR2wESRKpV3Pc8AJhWvKixXuxDgJ22713hOviMkViuwB8ja61/dUfkj7R8Ez59hD0hzZVW1sRi8cBrUW2OgTjfuHsE1rSrpvziQ28IalRKnSqO/jW15UGg6ZeNlOSd2WZScHY4rZ8R/gGJL59io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790381547; c=relaxed/simple;
	bh=pDBFa+3vAU6bin9kGzwuYDKrpKmAQCIyubApfM24wUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MsDuCh65QtAIyZSFObEKZVjmjoo3O8i4CX7Aot5koOqR2XUPlsMVH9OS1TyKYGdfZB7i+XkUUsFZ7lZc/Cs4xNnjhjt5L6H+B7ECfDV3VMVQGUXGTx7zCP2c8etKcymwoQN3jmmh09EJp8TAnsBjrfdQPA2dzj2FQPCwe9TS3Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1sKi6IK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1sKi6IK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D4B1F000FF;
	Sat, 26 Sep 2026 00:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790381545;
	bh=MQ9PJfhD260QNO8riYnqyS3Lu7mrLr5mQ28ahBDvIZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D1sKi6IKX8xvrF2oGKyal4vsu2HPMojWaLiiLTiNOKS8ob3D1pfPxeFVlAhQsTxBp
	 s6v4adZBfl0ArJ35esE4DopRihOEmxbduGd7fHYqSE5qvSeF41TwKBCHsV7EBY87Ft
	 8VPVZevVrQG1Qsi3OfW10fx5HDaB4aM4j6UIwTQpiyXxXoU6Vyr5jlqcPkOOlW2Nko
	 ztL8CXvFDUpras5snJ4HOK4k/+kxAofHTj6j8zvqHOEOP2dUEItfdc8Ez4l16m7JWy
	 zYPUvBB7yXIrhCj25aR6LXs3FJdo9MG5SyVD+cTy8B1a9+OS51UlA0fCTDhPXcJp34
	 212QhXWNep9uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: ethernet-phy: add
 needs-host-firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksei Sviridkin" <f@lex.la>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925001209.2334139-2-f@lex.la>
References: <20260925001209.2334139-1-f@lex.la>
 <20260925001209.2334139-2-f@lex.la>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 00:12:25 +0000
Message-Id: <20260926001225.94D4B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: needs-host-firmware encodes OS policy in DT
--

commit edf86867db27d83679811b06ea7e2a94b9b02fb8
Author: Aleksei Sviridkin <f@lex.la>

dt-bindings: net: ethernet-phy: add needs-host-firmware

This commit introduces a new needs-host-firmware property to the Ethernet P=
HY
bindings. It aims to delay MAC connections to PHYs that require host-loaded
firmware until their specific driver is available. This addresses an issue
where a generic driver binds early and fails to initialize a PHY needing
firmware from the root filesystem.

> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Do=
cumentation/devicetree/bindings/net/ethernet-phy.yaml
> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
[ ... ]
> @@ -215,6 +215,12 @@ properties:
>        used. The absence of this property indicates the muxers
>        should be configured so that the external PHY is used.
> =20
> +  needs-host-firmware:

[Severity: Medium]
Does this property encode an OS-specific driver binding workaround into the
device tree ABI?

The commit message explicitly states the flag is needed because the PHY dri=
ver
"is a module not yet loaded when the MAC connects".

Device tree should describe hardware, not software policy or OS module load=
ing
sequences.

The hardware's need for firmware is intrinsically linked to its PHY ID, whi=
ch
is identical regardless of whether the driver is built-in or a module.

Can this be handled internally by the core PHY library instead of relying o=
n a
custom DT flag to manage driver binding behavior? For example, by maintaini=
ng
a list of PHY IDs that require firmware to bypass the generic PHY driver
fallback.

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      This PHY runs firmware that the host must load before it can be
> +      driven, and is not usable until then.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925001209.2334=
139-1-f@lex.la?part=3D1
