Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C32520299B
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739904; cv=none; b=WvVK3AWr1XQ6K54tvdi8ZqKZPiIWHSzWEtesGvvKn5Be1uolnYENGtq2499fkux3yJcB4DPOwUER7W/D1V0qdqzdciXH1M9SUyKnlxSaWn74GMQ/wh+Ng5qJ9KHKpnA8+7QW8V70dKVgjxFWzW7lRYjMvvT6qW/A8lbcn6tf07E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739904; c=relaxed/simple;
	bh=R5l1JhLtd0PXDn50droyipeO/aGhpssWF/Q/Ka8lQqY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zr0rVl9b+uN3KQ0Z/be/+/29Tbe538My/ZcDUUc/e6arg6CiTMNvqGc9Fly2Cvhf0ZbYjweRXFDX7eRIluDVs754hEfLrZHrPEKL27GCCUqHL+Ie4rJjMBZd4X+R4/+OnrDqmUkL7MoO0G5oAoU9WMhtcMsR6FgmkyRqTgngReA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CY/TUUB0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CY/TUUB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B991F000E9;
	Mon, 29 Jun 2026 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739902;
	bh=kRGQFl/z/hOAW56atGgQs8CbFSMUDxUnfbI2aVjBH4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CY/TUUB0zM8zeesxkaa547RHOS5aXLw+h2JsePDgQYnMLjM/dbPwdSixwLIWhK3xP
	 fwOMJ8HgKXatMiMLgQNXcF3OJLquS76pjPYLuw5tPDMAKyjGfCzr+MpX6a+ONVB6l9
	 fYymcnQsAp5YpI8vdhOHNH7YmvCovOa/EBJN83jlcTXvLpuaKV7qd8mdrebp7Xk/ho
	 SX5LcyEdr5DyWlm2Ye8dRy7GaD9LO+C9ApiPV11IDS8+o7z+glY5rdaM5yrVenx7g7
	 DYBtVx1PpS0ttaTCLZA1vY4nbOoiWpdhpSpM5UxIuzOAolos5LlbQW16C6QW6JErjw
	 NaiNxNbmFw3tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] dt-bindings: pwm: st,sti-pwm: convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charan Pedumuru" <charan.pedumuru@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260629-st-pwm-v5-1-a93f2bfec38c@gmail.com>
References: <20260629-st-pwm-v5-1-a93f2bfec38c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 13:31:41 +0000
Message-Id: <20260629133142.A8B991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `clock-names` YAML schema strictly enforces an ordered list =
starting with `"pwm"`, which improperly rejects valid capture-only configur=
ations.
--

commit c9b4fd6ce8e4e0ebe419750b4c65554ab14080bc
Author: Charan Pedumuru <charan.pedumuru@gmail.com>

dt-bindings: pwm: st,sti-pwm: convert to DT schema

This commit converts the STMicroelectronics STiH41x PWM/Capture controller
binding from a text file to DT schema. It updates the compatible string to
match hardware conventions and drops inherited pinctrl properties from the
required list.

> diff --git a/Documentation/devicetree/bindings/pwm/st,sti-pwm.yaml b/Docu=
mentation/devicetree/bindings/pwm/st,sti-pwm.yaml
> new file mode 100644
> index 0000000000000..39f96596c1ef8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/st,sti-pwm.yaml

[ ... ]

> +  pinctrl-names:
> +    const: default
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: pwm
> +      - const: capture

[Severity: Medium]
Can this rigid sequence for clock-names improperly reject valid capture-only
configurations during schema validation?

The driver selectively fetches clocks based on whether st,pwm-num-chan and
st,capture-num-chan are non-zero. If a hardware variant is configured solely
for input capture, it only needs the "capture" clock.

By defining an items array that starts with a constant of "pwm", the schema
mandates that the first or only clock name must be "pwm". Consequently, a
valid single-clock configuration providing just "capture" will be rejected =
by
the validation tools.

Would it make sense to use a more flexible schema construct like enum, anyO=
f,
or oneOf to allow either clock to be specified independently?

> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-st-pwm-v5-=
1-a93f2bfec38c@gmail.com?part=3D1
