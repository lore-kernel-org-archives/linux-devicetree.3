Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6734540F8C7
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778274685; cv=none; b=RLnFgK7QiPCH2E36eWlvTxiEaRkJjp5U7etSjJ8I42esllHKKoM1889bkBA5AJsW6ejaZDqBUHBP76B/pPPkdfop4LW+l3jmIiv8r4eTPc8k6ywZMIgjBarYWX/Zo1Slga6DMmS2ZWJs1FvLrDcNbMyIsAr7c3nhK28RfjA5hH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778274685; c=relaxed/simple;
	bh=l+nlhjY5xPojgt71HzsLrEh+dkx4MY05wDb/gnai27E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VwtkSjmSXT3xG/F5CFIJoWPwTDK56TFV9WYkNzUgxBkWLYjMQL57qv5NtPiU6FdXrs7Xz9Pbl2B7m9t/GdU7DXeNS47xFvsNfjLbpFJtJ5y74GrLYUVWxmZxIAz3Dopzpn6+Yq2NjMjEyKkRiL93S+MspnfnjSssb1XTQvtWilU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=Ufho5MMb; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="Ufho5MMb"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5102582e23eso17501011cf.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778274683; x=1778879483; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A/zTtdaa1YwQ9yyHYoxpW5OZucW0IdF0NOBd+0VGB5E=;
        b=Ufho5MMbGyUeRHNvdJQ8CRxUNPra4Uob63fqW6y3nPLmOa0s7jK8zYJ9AYKfRx/809
         3qxuR9dtNJWIqP5aTQ9nZp3G+kmgh/pP12KlZiNbg6X8DxdjL1SB72e3YfeqkM2Mn500
         bSVMzWAZVnV3jtirmlxuEiKeuKIOtn1h8NIqB4+fimk8TtAH/AwtvclFQC9y/IunL4rw
         LeqRzbWeJ2VKruGZmck4ajyB/55XevXJ/zxY5L9WYgbosehNT+kI5wKlInDmII8b5WZg
         gK+4rE1eSyR5SXfFAj91fylJhrsw2NtZphfluYhaVbuXgy8EMltkuJf9SsD7UR/yFpwT
         vnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778274683; x=1778879483;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/zTtdaa1YwQ9yyHYoxpW5OZucW0IdF0NOBd+0VGB5E=;
        b=ZmJriPzn6WpqS7g9mmD5YVf12KmNjIejO8LEDHBdRAqhD8W17YjHT3MtZuYztWaNN3
         RPpL6X7h9zKXbbfGkXNUtTmcv/ZJjJahJHOLTdAACEvdxeuGj1WQ22d90SxD2Bi9SBH1
         yHCB1HD0eCk3uJP4iybi5WKZ65pey9USlg5qCu6qsH4fm7FLBG7/Zne81VFukMzJmjZz
         nBNSEtlpHTvoGCRohmWFOZIvKRUrDMZhD4VYpT6Mxy9cGVRs3tezzchVBqrik2Zxj9vS
         vZ/wHt5KhS6uj05ejuHPQfKgBx3+CdwvItMEY5xWOIy3w8ap+dxrViWxk2TmZyhkkaIX
         04kQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5F94ao5DK49FGhzPLbkph01OC+IXEACNH1C5xFHifP2dUJSC0BZYS2zReVCR5h/do5DsuAATE91Zg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy56bqRm9wvQjdFF208/Kuc7vC8CF1AEyzg7mqUy+yuwEcU8CO6
	SD2qTVFAdKykVNRDxCbSBQcLkmSyEMCt3YEadnIfy4Z+JFVw6OeaEpOqhwNR5PyGkQk=
X-Gm-Gg: AeBDieuB5BHwRP3mmdaHYBoOJnMV1htouJDKYYukgpLc7OJxjSLNB35qAQ3oKI/Hs6+
	RT2IBC5dl+IRkHF2uSoSVGzT327qbCYeOoSN5eEvpiUO7tJQgMr4+lTqONJG6zZWuxFUexSP6Od
	26hAhvqSVVv0I7dmP/20QRKTGILF+LQjfvi6dMmINxiaPlh4lgjLSTdcnK9dH87NE1Olkt/bCUI
	LoxkLIWGiq5qY5LH7bvd+XSm1fa4jzkfD/3f4wScVRQhqqgKmUQwiT2kZ5C6fiAqZwIyJosv64A
	vHwAPkl4bpsxw6KRpuhz09xWHAZt43JHbamKPBpSrXHuQMn39Of/hmN7dw4eQePoIa0P5ZeOxWI
	rs11MLSP4E6WMYWXxtiSKl2C4geq58Ab0uglLzU7gnVcdstSsIcIAvJsNoJPAeU5VVVx29shkIl
	QSxJt9wm3JTg4Mn0HroGd9LgtjwbgW
X-Received: by 2002:ac8:5fc1:0:b0:50e:6135:f27d with SMTP id d75a77b69052e-514a0baf33dmr1645561cf.53.1778274683142;
        Fri, 08 May 2026 14:11:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c7accddsm244356866d6.36.2026.05.08.14.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:11:21 -0700 (PDT)
Message-ID: <7cf0950e51e4917a0b4d565f71b1e8f2a41e4bbe.camel@ndufresne.ca>
Subject: Re: [PATCH v5 06/29] media: rockchip: rga: fix too small buffer size
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com
Date: Fri, 08 May 2026 17:11:20 -0400
In-Reply-To: <20260428-spu-rga3-v5-6-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
	 <20260428-spu-rga3-v5-6-eb7f5d019d86@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-yGQaQDvjZPV8X9fpmFdy"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-yGQaQDvjZPV8X9fpmFdy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 28 avril 2026 =C3=A0 11:00 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Fix the command buffer size being only a quarter of the actual size.
> The RGA_CMDBUF_SIZE macro was potentially intended to specify the length
> of the cmdbuf u32 array pointer. But as it's used to specify the size of
> the allocation, which is counted in bytes. Therefore adjust the macro
> size to bytes as it better matches the variable name and adjust it's
> users accordingly.
>=20
> As the command buffer is relatively small, it probably didn't caused
> an issue due to being smaller than a single page.
>=20
> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne  <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 2 +-
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 43ed742a16492..d1618bb247501 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -414,7 +414,7 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0
> -	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
> +	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);

So we had a buffer overrun ?

Nicolas

> =C2=A0
> =C2=A0	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
> =C2=A0	/*
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media=
/platform/rockchip/rga/rga-hw.h
> index cc6bd7f5b0300..2b8537a5fd0d7 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -6,7 +6,7 @@
> =C2=A0#ifndef __RGA_HW_H__
> =C2=A0#define __RGA_HW_H__
> =C2=A0
> -#define RGA_CMDBUF_SIZE 0x20
> +#define RGA_CMDBUF_SIZE 0x80
> =C2=A0
> =C2=A0/* Hardware limits */
> =C2=A0#define MAX_WIDTH 8192

--=-yGQaQDvjZPV8X9fpmFdy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaf5ReAAKCRDZQZRRKWBy
9JNcAQCO//sirngbNKm+JSYllfp2YXA0CvUHAWHjIfrCnXDPMgD9EZuVo9p0mPM8
jnoazaTvgdmsrGiaruiL+n7sgxk6owk=
=T4/x
-----END PGP SIGNATURE-----

--=-yGQaQDvjZPV8X9fpmFdy--
