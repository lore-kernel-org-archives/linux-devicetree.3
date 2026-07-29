Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D38F3C9890
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 20:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785358550; cv=pass; b=XqN26Hqzr2eEkOmlSk7p+npIlqGyk7Xy73GjTON8jEL9vv5rKDnoW/RCmFtdtJaRqZho8WC8UiUbeAF1D4nNSThgXjAJjDe+3AGvI8Q5xtDhwyjSy2Tg0JSIRbzG4iaBwRGCDZ/SbEaUmmDDoO9U/M+47nr0WrTJW3Kd0tvXtJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785358550; c=relaxed/simple;
	bh=xBpt95yUlNB7dyXPnHP9dkIEkat70y18dIkv2UoDPBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rS6hww0oIn2qeG891XNkBQxTToyQJoRxS7cj4wEwU/Z1h9MgLzTD7kY4lqOMviXLjk7qgn9pN1wY22xwtpaSx5GVEMTwnZGf8qlZQ4yx3ScZsQbD3zYhkM9zug6lGE7Q4Bk1/7yRqyuWJueuxJPD3u6BmlNPhso+fc7KXBCRmWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbgT+maB; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbgT+maB"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69fc2261f2bso2156997a12.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785358547; cv=none;
        d=google.com; s=arc-20260327;
        b=GZsb7/4uWwmt3tb/KdOEKBCe2LU6wQGIf/YS6Iz5PzYjnHnMQOSeOEXmIasr2aeqFy
         wUYhi98ZEQLUtax7dDEjJuoggwuA7Almc/KFxuJafQPvkmZ2vvw15IX4rlhVeVX7gHBt
         Gs2oZfp3jO1/9OYSFur6FE72faEyhM+2JXqbu0CCXnQ0zaFWQE/2RpUrCjCvX6jL76t0
         nXQ3mu8728vKvolyLtffFxAvMRIXwQLFkOPjM9SlONsA3c+2GglzAqHOmYx0xjeR1CoT
         t3ORK3heAnzAo1YZDniFNh1oxU5F0mlV8ws5ho1HI4NGesxOGLmV9JrIQkmsiF9UYXKe
         9FZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XtS0TcGK8hDmQEF83nP4TpYXyV/msuo8Td/PCQGmVwo=;
        fh=/ewvKJklKpQ2uCZh8GIqgJtMjpFa5XlRAodmNEK5lfg=;
        b=mIC4Q3R4f+L/zrrUTmZFP8ziEgOnFY0uHOY2zYtgd7H/2E+9rHzKvfFXHA6vMAIBFu
         ROAw3eNw10VdbNgdswuQrVLO4DaEfyO82bxLGbn+u1jUh+0cb3DKbcqgRcuQIPyBFdYv
         rVlG3Oo2luECIia6w4Y7aqYpNBZu4jXuQ81vCHjiTkm03Dd39ogzGENITUsMZIe69oYc
         PCEiF3J1CGgjT/ROO3oWTsVlk+JgOk4uac4ju9HW2dM57FpRIDNgxEipgKC5kRhMaVId
         BtRMbHoBFb0ppQN2zV7B2nA+zQHnwOwd7MJaOFCfOKO/odAbVaxIqbxZ9/goIEdRDXzS
         Bg5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785358547; x=1785963347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtS0TcGK8hDmQEF83nP4TpYXyV/msuo8Td/PCQGmVwo=;
        b=CbgT+maBuUKApmAWeUNBKO7HgHO152KvWyoISHBdfXZTaUAKpc36UJbKHu3qk8Z//v
         CS0SwPsYv6yuFw0b/F7D+JQS5lzzkRtgCW9Ud4mGeXXPxwcDuRq5UjGN5TM2heGnPx3P
         ec6aNWrVHobGgTpIR0PLL16Qv5ZPFvx76qDLVatKVLf09qdCkSON7o0UA40nwolcW+Wn
         xV28CSx8WL9XiaGT+lseDa06ONX4uMHC3if5/O3wXQHE9QCkgbBfjYoTU6zbQKPLG0Lh
         ZXTBsx55vXfrABpqI6zkAO/1VuzK0/1BJIyzVv7/kx8IHA0Z2zr6fi0i4FbLHrTx0GKf
         3p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785358547; x=1785963347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtS0TcGK8hDmQEF83nP4TpYXyV/msuo8Td/PCQGmVwo=;
        b=qRqf2arSG90zRDKDVB8mpgSLdt6WrJyD+aI6c90/MGv95gpZT2P3VmX8rzIE5r02Zb
         ru/BU/ggch1sVoG8FKhZhC8zA7ljrWgVlhzQU7MYmuZPW5jTuwr8z5lQRZ9nj6QDU43g
         SYatD1C0y3gwRD4YF0Bz0aVLc7SeDLWwWv7CmWfVdnkA0+xLLph/wa4dKhW2Gl3q0+wZ
         qodvv2k18t6wy3cGdGdZdd1rlYw02P5MzQmvdC8iq/hijirJyNvoSqRRwGILyhzCAFtr
         9RhTFJYUizFXONJKDEt58kxleyqbzHqA/zImvpqs6Rd5m7ocWiWCmYqoxklVuycqGLs9
         Bxhw==
X-Forwarded-Encrypted: i=1; AHgh+RreYI+BdTmldvKClZrQCDwH3Bs8t4J0M+v0M9d/QwQ1iBae4r6L4AgdjdKd2cyz4euugQbx+fn5fc4e@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqFwimbdV/aCFgTfOaoBPr3rwXqvls6slrh8N+j3Dev+xIrFs
	PkjGljsPf3FNAvf1ZHJb1E75hwbFPV0MeqbmNampp0vK909zToVtXZ5uc7bnchEv0LIjQCRZuU6
	REhPWiNLtE1tMwaPuBqmn0eghsi3e+sU=
X-Gm-Gg: AR+sD10xlRt/8J9ht5zqUnUrbIhe8XK9efiqsJHVHmPHKMnts6JrghxnfvWbdQuNOXF
	UiodIgi/ecvdvqdTgSLB5ED6QxUdmiI1e1E90j1vz0XwHIru5EPoJyHkZtDD2/5NQXCr7yfE1oh
	mk3jKeU2aN73/8b+grjUlUEjWvEqLOCGWJk1nn9Wj9YVHPGcbEaT2fauSwbroZIKm32vr8s3WcN
	CdlvenRAvHfkmeuihf1Z5uTfeYrnQqrE3NAfWaCgzfh0CIWcXJhkAezUDkUPLwrf2Y4k7u28UYI
	xJKuZrhH6klhE3dgk3obA9rJfXc9uXHt2nB/kRyajuLLVOqz8YMGkvhHEu/DkFT57sok1bz1jkX
	59J6pyLF+I6S2H0pVWDlpHmewQ432A2aurdFzBy94wB9MKiO7j/X027IzFGg6Ju5rJ5jwGiLL57
	q5qMyOJLrk3jMZwYIatFhc5Trczt1MxKE8uHsrZZl1W5HssbWu7HI/hkI=
X-Received: by 2002:a05:6402:3997:b0:698:5610:76e5 with SMTP id
 4fb4d7f45d1cf-6a07b7bf461mr16049a12.6.1785358547498; Wed, 29 Jul 2026
 13:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628231156.1254012-1-rosenp@gmail.com> <20260628232714.BD9581F000E9@smtp.kernel.org>
 <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com>
 <ba56ee70-9702-4b11-ad04-d63322ab60b4@app.fastmail.com> <CAKxU2N9Nt+HF-4TzB3+_5ta=28wb0xCCLuUVO6Bm=LW3ZnNmHw@mail.gmail.com>
 <d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com> <CAKxU2N8Akw0+dc=wHUmLrqJe6d6rrk2O-BqeRB7D55iU-S_uLA@mail.gmail.com>
 <3e4eb418-d574-4516-8c5a-1488c87baf91@app.fastmail.com>
In-Reply-To: <3e4eb418-d574-4516-8c5a-1488c87baf91@app.fastmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 13:55:35 -0700
X-Gm-Features: AUfX_mwLSIqOBTty3Zb1F3fX3ESUnz-9OwUqeGd-wOI408xy4GFiNYJS_MluqII
Message-ID: <CAKxU2N8LUpmj6ihYrZKN-+8KuQ6zz-XThWWWg9O3KDe3AnfL8g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
To: Arnd Bergmann <arnd@arndb.de>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 1:43=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Jul 29, 2026, at 22:26, Rosen Penev wrote:
> > On Wed, Jul 29, 2026 at 12:31=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
> >> On Wed, Jul 29, 2026, at 20:13, Rosen Penev wrote:
> >> > On Wed, Jul 29, 2026 at 8:40=E2=80=AFAM Arnd Bergmann <arnd@arndb.de=
> wrote:
> >> >> >> commit 4f061464281d4964ce46dab60d36a09328f14862
> >> >> >> Author: Rosen Penev <rosenp@gmail.com>
> >> >> >>
> >> >> >> ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
> >> > This patch can be dropped.
> >> >
> >> > https://lore.kernel.org/all/20260727140939.389-1-strst.gs@gmail.com/
> >> >
> >> > is the proper solution to the problem.
> >>
> >> Right, that looks a lot better, at least as a hotfix. Could you
> >> respin that one to print a warning in the loop for every bridge
> >> window that is not bdev->addr_s[0]? That way we can also fix
> >> up the DT to have the correct data, which at the minimum helps
> >> avoid nonsense but may also be needed to avoid future problems.
> > Not my patch.
>
> Ah, my mistake
>
> > That patch effectively ignores values in dts. Needed because of bcm dri=
vers.
>
> Sure, but my point is that it fixes a regression introduced by
> 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully"),
> which tried to address a warning about missing ranges in dts.
>
> As far as I can tell, the patch worked correctly on the
> platforms that had the right windows set (presumably bcm47094/ac56u)
> but failed when the information was wrong.
Not quite. Full information here: https://github.com/openwrt/openwrt/pull/2=
4415

TL;DR: fails on both platforms for different reasons.

I have no idea how 767012397976 was tested. Maybe without a broadcom wifi c=
ard.
>
> Having addressed the build time warning of course is an improvement,
> but I would argue that actually having incorrect information is
> worse here, even if the information is ignored in the end.
>
>        Arnd
