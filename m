Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45E824CEEA
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493915; cv=none; b=sg/FRXA1uQQV11ekGGz117eJurIJECtaRypgeXY1RhePYYMgkyIbmjkcDAyEbvelc3WTWHx0IYRQcqiDSPiUElHDRu8+VVm8VcrsDjqz8PyzBfS8ASS9keaqcSGyjQhLE0wbXCwD0jhakknURgKPkHWw8xVT6narQDuuyguerIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493915; c=relaxed/simple;
	bh=DU6xK1jSSDgzd8zpsHJM4iNP1q7JzkwM5f9EgZO9Ey0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UwdWjdeL8myz/jDxsOHzd7PbHQfWh1cRIMuIVal3CuGbSA1s8nUUxtexXQF8sXxDaLXFcRxDdkAPGN9ZIa1vWKn+DA9UUKHQQ/OoXW4GILExOiTD9jaW0aamUSxWUadSLWgItQEP9YWCPn2+XI9GhQu2n/KyRjnDb9z+kCjyOYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5oVlIN+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5oVlIN+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EF31F000FF;
	Tue, 15 Sep 2026 17:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493914;
	bh=EHo5yZ5loCVor8t+Fdc6mTyGKUo3B7JjnMGBDwacv3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O5oVlIN+8benEPl4mubBHBMs2JQEvzbZjiZkF2T0NLqpdJeLAER1RfnzBxg/gGL4Q
	 fp94OSSmIUSs3DG3l9QIAa5WT6fiRv1zQM1vt0wEuPd3rGSnDqcvHKzMKksTYqwogZ
	 WVMmWJzXNs7EdUhIierBgZwpxQ+AGfTFGCddwnm8rVA0wQpkUqA8RnpjhO0Fke+ejp
	 q1YuNjYHTp2PxQX0SfXAKIOIhCHfUFqOl27k2u0iXueRqp5bzeLTavegbXpajWs/rN
	 WVqak6euMqxfjKTvowjUQ0GkCpI9FIwDutKVwYOLKsYlUU6LDSuvvtpDjMlR9nNBP2
	 QDvxVRY1mquIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] dtc: dt-check-style: Relax property ordering
 rules (drop alphabetical)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260915-b4-dts-style-checker-continued-lines-v4-7-5b8e09b11ef2@oss.qualcomm.com>
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
 <20260915-b4-dts-style-checker-continued-lines-v4-7-5b8e09b11ef2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 17:38:33 +0000
Message-Id: <20260915173834.29EF31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] scripts/dtc: missing pairing rule for #size-cells in dt-check-style
--

commit 15a33e22443049ad6dfd20bb7612f0fac6037dcf
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Relax property ordering rules (drop alphabetical)

Existing rules checked whether properties follow DTS Coding Style
guidelines in respect of common properties and standard vs vendor
properties, plus additionally it enforced alphabetical order within each
of such group. This commit relaxes the property order rules to skip
alphabetical sorting and only check logical groupings.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index cbbb8d384aca2..b8c40873905c3 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
[ ... ]
> @@ -803,33 +777,27 @@ def _pair_x_names(name, all_names):
>  PAIRING_RULES =3D (_pair_pinctrl_names, _pair_x_names)

[Severity: Low]
Is this missing a pairing rule for #size-cells?

The docstring for check_property_order() explicitly notes that #size-cells
must follow #address-cells, but it looks like the implementation for this
rule was omitted from PAIRING_RULES.

> =20
> -def _property_sort_key(dl, name, all_names):
[ ... ]
>  def check_property_order(ctx):
> -    """Properties within a node body must appear in canonical order:
> -    compatible, reg(/reg-names), ranges, then the standard group, then
> -    the vendor-specific group, then status. Inside the standard and
> -    vendor groups, pairing rules apply (e.g. <x>-names follows <x>);
> -    everything else falls back to natural sort by the #-stripped name."""
> +    """Properties within a node body must be grouped in canonical
> +    order: device_type ('model' for the root node), compatible,
> +    reg(/reg-names), ranges, then the standard group, then the
> +    vendor-specific group, then status.
> +
> +    The order of properties within one group is free, e.g. it does not
> +    matter whether '#address-cells' comes before or after 'clocks'.
> +    Paired properties still keep their relative order: <x>-names
> +    follows <x> (clocks/clock-names, reg/reg-names, ...), pinctrl-names
> +    follows the pinctrl-N states and #size-cells follows
> +    #address-cells."""
>      lines =3D ctx.lines

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-b4-dts-sty=
le-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com?part=3D7
