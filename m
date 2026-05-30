Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C311427A
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 19:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780168346; cv=none; b=JxX2UeBM5q+RHiJyIGJFSmeuOJSLo3I1K1w7OQ249UagVMfEplpBWqGiADhtRT5uwhVtNK1xAfg5x/2g9GYTJTSVHjKsHFUq4cq1oqYOIL8zlrjHqSeNFNizbu1y0ARec4kSogE/O3IkRbWfqqHslNMlFVmwXtN7kY7IlC05d6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780168346; c=relaxed/simple;
	bh=YzfogH+qWAZHLHJwx5+AxYQkUUC3Sm4Jw8ZqS3JC2rg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YX++AtDELJ6TGRbyfQ3pNcy6iV6PnLD6gjtzH/mVdJKbse8Kf2kj1w5PdBEgQsxdA+goNvTSAA4F10NN/3sVwqu0/w5sE1UhjYaU25ma4UVpBoMmq6Vk3pO64WU0pquMMf/dLn+EkmUwVK54xicawEXJpuOf6L0UKLCl7/bMysc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxXHDLIu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxXHDLIu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E461F00893;
	Sat, 30 May 2026 19:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780168345;
	bh=rXv4O9GkiV1lDGSgM0BFe1Fb/o47RGlNCBOedSA66ao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SxXHDLIuZzJnaTYjbNzAJoA1qUZgZ2D9UgBqhknkzNZDAhV9Y8V4AZaaPTh0589vp
	 hC+IYXJB2JR7C1gM477XWwzxzk0oQds01+9EZx9uzgqH8ywPixDWnr85SB3LVzmiCo
	 /o975BSM3rcGpD7d1BXPvCAX5OzzEEOw4kDxsc83ruTOT9L/ftPsIlu0P/9JTGjq8V
	 d6RuWLi6XCMRLkgZh/9e5e7UXLq+WXV6NtzTwqFhxcU50zbJ/WwlYy+p2XOqZAFUr5
	 Xt5Fw0d3ssOI2VQZIgqQHEMyefoivMdJ5L28DZiVR4ummjX8e5AgYY4r3qUuAW5cYW
	 kUTKDfXiW5qPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260530-enable-spi-on-sa8255p-v2-4-17574601bd63@oss.qualcomm.com>
References: <20260530-enable-spi-on-sa8255p-v2-4-17574601bd63@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 19:12:25 +0000
Message-Id: <20260530191225.80E461F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] GPI DMA mode (`setup_gsi_xfer()`) bypasses the `set_rate` abstract=
ion, breaking SPI transfers on the SA8255P platform.
--

commit 51c1e984c5666b6d16483f6836d8eccfa71a9fa2
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

The patch enables SPI for the SA8255P platform using SCMI power and
performance protocols. It introduces a dev_data struct with function
pointers to abstract initialization and rate-setting operations.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 7696412c6e879..98e34e58fae21 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c

[ ... ]

> @@ -820,7 +829,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
>  	}
> =20
>  	/* Speed and bits per word can be overridden per transfer */
> -	ret =3D geni_spi_set_clock_and_bw(mas, xfer->speed_hz);
> +	ret =3D mas->dev_data->set_rate(&mas->se, xfer->speed_hz);

[Severity: High]
Should setup_gsi_xfer() also be updated to use this new set_rate abstractio=
n?

Looking at setup_gsi_xfer(), it appears to still hardcode a call to
get_spi_clk_cfg():

drivers/spi/spi-geni-qcom.c:setup_gsi_xfer() {
	...
	peripheral.pack_en =3D true;
	peripheral.word_len =3D xfer->bits_per_word - MIN_WORD_LEN;

	ret =3D get_spi_clk_cfg(mas->cur_speed_hz, mas,
			      &peripheral.clk_src, &peripheral.clk_div);
	if (ret) {
		dev_err(mas->dev, "Err in get_spi_clk_cfg() :%d\n", ret);
		return ret;
	}
	...
}

Since SCMI-based platforms like SA8255P rely on geni_se_domain_attach()
which leaves se->clk uninitialized (NULL), get_spi_clk_cfg() will fail
when calling clk_round_rate() and geni_se_clk_freq_match().

Does this unconditional bypass of the set_rate abstraction break all
SPI transfers using GPI DMA on the SA8255P platform?

>  	if (ret)
>  		return ret;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530-enable-spi=
-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com?part=3D4
