Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E784F7997
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648292; cv=none; b=VM90+Q/yioYs6+lsPUa6yBJy7SRhworkQGAyamR7U7OJU5ALlkSNs5pLg9WUva1HB8hvPES/ltINhFlAxLu0UJUgLEb0/B72UrDNZNAFaOvSRYaXq2nuZEByESNqeLq50fQ/jEeB/Wry65yO6J8JgugA3sQEQTtLnzYUD2VkN1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648292; c=relaxed/simple;
	bh=LlB2CEbkkt775S1ouzg56VOZW0LkIlr7XusnhZci14Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qPLDXPcRfWmgf7BVl+GAruzKlfvuE9p0ijU7sElir5eNtIaG3+ph/+mQ4ab3YBFVekY2y3/IzcnXI0HHIKY5AGifiIwCN4RnWBmDPGEgam41nj9+vKQLd+frC/2bWEZlGUwh7RBxNPpm6H+Hxo2nU6BnLknVrlQMzKyvUg5SFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNGpC72r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNGpC72r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1CB1F000FF;
	Thu, 17 Sep 2026 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789648283;
	bh=rCPvAlT2UOVycy8qJv/475v9xEvMCfAG26E6LuNLEjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WNGpC72rit1fgsuTRVsCjViTDrB1GXDJYDY3V6pNj+Ulek47XofWpCpxgKv2bORi7
	 8bcb3zfCf6Z5rIn0xXT3VMTX09SGF5YNMh0T25xU4kqz6JgFb6NfML38KbiKQihjzw
	 SrSJajalaNQH6hp2hIQ/U1b/6z4nKOD5Cg7f+nUseBt1OfuDT9iLjv4fWFiSEhftaZ
	 W27nYbL0Rs7GDxdMfZ/ukDvVFIyWe6EXVNwl3ozX6erVyp9q/9I3hZq+oPddBCmZ/U
	 A8I/kUhYSZimxNTlVgKvquiC/t9yARCf2EK8UolMOCWyTyLuqcX+meyLa/bnV50NIj
	 6Wig17oBDrs7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Sort nodes
 alphabetically
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917122701.160720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260917122701.160720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 12:31:22 +0000
Message-Id: <20260917123123.2A1CB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: incorrect node sorting breaks alphabetical order
--

commit 6d15dc9289c8e2de0fe2bc1d3748c8961dab0497
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g047e57-smarc: Sort nodes alphabetically

This commit moves the sound card node before the vqmmc regulator node
in the r9a09g047e57-smarc device tree, with the stated intent of maintaining
alphabetical ordering of the nodes under the root node.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index 4eed095b683b3..df5ec16d7dbdd 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -77,6 +77,14 @@ aliases {
>  		mmc1 =3D &sdhi1;
>  	};
> =20
> +	sound_card: sound {
> +		compatible =3D "audio-graph-card";
> +
> +		label =3D "snd-rzg3e";
> +
> +		dais =3D <&rsnd_port0>;	/* DA7212 */
> +	};
> +
>  	vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {

[Severity: Low]
Does this actually maintain alphabetical ordering?

Standard Device Tree conventions dictate sorting nodes alphabetically by th=
eir
node names (the part after the colon), not their labels. Alphabetically by
node name, "regulator-vqmmc-sd1-pvdd" comes before "sound".

It appears this moves the "sound" node before the regulator node by mistake,
perhaps by sorting the labels ("sound_card" vs "vqmmc_sd1_pvdd") instead of
the node names.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917122701.1607=
20-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
