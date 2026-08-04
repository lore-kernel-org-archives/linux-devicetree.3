Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE74423EBA
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828479; cv=none; b=FzXUZacco+CeB7pDD7s8ACSpeutX2kxf1sAi7Iru/2+vFcFmbpdtQnHCoGlhlKUvJlOmE/o2ljQ8tY4rqndPCO0DF+P8ifmY5l3Kn0qevB1X2OQO1DXCq9fieoLWGtQx9YrmbU0zMHoFdp8QYRQCvKzTwFdFgIKGimkFTlaQZ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828479; c=relaxed/simple;
	bh=j6hYlpBPpFCR7ByqjyYUjcz5TY/1UrcNRe+jzcHwXz8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PYqLfn5jXWWrqYvbhU2Ig64ivmTbzc2nztLiClnK1b4v7KgMY1ij3Z/unqY5cbWQ5T4tQUaw0S1vMNr8/beTdvwnsQIVfyI2i0ckiSJlFZDBF1M4Xzkh8/olJebDWa/rsYdoNUXISihN4WOvq831rZ0NnCkQsOItzlpEbPfGXk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYEkzIfh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYEkzIfh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE8C1F000E9;
	Tue,  4 Aug 2026 07:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785828477;
	bh=lm9JXw8seFComaOQlfr7KZg7C7kP1p6WOUTP3JyH0Pk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EYEkzIfh0dkKtiWeBss93lV1IlBg9L17VGIN24ftD+ft9z5B4/b9jqLkhtpNshDPo
	 A6i3awMGY65TlPgZ54guVqBMaRE16S3iO31EC4bhCOKSXJeTI3ZTceYij9XQzNk7wm
	 GwiUN7CvtZK8L66e5Rw+S+SoCFerDaxgdTZbcqjOAO4zzykN/w5wfzekZr1iTRM6YZ
	 BQiYJiYMBrq38OSI9mftQskT4W7JuTLs/+n0b0516c0SKzKCd6JYPShpd6fZ0ZbQLX
	 +a4HtJyn7f6Ezmy0qQEDMcWf9UZRqa40rZz7Vu2ePU8/SsLfnm8a0vlBLqLCpvpwpw
	 lwn8WGoc1tkDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] spi: atcspi200: Drop redundant andestech,qilai-spi
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260804-spi-num-cs-v1-5-4ccb13dcc7b0@oss.qualcomm.com>
References: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
 <20260804-spi-num-cs-v1-5-4ccb13dcc7b0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 07:27:57 +0000
Message-Id: <20260804072757.9CE8C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Direct casting and dereferencing of potentially unaligned buffers =
to 'unsigned int *' causes undefined behavior and unaligned access faults.
--

--- Patch [5]: [PATCH 5/5] spi: atcspi200: Drop redundant andestech,qilai-s=
pi compatible ---
commit 0adcd926abd385a3e807d5c95896eac0c48c12aa
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

spi: atcspi200: Drop redundant andestech,qilai-spi compatible

"andestech,qilai-spi" compatible can only be used with a fallback, which
is already matched by the driver's OF device ID table, thus it is
redundant in the driver.

> diff --git a/drivers/spi/spi-atcspi200.c b/drivers/spi/spi-atcspi200.c
> index b6ea8e5563359..b532c58c0ab91 100644
> --- a/drivers/spi/spi-atcspi200.c
> +++ b/drivers/spi/spi-atcspi200.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this file I
noticed a pre-existing issue that can cause unaligned access faults.

Looking at the transmit path in drivers/spi/spi-atcspi200.c:atcspi_xfer_dat=
a_poll():

			if (spi->data_merge)
				val =3D *(unsigned int *)tx_buf;

And on the receive path in the same function:

			if (spi->data_merge)
				*(unsigned int *)rx_buf =3D val;

Does this code directly cast and dereference potentially unaligned buffers?

Since spi->data_merge is enabled whenever the transfer size is a multiple
of 4, it appears to ignore the memory alignment of the op->data.buf.out and
op->data.buf.in input/output buffers.

On architectures that do not support hardware unaligned accesses, such as
RISC-V CPUs lacking this feature, could this cause an unaligned access fault
and kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-spi-num-cs=
-v1-0-4ccb13dcc7b0@oss.qualcomm.com?part=3D5
