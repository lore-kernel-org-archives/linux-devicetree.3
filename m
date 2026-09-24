Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F38A3D1ABD
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262018; cv=none; b=SjXvSEp+nlp6vQ4l3gGqssiCKBNIbg12NprkV/QxRrZlKYZH3ZxKuK7jEnc4Fadq1Z9V6+wsV4pd30DZcgszvf7k1qhdWn32vDRJp5w9y2mTAxt16PN16ThX3I0iHURzhGOfBw+mW62orEaocecemOPq8op/q/hKWdm2hwiMnW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262018; c=relaxed/simple;
	bh=Bx8IByIYYnTxaEItclwbdXsJEDzHS4gMmcXJa2zMTXY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jo30EqTQnogqgYCSy0cSd2yMcpPTSLMXPISujK+RkRPYJ/lE5q9bnwWk6QqgbA2Ps5GtrlNqgA8tZAFQe6l4PegVeZcqmc2OsZ+LAmtOGn2LSEJd3zZC4kDlXucdM8W0UAwn6pspxBYTyZqAMBHdiVCb3wB0E3E/NVbBPhLgTB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbVO+FBS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbVO+FBS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3561F000FF;
	Thu, 24 Sep 2026 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790262016;
	bh=Wc9fAoZBufbONSbp5xUMxzaYXBs6xLiLWXzit1d6rMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MbVO+FBSjvR7zhLVwtIDeNW+/hEHcaYWZI4wPwPgY8Ld0nUzrnDktb72R1Swy31Iw
	 Zi0mzpBK1eHvT2es/alPulXDclzqS+8UtH4PFQLUXaMUE7w5cjGGWyOiCg2pCGh7Hw
	 mcCCstQZ9kfl23OV5k+QhUAqrVsuVYxUxabf7JWWkDiz8uaTa9ljXFezH798OsRCmg
	 4vmdk6GGe9bpm+MpP0SvqEXbuKZY2S54mzsA+lf5QW6sQsW2z6ba5BKOJp4hqjoA3K
	 JW3WqQ+kBx5rV/lng6z0m4LLkV8IG3eP6QVVesRYbqn6jiIKq/EmyBcwvlb/h51pNo
	 aIPWE1fOL2VNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add RAiO RA8875
 display controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Azuddin" <azuddinadam@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260924145400.1385815-2-azuddinadam@gmail.com>
References: <20260924145400.1385815-1-azuddinadam@gmail.com>
 <20260924145400.1385815-2-azuddinadam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 15:00:15 +0000
Message-Id: <20260924150016.2F3561F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing <dt-bindings/gpio/gpio.h> in example causes dt=
c build failure
--

commit 7e01f56671098a8bf49e596e68df147ced833fec
Author: Adam Azuddin <azuddinadam@gmail.com>

dt-bindings: display: panel: Add RAiO RA8875 display controller

This commit introduces a new device tree binding for the RAiO RA8875 TFT
display controller. It documents properties for its SPI interface,
including required supplies and GPIO resets.

> diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.=
yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
> new file mode 100644
> index 0000000000000..b50fd95c57539
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

[ ... ]

> +examples:
> +  - |
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel: display@0 {
> +            compatible =3D "raio,ra8875";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <16000000>;
> +            vdd-supply =3D <&vcc_3v3>;
> +            reset-gpios =3D <&gpio 25 GPIO_ACTIVE_LOW>;

[Severity: Low]
Does this example fail to compile during the make dt_binding_check target?

The GPIO_ACTIVE_LOW macro is used here without the required header
inclusion. This causes dtc compilation to fail with a syntax error
because the macro remains unexpanded.

Could we include <dt-bindings/gpio/gpio.h> at the beginning of the
example block?

> +
> +            display-timings {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924145400.1385=
815-1-azuddinadam@gmail.com?part=3D1
