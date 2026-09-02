Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34734908CE
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 12:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352828; cv=pass; b=h4OkEX/nt3JQWAIrv4JAdxrG5gaPS1q3Qy+PbFat58T0AKr6C/i7xo1jylQybgPlyXpmM7l9ua3/a9F9gZ28JwTb+1s55lZPd4/5V74KLOm4ayV8nCAEywVPvuib6Pjva88B3cqvLzEyr72+8HXOsJJenX23TuwdXZt5ZnrjVzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352828; c=relaxed/simple;
	bh=2q7EoLKcgcwc7yUi5L5qFuNobRc+ktl9A+DSmF2mUEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZB9bg4YUXnTXaXkRhiFWBJMVVBtsuinUbQs9Yy7LUqFDxbYMljgywdmSXku6eOtnUSqrULAtVE/CAqa7RGsxJABPoVubYpSFUJmSZgA8E0Z3h0W1BWxib2a0lRDSbbj+eLP4/CyPxDe18h9TBcqxELY+6IFn59qfm6ipULS6aIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=TZHJOkcZ; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="TZHJOkcZ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2529b3139fso132570766b.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 05:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788352824; cv=none;
        d=google.com; s=arc-20260327;
        b=HCRKSmUtQ6gMro7mSdHmR70K96uxXNsB2QCOkZftiLBtdcS46FAsndB6riZvv4B417
         T8znTkOLnqNehfynfoI+HSdlsI/dhY9PjPQM66bH3PbpnkVIV4baGPL6JCu0y68AFiUZ
         Heu/WvoEiglr0W5QUVz35Q6IDiNu66F+C1NHx7549dCMbBhe48EHCnSKvJY8h16Ryx2g
         FoZpmGPTzsu2/jPcpSoSTXL3rCiZmaIIImhlL1yen8EuCnR+sKnMMmQmx9KAw4B+mhL2
         xNG1ecBCkMzU2GXcCo5tn8uRV/l/pll7dUkP22Dp1z6pK4xQsJNejql/8h1SB9RgFxMD
         VN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bf+ehOmiL4umBAVvBrXKvt8N+WWJPKbeQnHod1e6bno=;
        fh=++G57tbACUQb6wnZbBhef2cR2+bNKqm5XoyMX8kDW7I=;
        b=VEOpBvoHMcUa/T1q3ekp6Lnrx/Nf6U69yIlL5RqS2Py8B1jVMGdzXt8ismQD+oPhC1
         9YKr8IL6jjKwpNEnSmryciSLdRlydYiOzvYq1aWFW3S4kLxTO1LuRIpmllDw7Z6vmWo5
         iO1o+N6BQZ2fC5T+nKsX2RwLMKKs+gt+kCxswwHWezmuPWz3y8QTegABLa9sTkEIMutq
         uYobWDdIimQ7VIN7xbHd+NbxQdDkjrGaZNIn1j17ZIQYAiBKiW07wt79mDnqvbmAKXo4
         NuYs41RlX2IKmnyNbOpVhDc5BbKY16LuykSgZjkLMuKR0B5XWJUJNpvgd5hnGmTMcV04
         YdMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788352824; x=1788957624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bf+ehOmiL4umBAVvBrXKvt8N+WWJPKbeQnHod1e6bno=;
        b=TZHJOkcZJwTfPbRTlDs9/OBCM4woe1At57nBvb/eTQmvDHxftKZUTMOQD1Ccy9CrgV
         jWDbua7Do1wljDmCC3izGHnTK124dZTXl9HmuOHt+EaqPO2ffPdFZJI/16OSEC9roRWe
         /0ZQwrWCYGKmxrO8s6JsczCPhT8fv0IpNSlhQNGgEo18kCjLMNhogTTw7iVfuvWF5RHQ
         shIv1r4xj2/v+FmC/burOKcC9P+O14PFyDv2livPjEQ+rayx+RNf/xBbNXCYy6NZCYnL
         K6ZFlnjSx/6TIfbmhw0fdf4NlBo2R25cUuiAXtyjw/Q52P8hpdP5wLcCzzuV9qCcdcEF
         9Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352824; x=1788957624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bf+ehOmiL4umBAVvBrXKvt8N+WWJPKbeQnHod1e6bno=;
        b=jLT4TcjGQXfIGtaDnCyjrdSH5heHD93zStnE0ovIGKyjZJ+UdaE7KdlBOxGrnuIjB4
         B5zY190yJNwJ3xYxWNLdmm5ES0lBs10j/gnObqYg3iQdz/J0CGGeoSxfevMxmlbUCHnU
         JKQRi/81nbXrm/LiWQ9X6H4o4mYUqUS5cmgjlHp8T0LFi47uPLJlLkbS0QtlWu2liByO
         sFPycsV/S9Lu4aYPT7pcUk/falsesvIdPvUsC7prKklTpVhP158QJrZh+fL7bEtJiWz7
         LTEtNyhlcFebfJ02bYTuvSeH3CiSfCLnB2NqfxPg+Wki7WL/15nH3vmYFdVL+W+Bj5hW
         Sm3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzGr/x0NMpbXnxoETf8V+uWLIwiZd7PS11Xp68wMWHa4L0db7ZtkWwsLWL9sadDLRZ9AOOWFYj838uj@vger.kernel.org
X-Gm-Message-State: AFuF++lKi+TCOUrpe5B0Pokz4q+kjg4Q+Md0N78+DeSzpUjMblZzJoWZ
	E/TUQyH4DfxzqPnR5uXCOkuGH2XOB/DQ6AHDBPC6rxEU4iLGp5CoT8TBk4mJg/5MxkNen06xnWI
	Ep6SnAQNLlGd3Dg278k2bzGd/aasgU4CP8Jnnh7HWNw==
X-Gm-Gg: AYBFou3QdzfdScGxiAYOCt/ZVxm/6D8GW1fD08YGMa5WfXvYyLunsHUhqzUShTrlXZz
	vk7O8FsBp7/kcErekQW0/7B0qdSvxu3zk3YzRbjdEUKA4YeFNP1ICgG9I0SliF1VRvovAR5jDLv
	HCDSLtec7mVvt5Cypc6ZAhyRrsLAIC0GeuoG68+ipaj6aMBucWc6c4fbUmGqbPm4JiKdvwmGH7g
	zNyRw0ulruruAXY//9pTjiA1Ialu47sBzrDgYRLhzKM4+SiwBLFp2noi4xjJsCD59ypdr4FXpkz
	DEdIbx7lXx1gzsmHfoit+A9hIk1iCA50DaAeBUMiWs8IPHbhVCJ7zXmpXy9rSa7MPue6K0asOii
	B
X-Received: by 2002:a17:906:6a05:b0:c16:6a42:c7d6 with SMTP id
 a640c23a62f3a-c25d52b8474mr330582766b.9.1788352823968; Wed, 02 Sep 2026
 05:40:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
 <20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net>
 <87ecfc81e9.fsf@bootlin.com> <CAKTNdwH5S3MxgR=5s2LXPquCFRXE-61LTTsZoHP9+YmXo_P4Ag@mail.gmail.com>
 <87y0dk6jpn.fsf@bootlin.com>
In-Reply-To: <87y0dk6jpn.fsf@bootlin.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 2 Sep 2026 16:40:16 +0400
X-Gm-Features: AcwNN1VSY-7_RTZXfxYPRP1gcisezSlmJy8fnVW71SAjcha9KevXuu7BcSLrowE
Message-ID: <CAKTNdwF_wY8JSoQs=auK_9YNGT+hwQ=dAhcRVsf1E1CVvFs-XA@mail.gmail.com>
Subject: Re: [PATCH 1/4] nvmem: rockchip-otp: Serialize reads
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 2:17=E2=80=AFPM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 02/09/2026 at 13:24:00 +04, Alexey Charkov <alchark@flipper.net> wrote=
:
>
> > On Wed, Sep 2, 2026 at 1:10=E2=80=AFPM Miquel Raynal <miquel.raynal@boo=
tlin.com> wrote:
> >>
> >> On 01/09/2026 at 19:33:11 +04, Alexey Charkov <alchark@flipper.net> wr=
ote:
> >>
> >> > The OTP controller is driven through a single set of registers holdi=
ng a
> >> > state machine which has to be stepped through for every word read, y=
et
> >> > nothing keeps two readers out of each other's way. Concurrent reads
> >> > interleave, and the outcome is either a reader bailing out:
> >> >
> >> >   rockchip-otp 2a580000.otp: timeout during read setup
> >> >
> >> > or, worse, one of them silently taking delivery of the other's data.
> >> >
> >> > Reading two cells in parallel from userspace on RK3576 reproduces bo=
th
> >> > within 150 iterations - 53 read errors and 9 corrupted results, the =
latter
> >> > either losing their first word or, in one case, ending in the two by=
tes
> >> > which belong to the other reader's cell - whereas the same reads iss=
ued
> >> > sequentially never fail. Concurrency is not hypothetical here, as si=
x
> >> > thermal sensors source their trim values from the OTP and reach the =
driver
> >> > straight from asynchronous driver probing.
> >> >
> >> > Guard the read path with a mutex. Reads are the only way into the ha=
rdware,
> >> > as the driver registers no write callback, and they always run in pr=
ocess
> >> > context, so a plain mutex spanning the whole clock-enable, read,
> >> > clock-disable sequence is enough.
> >> >
> >> > Fixes: 755864feb729 ("nvmem: add Rockchip OTP driver")
> >> > Cc: stable@vger.kernel.org
> >> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >>
> >> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >
> > Thanks for your review Miquel!
> >
> > Sashiko complained about mixing a scope-based guard into a function
> > with goto-based error handling, so I am replacing the guard(mutex)
> > with explicit lock and unlock calls for v2. There won't be any
> > semantic change though, so if you don't mind I'd like to carry your
> > tag into the v2 version.
>
> Of course.

Thank you!

> I haven't seen Sashiko's answer but isn't the goal of guards to just be
> released whatever the actual return path?

I believe it's based on the guidance in [1]. In this particular case,
gotos don't jump outside the scope where I put the guard, so the
scope-based guard is still correct. However, stylistically, it is
indeed uncommon to see scope-based guards in functions using gotos.
Explicit lock/unlock is easy in this case, anyway.

[1] https://elixir.bootlin.com/linux/v7.2.2/source/include/linux/cleanup.h#=
L148-L153

Best regards,
Alexey
