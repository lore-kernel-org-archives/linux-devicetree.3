Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3312EEE6A
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 02:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785725295; cv=none; b=T9J21CAewgFkg+X5/T74A0Nvn4WQGSpw5Q9b2rfazSzCfGd+HOZivM3Y3nRIluLiCgH4I68Xi8hHLXovsC09AOeZOcFx6qNpLLFcI6MHH4ZRl/oZ+FfDZL583ScOlHGG0COkssmH3JZJ09Fc396vDVLomKkzqL2es4lIAtC/AWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785725295; c=relaxed/simple;
	bh=AXjQeKg1GxeKZ7uAXwGG0I+kMOD/CPIeAzTxqO7gg6w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nByB5kAyu2d/mxjbvl+Tgn7rkhEG4PZaZVPLfiee4bPyaf/eee2bzyLUn6ev2T3hF0CcMuLlQzfGNxrXSsBBU5zzsvmYamOJRSj426OiUnfTfYpaTMvuqOKvDWNhdEZe295x+akagAmygpWL9gAteNDI7bzW7np0pyfWwFMTwY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+CuAbgM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+CuAbgM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBDD1F000E9;
	Mon,  3 Aug 2026 02:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785725292;
	bh=2/m7t4F1bLUut9G46fPZcKbRn7UQeH8icSgQfTCoBBs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J+CuAbgM5/WiJnqXjMavqSCWsRCuE3yH0HPDxS46K7+vb6nvuzFYYIT9GOH0ZkZY5
	 ukGePTxYpk71maG5v/Nd6PhwlmlnlNoKO/TIR79RLizjhJGPnRkYbHUtuGnZmYzMIw
	 Haoan1B22+asA92siU6B+gz2JErCyuMyR7jlowDWRD32HY4jtsAb79f8vtvZhBfh9h
	 oo9P3bR4Lbm6PMhpNq9N9ko0CC6vp5cFrGonHKeDLXpfjLa6mjB94DFw3eoxQ558MC
	 YzhpLsvdKiCs8AJ2YRii5lW2xvTQvH6n4ESfzIEt8R5GCAIWampd4YF3DNHfURz93c
	 gEHQpU+LOP+yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO
 chip selects
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803024048.1641756-1-cwweng.linux@gmail.com>
References: <20260803024048.1641756-1-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 02:48:12 +0000
Message-Id: <20260803024812.9FBDD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit disallows the `cs-gpios` property in the DT binding b=
ased solely on a current Linux driver limitation, violating the core Device=
 Tree principle that bindings describe hardware, not software capabilities.
--

--- Patch [1]: [PATCH] dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO=
 chip selects ---
commit 3aecb6991adf3696410ad69c99107c7d732fd078
Author: Chi-Wen Weng <cwweng@nuvoton.com>

dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO chip selects

This commit updates the nuvoton,ma35d1-qspi binding to explicitly disallow
the cs-gpios property. The change is made because the current driver only
supports native chip selects, preventing the use of GPIO-based chip selects.

> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.ya=
ml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
> --- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
> @@ -33,6 +33,8 @@ properties:
>      maximum: 2
>      default: 2
> =20
> +  cs-gpios: false
> +

[Severity: Medium]
Does this restriction violate the device tree principle that bindings should
describe hardware rather than software capabilities?

By explicitly disallowing cs-gpios in the properties block based on a curre=
nt
Linux driver limitation, board designers who route a standard GPIO to a SPI
peripheral's chip select pin will be incorrectly prevented from describing
their actual physical board wiring. When running make dtbs_check on a board
device tree that uses cs-gpios for this controller, the schema will reject =
it.

Should the hardware schema allow standard hardware properties like cs-gpios
even if the current software driver lacks support for them?

>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803024048.1641=
756-1-cwweng.linux@gmail.com?part=3D1
