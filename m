Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B1630E85B
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 21:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853934; cv=none; b=YnF/+BCNIRAOGF9U0CanQEHEuKe7YKpxWu2QQ9OxkLwRQ/5/mXGW5hkHw4FnvrkVLxTOUseYtaNNNiBdhgPb7eqtNmvqeLgjC7z72RPjxJ7nIbds2+3CUFrowSgNLyritgZvy0xuXnhDF8M02bx1GGGScdGATR5fMzF1H0OswoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853934; c=relaxed/simple;
	bh=d4ZtAVvEHsi9LwSBkqYV0lZNRt0RYPJpRF0jjSYNDqw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sD0/3He763bOr2qaotmQ1pZnDtpws5C1UKBUA7Y0BtgxUJz/jsK36sjahMXPmIPy0a7IjB92zUB/WJVHrBV6k3DveoKwkyRsbE2vhUKSQmWJq5uf3qWzIziOGPGa94bzKd4mQwQR8vjRhuLP+8wtx+/BtJThwlORfzd3UJMT2ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJxPPL31; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJxPPL31"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83A01F00A3A;
	Tue, 30 Jun 2026 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782853933;
	bh=9N1dHTm3kLw78NZ4f4LxHrgjkbeANLKDe77oIM1iDcg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJxPPL318WNj/tpD1iMrJ5vc0inRH1ILt423AR3LNnq1S6YqZQYH2Yc+9ekzkbk2k
	 lux2d0gmxjFyk4LE2hgdxipZN/N9z/MTSHxYgh9EGTigzTxTQRagnOIzWHn2Jw+Znu
	 qAEPz8rNIG+ootb9FXLARexDMm6V7TNfEtrKGjMfer46aVSYBC+3IH2WpzW0Gct+VL
	 TsrLgYen2yxSqCuyIeEKv4kvZZNxv0ZeywL9MahAUbMtlsRFpVw7+8oF6UP9/Ko5DW
	 MRFgZhzIv+c0wx3+fEIoI7b5czIT9jDrpuNJHkjXurm1h3trmOfobrx3RATjaiEtVB
	 FHxhHxVJxANYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: raspberrypi,bcm2835-firmware:
 Include 'reboot-mode.yaml'
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260630-rpi-tryboot-v2-2-f68d2dc6aa27@linutronix.de>
References: <20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de>
 <20260630-rpi-tryboot-v2-2-f68d2dc6aa27@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 21:12:12 +0000
Message-Id: <20260630211212.C83A01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The DT schema inadvertently rejects generic reboot mode properti=
es due to the retention of `additionalProperties: false` alongside a `$ref`=
 in `allOf`, contradicting the stated intent.
--

commit f839a4f18593a7083b268a49226464a9e0f0e8b5
Author: Gregor Herburger <gregor.herburger@linutronix.de>

dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'

This commit allows reboot mode properties by referencing the
reboot-mode.yaml schema for the Raspberry Pi firmware. It restricts the
maxItems to 1 for specific modes because the firmware accepts a 32-bit
reboot flag.

> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm283=
5-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm=
2835-firmware.yaml
> index 983ea80eaec97..28c5713860468 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
[ ... ]
> @@ -133,6 +133,15 @@ properties:
>      required:
>        - compatible
> =20
> +  mode-normal:
> +    maxItems: 1
> +
> +  mode-tryboot:
> +    maxItems: 1
> +
> +allOf:
> +  - $ref: /schemas/power/reset/reboot-mode.yaml#
> +

[Severity: Medium]
Will this schema inadvertently reject generic reboot mode properties due to
the retention of additionalProperties: false later in the file?

Because additionalProperties: false is used instead of
unevaluatedProperties: false, properties defined in the referenced
reboot-mode.yaml schema but omitted here are rejected. This prevents device
trees from using other standard reboot modes like mode-recovery or
mode-bootloader.

Could the mode-normal and mode-tryboot properties be replaced with a single
patternProperties rule for ^mode-.*$ to enforce the 32-bit cell restriction
across all reboot modes, while changing the schema to use
unevaluatedProperties: false?

>  required:
>    - compatible
>    - mboxes

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-rpi-tryboo=
t-v2-0-f68d2dc6aa27@linutronix.de?part=3D2
