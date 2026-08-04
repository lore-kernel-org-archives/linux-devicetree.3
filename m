Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E748425E
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863819; cv=none; b=FW5g1Y1fHsKiQAHmrU7DdrkH1QtbUWKr9Z10fMlyNCLOA+Yof5EUlMGvLSpidhVUe69GKdxtfelX7rjyud4HXnkxyb9nFTddIfFT6t/H2HSsTKoWMu2hMK6kiCtpCE2STaJDF4LGJoLItQYNn8t47NyhTXbqf0RLa5NTn0KzrSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863819; c=relaxed/simple;
	bh=JGyEjAu/LRrggGXCynPmuYs9Q6omZhMY/N1xZyTyO/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hxIQEPPVnwkK3m6Dj3Qzm9iBbPw2DUO1l/vwHsLZyqZXUMTxkS6NpsMO4g1KMWYDVr8sL3jQdfB99CrnyDuwR5WHAOFJQlvXqZoA0nw9D6v7gK35NwdxTC8fLd8meqGGVgs0QXdaweEMJR7WXumGZO+jfwhjSiB+OYVqLVGyaEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DedRqE1z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DedRqE1z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AC41F000E9;
	Tue,  4 Aug 2026 17:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785863808;
	bh=+chiHrbdG/MpmnVkz2eadUntYeIYU9+Oi3hmVKOpo+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DedRqE1z9zDmwIzfjOe0XOIf9bOABzBaORB2KBzmKaTEnJSy4AUK3d9BL2rPr2d0s
	 1tGkS1MjFFbvXvdZzkZBvl6dP2ol/Tjb0jHFnZh5n1KADLL41OnjGp3P9TnUpZLS4O
	 Ig3PtDDjoh3npMRDwgR8XzbwzhP2klLxxAKhNBlI+loEQOTsY0YClQjhQKsolwxI0M
	 JOwGy0hZIf21JsRzhGljo6ay9nJT4t1ax3UcX1p0G5yUZP27sY3MuqUebKaJURBrMy
	 UhWleNwXhIJb7O8Ea3rH1n+RfEyaAwW4lwrRes6bJDlBb6275Ms05goT+iWWGBSu68
	 ewyaUfBk5FjFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: iio: light: ltr501: Add ltr329
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804-liteon-ltr329-v3-3-c6b768c7c745@geanix.com>
References: <20260804-liteon-ltr329-v3-0-c6b768c7c745@geanix.com>
 <20260804-liteon-ltr329-v3-3-c6b768c7c745@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 17:16:47 +0000
Message-Id: <20260804171648.47AC41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The DT binding schema does not restrict the `interrupts` propert=
y for the `liteon,ltr329` compatible, allowing invalid configurations to pa=
ss validation.
--

--- Patch [3]: [PATCH v3 3/6] dt-bindings: iio: light: ltr501: Add ltr329 c=
ompatible ---
commit 11927e9d8e871ae421d027fafa731bcca8f1e3c4
Author: Esben Haabendal <esben@geanix.com>

dt-bindings: iio: light: ltr501: Add ltr329 compatible

This commit adds the liteon,ltr329 compatible string for the LTR-329ALS-01
ambient light sensor. It notes that the device is similar to LTR-303ALS-01
but lacks interrupt support.

> diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.ya=
ml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
> index 6234e2eaec2e4..8c9d6cee55b49 100644
> --- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
> +++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - liteon,ltr301
>        - liteon,ltr303
> +      - liteon,ltr329

[Severity: Medium]
Since the commit message notes this device is without interrupt support,
should an allOf/if-then block be added to explicitly set interrupts: false
for the liteon,ltr329 compatible?

Because the interrupts property is globally defined with maxItems: 1 in this
schema, any device tree that incorrectly specifies an interrupt for this
specific device will silently pass schema validation.

>        - liteon,ltr501
>        - liteon,ltr559
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-liteon-ltr=
329-v3-0-c6b768c7c745@geanix.com?part=3D3
