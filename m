Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522D74F4CF3
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737773; cv=none; b=YoeeHSxvMV1Zz1BjLkpp5rM/gY7PBd2mQh1OFh26NsmJEaB/EG8nAaURwNYtRsU1fu/ssJiePCtd1ftiV/kt03IwcdXQCzLROR+QaZdx6bQDu4KxZG6sOux1UT+Ep4qjnDYsLXL5GrYO49fopZMlbU0zgK0s4tkwd4yDn3RCCag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737773; c=relaxed/simple;
	bh=FcKGJoF1A7a+tM3OQKhZUhvCOrI/SWfFJHiZYj3W2Do=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LxgbfUVltt/x8hmOd0hS7oEieKEnu5MQZIJh9Pq9meAi8yssDm+62PgmAprd3YM4eJGBek+UDkbeY3b08duDjBq4W9F/QcOUOFrAyxY3i2p7n9ho0b3Y+F37W1ZEubY4i90Uph+vvCXmQlQPlcvG0k060dVPRLpLr8iVxnzq9+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/9UjEkB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/9UjEkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3BB1F000FF;
	Fri, 18 Sep 2026 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789737771;
	bh=Brnjl6//mqH55s0+pr4M1REvyIY/+hiKUCIRuQmC1+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d/9UjEkBGY5LDDsVj0Mch5EIF1SJ5l0jAmFOsKJqf04Ij30/sTHVFFFgqiB45n9Ea
	 +ukpSp44z5oulmBpCZgGZl5DolPHX4SdSikFTtYqD+I9LgC0lwqW/YVTduOjXq2JmT
	 wFvo3wz9P9M61AHFwNfgG20WA4d02yw0j6VAHBQ112RGCAqoSSmo4PZdudkYbLDv11
	 uJmKX9jg+uJdSvONz7G0Pbt+ZJtFQ1t75uMz94nGb0/8jA/VFiTEmSXicIEHpOT6yN
	 uscdCf/lA3cs7mULC2TUDCo/MK5Ygf20rFGwilgeOF1lVUBJLtvffFwZlmSBfyr1rT
	 Aj/dYollId0vw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/14] dt-bindings: media: add apple,avd
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260918-avd-v1-2-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-2-49977931f455@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:22:51 +0000
Message-Id: <20260918132251.7F3BB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: mismatch in allowed item count between reg and reg-nam=
es
- [Low] dt-bindings: typo in description inverses meaning (never vs newer)
--

commit 0cb750cf8e5918140118aa807eaabfc530d2708d
Author: Sofus Forstreuter <sofus.c@icloud.com>

dt-bindings: media: add apple,avd

Document the Apple Video Decoder. A hardware video decoder present on
Apple hardware.

> diff --git a/Documentation/devicetree/bindings/media/apple,avd.yaml b/Doc=
umentation/devicetree/bindings/media/apple,avd.yaml
> new file mode 100644
> index 0000000000000..34a4129d6a46a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/apple,avd.yaml
[ ... ]
> +title: Apple Video Decoder (AVD)
> +
> +description: |
> +  AVD is a stateless video decode IP block present on Apple devices.
> +  Notably it includes an ARM Cortex-M3 and associated DMA controller.
> +  AVD is capable of decoding H264, H265, VP9 and AV1 on never SoCs.

[Severity: Low]
This isn't a bug, but there appears to be a typo in the description.=20
Should this say newer SoCs instead of never SoCs?

> +
> +  The IP does not change much, with changes being mostly the CM3 having =
more
> +  memory and interrupts.
[ ... ]
> +  reg:
> +    minItems: 4
> +    items:
> +      - description: Cortex-M3 code (unsigned)
> +      - description: Cortex-M3 sram
> +      - description: Mailbox
> +      - description: Video decode control
> +      - description: DMA control
> +
> +  reg-names:
> +    items:
> +      - const: code
> +      - const: sram
> +      - const: mbox
> +      - const: ctrl

[Severity: Low]
Does this schema restrict reg-names too tightly?

The reg property allows up to 5 items (including DMA control as the 5th
item), but reg-names only defines 4 items. If a device tree node defines
the 5th register region, schema validation will fail because it cannot
specify a name for the 5th region.

Should a 5th const be added to reg-names to support the DMA control region?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-avd-v1-0-4=
9977931f455@icloud.com?part=3D2
