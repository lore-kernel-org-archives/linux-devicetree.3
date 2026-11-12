Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469046;
	b=PQ7er0HUuuGslzYvpBPbphUGcSjyrEMdRA3euWFrvzLBkFOi+Rudh+mAMdoSD6eUW+AU
	 2F8fktm2zd4XKrIw1v+ly6NqdGawge2cGwqx+dBz/N1oPRgYzuqpLa+HB4Hs0qB7goSBT
	 Bmn/q6nOtC3hfCtLjwrj+LNA1Yu+w29CtQIG6sImzGRLYP8hfjihYk7JfdZuy7uaO80WU
	 NnSR3s7MvoaVG7fBqYlGiXs6A8XgV71IBAG64pzO1RysHbKr2j+iwhrMDQS5eU6Ir7sEJ
	 S2b62xkudMro1zAwxUrKOIiISeYkN7f+usk4CkXk9Gm3c+SSjkCBK2ijO94rF+1Pxxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469046;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rpKcgrHy874/1ApU09Nr7tzw03AR/lrI/qjE+AHKqpI=;
	b=lbdv9HQAr44F5S6ojGoa8Kg9Xu9XrqLPYoKwgQHYmilOU3SKTYPXNnC0WnXEBV1NApLr
	 /7m1JoqMknQE/axsz90CzqsOxtLb+NLKn+4wwftTqyp+vrmAeHaOr868YhwxHStadmaAv
	 gwnWM1wIz2I6K3QiEU1boQz6IHSQbhzSgMS2xIevcNGCe9rSrRCsp3QBfjos0mwRfAhxa
	 k8aKsul6mGz3l3lfKQSi/Ye6P3KM7C2+bMuIZ5PhbyAIL1zM2OrZ0Qd+W9jE/Ou2y7Xmi
	 cHhqTPmfU/DEBuplI+OANza22JxmGxZ954zlXdrJcSg89m+Ao9rSCe4tu4WC+AYWOfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L/wmA05c";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B1B606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/wmA05c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC011F00A05;
	Thu, 12 Nov 2026 07:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794469046;
	bh=rpKcgrHy874/1ApU09Nr7tzw03AR/lrI/qjE+AHKqpI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L/wmA05cVCOmzsqof6BzTPwVYSqOmoWimRtJD12m6mYzM2JWRFpaYhvXU84XSNRk9
	 p3uHICNaNdE1BGGuyJzC7v0MMKMWs7iaDj8HcqQD8UoCBr6PbKBGmqDzx46xFR8wIW
	 lP2Cz9ZVIGnL2Emb8KfBDwQH73rBpaC+vtFm/CphPW9eJqpkJtVN+1qudg4kCTrMo1
	 5GERNXibgt/bXF2Y9AlGrjjlF9OfZjERkBpIVjWs84Q3PzuNhaSSWI90cOsyc9izrN
	 C3hXwRY1bnh2Kwt8IwrRmuV2UhwJnku7IAr0cOnw568kprvZJGDabu3uauyQSld2M9
	 yrnEcCeh/bLTw==
Message-ID: <sashiko-outbox-210618@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ARM: l2c: honour status = "disabled" on the L2
 cache node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Agustin Santiago Isasmendi" <isasmendi.agus@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112072953.989664-3-isasmendi.agus@gmail.com>
References: <20261112072953.989664-1-isasmendi.agus@gmail.com>
 <20261112072953.989664-3-isasmendi.agus@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:37:25 +0000
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
- [Medium] ARM: l2c: device_node refcount leak on disabled DT node in
  l2x0_of_init()
--

commit 98b76cb0386da8baf1e847208a1b97f4eab12a69
Author: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>

ARM: l2c: honour status =3D "disabled" on the L2 cache node

This commit checks of_device_is_available() in l2x0_of_init() so that an
L2 cache controller node marked disabled in the device tree is skipped.

> diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
> index 470867160076f..5d6a4c040a506 100644
> --- a/arch/arm/mm/cache-l2x0.c
> +++ b/arch/arm/mm/cache-l2x0.c
> @@ -1772,6 +1772,11 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
>  	if (!np)
>  		return -ENODEV;
> =20
> +	if (!of_device_is_available(np)) {
> +		pr_info("L2C: disabled by the device tree\n");
> +		return -ENODEV;
> +	}

[Severity: Medium]
Does this leak a reference to np?  of_find_matching_node() returns np with
its refcount incremented, and unlike the drivers/cache/ drivers mentioned
in the commit message (which declare np with __free(device_node)),
l2x0_of_init() uses a plain struct device_node *np and returns here
without calling of_node_put(np).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112072953.9896=
64-1-isasmendi.agus@gmail.com?part=3D2
