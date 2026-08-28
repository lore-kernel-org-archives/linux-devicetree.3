Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1050C3CC303
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 07:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900598; cv=none; b=SUevLEHVOmisE7jmq1t8fhK7AjgiMc+Mym48xlXQ3LxxyFl1pI4lbajfsD7oTX3p8JRGEJ1p7DGYfiYJIXgamXe3N8mM6mlLjdeMu7HzGMr5gJdmP2cVwL5f2NlKRKqaOvtatP5wUsWJJOis2NiHA9WDvJfGdWXcVgm9WclOmhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900598; c=relaxed/simple;
	bh=FICTptobJCT6ulismJ0ya2EVZJdalulMv4dzMrnZ6UU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=imMY6p6E0P7L8f24GuYPOSIG+Ro1+Wlw4zJCnkfcQApB+7PCnPs7GeaGKpGbhKzrbWgKZWVJZWgJX/U7sIXLkz8H5SY2Ceinwo2mWU0+bMiRZJUV7RL9EOJqb5EHe1a9KTOLcJLOuV8grwet6Umn5RJihxeeFqz3/5cTdAKNIL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNskC8/P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNskC8/P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BC61F00A3A;
	Fri, 28 Aug 2026 07:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787900596;
	bh=EfoxceNsSgBJNxiPugbF/9C3HjmhTt4zeM63Ito94Zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GNskC8/PFNdyFdHeSlzhiMV0PMnlIEm50ZKatRalZrD2hL+WnVJ6J3mET8Zq+atq9
	 tJ1uKCV6xSBa3BCqAYoI8L+me89T/91J9ZB0uJhbqU46/rFXaggezXtBTOFtGN0171
	 1xUcH9q6FtbK4pjqlvchAI93/5/J4aZJRhgVfFyBodO5NSKEhNFVVaNrvG8pSrKD5G
	 aF2TnTb6k3IOdIK3shqH14pQAzIC1lV7laBl88kTbhgz8ZM/SicGD8OVSr3qT40wuq
	 otCcM+nMkZCQ0XiOX0aQeWQkCXA5ejAF6nHSdYEZJ+IYZvSdUHePVVB6WpVpDHmlXp
	 H+9ddTHlwoAMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/10] iio: adc: ti-ads1262: support common mode
 supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828-ads126x-v4-10-1dc27e9c0260@gmail.com>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-10-1dc27e9c0260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 07:03:15 +0000
Message-Id: <20260828070316.66BC61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `rx` buffer in `struct ads1262` lacks the `__aligned(IIO_DMA=
_MINALIGN)` attribute, causing it to share a cacheline with `tx`.
--

commit f75cefb819b551b39349e21259c13e70e46354c3
Author: Kurt Borja <kuurtb@gmail.com>
Subject: iio: adc: ti-ads1262: support common mode supplies

This commit enables common mode regulators for the ADS1262 ADC driver. It
adds support for parsing these supplies during probe and applying the common
mode voltage offsets to raw voltage readings.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index 4784142f35c9d..c7ad1cf1a15d5 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c
> @@ -240,6 +240,7 @@ struct ads1262 {
>  	u32 rref_ohms[ADS1262_EXT_REF_COUNT][ADS1262_EXT_REF_COUNT];
>  	int refp_uV[ADS1262_EXT_REF_COUNT];
>  	int refn_uV[ADS1262_EXT_REF_COUNT];
> +	int common_mode_uV[ADS1262_INPMUX_AINCOM + 1];
>  	IIO_DECLARE_BUFFER_WITH_TS(__be32, scan_buffer,
>  				   ADS1262_FW_CHANNEL_COUNT +
>  				   ADS1262_MON_CHANNEL_COUNT);

[Severity: Medium]
Does the rx buffer at the end of this struct need an alignment attribute?

Looking at the layout of struct ads1262, the tx and rx buffers are defined
as:

    u8 tx[ADS1262_SPI_XFER_SZ] __aligned(IIO_DMA_MINALIGN);
    u8 rx[ADS1262_SPI_XFER_SZ];

Because rx lacks the __aligned(IIO_DMA_MINALIGN) attribute, it can share a
cacheline with the preceding tx buffer. C struct layout rules do not add
padding after an aligned array unless the subsequent member requires it.

Since these buffers are mapped separately by the SPI core (DMA_TO_DEVICE
and DMA_FROM_DEVICE respectively), could this violate the DMA API rule that
DMA buffers must not share cachelines with other separately mapped data?=20
This seems like it would trigger a warning when CONFIG_DMA_API_DEBUG is
enabled during SPI transfers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-ads126x-v4=
-0-1dc27e9c0260@gmail.com?part=3D10
