Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D1A44AB70
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784668718; cv=none; b=qTfW0W9Q+R5mZRNDILEaQndoLVZIjWKcOqi/SxwlEiWbCSQlR/qc1lGvDtLfSaGM4Kg+ovl2VDqVh8LDRRzoaaIjT5XJYUx40u5QJCV1YMFWBzqyfey0yTLhLqo+DA1fDgm0952whXU4vFHOq3vuXDE3PWSIECiZ+ulfVkFGHhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784668718; c=relaxed/simple;
	bh=K2GjvQba52NA6d2A+Y1kzcm2Pst5W72QeNwU26heDCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/JMHcV0WYWtrFdi1emg0HVvz4thKvEwsCSoqmnfYJClEiup7GWwiCnb7gKDJIkiV9sV/6bxx+6F5dZX6a1q44Oqfrjvxhcnz6rAA4XGQAa69YauDSH6dA50gUxiLdAU80NKS6Rz7a6ZT9nk1OaUHTbazQx6Z5bF4MiItKE3r3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maxwelld.cc; spf=pass smtp.mailfrom=maxwelld.cc; dkim=pass (2048-bit key) header.d=maxwelld.cc header.i=@maxwelld.cc header.b=q+MUBcYa; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=kVgOd5IP; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maxwelld.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maxwelld.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maxwelld.cc header.i=@maxwelld.cc header.b="q+MUBcYa";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="kVgOd5IP"
DKIM-Signature: a=rsa-sha256; b=q+MUBcYat2d5/an+c7hKKQ9LkLPCm366R7Q1oOzPPMxiWTUedUfh9MQUkWC2CGs0x0zyaTWDEtxsv4o5tpo86C6TuLOQQboDsKknIGu01ioaghRn41GsVaOMfB2L+IS8fBHkWL7KHtvZckHAa/G585Avvkgn+oAF5kXdp4yWovV4ApruiqtivAxYVvmR9B7JCntU5TG36aqob3vIOwQxXk3szympV1VPl+pSyOKDCYsYQ1jdwGVXgVJuENT/9kK9+9q9BcwDz9T4ogySGUnsENvdp6xbqD1zMomqDLemd1qFRBH8ebmB8b0IaIj5chn3+LZXS44T3pSP93y4u/V6Dw==; s=purelymail2; d=maxwelld.cc; v=1; bh=K2GjvQba52NA6d2A+Y1kzcm2Pst5W72QeNwU26heDCQ=; h=Received:Received:From:Date:Subject:To;
DKIM-Signature: a=rsa-sha256; b=kVgOd5IP8/L31++8rSGSQs7uzVhim66urEb/deowhKpXY1DfS0AVYQz4c/R8YHTfdksYy6d+Q/KD3ivjfHuOFGcJPZhX2H/5yPykbglxbQ3dVbtgpjrEssn0Rrp9DUIiIaH86pR8pj6FVR8A714Fxcq93wsfiTqlYQ9BfchiQIEbWbbORAUatDEsHTX5Gvcousca8O3QWC/+0V5azBK52dQoZlU3zzv2iDoypAddmqK5xf+bK9cM3E7OoXtuhomv+erdKEHKwfJQxR8F7pKbzr9H6s7xMYjbb9s8we+7H9dpQM+qSX0fBsYRiRH4UGplB3PFf1TZ9rl+RrFjrCOYdA==; s=purelymail2; d=purelymail.com; v=1; bh=K2GjvQba52NA6d2A+Y1kzcm2Pst5W72QeNwU26heDCQ=; h=Feedback-ID:Received:Received:From:Date:Subject:To;
Feedback-ID: 1013395:40550:null:purelymail
X-Pm-Original-To: devicetree@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 7844449
          for <devicetree@vger.kernel.org>
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 21 Jul 2026 21:18:27 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664ce3000e6so6907702d50.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:18:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq2iLqBnMMIdRvqKofJ52FncngOBNmFE4o8CU2JVnFXZ0p/MrO8g+0TCDRcmFDLMehpTtglrJhvC+Z1@vger.kernel.org
X-Gm-Message-State: AOJu0YxzsWMroJmS8N1Nuf658+5AC58V+bCpCtwf/HRQ6M1J0+h/d7Ne
	CJMzo39FaqadOwDtC+guNYPoxQa/RLc0oaBNyMKji35aZlSF21txk6A0cMZu+OSGSjFf59gCJ6m
	b+Gb7pnOfHxxQBAPWzs0P9tfU59do8UQ=
X-Received: by 2002:a05:690e:4385:b0:668:90cd:8aef with SMTP id
 956f58d0204a3-66890cd8e3dmr100821d50.25.1784668707303; Tue, 21 Jul 2026
 14:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721150314.24545-1-siratul.islam@linux.dev> <al_bUWguna_K1n7X@ashevche-desk.local>
In-Reply-To: <al_bUWguna_K1n7X@ashevche-desk.local>
From: Maxwell Doose <maxwell@maxwelld.cc>
Date: Tue, 21 Jul 2026 17:19:24 -0400
X-Gmail-Original-Message-ID: <CAKqfh0Fmmn5z837OR-FkH_v7BHL2DuXvnQs+1RSO4Qpg14YoOQ@mail.gmail.com>
X-Gm-Features: AUfX_my8kziqfW3OWdO2QNjWGjzWJ0jSNgBiYeqk5Ko6MzvglsscdkpRB8XZhU4
Message-ID: <CAKqfh0Fmmn5z837OR-FkH_v7BHL2DuXvnQs+1RSO4Qpg14YoOQ@mail.gmail.com>
Subject: Re: [PATCH] iio: update email for Siratul Islam
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Siratul Islam <siratul.islam@linux.dev>, Song Qiang <songqiang1304521@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 4:58=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 09:03:08PM +0600, Siratul Islam wrote:
> > Change personal email to the Linux specific one,
> > to have a single and focused point of interaction.
>
> ...
>
> >  .mailmap                                                      | 1 +
> >  .../devicetree/bindings/iio/proximity/st,vl53l0x.yaml         | 2 +-
> >  MAINTAINERS                                                   | 2 +-
> >  drivers/iio/proximity/vl53l1x-i2c.c                           | 4 ++--
>
> Shouldn't DT patch be separated?
>

Probably but as long as a DT maintainer acks it it should probably be fine.

--=20
best regards,
max
