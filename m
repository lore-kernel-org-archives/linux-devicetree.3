Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCCF3DB31A
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327719; cv=none; b=hyxF/Ud9vl1vVsuZy9FzspmVLQzfSkA090+Q8jxImyCZ+ckvB+aCQdkE2JnrLNrUuvm6W1nGm9E7KpgTl7iR9RzTWoazpEm07ZSDlZv5gp0cb/29b0u9znpczbUMamqdD+a7l1zKff+t6rIY3rwTAuM0I/w+YiYNLa+aaMqLwQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327719; c=relaxed/simple;
	bh=IevhIJQZx7BntPXEYAU+OaNMRst5YZyfQQPY2QZXLOc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lL3SLe0TzgLwJw2UPgV3lDU97jJ71XDhPSIZhnckRl9mBIiLO/D8/Kerqy64INjQFfH/wRdcmncvyP40BxMBiTIgQFFuazgfRZosW9MAaoIh1+WXSfBOybt8PkXUodYKFshA6adE2R9IUymvDgP6+MbSBR6sGyzx0LpwMT14eeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+3NCvgy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+3NCvgy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD6B1F00893;
	Mon,  1 Jun 2026 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780327712;
	bh=j+sYrB8nNDxUMRuuKWeSHaJ1mYZOl9ov/+5AsoRTQq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R+3NCvgy42tMDhB4nG5hS7BqkiTgkonwSkgFjH0/ACyKlI9zoEwNzyhDSDm0PHr6B
	 UkktJu0zOdiTm4UYx3DkqPos2YoqYDOyd8el4iKB4aDrhw1QWrlJTusx4tKw+Uepnz
	 G8hCqXxsWawjXoR/z18RtVBcaKDegyT9HLJUo14SacoobSbA2ELPyhK2Y/ztQ7Qdsq
	 CzFF5ujJxW9/5O8+W33VaBfVjg+uwpfLLCCMjyS4vYMYQlPYSxqElpIpmOicTfawIK
	 TYZCZxJA2v0teoJ/MxB0y9sm05gnGggxbfNtFdzdt1ZmGfoi7NLxoWxiH33QbZ9HIC
	 DXueZbIRlxVZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/11] mfd: lm3533: Set DMA mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601151831.76350-8-clamor95@gmail.com>
References: <20260601151831.76350-8-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 15:28:32 +0000
Message-Id: <20260601152832.9CD6B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds write in `lm3533_device_init` when processing child =
nodes with multiple compatible strings.
--

commit d3029bf43673fb0132c36c4614c542e46d64f393
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: lm3533: Set DMA mask

This commit sets the coherent_dma_mask and dma_mask to 0 during the i2c
probe. This resolves a warning about missing DMA mask assignments, as
neither the core nor child devices use DMA.

> diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> index 4dca5641b7744..b597d338d6f78 100644
> --- a/drivers/mfd/lm3533-core.c
> +++ b/drivers/mfd/lm3533-core.c

[ ... ]

> @@ -491,6 +491,10 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
>  				   LM3533_BOOST_FREQ_MAX);
>  	lm3533->boost_freq =3D lm3533->boost_freq / (500 * KILO) - 1;
> =20
> +	/* LM3533 and child devices do not use DMA */
> +	i2c->dev.coherent_dma_mask =3D 0;
> +	i2c->dev.dma_mask =3D &i2c->dev.coherent_dma_mask;
> +
>  	return lm3533_device_init(lm3533);

[Severity: High]
This is a pre-existing issue, but can the child node iteration in
lm3533_device_init() overflow the lm3533_devices array?

The lm3533_devices array is allocated based on nchilds. Inside the
iteration loop, independent if statements check the compatible strings:

drivers/mfd/lm3533-core.c:lm3533_device_init() {
    ...
    if (fwnode_device_is_compatible(child, "ti,lm3533-als")) {
        lm3533_devices[count].name =3D "lm3533-als";
        ...
        count++;
    }

    if (fwnode_device_is_compatible(child, "ti,lm3533-backlight")) {
        ...
        lm3533_devices[count].name =3D "lm3533-backlight";
        ...
        count++;
    }
    ...
}

Since the bounds check if (count >=3D nchilds) is only performed once at
the beginning of the loop, a single child node containing multiple matching
compatible strings (e.g., "ti,lm3533-als" and "ti,lm3533-backlight") would
increment count multiple times per iteration.

Could this bypass the bounds check and cause an out-of-bounds write?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601151831.7635=
0-1-clamor95@gmail.com?part=3D7
