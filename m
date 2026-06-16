Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C153CC310
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781598792; cv=none; b=TqYfBC/I+fd3lEMCWorLWCdeNZwRnkvJW3f1gbi0J8Q99v7kHmeQLXF33KxWf9avZu9Bd/5CR8sLYEqZ6X3sBPdyUPa8WoRD4rBtIpdqw5e9okvyAAY7UToiccbVIZ6UEysIEDcXPyyjnLuS2ahXwKMkKXSu6Aj3UJIk9HRxX5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781598792; c=relaxed/simple;
	bh=M97Tz707eToHhH+ZrIUN8w+3ie0jgrgEvk6GX+oA+uE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lLM3wZArArrGCx4Of6V4gfpP7U1p3EXVqoFoQBL0JCsMPkRcEc1MPKXsNDzW7CXa52SJKQu1b1PjO43UiB9yj5SOGqlUsc8Bn1Fesu3uWU2EgUyX0NaHrLj+8wuu9zGWfTCcLTZDa0uyc6croeavZkH+R7qyJBuwmq8YLkdeql4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQdiqZHR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQdiqZHR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BBA1F000E9;
	Tue, 16 Jun 2026 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781598791;
	bh=KgXtqJqX/GuaR8//qJPvF12+WJuDBbytWIPZ46OIzQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iQdiqZHRBIkCQzTVOBK+PPD9q79MAgsw2WXVxxfUnlu3C2qNK4yYd2bMQ2jV6DVzx
	 mtb4qAljeJ3pKnuJnXpD+gKze6fzeiKQgEFjK6w86aMprc1qL1XOmltbxBlUatWmPk
	 E9EgnY1Zn/oPWT+sHi1NfjeAC1IN7QHWGGf7jwDbjIEu5do9c4pJLHVNJNDwIuKRPn
	 j4jVyszE2Mq35eMeQiL0SxNuZLIOUXMuYD95oxVzQ5hIrTSz0xYXaLjg0vlcZIW/BH
	 SPQv+6vjEYlG4ej/Pu1RFqCAnc4prSPOF/9rbokhu59PSEQdNBXFX/rIrf20qv86Ex
	 KCQrg53zh4ZdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/12] dt-bindings: iio: dac: ad5686: rework on power
 supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616-ad5686-new-features-v3-4-f829fb7e9262@analog.com>
References: <20260616-ad5686-new-features-v3-4-f829fb7e9262@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 08:33:10 +0000
Message-Id: <20260616083310.C0BBA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Making new power supply properties strictly required breaks backwa=
rd compatibility for existing devicetrees.
--

commit 37c22112eb8071cacd8ef295c9d3096b1ae584af
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

dt-bindings: iio: dac: ad5686: rework on power supplies

This commit introduces vdd-supply, vlogic-supply, and vref-supply properties
to the ad5686 binding while deprecating the misleading vcc-supply property.=
=20
The new power supply properties are added to the required lists to better
reflect the physical hardware requirements.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml
> index 7567de0ead4a3..bdc6bc425b489 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml

[ ... ]

> @@ -60,9 +74,23 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - vdd-supply
> +  - vlogic-supply

[Severity: High]
Does making these new properties unconditionally required break backward=20
compatibility for existing device trees? Older device trees that were valid=
=20
under the previous schema will now fail dtbs_check because they lack=20
vdd-supply and vlogic-supply.

>  allOf:
>    - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:
> +              - const: adi,ad5676
> +              - const: adi,ad5683
> +              - const: adi,ad5684
> +              - const: adi,ad5686
> +    then:
> +      required:
> +        - vref-supply

[Severity: High]
Will this strict requirement cause older device trees that rely on the now=
=20
deprecated vcc-supply to fail validation? Is there a way to allow either=20
vref-supply or the deprecated vcc-supply in an anyOf block so older dtb=20
files still pass validation while enforcing the requirement moving forward?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-ad5686-new=
-features-v3-0-f829fb7e9262@analog.com?part=3D4
