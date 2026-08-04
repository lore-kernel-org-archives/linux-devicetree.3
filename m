Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561B5456E16
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861246; cv=none; b=BMdF8+eKrKS1P5oUfZWgM3xIAUSRFJPvP8UcHNJ4IG93Cy1llLm3fr6g1CmQxalYNKwn+zWzCWbrBA58T4gTF6vvhCHqdrLfs2G93L8h9lZD2H4PWZQWXY3C5iTe9gpAZfZoGVk2975litUZ5MnKRGdlAca2krOz1CsuPaTyZZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861246; c=relaxed/simple;
	bh=fc0jjHJmcjgDlNcGEIQxXC/gYmOyKOHCmm7GGlrfyhI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EPu7DcGBKnqLY2w5DovG7i/MfeMhPT9AucREdx+yDNd0H+ZDDm7QKZDa+u0ZPdWjnanTel7szRQR5ZdnXilxOzIututpr4UjxKqWL+e/cBC6mqrSQ9sSq9imxGasT1qHf38ROs2hnlDrCiS+XJCxCzuiTSMIZ8gzUGXRmnLOnRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VitZhJV4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VitZhJV4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A091F000E9;
	Tue,  4 Aug 2026 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861236;
	bh=NSLyHlUDdEyw55CW9v2fac5jZTFQbioTpJtj8hz+z6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VitZhJV4Y7N6vvPHhF5mUSwXygeW1f7H1LRGh0fYudPRlkQfqPOjLk194keIk8dUE
	 GfLP9Ck9wPPzgT4Ap1cK0EX2Pmw/wQN7MDlRq0QIqs7F37VzKDjuzGaydyZ1XDv/YK
	 vsFG8fYbHhtbPuzPprDxxSCAcCv2XsQ/wUjsd46/Uxi8VnVHzm6chz/9pk7pTgcozI
	 HNGr2TeYVocTtTo2vx1aDuN3Bphlme/GPkC96XNs18+PcyGdMT/gWIylRJ3FvLve59
	 zzpno/rBzEHT4Qas2e8WVPS4+KWn89TgQDJEJ9LRdSwYBdPc8qdZ2n8ZEY3kD3h+Ji
	 62FBR6cysgiQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 36/36] dt-bindings: pinctrl: airoha: add support of
 an7563 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804160419.3592327-37-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-37-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:33:56 +0000
Message-Id: <20260804163356.92A091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree binding example uses deprecated uint32 syntax for t=
he boolean property `drive-open-drain`.
--

--- Patch [36]: [PATCH v9 36/36] dt-bindings: pinctrl: airoha: add support =
of an7563 pin controller ---
commit 6b301b6a4c35b1cd7c701f2fde3e4da82cdaf6b9
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: add support of an7563 pin controller

This patch adds device tree binding schema for the Airoha AN7563 SoC pin
controller.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.=
yaml
> new file mode 100644
> index 0000000000000..e626d34661285
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pinctrl {

[ ... ]

> +      pcie1-rst-pins {
> +        conf {
> +          pins =3D "pcie_reset1";
> +          drive-open-drain =3D <1>;

[Severity: Low]
Does this example use deprecated syntax for a boolean property?

The schema pincfg-node.yaml explicitly marks `<1>` as deprecated for
`drive-open-drain`. Downstream developers might copy this deprecated syntax
into their device trees.

> +        };
> +      };

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D36
