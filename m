Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940509;
	b=ssf0Dw9QDicEIcQPkz4RTdX9ObciCyeyTBE64seQpFkr1lEM/q5mdeMAtlHto09JY5rH
	 aDSNkjXDeaMyi+xyZG8czRtY2RoOXpdGvBsnKHYx5YCYP/4713tV9n5q6c+ArOXPd4HcF
	 OBb0W8uUVnv6wBaNukfM4Xox19awxUlu1yZ49LbgN5diyJscapRHzR6LwVGLItJbyXR9F
	 vX00H4XDa+BMptCJvjnm/86xi4JMu9hGU6+K8ZwOMKhu0pHtijAA34M0H0n3uGY7MGxv1
	 3IWTGQ2HLEoDfv+mfEe7Oy7/xgT89D4dxXO3xnzcSWG+MQJzWHkjmSdNl63BDiXliZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940509;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BvFUKhCisO0Xz7ga5IGFXOTEUIrI8URc0RQS1XLq1xo=;
	b=HMfXKG7/uwvVurVk/J39Lq6iEHSkqod6N4awlKONGlX19bBQ30Vh80lZqU5QOFSVOtJE
	 /HT2VOgOLXq01jk9YuwX3TsvXJTV19Z65YBLHih+iOdlh9BXaStSSRIdtj5jESM4IRrLf
	 JifyFYzfIrNw8qM2PASW/Pl3xUDAxmhfm8qk/zqbj8LPNNXlKNUJDfH8YIF44UOsobJax
	 x/WeK6bOn/ivVFATwFoxrdi8BaLvLRN41IuwtrPsJMJ5ZmsZ7r/WIM8iSpiuy8VjHW0Ht
	 PcNqP4lXPVv8fUcLfoqxvBih8bf5Eue52V991F/YvRTfwKVK+nQ2SSVecEIgYNr35Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="C6LDQ/5L";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665BD606A884
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6LDQ/5L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A361F000C7;
	Tue, 17 Nov 2026 18:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940509;
	bh=BvFUKhCisO0Xz7ga5IGFXOTEUIrI8URc0RQS1XLq1xo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C6LDQ/5LHVCkiihu/eCdfqQ5JiZLZa4SxIdPPNPKOgkxGtlNAOQv3O39BP7NDp8l1
	 VNA3P3WSCCeScvGcCzZL34U3Yv0xJcMUlTQTQl0D4QOsdiZjt147gAC+bNQSDutTqm
	 r8ZAYnaWz3hb1bAKe9YtZLwm1ufk71545qg9UcssgF7HInDP7GkWV4fGPNGrRk4KHz
	 LmZMdaI4OrMnqXHouNB0P24oV0vWzsyWT9hirDCkR5XnqIsl7/K80CXiMBob8Ul1zX
	 fttKFMmJ4ZlX5YveBwpAbC10YFx31Ie1ipedEm5NV0aiQt/OhzyJ9A9PkrG8CCwnPw
	 9rWenoo8s41NA==
Message-ID: <sashiko-outbox-219355@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [net-next v5 6/7] dt-bindings: net: dsa: mediatek,mt7530: add
 EcoNet EN751221 switches
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116183332.168858-7-cjd@cjdns.fr>
References: <20261116183332.168858-1-cjd@cjdns.fr>
 <20261116183332.168858-7-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:35:08 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: net: dsa: mt7530: unaddressed v4 review on en751221
  compatibles
--

commit 2cadfb1e611919345d0f3bc419d5f43f6b58423f
Author: Caleb James DeLisle <cjd@cjdns.fr>

dt-bindings: net: dsa: mediatek,mt7530: add EcoNet EN751221 switches

This commit adds the econet,en751221-switch and econet,en751221-gswitch
compatible strings and schema constraints for EcoNet EN751221 switches to
the MediaTek MT7530 DSA binding.

> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.ya=
ml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 590eb39d6b93a..e4e81ed64136b 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml

[ ... ]

> @@ -110,6 +116,14 @@ properties:
>            Built-in switch of the EcoNet EN7528 SoC
>          const: econet,en7528-switch
> =20
> +      - description:
> +          Built-in switch of EcoNet EN751221 SoC
> +        const: econet,en751221-switch
> +
> +      - description:
> +          Multi-chip module gigabit MT7530 in EN751221 SoC
> +        const: econet,en751221-gswitch

[Severity: Low]
As reported by Krzysztof Kozlowski on v4 [1], the description for
econet,en751221-switch repeats the compatible string instead of
distinguishing the on-die switch from the multi-chip module switch, the
description for econet,en751221-gswitch is split across multiple lines, and
it remains unclear why two EN751221 compatibles are added for hardware
described as MT7530.

[1] https://lore.kernel.org/r/20261103-soft-lyrical-squid-c5a108@quoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116183332.1688=
58-1-cjd@cjdns.fr?part=3D6
