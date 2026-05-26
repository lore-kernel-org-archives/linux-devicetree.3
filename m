Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E413911B2
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779775893; cv=none; b=CxPqDkIk4SDPVM/fcsjzLqJQy/KvuNI6dz4aRc2CFRMQwvn9sg1hhcD6Mb6SogzUXVOEYBjSUvJkRr5HFFoF0brr87E7Dn7j464wyNke4wnY4ztOWft6UhXlOyXIR7PHv3EDM51fmAilYZc1ma4mLr2eEg5cxruXUc0+gBucOJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779775893; c=relaxed/simple;
	bh=HPTNh2JsI3zd6OpyoupkQWcO34EK6TsuF/dTUY9zbAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LDXJdeYOwtWwQK6trvMXisvotbDrYFokwzbLFmePAipLojKh/iu0zsym5Ii0kvkJXMFiaMfTKQQvj3k5IIErupFqXRHv7ID7B+KUIQzlpwRn+Gmp7KDuZThOFw5d7/e5+7OhVwJ00g8debT8SVnihKe/bawmEyhyXtHIdu3NOSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOrOpuYY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOrOpuYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824601F000E9;
	Tue, 26 May 2026 06:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779775891;
	bh=1qkJcyEPo0nhCH1WaYPq7XY99EgzVhZ9EEckJcYOJe4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GOrOpuYYwDLf7D6O36KQNUGF0mc4FXD/N3vkf/ER/rlP/DiHFtLepdJdFPSH/AqOo
	 lKl9mSK/WuCYV/U6kNx5mdu4KlqfjXRn+ctEITUsq7RCoFZ5gFyV9DkrD7OSQgqC/L
	 2SQ5LOrNkhw1WoeBS8IdGyTjNkLjEvGvWWcXUqfrB4xW60z2dpj5Mp/ESJqKyed5q+
	 gPBDg2yeeD5TeiyuE3YWAONc3RQSc5+/pVsftdcIqGXkAg7SmSGserPoNb6gci4485
	 dE1mgy2Vs9xi+2Nefw/UO8GwEnHkp9BYl0ivZRNa72II0L8FjbYqUQAi6DYlCgQrZc
	 xWRWLtLuMXNSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 RESEND 4/5] dt-bindings: arm: qcom: Document SA8797P
 Ride board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260526051300.1669201-5-shengchao.guo@oss.qualcomm.com>
References: <20260526051300.1669201-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 06:11:31 +0000
Message-Id: <20260526061131.824601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible block for the SA8797P Ride board is inserted out of =
alphabetical order, breaking the established grouping of SoC families.
--

commit 4ab172bb1d1115af0854e9ac9febc931197a537f
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: arm: qcom: Document SA8797P Ride board

This commit documents the SA8797P Ride automotive-grade development
board, which is built on the SA8797P SoC (Nord series). It adds the
compatible string for the board with fallbacks to the SoC and series
compatibles.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index 50cc18a6ec5ed..b10383ddb8991 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -303,6 +303,12 @@ properties:
>                - xiaomi,sagit
>            - const: qcom,msm8998
> =20
> +      - items:
> +          - enum:
> +              - qcom,sa8797p-ride
> +          - const: qcom,sa8797p
> +          - const: qcom,nord
> +

[Severity: Low]
Does this compatible block belong further down in the file? This isn't a
bug, but the compatibles under properties are generally grouped and
sorted alphanumerically. Placing this sa prefix block after msm8998 and
before the following entries breaks the alphabetical order of the SoC
families.

>        - items:
>            - enum:
>                - 8dev,jalapeno

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526051300.1669=
201-1-shengchao.guo@oss.qualcomm.com?part=3D4
