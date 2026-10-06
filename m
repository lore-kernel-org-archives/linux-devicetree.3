Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9207D4A6892
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 18:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311572; cv=none; b=MP1tX7FJfTaG/054uwTS6La6ux7Dce8K2pn/Ne9iDqGX4Mam7oF9oG3xNl0bQo4X5yOLGAnhxkwSn/bmW4TZB2owIdCLBGIW0ZFUR6z90WTEv81co4BGy2qLP4Fc5ibTMBCCYVCypSbMJCo3OBmZNcO3pvYWumo0U6NnM0hFuV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311572; c=relaxed/simple;
	bh=iGw6My4moWUHTnxsdFBOAUzGW9DFIHx42YlyLw19Txo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=NfZq+tBTlpumojtu/OBqFMfvCeAwQuKimpOmM2dr7LgBvc9zSlKe2kTzk53bU9MA8ctuE1xAh+2GpNEMkiywCLiwW1WwoXG5lOTPn5cVrPai09F5bStikF3A6fyBXTvVqEAsf1+NO20vYV692s29dqJYSdAnGAUKLQ0GahT/gtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVtGBLr7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVtGBLr7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0FE1F0089E;
	Tue,  6 Oct 2026 18:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791311567;
	bh=AFauxnhmILA/mZoGlsWSPO4S7xBAK7BWCGxZ2JozB1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BVtGBLr7lTB6JN1Ji999X0WjC5KUAsuYWePxPL/fk1VtaEHhFZ3m1McuH0+P+SF+6
	 HsdTg8mFtdKx7yaqionU+DGjdBHzGkGFA9isoHevyvn5uAvqWWgFhzgfpu/E5FsDOB
	 28Lv1jQgmBdI5yAm9LYkFuR7Lkbkm6+QoZLS5rGREXK12ala66EnCfQfMwRbiEwepe
	 xXhyK1wuCwa6znty2Jsmhr4TOJJnb6UE8vV3sjlS1PwMSOjoAaaDwLfrs677c1Ubcv
	 SOt1NFa7kl+dbzGjhMpVr/bMYWDgbOQbZrtE+V38MvL6J53kY59IUbtY9ABFuDkkLB
	 Ov++SdthN826g==
Message-ID: <sashiko-outbox-162349@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/13] iio: adc: ad4134: Sign extend sample data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <8f22f48cd830338d801342a52fb454607e8b06c0.1791309733.git.marcelo.schmitt@analog.com>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <8f22f48cd830338d801342a52fb454607e8b06c0.1791309733.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 18:32:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] build: -Wmaybe-uninitialized warning for conditionally assigned 'sa=
mple'
--

commit 6ed41c1a7f4a36c8c7537ebc2c932623b78e2afa
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Sign extend sample data

Sign extend ADC sample data for correct delivery of negative ADC input
difference.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index e53c10b9a44a9..6fdeb27d7a42b 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
> @@ -172,6 +172,7 @@ static int ad4134_data_read(struct ad4134_state *st, =
unsigned int reg,
>  			    unsigned int *val)
>  {
>  	unsigned int i;
> +	u32 sample;
>  	int ret;
> =20
>  	/*
> @@ -196,8 +197,9 @@ static int ad4134_data_read(struct ad4134_state *st, =
unsigned int reg,
>  		 * Clock out data from all channels to avoid that.
>  		 */
>  		if (i =3D=3D AD4134_VREG_CH(reg))
> -			*val =3D get_unaligned_be24(st->rx_buf);
> +			sample =3D get_unaligned_be24(st->rx_buf);
>  	}
> +	*val =3D sign_extend32(sample, AD4134_CHAN_PRECISION_BITS - 1);
                             ^^^^^^

[Severity: Low]
Does this code trigger a -Wmaybe-uninitialized compiler warning?

The local variable sample is declared without initialization and is only
assigned conditionally if i =3D=3D AD4134_VREG_CH(reg). While the regmap co=
re
strictly validates reg before invoking the read callback, the compiler anal=
yzes
ad4134_data_read() locally and cannot statically deduce this external bounds
guarantee.

Consequently, the compiler evaluates a theoretical path where the condition=
 is
never met, leaving sample unassigned before it is passed to sign_extend32().

This can cause build failures in kernel configurations with CONFIG_WERROR
enabled. Explicitly initializing u32 sample =3D 0; or unconditionally perfo=
rming
the sign extension inside the if block would resolve this.

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791309733.gi=
t.marcelo.schmitt@analog.com?part=3D2
