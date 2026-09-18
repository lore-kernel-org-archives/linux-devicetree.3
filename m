Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50158369D5E
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723035; cv=none; b=H4TL6GY5vwel+Q+a6HgKl73r2STTsFSYko3HqV1YVfyE2cFr+nVpteQBVAgfVD46RL8bkJWBh3JeVrGSYlpk5JVr3Vzx8eSceCElf+2EN5xEpzUdIEuJlVDvzsxk7x0texGcO66IVwuYuXMhd7wNaCQIRuntwz8eXumu1+QXT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723035; c=relaxed/simple;
	bh=QT8f/Ci4SmxTDLvCHnTnBDnq+AgBjOYLO9E04HY1SPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l5DE7oU5zqzOqwNVarpYEYj25AU20FIUG703EG3sSshyA3Kg8UmOtU04kUZdrco3gL8CMu6vOc3sQ+05CJGk6GHAoqFVY4G4v7PcNF6y6r84Y37JT8O2C94ZiDXfIcL2rZee33e4FyZCmZ1G7ZG1LJ7MALYLKJBM4Y6aqm6tVLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnfEprJ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnfEprJ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201A31F000FF;
	Fri, 18 Sep 2026 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789723033;
	bh=psUf4xsErPBpBUovpkt3CPzxw7K1YGcqQSgHua0LSIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WnfEprJ5L8C0mJbbbVYLwaKYfoCe94hac1Ci4Id1DzX5Y7DP3hV0xS+FSLMzzry7L
	 IMtLtGSeWTzBQ7czfa8LCgWSN0tvyF86uS8kwjsfWm7zVHC8lSC1szMTQuO0OV1Qws
	 BMfnhQ0X5PyoIuHEbVlSNaGfAb5uEHTpNOvINzDcamx4LcPs66+V1AOp+TcHXaLdPz
	 P16b8JVUOMDTOcHR+2CWLDEvaNHtNfP6xZDU7TJJFCF/Z/ld67jdoXzPR9OBHF7oyu
	 E2JgxD9rcmYnsQObxMwoi2HsIGxc7rrZ4mhD/ahF2ebNs11w7obeEEM1Sh3+0MQEAf
	 ih3+LO4av47iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/11] iio: dac: mcp47feb02: use field_get() instead
 of custom dynamic macros
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-mcp47feb02_refactor-v7-3-82ca794eafe2@microchip.com>
References: <20260918-mcp47feb02_refactor-v7-0-82ca794eafe2@microchip.com>
 <20260918-mcp47feb02_refactor-v7-3-82ca794eafe2@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 09:17:12 +0000
Message-Id: <20260918091713.201A31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] iio: dac: unused macro MCP47FEB02_DAC_CTRL_MASK left behind
--

commit d3bd49e7115fae14b0ecbbde0aa73b674836dfd2
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: use field_get() instead of custom dynamic macros

This commit replaces manual bit operations for selecting channel-specific
bits with the field_get() macro in mcp47feb02_init_ctrl_regs().

Link: https://lore.kernel.org/all/20260913224339.490d89ba@jic23-hlaptop/

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index 1b1a4972f7719..d910a6cf9718d 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c

[ ... ]

> @@ -1024,7 +1024,7 @@ static int mcp47feb02_init_ctrl_regs(struct mcp47fe=
b02_data *data)
>  			return ret;
>  		data->chdata[i].dac_data =3D dac_val;
> =20
> -		data->chdata[i].ref_mode =3D (vref_ch >> (2 * i)) & MCP47FEB02_DAC_CTR=
L_MASK;
> +		data->chdata[i].ref_mode =3D field_get(DAC_CTRL_MASK(i), vref_ch);

[Severity: Low]
Does this change leave behind MCP47FEB02_DAC_CTRL_MASK as unused dead code?

Since this patch replaces all instances of MCP47FEB02_DAC_CTRL_MASK, should
the original definition be removed from the file to prevent code clutter?

drivers/iio/dac/mcp47feb02.c:
    #define MCP47FEB02_DAC_CTRL_MASK			GENMASK(1, 0)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-mcp47feb02=
_refactor-v7-0-82ca794eafe2@microchip.com?part=3D3
