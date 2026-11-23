Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448209;
	b=5K9W05p+7ZY0fggSRMTcvg5HCOZGIpqu/SNTcn4aZ2HRRndXU3+vbYk3g53yNcsp2Bub
	 K/l/nuENY3ZvXTpIDA/vraONhWTCImu8b2yvCdvKcZeackT8NE5i2biYVJLBfGdysspyO
	 oCcuLtQwu3qjIzHmXaDBa4TakSK/9fprcVwJ5fNmPk+S20z9bwUNlEkzcvMFs8g97MT/S
	 yuj4WzM9VdQE29GaksHoy3kPOT9LkXFC3eWTTbxAlibD3YZZoXrSkmAIJMP0ZSAKrFp/a
	 BPQHJc9TePPnOG87KU522MDs1tUq0MOe8QpZXpU9JQdKxop2CNEUNkpvld/07UhHD3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
	b=Vk9x6AZCL5CvdEulLg+UyuQ1SLujmH/izyJ0tmwuJRogDWqSDjk4djZ9uXDI2kPbtoN3
	 JO4K2zKub3WsMLDFrF+FgLVApr3tIN6eb75i7ZPQqZ/XjGIzaztsWpCKDdnQfv5UuBIgS
	 fjg1/pG6pqaicXZZQlokizuEsc+oZQOoo/Ep6/1N9jxEZJeAsUFJVR28rAkaY0S20uL/o
	 zgzci8SIJ/8Id0EeIFK/wYeM5lSOL2ZuU7JBulD0gFuQh6xZhEuN3DaNf2j9iC2bgHM2w
	 q7rDrxEPJj8Zbmx/0nfm4/CbVmr527gIZA51KT5V5e+LuXfvmhmhpwt7Wz4ymD8BJjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhVeuiyD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3766606A333
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3766606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhVeuiyD
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38587f3de36so4151179eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448208; cv=none;
        d=google.com; s=arc-20260327;
        b=N6d1S4k7uPJGJF91xy1FoVRTsSyFChxIZKfJNAhc4Lys6bv2iMLNN7Ak6CNkrIeUQL
         OVsA97t7/aWXX2Vm6nI5+ZzG+PAAJXcwqZ4CUOj8wuWQXwHgWTYj6YYweexMjfSFlVRC
         iii4W1GguiBUsLsysEvCa+9RJZl76tohUjRA8bWjHxVuIcjC3ZfQWPi89YVjTGzbEZBN
         SVRqPNbDA4GoSyhEJyKhSlQn+2ErjvX56udyqIofODTLeDxEBirKH9ptU0uyWPw9GjSc
         eXr98w/YvmY9+p8SAGPpxmpPa98g9YIVhAn+ymktjbJShQcKSQgsDN+f0ukuDwTEFmUr
         xfnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        fh=rZdDUHRxH/h5JoL1bfl+koFRjwLYoBoFhJ6NNqvA72Y=;
        b=ZdbWfwcLb6PeTMzxcxESXrEuexXcUQXCCI1WBia/GRJl4Q1zbw3R6ML1+9XknuM7+e
         MWJvbDrZvv2wW+lPTu01F+sVcRzjKdzxoW5DrKbrX9ZwJOGcPH/D9nKsLmmatwusvxQm
         KyHf3PFd6cpgZ4HpwbfMNtaj/SfqRCpDaYjTej7Lq9tvjLYtq9PfMMn6Tq6X2R6tVRJx
         6tvNFktj2Xaw/nPgIjhnWpjOqp3ItN3NmxSBBTLMwp0b2ZLKzLeanV+WPYKBokfWEw7N
         +iaCaHyM8i/Zs27bZzSMdOep0qQpAyNtOrjTTxYFBazkWCnM/g6NqyIbNrGjsYQ36YeQ
         nbQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448208; x=1796053008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        b=rhVeuiyDGD6m7uUohgi9T0W/7eHgowCSzNgM6wFCIaF3tFDNkwX7vA3Ae2675ZGqR8
         zB6651frVOqzOa68J7FiE29B0IyQMmWvjYyPZYUxc4c7V0P4XfXFAed6Ww6FwyAIBHXN
         i0Gaexq7ulQrJBhDuPSVE2JVDW5nQYgL7VDuFrqsMlg4h1ZN+4tpb7QIsnoZNX7NuWl8
         hyJKkfxmyGDo1tKTEzjKYm0/aQ7KGPBLo1SN6/HXQQa2lImCFF/O/58GXvDDk0qWo0f/
         9qgqNhRcbxIqjiwJKCsQ4s7o1m+upIyOc5+6Oghf3OGv0MaSzHXP68pGCZJe3K11M1zS
         VaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448208; x=1796053008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        b=vpbJLFIrNrIAyup5nBLIxdclNJzcmWU9wtvGtoyNP2nzc5DQyb+SY3RbwIEbcnQrvR
         l5K67ZEXUTDlIheE9t9+0TTc1JO2vhLg0Wc7m6vvM+XrR8qWsV6dusbAuSMi6Paddm/u
         Z8/swnD4P0KAb+WkvirvcPtBsgvk1KcGWcGJhu4E/W01o89ATxXx1UppzZpqIKAUPWdN
         R4p6lMPbEWkMhkpnDH4CAvUEgdfi3S+2iORr/U2tEmwmgvcLU9GTYBoQT0mRxKA2ok+e
         7/zxxBjm0T/0NaJaSpcfNUud74yMm7VhRtCfKeboVpqgRd+KA+cTVP2R+B/jo2by2fUF
         Jhyg==
X-Forwarded-Encrypted: i=1; AL+hErHePtpPXuhYqehjcBt2ac0qFrxt69Z4QfW8bjHEilk1s8x0yzMX2NEYJA8EeCEVypKneFRgGboOHJNr@vger.kernel.org
X-Gm-Message-State: APuU4Z9HGE8/Z2jZGCgDGYhiJF5LTmj9q23WKtQMG5PWouoyLylNR68P
	k+CBTrpEjyA0BeuxRwFulGb97E5zxg5V9NvVD0ORfKxl4fjUOEDU7in/R9fkFY8mcY81z1AeeuR
	eqnpmfm+9LrgXsFlDyg/yC9IAsRtnglM=
X-Gm-Gg: AZFdTZcMTCQ7zzD0mmhdu8WKvv+rou17iZ14MZFwxaUmZbawiGjjfC+Eyf4EAJGSgcG
	y1MoeHLSiwPBLRXzTbT+nYRC4bRnwgGmIJT4VXK6G1fvSTT0j9bd4U9yDqS12DysOq63p5PKhmH
	C3ZCkXrBMdTbO2GT9RgfPIX8DnoRGa9bqd7/zl6H6OafLnpzUybDxTe41PYREc3ymWjq9svhm/E
	NWB5oQREaY4T248LVhEs63byq8XxXqtLO6PCtAX7Nf3I71ujzG3kLln2zbdkxkN3IdPsMC6FiRG
	qH9Zki9hOeTG/R8kl0oEbQV9PRn0Cvf4FSVsFfLGVXDS7IV/jEuofIaKM0s2LurNTj3keCJBjdL
	L7Fw9ICp86GIUxSk5n0w+LnR1L6W0P6VsTG4uv3pcFOPDXdx89ygcnz5a5hNM3DKNMywD64VwuJ
	p30utkvSnlObqmVh5nZf/UuIS0uA9nsUKfpz66dN7S/cnq6HIyHCw=
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id
 5a478bee46e88-3856c4b844cmr11761769eec.1.1795448207689; Mon, 23 Nov 2026
 07:36:47 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113161819.36847-1-clamor95@gmail.com> <20261113161819.36847-3-clamor95@gmail.com>
 <20261123145520.GA2412988-robh@kernel.org>
In-Reply-To: <20261123145520.GA2412988-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 17:36:36 +0200
X-Gm-Features: Aa3M54rUDkGOVQLPkkzUTzUHY6vBcwEurritNE5bPXzc3P_S34AV-IYkX1z3J3o
Message-ID: <CAPVz0n1sOsC2N+MWEZXN3DYGBgLicS=+e-q53KjBYcJtLiWXRg@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] dt-bindings: display: tegra: Remove Tegra30 fallback
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Cong Nguyen <congnt264@gmail.com>, 
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	Hungyu Lin <dennylin0707@gmail.com>, Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	Yury Norov <ynorov@nvidia.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:5=
5 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 13, 2026 at 06:18:11PM +0200, Svyatoslav Ryhel wrote:
> > After further investigation, I have found that Tegra30 requires a sligh=
tly
> > different programming model than Tegra20, the maximum VI clock differs =
by
> > nearly a factor of two. Additionally, Tegra30 does not require the
> > APB_MISC workaround.
>
> If the clock rate is a function of the sensor or input resolution, then
> wouldn't the h/w design prevent that scenario?
>

VI clock rate depends on hardware. If wrong clock is set HW may still
work, but be unstable, which will result in unpredictable behavior.

> Does having the APB_MISC workaround make things not work?

It does work, but my main intention was fixing clocks since Tegra114
does not work properly with 450MHz. That was why I even start digging
into this. APB_MISC workaround remove for tegra30+ is more a side
benefit.

>
> It sounds like things worked or could have worked with only knowledge
> about nvidia,tegra20-vi, so I'm not sure this is really justified as it
> is an ABI change.
>
> >
> > Therefore, remove the fallback compatible and add a dedicated compatibl=
e
> > for Tegra30 VI.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
