Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC8E317144
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782441530; cv=none; b=OJ+cMR8vz54NWkvHDzy4uKR8HyiOSgfhy+XQxY2QV55rZlPGp65H6uukCk2j0iC7H5n0z7Ne+9dX001GaXhlUJnT2SpRTw8mrLq3I6YT91dcMRAuFxizbpnhTamfRxg07e7bj+5J8bOI4sPHGheP6vT1RXVEg0HpX9PFQMfeiZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782441530; c=relaxed/simple;
	bh=sLt4d5MoJXUtaaXsJ+qatIu7hCoMb9iKPw51xK+A1fc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Om/SC30OyJ+CkrTjHrf3eJWG7ZHd0BcIwCgx2WLrYBICT5FjzKzX9QIPGIRIVOFWUoMttUZTNJd/d4IS0fAj9vcB4AweVe+n9oN841z5A4SfjqguuUsVnrvYV42e4CRa52svAQIAvik89GchCaJ03bLxazK/dJq4ftnG2nL4+8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afCAMCDd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afCAMCDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEAA1F000E9;
	Fri, 26 Jun 2026 02:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782441528;
	bh=WxCzGYAJbB12I2AtraCgK25VEg9M5UDHHtXDtbPrTuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=afCAMCDdKiWFw8xq6fylrP2AE+BqWJ80vPQAu3Ac/qz7lTrHrDnCMOkG0JpkLgzFQ
	 UMDXLtINIOYm6ZhC5eUBeOyQFCxolMqQAl8IkbJTtOBEysesMi50AZWKjYq3VzozZ6
	 RAS/DQ3K/T7I3O3UXolsPQOouFkaYHG0IwzOdWlIwkjq+zIbFco1Lb0vpuqJE4tpQW
	 37lVGQb0Xf909QGuk2zeZMfLqOLriRM/p/+Dpx6uqGf16WxfUnsgD0zY4avrwWGnbg
	 oHZNsa1LCZii+YgemJa0hJ1pqFWFE3Mtq2Zncbo7zwP6iPn5Ur4RnxLWB+oKcbjVmO
	 nR03USSJHxFWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/9] ASoC: loongson: Fix error handling in ACPI
 property parsing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <08e44a54708eae053be148524346bb8dfcd55b03.1782439646.git.zhoubinbin@loongson.cn>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
 <08e44a54708eae053be148524346bb8dfcd55b03.1782439646.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 02:38:47 +0000
Message-Id: <20260626023847.DFEAA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver statically allocates global variables (`codec_name`, `l=
oongson_dai_links`) and modifies them locklessly during the device probe ph=
ase without creating instance-specific copies. This leads to data races, st=
ate corruption on probe deferral, and a use-after-free vulnerability upon d=
evice unbind.
--

commit b0aab833787c20534a1a8d5a4fb96b7f089e37e4
Author: Binbin Zhou <zhoubinbin@loongson.cn>

ASoC: loongson: Fix error handling in ACPI property parsing

This commit fixes a missing error check for device_property_read_string()
in loongson_card_parse_acpi(). It propagates the error if the codec-dai-name
property is missing or invalid, preventing the use of an uninitialized
pointer.

Closes: https://sashiko.dev/#/patchset/cover.1780538113.git.zhoubinbin@loon=
gson.cn?part=3D5

> diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loon=
gson_card.c
> --- a/sound/soc/loongson/loongson_card.c
> +++ b/sound/soc/loongson/loongson_card.c

[ ... ]

> @@ -108,7 +108,9 @@ static int loongson_card_parse_acpi(struct loongson_c=
ard_data *data)
>  		return -ENOENT;
>  	snprintf(codec_name, sizeof(codec_name), "i2c-%s", acpi_dev_name(adev));
> =20
> -	device_property_read_string(card->dev, "codec-dai-name", &codec_dai_nam=
e);
> +	ret =3D device_property_read_string(card->dev, "codec-dai-name", &codec=
_dai_name);
> +	if (ret)
> +		return ret;
> =20
>  	for (i =3D 0; i < card->num_links; i++) {
>  		loongson_dai_links[i].platforms->name =3D dev_name(phy_dev);

[Severity: High]
This is a pre-existing issue, but I noticed that loongson_dai_links appears
to be a statically allocated global array being modified locklessly here wi=
th
instance-specific pointers like dev_name(phy_dev).

If the device is unbound, could this leave a dangling pointer in the global
array?

Additionally, if multiple audio cards are instantiated, could they overwrite
each other's state in this shared array?

Similarly, in loongson_card_parse_of(), snd_soc_of_get_dlc() acquires a
reference to an of_node and stores it in this global array. If probe defers,
does the error path fail to clean up the globally stored refcount, causing
a memory leak?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782439646.gi=
t.zhoubinbin@loongson.cn?part=3D1
