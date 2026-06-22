Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A2635CB89
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782109345; cv=pass; b=bfHBOWdiEketnK/3i96XgXZVJ4F5XjSr5X8U65MAP5DZmx7gJbtZIIZ1ntEptJ445Bli/xSGmdfOrofWAIOHGQC4q/fYgKZAuS08PS/QrOPKbJ7I05KWJPz+77SbYe1MGmsnDpMB7Z92pxKhv+RdkaEZJbpcQkdxcVrMEFht/TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782109345; c=relaxed/simple;
	bh=zFtLe7bHlDNyqiN9o7mOWwbiL0VxRTwL1H2qBgvovpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DA0c8VVFCh5u2hrVVJMsV5jYFWKe4tQ6uW4wavLv2Y0zhvvkd55laGSmmP6m/DnmIy9NJX1ijkOlEnsHJ7KRmUxqcOr2ucagg2yFiEU7fNM+iID6Nkh24QsdUhxxI6D47BkF9DtJYVdBkOKb1+IjPn4pYPpcbNjxiHH5zG7Bcso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5vO+E/H; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5vO+E/H"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so7330808a12.2
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 23:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782109342; cv=none;
        d=google.com; s=arc-20240605;
        b=fAOstmunwLz6saPbEVwenWmIhnjmqI01eLHarlGbUa+2pB+uxOKH8YVE5F9Y5KaSv7
         9N40NSng8Sm2V42xh8mqt8jx2VQz/UX4GvEWGPPdCPqSoxDeL5tYgCPLjtMaSUpHpNfI
         u+WxKKxxempHZMALZfUPk5MzS9Cf1FvpQToAepNIcF9Gc5UbudcTdwjI8QNozzI7LXqN
         xdZA2VxCxbyXhLWBNtyK4BinVCKyVcYolSzSenn2f2VG+afQEoi/kRUAdQPgnixO1WI/
         TOCPsUG5fOcecjJlOLJWhEtDOgk7tFB8MfsP0rFURampmDOU4Kb3hSbdWAU6M8um9K73
         v6vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFtLe7bHlDNyqiN9o7mOWwbiL0VxRTwL1H2qBgvovpU=;
        fh=NVOoRp0xHTUf2iOxgwOhIxIezZOWcQhYnpj0lCp1Cns=;
        b=jMhtmRuNu6FRFK8ak0EPacFe167j4IQX5/QNVSWKBEIO27eTeiIGxOhDxbhDIfDFUQ
         XMHnDBPXifqI79KBzGBjEh6/KBTrcAT/Ofv1aqjEq9haD1We2QJEGgN5N4MIjG1khpF2
         mtZGw0/dibtuCGpwJYDSXDC2Yba/oT8PVlk5HIgNm76nNwqtsTWrpcSsj0K27z7rwpV3
         Nl1TyC7c9BZHXh2RVQkQvJ0Ngk9uaX/6x5nuuzN6Mo9ofvYBqKdB4vTaz7LIgffJ4E4G
         2y2axKfQA/bGX7zmul/a3ZdqMKg0QtfJFcUJz93onXV7nZy6M3ZzpRMCkSBxZszM/0gJ
         0+8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782109342; x=1782714142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFtLe7bHlDNyqiN9o7mOWwbiL0VxRTwL1H2qBgvovpU=;
        b=h5vO+E/HgXDkmH7vpHrVw/tiPcpGWTM1+78jvGZcuZy0fFT1Bglm2fxCLOq0a6KIXx
         AEoppfTqNelWq1PvAxJSpl8j84foZFKRw1kTmtzT72Uo3l+kr5QeLQNp288spA1tRf04
         eYWPtUqRyh5z41J03K9O5bQL+cWAhh/dyFGkE2YAho4SNQw1WzB+xJiHswNgth826jkO
         yNlZtKF4+yJGLf0A6Ybobd2Uyhk/soj2kV356VbPTRKy7TzBcf0ZLNEntI3SOLEPi1VT
         FxNUxvNZHCPJKskWspxVIpNqjcfryR1gQigq0Rfb5Lkew3x5JJh/V0/lnw+4of900t/G
         LPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782109342; x=1782714142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFtLe7bHlDNyqiN9o7mOWwbiL0VxRTwL1H2qBgvovpU=;
        b=jFLjU04ygm0ctfxDmMusLnvmYZgj1OU72uAb1JGYnUrn1yaInU0Xu4t2ox/wIEuv0V
         CSwY926ereOQqH2+ymrQzCW8dgfvF2FnQd/b830lmt6zGda7TUgmUh9puX+JScsP3MQ3
         LX6BY6tEK223Xomd6FIMxLclJwP5VW+wc3ElHaV2U+taPa3Kr8IAQp0W7hiE/B91AQNF
         dE6HtYk71DNIvUirhdPI/nnU7snL2yEJGNX3sgvBm4ATIEd9rrqB38fiml0J8Raq83vB
         QY4PJN6Z+it91VSVzlbtl0YEuTDHOLQuAUWpoWK/iiZXpb/6aHQ9UWO1hlKJF5fzJg0w
         JLsA==
X-Forwarded-Encrypted: i=1; AFNElJ+5XILlRiFdJhSc6kfqBkKHm5zY+/tWU20TotXcWfuobSfjiW1WhVpTu/oTI0fnNIEdlQhwOYq/jHuD@vger.kernel.org
X-Gm-Message-State: AOJu0YxKQQtZDdwMtsGK67d1jvSnyi+zioqEClDXXpJ4FlgwVILuuH20
	VZrAtoQA8H1+I3w6IipwRDFSB6wEvzONnrlKXTsqKPcqPH+0+rkNk8k6H3CnvBDilYMB+v44EGx
	EjW8TCrmiW33U+MT+v1QvuV2eS9X5VFU=
X-Gm-Gg: AfdE7cmIC0E7FkW0S4Ck3NZX35vXI02hCo0EYfbHgfkEwSTpxLEpg2uMhWkv4RvBMyD
	icd1bjQfPSMMI2vldmhtbN+duYlKsl68QtmbYEgSdWe8/AbAMY5qjteG3PatZQIETdCe2ymuTpl
	5yQLds2BsT1POp2dM3cRyIeGBJlfYh5Zfyrl2NYnxi6RPjo9XvMcdWL/WCBwG36OVP0DT1MzJr/
	9OrtwB3xMb5dhCMwPaVy+SBYPk5AEAImBFKkrzk0ffbM3bpYB1Jc60SpFOk+MvKeiI95CbCaeEx
	lNdP8VeKvpOcJa6o6t/22jFFfZRa+mR9VPiWcA==
X-Received: by 2002:a17:906:ef0a:b0:bfe:ed35:e85d with SMTP id
 a640c23a62f3a-c098f33f303mr589087666b.53.1782109342002; Sun, 21 Jun 2026
 23:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621085209.52651-1-adi25charis@gmail.com> <20260621094312.53655-1-adi25charis@gmail.com>
 <548d66ce-d01e-4c6a-a77e-7d61378a1c74@kernel.org> <CAKt_FXsiXv7dai+F7cT=GNvETa5_42su9G1ev8+_fph0Bg5EbA@mail.gmail.com>
 <37006444-95a7-41f1-a5a3-58d116c10c14@kernel.org>
In-Reply-To: <37006444-95a7-41f1-a5a3-58d116c10c14@kernel.org>
From: Aditya Chari S <adi25charis@gmail.com>
Date: Mon, 22 Jun 2026 11:52:10 +0530
X-Gm-Features: AVVi8CdDWH2N71lg_P-oMu90jHTjmjLYatrFS5MA4jG1EpXkKA4hwiirjhgvaE0
Message-ID: <CAKt_FXvjHshej+BG+CQQbdQ68+RE3pKns8Xq5dKCZKH0uioK3w@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: misc: add binding for Xilinx AXI-Stream FIFO
To: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: jacobsfeder@gmail.com, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	michal.simek@amd.com, lucas.fariamo08@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026, Krzysztof Kozlowski wrote:
> The main point is that driver is in staging, so we don't take bindings
> for it.

Understood, thanks for clarifying.

Regards,
Aditya


On Mon, Jun 22, 2026 at 10:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 22/06/2026 06:21, Aditya Chari S wrote:
> > Sorry about the pace - jumped from automated lint feedback straight to
> > a new version without waiting for an actual reviewer. Won't happen
> > again.
> >
> > On the staging binding question - I found the driver-removal thread
> > from June 2 and read through it. Michal Simek's reply makes clear this
> > driver isn't going anywhere (their networking team has plans that
> > depend on it), and that there's already an in-flight binding
> > conversion from Lucas Faria Mendes that he's actively tracking. I
> > wasn't aware of that series when I started this.
> >
> > Given that, I'll withdraw mine rather than duplicate work that's
> > already further along and already has the relevant maintainer's eyes
> > on it.
> >
>
> The main point is that driver is in staging, so we don't take bindings
> for it.
>
> Best regards,
> Krzysztof
