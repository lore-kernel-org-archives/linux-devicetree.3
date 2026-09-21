Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56AE4A68B1
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005710; cv=none; b=nBNMjRyw+s2U9Rwanca/RoL6leNoN8yfiY9H8wq4b9x6pcvlrjuN1Q3ttdSOuaATtOS+GXYo5RrOpiSRwTVRXRQXmSGsSfWI/2y+rRtEuB0LvnwLvJJjNBcxVhd+NWCPQvMSxRjkAiqnvLoGwWtc9C+yTlgqIuUqlK4GvuuqKvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005710; c=relaxed/simple;
	bh=wCuUFaxO74UvNf8ac6Mkf2PobFmcSk7DdsO8xzbxiB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QC9UGmrjynmpWp4J5y6+Ep7x27EkG3lUiXAANDmm8HUhTwdCublFJpi6NB3/+oBCa36Jk/YywUFW0GkQAjC27IwsX4TmtH789a39RZVIib/eeEE8ClwB6Vq5U6EGpKBpJYOtF+euhJBXcGr+Nl8vLDei+JDVm+RW8aFl4rojDbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZEFUS5W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZEFUS5W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19581F0089E
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790005692;
	bh=wCuUFaxO74UvNf8ac6Mkf2PobFmcSk7DdsO8xzbxiB0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=mZEFUS5WHu4j1t5+d7QkSLWr8LtQ5S6QfnmD7GkNNF79qwDprQEC76KGPOF3pBpu3
	 0jEgvppSVrUk31bjKkJLuNIJR8j4IvC0NNVrQsSHmVwwSV5880BRqXW+NSZI2XnWbK
	 RNM1DapcCqgGYHxnzEk4NM87SSqbhNj376CLY1iuAvLZvnN7q3xpwxUdxdGApZz1Ze
	 WnhzQY1gthTzo/xZHhNpwtP+iJ5Ptc65W7s5XkfIUew4qnEzhhVgnbsvRDbk/NGQr9
	 hM9sOB1UMnFlu+ze4ZsVww6TXDYLPQf4IVOdEWycB28OLG2xF1ZKkWbB5mLh9Pwd7I
	 xaGFR4w5MTgjw==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a49a10ee5aso24393541fa.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:48:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzA/X9rkvJGSFm5VlHavYKJQS10MaOX2Dv5MJ/erFjFGXoEygKqKjEi2tYKkLRtz/4aD+CrX8Dolv3u@vger.kernel.org
X-Gm-Message-State: AFuF++klvqxbKw3PEaQEfYzI7oOjsEcxpQOBvYrj6qrvPp+B0uAqOwU/
	sjYdA5QGiEWs6BNhIkfYixFtg6qQFRocGAp62OW1dCPGpOai6sZgVE8eXuIA7RHlKp9d8G5JDru
	0exCs1dg+4NqDdHFBm3p3/dYEp1GpdTI=
X-Received: by 2002:a2e:be92:0:b0:3a3:7681:6d67 with SMTP id
 38308e7fff4ca-3a5fc04ac64mr25842931fa.16.1790005691189; Mon, 21 Sep 2026
 08:48:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917223913.1855301-1-andre.przywara@arm.com> <20260917223913.1855301-2-andre.przywara@arm.com>
In-Reply-To: <20260917223913.1855301-2-andre.przywara@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 21 Sep 2026 23:47:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v64E7j2ZJraU6A5dtDR+YhPEum9KtQ2CiPj7homJnB7N9w@mail.gmail.com>
X-Gm-Features: AcwNN1Uu9hlzRJFga8qpiScROV7vtn-TiiKmN7r_Qjatnbb3PEc5x8sEUmLWBys
Message-ID: <CAGb2v64E7j2ZJraU6A5dtDR+YhPEum9KtQ2CiPj7homJnB7N9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: sunxi-ng: generalise update bit
To: Andre Przywara <andre.przywara@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:39=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> A few of the Allwinner A523 CCU clock registers introduced an "update" bi=
t,
> which must be set for changes to the other bits to take effect.
> Of the three clocks where this was used, it was always bit 27, so we just
> encoded this as a single bit feature flag.
>
> Now the CPU PLL also features the update bit, but puts it at bit 26, so
> this flag trick won't work anymore.
>
> Add an "update_bit" field to the common sunxi clock struct, which takes a
> bitmask, so we can encode any bit to use, even potentially multiple of
> them. As uninitialised fields are set to 0, we can use this as a default
> bitmask to set, so can OR this in unconditionally.
> It turns out that the "update key" feature is doing something very
> similar, so just convert it over to also use this same bitmask approach.
>
> Change the existing update bit users to use this new encoding, and add
> support for the ccu_nm clock on the way, since we will need it there
> shortly.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
