Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0883264E9
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104074; cv=none; b=Y6wmiA6iOkkeVkL60vvtsz6cwrrQTmv8g+8qRzCy1ZWHRHNpy5F/r0nbuVJwBy5LBmmCljEwZWa9Q+Qelbs0O56tDi9qwBvX/JjImGMCW6S/sP8WOUWk+deL6wkU8PZ+Ma5pv1LPJKytstteecCskrhF2x3u9dsRQ6XQTLafaMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104074; c=relaxed/simple;
	bh=1ql5WVO0hOe77m7nvWRwipRN0JhTaLy9HGtuJuBMWwY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZzXCayOex2Nv59/tcQTkSqqGbZyJCWFewKRsVs7xqzUyDTEqsXmoe3UkzZM6jVRPSA/TRAs5HC0W1KmbvEVZtcaMYIwyPSkFUXMKTyPf0I4A/ZDfHHlxl/AXTYXkv3DX9+8ZVbgWnRYPSkyIsC9HazdqVTiO48ezBbVn91jTe0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBfkz+ky; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBfkz+ky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E7A1F000E9;
	Wed, 15 Jul 2026 08:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784104073;
	bh=AWLTCauGSnY7kUpFKLLC6YF2i1NZUDF7adWm9bc6oa0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OBfkz+kyYyaT3e2Yk9Mda4khW2Ebp20GL9d6rXqyc5P78CsDheXMjj+upqltHqKAf
	 fB9RjU6ZraHLfywHmc2Uv6ihyekYMr35vo2hyuLd7DmJ8juOwbqkcARewo8YSgPURN
	 I7fX2T4CdlUl3ZBALMxqM4KVBfkOq0odOg0PvRUTP7EKr/XXMztkUt0QhV/pzwX/lp
	 y6hDvuPDUVM8mlg0KWQ/9eJjT9ZtOn61Xi6RvrQURh4VTweD/kGgZt+c1fe9yK9Ied
	 XmBtG0vo+4+S7szENYU2bGaPcxIhiv0WUeRDS9Mojel3n5LtF0LdI1ethcqFS56zNU
	 q8pbyswICJpNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: iio: light: ltr501: Add ltr329
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-liteon-ltr329-v1-2-31f027051594@geanix.com>
References: <20260715-liteon-ltr329-v1-0-31f027051594@geanix.com>
 <20260715-liteon-ltr329-v1-2-31f027051594@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 08:27:52 +0000
Message-Id: <20260715082753.09E7A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema fails to disallow the `interrupts` property for the `=
liteon,ltr329` compatible string, despite the device explicitly lacking int=
errupt support.
--

--- Patch [2]: [PATCH 2/3] dt-bindings: iio: light: ltr501: Add ltr329 comp=
atible ---
commit 5d6bf65302b94ef38e976c911c22a66db543f0fe
Author: Esben Haabendal <esben@geanix.com>

dt-bindings: iio: light: ltr501: Add ltr329 compatible

LTR-329ALS-01 is an ambient light sensor similar to LTR-303ALS-01, but
without interrupt support.

> diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.ya=
ml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
> index ab9bb68dd7363..76e81eba7ea4a 100644
> --- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
> +++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
> @@ -19,6 +19,7 @@ properties:
>        - liteon,ltr559
>        - liteon,ltr301
>        - liteon,ltr303
> +      - liteon,ltr329
> =20
>    reg:
>      maxItems: 1

[Severity: Medium]
Since the commit message states this sensor operates without interrupt supp=
ort,
should the schema disallow the interrupts property for this compatible stri=
ng?

Adding the compatible string directly to the main enum allows a device tree=
 to
specify an interrupt for liteon,ltr329 without being caught during schema
validation.

Would it make sense to add an if/then conditional block to restrict the
interrupts property when the compatible string is liteon,ltr329 to prevent
this regression?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-liteon-ltr=
329-v1-0-31f027051594@geanix.com?part=3D2
