Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A6347FAF5
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017712; cv=none; b=qZbk41ATshcQJi8LV3GWVLCNzPfMFIs37IcxoPfqR3S9lv2tDOQZ402abKMLlENzllZZxMNOj+XeuyZk2DMQ+D8Qt+sELr7JTA4jmJrclPoLSLe0DB5lKt7Qxu+PobdmgzRsKkZGamyksYWPSl17SvXipSTQDZrb1ewiv+q9KPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017712; c=relaxed/simple;
	bh=AaJbglGuyQtzXYk9lkD+WgS/Fb8hZmUD8NdkvFK71T4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=e/qXJFI8sp6UqO+DCu6CSw9UiMxm0itM/febIqCQQerps7eTp4gocANWcTqNnOlHKcBtsCWYGrLAB5356RQqpYqti0GjhoiFift6gAUZcvVoApvqyvOvmZDDW2w1Cro3TbgYZ26xV13TjxLDc/HP9m//OZwevSjdf2B/uqYnXWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3mq3OVx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3mq3OVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1A11F000C7;
	Wed, 14 Oct 2026 22:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792017708;
	bh=qfAYY5q80c+jENXXtJ25EVm9UX2zIk/9hamTrbHIptE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S3mq3OVxWnOCBAnfPKXkzfqLbW6ij8AwzzYzIGLhwOUiA16ULK6O7j+hb5msCqcUM
	 VP1B0IhpqJ8cskPIbd/F+9j9cBqEC/5Pr4KW5e6dr+aHPhVigTKcy5TgzK/qZN+vpj
	 I2Hf5m6HOb/RLwdN46gEu/bQKLf28M7ALFxK6ihCfVesWgwtHuPxaKbKayIkY0r7AU
	 j6CiPl8nOpaWDC/7qWR1kwBmySRpHYsGprXEsJhVMsnMl6bNu48hzKIn4FtQGHjXk/
	 zS+Kv9kojh9lP5Rvai+8/P6DZwAGg6UpxOtbRl5P1Lt2+J04jWbYarv9xdHOWXyYCW
	 H6bt952vyh5Rg==
Message-ID: <sashiko-outbox-171996@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 08/12] dpll: sit9531x: add support to get
 and set frequency on pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013224131.27149-9-arouhi@sitime.com>
References: <20261013224131.27149-1-arouhi@sitime.com>
 <20261013224131.27149-9-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 22:41:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dpll: sit9531x: byte order reversal when reading DIVN registers
--

commit f43a2163b7c3dc5944868b5794ea65a8398e4775
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to get and set frequency on pins

This commit adds the ability to get and set pin frequencies for the sit9531x
DPLL driver. It reads and writes DIVN registers to compute output frequency
based on VCO rate and a divider.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index f3dbe949f219b..875a5fe783d5c 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -1342,6 +1481,675 @@ int sit9531x_input_prio_add(struct sit9531x_dev *=
sitdev, u8 pll_idx,
[ ... ]
> +static int sit9531x_divn_static(struct sit9531x_dev *sitdev, u8 pll_idx,
> +				s64 *divn)
> +{
> +	u32 int_part, fracn_raw =3D 0, fracd_raw =3D 0;
> +	u64 fracd;
> +	s64 fracn;
> +	int rc, i;
> +	u8 v;
> +
> +	rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,
> +				  SIT9531X_PLL_REG_DIVN_INT, &v);
> +	if (rc)
> +		return rc;
> +	int_part =3D v;
> +
> +	for (i =3D 3; i >=3D 0; i--) {
> +		rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,
> +					  SIT9531X_PLL_REG_DIVN_NUM + i, &v);
> +		if (rc)
> +			return rc;
> +		fracn_raw =3D (fracn_raw << 8) | v;
> +	}

[Severity: Medium]
Since the device registers are big-endian, does this loop reverse the byte
order? By looping i from 3 down to 0 and shifting the result left, the
value from the highest address (which should be the LSB) is placed into
the most significant byte of fracn_raw, which could result in incorrect
VCO frequency calculations.

> +
> +	for (i =3D 3; i >=3D 0; i--) {
> +		rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,
> +					  SIT9531X_PLL_REG_DIVN_DEN + i, &v);
> +		if (rc)
> +			return rc;
> +		fracd_raw =3D (fracd_raw << 8) | v;
> +	}

[Severity: Medium]
Similarly for the denominator, is the byte order also reversed here by
reading the highest address first and shifting it into the MSB?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013224131.2714=
9-1-arouhi@sitime.com?part=3D8
