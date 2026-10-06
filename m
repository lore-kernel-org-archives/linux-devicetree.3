Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50A74A2A5F
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 18:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311270; cv=none; b=brEi0DmctWD19ew/Nf5RSCaLKPwhqid9wk5++u47QqTUTu6MJnW8izu6wLgG8e741sE3fqoRt+VVWilYuAUUJWW0uMGQ2GbBlTwaLAdJy2o7dbvbclvXuZzwBtYhakNe6DDP5MiBtN9dkL//FMGXM1YwAFtH2Vw7v/OeMg7TdzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311270; c=relaxed/simple;
	bh=e6LnMR58GdSI0hWJt4IpXBvlBoCy7uWkSgXg04VcA1A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QReHjecHAYkXXuaQnxJApcgFVvwSTpxTu8MTMQMHBkXPcZwolmu/lYMzNMijoAis9bOx5XKTrGtpuTsGsq5jWsGpvAYHANzE0SrA43XHDnSgykmzTJNmMswX/2PYvosEmE05sJdZB2XKOQcGmR+kCYE8RihPDbpVjqJnJgZCA/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWI10ket; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWI10ket"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1191F0089B;
	Tue,  6 Oct 2026 18:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791311268;
	bh=yh0z6X++xNWZzERo84PZU7z6qaIoG2ns6zChdpzWCjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hWI10ketAVWDtlJWhKN5pIAL3yv6YtnsinfP0UJ96EbsxaYMdhxfIU8V2AxMRKajB
	 OP4tFiIN7oCuzzDvndxdtu1SvPN/Z6RamR2OMMxZ/I0p+pGn0EE2HXuRK0wJ1LojBs
	 3RgYiYWFY+QF8TragxnXd6ZSld4fRJ/8mzoEzatT3OkItnsXI4nnWTpugwaZfRBZPw
	 Ajyv3Ebv5xp+8HHv2W5MoiU8BercAWrtfxkcy+3HRgQRpwHUS90GfImckppP0OBGGQ
	 Zk1ADO68358ukMI23+sVDMuskaHnGRsfHJ5xgn3yvyJJPWOcEvu3KYt0t0PlmEz6ZI
	 GPxDz7TaQUZ/g==
Message-ID: <sashiko-outbox-162341@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/13] dt-bindings: iio: adc: adi,ad4134: Document
 PWM usage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <d7b7074d048a1ced9d37178a529051ec0e1f0cb4.1791309733.git.marcelo.schmitt@analog.com>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <d7b7074d048a1ced9d37178a529051ec0e1f0cb4.1791309733.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 18:27:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing mutual exclusivity between pwms and odr-gpios
--

commit c1bcb33be57f5c8d53016ee21cdb73103ab97ef3
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

dt-bindings: iio: adc: adi,ad4134: Document PWM usage

This patch updates the AD4134 binding schema to document the use of a PWM
signal connected to the ODR pin for faster output data rates. It adds the
pwms property to the device tree bindings.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> index c70b9113cd677..6a190b7a93114 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> @@ -104,6 +104,10 @@ properties:
>        GPIO connected to ODR pin. Used to sample ADC data in minimum I/O =
mode.
>      maxItems: 1
> =20
> +  pwms:
> +    description: PWM signal connected to the ODR pin.
> +    maxItems: 1

[Severity: Low]
Does the schema allow specifying both pwms and odr-gpios simultaneously?

Since both properties describe a physical connection driving the exact
same ODR pin on the AD4134, specifying both in a device tree could result
in an invalid hardware state.

Should a oneOf or not constraint be added to the schema to enforce mutual
exclusivity between pwms and odr-gpios?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791309733.gi=
t.marcelo.schmitt@analog.com?part=3D11
