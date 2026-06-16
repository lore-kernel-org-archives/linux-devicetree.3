Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93B735C183
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600645; cv=none; b=UWZnDnPhkAp1lPHrZIdRrlk8yf0uON6x7wEcQRcTbka6Di97+zTDXPjHmOJM7+XUkKeDQEP1Lm+kVY1UqWVKNa7KNJdi/8eIzNKpQwDsSIbgLBhzVt0jzTYskqkhjWqKCotl4Cq0muGQD+K1iPyb3F59BjyjNGyglGy4LrvleJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600645; c=relaxed/simple;
	bh=uHcsdbKFLmBvSUpYkpBRCbI54pYWVJAVMBA4n4TroaU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BPgbyBExjIskWxEQjUzOd7jmOWDmYAB/o3MtsHTTUEAWouhOzWgAjkkAqkX+HLdfWM2PYRGuSE6w0lwO5LnE0SXyxy5CvbbCUGmbUDcYj7bxkUwTjBa9X3df7EvmrC858NkXtcGBj6U7wRyTsBCiAbLIrw3fIM44alEkglFWbaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8h0pnlk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8h0pnlk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534451F000E9;
	Tue, 16 Jun 2026 09:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781600644;
	bh=4seXvpIW1lQ++lU822us1lGINTLbDm2ozLepAdJWMgE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z8h0pnlkf9zWMJnnG/jJMQjIlwDz2zEuMu7JPJjPty7gIvr6MLla3k5wRE5f9w2KQ
	 ShJqIqxrtfGhyhVzK9rRNwPbVy3AYtmojpknLpTKLKpHTQ/bsT8Q2hZ3L7dVsi3nTM
	 TL5DqAOYOu7pxRAONsyiameMeaGmZlPAWMX6UGhASRzbwHpC9PwFZ2bebYWTBDOd2h
	 4RaD7KrKZ1wujHDnXd4pjfMhKdKR+nB2kDLRCcmRxbV+42DUl4om5C7IbJG2oxu1VD
	 3OHxn+c1gaT1udNJNK3uKA4GDFhrya1SqlOyYPyLk3me/EyI/BkplivaPx8PQNnGni
	 wBFeLfIGbdSCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: rtc: Convert rtc-cmos binding to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Teja Sai Charan B" <tejaasaye@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616085659.12809-1-tejaasaye@gmail.com>
References: <20260616085659.12809-1-tejaasaye@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 09:04:03 +0000
Message-Id: <20260616090404.534451F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The node name in the YAML example uses a unit address that does not=
 match its 'reg' property, which will cause a dtc warning and fail `make dt=
_binding_check`.
- [Low] A stray file `result.txt` containing intermediate search and build =
output was accidentally included in the patch.
- [Low] Important explanatory text about firmware initialization was droppe=
d during the conversion to YAML.
--

commit 141cef115f7766092691376134d5e5d70aca938a
Author: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>

dt-bindings: rtc: Convert rtc-cmos binding to YAML

Convert the rtc-cmos devicetree bindings to dt schema.

> diff --git a/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml b/Docume=
ntation/devicetree/bindings/rtc/rtc-cmos.yaml
> new file mode 100644
> index 0000000000000..ba4812778115c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml

[ ... ]

> +  ctrl-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Initial value of the control register
> +      (also known as Register B).
> +
> +  freq-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Initial value of the frequency register
> +      (also known as Register A).

[Severity: Low]
The original text binding contained information explaining that Register A
and B are usually initialized by firmware (e.g., BIOS), and if not, can be
performed by the driver. Should this explanatory text be preserved in the
descriptions here to retain the original context?

[ ... ]

> +examples:
> +  - |
> +    bus {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <1>;
> +
> +        rtc@70 {
> +            compatible =3D "motorola,mc146818";
> +            reg =3D <1 0x70 2>;

[Severity: Low]
Since the bus has #address-cells =3D <2> and the reg property starts with 1,
should the node name be formatted as rtc@1,70 instead of rtc@70? A mismatch=
ed
unit address will result in dtc warnings and fail make dt_binding_check.

[ ... ]

> diff --git a/result.txt b/result.txt
> new file mode 100644
> index 0000000000000..5e90660b93ec2
> --- /dev/null
> +++ b/result.txt
> @@ -0,0 +1,17 @@
> +arch/x86/kernel/x86_init.c:42:	{ .compatible =3D "motorola,mc146818" },
> +arch/x86/platform/ce4100/falconfalls.dts:420:					compatible =3D "intel,=
ce4100-rtc", "motorola,mc146818";

[Severity: Low]
Was this result.txt file intentionally included? It appears to be a local
search and build log that accidentally made it into the patch.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616085659.1280=
9-1-tejaasaye@gmail.com?part=3D1
