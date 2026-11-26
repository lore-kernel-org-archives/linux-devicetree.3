Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683178;
	b=0ffQWXvMv1/NmIsSrO6XBTt7eyq0WBcXqaJgI40gRSGP5djg0iCXqabl4GeTlJ86TW1f
	 c2+fdpKog+vXnfnNLRx9oK0WeAHY7L7LJ8FXKqlU7dL5Qzq/D9jPnxaxzzlplSbQDL7Ut
	 41hDsNk0g9F7wbKIeuxejLUipdZ3FOiYU5NiwLO+tTdkaOnAt35lJvtRUtmYjvd13O4ck
	 91LNggzZENYBPsSBABTJSB5BfKEm/iIUKWl5lpw7L2OrpmsJwUFFsikwtMrRpuqHSP2Ra
	 uien70e6v6Bglei3/bdbBiOLa6JHHPYGC6patRZQxGv1C6rkd234hUgT+xHgM8eH9DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683178;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LQC7n5UB+twTmoKbhuhV7McngclJ8wPtfQsYLymxWtQ=;
	b=5jmqepwbmpUkNmSxBV1Of9+FlfgvRFSK+FOoLDOGUnwkM+ZhVzrcAuheG63F+53zGT3X
	 f/CUWCthOMz+sPj41D9hpcI/EBz2wkdjpGFkzwy+plFGzvuXhXoO4FR6DGVekUwVtLrz6
	 bis7H5subLNUy6rvqr3X3YdLGi1k4uxftfk8FhdYNVAYsK5IQ5Znz804vEd+D8HMkPENK
	 xPauYemFfXQ/XkmjwO8Co3pUbs7A9yTMC1FtcMXAURcNCYxUqn8f17Z62R9E7UmGv8IwR
	 WaFQQJkNI6xy84YCygubWWDNTi/zBvOzEAkCi5YTAUqvBZqTP6YEj9Xeku+40XhbHCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5499606A330
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5499606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so4772785e0c.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683177; x=1796287977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQC7n5UB+twTmoKbhuhV7McngclJ8wPtfQsYLymxWtQ=;
        b=c/yjTmok1CEhZEOahg5lmBTFMngX/At1vRbwck0I101utgdN6nOC4apQ9R3DWrj1Ds
         3MuHZGau5PCpAEdvdA1+nGfrln3fqaxmleeSxjQhaHg+p+cj+NGaua3ocI0eMNj04zml
         5bK4lgI7H8tjfb+iDTUaHmuUa5aD92709jR8gwAW7YG6yv4qrMys0hJUlUcWqpLnmt1Y
         /SFo85LZE87ZslTntTFDl8dycoyE2L6bBaDiiPH90N9vP3lcg+ZUZqlr7YMBuycal9Xc
         9P274WOu0u0lHfKF6ZY2mYLp23Pi0fVWsH5wWu2vT69sOhryoE5KAUThJURl1h6VgANV
         HhBw==
X-Forwarded-Encrypted: i=1; AL+hErHAKdMXP57JmK+1AuZAacmIZ3JTCLS5dFhemO2fTbm+cPN6V/5Axe79WQHl2RCLE0zHfogkg5l+dZLv@vger.kernel.org
X-Gm-Message-State: APuU4Z9qS6ySvsMC2oDi023QLDkz+C/SPaSkYpZYkqHY46TebRsIrIJa
	61vJXlNAnPw81D1VH6QtMjYs+ZEKVns+pihlBBF7YXLttIPwzVsAPiuUVeRSwz3J
X-Gm-Gg: AZFdTZdWQwTejC9opo1V/6LcE/1ru/fa4EvcQfKCsjHXKv2CUlJsNSen3eS9o0e5tP7
	bcBAAfL/ljivnhComFKAIjRgCSJwjOvc9m9jkPBg/VqNBFyDs7qQXLU/FPUtKVuAXzSJ66kANpV
	vXu7j5na/CYaxd8ZWZY7kb+KC2mdgM79P6EXY4mfO5TdAkVbMDElYqNAEDeL6gbIYwtG6yH7YAp
	0SegHIGGMwvFbrWM4DzKESfwPDmc+N/LS6xu85RljASbz/Nf53kDZ0D4Tt8mOwJihZB0sYcnFe4
	TIRQYjGa+rqkCkXFV/hVN1YKUje7r3H2dLIspLVTWYMGNgcufhE5i5VHFFYqrCIDNzzJr1NXAsZ
	xHG68g1oC1VjUEfl9imvwAJHU/2vGhh+r2nAsB4wPi4+CCG5ersXvYu8+y+XN3cOw1A1GvZPQda
	Y2hndIWB72WnT5O0Whrrdr81NxxpmRzzBJ9hbrNhln1noW2yyC1jcJ6ntr9wF4IsVonbmlwy4Fz
	uxF5zPib60hI1NbS2UmzHQWvnY0KvIJjo16y12eU0B9v0Tu3nenI84RGg423eMJ24a1Yrz+77/7
	AChrovg2bhWCFADBJwsE2SEWXW7kYU+6g6Q39G6E209TakJDN1jvIdfk4VIfE2lvIHcDhmw=
X-Received: by 2002:a05:6122:3d10:b0:5ec:16d2:4537 with SMTP id 71dfb90a1353d-5ee8aebfff6mr12253745e0c.7.1795683176662;
        Thu, 26 Nov 2026 00:52:56 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee91a4e0cfsm18741364e0c.13.2026.11.26.00.52.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:52:55 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so4772763e0c.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:52:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEcBzoNyUaQIWb79+uhpZfKCv9CPP7Q1Dy/rOkTC6jPAXfkm19N8I+9vjNkKKEOD5Ra52liw2gMWael@vger.kernel.org
X-Received: by 2002:a05:6122:e16c:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5ee8aecb450mr12178985e0c.8.1795683175291; Thu, 26 Nov 2026
 00:52:55 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795639368.git.alx@kernel.org> <396395e1d02ca080da67cfd91a1c49058b2676b6.1795639368.git.alx@kernel.org>
 <awdaYz9NNVv5fHv9@ashevche-desk.local> <awddHt_xvc-lIygA@devuan>
In-Reply-To: <awddHt_xvc-lIygA@devuan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 09:52:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9gnV0beBEoh65FzPCwrQy=WpGtK5qKsOF3Tsv9iUj0w@mail.gmail.com>
X-Gm-Features: Aa3M54rOnub7bCh_NzEEm3acSwF_6HJABwfoziM7rtzTMFRTInpGyKc2wQ19vKo
Message-ID: <CAMuHMdX9gnV0beBEoh65FzPCwrQy=WpGtK5qKsOF3Tsv9iUj0w@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] device property: Fix fwnode_name_eq() for empty
 node names
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Alejandro Colomar <alx@kernel.org>, 
	linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Andreas Schwab <schwab@linux-m68k.org>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

On Wed, 25 Nov 2026 at 23:18, Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:

> > Date: 2026-11-26 00:00:03+0200
> > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> >
> > On Wed, Nov 25, 2026 at 10:03:55PM +0100, Alejandro Colomar wrote:
> > > str_has_prefix() returns the prefix length on match and 0 on mismatch=
,
> > > so the mistmatch case can't be told from "empty prefix matched an emp=
ty
> > > string".
> > >
> > > For instance: the OF root node's name as returned by
> > > fwnode_get_name() is "" and will return 0 for any name matched agains=
t
> > > it and since len is 0 too, fwnode_name_eq() will return true.
> > >
> > > Let's use strprefix() instead, which also makes this function simpler=
.
> >
> > ...
> >
> > > Message-ID: <avrSUUM3HMgxTNpl@kekkonen.localdomain>
> > > Message-ID: <nat4ilqmzzpuyrjbuahl367ip22tfnmjorydlppuwqiscxaujo@kf63j=
4lb3flk>
> > > Message-ID: <nat4ilqmzzpuyrjbuahl367ip22tfnmjorydlppuwqiscxaujo@kf63j=
4lb3flk>
> >
> > What is this?
>
> git-am(1) has --message-id and the corresponding am.messageId, which
> stores the Message-ID from the email header field from which the patch
> is taken, to document where the patch was taken from.  It is stored by
> git-am(1) right below the last trailer tag from the patch (which should
> be the 'Signed-off-by' of the author), and before the 'Signed-off-by'
> appended by git-am(1) itself.
>
>         $ MANWIDTH=3D64 man git-am | grep -A5 messageId
>              am.messageId
>                  Add a Message-ID trailer based on the email header to
>                  the commit when using git=E2=80=90am(1) (see git=E2=80=
=90interpret=E2=80=90
>                  trailers(1)). See also the --message-id and
>                  --no-message-id options.
>
> It's useful to document where those tags come from, in case it's
> historically useful.
>
> I've extended its use to other tags I take from emails.
>
> > Is it documented tag nowadays?
>
> It is not documented in the kernel, AFAIK.  It is documented in
> git-am(1).  I included it, because I find it useful.  Feel free to drop
> it if it's not wanted (I can remove in in v8 if it's not wanted).

Please drop them, the tooling (b4) can find the origin regardless.

BTW, the kernel way to link to emails in commits is using Link:-tags, e.g.
Link: https://lore.kernel.org/avrSUUM3HMgxTNpl@kekkonen.localdomain

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
