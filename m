Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF6F4A1E02
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 19:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289250; cv=none; b=ohFKniUu+fwtFNm9JjayVEX8rz5Ia4tnVvojHb90ne7uhU1bZ4tm2Wkb815WwfHpVWaKUQvTinQ0AF84YSpM1w60eI1LvqjlGK1+25jemM+AcOqCJwTl0fVwdkuGpp7u+3F5q3DfqNLwOy/GnkbC92rfNr1krfwALA/5DCpRFWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289250; c=relaxed/simple;
	bh=VR7f1ItDMVNwJvH6wm/MVF3Vx4STOuLySyNh0aNLhYo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jgN2gEQPD4mVCPU4+BQUfN38JgHoQ2Egp1UxQVjn6LHMRn0T3RrJvuZ1h3MU03rrDlxJnPpbRAzeSpIGAKjr5u1ZheGL4CZktWQPHHKLTCLyrr6LYUHWwyLJUetiUYCnqEpji4siOLsJWhu5TGcYuIBkDKDg1yf6XhsOkeg9hHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4WQM/89; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4WQM/89"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F16F1F000E9;
	Tue,  1 Sep 2026 19:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788289238;
	bh=r4vtrx1R7Pto06glO74fl+AhMc4ulgpBkMpdcvchfmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L4WQM/89VhP2xmHl6TAMmhJDDW2dZzjVNI0dYc2kisHqOqnV28NU7ocP3P3IM4a4F
	 kxEBWhVn8N92SvIacLdIQRNvAzPugquxUWvu2+Xm0KFeVJAt25d2JWyswmET3B5qtF
	 aCSWyxAHYl6WgEhz+OI+5lRN6jYb29SInV6KFq8KH0CMoxodfpJAbo7EsPhUl6scGb
	 e9LnpvC2r21x277sUcDdwT53rziyIwZ+7rxVtSYM/T6pCf9SxahYLiVroB9o69guT0
	 2himM5YrCtLAam6IYPZ8quM+ecp5xYXF2+h6DzhWxqzMfHwxNI0s8HZ81pgskrbcGe
	 oYA73JuTYGRgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/9] dt-bindings: mmc: add Cadence SD6HC binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260901184828.15653-2-tanmay.kathpalia@altera.com>
References: <20260901184828.15653-1-tanmay.kathpalia@altera.com>
 <20260901184828.15653-2-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:00:37 +0000
Message-Id: <20260901190038.1F16F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Custom properties ending in `-ps` silently fail to enforce `minimum=
` and `maximum` bounds due to implicit array typing by dt-schema.
--

commit 26eb3b1bd7c793df986336bb3146ad20c9cf5ca6
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

dt-bindings: mmc: add Cadence SD6HC binding

This commit introduces the device tree binding for the Cadence SD6HC=20
SD/SDIO/eMMC host controller. It defines the required clock domains, resets=
,=20
and specific PHY timing properties.

> diff --git a/Documentation/devicetree/bindings/mmc/cdns,sd6hc.yaml b/Docu=
mentation/devicetree/bindings/mmc/cdns,sd6hc.yaml
> new file mode 100644
> index 0000000000000..d5ea2717904b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/cdns,sd6hc.yaml
[ ... ]
> +properties:
[ ... ]
> +  cdns,iocell-input-delay-ps:
> +    description:
> +      Input delay across the IO cells, used for SD6HC PHY timing calcula=
tions.
> +    minimum: 0
> +    maximum: 20000
> +    default: 2500
> +
> +  cdns,iocell-output-delay-ps:
> +    description:
> +      Output delay across the IO cells, used for SD6HC PHY timing calcul=
ations.
> +    minimum: 0
> +    maximum: 20000
> +    default: 2500
> +
> +  cdns,delay-element-ps:
> +    description:
> +      DLL delay element size, used for SD6HC PHY timing calculations.
> +    minimum: 1
> +    maximum: 1000
> +    default: 24

[Severity: Low]
Will the dt-schema validator actually enforce these minimum and maximum
bounds?

Because these properties use standard unit suffixes (-ps), the dt-schema
tooling implicitly types them as arrays (specifically, uint32-matrix).
In JSON Schema, the minimum and maximum keywords are strictly evaluated
only for numeric instances.

Since properties are parsed as array instances rather than scalar numbers,
these top-level numeric bounds are silently ignored by the JSON Schema
validator.

Could this be fixed by explicitly defining=20
$ref: /schemas/types.yaml#/definitions/uint32 to override the default array
type and enforce a scalar integer, or by placing the bounds within an items
validation block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901184828.1565=
3-1-tanmay.kathpalia@altera.com?part=3D1
