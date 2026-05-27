Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20580402B8A
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 14:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892950; cv=pass; b=E5f2z66IEcC4GnCcajYhlIW0tAj2P4jV5V5QHOCZuRTK66UUtjHHmGsjn4y7Zstd6iT4jyM0Riz+d8YNGlSUhNrqWcdmW3V3+OQRdqSfnqv5eIhjvZxolILIvFPKInB7UPNBFTQACtV+mrJBI+WvyXiWOkazs2VQ5sF8m9kIZm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892950; c=relaxed/simple;
	bh=Wkjf0xfD0fgdDS+kPV5B88MN47vTkuZEVXzAIEFeTRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4sI2bujjyMz6KVYKTGgDCmFd/n3PIC8gy1U9Uk2KsCAJr/FTkR+oY7l2GIpF7jqSrS1E4C1kgDk/pxuN/s7fw/QBKIat5WQ9mIHhQrAuT4BjuexNVFF1ktpV1pf4NDheOlNd5Dwnh69qoDyWDjTQWW/mYP4OKEyu5c0TK+ivXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLswE/Vs; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLswE/Vs"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c6a2158d3so8571085d50.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779892948; cv=none;
        d=google.com; s=arc-20240605;
        b=L+PcWyuz3n5qwBBFDyDSpXqS9PWCT2h9Egof0HeRzv2sMs8pT1auPFWfF4nyC2FjkD
         b24Y75AQGHmuOYLe5aSaqYnit52841w5HXE9i3gEBpAe+rgcqcjZYj/p8fQmW62dhqfq
         0DpK6j+ZxKKkL57s7kQ6tzCJyg7k/A9LcByUIkZmJWgmAag/JLW1IpBkcnkni6t5nApo
         OJHt7r3aa6csGTqC3H7nb59Kb2s6p08cZ2nAPc0/Ef63XAj+67KUIH/9QUdHTb8RgqpA
         RsOslgbdpE36X0qkfUv7r07qhPadjnpIRnKuVQPxc9qHk1nNoo0HrRvM/Fk3H5c0HRUX
         0Xqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hlWIP+UVVvtbpjNyLXvxi0le4H6Qgzv6+ziP6V6KTS8=;
        fh=OCkUrkuNqooVV0lunNeUCL0DhrrWGvcX25K4yMNoJFg=;
        b=UF7O2fDpCnwhAOEzFftb9bQKbE8YmYqT/hQUvHB1+yvHKXoBMpBPhv1czkVX1y7NiZ
         a29g5Mv4aNfAUgyVcgIEEIKKZdf/tWsIx1h4CR4bh4gknp4bjLIuIvoJIzLov5+evfcw
         PoklKT+5d1r8jsXzywUjgwf1gOu/Im2/OH6otQcG/rtLesCwdhYSPv76B+Z6d8HD12QL
         8LA+eU2ipZgc4Vj2UHl3DYH6ajBgISU4gxiW43UilkNcFKD/UNq5V7EMiLDpY63OrRLi
         NSTiGBkhCqtRw/bBjgy+HR5Ncj9nm/0FHufdNCAbRKSMcbe9zzbdMZsdH2fHfa/gh7Wi
         04Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892948; x=1780497748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlWIP+UVVvtbpjNyLXvxi0le4H6Qgzv6+ziP6V6KTS8=;
        b=MLswE/Vs49DsA34EQyTLb3fN8q4HfRoJHVe7hJ3EZJHriNmCWMHWLfWdaDKqOR+Z92
         oBxelXDr1GsvkiGRHHak5Jzg2pOPB9D+JJNo2W02ug4noNAqfIprpSzu831vJIqsoNFb
         MNowTIjCz5SfR0XGP/hE4F3HL3wV63lBsylEOJIM3XpTX54z/Nn54MUwZcLjVvVJnU4/
         KCYgRhL1ZsvNZpzxV9ZMfoU1sl0F2JvR24i2fTMlBTVZpA7CwU/Tog+WpbtJannhRMw7
         n5tWgWFV9hjS4fC5AIrlLoyq5PaFrwLmZE49w0PM4Bdu5l3MZX9l7RfuAts+9gNheHrg
         8Mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892948; x=1780497748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hlWIP+UVVvtbpjNyLXvxi0le4H6Qgzv6+ziP6V6KTS8=;
        b=bkjqQmC8ShdDfiT0/PWbi7dRygkWoRfuQr00+P1UcJrMLYvZqyHXvcrNkUYvLeH8wI
         s54RhxD/DgKS5Evb3519rZ8hJ+qvc2yuXegNLLBPlIF29P+QsXCz8Z0tSF6f5uGGiJM5
         T8Qnv9lY+FzjqdsU8TJZkjpxutopVQ39q7UgBFRke/kkMhOfnBrNLsnJppmPTz92iJyz
         OkcUH38yUPXNcMZBdHoxlrMsfPwyDz3vJoCLFcfUEZ7pVYafbniT8+DKfsDAePa4i3ke
         raZzG7aX4ZSkKPxLb4xcf/r8bEpZVdUPpDBolakc5uHYJRkafD7EedhwuBKSGu4TZR2l
         ZtWA==
X-Forwarded-Encrypted: i=1; AFNElJ/Cb8/Lx+i365buG1DbriVPd1MsQYEM1p22R9BcLfXZjhyoQoeMTR/QtRDNq3CkuikBFCOuIwhChHQz@vger.kernel.org
X-Gm-Message-State: AOJu0YzDTecvmOTq0l3TdjgYn5fxIOPdUohOIBwW0Pur3m5Jq7v4PAFm
	5KUM0Ix3EuRPCnOZDIbjScl54LxEN/ZUO2z6z6I02eQ0E2wA8JOzKxdjsquUBkBlC9dYq8NzNi3
	ORuQelL9aSGC5yB7eDHFzMeN0qOxYplU=
X-Gm-Gg: Acq92OFIoQBMXa0/1EWT4Jel2IwxXxhXGIEwcyH7LMy3Ut2K5YqqkL7XQ/shUZYO/gP
	HN0RGu/uAiYh7Nq+5txnPpKrui2Xh/H4tcIjVAgfSgjvBzytAWNkpJm1j68thrhETdkBBjYegZd
	ed1aRVv3AhJILoXcqYZ59t4ZMjiUR236mCNmNQGHC7BvaGErMI+C4pjx7zX6ZtEFs+ACmgZl0Hh
	MWF1NJfVz0P1pu+73/Exlj8KNWsCfEEfUW2VJ9+UxQap+W0RmaTtI/Qy2F7gh7B94DvrR+y2N+M
	ps7AurBbLg==
X-Received: by 2002:a53:d053:0:20b0:65c:5b88:84a8 with SMTP id
 956f58d0204a3-65ec966be89mr18424914d50.14.1779892948116; Wed, 27 May 2026
 07:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260524205112.26638-5-wafgo01@gmail.com>
 <20260526173616.256fd535@jic23-huawei> <20260527143515.102794-3-wafgo01@gmail.com>
In-Reply-To: <20260527143515.102794-3-wafgo01@gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Wed, 27 May 2026 09:42:17 -0500
X-Gm-Features: AVHnY4KqJRjrOALhnhkMuN-1YF-kxouvAtTfdFTs73jWaX1UNoZiFjbArngVtBQ
Message-ID: <CAKqfh0GbHLALg8eEBf2EtmKXAsB=H7EXL=6D49yaNWiMutycvQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/4] MAINTAINERS: add entry for Sensirion SLF3x
 flow sensor driver
To: Wadim Mueller <wafgo01@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, lars@metafoo.de, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com, ak@it-klinger.de, 
	linux-iio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wadim,

On Wed, May 27, 2026 at 9:37=E2=80=AFAM Wadim Mueller <wafgo01@gmail.com> w=
rote:
>
> On Tue, 26 May 2026 17:36:16 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
>
> > > +SENSIRION SLF3X LIQUID FLOW SENSOR DRIVER
> > > +M: Wadim Mueller <wafgo01@gmail.com>
> > > +L: linux-iio@vger.kernel.org
> > > +S: Maintained
> > > +F: Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> > > +F: drivers/iio/flow/slf3x.c
> > No need for separate patch.  Bring it in with the dt entry in the bindi=
ng
> > patch then add the .c file in the following one.
>
> Done in v2.  MAINTAINERS hunk is in the driver patch (3/3); F:
> line points at drivers/iio/flow/slf3s.c.  Series is 3 patches
> now (types, dt-binding, driver+MAINTAINERS).
>

I was taking a look at the data sheet for this device and thought it
was rather interesting. I'd be willing to help review patches for this
driver if you'd like :)

best regards,
max
