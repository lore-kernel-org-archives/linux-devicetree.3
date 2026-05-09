Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC743932ED
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778338519; cv=none; b=GlGQkUSglmoaOlvLNFvzIEHFIGVsBYjIuxF3zOMhj0t2wfdJC+iM/ZcrWKhX7vdYv/8YtQOE+S1GSoXUhC79pBTkF5c6A2HLWEdpDvphCsEx68Yv7/sShy4fdHt+8fg3gBriuKwD0QUMDEXvYbUAfF3qnZQFhUuvp6nBLtkfIVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778338519; c=relaxed/simple;
	bh=vCdGxJlEpiAp09IjHE4IFBzUAUl89GD8obLIyoZddOI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qzSpJGwW8obTP1QLI6fsCDcXogAuk7jm6CLIMIXsa8AWPcagUPf1zbn94fkWe79Zt9ilXENzLhiYinE4MYuQFs4diHwvwCRHst2haByYjZWKgBpTsMMtR7W5GMMBzKUXHmRg4889Uc9GFBMXS0mjLVpaFScWYDaFk3GmQ6K+qYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBNsADGb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBNsADGb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360B8C2BCB2;
	Sat,  9 May 2026 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778338519;
	bh=vCdGxJlEpiAp09IjHE4IFBzUAUl89GD8obLIyoZddOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=EBNsADGbdyOHdS/yQsIYNJUxgVO+gO7u952yidI8dbxMZX2UdUH+1mgAPrZ3h/bCZ
	 njqRkJtvT+dqBIPLPraLS2czyuPnOPHjnUWR6Toaf6Q8vBPzImAelaPm2Q2XqoM8Hz
	 vYQZswcANLHpL3/7cZ87ioe5+rJgO+zRQdoWYfff2zh3OPCib68jtExDfqwqfyhgdC
	 q47wOHMaU8LaSpPIQKO1jihMO0jBOja6r2i5B8f1llfufNBMA5gH+DERwXDFYsp0Bm
	 UZ4/EGnBzwWTjrhMNdA+OVnecfF2NLB6hnCQZ3zW/Ur7p1Cmz/BmS+K42A7vYxl8rx
	 SKGPlAM9cB8QQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] iio: dac: ad5504: Align headers with IWYU
 principle
Reply-To: sashiko@lists.linux.dev
To: "Taha Ed-Dafili" <0rayn.dev@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509142047.30302-4-0rayn.dev@gmail.com>
References: <20260509142047.30302-4-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 14:55:18 +0000
Message-Id: <20260509145519.360B8C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing lock protection for shared SPI DMA buffer 'st->data'.
--

commit 4601fb5b571a0290d2e1fd539e465ce5c954b588
Author: Taha Ed-Dafili <0rayn.dev@gmail.com>

iio: dac: ad5504: Align headers with IWYU principle

This commit updates the header inclusions to follow the Include What You Use
principle and ensures they are sorted alphabetically. Unused headers are
removed, and required ones are added.

> diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
> index 03ce37e2c616a..57e6eeed26efb 100644
> --- a/drivers/iio/dac/ad5504.c
> +++ b/drivers/iio/dac/ad5504.c
> @@ -5,16 +5,19 @@
>   * Copyright 2011 Analog Devices Inc.
>   */
> =20
> -#include <linux/bitops.h>
> +#include <asm/byteorder.h>
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
>  #include <linux/device.h>

[ ... ]

>  #include <linux/sysfs.h>
> +#include <linux/types.h>
> =20
>  #include <linux/iio/dac/ad5504.h>
>  #include <linux/iio/events.h>

This isn't a regression from this patch, but while reviewing this driver
I noticed a concurrency issue.

The driver allocates a shared tx/rx buffer st->data for SPI transfers.
Multiple sysfs callbacks, such as ad5504_read_raw(), ad5504_write_raw(),
and ad5504_write_dac_powerdown(), directly access and modify st->data
without any driver-level locking.

If thread A calls ad5504_spi_read() and thread B calls ad5504_spi_write()
concurrently, can thread B overwrite st->data[0] while thread A's
spi_sync_transfer() is in progress?

Modifying a DMA buffer while a transfer is in flight violates SPI API
contracts, corrupts the transmitted data, and causes the DAC to receive
incorrect commands.

Additionally, read-modify-write operations on driver state like
st->pwr_down_mask lack locking. Could concurrent writes to different
channels' powerdown files race?

Would it be appropriate to introduce a lock to serialize sysfs operations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509142047.3030=
2-1-0rayn.dev@gmail.com?part=3D3
