Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D804334C5
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577896; cv=none; b=I6EmtCnCYG6Qg6h8PoObaQy02CIVvHxcLYwle1gVc+80uuzineWnK+HQPoiHF2i5bquVP/lOvq3BIVtbAOjYII3wI/NgtTda1X6SAz623pXatnKqSoAaz+3a/2l6fUw8dc79SzLyDU89s47wFUX7CaaRjdzL80j1275bMZfk2RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577896; c=relaxed/simple;
	bh=BvHvfGAKCu0eyBmnWSfmzEUtVcuBWUOQQwCCkdMj13g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D9Oack/CePmSGE9a+JRug+23gC4SlLYmh+HPokF1yGVaQKoYFHDFWRPbDm/2dGiqL9vf959riL17F5aIzmuU1HhUw4CsJnwfBRZHxR+1gezJ4QAJ9JwXsenRNs+PZVRwDp/8IEdMgWO0tyEUg7+Uzw2tv67oJMD3ugTiTlUjvDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDROHJjW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDROHJjW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D511F000E9;
	Wed, 12 Aug 2026 23:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786577895;
	bh=PVwZtuk53GTiU4ZkkdKzv5Z+tXq3PRIv1RMaU4uBBPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GDROHJjWA3Z9gMdfQeaokPFAwVir6J2BCL9yO2K7oUqjQ/ZlABU/f8IRwrHl5CjAN
	 czb0vsfDZois48VTf96DYZCDeGOyFUmfkjt5Bag6RHg2A7qieL7fVMmYeO628NTJh2
	 qbfcR+sNwQDoEs8E4bSAbN21mrOfw5DudnEB/KWwOj3plAKaS+rcI17bVzfXD4Lch6
	 UwK/WQg+urC98kUOUNC3Aa4XXJICSgdDa2Nz+SBUG0lsYpWNUKJJEVr+4kw+b0UhfL
	 KyN4Jh5xZn+Jb1Xq9jPrUEjvWKvVTOnLp/IaUXHpnlXcEOpool9kbvgf9Qv5IoftNE
	 Q/y+hBM4VWxlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: tse850: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813-ti-axtensia-v1-1-768a1089fd5f@gmail.com>
References: <20260813-ti-axtensia-v1-1-768a1089fd5f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 23:38:14 +0000
Message-Id: <20260812233814.B1D511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unused include directive in the DT example.
--

--- Patch [1]: [PATCH] ASoC: dt-bindings: tse850: Convert to DT schema ---
commit fd4229a28be15b03b82f6b00f748cb23a777434c
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

ASoC: dt-bindings: tse850: Convert to DT schema

This commit converts the Axentia TSE-850 audio complex device tree binding=
=20
from a text document to a YAML schema.

> diff --git a/Documentation/devicetree/bindings/sound/axentia,tse850-pcm51=
42.yaml b/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.ya=
ml
> new file mode 100644
> index 0000000000000..0ab4b697d28ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/pwm/pwm.h>

[Severity: Low]
This isn't a bug, but is this include directive for pwm.h still needed?

Since the pwm-regulator node from the original text binding was dropped in =
the
conversion, no properties in the example use PWM macros. Can this include
be removed to avoid unnecessary dead code in the example block?

> +
> +    sound {
> +        compatible =3D "axentia,tse850-pcm5142";
> +        axentia,cpu-dai =3D <&ssc0>;
> +        axentia,audio-codec =3D <&codec>;
> +        axentia,add-gpios =3D <&pioA 8 GPIO_ACTIVE_LOW>;
> +        axentia,loop1-gpios =3D <&pioA 10 GPIO_ACTIVE_LOW>;
> +        axentia,loop2-gpios =3D <&pioA 11 GPIO_ACTIVE_LOW>;
> +        axentia,ana-supply =3D <&regulator_ana>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-ti-axtensi=
a-v1-1-768a1089fd5f@gmail.com?part=3D1
