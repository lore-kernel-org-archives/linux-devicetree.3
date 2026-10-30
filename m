Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336059;
	b=2+jJIVo6KZgbc6191JNrHw85ZAcqK0Qys3swVUVGN8qXB5zJljYOSHFJcjhtSrcCuynm
	 5G6m/YSXhV+nvZ7yHKTSVyWj+tAMKV4wQQ8RBd7SyoXbsowKSw2PqpSqcca0p/7Nsti5d
	 ykkdon3fAmrvAnEREM96WgO4gPlAdagRn3yVG20UsNxoI+E2NPlbj8rrbI955Spb56Xjt
	 xDnamoJGRcehyFXz1TvbgqH5ekPNLxV0935RUT3Jum+RQtFhDHYBGHb6C61Jh97kxqNkg
	 bxJDsSLRlywzIHakOlz/WkAW1TK3Zc00Q0p+nJl5Q72pCnM4Iz0N1m/ikTwVse/kxgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336059;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BUuqyVgtGVE3D6kCUDoKw6NGm7TyKCRFQe+NXTASemw=;
	b=F2Zi3bH0tMy/tVutX+CARBbTLlwuY3JKwx92p+m0ja5g2eS/Ihm2aSEbWr4z7vxYOvhH
	 CrYpni/icgyZhiHvB07Q7SzBGeahQTGbBQucrt16iHgFKr7feyc+R4gKB3cbpfiw4I8JP
	 Ypcsa6h2ftWu6QdqO7YKHeoIQK+Szm3s6RY9ffJn1nJJoUten/gsrb0cpf1F1VfG7V+x0
	 EhMHiHB7JfGtnhg/rYJ2B8vA5k7loQzwGYEkBEKROXc/hqaHqAmjxpddX8NG83WGtv0pp
	 ea1XThTAUFnBAAIzhCn/FssWeUP0jwqjaE+vGSTYP2pgIaPFBU118UN0P8A0GthT3eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XrrvCW82;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F5C606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XrrvCW82
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D25F1F000C1;
	Fri, 30 Oct 2026 04:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336059;
	bh=BUuqyVgtGVE3D6kCUDoKw6NGm7TyKCRFQe+NXTASemw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XrrvCW82o/fGHXQpURMCygmOb2imi4pYuwd5ShrUQHc9rpdHBuy9Rp+wZcbKduKeF
	 lRJVcJOvo5xmW04kn2olRdeM33/NLj/7L47H55lFBYPJppIjmWR039S70vom33U7WH
	 ags2Uj8xUHqGhP2IODiM4A/368xxlB01ugw8lcffwMy0wQ0LhdZ0AaBmU2b8zcnuVv
	 5LDQ3/l6B2L9dHWoSWmjEf6pmvlSU3beIUcBw7BgwQAsx5KSpgsB0l0L8N0B3Kl2X3
	 4oMHbTh6rYtS/l25QqT25jyp5hnRYpc9rvRTnnG/75AZXUU/vCNlXTXKXVHlKCdyMF
	 XABbozg3IHYSg==
Message-ID: <sashiko-outbox-190432@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 01/12] dt-bindings: net: airoha: Add EN7581
 ethernet-ports properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-airoha-eth-multi-serdes-v6-1-c899462c4f75@kernel.org>
References: <20260511-airoha-eth-multi-serdes-v6-1-c899462c4f75@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incomplete schema constraint allows `#address-cells` and `#size-=
cells` on unsupported GDM1 and GDM2 ports.
- [Low] Schema validation failure for `ethernet-port@[0-5]$` child nodes du=
e to `$nodename` mismatch.
--

commit ec4617f6004fa83e07ac8747b6e514e55a246569
Author: Lorenzo Bianconi <lorenzo@kernel.org>

dt-bindings: net: airoha: Add EN7581 ethernet-ports properties

This commit adds support for connecting multiple external SerDes to GDM3
or GDM4 ports via an arbiter for EN7581 and AN7583 SoCs. It introduces
the ethernet-port property to model net_devices connected to these GDM
ports.

> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml=
 b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> index fbe2ddcdd909c..642f300c09450 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> @@ -130,6 +130,50 @@ patternProperties:
>          maximum: 4
>          description: GMAC port identifier
> =20
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +

Does defining these properties in the main block inadvertently allow them on
GDM1 and GDM2?

The commit message notes that ports 1 and 2 do not support the connection
with the external arbiter, but placing them in this outer block makes them
permissible for all ports rather than just GDM3 and GDM4.

[ ... ]

> +          patternProperties:
> +            "^ethernet-port@[0-5]$":
> +              type: object
> +              unevaluatedProperties: false
> +              $ref: ethernet-controller.yaml#

Will this fail schema validation during make dt_binding_check?

The core ethernet-controller.yaml schema enforces a nodename regular
expression of ^ethernet(@.*)?$, which does not appear to match the
ethernet-port@X pattern used here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-airoha-eth=
-multi-serdes-v6-0-c899462c4f75@kernel.org?part=3D1
