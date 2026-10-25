Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792949894;
	b=tqy6VC1xYuXZGANnnLr70Z4V8pJldDOXJXPhU5PX54wN7p2plL60GL23lCCpmUgRjQ1I
	 u6Ot2uO9Ytp3X5T5L2T1/68HvPkkakAMx4yrBB7vHyjktwZ9Ye+n4EgIzSIoEu6bDrSBL
	 APpjmWNIHrV71b+JzOevorOEKW1IBQ2vhQfsC/1M6SZo2khplITJ1JxY+1c9LTU+RIFMO
	 4re9ouWxt4zLXYsQvnNo8iONsPHZfzcLpsz4WKDACnwNl3hYRU5gnkGISNeriO4ibBlAX
	 g8bpwtm6Znwlv1Y205Wi0PEp23SP4oMndoCuDWiKXgybJWjL47YmorUhCKVLjuGwJng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792949894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
	b=iOMgiOv+TPvPuGGbSDpiOB40lSLpe2wk2MNYYd/D2/LiqI0iLCj8TWe9PjggBR/AHU5D
	 7WjMR9Gc2kWSWcmjkAEuY6SadOJxCM1nZ65cKPu/rz7Az9NGL5RoakgsmXB9vthmniBDt
	 Pb6ktiwxt96to+gAfwZau6ACuPusGnLUz4dGnb/QIR/RUygUq1OjrU+6u2PWnF2Ohz8wH
	 SycPDXafAzV7tjZGK9rl11xyCPR6AtP7nQ2vYjZxEzR2gDymws4a6A/iLAVOlmcY73foI
	 cJk8RW8YmKAa7nfexIDgbPuUE2DiZXmIOJ0ILvGjXGWAQFnDpM7BnK5rpI585AtGo3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nIkPcrj4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90695606A31D
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 17:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90695606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nIkPcrj4
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9906870a9baso1228041241.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 10:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792949893; cv=none;
        d=google.com; s=arc-20260327;
        b=aEtn1LWHzjHZn80nfp9onlRQfWAZQPGO3lBZoVRXHav0LOygHuJqWoVAK6H405N9zt
         CNNuaqryN7SzMtSX9DoiGu18n6q1ncmT9aVOOxWbC8ipQ18ZsGFiKGx82WXiZ5mOIjvX
         LbY2Za6Tp5TALhvf3piyP0wqiTVTiQ2XW61TWAVU8dmoceqFNCwdPiT3jpi+riH03R50
         8Sy4WzcENdOrG98GSamvCjguV1mlvhHEtM7vBtw+X98I48e2GBQBe5qD/L4Gde3WKOQJ
         fkX74v4zGmmgserT9+ffpJywmJb3RqWhRVEXjz/lctIeiVE7KQmxYDz4lLrn9Mx4TLe6
         Xlwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
        fh=KWvzHbn6A06h7Q1/Utd59faBZnBaOihNEeCqekkhZUM=;
        b=bpwXmVh1H477xlLha+UGlW9KMVYTeIddfb4hx1QiP4QEkJKfZa1JV3GxAULdHaTy5Q
         B6HEgDKrm8FljWOtd13DqHVvURdHZfLlVtbj88XeCHkC7rxHf0nXBXCHfZgJgW3HRJEn
         hoaas8kYOpuqgZ19g96SnZLtzeZpbXMTFbSh1FbQtsy/v7ZGigi8kFdNy/lQE39I/DO9
         wFexcLCsrJzofuUGLD1SIpSO/T/qn2GRKjy8a52CPsxpg+bMy3+PNiydaMQZmi3Qefux
         IoMlIfjgRXVeoCQgti4TyVGxOI6EaBeI1hB3K0OD5ixr7KaihsNbnDClMRrcCYQ7zigC
         yAWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792949893; x=1793554693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
        b=nIkPcrj4adrfpAUrnBjpXJhXo/oI3cDEOj8KZyAVt8jj+1EStmwZqQx6GSUr11keuw
         w87YVz9pZMNT+G+C1BdlQnlBHofrKt1dh4OOzzwiKPq71UzNF+gAcValpDFmvoB7lG8G
         nmBVsbkZc3GW7xmnz2JnQCeo4huxSWLe3l9ead1ZSSoGlt80L5FzQomyf4dzsYjT/gUB
         9XpTqLaQv5GCGA1NfIwCYuxaQ6d8ANH3T28JrOdK4QsmRTtjeytvJHDrtiTQfRxvWNX1
         LR41TNA2Ed4NX5bRprt64EWmwRD+zEUUvdkH6Ro6UX+A8eaE+uCMUFZZkL9piVK9nvUq
         JNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792949893; x=1793554693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
        b=NpAGBG+ORVQRTy/sRkOn5iDtRbu7WPyNAQo76pQKAUOOjZgLvRtHFsypF0+8f2dVKq
         AmivwFJEop95sV4OBXoaH5ts1NuDNnQhY4nmN2/ThlvAzNeyIbNDvIB2P1tt6jcuqAKP
         l4H/5N7KK4Ev5cyGT2sW+yrBGBKve+FnnCWkPLJSXFyBXUHRSV0KVz0T3MoJ13IAFAYX
         iuyhqKhwZJpRWUHobhq3aYYcBzqODEcny8kJGJHbjOzTjj349Cd1OxxLl7Q9wwNw62MJ
         KrI5HzPrOQYw0uCLgkFgks+SGk8ZGpK84nGhfKYC/1Lu7wDQ0yppD5uZI40fRgTE700i
         SeLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXo7Wu0nt/ZlugfgLl/sE2ehOaLpEmDqUIksVvE/k40x+cgPJ31Em/5BlkUFkblCoMF6+JDBxm4Gpy@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7+oZ3oaJdj8JiagK83uui1zqHkKdTPGFPedwMWRsDcdNSB2/s
	SSPV6i21zK0P58K/eCH6AsNobq+7dCwy7+xoTJuzFHrcdpco0H0fnQQiavNkNmF3K37101d8KR6
	ROE6yZM3yFc+Si5sHl2pG3ibSGCqcjAU=
X-Gm-Gg: AYBFou0tmCf0NVEBOSfzNZ5YJcZHy6Dmdnv8fAL4l45xtPBo6XKqONrAHmraJOAaAmd
	SWcI2wSoEwp6Fhn4JxFFRhP4XypAgPUudPfkhQtgOcn1LA+9TsqebHNULMdD3rprSLr0oO/m1cF
	AKeQ9yAe9Zr6dDwfzwRNiZbf/NAtduOBA5ulBaSK+PMXQ8fbSImiJDplPjInvCqc7XofBq0p1h9
	jbO6kS4YsevWDyJFewZpiG7Q5HLRHd94G0JBhfajmygiurtOXdjq2ZfYC1XMj+nzwqbk/MAmYYK
	WYB85xPte+VnJyss1/tjm+pjyR3qmLUvJSoaYvyeHWLF2qPfUNCRH4jCT1mn+x+cCoTqBu5XwCK
	GBIgpVX3xW166MoBZ/KQJzIPLtuixV+jTmT3Sy46sKiKtMlXW3cMsaM7YejB2ZEH3/G7LL9/O0f
	P+U6q69PwYenf3viooUWIyDgTfhv28A5Hq5udNAsEu9MtPYpAyIgnIrEcIPKllNRLpQvd9RlmQW
	ik0rBrNeVNG0a20FOfqGkjpXsGrS5GdZAhOhErA9kRq1gzxo4k=
X-Received: by 2002:a05:6102:c8f:b0:7c0:4d52:8cc9 with SMTP id
 ada2fe7eead31-7ce5cc8d55dmr1213666137.14.1792949893405; Sun, 25 Oct 2026
 10:38:13 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local> <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
 <atywVnHU5NsP_gOP@ashevche-desk.local> <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
 <aty37_xHO-QRa7hQ@ashevche-desk.local> <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
In-Reply-To: <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 11:38:00 -0600
X-Gm-Features: AclHuK9ADptacPxgJpmNc7NJsHyAAEhwuFjXIctIvJ_VhKssk-2-2xQxAyeIEHs
Message-ID: <CADvTj4p1vxCUsNk98Q=TRkvtZQ4LzXNY9V-2GT30aspRGUgrsw@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: wens@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 8:10=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Sat, Oct 24, 2026 at 10:51=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Sat, Oct 24, 2026 at 10:41:55PM +0900, Chen-Yu Tsai wrote:
> > > On Sat, Oct 24, 2026 at 10:19=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:
> > > > > On Sat, Oct 24, 2026 at 12:12=E2=80=AFAM James Hilliard
> > > > > <james.hilliard1@gmail.com> wrote:
> > > > > > On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrot=
e:
> >
> > ...
> >
> > > > > > > >       /* Internal 8250 only */
> > > > > > > >       UART_PORT_AIROHA                =3D 124,
> > > > > > > >       UART_PORT_AIROHA_HS             =3D 125,
> > > > > > > > +     UART_PORT_DW_APB_256    =3D 126,
> > > > > > >
> > > > > > > Why? Besides the poorly chosen name, what prevents us from mo=
difying the
> > > > > > > corresponding parameters at probe time by leaving the one of =
the existing
> > > > > > > types?
> > > > > >
> > > > > > The new type was primarily a way to reuse the core's FIFO confi=
guration
> > > > > > table, including the RX trigger mapping. H616 uses thresholds o=
f 1, 64,
> > > > > > 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits t=
o 1, 4, 8
> > > > > > and 14 bytes. Overriding only fifosize and tx_loadsz would leav=
e
> > > > > > rx_trig_bytes reporting and selecting the wrong thresholds.
> > > > > >
> > > > > > The core already has get_rxtrig/set_rxtrig callbacks, though. I=
'll rework
> > > > > > this to retain PORT_16550A, supply the H616 FIFO parameters dur=
ing setup,
> > > > > > and use those callbacks for the correct trigger mapping.
> > > > >
> > > > > Please consider just taking the FIFO size from the DT. On some ch=
ips
> > > > > not every UART has the same size FIFO, so we already need to deal=
 with
> > > > > it.
> > > > >
> > > > > Also, FIFO size is a standard UART DT property, though somehow no=
t included
> > > > > for dw-uart.
> > > >
> > > > FWIW, it supports all standard properties for UART.
> > > > Check what uart_read_port_properties() does.
> > >
> > > Ah, that's nice. I hacked up something [1] in the past to get it to
> > > work, but that was probably before you added the helper. I never got
> > > around to splitting up the commits and sending it out.
> >
> > Hmm... The helper is in the kernel for the past 2.5 years.
> > Maybe you rebased it and it lost original dates?
>
> I had been carrying the changes locally without committing them. I only
> committed them recently to back them up remotely. So yeah, the dates are
> not accurate.
>
> > But if it's not working, we need to address that, I believe it should w=
ork out
> > of the box, because the same function is used across dozen of serial dr=
ivers.
>
> The new helper probably works fine. I can rework my code to use the value=
s
> given by the helpers and give it a try sometime next week.

I've incorporated that approach into v3[0]. The H616 DTS supplies
fifo-size =3D <256>, and the driver uses the value populated by
uart_read_port_properties() for the transmit load and receive-trigger
mapping.

[0] https://lore.kernel.org/all/20261024-submit-h616-uart-fifo-v1-v3-4-286f=
c1b8c3c1@gmail.com/T/

>
> > It might be an issue in 8250_dw.c, but I can't tell for sure.
> >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/co=
mmit/?id=3De7e0741fa04f349ad9f94a4059e32467a30ef5d9
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
