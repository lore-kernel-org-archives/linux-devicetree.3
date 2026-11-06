Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961036;
	b=czfg30N87HMmh2ziey9L1B5MomHOo6wUrbVGLN8rykb0+wZtY7F59WR3Nn1sSzkmeNs7
	 traX9Z498/jmckkCla6AltyNf6acKP9n1vBWJhd1QUenQCim0orHUrQ3R7199uj4NcNpW
	 KcZBX40SQ6Ac67v4GqJR30zR28aUdr3x2HLVO1DS7HTv3iFVl2mJdo2H3jSvky+nrgFFj
	 chhqkMyh7dVblZvEN+yV+csn4vC7/ETuZx648zXVUOs3u4GbenzQU3dnzcGP+O+FUXauZ
	 EgY5/5qGWl/G9c7tW7yObNQyzepN+D1gX1EzKo+6XnmtZwBocFB4cs17noVvwHZXN2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961036;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hybp8j82ToTVcRwshBegrkEhpIZerXiawkFTh+apM/w=;
	b=bwpvMk/KzH3lLhb0nKPviWzvKLdyOIg9VFldENQWcN8OMmbx58YcXJZKcEyKMfty9y6Z
	 ufmKNhPUFCSwqm6fx32QDrlcetp5NcRUhsNQfP0KaYzQldraXUtWeA4sHpn0VcwygBXkt
	 8sdyu95JgEhTJmjqH6dFfE2uRkXKfLBWOQ36pUlRjfUGwTWo8J9V1M4M6xiOxXMxglcdV
	 mt4qpHdSs2cyfNo5RTfYKalADMwf4zjB+FL4hoof3id4lJfMckelcuxRv6OYSM3noKPOb
	 rGFySH4uHf6CZ+KPFp9rDWyVfdVqgmnjgcBYFu6vp1h+N4C4KkwNBz7fpOyQFK39kkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iiFJu/8S";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5F1606A339
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iiFJu/8S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DC61F0089F;
	Fri,  6 Nov 2026 10:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793961035;
	bh=hybp8j82ToTVcRwshBegrkEhpIZerXiawkFTh+apM/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iiFJu/8SqOuolDMQeCwNZ1O8SV/V7Oi+TLffOQk6D4jvSoNCP7onDKH+8913jLDjz
	 VGnNSPRHu6vBUsmqiQwixBPCrmSeohksTocIeDTXjqejDI50mur6V/um6AC6TxLj1K
	 7zHFl9qP60uWOe+aY5js+W0uDVcyemqjv5z0+pKqIiJimNzvSl/khkjHQy5R+j/pQw
	 bAtnn/65v4AI/scsBr5OgD0Hq7SKyDinGlrKyZR2lfLsodbtY4e4h0lFEx7YSF7AEv
	 SX/B6+zMaWTYElJ/xrRN/XBjhMvMCeAJXUMzEYVglQipC3Opy9p4BhtfN/2F1ZMTc0
	 794WT5w7fuShg==
Message-ID: <sashiko-outbox-201220@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] thermal/drivers/amlogic: add S4 support
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:30:35 +0000
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
- [Low] thermal: amlogic: redundant amlogic,s4-thermal match entry
--

commit d73de7ad59dbf743cca9b086493290c2c74eb121
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

thermal/drivers/amlogic: add S4 support

This commit adds a match table entry for "amlogic,s4-thermal" to
of_amlogic_thermal_match[], using the existing amlogic_thermal_t7_param
configuration.

> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_=
thermal.c
> index 60728de6968ac..4c107b3100c0d 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -292,6 +292,10 @@ static const struct of_device_id of_amlogic_thermal_=
match[] =3D {
>  		.compatible =3D "amlogic,a1-cpu-thermal",
>  		.data =3D &amlogic_thermal_a1_cpu_param,
>  	},
> +	{
> +		.compatible =3D "amlogic,s4-thermal",
> +		.data =3D &amlogic_thermal_t7_param,
> +	},
>  	{
>  		.compatible =3D "amlogic,t7-thermal",
>  		.data =3D &amlogic_thermal_t7_param,

[Severity: Low]
As reported by Krzysztof Kozlowski on v1 [1], is a separate
"amlogic,s4-thermal" entry in of_amlogic_thermal_match[] needed when it uses
the exact same amlogic_thermal_t7_param data and binding constraints as
"amlogic,t7-thermal"?  Pairing "amlogic,s4-thermal" with "amlogic,t7-therma=
l"
as a fallback compatible in the Devicetree binding would make this driver
change unnecessary.

[1] https://lore.kernel.org/r/20261030-funny-ibex-of-modernism-b995fe@quoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106101913.4666=
4-1-christian.koever-draxl@student.uibk.ac.at?part=3D2
