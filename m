Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968A1222599
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129351; cv=none; b=fwHRNn7eIUsJOBd8dZYBFDUwh2gkJyOZq/vejy+N8/Rja3Eczci/Q0TTSRr5kSr2tDygvo+4xFo/uidXebYHrpdBiCO1n7/MepbKARlovRIOGfx5wkkiaczMVoca+Ouo/YKg2cbsvrwLIV4AFdV1yh28wMj1JkJ1roVnlYfGSmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129351; c=relaxed/simple;
	bh=L7XMHhzjWVEyIEt4dIjwXVWp2DcuUiVniMPJX9fUDJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QxvfGY7xL75MGWEvLtaltsDy2ZC1sUha7mVJ+9+stl01wLuZXDl5eoKf4Ru/ZEuVEP8TRMuBJkgx4mKmN7vMsE3pLrrxWPHINlbq3CHf+eDsMa5cdHYNuPAxSwsyC/tbtX3fzU0zA857xReItlP/lLO/rN0m6gi9ps7ZiP9T6rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjFEoaJy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjFEoaJy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073AE1F000FF;
	Sun,  4 Oct 2026 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791129350;
	bh=zzHzYf2e8B6rAp7IY9iDGDaGm/Jpu6R5+zarwS1ttE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fjFEoaJyUVJneYtoyj5RL7jPP6TonrdXqFapwwrNSGRlkOO+xHAm7BbLe2qMY5uKQ
	 imDH9GTpP65IpjfupIlTqn88iuOextY5nHS91rfHP7M1LwEqTEWPuwVUfTobmaI+Mq
	 ZSbznsbhzI9jxLXZdDAT5wVfmwC8nSsfL2iz/2bhKqNKyqzMUtft41uYq5OqYdO0/W
	 Dx9a5BurLzlp3FN04maDEoJqYq3H9XZtE0Hr9Ad6w8BGf2lYBaXafNIy2MkWRYBe17
	 yNb54nqigcEKRO7f79YWQSXULm6agDiwIErSQhJX2MIhPzXNM3SQl8fkWkQub3LBli
	 SXjRV8g0t5gfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: i2c: rtl9300: add pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Zavertkin" <misha.zavertkin@mail.ru>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <0cd1f9b98511c55a375ab82b121fe256916b87e2.1791127538.git.misha.zavertkin@mail.ru>
References: <cover.1791127538.git.misha.zavertkin@mail.ru>
 <0cd1f9b98511c55a375ab82b121fe256916b87e2.1791127538.git.misha.zavertkin@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 15:55:49 +0000
Message-Id: <20261004155550.073AE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] dt-bindings: ABI breakage by making pinctrl required for rtl96=
07-i2c
--

commit b162c61d2fc7ab941d4ea49cc274452fca8d089d
Author: Michael Zavertkin <misha.zavertkin@mail.ru>

dt-bindings: i2c: rtl9300: add pinctrl

For RTL9607C driver used to configure IO_MODE register. This register is
global and is a scope of pinctrl driver (either pinctrl-single or WIP
driver for SoC). Drop realtek,scl requirement for that SoC and require
pinctrl instead.

> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
> index 5873cfdc5b3e0..ad143509aa425 100644
> --- a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
[ ... ]
> @@ -94,8 +98,9 @@ allOf:
>              const: realtek,rtl9607-i2c
>      then:
>        required:
> -        - realtek,scl
>          - clocks
> +        - pinctrl-0
> +        - pinctrl-names

[Severity: Critical]
Does making these properties strictly required introduce a regression for
existing device trees?

Device tree bindings are considered stable ABI, and changes must be backward
compatible. The realtek,rtl9607-i2c compatible string was already present in
the bindings. Existing valid device trees for this SoC do not contain
pinctrl-0 or pinctrl-names because the previous schema used
additionalProperties: false without defining them.

Adding pinctrl-0 and pinctrl-names to the required list in the allOf block
for rtl9607-i2c means all existing, deployed device trees will now fail
schema validation during dtbs_check.

Could these new properties be made optional to prevent ABI breakage?

> =20
>  required:
>    - compatible

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791127538.gi=
t.misha.zavertkin@mail.ru?part=3D2
