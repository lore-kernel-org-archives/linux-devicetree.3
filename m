Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119055;
	b=J6kQ9t4OfqgKZaKuzuact9GCJhpqb8uDLtDTt0TyXd8xroUymy9r2s8wnd0RtmZozIxu
	 yKql+wkAws3jI2GGitVDGd8m40i7R7DM57a+la3qS4Tn6GITESAQ4GhSq3eyoCZD/baHR
	 gr6PD8Zm9LFgOdDBsOv7hFzYFSNBHALt+teeyXs8fFUPnvfszm2wi5okwUamU3E+nJfrI
	 yIP4GB+pYNdeB79E+9tMgo/VVa/+EjYz53b/wm84s2U2Ylc4BSjumgAgVZ5y4wnJ2epp0
	 HkqrW65RZK0s1hY0TovAxSRApbdvT/2GJNO8H2DOvBtOyXlmKq1peW/ugw5xuMzWYGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=8aqv+DwVQzSb2PSvDQkheb2OINfUMuqmq/Dn5ckO2bU=;
	b=HXS4OvZ39/EzlGJrWL0z2utkOLQQoeMFWpJ8F/wMVLnAO3g4j3AW4+MOGlPDdgDMacAR
	 YBpbwgpJRpvhRA2tPRfkEiCMGZfjcsiKwD5zd40zcmr6AVZQNCaH9//5C2zsQ/UEHAUkn
	 Uxrqc8FS+DfvMA5H/t51qNa6fcRnBrYUn3l1ZCf9EUV85GWgrAZm4Oc4kj/l/P6VHP0mT
	 vYuDU6+tAeKUfPnXfrTtc2JYT8xQyXqqGQgC2k9IhYImrTHYt6rR8xQAX+OPFEje2XGmJ
	 knTtxjgq927nTaZkrU22XqNNxNA3G9j0fr3VlWd6nmutBy5mceKVBOVnSJmgKXCSTvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hyGQcQ+k;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8947D606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 20:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8947D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hyGQcQ+k
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9496400270fso15222785a.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 12:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795119054; x=1795723854; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8aqv+DwVQzSb2PSvDQkheb2OINfUMuqmq/Dn5ckO2bU=;
        b=hyGQcQ+keDK2b+poWfXaBz3rTfz1FyheOYiUzJEERYAMhFZyAu6PuvsqtyX6pjeesS
         RPo/zf+sr9tDJlWK7LXyI/JwnAF7qkNwpYO+juoobzUbk0BUFczoNvQWEGADycDW2iwF
         y7jXJjMSOIhu/MUmTcjReZe3qIh+eFzLgqwR6LVOhkzMf0koL12QfW68TIcDa6ESyTAX
         A9hpOxUza4P7LOMWuFbIYg7gicCapbN+ffcwUDGx9yF0j4jjlLHoiZI6aajcrdXNLT9q
         oyXtSD7jOBruYl34nyNNIo/0UAbvOlzJE8VI6uN8Ph4wXC/te+u0l1swEJRdwwPBFBRP
         Hcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119054; x=1795723854;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aqv+DwVQzSb2PSvDQkheb2OINfUMuqmq/Dn5ckO2bU=;
        b=1fdmBToiuTj7Uu5tk4JbinSVq+V7Tc8cO5zOQgX3HUCDIrLyy5L01ai6OIIfqHVne8
         gmQMfnQCp3hPGe8iEi0/DimBtN///RFwTnXdYAmiiJWrlzVAi0ZDnYDl3lpUFoXcFF4p
         TTeH6jyGFphB1hPt8HtXuUGhLqMw1S+kv136umf8//EFQ7pHAhRY+oLCUL18AMcraljg
         8W2K1xs0MiNIq5PI8ZX9y41fJeWHR6M+fEWyFZaZdRKg7+OFQK5f2L1mu104Mrxs3yzJ
         BJXCUyHJLm97rZ7IVWGXvEBPHCrULt/ojOnXq5Wcxon5U1Y0ORyeFapy0KdIz8nCVvLp
         oI5Q==
X-Forwarded-Encrypted: i=1; AL+hErG93QYO9KOdhUZUlPOn3lJcYaWTnr7uUokCqQ8N52gcHdUHmG4PZ47AIJJ1ObLlJ7avUKXR5/62vd9Y@vger.kernel.org
X-Gm-Message-State: APuU4Z/E0vPJgFlPnbyB9c3UhcIDUKOY3rzVEsSNAnREjXZs+5wR249B
	0oEqvFuEteU+ABAayd9yEORihcxLtDzg5c50dneJQTGrJbJfhKpXGPV3VgOOOxEV7XE=
X-Gm-Gg: AYBFou3RuXendSTQdp5kcUrpSS4YHkMTxxnV6jt6F1xxX8UpJT8LhuIH/x70eMIa8tK
	w12jeCmwy7IFsQhFA0tcGb3/LvC2f+1ZHHigjqzKsva1Mt1UstPD9S+gpkZjcY9GieELxnqpxU1
	2/CAK5+6fZ1X4ELfI5dc4JadFs+Qoveea65AxoaYWq5T3Y9fKdU46KfdW2mua5hufcmsgT82i94
	FZYrleFkzXNWjhS2VJIY3bwmdrPA7zNt1axTw7tRORthUczVqShzyMmUZSmQx7Rrn31nc3cILBW
	g3HLIYMwgE9jfpRX5hGBOWEDxmWM4k1TzNZnK+nwHNlzhA57fzl9p9n5dO9I7N/UOkTEBOqQucB
	dEUfIvh8ZP7lIlc9daMejfnsnygyX6QkmLqkbtSDeq2eKdpsqsbp/fXax6/G4wKljTUurYtIagx
	gKSPaAhnoId0RPfqN4e7LHPkkFY+c46BeNUxFaYYA+t7DcLYtW9Szi5Nb3eaohwERY2WqsjtYSq
	Aiss/b+azsM9hxo8RARghNWXX/+OUqzqwDnojsEyEj6W5z9VKIMsA+ShVnbv0FHH+gIHlvEmXhA
	okxOiMXEnX9P8arEyLWOLQtI9/5T1nw7SyWD+wxbHAhjo3afsgQnU6k=
X-Received: by 2002:a05:620a:480e:b0:949:7502:6a5 with SMTP id af79cd13be357-949bab2275emr133918285a.57.1795119054458;
        Thu, 19 Nov 2026 12:10:54 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3ba04bsm37578685a.24.2026.11.19.12.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:10:53 -0800 (PST)
Message-ID: <91e8a132f2ddff24b30c244dff0a8389afa313fa.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 03/28] media: mali-vpu: register V4L2 decoder device
 and add querycap ioctl
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Thu, 19 Nov 2026 15:10:51 -0500
In-Reply-To: <20261119153758.1426673-4-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-4-charvi.mehta@arm.com>
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
	protocol="application/pgp-signature"; boundary="=-68tdt8CJA0v7u8ZWQyHT"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-68tdt8CJA0v7u8ZWQyHT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 19 novembre 2026 =C3=A0 15:37 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> Register a V4L2 M2M decoder video device for the Mali VPU.
> Add open and release file operations that allocate a per-file session.
>=20
> Implement VIDIOC_QUERYCAP to report the driver and decoder identity.
>=20
> Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
> ---
>  drivers/media/platform/arm/mali-vpu/Kconfig   |  1 +
>  drivers/media/platform/arm/mali-vpu/Makefile  |  3 +-
>  .../platform/arm/mali-vpu/mali-vpu-device.h   | 15 ++++
>  .../platform/arm/mali-vpu/mali-vpu-probe.c    | 59 +++++++++++++-
>  .../platform/arm/mali-vpu/mali-vpu-session.h  | 26 +++++++
>  .../platform/arm/mali-vpu/mali-vpu-vidioc.c   | 78 +++++++++++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-vidioc.h   | 15 ++++

nit: I'd say rename to mali-vpu-v4l2.c to be consistent with nearly all oth=
er
drivers.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-68tdt8CJA0v7u8ZWQyHT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9XywAKCRDZQZRRKWBy
9Gk9AQClEgbrQYsilxSJEOtw7LEwCrwtEVoSpQ1tbx+me1p3KwEA6yr3WzRocwTb
/VnV9DMVgAS6/9EfRVX6UUJhsXdqnAI=
=Gwtb
-----END PGP SIGNATURE-----

--=-68tdt8CJA0v7u8ZWQyHT--
