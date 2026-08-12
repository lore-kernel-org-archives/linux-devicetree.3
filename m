Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8672345ECD
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 04:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786509596; cv=pass; b=f8pXJ2oUecsyEdx4579HtfN5JrFAXh2Tnp3/P5nqNbutrULUqFvaSFL7ge8WcLCIS5NKkjyIa4NLWsL0T1B82WSwJR3OqgFOItOWu5S1cHDLv8sWbCI2PS8HE8xTuwIYoNhV/zqKz3F9QwAk9rpHwBmlUK/KX2LEz01XxgjB8RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786509596; c=relaxed/simple;
	bh=Bn5EA8mnuFm3bH5umIuq0sbge5qbiERu/rawKyKCdjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7fza0gCu9VIfSu2J2k83qkeLdwDoDFA4jAq+07rsGvEvWSuUX3w/JU9F0t5PE70AC7tbJMiBelt2I4OFwulJkpegh4r2lseb6HYnM9ZRCHzbyJ2Vs9nQqGyd1vAHAeadROHiYYiuKd7piVr8ig+aq/VI6V6Lufm3jpDmbWLNYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SCEhEFlg; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SCEhEFlg"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-448b89f700fso633197fac.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786509594; cv=none;
        d=google.com; s=arc-20260327;
        b=IOH1qA3nxW6WdxJqCur8nFD3aMcz3hILHoYIPdBEUAD6wovkfgmMv5CGwc5q4zEXIu
         nzA/j/ctJu6dAgC6XHohR4yNjioHXZsvUZ9+Kc2aM8mmulumMjzkC5TSiP4oFKiGrRGc
         Y1w6pAGKTH1rCBwzIIA3+HHu21/thGb434iJNoT0mio+LTFsZTfUg9oTl9GKaHgucw0B
         MiZViM/XfSQLChzN+L6poFkrYt+Sov5Tldlj86Yi64FqdAPIqIIm5qARGPaVGPktf6vB
         Z7+oVsERYBMR4OvbXgjBRTYFqB25WgnrA3wTjRyw3HhTY6R+k/b7gY9X8+2KPvULPXQq
         MGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y8EqzbJg8fD3KowEEfKkshsn5eXfhPp6NSIWl0mIxuU=;
        fh=eNGKJgXm7UGcsckdDZO9BavbY4zdc1Y6N7G0HaP+vCw=;
        b=aVZA41FJ1bFMMb8XgqaSLX9uRxMH2VukA1JFJB9E/NVYgPpmYZxy06SERk5OAAoQ7t
         bPBCJa9439nCI4SslDT6CwQJ6bvcIaJ6LUvEfHT1vQZDxyBZ+neGrg8gEnkINVDIJP6K
         LEGyPdsEJ2CBHcKwgNvvRGK7+L9lqkbVgP1HgsLHvKZjjqVx07QBTG7AGUm2DYRbRm3v
         RGZQ4t4j3P/VBQgMVUSkzNj0SFPW4tKZ6CYUQH2acemNsbZyYbmwj8+7KFvD2I9uk6+s
         XhznrWSEuWSSqDB/+jqug3E08kAfS+MnAei189w5nmObrCtcawtWA/YdJ9gVvx44wqxC
         hI8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786509594; x=1787114394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y8EqzbJg8fD3KowEEfKkshsn5eXfhPp6NSIWl0mIxuU=;
        b=SCEhEFlgd74xOyfBIj27VZ9v0UZnM9YfgSkzGDtY8wgdxjQPcWSY1DsH/o0QfXTwHN
         2Le5BFDtThj66x48BVeVT2jfg6y+MLmBwxerE2AuLgXtaK7q5oI7e10w2/I8YMRcviXi
         bcPIb3/pImk6nK08Y20lAkDKR2wdUKqOOd+zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786509594; x=1787114394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8EqzbJg8fD3KowEEfKkshsn5eXfhPp6NSIWl0mIxuU=;
        b=QL8/eRLd1wcpqnjea505nxE+SXp/WV4d/KGzq56Yt/08x+gprynMeu+ekr2IEDWe81
         KaNCJp8puJGla9l8DvHfCqKnUE3bzh1cw8UXehAhIfkF1Nnsq79c6KSwCRhZNvkQqG5h
         DHVLv272MoHBKV5j9Pb7y8x7iXTEOlgd+KPxwQQDR7C9JTmMVWBqQHUStBk/VzHpgDYo
         lNytIesxMs+GeDqWBAQSiOn5HheCwmCmrZOmrDXunccEwRmqVjl78Ebs2HFuVvOR1xqD
         DYWX6rv1hdxkrk5bnkTHzD2WblB9gOa/cRDpFnXtw196ThMyqMiTtzLotPfXxHFhR1qy
         Fatw==
X-Forwarded-Encrypted: i=1; AHgh+RoKIY/kXLeMBZQiWCBKCB0sBCQC6SJ3k4855HohvzKcvuf5cKJUyHg7+bl6bDETg+p2obBYFfwCVWko@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/j3KmruMKYxQKPGOnNHE+w3jZKjDAN9AmpyIgI5R0a7aVnmK
	X5Lsr6Urk/ZAsro7iL7lI+5t+Fk+LvU4flYEJ3dWxyZJGQwzRcwESVsDz34S3NpCqAfWh7W6E9p
	53gqsWGzEOqV4nyuP6scfF+7l+CybiHex7RHRBG4u
X-Gm-Gg: AR+sD12Pl5pYrAUGVTLfjBI93dZGnx8rJ+HnAgTaSSi2AFD/ryImZZuXNFF5tmLIB0H
	wiThfN+AoOAPKz5cq2HnPFUI0ollrbPHChVU99GSBCsqyxrg9M4tehZE3nRscH3mkgFn0OG+mJ4
	w5LaPd3UEiMeIbYIM+DITxUnB0NXj5mLpCYDgsqOIYJHouxhB6QwtryYMa8P048SOggKtAkd2U/
	HQkJKrfzWnKkZhn4p0hJ1BSB7sa5k3Z8bphzcD/IkXNDtGBH0/kA9ZAt0RMgoYHaXMtHZU8OYXL
	sQueKCkTvCc7o+tdIIJI99zcJZE3hrrN6eTgszaKgPN/FJ9E+DI8O0S6owWWQgMhfCSUgODmW6Q
	G8y5lEK0=
X-Received: by 2002:a05:6808:2f13:b0:495:d7ec:b6be with SMTP id
 5614622812f47-4b210ca8dc6mr1833103b6e.18.1786509593853; Tue, 11 Aug 2026
 21:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811122011.3539250-1-wenst@chromium.org> <20260811122011.3539250-2-wenst@chromium.org>
 <99ad23ba-f8f2-404b-960e-1c22a20c9ac4@sirena.org.uk>
In-Reply-To: <99ad23ba-f8f2-404b-960e-1c22a20c9ac4@sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 12 Aug 2026 12:39:42 +0800
X-Gm-Features: AUfX_myPgwTrMoDWlXxd7K4JTdOxXQP71DAA9qzbfq1hbTylwiYJcqKiFEh4if4
Message-ID: <CAGXv+5EeEQM6O8Vb8e8fGjRzMe1icmz=cPm3GoKLxvEO=weVcA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] regulator: core: Add "enable and wait" functions
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 8:43=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Aug 11, 2026 at 08:20:01PM +0800, Chen-Yu Tsai wrote:
> > In device power sequencing and initialization use cases, it is common
> > for the driver to enable the regulator and then wait for a certain
> > period of time to pass before continuing.
>
> Please don't bury core changes for subsystems in the middle of random
> other serieses, this is the first time I've seen this.  :(

Sorry, that is entirely my fault. I was using an old v1 recipient list
on the previous two versions and that list didn't include you.

> > One case in particular is not optimized yet: a regulator left on either
> > by hardware reset default or by the bootloader, but does not have the
> > "regulator-boot-on" property set. As the enable timestamp only gets
> > updated when enabled by a consumer or by the core, the first enablement
> > always needs to wait.
>
> Just take a timestamp during registration if the regulator is enabled,
> we check if it's enabled anyway so we may as well take that as the last
> time the enable happened.

Yeah, I just haven't figured out where exactly in regulator_register() to
put it. I think it should be after the supplies are resolved, so maybe
I could do this in the "final setup" part in regulator_resolve_supply()?


Thanks
ChenYu
