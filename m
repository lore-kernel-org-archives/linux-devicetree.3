Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2016730170F
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780727724; cv=pass; b=hGaS4DS1SlCAHFfXPSKMxU9NaGpl1tB42BdbvUWm3U0PGloyHirGFhbhLHJ8H84vXEm/MFng9MD8ZPtgu+eFILi2du/HWevmZiI8wpUD6W5Rn3/k5Mo//09Giou6Dm+rKHhlN25Qv8twgIUqE4OFSyAvDBKyTXi/5FTLY1SR7xY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780727724; c=relaxed/simple;
	bh=vKwedzqy6mEM19C5I684s46udVlenNF3T1oclqfVZ2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pl94GuqI823jXZmx62gQh77GXM+SDMQS7vxX6YSGDWp/sl0qSAyBPKl63WPE3Nd+dtOYVZEqkjAYdnnzQMkesvTE/ihWuU4knXc56PbmxQlmd0IiELEUD5A3Xr8VKyIpnxffs0s0AO/Hp54t982HNIAEe3UkIIP1Qh4xgMXpP6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sERLTjam; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sERLTjam"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7e2f3646c10so31927887b3.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 23:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780727722; cv=none;
        d=google.com; s=arc-20240605;
        b=h1B0+UDcSkr8V7PTEKRk1Gg7tyws9bTRblWso3QLtLjzkXYjpwiIyoP9ZQHVZWaUGv
         yKimaGzuqSp1lYwsIiZ1sHnLmz1rlpRnZKwd+usLEC+hHnD0ela9NijcmuIvibmIlzcj
         ZEY82VY7BxYIpjvLRkd/m8sYhHAzEsyrf/3T68iwTFXE/BlcfzhZS3/KtCz2LkHNTF/z
         bBqJIlh773wyrNDmHzrjLynlNIcsF9SMiNPJeepIb8JcW1/tzF3VMWuanWjhILc7FOX9
         zLUpbcaFxg30GHyogOeRJJFxtfOow1Zvqhn7pVDWhz4WQuMKrRw4D90tY7eG3pjXKGtb
         jZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0qoOBC6EVVCwpzzqJdaViwVAGo8hVP2pFjp7UJvoZwY=;
        fh=YkhXDkO3XkQmlE7V1KUKlV/XR3Wd519f6VZnMFTBTww=;
        b=fRi4rmsdRfI8QTA5j16ruu1/ipTkrrZNg7FvVUN/KfQNjQkP7Riy+KOTqAqIuLzb1g
         NinXubqXeBOia3H1ayefAM39DUuc3BoMgTxE5qsmO9PkjsDFP6Lmk20v5CT9NP4EvzSU
         KSYuPIQa9CqsVsjamcHrA+gs4QbrQR2im/if5yhNwKGY7jOgiIzzr1dPz2aMHVk9Nfhw
         saHT/XJ58WpMe1vAFpdq7yLytZFerPiPNloll2lbvOnb5+TJmAeJwMZcBPAV5FKftW3y
         QikVa3Ns4FNHahpQkTv6nram0B/WNsqadB/LsJ5D9g3YsLdo5PfzWSFEacEe5r3rKrUk
         8mhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780727722; x=1781332522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qoOBC6EVVCwpzzqJdaViwVAGo8hVP2pFjp7UJvoZwY=;
        b=sERLTjamFcawKFp8MQfCskJLzc9YD90x58BDlDcATBCOC8TRLF09nXDF0sF5xOMjE/
         H9XzQDD0CU6BbhJMKQYHhx0WEoq1SucIcdRPZCvT9/wG0iprKtB7AQGINH8SPEJUAKnU
         cd6LHV8ARGXJf2/Y60aDse9xGO15DSRG8if/RqQnaWjjCPIT/vTI1TMCchjuafRSj+2v
         9m4ySS2Kl7k5uLkJa1pfu5xj/CEWV0DSXetd8PQ2h5paLci6BGPBcdYVwjKXCneW3x6c
         ExDPc9VbWsMujKHxJMiOcs0lLeucgsZbblPIsW9I/z+dmeq7gmGLfV59Az0oThZPIQ/H
         R3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780727722; x=1781332522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0qoOBC6EVVCwpzzqJdaViwVAGo8hVP2pFjp7UJvoZwY=;
        b=cbbnw5gWQ4DVQJIplhXxxjDAa/rIEmcdT4tvoUG7zCwUD8Z2uPITIZOYBrIFDlH9R3
         bCbdgprt843eRwpLAlAUtUfr9sn1C4qIg9cUZsPb0x2fais1yqz9gaUrOCciZfT0jQkO
         Fjnmr+0el5Bbk9p98PFRrjqlYw/qsNR/wMcW+rSlzB1qcT9wUKQY2lAlHV9lezVNZzFg
         rK4+JDKZqdybJIm9mCl3BSKKnfOavujvs/wk1qrQ+C5RDheNjYsDMPDAjFiHRHiYbP03
         82fZ66ZGUaMHLKSbNDeqEwwvZGu+oWipAV23hz5YCAUl35sNrMS1hqucIYOKblWkLt0W
         GAGw==
X-Forwarded-Encrypted: i=1; AFNElJ9GXKTiU25awYx8SKy8dzjlTlbfx5QPrPfnWoHXsCvIva0YDOjMvMIlVqf+PBC1IeAWe98stJdqY+Ms@vger.kernel.org
X-Gm-Message-State: AOJu0YyHkJAw7IJbnZR/J3Ax3EznjodG6e1mBSeray/CUcozYSmRsPmq
	XIuyt/VNLL7wzlkoKIFT9i7X2IcNQo3CSy6Fkuw6ZlrUgbOyELoleNsK8vYsexnV8NHWygYOHsE
	UVB8D1z5A+mwPQKUCs5Vfi4EJYDpD89s=
X-Gm-Gg: Acq92OHvlkwakpi84WXOX1em43i0a7hbJ7AiIuJugw5HnliI0/NZgWoEkLZlWucAHo1
	jwtwUArSP3lbimRjLb/100wWdvsWzvmR2JnN9eGtdPeTVWXPIEjxJi680wpfPn3W2aLd7DZL2Mz
	IAjuaM2bd76fYQxA8JP5msEI4zdD77nfdand/2RXz8wDlwU6cVF/ZBZ/4w+DP/NHu2F4rrdk6cy
	di0aosANmwYjVXMvOpmJYdQslOy6NxUe9l6UAihacYXM2nO3S4k+6ol6boDIhKqIofx21o1mF42
	9dCEy8RcfxfHxQ3pZJQ=
X-Received: by 2002:a05:690e:4388:b0:65e:14b6:b1ce with SMTP id
 956f58d0204a3-66106e078d0mr4462469d50.9.1780727722199; Fri, 05 Jun 2026
 23:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505053201.5795-1-chaitanya.msabnis@gmail.com> <177815512250.1119572.9279436421990255678.robh@kernel.org>
In-Reply-To: <177815512250.1119572.9279436421990255678.robh@kernel.org>
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Date: Sat, 6 Jun 2026 12:05:11 +0530
X-Gm-Features: AVVi8Cf6rCMok-6bvEkyOosdfvSx8NV93NAyUuh-KyB4WoE3yoeqMwf8uY47djM
Message-ID: <CABjkosEpkuErYAaeDT_aPvcnYSDTwpZkCO9Nvnxjb=T=m-ow=A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: convert altera i2c to dt-schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	thor.thayer@linux.intel.com, wsa@kernel.org, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram and Thor,
Just a gentle ping on this patch. It received a Reviewed-by tag from
Rob Herring a month ago.
Is there anything else required from my side to get this merged into
the I2C tree?
Thanks,
Chaitanya

On Thu, May 7, 2026 at 5:28=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Tue, 05 May 2026 11:02:01 +0530, Chaitanya Sabnis wrote:
> > Convert the Altera SoftIP I2C Controller bindings from legacy text
> > format to modern dt-schema (YAML).
> >
> > The hardware constraints and properties remain identical. The example
> > node was updated to use a standard 32-bit address space to clear
> > compilation warnings.
> >
> > Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
> > ---
> >  .../bindings/i2c/altr,softip-i2c-v1.0.yaml    | 62 +++++++++++++++++++
> >  .../devicetree/bindings/i2c/i2c-altera.txt    | 39 ------------
> >  2 files changed, 62 insertions(+), 39 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/altr,softip-i=
2c-v1.0.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-altera.tx=
t
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
