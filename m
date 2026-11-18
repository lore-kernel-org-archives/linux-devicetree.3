Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795000395;
	b=I76hU8qag8ApfCzVPIuZFxTTkRYo2/ouksS80osD7mLtPohEFpLLdNRHxns/mJiEJi3Y
	 MdKHcJPWStpM91X5fZgixlRMltu9dSjhGYpysQXNSzrHwVxKlo6Zivp4C9HXqQSjPE5zL
	 35qRQVkhQw8PUJ4W3Yw1/CcJ7/JCIYbeCSqTfH+S5XnqO5bUFRg2gVMmbQ0s3sX6iLJVm
	 W4GAYbwhHINhk2Oh12WTbkZZoxV58j6xNRCHPoUlhjElPuc9MsCQkK92bUdo1VOYqNFa7
	 z6IX1Jeq/XMYOIf//wGwvp3Fwl4hgKmKKeHNs0J7X402GG66MIpoXM3ojg5tyMqoyWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
	b=hYjfmtomjTp4ZU6YBsZqqPU3sAgsecEgIdEcWkuZ/O0iRwOKNKFMhb74LIn+3vplQ3sz
	 MmMvi6SHX0wFG1G2KIbmW+co/W8+eF4XAbDF6x2GZdUwxlOrdDEIjYvdaTaOlN6YlYvXS
	 54qp9la2+7P/6pUnL+vsAMDdHpBqgXWEcBNg908t8T4cf0itgAEUXS2JXKHf62Kpquy2Q
	 H/ovkIWDxMmwSIkcg5mrrZZvU/+wOqZX7ccLHDU3k+KNEXbeFAW/WQboW4wAZxgQ/bCqt
	 jUBmO26zicQYQCez6v/QYVMc8zpYL7U2vGoKPgr0KNzlPNm0AEGoIMKlmYSIS/pzU6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4sUYzMd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B2F606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B2F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4sUYzMd
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4bc216e9dso4951397b3.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:13:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795000394; cv=none;
        d=google.com; s=arc-20260327;
        b=dvkkpbTj4k8+5J4580/lXjrMVq4zWMhAGlDIGlImdcnKQuMQ6whHUyZDdmDpqelFfw
         SwMMKYM4HQvsIYKL0/DVGZ97v/uYIg2yabFnM5Gu+4zfMdYN02DFVM+TKwc4YsJE4nTf
         +W0uEwNyGBQnEKz7zofJOKks+sXxYkPbrL+oVXE9S0pR5uC/PAjHyQAmV0eilOjRbFoe
         Ic3MI/jTycffLa38yOotMDNujUTZFAVbT3gfaZup2JyYQr1DNspLg3UIkpHkHH3NkdPQ
         LOEyc2Iz818MDg4Zbiln4xDBp+ZzQVxX5sj6l9HJpZgiH0WrLlYBf+ZALJVn+Z1TIRTr
         nYVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
        fh=Ykq+fL8MzT+aXszd6pgKaYpgC4eMU9H+dXpb+tt3Lqg=;
        b=limRaoPpSMsxR/WzFxPrtxU4NRkiUT6cb0jk390rbKWjRTkoalOwhu3M4EqXBWSVzd
         LPWQSTB1XF+qSRxh+gh6ZY1VEozGhJf9tm7sMDJmE3+kZ8eIw+XeKWZZb0hry7rf8NtV
         onvzVtvT/z6CE+RvEVdiKDHrdjQMI7cIqQQR5Z3gdKBMbFSWjh2K0x87kzwjfGxWp+G1
         0a8A2kqVbsp0XMG67f2OAukv+rwcBZa2jRJ7XjhPHbU93nWiaIAg2Spf4DJ7P9vvzI3Q
         Z27RIt5YVWNcIz10g0LWhtxtYr6SN4Q9XwXo+M2W7L0S1fRPiqNHBMHRXEpwsh9RBRFX
         6gpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795000394; x=1795605194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
        b=I4sUYzMdyqYeoqb6N1VjIj6+YP0hTl0H9tESRF6uNLuZ7JSKq2om1pPhbmysXqoOvL
         PMf/gvN3IUx+c7vvROpkw7+pTwbxyoUNm3b9weYYVfhwKUUY5Kw8tpqEulrc7HicLiAe
         DdXk2LjKRAFqlkHuoTRqf+a4AbSzasEfC3K6tMDtD8ro1tMBYOnv5FlPkj1I3ErPNmRu
         KXXI4vTOZbrXdXF9n9PnisY0pqnZ4GfDFdFzBtFWMqDAh2OS1v8U4PK9UwaFY+f/q+Go
         n/5TqKfP52/P0AyHb8zHhyiFTsnTnCltnPgSYGqdcrV3flHCpZ5zNmV28CT5y/Xp/Wme
         s6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000394; x=1795605194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
        b=ibo24Y6vQiUCaGjg9ZGvjI5ad6apvC0cWxlTnYIbHVANuYR2VlpGzjwaOnJ6HiU4FR
         e2IgofnXKh22UtSnYSLA+arc1QKhrTRQ6ZkwT6dayUy0zvA7iRu7wpAKtH6Z8mxQSOds
         xO3nbmmUgMzWXTOqiXx9+23D/ghAqaz43AH4KnmlGp+nx0QNNILP+5M2zRR+7nX/8Mzh
         mNHfZ0HmjgRU6AogHLf+UQEa+A08KohAeFe3V2DFMshqgz4we0HcU2pnyb8UCmt/oKp/
         NTAWqPg/C8Ms32NB2FXPDEEldZjyYtiJHbT7OJe9KBTgc95gskOBQBu9QLC6N5yS0y5N
         nUfw==
X-Forwarded-Encrypted: i=1; AL+hErGhAVzcBFRlYXuob3egBoY8CiW56FsfMRVH4d8dIJzdi6EMWUcfzWb+yd6ghw35BF97HakmvEpC/J0Q@vger.kernel.org
X-Gm-Message-State: APuU4Z/+prtMLZAZVZ8OqOI4qgosCN+WjtW/Ho8kYNw5DeTlBKcartC1
	pPx7AxXqKSoTNQN05oegzZ0OKv+MrSDDbL3EMIGL8YZwrx2R/zF0kgNAjV3H0gowSmBBDU8or82
	s42RBaS7h4tJs6jveM1GNu+o4iN4lyw==
X-Gm-Gg: AZFdTZckMSlS81opaM7CB6o5/gfg8DyavyQTZcbWvrmnwq5lx813VWZfchpEeTObSNc
	tado9xnhhmoaWDF7y27j5hYS5A3rgXbxw6Uu9p/K9xkr/EnJFcml7DkqdbaPgwzVVP2jFFco9e8
	iIzykMvSqeiVfstsDt/i/EP6FO1tzpDXtYWxT9fPKC10Ee0OrcjJ3g3L9b/7ILhTzxxF7hIGagJ
	CTHzewXdnzr5p/uOgJdpKImdAHj2pe+kb+PFqo5Qlc8wCu980ujdz9IWPC64w2rx1Xy5cwvnA6e
	BsGC32rt1TPcP1G978DyPEEK7ny2YhAMXJWpca5nd3CgwkyXsB3ypHNpO/Dii2dxuB6R5y7C1ra
	BPSu8FssuGGtmg4KQW1NJCbhn3MaOHU9cMyc78WsWJfwcElwE8Mo6O/W24W/foGQWcsXiwE7Wbr
	Ndq5s1NftXB4pQFdM=
X-Received: by 2002:a05:690c:720a:b0:8b4:fc2d:2fbc with SMTP id
 00721157ae682-8b4fecfa8fdmr6432697b3.17.1795000394419; Wed, 18 Nov 2026
 03:13:14 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
 <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
 <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
 <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com> <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
In-Reply-To: <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Wed, 18 Nov 2026 05:13:03 -0600
X-Gm-Features: AclHuK9n1arnwuviwRTqKqG6GX0B1k9jEh54QwQkpt5LgjUFE7LwWPEIi0qBPfo
Message-ID: <CANxy8yT4E474NpEZPE_6QHh1UJvj7xQEVR4mOxW759y75SBd2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

A gentle ping on this patch. It has Andre's Reviewed-by and still
applies cleanly to sunxi/for-next.
As agreed, the OPP fix comes first: v2 of the A133 speed grade and OPP
series is now on the list [1]. Its thermal tests rely on the 90 C trip
from this patch, so it would be good if this one could go in first.
[1] https://lore.kernel.org/all/20261118-a133-series-v2-0-8bcec9c9aadf@gmai=
l.com/
Thanks,
Rajan

On Tue, Nov 3, 2026 at 9:33=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrote=
:
>
> On Tue, Nov 3, 2026 at 10:47=E2=80=AFPM Rajan Yadav <rajanyadav0307@gmail=
.com> wrote:
> >
> > On Tue, Nov 3, 2026 at 7:07 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> > > Does the downstream BSP have this? It would be nice if we could port
> > > it over. Then you can properly use the power allocator and/or the
> > > schedutil governor.
> >
> > Yes. The BSP (sun50iw10p1.dtsi) has dynamic-power-coefficient =3D <190>
> > on cpu0, and sustainable-power =3D <1200> on the CPU thermal zone.
> >
> > The energy model uses the OPP voltages, and Andre points out that the
> > current OPPs are A100-only and don't fit the A133. So I'd like to fix
> > the OPPs first, and then add the coefficient as a follow-up, tested wit=
h
> > the power allocator on the K5C. Is that okay with you?
>
> That works.
