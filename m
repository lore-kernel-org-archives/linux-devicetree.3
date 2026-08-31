Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2DC57AF7E
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184170; cv=none; b=eh5C+cAbvZfy1Ebv9PqFsRFSNHNfYjHsn4db4C3bKkLiCNKHbXGBdS5nCK+cZuLjLnPcFT4/bnfPFpDhECRUBZoHffFWxBqjzhXpde9BMnYAdTiie8towFvPp5LHOXHQvphtWtmJRRy02xILjZC31MZsW3AFxp189Ah4EUV1+AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184170; c=relaxed/simple;
	bh=u5QccouGWhUbS2MXlUPrKhAYKibQmLy4W56sLUGEiSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YQTKYSCw5fCZWXUu0fKCxlat9YFpoCmDgNws0PBRklUcpj/WQsqcCtmSAUN7B0GdwLvsMzFEmBRLTSGB2LxYO5t3LtNhBcVVjLU218fkoTIF37DXXbS4t7NE/vd8AKHTudP4EvzDHj8xSY2qfVRmqMVZCb4NlAlwiTcP4oC0wlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKvVh9bm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKvVh9bm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946B41F00ACA;
	Mon, 31 Aug 2026 13:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184167;
	bh=2jKORdsM53b0zpJWNHqi9Q1hJWcfMqi82ksoiP89yUM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jKvVh9bmeULGaUyMeYw7Vb7V53FXRVnxT3HAtZtf9rsRKq3RMXQ5sFonrkoZTXqUo
	 V30COrGTO+AnERi8UFWa+SByYtfZgMCNhojDpQ7u1wNWosJFcWY+Lt3q4AGZ2hI27r
	 Cwp9Ter9+4E6AgXxIIAw8P4BV72d9HJ7Tv7/hREb5G5Q3ommflQkhsL6i1F4WU9FBM
	 mgBtBObsk1qztw1JEE4aGhy3Ii0p6DBLXqjkFKCXz3dGHYIinTSxIRtmaRMGB0idQg
	 NbWDW/Khd7kKaGnzVqli10wxldg0bN9x9QIHdczyFQKocolwd6syX87pstVS+Fgtc6
	 rRl78C1b4tbNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 17/22] media: i2c: maxim-serdes: add MAX96717 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-gmsl2-3_serdes-v16-17-4fa6e08bb514@analog.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831-gmsl2-3_serdes-v16-17-4fa6e08bb514@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 13:49:27 +0000
Message-Id: <20260831134927.946B41F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect GPIO pin offset mapping in PIN_CONFIG_SLEW_RATE corrup=
ts slew rate configuration.
- [Medium] Subtracting unsigned values causes underflow in clock rate diffe=
rence calculation, triggering abs() macro failure.
--

commit 7d97c788ea6a3ed1b94c36b8f48a9970ccb4483b
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: maxim-serdes: add MAX96717 driver

This commit adds a new MAX96717 driver that supports MAX9295A, MAX96717F,=20
and MAX96793 serializers. It integrates with the common serializer framework
while enabling features across multiple chips.

> diff --git a/drivers/media/i2c/maxim-serdes/max96717.c b/drivers/media/i2=
c/maxim-serdes/max96717.c
> new file mode 100644
> index 0000000000000..2764a24fb3a93
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max96717.c
[ ... ]
> +static int max96717_get_pin_config_reg(unsigned int offset, u32 param,
> +				       unsigned int *reg, unsigned int *mask,
> +				       unsigned int *val)
> +{
[ ... ]
> +	switch (param) {
> +	case PIN_CONFIG_SLEW_RATE:
> +		if (offset < 3) {
> +			*reg =3D MAX96717_PIO_SLEW_0;
> +			if (offset =3D=3D 0)
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO00_SLEW;
> +			else if (offset =3D=3D 1)
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO01_SLEW;
> +			else
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO02_SLEW;
> +		} else if (offset < 5) {
> +			*reg =3D MAX96717_PIO_SLEW_1;
> +			if (offset =3D=3D 3)
> +				*mask =3D MAX96717_PIO_SLEW_1_PIO05_SLEW;
> +			else
> +				*mask =3D MAX96717_PIO_SLEW_1_PIO06_SLEW;
> +		} else if (offset < 7) {
> +			return -EINVAL;
> +		} else if (offset < 9) {
> +			*reg  =3D MAX96717_PIO_SLEW_2;
> +			if (offset =3D=3D 7)
> +				*mask =3D MAX96717_PIO_SLEW_2_PIO010_SLEW;
> +			else
> +				*mask =3D MAX96717_PIO_SLEW_2_PIO011_SLEW;

[Severity: Medium]
Does this logic map the pin offsets correctly? When offset is 3 or 4, this
configures the slew rate for PIO05 and PIO06, while leaving offsets 5 and
6 unhandled and returning -EINVAL.=20

This causes max96717_mux_set_rclkout() to modify pin 6's hardware register
when it attempts to configure the RCLK out slew rate for pin 4. Similarly,
offsets 7 and 8 appear to map to PIO10 and PIO11.

[ ... ]
> +static unsigned int max96717_clk_find_best_index(struct max96717_priv *p=
riv,
> +						 unsigned long rate)
> +{
> +	unsigned int i, idx =3D 0;
> +	unsigned long diff_new, diff_old =3D U32_MAX;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(max96717_predef_freqs); i++) {
> +		diff_new =3D abs(rate - max96717_predef_freqs[i].freq);
> +		if (diff_new < diff_old) {
> +			diff_old =3D diff_new;
> +			idx =3D i;
> +		}
> +	}
> +
> +	return idx;
> +}

[Severity: Medium]
Since both rate and freq are unsigned long, can this subtraction underflow
when rate is less than freq?=20

Additionally, using the abs() macro on unsigned types can lead to build
failures or unexpected behavior due to type checking in the macro. Would
using abs_diff() be a safer approach here to calculate the difference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-gmsl2-3_se=
rdes-v16-0-4fa6e08bb514@analog.com?part=3D17
