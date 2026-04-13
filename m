Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65E8201113
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776062733; cv=pass; b=YGprt61nsnckGTpKN7Jne7gLsmgLgT+OPpnWr84vAKzQD9upctBKyG3fJRn2lgXRV9YJz//zD00EiwC4XkeofFoi30Cl65kSQXZfAP+ms94Gbw9z+7/RQrZepfSK6HHrggV2ejy73+q1nSaFTFinNYhwTn1sBRrQt8rvlYf/S+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776062733; c=relaxed/simple;
	bh=UVrAExvrLmAfu7dTBwM664LDvUTubnQncoUSSl+XOCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9KarWo3dWWdmCtvQZ8C0yI+0k9I5ZIFKjQ6/geczn/l7QNx6MFHBXURj9/iaYuCkKuXgT78LeMvwzz6ggGrimCXJ7UUfTu1IiQ4dFJ0b86gZJnA4wIe/8wHl0PtW52zLQN1L9h3z3svz4IkI7eQtKNsMTt9r6Slbux4ut7KWhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpZWYgsO; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpZWYgsO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b2503753efso34265925ad.0
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 23:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776062731; cv=none;
        d=google.com; s=arc-20240605;
        b=gXjdJKl31rXERwWLMX2DW2/6f3HRboBpLYT53ZBSttHB1nVHREX2B6Bj4YE50C72pg
         CwG2JPyMH/081rakoRKVKoZ8IveDOYBwBWViHF5ZmdsGrd4v0u+RwzZQRwLvgUtMuKOa
         KbNv/Ztx+dkBFi97YlXSqx8pvWhK0curZcA4TwjkmGT+gV1lvyxgVMJnI8vL30NB9fe0
         cth2ELQhHBydm3o+GVVT8GJyw6Wty6NezP16a99ewI9ONtfdTxm8ZWQEnqxQbspJaQCf
         Ct8SAqBkZS11GGZPN8TERkYhTgP7+vn6rlNvbDIfsXLY74VK2AbeSeeJNE+SMUx77rlt
         kAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UVrAExvrLmAfu7dTBwM664LDvUTubnQncoUSSl+XOCY=;
        fh=zj1zLfxVoYDsEGT81cMn9kQhZmWYDdGiQsVJO7D736w=;
        b=k1AhlNdLjKqe1C5Ew6iX7mCC9gZ4PmC6wZHaqdIPMpT4Qr5KH9x1frXVCJOxcEpGr1
         nwDtqfpchtUstGvXZA0ETRFzvjRXAtFtE59Ec4uzqolXql1bbCxdHG5N1aFuNdFXItvA
         VQUohb9hP9haGEwtaIRk4up6lm2D9oTxxtqrC2f2bXQSbIX43X0n7hVU0RaVsV5nUgNb
         2w7jfsURNB/EXx6GP3FazRxQHI44g/+FHwBWS1oh/kVGlO+4EGifN3/XPOE+xSCktufH
         wDQYv+vQ5dlbUL14zqrrd8LQBnpUdy5NTvBsU8rGh5BjF0zq08CmGUTF+N882IX4CvyY
         JG5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776062731; x=1776667531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVrAExvrLmAfu7dTBwM664LDvUTubnQncoUSSl+XOCY=;
        b=BpZWYgsO96LJNmndu4f0MVd0YBZJIqwiSH+2Pb9s1RAWLEITuNvQlb12P6dAvw4ZDW
         da/Pgu0zRn3YRdmc1Bh5MKqQv6+vHngKLFJauIkO9IiO3F4QXNORZnQe03qWs6c33Nh+
         IKW4++5g1rNOnkWEJXS1LThv+hl3EjPh9/5TZYgusNTenlS/Gqllv+Z1TA6AhKQRTbzv
         6pv5T3dnogCfqFheYYQvRYnPgl36N6zNZBcdydqzdMqTr5lPHqfZGGAj8jN48uiBBU17
         E2ogq27adDOjuQ5dvu3A1QzeDm9WS/vvQFBDi7P3vadh20fn7V88VSWU6qAY/qUAc3yz
         jBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776062731; x=1776667531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UVrAExvrLmAfu7dTBwM664LDvUTubnQncoUSSl+XOCY=;
        b=RDbx8G60x+HnwZUlzX1jQpf5uaIVi0YO9UJPxHMSbsXecoY4RtJ4bKnKKzyLJm858i
         UzI8HGrKybgJuzjIUmBWiNTFgwAhH8wyniaWaaP0n+CiSy64Uc/VshxvevItb3/DNrgy
         4NbK1EBCe6MEF1jM8we67wj2PiM/QaeCk0qW9jEAAZ4Ne4EZUp2bIao3RtRPm2LOfebB
         QgjU9WnrwO7PlMxNXIe9R5oL906XcFlXD6S8t3Q7621qKWvlgOeNER7dnfu+qRKty4Ls
         SnAp401wtN+tz5dLCO37zYOHmbJLTJoU0RC02MSNzV1OWpiZbfL6jQC+dCh0aChEaqye
         Dg+A==
X-Forwarded-Encrypted: i=1; AFNElJ+TsgjnPJQyuG3NXgOLfMmWlXlDiyzZ7x8vcRBlHHS8aCczpYTsY8cXlQXfUtkVVt3JT8hBtu2nJg27@vger.kernel.org
X-Gm-Message-State: AOJu0YzOquSkquZtJLKJXd/zZ4KwYMFX2QFFyyiBqXVPrIJDHHUH1m4H
	fLqcJQSZ4A3z/q/srvB3d+2kd5g3RBzCLeD7LDvU+7VBI+/NB8BNZXhAe4ovDeeXE/bdyDX2dHi
	L/U/RX/xaieyjWdLxnyZagoSz0HxghvE=
X-Gm-Gg: AeBDievbw100siiZFQr+drqFLyMrLN4voKT0AHz07DFG5q97vKSx0Cxu9IuD7Vbb1j1
	9ogPI2QObFyH6j/qi/nunV5El95kOJcFaBrw2DPdh8xFYna28AxFKCJwvrv6LnzDCKsNk3mBmWc
	dZXMuw/V02CZRyoTEHHiIx0MoPxe+Q0AgTp35uwGlmxX5tOcRgMH8dKuHHrDEoORqoOiiJkzlH/
	82dgnTBwKfaNCEQJggrxERtbELEykSHbyNssWF0TzJntIitAF3xpLcf3uBUL0ZUSmbCtsWym523
	mxintch3YQlzx2wa7ZPThqmz3U/aMSkqqA6+SQ==
X-Received: by 2002:a17:903:238e:b0:2b4:5b9e:2f51 with SMTP id
 d9443c01a7336-2b45b9e3d37mr38238145ad.34.1776062731336; Sun, 12 Apr 2026
 23:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-4-phucduc.bui@gmail.com> <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nGUyTkDmB0SgKAuM1Pp75L=m1q4bLSfhobm98TswDnt8w@mail.gmail.com>
 <87a4vfu0mz.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nH-1eBPFxtzVR6QBE1=esDN8x=hZpAkRSCO-TLmn0tRKA@mail.gmail.com>
 <87fr56vu4f.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fr56vu4f.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Apr 2026 13:45:19 +0700
X-Gm-Features: AQROBzAGIOgvxWW7TC0q36Dvf8NNepmzIwchUGKpVQO1DIYC6Qea_kbbm6ocZUA
Message-ID: <CAABR9nEqJRoHJuaJGqk=ZpCKi0P5p2V9qJKBPsz7ELkGx8e2Fw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san, Geert,

Thanks for the feedback.

To keep things moving, I will send v2 shortly, focusing on the sequence
reordering and SPU Clock control to fix the system hang, which has been
confirmed to work.
Regarding the fsidiv clock provider, I will prepare it as a separate
patch after
confirmation from Geert, and will consider the appropriate approach for its
implementation.

Best regards,
Phuc

On Wed, Apr 8, 2026 at 1:33=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Bui, Geert
>
> > > Hmm... fsi_dai_trigger() seems strange.
> > > It seems (A) stops clock, and (B) sets register after that.
> > > Is this the reason why you get error ? I think (A) and (B) should be
> > > reversed. The balance between SNDRV_PCM_TRIGGER_START, and with
> > > __fsi_suspend() are also not good.
> > > If so, can you use hw_start/stop() ?
> >
> > Thank you for the guidance. After reordering the sequence and moving th=
e
> > SPU power control to fsi_hw_start/shutdown, the system hang is now reso=
lved.
>
> Nice !
>
> > By the way, I=E2=80=99d like to discuss the fsidiv clock handling.
> > In the legacy implementation, it was handled here:
> > https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/sh/clk/cpg.c.
> > Currently, this has not been ported to the Common Clock Framework (CCF)=
 for
> > R8A7740, and it resides in a different register range from the core CPG=
.
> > For v2, would you prefer that I implement a small clock provider for
> > fsidiv within
> > the FSI driver, or should it be added under drivers/clk/renesas/?
>
> I think it should be under drivers/clk/renesas, but Geert ?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
