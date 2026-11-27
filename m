Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805173;
	b=Z2qkPvH2qW5iTyy7jeiAKEGEBLBqkchJA+CQdrPHl+4wYdHfKbyvievkmU1+Nq5yBDLd
	 A1XFYv2EWOT/KD+f1X1hu6OE4+WWPIuJRSad4JiPUicFQ/xYArUoi7xSyYa+cY+vcGOvG
	 W096om2T3+tgszpch+jSUWejFrUJSdWjjdaaiZuyCvUVVGW6zFT5Ei9vWP85bbvH5i6qo
	 2DCPLAwxcs5OczK46yeMn9xTLPRh0JVS4skRPUMwz+NiKcvQjXuJcfkmvHoZUIC3t8Pfo
	 eu22Jxt4XFFJcfjOw7wzf1XrC+d12rMeEzN3Nnm1gx0ecGy47/vGsuHoHLYH5Ee5fpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805173;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=W260QUr5xDImd7dIx6kGJqW93h4zWFTYTIQxqIwN358=;
	b=ntFnCZxMGP3LvPFCs6Z4A/ndtGcNwb3xgJAqTBUosdXMncqfYk6RMtX/x3tWOHoLsVRR
	 apRE8GEMXfbjaAzw1fcXXv4hLapg5FQ/lASCUmmICPQpXEBcWQPmQFNARFgEjMyQhCT3q
	 gwF4tyVyHPYqZhl9//gxPQBMzf2AmmSrtREeNr419PVA9N9QoC1AG12LfIwk0B1jHF4Rv
	 JbYB0bMirW2z69GQBcD6r/ac4soaZruLSY51wwtNB9Urdy5GV2lr30+aZ89Fx4T6GBNpt
	 Zu2bisXv5F3/v5gSgdU2kUw+0l2WoHdWlnwl7/ICNFuIJu5XDC9MX011e1Zz/RvBkQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKK2JGmA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEF2606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKK2JGmA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CE11F00898;
	Fri, 27 Nov 2026 18:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795805173;
	bh=W260QUr5xDImd7dIx6kGJqW93h4zWFTYTIQxqIwN358=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cKK2JGmA6Af6m48kL1gfvM7NkOUIVKyaGVdyMtbMJj398vBK8QHhAMwYpBcKZ2wrk
	 MMW5iKVBmYvt+lUxEuaQVh9ZZT+Z6rL9mKbNRFsVGTHmivcLpu0vjed6pxARfWZdPM
	 OM6KtUwXsj86t0dQc94D5bDgNP8I9KNt4Rq9kwwKW93M/kzyv4bIv6MlMri9TINN8u
	 NTaHPh98Bm/NGedg7dJWbxKN/fAN0lefLWcJ4e0eN00tEKxTVO2MLTV7PsaM17KT20
	 NTKdvEC1uIKRePH2zSLDTAm0n7pY0oY7q32nIXRw4FP8D0cObZFk9T+sJq2V4cRNbt
	 iT4Tm+Br/gUKg==
Message-ID: <sashiko-outbox-238105@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add Molokai interconnect
 provider driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Venkat Yadlapati" <venkat.yadlapati@yahoo.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261128-molokai-icc-v1-2-a5e1754f086d@yahoo.com>
References: <20261128-molokai-icc-v1-0-a5e1754f086d@yahoo.com>
 <20261128-molokai-icc-v1-2-a5e1754f086d@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 18:46:12 +0000
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
- [High] interconnect: qcom: molokai: qxm_crypto links to qns_a1noc_snoc
  on wrong NoC
--

commit c2464ba1db6c9ac8e7d96e48010ba2c7356fb696
Author: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

interconnect: qcom: Add Molokai interconnect provider driver

This commit adds the RPMh interconnect provider driver for the Qualcomm
Molokai (SM8845) SoC.

> diff --git a/drivers/interconnect/qcom/molokai.c b/drivers/interconnect/q=
com/molokai.c
> new file mode 100644
> index 0000000000000..72c238b326187
> --- /dev/null
> +++ b/drivers/interconnect/qcom/molokai.c
> @@ -0,0 +1,1753 @@

[ ... ]

> +static struct qcom_icc_node qxm_crypto =3D {
> +	.name =3D "qxm_crypto",
> +	.channels =3D 1,
> +	.buswidth =3D 16,
> +	.qosbox =3D &(const struct qcom_icc_qosbox) {
> +		.num_ports =3D 1,
> +		.port_offsets =3D { 0x16000 },
> +		.prio =3D 2,
> +		.urg_fwd =3D 0,
> +		.prio_fwd_disable =3D 1,
> +	},
> +	.num_links =3D 1,
> +	.link_nodes =3D { &qns_a1noc_snoc },
> +};

[Severity: High]
Should qxm_crypto link to qns_a2noc_snoc instead of qns_a1noc_snoc?

qxm_crypto is registered in aggre2_noc_nodes under molokai_aggre2_noc,
while qns_a1noc_snoc belongs to molokai_aggre1_noc.  Because
apply_constraints() skips calling provider->set() across provider
boundaries when inter_set is not set, a path from MASTER_CRYPTO never runs
set() on molokai_aggre2_noc and routes through qnm_aggre1_noc (bcm_sn2)
instead of qnm_aggre2_noc (bcm_sn3).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128-molokai-ic=
c-v1-0-a5e1754f086d@yahoo.com?part=3D2
