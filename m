Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988107;
	b=TOaESedCJnDqFDFaoJKPBGs1V2gwrGR7Hzgm1fTGC2PFluQT0E2g+bmSjwulxMpzi9DX
	 LeDhmsffO2nWEU5zX8Ff6hYeChnN9ybvzecnlT8zzWKTlyan1o+otUW/ds8rreKLYI8Ev
	 7hWQkuPWymQr2YQoGCpBdnznxkuTZD7hWbkKKsdj9EsMsNndmFhyW0pbaEx0jHc4jB4uN
	 A/fwZRZlL1YY737FcYli/1e+KquYX/bQqyhuswDR6tFSOFegQHPRI+fa7nFHEuwObTSmw
	 oyFWe8El43N/h2a9+IACXHFkWAujsoXlLuJZEnHdU0s0o62ajNdiC8FRoTWOv7HgFLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rfa2Ndd+oOG8KQIoHfUwwZJYDQDCRfNRCZHUN7HT2WM=;
	b=lyAEjSyT1EqPP2UybLCkXv45Dxo4shV3LU2CqBW7/N32PTrRuxwUe0ur4Ag8nzdDQGeZ
	 8aBzu3tObyarfDLvHFHEYL0V+bLx7KX8WOWYyFcbfyzsLPSGDjZO7DFE4nvHxDSg4OUph
	 KKwwhjbkkseW7m4YwZixtLh8GwR+XKKGe5/Zvep2LBUvwG1115aei9LRTAsDS/jJ4n6jb
	 kTWFma8PqcteczpGBbHMSlEgcU1OvsFRiaB/Z2LTAh1gQwVCR915gHBVBELhRCBDc9h0p
	 XdGzSHEhadeMA5Oq8m06vSWDV4o3QpmGH3mW5V1lXk5qiPf1xBc26LuiUJtaEqV2rVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lVOkRoXE;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9B606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD9B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lVOkRoXE
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso5881165e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794988105; x=1795592905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rfa2Ndd+oOG8KQIoHfUwwZJYDQDCRfNRCZHUN7HT2WM=;
        b=lVOkRoXEQv03jFeLFmgGaDFhyaUWdtHCGz9SJdE1T0pcYuPc3Xv6qZ419qMYrIoPe1
         OZR8t/NNRoG9/FOAgXcvzu1eBy/bUm/V7LaAGjPyWnnPwnpNFkSBEQHMlpHqQUdxpe20
         DMfAobKzMwZkhZcZhN37ybCSCqnDIBkeg1pHw1qH3PwV1q788E71DPL4yHonAfWjOJ4P
         1KlWbP2/sxrPXrAXlfrQdCM3IF1g42GoUjwfyDtEojrJrAcuFbMhW0A53CXIbS7AKC2V
         +tcxBvBShBfC0OY6OAs46d9ceTKbYBUaxI/inJOX8b2GkpT7je5hAizsTnLa9CYHVF1r
         ztdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988105; x=1795592905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfa2Ndd+oOG8KQIoHfUwwZJYDQDCRfNRCZHUN7HT2WM=;
        b=Nr9FgO2BSt7o8uyEPG880PgUTtWfnyjzhl+AHbRHThcFhYYzevjSt1SlMZCnLPb/ZA
         w09SKYYHRdxfroUm23DDz7IQOb4xYretOCOfaDYxIg+GQvmFXXdtaoUPkB2flQGhTf68
         U9bc8VAaz7V47XXUxREO84NBCvTTk+oHKQqyE8FOaGAqIkfZVj3axYhgzG4px0mlUDaB
         XNt2mhOjd6QqwkimZv9DMNVBFLJU9hJkGYGdaWAPNh2WaKw5cjSnJJHMaPJluovJL8KK
         dHYB4aRu8IBlH7dc5n+6zP814ZTqkzkWZ0MSGTp5ne8utWTEsEYhYPubfTgp0CdgjxRn
         lvwg==
X-Forwarded-Encrypted: i=1; AL+hErFO/gTyM7XSlxD6vgw7576OjUiA/a8MR4DNrSTFXgWA1S/HV7jD/UglTHBwiZDpC8GktJHl4qSS21QR@vger.kernel.org
X-Gm-Message-State: APuU4Z+mtY7sILUs1AOwU00GphebSFJM2TzPBBdj5Fo85KToASACvmxc
	HpPdR2q4g4W+9esShS6IqciTrsBTZYO/XaVv3pkBPz1XyioNs/3cTDF69lEsRLrasI4=
X-Gm-Gg: AYBFou3nVqOMeGljPD8MzOCAGIf4s7G3hFVKRAcXVLzjkUSdG3WxtvGuUbpq/rAHOpc
	i6otTghgLWo9AE41n5LFYc4PVltLQHDxBVP01bwos6yXyJUIa88xPo2u4NZRI6ewg2FHAs48Bd6
	6t3qYkLpLWc5nYvdGC1Va18xaq2n/FfVEYTCQtiRs38bksHcSXGsDF0X4kSoYWe5Yo7T83V/Bce
	+b08SkCbT8NbTrVtYS32jyNUhfpPug54fpeR1p28siSRG2uWQ8PCQnqKYppQ2v6W3QH6qX/TklG
	Rl2W7rYtEwM7eVq1qoE8YLcxKmVog3B8uxRKThSQzZW58paq3nyhldhGTImxONeq0Tqr/XRYPlN
	NqW5tJUqx8BkoFWInFecNRVaI6nx62DSnC1i9kPU5msyKtus4w5KsQuLuvgZrZNnsVYhuWYo7AA
	Zzhymex+7iBLxHgV3AHBRnPEgBWSPWGPRbDRvtFO67OjdHhEB0SzXAntafCalr1o2d2kCyi5Kj5
	c+6kp9hHe9wWNO1bZRTM3ddzXY8fPVTeXO5CWLcfi1BQGCpJMm1aNmOzmG5vF9uy1JsBcCTAub9
	P9x8e0SDufZVm0RlneBWeBM778ES+5IY61hTAHtj+R1yjIjCjRDwt71G1stlftsywVfjIDL2n/P
	A0Uqd9YDTtvcfaP6SEbEtXfgPanOpz8YoeR4a
X-Received: by 2002:a05:600c:501f:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb7da462b2mr31427555e9.29.1794988105583;
        Tue, 17 Nov 2026 23:48:25 -0800 (PST)
Received: from localhost (p200300f65f19a904dea20c2220232395.dip0.t-ipconnect.de. [2003:f6:5f19:a904:dea2:c22:2023:2395])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb7d001a64sm47962885e9.0.2026.11.17.23.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:48:24 -0800 (PST)
Date: Wed, 18 Nov 2026 08:48:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Adil =?utf-8?Q?H=C3=BCsrev?= Tepe <tadilhusrev@gmail.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/panel: add Novatek NT36525 panel driver
Message-ID: <av1XyXE9VsmDQuyo@monoceros>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
 <20261117173319.1852638-1-tadilhusrev@gmail.com>
 <20261117173319.1852638-3-tadilhusrev@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a4po6jazqfpixeh4"
Content-Disposition: inline
In-Reply-To: <20261117173319.1852638-3-tadilhusrev@gmail.com>


--a4po6jazqfpixeh4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] drm/panel: add Novatek NT36525 panel driver
MIME-Version: 1.0

Hello,

On Tue, Nov 17, 2026 at 08:33:19PM +0300, Adil H=FCsrev Tepe wrote:
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>

<linux/mod_devicetable.h> doens't only give you a definition of
of_device_id, but also pulls in a lot of unneeded stuff and thus
introduces useless build dependencies.

<drm/drm_mipi_dsi.h> already provides of_device_id, so just drop
<linux/mod_devicetable.h>.


--a4po6jazqfpixeh4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr9WEQACgkQj4D7WH0S
/k40FAf/TncjaPwzM6TMWHC0aVkQVFbPwvWHgOtKsJALddK9tvV9iUEX/t3z4OYC
2Pw0xd4BFpl2wkMQ75SUIuvye7326vcAZeDzEtQlPBth9JhC33iVimAMK0FpSsvE
0/AXXkTDUE/GAKaEvDsQ3bZNimMNNhB5LADAei5yAPmVh4TbBc4QHOP1cH+EtYXq
8q8BiItYRchUZoLNDWHmjHW4oTYTDLFfPMMmp7hTATYVDcwtjD1RLvwMLpIHqlQY
NJ50k0zz0HuXn8C//vtaTKTnNgur9aBJzePKuKDs4u6cYqMHewZS7a7MYuj9wTJk
uitb980Rg5LMsiRY96UDrtZKYIYheg==
=WQ9s
-----END PGP SIGNATURE-----

--a4po6jazqfpixeh4--
