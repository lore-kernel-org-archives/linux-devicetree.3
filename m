Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E864637FF77
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 11:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777981385; cv=pass; b=J7mu/iabthM7s6lv0JZqVqFvYQXHHmh42I8cU89TVo3VUoNIcx8tTUJsVtMcIj8GtjpQhUkumbuqaJiNqojW25saITm2Umk/2ZcIfLUtgHm3GfEiy6Ab6M6A/4GW3v2PhjGSDpAMxpmVfen4wa5ZnyuDjplh1ZAwVNNg1MvHdnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777981385; c=relaxed/simple;
	bh=uW95L79+oRSfL6rUWy9JAkaDOq8YV0W5D8GzHWw5BHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bAKxsPCLaDdUWc8oOsnOiHxiTNRVgYk+CpjN4z7YA3QzNtl4Z1Iz8Krlf6do/wX/khRKxQdIKy5vaqC9MIqTDFPwYnXoiZfh8WS4K6EsSlpWisXOgiZ2Ie1eQCDxo41Lw5amtQT3inqOTtCIKkhPsO8cPGBaY0c/L8Mw9A/stZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlvDeqWZ; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlvDeqWZ"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f30a4601bbso1858756eec.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 04:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777981383; cv=none;
        d=google.com; s=arc-20240605;
        b=Q4ASBoAl40InOAEHk2Jc5zyi4BYMzHd9JIybtxgivHRIe7uMboLmvEX+AWojQIV5st
         rKZ67fwTen9ovpEfP6TTXJNH2ylbysELjK4O3Q0T+3+kni80lk2CX4OTKOJdZWoT0io2
         T6fOf6kzpMIQw8e1afukUmMG27IQC1w7Bc/Zm1h6/0o25uNMEA4xB11Nlj5Jfnqpm6r1
         WLRDByW4eL+wsAnj7QSw+AhfM/inhz1VdocHrIKH5nKKId8JMQIVgg4uU0CU6b6uGBVw
         KsSISjPOW49Vn9XNvbLga3t2gSzbaePV/7vgIz1HxUA4vwAdkuo26odipQAbpbCv72ub
         p5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uW95L79+oRSfL6rUWy9JAkaDOq8YV0W5D8GzHWw5BHo=;
        fh=hpPEzeYqw7N1UpqEg4bdSvACzgfDWH/Pkb41X0U/Tuw=;
        b=A9aPm69D39HriZXtjPg1fHd0PumaTf8z6uOLXGioptCq4B7E+oUgOcOmUg+kROYGTh
         /+QfSrwVPrDEGXlUNbBydsL2dKqm63LItY99odJs5x8XCl+FwQsuGnArps+UA6/oPZU3
         hC8Xxy662sCPXBrKFi6lu6lj6mhImoHKc6P3tfhYvXh9FTqZXJNn5xSBCvhSvlJo6RhE
         YFGhrpbWkChd+v2M9iY5L+bDMVT4QU/6i3kbCA78SIEJz2Qaz+nkzP7gTGYz/I40fXGu
         axNzELkBxZpLE2HJ4KOhMOKArf09bkKSwYRWESV5gH4DFFLJ09SPVhxQWUVhiVlZ4JNt
         0JLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777981383; x=1778586183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uW95L79+oRSfL6rUWy9JAkaDOq8YV0W5D8GzHWw5BHo=;
        b=LlvDeqWZ3LOUSYK/+CkN0q6gDnkNxVdHakloChAskA/ra95flTUDBEpVxdkddlcnXw
         XLLkMqZb3uHBuTae7csHl9WrQAiBo0K2r6wQggS0aIkkUQtbSkFrflii3Fb7MVuULXyt
         2vfHVX6qU4Uguy6gky6lf8FWcpAtbSagnyPXJfCOke3YTj1IYgAEedxN5FPNW9a6JCIs
         bAeM5MQVlrMghKZxrNvNTwkUDTIG1Wc1qDERyIV6YYpIptb/YguJJFHsBNyWZAu++QXn
         AZqfsywihkyUVkMOArLep0jtBwPrEJOQRljt8DuocFCG6JzOIl4f85Rx12/pwdFTDL40
         8v+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777981383; x=1778586183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uW95L79+oRSfL6rUWy9JAkaDOq8YV0W5D8GzHWw5BHo=;
        b=s3l+6lwNTmZnXdABZvx2xomyKqzUzC0ziP3ax1ibNe6deCzFyMRdURPjodzsWQ08YE
         KDtNkMIHfZzRnFH64A22F+bbA2ruJLtpg5QXSRlGHYOg1y/5NANBpPFDdWnUVmag37ZA
         hPai+bh/CTQf4Fq3k6/n7kCzkfbBUxEBVU+8CCOVF9eoaJE8AYn5sOOTQ9NySnfYTPOx
         jSNss/Okuh5hU6OIIX+1dyeOsEVKsNOs9l7oHmYaIk3PLq9sprGHA2I9eDAGMeA50jMh
         vfKl+ah8cA9JZmG5HJgbRpjvYmjzF3sl4SferbbDq6/HZ33khxzeBpaAMzTdsnZry4eX
         X2kA==
X-Forwarded-Encrypted: i=1; AFNElJ/yV6NyMPAc68/fXLGKer6D4iUNGjAmT1ZCP4Qpon/Nyqc7+LJBP94p7lOEiV38GU9aH5Le+gEMcg1t@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6oTG9moHYpCD5itAXVbuYAdX3wZ8VnN3NQSMM/IwHG44oEo89
	3Ie/5dtOuIgzcPxpWfkv6aGaTFfgKmm7MI7YB2IzgKFpR1wiL/hYF7zshYYPxsRXRnDTiNKNwJT
	WhPJGSX8yST8L5tP3JqRA8rycPpwf2nk=
X-Gm-Gg: AeBDieuyenWDtbJk0JG33jD0qExx7jyhYYcW0FvT+hGeYsTpY5gPod0CLHgSM2rCzOz
	gIeFTEU6HMfayv9hMiCFJK7tTz0JzRMJzBATf4gX5nMSngj+UErBeYFcx5hjv+qXQhbVCPMhSvO
	ugFRDTvKiV76WHJqEgehtNI/Cnj21wk8h0soCBe+VRdoa6dH+tHeJrtrw+yTBr4iKT9GF8eQ1v9
	wQyrHBW1gDyWc6i9abcQRVOMtPheVmnjm1UY4fIqqptDyYH4LSJ9JSfLdeSROtBqN7DIGuFN9oc
	8pE8AKa8Jt07anC7KGQm/e5hPdly4Q==
X-Received: by 2002:a05:7300:6422:b0:2f4:3a9c:819c with SMTP id
 5a478bee46e88-2f43a9c8382mr1004597eec.25.1777981382922; Tue, 05 May 2026
 04:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428114308.113253-1-clamor95@gmail.com> <20260428114308.113253-3-clamor95@gmail.com>
 <CAD++jLkU-G38xtzzfAV_otiYuM2G5NHdCdtjFjsy2AjpG22_rg@mail.gmail.com>
 <CAPVz0n3h+zWi-b-ZTLqwXR-9JNGcUgVodUgo+ywhBfK-UDQJAw@mail.gmail.com> <CAD++jLk_SojErY4gxjixzwEF3sfSownH=jBYaoPD2LeoxibhWw@mail.gmail.com>
In-Reply-To: <CAD++jLk_SojErY4gxjixzwEF3sfSownH=jBYaoPD2LeoxibhWw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 5 May 2026 14:42:51 +0300
X-Gm-Features: AVHnY4ITV9EyPZ98FbxObZvxz5c2SoAcqHGxP-Gd0GWhXxPPqB1dn3Lmq_w-bg0
Message-ID: <CAPVz0n15mgd4pJ-H1Tv8Rgr_7r0J2ycBo-3KnruoY9MnApqr+w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Input: isa1200 - new driver for Imagis ISA1200
To: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 5 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 13:39=
 Linus Walleij <linusw@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Apr 30, 2026 at 11:46=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail=
.com> wrote:
> > =D1=87=D1=82, 30 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
12:22 Linus Walleij <linusw@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > In you original code
> > /*
> > * This is done in the vendor tree with the commment
> > * "Duty 0x64 =3D=3D nForce 90", and no force feedback happens
> > * unless we do this.
> > */
> > if (isa->clk)
> > regmap_write(isa->map, ISA1200_HCTRL5, 0x64);
> >
> > 0x64 is actually some conversion of duty cycle, you got this accurately=
.
>
> I wonder if 0x64 =3D 100 is simply 100% duty cycle?
> So the value in this register can only be 0..100.
>

Assumption is interesting, but it is still just a guess based on
observation of a single hw configuration. For example, Samsung Galaxy
Tab 10.1 (GT-P7501) passes 133 (0x85) into duty register.

> Yours,
> Linus Walleij
