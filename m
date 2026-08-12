Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFE235E943
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 01:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786496761; cv=none; b=eVpdXU6rkMah41HfkHGhke6kV64WFXqjVGZfZMOhrMNyc6pZzaqGP51VHkublw/0CSkoI1oRDfZ5aZnrVgaDE7nTQhpcAwOmvGotMTIcGCD1snRg8Vh/e3fQzRHelUDs363khdP1vLtt2j+2a0on9ntP2fBaflkkMCMA6L9eS9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786496761; c=relaxed/simple;
	bh=sRmx0YkHxDv482Qhj/cWlh+8rhiHyHT3WU6XNg3nPEM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AbsJF1KQYUBTst9DKTicwzUzRBmeUmwb0UklunT5zpG9bZkLdjm6bDl/0/NOt39oVs0A5hTM3PSThVcv/Kk0mp/YV3MJYhs3A0fUcBj4pAUJsPKgRTUJs/ufu7wQAU9tr/LP89Gy5jFE7SKl+ESsZncdqObuKcW4258fobpxM/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ju6bl8Yl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ju6bl8Yl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56FA1F000E9;
	Wed, 12 Aug 2026 01:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786496760;
	bh=a9w3didf8FefJGjP6R1BDTCoZrWi/I5IkQ865A031Rk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ju6bl8YlAFMIsqpZtdzYS2xl7DG8tRISV1Yh5BC+5bh/rYawoVmVhbRWX69iIpZuG
	 GDRM3JEK5IfA/FhTPTfHtjvtSeO2ajHqnIl8wmHC7/upolLpUU4zkkk2XpyNR9XqKy
	 A3yUJeFmFGLxqj51SCumkxNWid6vqJuClR3oEEnAfNrhLWI7MqGLl9dzFVEC9aTdPN
	 nzPzZrgO6LI3TnCPvBLNvrFJfecycDOlNK5eYBGqs89RwwR46Ca8CY4Wgo++cxz90n
	 cX5AfRrypAYlYTEGeK6zKveIa6T9zTU64r7Qf0OmMz6E07pJksm8bfEsPq7FX9gzFZ
	 duHQESIoMipUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260812010157.1772849-2-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 01:05:59 +0000
Message-Id: <20260812010559.D56FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string used in the example does not match any of the=
 allowed compatible strings defined in the schema enum.
--

--- Patch [1]: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEM=
TO PHY ---
commit 30374f65d955f737e83c81bfd3daa6123e05bf6b
Author: Pankaj Dev <pankaj.dev@st.com>

dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY

This commit documents the USB2 PHY for STM32MP25 USB2 controllers. It
introduces bindings for two slightly different PHYs on the SoC, using
different compatible strings to discern them.

> diff --git a/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml =
b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> new file mode 100644
> index 0000000000000..ca9fc3b87383c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp25-usb2phy1
> +      - st,stm32mp25-usb2phy2
> +
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    usb2_phy2: usb-phy {
> +        compatible =3D "st,stm32mp25-usb2phy";

[Severity: Low]
Does this compatible string match the ones defined in the schema properties?

Looking at the enum above, the schema defines st,stm32mp25-usb2phy1 and
st,stm32mp25-usb2phy2, but the example uses st,stm32mp25-usb2phy. Will
this cause dt_binding_check to fail when validating the example block again=
st
the schema definitions?

> +        #clock-cells =3D <0>;
> +        #phy-cells =3D <0>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812010157.1772=
849-1-marex@nabladev.com?part=3D1
