Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4121531E8
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101953; cv=pass; b=D9o0kEGZK+wABABO/Hhu9Tw7MzsEHzZ44S8llqIjmoUir7vMGlzUdmfGXb509Jev/YGKQ1g4jwC0VRI5Oob5xD5od41b1ax7Xrq3S7dDz3W/rrUtQmnTIX+P37wudbv1Xk+BE8RbInLjZ2ZscbKCbdUKn1DXa6cD1xjo5d21wZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101953; c=relaxed/simple;
	bh=ES4Wwnm7LDTekDfxBkRjueXtU+JExOHrirYIoXL7mMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqoHqdCzT8k3seltqwwaNK+IJIjZgwwS1bXaDj/5QtPfgpi5Q+nQZlSRz1X5j+TYPFQpUVEmYxrMQHKUhfSrdGkqxEFL73syjE2AAOQ7fznjiLvN3j6YzFUbqxfxTtqiR65ZVv0KbnL3seZSxl2cS9j/TUi3aT/VsRWiULdyuRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFfICjz2; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFfICjz2"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30749947917so2882207eec.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781101951; cv=none;
        d=google.com; s=arc-20240605;
        b=Dhp9PKCBJZDXAyg+sh+64QlJiPq9BfA3w/ULCi1xfmQgJsUAiEx1dqRI6DgMDUBolT
         pCn21LIgtFhkJXrQyrp3Fc/1rfDvIzh1zgudC9PSIV7ws9T6rU2fY+IuHyFuBxQCXjz6
         wjSxqAT4EqwY/NCSJXlyNmAEUl0bWtMcsnfnRl51TyBy5yg71CgwRripCPE9TLMO/6sq
         vurhUiZ4N9drxaWMzZQiSxrkINbFZM7isekhAAHdANdjVVljkJTDw/Zl7TgUrAZ8vk8/
         3SOlySQ85+AmCBD0xuwyrY+3dzY1TBUXSEvA3mdH7XBPwLvLHWPyWt7EhmEnaDC4kP3h
         N9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oYlaQ1NUVVCcD2TPrqOfDsKTXd5iB9hu+Glwj3KNaZ4=;
        fh=vxxOi6JivRy7IrTlZWG17CkSh0wLxoI8Oymsfsn4yeI=;
        b=F8KOU5CZ3hKqGKHe163z/p9qudz/fsuO1HnqhjscDE8offszfmJSbVrUNvwhSk7ynK
         d4t/u0112iS+BKBZhy72TMnbj6H3uKuPUqFQ53pbgRlkgq4lcoNreZteMDJUMn6oN+gi
         o9bk9JBYI2CVjhwSWEghfM88VgoBbxat2aIAlMvAzHn+TnGNOe9GFBhZd+jtsi82Plgr
         MfnsQUrCukjyjr06TU96j2EK7beRSehk5U15XtHHlEWIlHkZ8bjeULqGiluidEoUfcNr
         TUztWMKAxS6U2VVCgXWfNAWbSfyCdtJcuK36SeNQaFKAiSFnjG3as0gtuvRDpgPw167x
         urBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781101951; x=1781706751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYlaQ1NUVVCcD2TPrqOfDsKTXd5iB9hu+Glwj3KNaZ4=;
        b=WFfICjz241T2kl0XBGu8welhc92Wlr0xtBHWITgpIxMHe5DxxLf3s5BWWcXF40Xct6
         DrvQRQNtctSuTLpSt0XKQtpeKOMV/lQcK/UvwFeXNjn58A0px0zqWy+yvwvzd5LMmEYX
         mgPRZFEgtH8pZsOaQdbUlGyeI/lmOxLN9cIAZLWnYPpLijeRi/9z+aVo5dChJ3yYHZWx
         TtiLfrcb3JcHBjf/RXCLb4KPIBxjVQ0LTSWoe9A9ENoedrCLZMrUGAR5UZPoW5xv1ta0
         LI5J7MH/UfQFJ2bFvddlrEMHUSicdIIpUCEsQ2tt4o2yFLWF7f3YdQP7G4W0Fa3Xbp2O
         V1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781101951; x=1781706751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oYlaQ1NUVVCcD2TPrqOfDsKTXd5iB9hu+Glwj3KNaZ4=;
        b=FYGRyx6xpyz9db4D57jI62/lYmBRQwEA8luTkDQnOoJJ+B+ApUoiJjIVReVQnXMs8V
         03HBLPuqqJIZfY0l0yOOL/+VzyTVBVzNo7ccMUzsy0jleATI8TeS/YY4sP0JTTKhoiIF
         mNXmiHUqxNtbcG46VRnwZa4AIdAYVfwWZ0clQ7CbMQPwaL/ypJNwQC9seMz4Ml7Mw9Zc
         O67mxkXiUD5gDRGhY2ZGxiT6qYf/BLRG+EKIj+4T7Fb50roVxK3IcE7+a+u8MfkVQPDd
         zOqn5G7GwpdN9hyTOiaanM3LIhkHLJzDTtvmvqYaSXrhoHnRkyVeBuT+zVi9F99WZ3Ve
         tD2w==
X-Forwarded-Encrypted: i=1; AFNElJ9FumtEmRuWP5Z2V+418QOXRukzAeVS8Cg1Jy6z6xvkarrMOXamnoFyRxCmnrQO3iSRGeB42O7nzDjv@vger.kernel.org
X-Gm-Message-State: AOJu0YyZDWB6zNr3zifsqr1gHEKUX+DcG/jr22v6mgKDR9YvtVmNr3Xj
	w6acG9gk6iR+vrEGs8TQ4QjrkY9oVPLidcjVRq5R2dNzQKaLsPll2TMVAIYM0dyX/KruYNbRZwe
	8IFA3jiCW7E3pn8sWTSLXeHAZPnTAxSU=
X-Gm-Gg: Acq92OEO6Sn0JhHo0xx25VA27IiJ2sQG+eQgxK6qBvFW66KnT9YJD3wzYFyUxCce5AW
	RXyl4QUXv2ejeVY9ZNSD8vk8D7B4MsmkTmajsPEIutlZyNz7RuyKcaaOvCXykekbBQeKGQuASjo
	2y7J0E62O+8XhzuYcDdHB0gUC8/dAkdevRkAcn88ffOJ4Qj8pWwljfrhURh5Nzwm4iNF18KIANV
	jtVcPhm217jzRmmNyvzUsDi5SLnsJH5948R90fZUldsFATGltocvLHxLXvh8t5d5U0BbDl5pJFY
	xRj138pALIa10EvaDVk=
X-Received: by 2002:a05:7300:7304:b0:2be:2cfe:68b7 with SMTP id
 5a478bee46e88-3077b3c7767mr18495535eec.11.1781101951047; Wed, 10 Jun 2026
 07:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-3-clamor95@gmail.com>
 <aiPDzdKuccdLIvlF@ashevche-desk.local> <CAPVz0n2rdgw8Xr3uxVdQGwrHTNFqK4SKQDFU2FEB8LzLwPhQ_A@mail.gmail.com>
 <aihjVZ9xvM2BRFu4@ashevche-desk.local>
In-Reply-To: <aihjVZ9xvM2BRFu4@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:32:19 +0300
X-Gm-Features: AVVi8CeI8hlh1GbQ3AYGIMwG28HB2xx8su6lqiYAmfvLYDOtgithK37JF5bkrak
Message-ID: <CAPVz0n1fHWCpHN93v-dKfzGYhvB-dC1E3JgQmXpvfr6bGNLqcA@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] mfd: lm3533: Remove driver specific regmap wrappers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:02=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 10:22:43AM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D0=B1, 6 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 0=
9:53 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > On Sat, Jun 06, 2026 at 07:57:26AM +0300, Svyatoslav Ryhel wrote:
>
> ...
>
> > > > +     ret =3D regmap_assign_bits(als->lm3533->regmap, LM3533_REG_AL=
S_ZONE_INFO,
> > > > +                              LM3533_ALS_INT_ENABLE_MASK, enable);
> > >
> > > In cases like this perhaps leaving mask would be fine and together wi=
th
> >
> > I prefer to remove intermediate variables it the helper allows to
> > directly pass needed value.
> >
> > >         struct regmap *map =3D als->lm3533->regmap;
> >
> > next patch drops lm3533 so there will be als->regmap which IMHO is
> > more logical instead of passing entire lm3533 to child devices.
>
> Still it's longer than map. A local variable may help with making lines
> shorter.
>

Introducing and assigning a local variable for a single use regmap
operation seems excessive especially since next patch removes operator
chaining leaving only als->regmap.

> > > this be nice one-liner:
> > >
> > >         ret =3D regmap_assign_bits(map, LM3533_REG_ALS_ZONE_INFO, mas=
k, enable);
> > >
> > > >       if (ret) {
> > > >               dev_err(&indio_dev->dev, "failed to set int mode %d\n=
",
> > > >                                                               enabl=
e);
> > >
> > > In many cases it won't increase LoC count.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
