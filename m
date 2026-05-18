Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A294508F4
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108875; cv=none; b=B4WPW8zt5rGB5v5AHDPOickOrgvqGuNoRpRK9JuvZVty9Ea6AydpQ3arWzt8W2wVvi4FaUvHXo9Mh3zCR0A7EBcE+CzKJjfJTTcluNqOr+fBLUk7Ne9neFmaicapzhfH0Ar0DoR4OczmzcYVIPwzVbFxtKIp44makWwiN1FaMFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108875; c=relaxed/simple;
	bh=kzq6fXO5xH0JFrRrfpeplkkfdRb3ESDVhUgoGp4aY8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oF1Zmj+0cG0DMlOsZ5kMVwZGbNa3zk8033vO4FoHijp8RUSGZO0/AoW374djXNojR/6LkzKkBCTLAS2MKuqax5NDpLscTuKTsHMDgtWIwJaVg+aadKojPMDW4bDFLzRHprQlcpDTMks5dMLYtRAdsbfo/kr/+kwPHLL6WmTiTJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-573a81abef0so1730941e0c.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 05:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108873; x=1779713673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXfE2Lz48kTNKntKaUoznm2p2xW5+qum7mp86cRTvX8=;
        b=W1KY0oDtiVbaxHr68JuORAtVpnN33M+BDbIz0Ba1z4CD4mCHZDFjb4GwAPIrPeFmlX
         NvJsQxRbeCxJg5mNLdzFGoKuuyOsYSRDMbQCHy0bydNk1WumZHa0RRqUKmNt6c9UxvSP
         MPX+rSkq/e7mfFoMqLg43YryIDRkJqINRNJxBojgDuGZsjQo7nJx6vro5buMUhURlLgL
         1VGH32aXe2hho+3UJEf9P6J3eP0lSYniv9FrNp2JP6c/ETlsVBpPHGJjXuSnUOjlXhcj
         RNXf10XH4QG4j65FFSADQDtOJHryEOOBiFOWYYlqi39xyxD4zHvB/ZHJExa8c+nf0bTT
         SpAw==
X-Forwarded-Encrypted: i=1; AFNElJ+R3p3Xe47KxGn0OV7KH97yNkkOS2fR2plcQk04LiBNoOJMSy3v+xt2am6j/RkZZePaKizQCCXQalUu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkj0nTnRr6y/2gAgotfUtCnVtWETTVbsXcTdEJLq6cMizHLOpY
	hSdDkGoWN+VAfCg150BHessCo/EEqmWoK6BI7MBe1SaSpECW23JKQSbFDF5gs5/o
X-Gm-Gg: Acq92OFpxXlHZx5E+R7q8IgbTFuqNUMCsXgBzdvMYj1BNHRMryS5DtAukiXCyujtxV6
	l0JyqlUEHcKkj5negPTqCyYK/Yj/ljqlBjc5AhFLx+8lm6mm7lCbbg0VDwGIQtVcTZZqjVrBLar
	LqJGy+3HUuObdx3xqauTJgwMT6LWMG55X9h7Lw62UJ6Wl2ktYNWG6u58F7Q079hjhLiSeufTanb
	Z0V55tWbqwIfdm5zWjfOMBA2hm9Se6JQNwG48T9Qul2y1dglFPS1J4C2eoK3jTh7cX92Emg9OKE
	+ZppKBgHw/tbL1wPWKjpaAF/GFb7Oav+CRuqg/EVL+VSOI12MZ6lhIlTlSJWJC9arx9oaB3qT3o
	1iAwzeL/bKzx+4ndaFG9ZglFd/twQabNioiWtEuHFs73DvI/WQRA5XtV6kWE5ox2Eo/C58gIUqB
	Ur+9bMFckYu9JS6q5KnJqqKlaHS2v956TypcWezBZwBwW/0W3ru/k6+HIZ9biC
X-Received: by 2002:a05:6122:179b:b0:56c:d5cd:1e7c with SMTP id 71dfb90a1353d-5760be897c1mr7517607e0c.5.1779108873189;
        Mon, 18 May 2026 05:54:33 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f588bb2sm6292961e0c.4.2026.05.18.05.54.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:54:29 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-95d3492fb1eso1431498241.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 05:54:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/6PXHHpglPQnSkCn8JoTIP1ScxTpySh8K4sNFWdT4u8Uvst2gczJzhbafbPXBInnXLEOMDTeBvGCrF@vger.kernel.org
X-Received: by 2002:a05:6102:946:b0:631:ab8b:c348 with SMTP id
 ada2fe7eead31-63a3cf12325mr7789460137.8.1779108868589; Mon, 18 May 2026
 05:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
 <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev> <2e20badf27b6910d619329841e37d2961556056f@intel.com>
 <20260518121601.GA87957@macsyma-wired.lan>
In-Reply-To: <20260518121601.GA87957@macsyma-wired.lan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 14:54:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKONz_jCAedOWQ7Oqza8DDXt5hBqB1ZvO-1s2pvwsbUw@mail.gmail.com>
X-Gm-Features: AVHnY4JEQspflVlWQjqPB-ZT9trO0h2lQBDWUevKp9TlFoxeoXF1KrY6M5cCx8Q
Message-ID: <CAMuHMdXKONz_jCAedOWQ7Oqza8DDXt5hBqB1ZvO-1s2pvwsbUw@mail.gmail.com>
Subject: Re: Stop false review statements
To: Theodore Tso <tytso@mit.edu>
Cc: Jani Nikula <jani.nikula@intel.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Konstantin Ryabitsev <mricon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev, 
	Linux Kernel Workflows <workflows@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, kfree@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ted,

On Mon, 18 May 2026 at 14:26, Theodore Tso <tytso@mit.edu> wrote:
> On Mon, May 18, 2026 at 11:04:29AM +0300, Jani Nikula wrote:
> > > Sashiko is supporting various LLMs, including open models - it=E2=80=
=99s just a practical
> > > choice: to my knowledge the quality of open models is not on par with=
 frontier closed
> > > models and it would require a non-trivial amount of hardware and infr=
astructure to run
> > > an open model at the required scale.
> >
> > In the context of the "Reviewed-by: Sashiko" discussion, this actually
> > makes it really hard to assess the quality of those reviews.
>
> Agreed.  There's a reason why the coding-assistants.rst specifies the
> model which is used:
>
>   Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
>
> The problem is that (as Jon has pointed out) coding-assistants.rst was
> intended for use when the tool was beging used to help create the code
> --- that is, "Coding Assistants".  What we're doing here is more of a
> reviewer assistance.  Something like:
>
>   Scanned-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
>
> Would be more interesting, but it doesn't actually tell us anything
> about what the results were of the scan.

Indeed.

Scanned-by: Geert Uytterhoeven <geert@linux-m68k.org>

Doesn't say much more than the RFC2822 "Receved:"-header,
and thus not meant to be saved for posterity in git history ;-)

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
