Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5F243E083
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776908; cv=none; b=fYTnMAPdB9OfwDDap2Dl12uQcdzOW7T6BviVrjS9lds9xbrO2JtLOn8akok7SNAayLGxGUSSptr4XYdZGHa53I/6jOXcmcajkIqmFM7ZQFl/ENUf79TZooWFiQSsDruZaFjBIQAEVfkJV4GYxWBMhnCAB9rBkqnZVm84SAmdEvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776908; c=relaxed/simple;
	bh=6u6WapY8DYVMCBr/OO5EMOEpTbfW8LuCUoE5thaWqpg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fJWzPPsHtuiXJI5x8dfhrTc3dG615nuqVLNzgdh8mFUFLXKvwdlTtEk5HxzH7lJ832bYVO3mhF58LYWWtgUeKIo/ilq3lyZhTV2L9YZUoLloMJQC1KFj0nAfRJIuybzq/Ei6PQ25CfgGQg68LqiEUjYOvC1yEeLWWCrxbIHCuwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mj2OtAxN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mj2OtAxN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AA31F00A3A;
	Mon,  7 Sep 2026 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788776907;
	bh=GfU7PJYa+Y3hprFWuPqBEpmdEYZpJve1cP3249FH70w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mj2OtAxN49tYxtVzXt40S1sZck1WFGf/0W+4YXXkWHY2xfG4J+89x0Duj/B1tXRVT
	 OuvjxNbSCRXyUHjnTMLvP0CPcPxzLE/mv1xPWuORp9EEvr1/R2OBHU9PGOptxOOQml
	 2oQaasuWnbVi4g7Me0ez+TAlp1WPPVx3hmFVkiLgjEOqCxBd7Y3QbsrZkRtgPvn7FE
	 Uwh3IMBCAIdqaVXD3oCf6FCbKIV9j9WJlr2V58gpvf2/kJDMI3AVd0vY+FlvTpvNxE
	 phSZ18gWRzto9Ldfto8nxsTSu8QjOiJAT+A23scEz2/A7U4A+uqdeRM2o62FkzYOzs
	 Pz6fqV2pTy0SQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: ad4080: add AD4885 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoniu Miclaus" <antoniu.miclaus@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907101944.9748-2-antoniu.miclaus@analog.com>
References: <20260907101944.9748-1-antoniu.miclaus@analog.com>
 <20260907101944.9748-2-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:28:26 +0000
Message-Id: <20260907102827.02AA31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema fails to enforce the presence of the `io-backends` pr=
operty, despite the commit message explicitly stating it is required.
--

commit 9fc058b2c408d54ffde599d33ff5e645acdf0ad1
Author: Antoniu Miclaus <antoniu.miclaus@analog.com>

dt-bindings: iio: adc: ad4080: add AD4885 support

Add AD4885 compatible string to the AD4080 devicetree binding. The AD4885
is a dual-channel variant that requires two SPI chip selects and two
io-backends for its independent ADC channels.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4080.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad4080.yaml
> index db8467b98e67d..07ac4e07f415a 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4080.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4080.yaml

[ ... ]

> @@ -105,6 +106,7 @@ allOf:
>                - adi,ad4880
>                - adi,ad4883
>                - adi,ad4884
> +              - adi,ad4885
>      then:
>        properties:
>          reg:

[Severity: Medium]
The commit message states that the AD4885 "requires two SPI chip selects and
two io-backends for its independent ADC channels."

While this conditional block applies constraints to the newly added adi,ad4=
885
variant, it does not enforce the presence of the io-backends property:

    then:
      properties:
        reg:
          minItems: 2
        io-backends:
          minItems: 2

Should a required directive be added to this block to enforce the presence =
of
the io-backends property as claimed in the commit message?

    then:
      properties:
        ...
      required:
        - io-backends

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907101944.9748=
-1-antoniu.miclaus@analog.com?part=3D1
