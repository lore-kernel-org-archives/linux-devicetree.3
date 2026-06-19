Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76B42F851
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 00:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781829934; cv=none; b=bxo6YMor4ZEhJ0UluaOaVJwvq6Ycwr0IBeWHbAcIg4QouJu5hFJkUpU5MoyQTDOrmxKPajaHWP6qG38972Y9gk7KwL5YS8D8MrCj+aZD3PKBLZYNj38uaRR4Zg4uWv81zeFC5sXkh+Z4fS0rQjPCIveq7IiWajEAsfyULeguE98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781829934; c=relaxed/simple;
	bh=JjxKqZiibVqZTryWYilDOKYN4k5f+LWh3bSVktb4jMk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=js3TplWTrawlud0GaXBOihPw/9Eoyze3oVurDOWO/4sKIiDow3IyZechg1d7AGGsTbnO7QVZLo8AQCo/TZhQ2bNqbO/uEjx6b3aZb1qCJaqcfkvqKjHmBtbsSpDQfc30CbW9jqb6XteCCTQXaZvMVC2/Fpx2pzs33bIlOlhiIek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKBmqvJq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKBmqvJq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203551F000E9;
	Fri, 19 Jun 2026 00:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781829933;
	bh=gUFLC5qbzE/IzVRZHEWIV+GH6lh6wGOV4UDPuFB1CTg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MKBmqvJqDpSdrdt4tJTJzHO1vDBpNg2M0T247GkrDn/qmlNzdTLotC8rpksvKgFyw
	 Hnd4YFgjSLwbVm/qL5KOYm6CZC4QmZ25HLh/2qQVYGLmptFPdxATfPDU2oby4m5HT4
	 VkmPtpkBTw9TPPbv2R4pbuCvVScU2njYBowEbVh1/jKdDYZHItlxQvfJFWgqIp8YUd
	 uQnEBhWoR+7etKglFPEVt/FZAcIpCvQpUgWp1AHw1hgYmJKAlzWX8/id+0nD85WuIj
	 4VbAbVj3Be9Pkk34w+Xq6vZN0r2XO4RBde+lKr+wtNdU9WPNC2U3GhUkubCO96fMu/
	 RSkTneNQbpL/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/3] dt-bindings: iio: adc: Add burn-out current
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-new-channel-props-v1-3-963c1b5cf40a@gmail.com>
References: <20260618-new-channel-props-v1-0-963c1b5cf40a@gmail.com>
 <20260618-new-channel-props-v1-3-963c1b5cf40a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 00:45:32 +0000
Message-Id: <20260619004533.203551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `burn-out-current-microamp` property lacks array bounds (e.g=
., `maxItems`), allowing unbounded arrays to silently pass schema validatio=
n.
- [Low] The description for `burn-out-current-polarity` is incorrectly copy=
-pasted from `burn-out-current-microamp` and fails to describe the polarity=
 property itself.
--

commit a77887c22cdfb0d199c09b61e65157768374c14a
Author: Kurt Borja <kuurtb@gmail.com>

dt-bindings: iio: adc: Add burn-out current properties

This commit adds the burn-out-current-microamp and burn-out-current-polarity
properties to the generic IIO ADC bindings to allow configuration of burn-o=
ut
current sources.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documen=
tation/devicetree/bindings/iio/adc/adc.yaml
> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> @@ -106,6 +106,20 @@ properties:
>        This array describes the current configuration of the excitation c=
urrent
>        sources or the single matched current for all sources.
> =20
> +  burn-out-current-microamp:
> +    description:
> +      Burn-out current sources provide current to the channel's input pi=
ns for
> +      open-circuit or short-circuit detection.

[Severity: Medium]
Since standard device tree schema tools automatically map properties ending=
 in
"-microamp" to an array structure, does this property need an array bound l=
ike
maxItems? Without bounds, the schema validator might incorrectly accept an
array of arbitrary size instead of enforcing a single configuration value p=
er
channel.

> +
> +  burn-out-current-polarity:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Burn-out current sources provide current to the channel's input pi=
ns for
> +      open-circuit or short-circuit detection.

[Severity: Low]
This isn't a bug, but it looks like this description was copy-pasted from
burn-out-current-microamp. Could the description be updated to explain what
the polarity configuration (pull-up/pull-down) actually does?

> +    enum:
> +      - pull-up
> +      - pull-down

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-new-channe=
l-props-v1-0-963c1b5cf40a@gmail.com?part=3D3
