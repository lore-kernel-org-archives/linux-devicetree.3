Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3441DE4FB
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 21:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782249450; cv=none; b=BWxgA/m2BDVo3I0SqHaAf5QItIwQ7kI1LFHAq0VvQ1CsAiID4Gfg4a4uPwoqL0YDNxo6uxmkPWpiw0bE98GaBAkW/aaOlIXA1/BoZAo09PXriXNm3Ki2ZCnym88kyiTrCpcWuLbXLtVue8EkptP54zvvcLvfRwzwx28MjtXFZns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782249450; c=relaxed/simple;
	bh=AxffFjFtcnRcFZA4baNJBJP6SgMJwWsxnizVJR8Zqd8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N2TKdEop+iR1uZZ2D+jeHr4FJUvl/5m2aOJfyap6uD3wGJIoYVjeXWf8MjK5lpeH6SFKu8D3YVaVN9FgdB4aCjgukIDXafXNvUWqdvIdhkQWavzlHsxdUxA2QgBFORrqkfcV+gl71LMBbc3Zo1RotF4ztExROdh17KPEAY1pqtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fa4Cbcnp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fa4Cbcnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F861F000E9;
	Tue, 23 Jun 2026 21:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782249449;
	bh=HfAbN6fdAYRX6OsswoVvBX/7G6OKwb3AQb64yM0V878=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fa4CbcnpiZFJAWVtr6aZvbdAbXdyVQ63DI9VfL03e1z17uvX+0oSZd3G7CQsx1OhX
	 MhOFTAgTOfcofsNy4ZWRVigtFylGDvMtr7RI+kaN5Rc0cgzWn2t6nU3jjYosJcmQ53
	 PNXsrpNrczSkt1xEWEV24rUix6t/m+tapkw9LbojQmQNagmZpB+W8CKf4Ne88COaFw
	 gAqLmqeZ4RHBKtEFsmjTuhI0CqXvlxEHa7FCQyNJhELyoW5so3KEArCajtKE1sqnCm
	 D7bhKhon0eV+HiGwpaUwbtpTZlCUpFWC1QAM0R/ZRMBjaIokhhoQLCWB4kugHt+H9D
	 kAWTvicJbpqgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: iio: health: add adi,max86150
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623201124.18271-2-shofiqtest@gmail.com>
References: <20260623174600.17100-1-shofiqtest@gmail.com>
 <20260623201124.18271-1-shofiqtest@gmail.com>
 <20260623201124.18271-2-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 21:17:28 +0000
Message-Id: <20260623211728.F0F861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The description for the `interrupts` property explicitly states it =
is an 'Active-low interrupt line', but the example uses `IRQ_TYPE_EDGE_FALL=
ING`.
--

commit 842884bb765a65ccd68dc98c1bab3a30ca22640a
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

dt-bindings: iio: health: add adi,max86150

Add Device Tree binding schema for the Analog Devices MAX86150
integrated ECG and PPG biosensor.

> diff --git a/Documentation/devicetree/bindings/iio/health/adi,max86150.ya=
ml b/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
> new file mode 100644
> index 0000000000000..c191f4f1525b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
> @@ -0,0 +1,78 @@

[ ... ]

> +  interrupts:
> +    maxItems: 1
> +    description: |
> +      Active-low interrupt line.  Asserted when the FIFO almost-full
> +      threshold is reached or when a new PPG sample is ready.

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        heart-rate@5e {
> +            compatible =3D "adi,max86150";
> +            reg =3D <0x5e>;
> +            interrupt-parent =3D <&gpio1>;
> +            interrupts =3D <5 IRQ_TYPE_EDGE_FALLING>;

[Severity: Low]
The property description states this is an "Active-low interrupt line",
which typically corresponds to IRQ_TYPE_LEVEL_LOW. Does the example use
IRQ_TYPE_EDGE_FALLING intentionally, or should it be updated to match the
description to avoid misleading developers who might copy this example?

> +            vdd-supply =3D <&vdd_1v8>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623201124.1827=
1-1-shofiqtest@gmail.com?part=3D1
