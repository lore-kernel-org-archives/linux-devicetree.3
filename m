Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486FE492519
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193713; cv=none; b=W9dyU0JAO8Yg35IPOs5RbKtsrm9OodZsba9yHK6y4qZ7S40P0wH+4orNfmFcoiT7QscPqAuDaU9Go/iBb2eMNSbQ1xV6YpXsHzLcpHZoJsgYJvW8t5CRavKKMfNj7+m+pmUSNUY+/ZsRcvC0qTN+wcPZxDQz5Z+I2bWELY/Wigw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193713; c=relaxed/simple;
	bh=ny8zBbGNmK8IVEJHpgtkuPZNJMzorH7PV2NgLW1VfJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XHFoJnAWJR5859PRYuG/SAFR+7o0MIBE3OWXSxCaaQVB4AWPo1lgRWhzhicNDM2DcTCIRWFp1zwlnKIsIdorAlqc0SBOD1282iubP126EXRPVD1Yr+lh/ITDZyGJbEHjjGF7goqGR8Q0PkzKoKBJmvGd6qF/R26PScyi2Sry7Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5+/EIw+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5+/EIw+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780DCC2BCB3;
	Tue, 19 May 2026 12:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779193712;
	bh=ny8zBbGNmK8IVEJHpgtkuPZNJMzorH7PV2NgLW1VfJ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=K5+/EIw+rTG/BoxqsGBcdoozHXcciEl9cJCYZevYf/OuHU/okKn6CwmRh5WoXiVHY
	 aHk9xssicbG3ImMYyMc/QsTC25EIr4f7KLCJBbhWS0QV1YeGLYbnMHYGbBBIlVnNOw
	 VBt0LC1pife5ffXw22xTureGMSVNdHP9L9VKpnurpV9tQmaA67J5Kzlz1QaEwIVbpr
	 He1teIFFeH31PO8/5rHeAxQwqbSrEx+GaFYLxThJEmj6gFY+uLi/65yApT1boU5EJ4
	 34/dqrJQ8llJgTV3sIcc50Z2kzz0dpRTpxRaKBrjVlTcs2jDxO4MJ6m//pPU7cAI+1
	 EtS8QOocjaDiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/6] dt-bindings: iio: adc: add AD4691 family
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519-ad4692-multichannel-sar-adc-driver-v12-1-5b335162aa51@analog.com>
References: <20260519-ad4692-multichannel-sar-adc-driver-v12-1-5b335162aa51@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 12:28:32 +0000
Message-Id: <20260519122832.780DCC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding defines GPIO controller capabilities but omits `gpio=
-controller` and `#gpio-cells` from the `required` list.
--

commit 96f168db5f8432c094e1917f0e5c69f84e070941
Author: Radu Sabau <radu.sabau@analog.com>

dt-bindings: iio: adc: add AD4691 family

This commit adds device tree bindings for the Analog Devices AD4691 family
of multichannel SAR ADCs. It describes the hardware connections including
power domains, optional PWM for CNV Burst Mode, reset GPIO, and GP pins
usable as interrupts or GPIOs.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml
> new file mode 100644
> index 0000000000000..af28a0c1cfa9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml
[ ... ]
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  '#trigger-source-cells':
> +    description:
> +      This node can act as a trigger source. The single cell in a consum=
er
> +      reference specifies the GP pin number (0-3) used as the trigger ou=
tput.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - vio-supply

Should gpio-controller and #gpio-cells be added to the required list here?

When a hardware variant provides GPIO controller capabilities, these
properties generally need to appear in the required list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-ad4692-mul=
tichannel-sar-adc-driver-v12-0-5b335162aa51@analog.com?part=3D1
