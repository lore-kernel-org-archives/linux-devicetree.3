Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335511;
	b=zs8Xzal1IYJC4veT4nCIUHT8A3Rlb+8JLYMDgmHSmbtsRNJzBeJqVn2NMCPhB2nNNyBc
	 y4VtOzDb6+1don2OC7TiHWujzEGoYV3e2Ac+81kdP8hrZfe76Gn4wkBLT36HhwweQhxEh
	 lCOjmDlk21ehuUaPVkZNqVj1Y5ukBQuvcnEbLGYbQXiLpOb7+6636sqXz3eSwEVWiAIzL
	 DphBjix448fInegRf7hRLQ7Q08+VZQxYbCPA4GiEDwiwPmI/l+3+3xzAXl5EnSA2GvieZ
	 /ui52hNZGJhq9qUcy0qq8Es/h94v4Yfy4WqiLgdKO6GuOVAk+L0E0BquYmtPhZlExeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335511;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wdqNeJEHzeyuBX16DCbR45Yg4+P9OAYprNXXMBkJJDI=;
	b=oNhSot/42gLRfUNJhfkMmcdO+NF6iGAHoM+P02LqfxOUfVQ0S0h+66xtj3h9tZTKqlvB
	 cgsWyJg9ojlP5Bs2j7vILcWV1SzvrP64ILZfeOJgI1B/zDVHltWqovpuGeX+lk4PIEhRK
	 2ToL1De4SHhZYp3ZsG2jPR1K4xZqN9g+XKCYntVChCU0KwA6MolnYaeciPVKLi0/zq2KK
	 PK4zi93pm+qyGYbMWHzUZiFreBHPOQmx6p67SMvSn/mLNQ30En/tmjNmtJP6ifmz6MxGf
	 D9cN0dQ2p5WBBNoD094dLRm+FZoObj7GKhwRIcs5l9xcCFiMrRT04NP5HO4wgcMBACQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uk2fFzGT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA12606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uk2fFzGT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A8E1F000C6;
	Sun, 22 Nov 2026 08:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795335511;
	bh=wdqNeJEHzeyuBX16DCbR45Yg4+P9OAYprNXXMBkJJDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uk2fFzGTjet/nC/pYWKMYaAikdVH6/kTrCYlkxqgnbNRest+b8c/rrTqkXYbrLLZT
	 4DTIXqaoFH9HY1lZO8ew+4wRplUQQm+1YEFNE5nOdgCzarf99EhIYvYb6yO3zymhVf
	 iUWO69m0Qmt5MoBPPUiIWfjxLn3MBAXoHc/6Uzjm6IiIpmAPrMaNKq9d3yzM6OvnHs
	 LpZc+Z/x9NBt7JpmpGhTHfb/O9Aol+9l1CYX2RCC6CrwN9LpIkSfWeahAA2fuMBExQ
	 Ln4T5KVHr5kJ2WhQnZzdQvmCoZDQoLiObCoJ2I19uhoj4ERhUojl05x228KU8taKwb
	 JEL30t/3Mp6cg==
Message-ID: <sashiko-outbox-227817@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122080753.36349-5-clamor95@gmail.com>
References: <20261122080753.36349-1-clamor95@gmail.com>
 <20261122080753.36349-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 08:18:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] iio: light: ltr501: unexported iio_find_channel_from_si()
  breaks module build
--

commit 718e10915f3477f57c274d88a2bc69f6fa1e9766
Author: Svyatoslav Ryhel <clamor95@gmail.com>

iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

This commit adds support for the Lite-On LTR-659PS-01 proximity sensor,
introduces a no_als_support flag to skip ALS register accesses on
proximity-only chips, and updates ltr501_trigger_handler() to check
channel types via iio_find_channel_from_si().

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index a471c90cf0a75..37682e7067b52 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c

[ ... ]

> @@ -1251,16 +1286,21 @@ static irqreturn_t ltr501_trigger_handler(int irq=
, void *p)
>  		aligned_s64 ts;
>  	} scan =3D { };
>  	__le16 als_buf[2];
> +	unsigned int si;
>  	u8 mask =3D 0;
>  	int j =3D 0;
>  	int ret, psdata;
> =20
>  	/* figure out which data needs to be ready */
> -	if (test_bit(0, indio_dev->active_scan_mask) ||
> -	    test_bit(1, indio_dev->active_scan_mask))
> -		mask |=3D LTR501_STATUS_ALS_RDY;
> -	if (test_bit(2, indio_dev->active_scan_mask))
> -		mask |=3D LTR501_STATUS_PS_RDY;
> +	iio_for_each_active_channel(indio_dev, si) {
> +		const struct iio_chan_spec *chan =3D iio_find_channel_from_si(indio_de=
v, si);
> +
> +		if (chan->type =3D=3D IIO_INTENSITY)
> +			mask |=3D LTR501_STATUS_ALS_RDY;
> +
> +		if (chan->type =3D=3D IIO_PROXIMITY)
> +			mask |=3D LTR501_STATUS_PS_RDY;
> +	}

[Severity: High]
As reported by kernel test robot on v3 [1], does calling
iio_find_channel_from_si() here break modular builds when CONFIG_LTR501=3Dm?
iio_find_channel_from_si() is defined in drivers/iio/industrialio-core.c
without EXPORT_SYMBOL or EXPORT_SYMBOL_GPL, causing modpost to fail with
an undefined symbol error when ltr501 is built as a module.

[1] https://lore.kernel.org/r/202611090518.mm6yt2nO-lkp@intel.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122080753.3634=
9-1-clamor95@gmail.com?part=3D4
