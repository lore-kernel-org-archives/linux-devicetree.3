Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602307;
	b=rVWiCWieBfHdPddKPFoJGS7vpGV3nhsoshaZJycF2mVpfRd9AaG0sTptrtuwzncqWsOv
	 +Mw4y6yQOaFaZCcPPuTFGioOt0EMapCORgfTgEh6USTSAWqpG8k0Wa81EjmVDvV5Dz1vj
	 el5LkikZEbLyNI0JcwMOz+SosxqkLNuv1dtpYDNug+zDhwje2TDZrb6hvTD3PmdO2b9L6
	 HzjgwmtOb+Imtzldn/A6G0nbP7Mkv7A9ObnJ6gehG9qMen7plIvCU/Mg5+Ux+fa4WP+pN
	 8nM6L5ogTIJojRSOh+GnuACZFKo2CP+dmt3ZNgH+MtLJAITH1jnEy6gS6HY4YSRL5+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602307;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fhACSDdImz0e4S0mOF6nbVER1JybejzenYhirq8T1sI=;
	b=jVKzT98f7nm6nzK9x76QBhaaTVf9YU1xopRZKh5aJ3oMEEYIc+MqTO1VkGykpwPRWIdS
	 zUFuTbWIn1bdNZLYdpSka8BQ2UnImvsPL3ZQXOi1hRt73OH8phPDN0Wy4U6xZFD39DTiv
	 bSBcVVfdj8jcGMzo85L9LyPdBBned/5FixGujCUBuTVpACEgsdROzdwol5dXEAHCiIoSn
	 kwkXr/CYvv+RFrwFHa0Df04tQblgQsfq4VeCrg8EQgKkz0e72LFf/AzyPRZnhLGyDw0fh
	 /MKj/NEuvxi8w/35kX29PhfpbJRMGMfgtGE9g52mGG6IimE/EG1+zRRQqkoxloAzkDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWkwdqye;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA88606A68E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWkwdqye
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7964D1F000C0;
	Wed, 25 Nov 2026 10:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602306;
	bh=fhACSDdImz0e4S0mOF6nbVER1JybejzenYhirq8T1sI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nWkwdqye0oRKkFwg/vRtmtyif5AJ8t2hrJgV+ftqHRpWLExTmHdZ3a3klnd8wNft0
	 mh4CnfpXLSJrQik4PgwW70IgyZZOnrskLAV89yQ/BYvF53nxvUt+D6sgWZcx3X3cML
	 dMtyD9FKg/g/dq2mHkM1dcN4K4wzQGrM7we1Xu42gFZd6fUeKMb8UUr5SCGl5nMB94
	 C6ufjzdJMTz67aGWm981pkeLNkaJ89dz5FvWPLwxKXtAA1flQwcJ88bDRaMyugQ7R7
	 fgPlxn9coKQuEIgJfGZkZntO6KF3haXk178nP4qaTYdRvvq2ofp5DiutlqRPpd5J+O
	 /HTu4n3Q32lyw==
Message-ID: <sashiko-outbox-233116@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] iio: adc: ad7887: fix on-chip reference enable
 logic
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-iio-adi-legacy-platdata-v1-1-54e4c8830b57@analog.com>
References: <20261125-iio-adi-legacy-platdata-v1-0-54e4c8830b57@analog.com>
 <20261125-iio-adi-legacy-platdata-v1-1-54e4c8830b57@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 10:25:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] iio: adc: ad7887: wrong rx_buf offset for CH1 in ad7887_probe()
  [1]
--

commit e57544891ed7d42b994441cf2725e2d373e5b02b
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

iio: adc: ad7887: fix on-chip reference enable logic

This commit fixes the AD7887_REF_DIS condition in ad7887_probe() so the
on-chip 2.5 V reference is disabled only when an external vref regulator is
present.

> diff --git a/drivers/iio/adc/ad7887.c b/drivers/iio/adc/ad7887.c
> index 827d0c2598ba6..980e6a3030479 100644
> --- a/drivers/iio/adc/ad7887.c
> +++ b/drivers/iio/adc/ad7887.c
> @@ -271,7 +271,7 @@ static int ad7887_probe(struct spi_device *spi)
>  	/* Setup default message */
> =20
>  	mode =3D AD7887_PM_MODE4;
> -	if (!st->reg)
> +	if (st->reg)
>  		mode |=3D AD7887_REF_DIS;
>  	if (pdata && pdata->en_dual)
>  		mode |=3D AD7887_DUAL;

[Severity: High]
This problem wasn't introduced by this patch, but in dual-channel mode does
st->xfer[3].rx_buf point to the wrong offset in st->data [1]?

drivers/iio/adc/ad7887.c:ad7887_probe() {
    ...
	if (pdata && pdata->en_dual) {
		...
		st->xfer[3].rx_buf =3D &st->data[1];
		st->xfer[3].tx_buf =3D &st->tx_cmd_buf[2];
		st->xfer[3].len =3D 2;

		spi_message_init(&st->msg[AD7887_CH1]);
		spi_message_add_tail(&st->xfer[3], &st->msg[AD7887_CH1]);
    ...
}

Because indio_dev->available_scan_masks is not set, IIO buffer demuxing is
not used and a single active channel sample must be placed at &st->data[0].
When buffered capture is enabled with only channel 1 active,
ad7887_ring_preenable() selects st->msg[AD7887_CH1], so
ad7887_trigger_handler() writes the conversion result to &st->data[1] while
iio_push_to_buffers_with_timestamp() pushes the stale or zero sample at
&st->data[0] to userspace.

[1] https://sashiko.dev/#/bug/linux-f8b2934e-4d1f-49d5-b745-1e7bf0447de1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-iio-adi-le=
gacy-platdata-v1-0-54e4c8830b57@analog.com?part=3D1
