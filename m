Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815752;
	b=sjaiOC59DCx8vikqXHnOtKK+hD87jyeDLG3XFhvdPqvFSCZYu9D7zbi0V43nCg+dHG/U
	 atZz2EKUgkNcKXzRDrTEV7egBuhHk1ncG0QBhCABAOyIWjhDPSmfZbj2EB7qWJX/c1dCf
	 q8izrpAjbeDIXaDQyzVUXqSY5554BAq3a1zc3+nt8M0XF2PmZC2xKRW1GRRhcFiXRF155
	 11OomaARI5zRDhLFe1Sy0t7ilCDIi0/54HqQMYdZZ9y2JFSAVQRq4uHjAfyU5xgA+gGdm
	 Ribzc4yMFeqKRmK7iL6xc3w2AGwSL+gBDsTa69kiVTPaje13q8gjkNXUfuxLus53bHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815752;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8WfWmbCY+LxupRU5YzXLXMsE3ajN0XSGBUb/zFzVwcs=;
	b=10bg5J5fdB3y4pb003VsEfAHTo3xkc4qWGp1UcaDsLTeblxlUG0O7XMrzM4xMXYggiUz
	 rKAtq9FpEfMTdhbrBfL3A3aILKHedVyMztpVknUAfhiwVfbZNJ//8OuamUks8qge1w3YD
	 xU58bgTMcK4vG/nqNqEB0SFCeoGsLi2mrXiEAOCO7eqqxS4pm3efAlbkk/Nl7YzvE1H3g
	 ovXJ+/893VqhuiViiCPCKo68z0T8Y6yjYwqL2QIdvQodj1sBIP04Kf53aGmjdrxdDkEXh
	 EtfP2xNechl9c9vqfgI1TNfBXspFbSKhuQg+EUMLjUEHgYW70C5kkYVHpCQOHECuOSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxY1Mj8C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEA7606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxY1Mj8C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699491F000C6;
	Mon, 16 Nov 2026 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794815752;
	bh=8WfWmbCY+LxupRU5YzXLXMsE3ajN0XSGBUb/zFzVwcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gxY1Mj8CtBxa6Zjx60oRZk2AcypX+tGhdWCnHN+ZnDsxTCCaLH22r/MMicKBid4+N
	 Bh8SmrC5D0z1oKBwOErVFtmK0W8uJ0jwid4N/o00DJHXKkMYFzpvMno12x8tGL1u2r
	 LJGASqnhhxCZlvPoMCAFIbxzmMGYReWxJYllWx0YT2FhwZo9rgyjEK6YChh+WSnFpv
	 gKh5CrwIhjHRd/DJ59CmkF74HdCEVqnlaYV6zfJ22KsRbuR+c7fW3hYeArSL7LjbqN
	 V6k84X7BMdjtoH8jFT2yWPYQJ4zpArpMC/yAfp7oNHR+DTDY779vnAkZ4gzn2pTi2t
	 goU1XXvRZsreQ==
Message-ID: <sashiko-outbox-216480@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: power: supply:
 samsung,s2mu005-fuel-gauge: add S2MU106
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWRpbCBIw7xzcmV2IFRlcGU=?= <tadilhusrev@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116074000.355176-2-tadilhusrev@gmail.com>
References: <20261116074000.355176-1-tadilhusrev@gmail.com>
 <20261116074000.355176-2-tadilhusrev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:55:51 +0000
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
- [Medium] dt-bindings: power: supply: s2mu005: invalid fallback
  compatible for S2MU106
--

commit c83b096797bb5a947ce97c34b89a173145f99454
Author: Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com>

dt-bindings: power: supply: samsung,s2mu005-fuel-gauge: add S2MU106

This commit adds the samsung,s2mu106-fuel-gauge compatible string to the
Samsung S2MU005 fuel-gauge binding with samsung,s2mu005-fuel-gauge as a
required fallback.

> diff --git a/Documentation/devicetree/bindings/power/supply/samsung,s2mu0=
05-fuel-gauge.yaml b/Documentation/devicetree/bindings/power/supply/samsung=
,s2mu005-fuel-gauge.yaml
> index 05e420316a26b..7b9d56d38c651 100644
> --- a/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel=
-gauge.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel=
-gauge.yaml
> @@ -14,8 +14,11 @@ allOf:
> =20
>  properties:
>    compatible:
> -    enum:
> -      - samsung,s2mu005-fuel-gauge
> +    oneOf:
> +      - const: samsung,s2mu005-fuel-gauge
> +      - items:
> +          - const: samsung,s2mu106-fuel-gauge
> +          - const: samsung,s2mu005-fuel-gauge
> =20
>    reg:
>      maxItems: 1

[Severity: Medium]
Should samsung,s2mu106-fuel-gauge be listed in the compatible enum without a
samsung,s2mu005-fuel-gauge fallback?

When a devicetree node uses this fallback and binds via the
samsung,s2mu005-fuel-gauge driver entry, s2mu005_fg_get_voltage_avg() and
s2mu005_fg_get_current_avg() write S2MU005-specific selector values to
S2MU005_FG_REG_MONOUTSEL and read bogus values from S2MU005_FG_REG_MONOUT.
Because s2mu005_fg_get_status() checks both current_now < 0 and
current_avg < 0 before reporting POWER_SUPPLY_STATUS_DISCHARGING, those
bogus MONOUT reads also cause POWER_SUPPLY_PROP_STATUS to misreport the
charging state.

Later commit "power: supply: s2mu005-battery: add S2MU106 support" adds a
distinct match entry for samsung,s2mu106-fuel-gauge with has_monout =3D fal=
se
to avoid touching MONOUT, while this schema forbids a standalone
samsung,s2mu106-fuel-gauge compatible string.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116074000.3551=
76-1-tadilhusrev@gmail.com?part=3D1
