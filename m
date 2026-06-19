Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA6919CD1B
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 00:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781829620; cv=none; b=WwV2KD6k+qkz6aBeMgVW61H7QGinuZSb8/89PqPSVV39diz6BYsQwAjxI9cfiTRQ6rcwbs81DlmxQ+skOoOTCLUg6/wfpcNcZ7copIwrjZPDSai2HziJevnOg4zNxGpOD4JWFU8KWe1hc8JqpwI1sPplOsugPpPYhG+WLNITqaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781829620; c=relaxed/simple;
	bh=oUSKu+VR6OOsO+nUZZv2A9b3vlMaWFiW953EiUWDkek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZMQV4n63/ZsTGuMHSTlY+pJl+dNgf1DAWl5rvQzDmyETw5siDgEww/8TPjcb4zaVgb9Xw1U/MRG4ANTWKp0NVMxPQ4WDwP+mHHnCvJS097WOqfmaiNOFrvq+e8DaFCjxfqmJSAKJDK7xPicOQdHSkZ+FVIqtn8xz/eMdISTwe9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNTldLuM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNTldLuM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC6E1F000E9;
	Fri, 19 Jun 2026 00:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781829618;
	bh=DqJgno/rSqL1QOCP+2F+9dsRIZQOcTGdtJrTTzNUZHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SNTldLuM961tx1h47Co1NOtz9Np5OxPZiFk4ZgNivnsJnhDWp1wMyqsEZlcREu4qx
	 yj1V48qxhipJjuqBjOC2aoNzH/eKKO0Jqmg9N30iyNtdgSeY+CuWakyf0/rW3CARcr
	 TsJPL31Br14klpdRE2eTm6y23LZytbPR0ouDeA+8+2//sbmVrA0pG3KFV7b3EFHXek
	 CVEcmBwqslnkwRHDvIRjasV/TgJ0XfBJw3m4Dq92Cf612UXwrCYa1eyKXriV4yq6zg
	 QXLvDvCvWXE56Cj/sWrd1Q7v5eGU4TdPpfYZJpkk9MLQhzGo8DNnvVt0ZuX+pILbrM
	 mdjS90WR96gAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: iio: adc: Add reference-source
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-new-channel-props-v1-1-963c1b5cf40a@gmail.com>
References: <20260618-new-channel-props-v1-0-963c1b5cf40a@gmail.com>
 <20260618-new-channel-props-v1-1-963c1b5cf40a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 00:40:18 +0000
Message-Id: <20260619004018.9EC6E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `reference-source` property lacks specification for the orde=
r of positive and negative reference sources when two items are provided.
--

commit 5840bfcda5df91dc955f660547ba3a189d50489a
Author: Kurt Borja <kuurtb@gmail.com>

dt-bindings: iio: adc: Add reference-source property

This commit adds a new reference-source property to the IIO ADC bindings=20
to allow configuring the voltage reference source or sources for each chann=
el.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documen=
tation/devicetree/bindings/iio/adc/adc.yaml
> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> @@ -73,6 +73,16 @@ properties:
>        device design and can interact with other characteristics such as
>        settling time.
> =20
> +  reference-source:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 2
> +    minItems: 1
> +    description:
> +      Indicates the voltage reference source or sources for this channel.
> +
> +      This array describes either a single reference source or a positiv=
e and
> +      negative reference sources.

[Severity: Medium]
When two items are provided, how do we know which index corresponds to the
positive source and which to the negative source?

Without defining the order explicitly (for example, whether the first value
is positive and the second is negative), could this ambiguity lead to
inconsistent interpretations across different drivers and device trees?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-new-channe=
l-props-v1-0-963c1b5cf40a@gmail.com?part=3D1
