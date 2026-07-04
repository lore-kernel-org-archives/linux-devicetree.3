Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3DC25B099
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 18:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783191185; cv=pass; b=FcANs85y508S8oCIH7aAM7T/DB1Te1F9+i7y2m8D061rWdOts8dxblNFHcqSBWlPj5yU4z1Xym3XxEEVXSzHWP4vw0rRVbbPRvn39PhXwX/2HE1xgiuF3kGqAjUce2s+Tgk6Bu4M81iB4iWyLYAK3T25YzolpeJwxV8aTFMQCkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783191185; c=relaxed/simple;
	bh=GfnlmAFvUSAqS3ZrwBAbcQ1Hx67x/lz6NtI32WD2Khc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJ6A2Bwg4vp76acxWT21t5btoFdBWYeYMzhaJWIMl208WStLfS0D1NzMg0xNxMJFApTLxXyOLbdNHtwbt4NR32M/3+6mSf1yLUtR6KBcsZTAUhB9QIVCORYoVtobeHa1tGr8dzwLYSxZUWXNXwTQ5OfgZViSCVRoHtjVpjK7D2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBl9N54m; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBl9N54m"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c12620ed112so210313066b.3
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 11:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783191182; cv=none;
        d=google.com; s=arc-20260327;
        b=AHd7tYBhXgLEHzWctf6MKArAfXJjn+7rZBT2JF5qw2qL+JQhV+necIQ7Q7pl8mKNbR
         +COnRIFYV74m33CRaMAam//0ZqQWChXBQzUMlqfWqLJ38eLSZXtECi+B2S5O4PSpaOJx
         RB2L4tpfY4TcNDoXoXMN/R/DzLSwr3lInCS5lDPb5r3wlqpOgxX4YLwz4u84awdS1vc1
         OrNcGQYwwlUZvbAwm7NnA1+pBLFNQ9V0shDILKITtauVaPOw6b+eK1In6mHa/oyS+zf+
         WBAflVH/iAG4j3NLeN6RPxLZV9xUgHeIEmXVWJwX7NwrAdCmHrz1jfhzjFSaLKnZ40em
         YOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f+BkGnn82LQN6bHnpZs3JGZAnAhIdCPQEanxeSEyBEM=;
        fh=dOU234rnuwVCi+kEp3S6aMyQLTLw/IeSulgGVgIq/aI=;
        b=H4CAaBOhGHDfK1ZFonj5c2EltMTKmWd35SaixVYrJMf8bLPVZjchd9Nmzzs0BL56xl
         dqZDpnALKelyJzRkeZ0xS021ProcAXiqCLpc1llEOQ0SqkKh2sLzmU8+g8QMLoAPkwF6
         g/u6JXB1cwYV+YEFOVnwoD+dFfsD6/p9Oc4lmiqZA48nmgHxRTgE+k543ZRJzS8nYkHZ
         mhEE94e1aRqcP2MLPvJF9ySregMQLbb156LB2OIewEfGz++3kBd5kxZs2adzCW5yBXM+
         cT23NH0BcrhIA4gNBX8mOvJryAzPQlbSuqA8Z3+omsA440a1l7vniJR3e/7H7nQNf+SO
         TZSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783191182; x=1783795982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+BkGnn82LQN6bHnpZs3JGZAnAhIdCPQEanxeSEyBEM=;
        b=MBl9N54mjc4tJuE+tFBvEd21jYVWHVytcvHI3UUdy0vRjod+8RGxgJSj2mj9Bjf5B2
         1MzS6BUJIPVKkEIz3RCrv1gsjEmHV+wyyMSvx8ZKbtKRsIEcjFifKHgIpn7GisHN6OIa
         7LUkwvuvLFCuqgQm46lUxhKnBUoHIJupc5pYcxYXiPIzhO3zyxSP9nEyQKL63Ud6/K3L
         LLILucDyS0kbVc3Koicepfk87PUcKTnnsdgzuokgj1LH2Fpdv/ERRnKhYMq4gFpBooAp
         MHISeat7T7+qJg0OxfCrkvMfVBI5wYb0D2Wmjb6XxW+pTLTCMlIAfp65uT2QYkim5lNr
         lGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783191182; x=1783795982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f+BkGnn82LQN6bHnpZs3JGZAnAhIdCPQEanxeSEyBEM=;
        b=JUnq5+Gsf36ja1BgH2tL2jsdP0XkbE7U64FXeUGdNZF7QjckxOj5e9XpIcgjAukJl1
         LBVWpQbfnn6fp9s7VQgWtuLuQM2I0ZHi3u5r2HlM+k+9+QQrV2DZIOMx+c1dxYA5TWsR
         6f/whIOOdPCXUckWMO2uDLwPTjm/5+vFpX2fbsDhRVODHLsJ5fww5sOz9vIWBAS26khk
         8xceIwMuXV/KPiGO+env96AA4UMEcAZfXO3kAWoTw4Obrisj5tztC/+lOV23CcVJQ0FU
         i+lG9a/wOYXn+coKyHMBlUF0SDpuZwzCSp1dkdmtGtySJpcdyxep6W+iC7KKAPzj3K7e
         5mfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rok9IOf5zH79qdAnUH4vrJA+f8BKrclRA2AnJF+4SmYQ4jKqX7UeZIaKtqndbFwPjpwMKpgxjozcOFp@vger.kernel.org
X-Gm-Message-State: AOJu0YyP2F35Inzqs6iYG15zPKD1KXi7ta6Q3IkmS/Cbf+NSuJQ5WGhu
	220W4s2N15jN0om73XIS8ameK6UdLYcGVjCxQsOpcpqivzdp+XFoy/26vlvxU9kRFjduW3D56jk
	hE4zsDOzqRCXsKiDrwTlpxy3AUkTtjp8=
X-Gm-Gg: AfdE7cnDbd4EFTvGwR/hTNEllRB52heh0awDEl5EXvjMWFZGgg6WwnNmXEpp/aiI1yf
	wxxZ22WGJGMVVFa69aCElnpsE/Aub48NccnMdVlZeseaPqPjBj6pXa9I1acj5eiL49fTpyyC8sp
	Is+bJEr1yeyPaAivhLTIQW5wdN8uZ8PQ1xB2B7V44evuADCHaT0yAaRdEw6L1sn1w2y5TsxKoeB
	nPQ+pV8DykOR5FbAZOKqkcQWeYbHrQBp9DgJbELZpY1plobwRgE9wfFfQ0XHh6WKo8K5Ff4RwRA
	lueVK3XHj5J1HdzfaxluPVCm7OOibvVkwFC66Mg6hRU+ZTGbRTRzmt7KEVK/XUnNp/bG8vxHljj
	c5teouI3Z/K6sDltdisgZEnOJYxlDlXpsJ2Sy7JIP2QsMwKzSUGcMDP+1EYJm4vBXlQlW
X-Received: by 2002:a17:907:25c3:b0:c12:45fc:c44 with SMTP id
 a640c23a62f3a-c12e6bff31emr137459066b.62.1783191181998; Sat, 04 Jul 2026
 11:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703102941.1141341-1-stefan.popa@analog.com>
 <20260703102941.1141341-3-stefan.popa@analog.com> <9878f042f424bfbd7fab24175298224b58e87779.camel@linux.dev>
 <akj3Ay8mwemRj-9U@ashevche-desk.local> <akkwWxCf10rfThMk@fedora>
 <akk9d-Zrx52C674x@ashevche-desk.local> <f7aba67831fbee343c105bba4bb531ce6f1c1c50@linux.dev>
In-Reply-To: <f7aba67831fbee343c105bba4bb531ce6f1c1c50@linux.dev>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 4 Jul 2026 21:52:25 +0300
X-Gm-Features: AVVi8CdyAnuqpwp7HErpmAcpd3YTiWdAQ5q92MiljKmxpMmIe5DU0ndquU9wm84
Message-ID: <CAHp75Ve_98MSB-RrSWV7J5yH39c6gus4eUBjXondo1=hue9pyg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: add MAX40080 current-sense amplifier driver
To: Siratul Islam <siratul.islam@linux.dev>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Stefan Popa <stefan.popa@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ciprian Hegbeli <ciprian.hegbeli@analog.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2026 at 8:30=E2=80=AFPM Siratul Islam <siratul.islam@linux.d=
ev> wrote:
> July 4, 2026 at 11:05 PM, "Andy Shevchenko" <andriy.shevchenko@intel.com =
mailto:andriy.shevchenko@intel.com?to=3D%22Andy%20Shevchenko%22%20%3Candriy=
.shevchenko%40intel.com%3E > wrote:
> > On Sat, Jul 04, 2026 at 10:32:32PM +0600, Siratul Islam wrote:
> > > On 26/07/04 03:05PM, Andy Shevchenko wrote:
> > >  On Sat, Jul 04, 2026 at 01:42:39AM +0600, Siratul Islam wrote:
> > >  > On Fri, 2026-07-03 at 13:29 +0300, Stefan Popa wrote:

...

> > > > > +static int max40080_get_range(struct max40080_state *st, unsigne=
d int *range)
> > >  > > +{
> > >  > > + int tmp;
> > >  > > +
> > >  > > + tmp =3D i2c_smbus_read_word_data(st->client, MAX40080_REG_CFG)=
;
> > >  > I think tmp can be initialized, since it is only assigned once.
> > >
> > >  I don't get this comment. You mean switching to ret?
> > >
> > >  I meant tmp is assigned only once so the indirection here, i.e.
> > >  declaring and assigning in two steps doesn't buy us anything. Instea=
d,
> > >  it could be initialized like "int tmp =3D i2c_smbus_read_word_data()=
."
> > >
> > Ah, definitely no to this suggestion. It makes code harder to maintain
> > and the pattern you proposed is actually discouraged. You can search in
> > mail archive and find like ~1-2 year old message from me with the detai=
led
> > explanation why.
> >
> Thanks! I'll look into it. Learning a lot of stuff. But I'm trying to und=
erstand where to draw the line though.
> Like "struct xxx* data =3D iio_priv(indio_dev);" and "s64 ts =3D iio_get_=
time_ns(indio_dev);" are pretty common.
> Do these calls make a special case for it?

When the assigned value is coupled with a (validation) check,
definitely do not assign and define simultaneously. When it's used as
a counter, it's better to assign it closer to the user (meaning the
counters that can't be folded into a for-loop). This is the rough rule
of thumb. Plus use common sense.

> > > > > + if (tmp < 0)
> > >  > > + return tmp;
> > >  > > +
> > >  > > + *range =3D FIELD_GET(MAX40080_RANGE_MSK, tmp);
> > >  > > +
> > >  > > + return 0;
> > >  > > +}

--=20
With Best Regards,
Andy Shevchenko
