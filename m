Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D433E40E9
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722372; cv=none; b=ZAuRv5Ud+NIwWDcKGkRBKx4L31MQPiE4JPEdteEsLdYruI7v5J3IbrkZ9z/27G87bmZZrGw5rR8JW06JhKFy/unbvQBldsqPhFtgT9KSjHifqRWwMFxESg7InFB75VEB8AnSkySZx7Zfk1qh1v2o4/0rAQUSyI0OsDtJp86rts8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722372; c=relaxed/simple;
	bh=0hhgfe2WXi1ahn9840qV+mSMYGiMeSrdhyHb0FUgWuk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bd868ZPFbUewqu1rKW6s0xlwxyt5Y5gahoKm/+SnHsf4KNPTqKC0rPEqbSouitct9q/bxMDbGlc6m4M3Q6rxuSZf1Rwy2tguAtbxlED3aLv9sP2i89vvgXKs7ggwPZyZt4wGLJH63/PiG4KAv2gyju6zG11XzpwLFzGmkNN/3+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tg5pBMkr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tg5pBMkr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933831F000FF;
	Tue, 29 Sep 2026 22:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722370;
	bh=70QUrPEy2C+jakZtbP1melXFFa0ag8eI30EeMF1VrRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tg5pBMkrC7KlvI/pEwe3AmrvRr0cswTfZZ9L4d9bGtuSRf1kgo9LktLUbz8U8lHpK
	 E9BEw1jYAjowOtdgFCXZh7fOqa2spumqh2WGmep8Sa1C3QrwQw961CB8z3wDWabgjZ
	 JE1ZATAU+5jii4C7ahyjGFtuq8CY5ydZFtOL5IAPwy8oTKfSPzQRpeYMANMSLm/Trs
	 aYPyXu3oPpJbsj5JQaaMt9qK/ta3NsXM+2XhKB7Z0a4VBMdKfvyWNBKiaB7qJ0t858
	 fB5ObEWnawcbiCrtEOeYa/PBIk6GV0EF7cMdBrhZ0Rw5JaDoLwhahsma70JwYJjNtJ
	 j4aaKhyy9pmOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/13] iio: adc: ad4134: Serialize single-read
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <1c61961b502fc26a08e43d287c94609feb60649d.1790719424.git.marcelo.schmitt@analog.com>
References: <cover.1790719424.git.marcelo.schmitt@analog.com>
 <1c61961b502fc26a08e43d287c94609feb60649d.1790719424.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 22:52:50 +0000
Message-Id: <20260929225250.933831F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] typo in the new comment describing `sync_lock`
--

commit b5e93b2d37821a8e474f3fdacabd2e3e420e3376
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Serialize single-read operations

This commit protects single-sample read operations from failing if two or
more of them run concurrently. It serializes the data read operation to
avoid single-sample read requests disrupting each other.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 4c8adb8efe4e2..db3cf69401f67 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
[ ... ]
> @@ -98,6 +100,11 @@ struct ad4134_state {
>  	struct regmap *regmap;
>  	unsigned long sys_clk_hz;
>  	struct gpio_desc *odr_gpio;
> +	/*
> +	 * Synchronize access to members the of device state, and ensure

[Severity: Low]
This isn't a bug, but there is a typo in the comment here. Should
"members the of" be written as "members of the"?

> +	 * atomicity of consecutive register access operations.
> +	 */
> +	struct mutex sync_lock;
>  	int refin_mv;
>  	/*
>  	 * DMA (thus cache coherency maintenance) requires the transfer buffers

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790719424.gi=
t.marcelo.schmitt@analog.com?part=3D4
