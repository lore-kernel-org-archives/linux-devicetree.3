Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0464582DE
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326775; cv=none; b=E5EtiJDPee2H9yJg3XcxFpQauv4RT7E9ngQt2Fn2zmkklXW7TTxn/8naO5WZTdlZarKTl3rSbwpPAo+Pjx8SCJwqM1kmTr0NMmabtLJ4TMnAiqh+n5/z6o+S7vrZC1x70V+GCUqU9mMmTNz+X+zRS68exnyUGVkmezusgTquDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326775; c=relaxed/simple;
	bh=XaU/sKgH4dbno4MAzXu/NnGyRsuXxrohTi6PE0VHIf0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rL+wM1/2mlW6yLLMPKMebf8in1BxM+oqBxc8gIHRvKVH53yIBCQH1SLp5Sfv07fYvwoc5GYQmKFuVkG3hwLYEWsyp/9FbX5w2K9BqTOynztLLkR4Xn76xpTHSw8tg7IrdNS5Q93HjQZtOAsnf3QSLJ5kCBgesCtZN98BgsbOvag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbDoyoC6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbDoyoC6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3A81F000E9;
	Wed, 29 Jul 2026 12:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785326774;
	bh=QOmWAsiHKfgwl6g/3aUPb7xQSJCMASD1J3HzrZINTvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LbDoyoC6Zi8Dlz0lYJQJeZEhKoO6/RNrxWYensssniGv/4Zj/rRgb3LS8kTDNYHSP
	 fU/EQ8MBqmgeyXKO2qXYZWi1OXnXx1PeX/dHs1jN7zXpMSIyEIDRh4TUCyiqzLLMip
	 lBR4P7sEutnp+USfwGE63mJdL0DIDR1hhjOH0xT2jk4blNeo0LJsVe95CEUZDHm25F
	 0Uc1rNkxcI8J+IkPG724QPglY3FL5JVJZNHj66CIFdfp0iGacXjg41bnzLYL+hlxMX
	 gLoIk31CdBJL7QxJYLzdW26EOcYUDiQ9DIaDbTO34rLV8kRkLfINKt5Ja7e7AF6lAU
	 cNaWr3cdzC5xA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: si544: add si549 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGF2ZWwgTMO2Ymw=?= <pavel@loebl.cz>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729115310.3490589-2-pavel@loebl.cz>
References: <20260729115310.3490589-1-pavel@loebl.cz>
 <20260729115310.3490589-2-pavel@loebl.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 12:06:13 +0000
Message-Id: <20260729120613.8B3A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The updated datasheet URL for the si544 datasheet contains a capita=
lization typo in the path (`SkyWorks` instead of `Skyworks`), which could r=
esult in a 404 Not Found error on case-sensitive web servers.
- [Low] The binding description text was not updated to mention the new Si5=
49 devices, leaving it inconsistent with the updated title and compatible s=
tring list.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: clock: si544: add si549 compatib=
le ---
commit 529dcd41cafc82a36f39e95eb442dbe9230735cf
Author: Pavel L=C3=B6bl <pavel@loebl.cz>

dt-bindings: clock: si544: add si549 compatible

This commit adds the Si549 compatible strings to the si544 clock generator
binding. It also updates the datasheet links to point to Skyworks Solutions
after their acquisition of Silicon Labs.

> diff --git a/Documentation/devicetree/bindings/clock/silabs,si544.yaml b/=
Documentation/devicetree/bindings/clock/silabs,si544.yaml
> index f87e718671080..c58171f1bc5be 100644
> --- a/Documentation/devicetree/bindings/clock/silabs,si544.yaml
> +++ b/Documentation/devicetree/bindings/clock/silabs,si544.yaml

[ ... ]

> @@ -13,8 +13,9 @@ description: >
>    Silicon Labs 514/544 programmable I2C clock generator. Details about t=
he device
>    can be found in the datasheet:

[Severity: Low]
Should the description block also be updated to mention the 549 series? The
title and compatible properties were updated to include 549, but this text
remains limited to 514/544.

> -    https://www.silabs.com/Support%20Documents/TechnicalDocs/si514.pdf
> -    https://www.silabs.com/documents/public/data-sheets/si544-datasheet.=
pdf
> +    https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/dat=
a-sheets/Si514.pdf
> +    https://www.skyworksinc.com/-/media/SkyWorks/SL/documents/public/dat=
a-sheets/si544-datasheet.pdf

[Severity: Low]
Is the capitalization in this URL path correct? The other updated links use
"Skyworks" in the path, but this one uses "SkyWorks". This might result in a
broken link if the web server relies on strict case-sensitivity.

> +    https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/dat=
a-sheets/si549-datasheet.pdf
> =20
>  properties:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729115310.3490=
589-1-pavel@loebl.cz?part=3D1
