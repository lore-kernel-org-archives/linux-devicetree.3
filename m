Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117602F7F00
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141377; cv=none; b=g0VwdvqbWdFAqpWque0XHiVqJKcT87XkeVF2ObyU+pbmE5wk6KOb6q4DoHe+Vq2zUkjnHp1+96NmH6eeRAwz0yhBLxPO9XHfnbiR1tMFbbryuzhJEW3vWZH9DWpFzCKadBL5+lJ0qTwnpnDx5KWnWKBYThbndkV4wSjdKkvqXyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141377; c=relaxed/simple;
	bh=qx13csgluHhliUr2uDwuPVYCnWm2kox1x9EwHWdPyuQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VhtlJEH57pm/RNeDp+v6FdpemmZapHpkYMfAxK5AKpp7aieOy8gOKX6vEJMbkR3qu66CcUlbbelU2kQqkNE4L/Op0dP5HEmocQay9q+SWzqZ4IxakJgDhn3cCrrRhLrYxuIiVAYxsJFFq25lSh3hr74vj8jq2mbaJnm0KzZQIkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qrq1aavJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qrq1aavJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B4E1F000E9;
	Mon, 27 Jul 2026 08:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141375;
	bh=rgctEDnqtbCqbn5Eb2+L37/euUOyZiRs8vDMXP1tYMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qrq1aavJNLhdizxtbqatfksWQPBoiBMuiKULBMhKX/vvQ+r8IApV+O+hF2iT2R6Wf
	 vGzp7zptkFFEAtky2eX2y1UWdctjq/v7uSDb6R0qIAYunJcEnsojCAtCj0bOxG57Te
	 oIIbccJ9US7T/grfPkMgTgDFe49jnqO10W6Fx6JwM8vp6WqQE9Cddg77dehgcZqbGb
	 H9D8sp/yskdA5VxQtkMfQ6vxr3mnP/QpvGLdjvOvcKiMsgqw1X+XsyDRIgF9fKgu3D
	 yWpSd8UpKB6P8D0xR5XHjzihqF46evZH5X3S6Svnza1xCvWYfg7pISOR50Vpf0uAPm
	 gbtaTtnpQE+Jw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: media: i2c: Add mira220 image
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260727-mira220-v9-1-e869e7ec2040@ideasonboard.com>
References: <20260727-mira220-v9-0-e869e7ec2040@ideasonboard.com>
 <20260727-mira220-v9-1-e869e7ec2040@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:36:14 +0000
Message-Id: <20260727083615.60B4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `minItems: 1` in `data-lanes` unintentionally drops 1-la=
ne support.
--

--- Patch [1]: [PATCH v9 1/2] dt-bindings: media: i2c: Add mira220 image se=
nsor ---
commit a07e0c84ef20042ffd0f045f21d59c669b882854
Author: Philippe Baetens <philippebaetens@gmail.com>

dt-bindings: media: i2c: Add mira220 image sensor

This commit adds device tree bindings for the AMSOSRAM Mira220 image sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml=
 b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> new file mode 100644
> index 0000000000000..fa6fec0072efa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml

[ ... ]

> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2

[Severity: Medium]
By defining items as a tuple array without an explicit minItems value, will
dt-schema automatically infer and enforce minItems: 2?

The changelog mentions removing the anyOf block from data-lanes in v5.
Without minItems: 1, does this inadvertently make valid device trees using
a 1-lane configuration fail schema validation?

If 1-lane setups are still supported by the hardware, should minItems: 1
be included here?

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-mira220-v9=
-0-e869e7ec2040@ideasonboard.com?part=3D1
