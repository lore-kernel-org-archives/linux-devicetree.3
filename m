Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8B738A706
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153080; cv=none; b=XY7SAXDgDSiP+3y2t9UxO8KkHWKo5EmBda86jhFCuPHAzq6JePgoKpDve6+2Yca43UDHwCM4+L+PLnzLeoJ3i3YPVbyODJOlgfBTfrxeYE0GcBXNh7wuJimQKW6bE9Q+/gx7IsdxsMy89zPoAjMcLyJQJEG9A+1AU8Qyb7FDAo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153080; c=relaxed/simple;
	bh=C1jj7Xcm0s576A9CaB/YrqNAtez5r5fdtxChSqNoiPg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k/Q6S+h7U4ym9q+gR79qNU3TcLhLLM8eQGygBMbi9ObDEUo15qo6yEb3IXx3wWaHFyNLVDPElQswkRmwcIOoLUM3iuMSOwKzLmXuLO1JcY9F34VIMJg+VLb0FX9cto7cTYXbde16gEJly/NS63HsFlCJ/lK0amgJyZ1w8pOfdAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGs6WlwC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGs6WlwC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD4D1F000E9;
	Sat,  4 Jul 2026 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783153078;
	bh=eYdslUEHglSsKArGGYBW8S+iSURNODT8r9whWz4B9R4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HGs6WlwCM9f/mawrsX022QQHevm+W0PXWjlfWzl51azxHJvSA7YuOVpHz14NpNNrx
	 wUGM/CVuHIHE8YVhUai/nRrhmHeGXpTHjttsIPQ03L8QhxHeg4hnvFia3dcr+KSbGs
	 iA01V40zuAbrj+wdYDuoFN9Iy54DydlJTbVYbHx2jw/1aqlr1sT1XO3i/TgD5ieMa4
	 nYu2MPb/2XUB+9cftXzK/V3wDPcIiJC228QchrBJStZ0KTwU7L5vQnLTLiVA0jPpjn
	 wSdnNPYUtLJb/L5grbgnnuKvfNqTmzCBqZsXBVQomDRj0mTYi5k5DVgFhAhnfI+lGq
	 KYxmeYvl6BJAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amit Barzilai" <amit.barzilai22@gmail.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260704080925.75113-2-amit.barzilai22@gmail.com>
References: <20260704080925.75113-1-amit.barzilai22@gmail.com>
 <20260704080925.75113-2-amit.barzilai22@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 08:17:57 +0000
Message-Id: <20260704081758.0BD4D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing default values for `solomon,width` and `solomon,height` in =
the binding schema.
- [Low] Malformed Git trailer in the commit message (`Assisted-by: Claude:c=
laude-opus-4-8`).
--

commit 1fc812656be731d6e9e5623e968e630de22b7e48
Author: Amit Barzilai <amit.barzilai22@gmail.com>

dt-bindings: display: Add Solomon SSD1351 OLED controller

This commit adds a device tree binding for the Solomon SSD1351 OLED display
controller. The binding builds on the shared solomon,ssd-common.yaml proper=
ties.

>     Assisted-by: Claude:claude-opus-4-8

[Severity: Low]
This isn't a bug, but this Git trailer does not follow the standard format
`Tag: Full Name <email@address.tld>`. Without an email address enclosed in
angle brackets, this will likely trigger checkpatch warnings.

> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1351.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
> new file mode 100644
> index 0000000000000..80850c2ab5b3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
[ ... ]
> +allOf:
> +  - $ref: solomon,ssd-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - solomon,ssd1351

[Severity: Low]
Should there be default values defined for `solomon,width` and
`solomon,height` in this block?=20

Since the common schema `solomon,ssd-common.yaml` indicates these defaults
are controller-dependent, omitting them here leaves the hardware's default
resolution undocumented in this schema.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704080925.7511=
3-1-amit.barzilai22@gmail.com?part=3D1
