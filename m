Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2429318ED2
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 07:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320360; cv=none; b=DS0nX4kr8a5RgnrAtAS8r9Gk/S5p6PZVJKI9mNCH48RrIZwkyL+pDTQpcxXxGv40b+XPo1OmZDFxvMpi0ERe9kTUAM7AggD8kKxFhzQOWl2OMnHKy367C8q3V241DnrklSEp5Qql6aeid7x4GK454bl0ziu+a1GFhepHnNWW0j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320360; c=relaxed/simple;
	bh=dtMnr6SqZ8CcaHzyXITCnrfOx8JaxWbZKOziS0K55Gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uEdj7hjL7SeYUeIgLY1p6oAwpAl+wL16etsJmCsBMnollGD9/WUI4IU2kNhkPvSa6OcaufPENevRzLmnYWqF8u76W6wKs043FuM6nGzyR/Bt/QGJVISvGKb05e0H0mwf9MCL7W8XJfSlvF0ybkNXG5wpC4n0shqiiIm5vWYIJwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADPMwDDG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADPMwDDG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DF11F000FF;
	Fri, 25 Sep 2026 07:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790320359;
	bh=NVNtdfaFuhQM5ZtGJkq2qCGOSaGMPFe6Csf0NwoMr4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ADPMwDDGlI1Ole2f5pmjuNSwhTO5ZOFXTT6tUkRNc9DzHzjfqVfOd/pN9jJV8jn3i
	 qT2fNuyssbqufUBk/mMFQd+CsvQt0etIzKlLqj1TMmW+97tQfmBZtTSQzJBNvDgU9M
	 LAckJm9k4e1zXG6swQB/xV8cN2MMl2txkYae4KRNd0zHfDsM5yUFWwEszb5tK/IuvZ
	 AJOHkHilUkr5lM4JjLSL6QkXTUPxlXuawQmY42x7NMl9f8F8QuxCcB+PnHEDDXhMrX
	 4xWCMBgfqY9A5kREODTP7NHq4GtyooMt4hn6bZ4Sy73eEwLZMXl9lC/ns5NMtEtWGn
	 kiwkZO+Xl02EA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: visionox,vtdr6130: Add
 Retroid Pocket 6 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260925-rp6-panel-v2-1-19c425e523de@gmail.com>
References: <20260925-rp6-panel-v2-0-19c425e523de@gmail.com>
 <20260925-rp6-panel-v2-1-19c425e523de@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 07:12:38 +0000
Message-Id: <20260925071239.09DF11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: vdd-supply validation dropped for visionox,vtdr6130
--

commit a3a48cee05612d79cd6eb27b26e83813b38aff64
Author: Aaron Kling <webgeek1234@gmail.com>

dt-bindings: display: visionox,vtdr6130: Add Retroid Pocket 6 panel

The vtdr6130 is a display driver integrated circuit, a common chip used
for various panels. One such panel is used in the Retroid Pocket 6.

> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtd=
r6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6=
130.yaml
> index c99f4146f1bb0..682f30dc9ee43 100644
> --- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.y=
aml
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.y=
aml

[ ... ]

> @@ -25,13 +29,13 @@ properties:
>    vdd-supply: true
>    port: true
>    reset-gpios: true
> +  rotation: true
> =20
>  required:
>    - compatible
>    - reg
>    - vddio-supply
>    - vci-supply
> -  - vdd-supply

[Severity: Medium]
By dropping vdd-supply globally from the required list, does this cause
incomplete schema validation for the original visionox,vtdr6130 hardware?

Device trees using compatible =3D "visionox,vtdr6130" might now erroneously
omit the previously required vdd-supply property and silently pass schema
validation.

Should this be solved using an allOf and if-then block to conditionally
require vdd-supply only for the original hardware?

>    - reset-gpios
>    - port
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-rp6-panel-=
v2-0-19c425e523de@gmail.com?part=3D1
