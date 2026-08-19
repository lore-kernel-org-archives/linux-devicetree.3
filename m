Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C024541DEDA
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154966; cv=pass; b=WBpgdIvEUDWJlTU+H119DDD65mmSnj0DYTXcRDE60lncPzKdm6DJhrJryZygdUOeqWEGjGp2Cj6IYvbafRfTpPlZZOdMIHuvOmt2pajrbhPbftwtfmVDDpVzoU8fz1zn68T4qLbFWW2AUf1Lb3s8953/d+xFL1sLSBSLAqJ18PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154966; c=relaxed/simple;
	bh=QCNVGM6JXF/7JnLS+3lu6Q1utffymbytyo9HJaN2nbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3pQkRCiNepEBxJSY9fYcU5tTSvB9cYPWQr5gVZjXHqyCxx/wH4SiGHFCkFd23tncc+MT4qmHOQFIiDaNRJbbvUo6mnPMdfECa6ioK3TRC58T1U54sH83mGz0K8aJBvdsRCg53kebKODtXo6/YeAQQ3jrCX/9fR05buDTUZX6ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUpvuDWU; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUpvuDWU"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8f0e5e36912so8919196d6.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787154964; cv=none;
        d=google.com; s=arc-20260327;
        b=aUG0iKLulr/aWZUCpHL1EEHajnQ3pskkEeexU2V5tgYY2dZtjcFfFSj1cZxJRXQycY
         EtR+Vbb03HcR0EsQ7gjRWtopFpFLgtZxJ8Q4Hips1YjWgTmWtpE/EzCubT9u+skJNJN9
         D5vOohItnr0lkYzz3Bi/o4IIeUEypsQunGRVqjpcTCw3WUPaeJ6jxiNH//JZb8kxzwh+
         9r2oujzObSVwSBuBCNMF5jVNdF6su6kA2X6Rlj57G3yXv5Ty7ITuUy4A5MjdUPOonX8U
         OqH/lSgYlgjmi/i/RKDNGYzVncTxlgeT70PZds82d7b/BVRXSINg7K29nc6P/ttOoP4V
         t+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        fh=0aGoCv+1h41CR3qPf9os3qoeYoTVQHDdvIP9ytt4gOY=;
        b=ijbWBXopbi0NjLDL7GqwTUaCR/yWT4dYobj3tcrqiHa8/8IViqbfahxVkinZjBRwYQ
         OqawuSC/rZOQOKkMqZh3sXztYIp64SWrMddTsiSW60GXv/JEunzluzDI4LK+8kupKoPc
         bPXNQRA2ZzkYmn0+q1R6PMGOFtDFyWwwpssNpnDxbBJYUCGlocr7AYo+opChZFLvuvsV
         F+VKQkFZzMnWPPCfck78GZ2JIkcV8ulJedGiZ9Vu3jb+ppQCJGk6YZhUDtclDS1o2HLw
         Ff/aDi6JZKdoajalj7ABa/D4POC4YII8CG3iv+X9K+Qg3tzRH6NR/UvCNkmtGn1LGbMr
         BBHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787154963; x=1787759763; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        b=kUpvuDWUN0iSWls7wvdw7a7lHp0AnzVBhPNYeNHhDagm7ncoLv+n5f54AEsAhkpdee
         TjzP4D3PtncpL3oG4gL6vyh5IBuE9P4kMG58txhd/UsYJGblhoFU1PdsM1K2SKloxo61
         hjpG8t9LnKBN0O+9HWFTTxRCoAqJJz1dz8gUBYkZUtF3W3d65MweQXwh2+uDjCzWjK7K
         K2Bf6icGRk3GqzkMO6JtLnt4suuOpSdbjVZDzDSD4z80+WVzCtVPZ+l+lgnLytRELCBj
         MTpGe91tiQY0B/CDFkRUCFBLUF1+nrAzFhyPzgNBMrZXeTQwPMQNdX/K/UFRTi1e7jsI
         X+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154963; x=1787759763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        b=QkGlc4npRVMNVjC34RRqiCvmyWFMKJMwRfuQuWg0YETsAkC4fpABpU4J1HPdDOAA7O
         3OoDS1dpJvowmyJDdccS8ZzV5MnkTIthuaN2Y+JZ0/yog/gbMrsl41t58L0vq5Na3BZ3
         mRvdex6EqYybRUUJyUg0EmH8Z7rqQAiFJHfEriPkpi9OrbQYLr5XrB1xC4x6cDM/vbmr
         MvP7m8r99pE9m6YmKGh2VFKzjvEWIs1AacTHB4b3wVNXRcrlIU98sgtlz9Qg6oKF7/VV
         eXwhWwHo2ZDfQTjLk3yQhr9WE/pXrY1970zkpg28JCP+Fmyxocvxyz9glkBcwEQ+RAUa
         fniw==
X-Forwarded-Encrypted: i=1; AHgh+RpdQ4wKw0e5MeQPCwaDQTyRfwGK0yUUh/Ein+TjVgAf/HP3JbLuq+9K6R8Y1E99mjR2/45STfZsqxsx@vger.kernel.org
X-Gm-Message-State: AFuF++mAmu6sdSmocq6pj3Y8pCCkMi6EFRXfCtD1M39nI2F5+Ctge0Cq
	DrmXTiTt0X6NBb1t4unEsbY7AzaE2ROY7cCfsfVCdkLWZzZ3SVnBnbwz/nG9JZbL3v2jiFsmQcH
	HLJvWwGaskIy9JhyTv4csTyLOwW2GnhA=
X-Gm-Gg: AR+sD10hWraeVRv/0Wyhcd6tVEQOa4XWnRekABJl47KscwoIzb5KwZkCYprRa/t7Ynj
	Fn6ton1pcVlmpxKWAyTN8y6+VLTFnu9WbASJxX0Ud4uCF/bWNfXmBNYX/ocLYbVrlj/OFYG/MfA
	9UL/PR3pZv0Aanm1ZkOcwrWRXd1EOKbfjJGgAfYKJ/Taj3NnVO9yN8dAajFKubNtFHEAa5mwdUt
	ftsXR0HzXXSGOBB5Z8iPpndAjtTCRE62yRpA7lVARBxvZ6BBVNvsaD8BXK8ZpiWQUcqkmXklTyW
	tIxXBaFB1LQL80gSx8r6pFWJ1oKzGQRgRXDGC8CPHA==
X-Received: by 2002:a05:6214:dc5:b0:8e7:8d53:2417 with SMTP id
 6a1803df08f44-90c5eac9942mr52592116d6.27.1787154963571; Wed, 19 Aug 2026
 08:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813083536.970196-1-ansuelsmth@gmail.com> <20260817134727.1f76d6dd@kernel.org>
 <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
In-Reply-To: <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 19 Aug 2026 17:55:51 +0200
X-Gm-Features: AcwNN1WR7Zj_IFCR5YdVpGhfxkJspgU8SJdxW5GIgyyCDjlcNc7jn8kiW6V-vUc
Message-ID: <CA+_ehUyRKtuCtak5XD_1LUMEmLTn4JfeSDapsAEwo304uxyVqA@mail.gmail.com>
Subject: Re: [PATCH v14 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 17 ago 2026 alle ore 23:02 Christian Marangi
<ansuelsmth@gmail.com> ha scritto:
>
> On Mon, Aug 17, 2026 at 01:47:27PM -0700, Jakub Kicinski wrote:
> > On Thu, 13 Aug 2026 10:35:05 +0200 Christian Marangi wrote:
> > > This series introduce a most awaited feature that is correctly
> > > provide PCS with fwnode without having to use specific export symbol
> > > and additional handling of PCS in phylink.
> > >
> > > At times there were 2 different implementation (this and the one
> > > from Sean) but Sean agreed that this can be picked and used in favor
> > > of his implementation as long as his case with race condition is
> > > correctly handled.
> >
> > Coccicheck says:
> >
> >   drivers/net/phy/phylink.c:1039:31-34:
> >     ERROR: invalid reference to the index variable of the iterator on line 1028
> >
> >   drivers/net/phy/phylink.c:1364:26-29:
> >     ERROR: invalid reference to the index variable of the iterator on line 1346
> >
> >   drivers/net/phy/phylink.c:582:7-10:
> >     ERROR: invalid reference to the index variable of the iterator on line 569
> >
> > I vaguely recall that you're supposed to make a copy of the pointer,
> > not just add a "found" boolean. Dunno if it ever happened but Linus
> > was trying to make the list iterators override the pointer on exit.
>
> Oh! I wasn't aware of this intention... I have seen lots of pattern where
> the last value of the iterator was directly used (if detected valid)
>
> It's and easy fix... I can send a new revision right away if you want,
> I'm already on it fixing this in the meantime.
>

Sooo should I post a v15 with the fix? It would be great to have this for 7.3.
