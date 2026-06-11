Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9851435CBD6
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180625; cv=pass; b=Ac7ZwZ9QgryKicaOmPCZTFPOw2KgslOJYjfAq7gxfK5zHeuT/Z3YFA8TeAh5DjBVErIcFiPAAX3sDVa3ljn3O0yyeqXOfd2KhtZCc9ikQI9LODWVt1gsKZUE9D4dD6tWYXPLMuqvoi0SUn+ryeabE1Cmc9yzt4F2O1dtgkIsBLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180625; c=relaxed/simple;
	bh=USzxsT/rGuBT80iTTvsaf5Z0QIstt3wY0fzNpEQe2y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2+UhnDtJI5aou9jsclBJ4qS4RkhrJcylu2MXvBgwUeG4uppDo94PEwboh2EMrjtMIBiIlMN4b9eWbdHTmWdR2etZ25FgMsK9xoMY6O1l11PkQBKiPn/7lKZL6hhOMNqgCj/W332gEt82Z9PQa+4f7EGt7z0kDw99kLlm1dH8b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/F0mnHP; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/F0mnHP"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6604176b575so7334782d50.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781180623; cv=none;
        d=google.com; s=arc-20240605;
        b=RPstttnq5jhOExU1sikMYk+6Vfg+DTHk4aAhAbMcxo226bhCFGNUPIw4Yu+YClQIh+
         5yIIaYCuXCePZLsnupinHY2DaIyLx2QZZK7khBty7GEKuAuNS4LRhpFBX6pmCXcyMkVT
         NvvU62UyRu01busPxhIT8LPmPWkYfaYJDiVxS5MCN1CMsBkqg3eqholbirOHM65OvjAc
         nchHvIPoNoQ1xvIP0tKIdahmRS8tDb6YvJDeOQR3fzN0JQpSPwoMa1Hf/nY2DrGCUo90
         sUqDja45Rk22CJ3aLbC3Avmc0u5QFdlAjDlNXBBl/V/RxD7Xqf/r6JkzXIZxPvca5VoL
         vFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=USzxsT/rGuBT80iTTvsaf5Z0QIstt3wY0fzNpEQe2y0=;
        fh=8ohFOuV8LL5gLFp9meK9yDzMXAaJ8Sn7eINy84R5s6U=;
        b=YKr27xaDeZ5rGJJBk3s0ojOtaRZ9IHt/scuWDitXIB+i0DqYZdtc0/48MudhZMBDaz
         /8Mah4fslHDjat2nvUbGlOBX0fIAKJ3ENwQ9uEwKtO1nVV2ftPyMBhRxZ5QYHmladyVJ
         v8ketqXH7Bj5vpn/06nBwI5t0ddlKQqHQ7/vXu/vU/eM+G9cu2fPnXmX8A/fXObfH51E
         HB9IAcDnNsUbiTInEjcT0h/wVM4TkiNTasy0ooHL8UR+p1Kn8gzY0Fr5d5QuJD6SWXcI
         E6KWvje8r4V3OHedezktPFzjFaOPOIfNdfNv2KQwnEGXRHB/ioXvxE9/ItGgTuvFS3bZ
         SLyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781180623; x=1781785423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USzxsT/rGuBT80iTTvsaf5Z0QIstt3wY0fzNpEQe2y0=;
        b=W/F0mnHPeYeZox/rEXxmJsxxi1Hzt1EsQeg6Aj3nYCrUZPcxYosmLGdihHnpXPBasT
         C0+g9X/x8CXzg0xIHJHolZNnOoY5DPHQ5b+5hqQMHw3kAuZkZGZ+yNjz6vAsXjFnG1Xg
         xaPfv79nd3JUM2R76a7WQFsr5MzfBKittrNTDPfMwc7S6Rhua1cgBsfB2Mi+D4M3xGdo
         X6wS43/wZ9Gnv1izHeoMMEdPDmOPx5Ltt0X+WelpxWRwhSoFvnFxBv4LrpTOtPPyQ6H7
         yvbAkm0mg4PEWoRq1tWCCBLsw2MQOCmuKAnk0oc/MRZPR6duxwo3VzbeySjuR4Vs4LE3
         HS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180623; x=1781785423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=USzxsT/rGuBT80iTTvsaf5Z0QIstt3wY0fzNpEQe2y0=;
        b=pQOkaB0SEdpTrAy5/DI6UpApGhL0kkc9qKzhvN5fBQzhfQLWpMtC5ny+3EfUq0sTAa
         g8iXkViIiUPNhjo7hOfZ8kk11+UfTIZYfiljFauYJUPXigsi4D16wNmp3P4J63QU65Iq
         Bm4HyHx1CodvYGqYZVEdEu4RwAbA/0KCoXa+IccWNcUZ3ieM58ccNQwks1YPNUGrzSp7
         kBIzo3uWnOWl+x4IoO0wua8qntYry7ey3cmip+2THZ/0+pm33Vy8NTxnTgHLe1uU6tqZ
         rBI7vdBKkwAIgpRopLipDQLb5TzW7/5hIZo9Hkb7wn0l9EBF3sIvQpiWeq2CAQaxjQ08
         RsdA==
X-Forwarded-Encrypted: i=1; AFNElJ8RL7CjF4Uyn4/OgVtOboQ1bAdrky7uSBT4jSVA1gXPljbmWrA1F7IzNgxdUCYbUvm44sKrC/CQBb8K@vger.kernel.org
X-Gm-Message-State: AOJu0YyOsn0XDA9sWDjVN+YQlHBLhVAxfuN0L/z5j3/t3rzQemJRIX5s
	S9inoRrDYZu8KVkoiNgPKlz6EfucmrwlUPU4Sh7YJlQ7pZQZDy4zTizTxyqsSPIgGjTw+oZFK+j
	w+4bSYY/BZ9ucrmRFET8wGxf8IZ8sTIo=
X-Gm-Gg: Acq92OEWSlzTkwcOKes4ULYqx6TNxcwZsH9e5GDltLszc67IGqd4N2JbyYVe43fu6h4
	73SSJz4lR7/O7RDAhglNYDl5c9SDV1SoLnqoVZMkF8apLp9nZ2bYo4u1pscz6+A5rYubLimAczi
	MzyAVKfaZ5t7s106ciUs7vWZR2kpwUsMGEiLFwkplF4qmkQz4RncM+AhYHGjR6p9kf9Q2EF+63d
	aIQ/NEnMCY052z5AWt/mUmbmihT0hj9ArEzTPHh0KNNlsY6gpB3GG3m/UDlSQwqn46VxFiL4Ao4
	QSOp9j0pDKq3YTlnh4DfE+lX28rdZCEc8+az5t6uB16Z0P8/rQtLZNijJ35ouCQ=
X-Received: by 2002:a53:ac92:0:b0:658:e645:7736 with SMTP id
 956f58d0204a3-662698670a6mr2191068d50.39.1781180623358; Thu, 11 Jun 2026
 05:23:43 -0700 (PDT)
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
 <aipfxL3ttO1-7W1T@ashevche-desk.local>
In-Reply-To: <aipfxL3ttO1-7W1T@ashevche-desk.local>
From: Maxwell Doose <m32285159@gmail.com>
Date: Thu, 11 Jun 2026 07:24:16 -0500
X-Gm-Features: AVVi8Ccz6yEXC5qaHOYCTp6OBFq_A0v0VfBI7K5RpHEHuZOGWBTkca5pd6-Gp60
Message-ID: <CAKqfh0FQb6tSZrrTHGWcoQqPe-OwD-mW02GOOn9y+ysstRPVzA@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add myself as maintainer for PMS7003
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Tomasz Duszynski <tduszyns@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 2:12=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Jun 11, 2026 at 10:09:57AM +0300, Andy Shevchenko wrote:
> > On Thu, Jun 11, 2026 at 08:58:47AM +0200, Krzysztof Kozlowski wrote:
> > > On 11/06/2026 08:50, Andy Shevchenko wrote:
> > > > On Thu, Jun 11, 2026 at 08:37:33AM +0200, Krzysztof Kozlowski wrote=
:
> > > >> On 11/06/2026 00:24, Maxwell Doose wrote:
> > > >>> On Wed, Jun 10, 2026 at 4:09=E2=80=AFAM Krzysztof Kozlowski <krzk=
@kernel.org> wrote:
> > > >>>> On Tue, Jun 09, 2026 at 11:03:26AM -0500, Maxwell Doose wrote:
> > > >>>>> Tomasz's entry is no longer valid, as he is not active anymore.=
 Add
> > > >>>>
> > > >>>> Why is not longer valid? I see activity in Feb...
> > > >>>
> > > >>> Strange. According to git log --author=3D"Tomasz Duszynski" last =
commit
> > > >>> I have from him is 2023. We also did have an RFC open for a month=
 on
> > > >>> linux-iio with Tomasz Cced with no response.
> > > >>
> > > >> So you did not check enough... and no one needs to read RFC :/
> > > >
> > > > Hmm... lore.kernel.org shows last activity November last year (07-1=
1-2025).
> > > > What other sources do you suggest to check?
> > >
> > > No, only lore.
> >
> > I used this request:
> > https://lore.kernel.org/all/?q=3Df%3A%22Tomasz+Duszynski%22
> >
> > > As I said, February this year.
> > >
> > > https://lore.kernel.org/all/CAObtm8zKUAWNS23nRMhc9ZR-zn7xeVOFPiV4ai_x=
7Bkd5puiyA@mail.gmail.com/
> >
> > Okay, you used UTF-8 name, Where did you get it from? MAINTAINERS has n=
o
> > diacritics.
>
> OTOH, you may have used simply email approach. With
> https://lore.kernel.org/all/?q=3Df%3Atduszyns%40gmail.com
> I got it as well.

Ok, now I see it. I will say though that we've emailed Tomasz at least
10 times at this point for various things and hasn't responded to even
one :/ if we need to we can allow Jonathan to chime in.
