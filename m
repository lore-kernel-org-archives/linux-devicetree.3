Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BB01D63E4
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415757; cv=none; b=KmisjX6+W01K5bhA1YVpQJjGnQ3u9MRPJuH2/lOfWZhU1Wd7I1vzqPolajrhAajjimX+TKfmM4YHvGnKDVt5GXqaCpXEIXTIFS/iTXZa6o1KFaUkSZc1YfXoKYwt1klNGvm1inuYm+tNBMvBNojQxZ/lOFWsHOiiNeN7ftTTQS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415757; c=relaxed/simple;
	bh=+4nEaVKXQQ4ftsR6/2SxPrPllmBFFydYmaAne/DZM8Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FvuYQJlRYZx11nvNetED2PX+F8syxD/Ka4Au4N4eTuiuP5Xl5rAakK7do+DzHT55n/JaOWs8hy0CLnr08cMUhbpvqJFJnpGeV+S7kpvRjF/CSCQu7APF9G7bQHq2gQGWth/BkSCkns5c2xSGujkEEWr33oTzuKSeMRbHdJwynP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOl21z9e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOl21z9e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A0D1F000E9;
	Tue,  7 Jul 2026 09:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783415756;
	bh=t6WaWqubdX3oa5pER078oejVxBfQJ4MHKzO+/K0kHDg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LOl21z9eLnhI6eUj/POH2WAwQcY9p6HMaW6/5K8G44mtyKt1SuvaBATwDFd2XsSZ0
	 CkqHXIU0OViI9kspbHUY1FbB18zF/XWp/OD5NhiZy9kPiHmkT2Bk1sgbYxY9DJbf71
	 o1L5yEq95qVam+b4wCbGkSVSgdp24ELZV6G5Ip1lRw3H4BAq/X2OOCL0YAQOALgpqe
	 963/AAWrtww8xRJyeE7simzpJp8g5B1GJCyX+GKqqkYvSw1cqi95P7Gd+ukdQ6cTPC
	 U7T8/9SSD4mIh+spZvZ0azt/E4374S5+AP/rdV5+GWUaIIcu6gDxzT2KFEjcEAMn1L
	 y11lvd8BBkwrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: rockchip: Add Alientek
 DLRV1126
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yanan He" <grumpycat921013@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-2-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
 <20260706-rv1126-alientek-dlrv1126-v2-2-ff3176ca362b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 09:15:55 +0000
Message-Id: <20260707091556.57A0D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new board entry is not sorted alphabetically within `rockchip.y=
aml`.
--

commit e33fe7223e96705f47efcf1b94f1097936d189f9
Author: Yanan He <grumpycat921013@gmail.com>

dt-bindings: arm: rockchip: Add Alientek DLRV1126

This commit adds device tree binding documentation for the Alientek DLRV112=
6=20
carrier board and CLRV1126F core module, based on the Rockchip RV1126 SoC.

> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index 1a9dde18626d0..9058f2a461d57 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -162,6 +162,13 @@ properties:
>            - const: coolpi,pi-4b
>            - const: rockchip,rk3588s
> =20
> +      - description: Alientek CLRV1126F SoM based boards

[Severity: Low]
This isn't a bug, but should this entry be sorted alphabetically? The list
appears to be maintained in alphabetical order by description, and "Aliente=
k"
is being inserted here between "Cool Pi" and "Edgeble".

> +        items:
> +          - enum:
> +              - alientek,dlrv1126
> +          - const: alientek,clrv1126f
> +          - const: rockchip,rv1126
> +
>        - description: Edgeble Neural Compute Module 2(Neu2) SoM based boa=
rds
>          items:
>            - const: edgeble,neural-compute-module-2-io   # Edgeble Neural=
 Compute Module 2 IO Board

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-rv1126-ali=
entek-dlrv1126-v2-0-ff3176ca362b@gmail.com?part=3D2
