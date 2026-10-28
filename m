Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159523;
	b=PbOR7Ma3WHs+L71kmKkzDdtxIYcF2E27vjXpW7X/oPTHH4yxaCp7FfHhgZkQIF1UTLFY
	 8UXLHBUnJMl9mcrFkHVHog0CQdtvjVE7D1q3ESUEwePJiJ4AuOGeH4OTug15nZjAZrex/
	 MJxKKnLIx6t9gxs0LKUrxNlSJOy4IHedqTv3N2NNd7yVCHpaekx9BCBOAS1J63sMmmtUO
	 DM6zy98yYYqKRCv+2v7/jgattPmX2eeR8zfJBXC+ZCY9i/2da7jw3rRn5LPQvQgAxDSZY
	 +NnnYHYO5JGZLZy81lmL1FZrG79adu8iHCYLNtQiOFzFtYoJmGQVpqdHoBe+CruBruA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159523;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7wtuZhBNcMYe7ybbs3CpLBn0qcqYKZfyh7TOLggOERs=;
	b=3xUkR4NNzknp3P7EpUQcprRZ4ED6wJDyudaRg2QLOMoLVBfCbdqq2rRkwSMeYM0O/IJr
	 Shyu71gRnm9U7pRI3i2k6jQiqwmTQ2rp9c/ZMwjkhaPNrZic/E6SgR6/OcsbThkegYn6O
	 C9wD5ef2EbYs82Pcz4UxMleTLpMH8KuatHuFMloTqmSR29+oVQE7N2szS7YywAIGgJoCD
	 skzUmvk+W7E+lVS73oeck1nIKyN4+oIfL9F47+I3E3lmbdbs+mV39romkbuaZuQUqipQv
	 NOT/ZR3OXN6knj26x+dNeqqFLWxAWi32ib7a20eeUbHcg8RuLAN/oaxc6yIW7oKBqkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d19YMJ8C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E70606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 03:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d19YMJ8C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723EF1F01825;
	Wed, 28 Oct 2026 03:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793159522;
	bh=7wtuZhBNcMYe7ybbs3CpLBn0qcqYKZfyh7TOLggOERs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d19YMJ8C2zybUTGC7w6sXd7i+SFMPgvKtDeNdRYpjprOv0Z5V9RHZurEo7JH+m7Hk
	 a+ssGtDdcaXk4Ti3v6mUUagf5aHnalUQ1CSq1ePPgXX3LQSOy76z3vWf3q4TSQtzDE
	 lyLSPYm2+OWEK+h7OSj6dMy6BHoPMmz8/uHy2fCr0dBDrclO2bW4kUh2i7VBfZcfpY
	 WiplMmvfDJhbrNgqbRWJgoAE+lhIaYm9uH/NL8EnmPwkk6gahR2FBabH2iQja5yizx
	 Xc/upsS5zH3QIyTNOTgiw7ErjTmNrjeNS/j0/mEMQrAq6xjzeCsOPHUG0xodn/RKuw
	 /I2muCvEzypjQ==
Message-ID: <sashiko-outbox-187448@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: media: add the Qualcomm SM8750 camera
 subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261028034105.326535-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261028034105.326535-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 03:52:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: media: commit message sub-block counts mismatch bin=
ding schema
--

commit 73bfcb41d44e2c6c144a357d1065fa300a499b3f
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: media: add the Qualcomm SM8750 camera subsystem

This commit adds the device tree binding schema for the Qualcomm SM8750
camera subsystem (CAMSS).

>     dt-bindings: media: add the Qualcomm SM8750 camera subsystem
>    =20
>     SM8750 has six CSIPHY instances, two full and two lite CSIDs, and two
>     full plus one lite VFEs behind one camera subsystem.  Document the no=
de
>     with the register ranges, clocks, interconnects, power domains and the
>     sub-block layout of that SoC.
>    =20
>     Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
>=20
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
> new file mode 100644
> index 0000000000000..e0e0722a838c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
> @@ -0,0 +1,435 @@

[ ... ]

> +  reg:
> +    maxItems: 19
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1

[Severity: Medium]
Are the sub-block instance counts in the commit message accurate?

The commit message describes SM8750 as having "two full and two lite
CSIDs, and two full plus one lite VFEs".

However, the binding schema in
Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml defines
and requires:
- three full CSIDs (csid0, csid1, csid2) and two lite CSIDs (csid_lite0,
  csid_lite1) in reg-names and interrupt-names
- three full VFEs (vfe0, vfe1, vfe2) and two lite VFEs (vfe_lite0,
  vfe_lite1) across reg-names, clock-names (cpas_vfe0..2, vfe0..2, and
  vfe0..2_fast_ahb), interrupt-names, power-domains, and
  power-domain-names (ife0..2)
- three CSITPG instances (csitpg0, csitpg1, csitpg2) in reg-names

Should the commit message be updated to match the three full CSIDs and
three full plus two lite VFEs defined in the schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028034105.3265=
35-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
