Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1A3F88B9
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 22:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785969053; cv=none; b=otWPZQ4dQGMxinzS/yExDMXPR2afjNCeYczBe5prg3xNGkj/DqGmY8iHDy/z7fHTxQNZp54SwE44sKjwX6OhDSgn9k1zN4zWNMt1UunTkMSQizveWWfcl6Gr9ee2f4RUExmvC5233d5itnec8lCkfPf6e/uMr4AH1HzCr1IKjbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785969053; c=relaxed/simple;
	bh=2hWHbTYhIsULITAdqnCohW7Xly0MtxB3K0Sflp6DPrs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AnjRe8V9K6XZuqEQ2J9v9M/T0PEz9evOk3X5qBa5tctowM5+uJ7orb8u+A298dld9F1dscmYjyI5E7vsQWxKgNKNDtKitJxT6UgQpqmaHnFTOfS/Ml7MfD/Gh1boddAk7dKyKGZ2oFLA4zTsW8WvWvjmn69mNYbK/hMIWF1Emuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMFYyVMJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMFYyVMJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8FB1F000E9;
	Wed,  5 Aug 2026 22:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785969051;
	bh=LVEZgeoz/WM+kzKAoIhdjQCfQLlrTwOwPPm7qIWeH68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GMFYyVMJKSthS3/95EG+qRJaZMaF3kYhYYj1rL3DBi3JydpgVDmADhlQm0AsIStEz
	 erSzZPr62vTv+jJ2pxxlH/+TYd1Vpby5r27Tn6lU9xdoPYyUMnIi1E8MX2SbhE4yMx
	 rhaSZE8bmZuFc6CWcv+98/BbEySfmAuis/kTckxhYrGm+0O2lvgZ/Ff3wNnASWGdBz
	 Jh4BU17iqt5L1eqOY1X3RThikfIViDGcaVvpEFFhrOHYPEL9HBHoyFJhwBkdKdHAv2
	 NynrIpPYgQ7BFyBiHVxI7/Z+gBN8c7sCp62c3O9/9rewTnXhtKpNp/ocOcW+pRbU3K
	 btvT0sdbS0Pvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] dt-bindings: mmc: Add reset-card-at-resume
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kamal Dasu" <kamal.dasu@broadcom.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805222500.2567801-3-kamal.dasu@broadcom.com>
References: <y> <20260805222500.2567801-1-kamal.dasu@broadcom.com>
 <20260805222500.2567801-3-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 22:30:50 +0000
Message-Id: <20260805223051.5B8FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing schema dependency for 'reset-card-at-resume' property.
--

--- Patch [2]: [PATCH v7 2/3] dt-bindings: mmc: Add reset-card-at-resume pr=
operty ---
commit 58ef61eea1643d1fd872cdd2532bc0149abeb166
Author: Kamal Dasu <kamal.dasu@broadcom.com>

dt-bindings: mmc: Add reset-card-at-resume property

On some platforms, firmware or other hardware accesses the card
during suspend/resume, before the kernel's own resume path has run,
leaving the card in a state the kernel can no longer assume it knows.
Add a flag property so such boards can tell the mmc core the card
needs to be reset before it can be used again.

> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.=
yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> index c18bf0d6a56ec..6929969ed5a2a 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> @@ -293,6 +293,13 @@ properties:
>      description:
>        Preserves card power during a suspend/resume cycle.
> =20
> +  reset-card-at-resume:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      The HW/FW may have accessed the card during suspend/resume,
> +      leaving it in an unknown state. Hence, before the card can be
> +      used, it must be reset.
> +

[Severity: Low]
Does this new property need to be added to the dependencies block at the bo=
ttom
of the file?

The commit message notes this flag "is expected to be paired with
keep-power-in-suspend", because a resume reset only makes sense if power is
preserved (otherwise power cycling forces a reset inherently). The v7 chang=
elog
also states the driver now strictly requires this property alongside
keep-power-in-suspend for (e)MMC.

Without a schema dependency, device trees might incorrectly specify
reset-card-at-resume without the required keep-power-in-suspend property and
still pass dt_binding_check validation. Would it be better to enforce this
constraint in the schema?

dependencies:
  cd-debounce-delay-ms: [ cd-gpios ]
  fixed-emmc-driver-type: [ non-removable ]
  reset-card-at-resume: [ keep-power-in-suspend ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805222500.2567=
801-1-kamal.dasu@broadcom.com?part=3D2
