Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7C34DCC8
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781185319; cv=pass; b=k6uKXN1BOlFfkkp72yj46f7L5pELotiGD0HAzTtPZJmi7X+JsnjXly3cOPqi1EOh89dKmu7wKuLWD+3n8HV4fPMgV4VRH9i2retwp3n3yW3rWxmnIK1ZNavR8wBtN1tqAWDXyfwzcZ80U2MA+ngFJQH139SeMH1cV2OxaqUPQJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781185319; c=relaxed/simple;
	bh=la9v2EJSyOmFNWumJ+PlbtP/IdcZezWwHW0dgAWzupQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c9peL4Sp80SnooAewYzh68tT4X8WFsMXNRdtmokxHaGYk2n0NT6Y4kz2tkQoCTyvRH4BSKciUD/bjbSVTwPnUAICQyvQ0g6JXTsyZnDB1BIZAPROSvEa1F0Nw+Zd58g7vqGzovBhHmT5y3BE86uZoBErYgVSAAgjTszwlI6bVIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEguZo1f; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEguZo1f"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1383e116edfso2431320c88.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 06:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781185317; cv=none;
        d=google.com; s=arc-20240605;
        b=lrzs/cDMAlR6zuUipWx6S1vxLvl/xUiFfZBMKl9nOM1hy80mM1ss72QCDeft4BDRCx
         RABuzE27YbmTPGoVEhhrOIXnPtMhobZBNcp3jcO9T+IQOKCuBkd49aUiiX2LwG3pAfu2
         jSwurb4MaR7AMNH2SG4OQ3HHlxXNf4nGu7W0wwHY1PgyjlEPathR7hjq9Kf6LvAimE0X
         g/9DS9qgNApiy7s+Z0xP2kfA0sIupxm9pEHdPkDPhjDQgRmyrZZCFEcm/XHRx8ELirye
         PLQzTXz68QLrnxSZNovAELW8gT2rmCve9OkSTFNVuY4DorhAO4SUW+m1i08d7ihiT2xM
         Zn5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=la9v2EJSyOmFNWumJ+PlbtP/IdcZezWwHW0dgAWzupQ=;
        fh=SnHztH83WKoZdM55MTk/f2NDcDlHKWxwKuXsvswdtb4=;
        b=l3GkQSm+IAPhQlZMG70XD8QipqpoFoPUnAx3TpH7Ku7xG+OuWB1N4f5pdmHkKmxx5C
         zuqC0+lfXDaJ9Tzyg54Cuhll5sos4pg0ebTfpFpmA7mGvD3ZNUx9JnHKp/M7lWWXJLmo
         YDBF8KJdo5w/bE/9F1pE5TXlwn+ce6snKMAXuzyHusjmbQS8szM8so75pf5/IzL0dxJU
         VEqCkQM7CJkX/xajNMOLkOSDnkiG6ZRyqE1sK0kTwIcneFx9mOz/RwaI75LtFGFGrxs+
         Vb4KnkNztEmDVBkq/lr4bPcyNWtXRWiPQVAfGqdK0Z/6j2MbEpoN1hB9MBYhlx1RS2jS
         Ev6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781185317; x=1781790117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=la9v2EJSyOmFNWumJ+PlbtP/IdcZezWwHW0dgAWzupQ=;
        b=LEguZo1fQ3/bwaepYacQHMHqZdqAId2RRsBgTvdMmvnhTIvgykgfHMbAqDvA67JqbW
         y71nJKahuEK7Sxu36R8oNwix8j5AswZYJ85CoGwofl8jcTU34NpBpSZLNE+vmtAvxZd+
         ih0Uf9gaGZ7ryBk7shnfltlQ+JSkCF9MoGqyCyP1eBCqId25oLKfE1cjT5AwnLC+KTj5
         vtjyh0Pe3aM3AQMYuT8tXkvvQDVmKfHO8G2gMNo0ysNuuFV0fLngROmL7S3rMCJ/4eGA
         xNNg+8qi84aULoL/TaXotWMhaHs3HzeQX2bampCLkoVm+/KRTS+ULbxCmC1cU7+HGGzi
         AdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781185317; x=1781790117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=la9v2EJSyOmFNWumJ+PlbtP/IdcZezWwHW0dgAWzupQ=;
        b=oOdB1XVDWHtgM4dS1gFFYHiStQXXzk59BmtFWvVXzTMjvRQZlITjsBkGtscXkdiQfM
         n2CTWc1jXYQ1C1c9Pyo8FIvwSsY7+iaqAeWWSRfMej8V2x3s8riwIX0Ng0d8AHOwqYLD
         kKiJw8ELaOJGtO8jjMTnfDzMgGRdGfk96t0T/rjJwjpyH4UJdLyAk3IqVkaCC+/DdV4T
         ItrRxldAB10hKb1QVLZ25kuI6MNJKNJgT85b49grD4J22N5oG+gbHNIt2ZM8ooWbFV1Z
         aXGzZyI6WrS2MaBNx82k8wavqKY9IwXOuRex79aHZ/l00Y984ShT5iu+QNWxE3t6Lvh5
         Yq7g==
X-Forwarded-Encrypted: i=1; AFNElJ9r3ZjV/WYI4wZ0jzzNyZJXmhHz5ApZijZmR4D/hjO350dQbdoHJ2bJEvaztLEOAW0Ldi/R3x6A5pyR@vger.kernel.org
X-Gm-Message-State: AOJu0YwwEgDNOOEtwb/JBAjisZe3fBbzCRCOQZnvZHnxRzxBw5wbW7P6
	vKVgFyCht4Z5i86RC4DwxVekFBqignzKwWvjhsh3Uz9EWm959G/h/4OU37YI0VFXLMMSKHUEsof
	+5x+6Dw0tMFPlokLASGV5XrWCQZNECy0=
X-Gm-Gg: Acq92OGRIXPjjofLlGTZ1B9d2jL4F46Ilbi+wLq+VB/77Ceijn6q5aN/wk8AwVlpeBD
	OxjkQHFXtt3FWuooh7tzN88jwbY7PI+jy42/aSmGWia1GLbqMVBJylrPXNQXeP+g0GQaB/Y+KNc
	7iisdymPGyZidqISOZLXqYVQnJfbTtZANhBSnAqfd/hEZIt1jsvn97Jnvim2GIwhjhkmFt2sj7o
	Ls/UZz5ENJ15HC4maA9zDCYSnzD3g+5clMDL6sVmToXpzV2+YBJdJztHvu5TBax2o14TzwAu1dk
	hCMOdvfiMeoDksy0OhA1XZYOCjJ71SeUzbbXx+ssElcMq1c/RHoUxwmB7mIAJBIM7WafDrE4vM9
	4d4gjPXM6+XaK+A2QX+FWNg==
X-Received: by 2002:a05:7022:1b08:b0:137:ed4b:c9b4 with SMTP id
 a92af1059eb24-138421ce4edmr1528004c88.28.1781185317088; Thu, 11 Jun 2026
 06:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609160326.45123-1-m32285159@gmail.com> <20260609160326.45123-3-m32285159@gmail.com>
 <20260610-pastoral-dark-ostrich-5ca3f6@quoll> <CAKqfh0Hi8EkShh3s4dUqAJRDExQLR0NVOvd4An+bY5hat4-Lhw@mail.gmail.com>
 <e00caff5-55e4-428f-bc57-3885699b221c@kernel.org> <aipatjyVcltbspRJ@ashevche-desk.local>
 <6c5a657b-f316-4982-8cb8-8c09f1b1669a@kernel.org> <aipfPwT4RJGdA4TT@ashevche-desk.local>
 <aipfxL3ttO1-7W1T@ashevche-desk.local> <CAKqfh0FQb6tSZrrTHGWcoQqPe-OwD-mW02GOOn9y+ysstRPVzA@mail.gmail.com>
In-Reply-To: <CAKqfh0FQb6tSZrrTHGWcoQqPe-OwD-mW02GOOn9y+ysstRPVzA@mail.gmail.com>
From: =?UTF-8?Q?Tomasz_Duszy=C5=84ski?= <tduszyns@gmail.com>
Date: Thu, 11 Jun 2026 15:41:44 +0200
X-Gm-Features: AVVi8CfhUaARykIMlSMbTlDYV_vPSaWBjYTJqbjRWcQjYhC2kclj-nRdmp-pwgQ
Message-ID: <CAObtm8zDk4s3+pmGSxRoVHq7ef1y=_cHdC8YRH6ycRNbjzaNkg@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add myself as maintainer for PMS7003
To: Maxwell Doose <m32285159@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I've been trying to catch up on the recent discussion. A few things I
want to address:

1. My email is active and I do read patches (when CCd), but by the
time I have a proper slot to sit down and review something, it's
usually already gone through several rounds.
Chiming in at that point just for the sake of it doesn't add much value imo=
.

2. I get the impression you're thinking that since I'm not actively
maintaining these drivers, you can step in and take ownership. I'm
broadly fine with that, but I'd want to see more work and patches
coming from you first. If that happens, we can revisit the ownership
question. That said, do you actually have these sensors on hand to
test more invasive changes? If you've already answered that just skip
it as I'll probably stumble upon it whilst going through overdue
mails.

3. I've managed to carve out some extra time lately, so I'm happy to
be more involved with reviews going forward if that's useful.

In the meantime I'll go through the remaining emails to get better context.

On Thu, Jun 11, 2026 at 2:23=E2=80=AFPM Maxwell Doose <m32285159@gmail.com>=
 wrote:
>
> On Thu, Jun 11, 2026 at 2:12=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > On Thu, Jun 11, 2026 at 10:09:57AM +0300, Andy Shevchenko wrote:
> > > On Thu, Jun 11, 2026 at 08:58:47AM +0200, Krzysztof Kozlowski wrote:
> > > > On 11/06/2026 08:50, Andy Shevchenko wrote:
> > > > > On Thu, Jun 11, 2026 at 08:37:33AM +0200, Krzysztof Kozlowski wro=
te:
> > > > >> On 11/06/2026 00:24, Maxwell Doose wrote:
> > > > >>> On Wed, Jun 10, 2026 at 4:09=E2=80=AFAM Krzysztof Kozlowski <kr=
zk@kernel.org> wrote:
> > > > >>>> On Tue, Jun 09, 2026 at 11:03:26AM -0500, Maxwell Doose wrote:
> > > > >>>>> Tomasz's entry is no longer valid, as he is not active anymor=
e. Add
> > > > >>>>
> > > > >>>> Why is not longer valid? I see activity in Feb...
> > > > >>>
> > > > >>> Strange. According to git log --author=3D"Tomasz Duszynski" las=
t commit
> > > > >>> I have from him is 2023. We also did have an RFC open for a mon=
th on
> > > > >>> linux-iio with Tomasz Cced with no response.
> > > > >>
> > > > >> So you did not check enough... and no one needs to read RFC :/
> > > > >
> > > > > Hmm... lore.kernel.org shows last activity November last year (07=
-11-2025).
> > > > > What other sources do you suggest to check?
> > > >
> > > > No, only lore.
> > >
> > > I used this request:
> > > https://lore.kernel.org/all/?q=3Df%3A%22Tomasz+Duszynski%22
> > >
> > > > As I said, February this year.
> > > >
> > > > https://lore.kernel.org/all/CAObtm8zKUAWNS23nRMhc9ZR-zn7xeVOFPiV4ai=
_x7Bkd5puiyA@mail.gmail.com/
> > >
> > > Okay, you used UTF-8 name, Where did you get it from? MAINTAINERS has=
 no
> > > diacritics.
> >
> > OTOH, you may have used simply email approach. With
> > https://lore.kernel.org/all/?q=3Df%3Atduszyns%40gmail.com
> > I got it as well.
>
> Ok, now I see it. I will say though that we've emailed Tomasz at least
> 10 times at this point for various things and hasn't responded to even
> one :/ if we need to we can allow Jonathan to chime in.



--=20
Tomasz Duszy=C5=84ski
