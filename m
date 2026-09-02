Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBFD3655CA
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370831; cv=none; b=Iwwr4qdqN2uZQmcq2T5o8sXPdTOHamPMhzi0oZz8r9cKtpWxWFcDtkpVIJfNvnCGrK1DSK6o1nB5/im4wFKSCGpnvtdC4kuxRaATGI4/L4FYqcfFcX7QafFWeFEAqerlDe/cK3fq+JXJ5q33E8dZ3fOQkLY0sUZUkBIk5AgiWRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370831; c=relaxed/simple;
	bh=m7qlcF1jMVI5fOypo+2zJx3GibmKee8Yi3ry942A2gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YPz4FhfeDWRwd49pHYUP90WBkQ9OCq1saDm76wBZ5/klTZmm5Fg0crgkkLQUZuroEreHShW3N+vUkRhN6lWd6r9gzZfaZEGJ0NEGmD4X/LE+3eV3wUrk8lIjj71bjgqzQWNlMROUly5TiuZdAuNbeZ4Lxb2iQMwzT1/OscpG940=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EStaAHRW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EStaAHRW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64A11F000E9;
	Wed,  2 Sep 2026 17:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788370830;
	bh=8p+HUC7sY4Iz03Y+cx2d4hfoksiM2CK70FK7t6w+SV4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EStaAHRW4D+CJ6PwK7bvpzGE5CO2OdkWs7nUURrJu7GAoKfbGmZHvA4T3N2jAk/xW
	 YaHfR162EshBCtDyhh13U5RXLn4ud0pdva3xzvCio5XhG3QRJkdNClFhtR1LSdRUYW
	 B1ArNyadQyTuuNPL9E/ulVxcC3Bo/9vXAb9bpw+Ez+V/5XNxspACQiu+OgWLktzGSg
	 BQ0pk41eBCmhl6OeGoJsytEcNdY0nQzl724F/3JRt6JEc2wndXN92WGbXlXgO3ol0S
	 MTugQhJad9EpgQI81xTDqWT6mDMscFnk6jp2mQ4P3tkPunKapcmG8UBb+5/iTCBVC1
	 2geUqo6AYYhBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 03/13] iio: adc: ad4134: Update include list to
 comply with IWYU principles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <22e82ed7b6d6c04f6347f8cdd0c675ea35fcc22f.1788368334.git.marcelo.schmitt@analog.com>
References: <cover.1788368334.git.marcelo.schmitt@analog.com>
 <22e82ed7b6d6c04f6347f8cdd0c675ea35fcc22f.1788368334.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 17:40:29 +0000
Message-Id: <20260902174029.E64A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] tx_buf and rx_buf in ad4134_state share the same cacheline, leadin=
g to potential data corruption during concurrent DMA mappings.
- [High] The 24-bit ADC raw data is read as an unsigned integer but never s=
ign-extended to 32 bits, causing negative voltages to be reported as large =
positive values.
--

commit 7ad0a307d46e16f77ecfa435dfba2e8a4ef0334d
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Update include list to comply with IWYU principles

This commit updates the AD4134 driver's include list to comply with=20
include-what-you-use principles. It adds necessary headers like bits.h and
time64.h, and removes redundant ones.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 70f80bf1825f8..7a3b05aacc744 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c

[ ... ]

drivers/iio/adc/ad4134.c:ad4134_state()
> 	/*
> 	 * DMA (thus cache coherency maintenance) requires the transfer buffers
> 	 * to live in their own cache lines.
> 	 */
> 	u8 rx_buf[AD4134_SPI_MAX_XFER_LEN] __aligned(IIO_DMA_MINALIGN);
> 	u8 tx_buf[AD4134_SPI_MAX_XFER_LEN];
> };

[Severity: High]
This isn't a bug introduced by this patch, but does tx_buf lack the necessa=
ry
IIO_DMA_MINALIGN attribute here in ad4134_state?

Since rx_buf is aligned to a cacheline boundary but only takes 3 bytes
(AD4134_SPI_MAX_XFER_LEN), tx_buf appears to be placed at offset 3 within t=
he
exact same cacheline.

During SPI transfers (such as in ad4134_register_read), the SPI core
executes dma_map_single() for both tx_buf and rx_buf independently on the
same transfer. Can performing concurrent DMA cache maintenance on the same
cacheline (flushing tx_buf and invalidating rx_buf) cause data corruption
on non-coherent systems?

While later patches in this series move the alignment attribute to the
preceding scan buffer, it seems rx_buf and tx_buf still continue to share a
cacheline with each other in the final state.


drivers/iio/adc/ad4134.c:ad4134_data_read()
> 		/*
> 		 * AD4134 has a built-in feature that flags when data transfers
> 		 * don't run enough clock cycles to read the entire data frame.
> 		 * Clock out data from all channels to avoid that.
> 		 */
> 		if (i =3D=3D AD4134_VREG_CH(reg))
> 			*val =3D get_unaligned_be24(st->rx_buf);
> 	}
>=20
> 	return 0;
> }

[Severity: High]
This is a pre-existing issue, but does this code fail to properly sign-exte=
nd
the 24-bit raw ADC data in ad4134_data_read()?

The ADC channels are defined with IIO_SCAN_FORMAT_SIGNED_INT, meaning the
hardware outputs 24-bit signed two's complement data. However, reading the
3 bytes with get_unaligned_be24() returns an unsigned 24-bit value.

Because this value is not sign-extended (e.g. using sign_extend32), could
negative ADC readings (like 0xFFFFFF) be incorrectly reported to userspace =
as
large positive integers (16777215) instead of negative values?

It appears this issue also remains unfixed in the final state of this serie=
s.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788368334.gi=
t.marcelo.schmitt@analog.com?part=3D3
