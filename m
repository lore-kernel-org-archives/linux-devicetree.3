Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378CD3B2FE9
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785798; cv=none; b=sexiNEKzR2Rnm8+lfQB3oDBKA2CQwJSo4A9VlJcV2ZH4KoIcu62AdLS6QDEUzLAL6Oe6NN8INr5Jk9LUXGt8NQdXGb/NCya78TTzy4tOo9FS/cp8lW6uhTBCuCZYhZ23YV7wBVSUYE9bRuM/lEeV1YC2YelV8hrSP6Bfj4i6rqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785798; c=relaxed/simple;
	bh=3LdfwyuuDCRCM5rlREGe2xIDIkCR+oHdwzl6N2KDgZQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BUBz+WXCCM+h50ZhvM3GR+B6Puy+DkyYJ163jAyyMKHwKGfr3aveDoHveUTstRd3WeQ5EIHv26O5IVYDwBHPxBy5q7KYBBuI34O1eMVr+5sRfyr8xAoIWjVCk3U+UJLLpYCc9urZMaQ7MUEUOeOz7Q89ufObf7X802rnMxxCK2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPfazmYQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPfazmYQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CAD1F000E9;
	Thu, 18 Jun 2026 12:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781785796;
	bh=pkDWKkUzuTt/kzF1hSaIjiYUGEDhFpz1oWtLPbsYZrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fPfazmYQBTD7TzOWt/O0WhjIYEJM6Z7fVUedHjd5ww5pL/weJRt2HJmN6mewk48E2
	 07tqE9/knxhQt20SfM7Rvhi5tajpqcjLyBHIM6IBS0xRluSp3g5/rwNkHb9eOJEJvK
	 3uH5Iee3owm3+CoKbLk7kPMmHzqipHPtY3W1oPQYouhXYwxZXVFLdHz2YP5RNakSdm
	 BLAHAOdHN5dts4T1+X3zO+jPQyIdXE8J0scIfmq2aV8K1vn5nnbFzmILEBsU3RNZXW
	 RcMf8bVUQwvFLYY5BZYDWqkHKvjJiIYF8/pcGxfy2I0ONhR8HaKxV+tI2GhY7fwPq/
	 nn1k+8VKfrLmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: add Axiado AX3000 PWM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618-axiado-ax3000-pwm-v1-1-c9797a909414@axiado.com>
References: <20260618-axiado-ax3000-pwm-v1-0-c9797a909414@axiado.com>
 <20260618-axiado-ax3000-pwm-v1-1-c9797a909414@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 12:29:56 +0000
Message-Id: <20260618122956.A9CAD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `#pwm-cells` property is missing from the `required` list in=
 the device tree binding schema.
--

commit ecac4ef8f05dd912d17935a0faabe9c81c3d921c
Author: Petar Stepanovic <pstepanovic@axiado.com>

dt-bindings: pwm: add Axiado AX3000 PWM

This commit introduces the device tree binding schema and maintainer entry
for the Axiado AX3000 and AX3005 PWM controllers.

> diff --git a/Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml=
 b/Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml
> new file mode 100644
> index 0000000000000..8e5fee8c499d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml

[ ... ]

> +  "#pwm-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks

[Severity: Medium]
Should "#pwm-cells" be included in this required list?

According to the device tree bindings subsystem guidelines, when a hardware
component provides PWM capabilities, the corresponding cell-count property
("#pwm-cells") must be explicitly included in the required list.

Omitting it allows incomplete device tree nodes missing the "#pwm-cells"
property to silently pass schema validation. This defeats the purpose of
the schema validation and can lead to runtime failures if dependent drivers
attempt to use an improperly configured node.

> +
> +additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-axiado-ax3=
000-pwm-v1-0-c9797a909414@axiado.com?part=3D1
