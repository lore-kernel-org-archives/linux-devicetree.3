Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794895390;
	b=i5eS6IMFM0A/vuyHWcAb32Ohg/kAmjWI45fbyOrHyh0KjIWizm+q/+Y4cSksfU6L1uTT
	 VCr+65eDEJk4++N9XyBj3JvTqj/VpU0KnkCfpvfzNpR1SzF07w6876isACUpL9NRVbj/S
	 mJPUV6X4dpWUcV/hfAUxDHgtb8r9aEy43ObJQrI0+PqjepzWgZhQwh1LAWaequTD7zVS4
	 JW6bM9sOxwtxYUqQqmcGht8ZwJD2XpeQYDHOWJUmOk8qpwT2S7f21E3uma1z0igiynZVQ
	 aR3OoFMtKK5c2MlvqvFk30UpRY1XNi8Cmz0cHcyqb28/sBhWrx2ua9DHi+vPcC6WPDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
	b=e+DY79P32V3C2lR3c1gpqiDTVv6htL2WtGT2+jn9P7aFg1BmRWwiVaTrDuy3bbcSxFli
	 AVtmXenmYKaIzS4XjK42gMJGjimjnZFWsenmvo7Erc7jWa+IkMbzDA7rtAdhonepBMEhe
	 tjeCO/xkutx+mv/6KOt696h6VobAG3fGaZNq8vWiuommRJvsTvPZM5lLicUIHeKQ32yxF
	 snVjN/nin25cCzOCalMUxbqYpcD3OswcKzMObgIodo5qqFuYOTacfs+5Jv4PF73CveKuf
	 k6pRZdsfG0YEb81kgpywf+KvQJFnpVumjqzsGo9jayY0gFR3+TG21RhpkNd1G55DofQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxu+q6fg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855C3606A884
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855C3606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxu+q6fg
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37198ed3727so670026eec.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:03:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794895389; cv=none;
        d=google.com; s=arc-20260327;
        b=CId2P6hIHFnmGpuGuOOd710OH4gZZz4j6hbgZPhGuamGbMj+C6Zpq9+9g149otLKPB
         0nSSdvtz8zHlkRi4SyyJ4BsQaYaBXUgJ3XjexQQESN2af93iaR9S4UDXrDG2L5H5X/sR
         rgTJW2TV+oJJ2QSgK2cQEf7mtC54x9wLvunxLLoWeljccckLYvkEUIBuaZ/Mf1GRsE3m
         +VREuRH9uS6XZU4WiCi3CbV+UeN1nbYAAkeAYPH4i3jZX1sLmUenLL6a7AdOW7LAW3oK
         os58dpOr7MTL5ofXeJEgaaTOopC93+5Oowx9SHlPBFlhgZM1RDbIdwYb/dW+N2gotyXJ
         mYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
        fh=xB8id+JLZ4gwCjUJmYYsBY4o/5El0O3TQRZYHxR5A6U=;
        b=JFaPwr/0lgWpIoJ4gwHlE8ZE4bKQLGwMGd6Bm+wP6/KJ78Fug4nzBUKStj/CFyQYxf
         vbaL6+Kkdd5EUXYVfIrCrUTi1Gla0ntnbxvVo43Av+PW2HzwzsthutVMF0ih9MkBcYCt
         3smvGAltAzGwes9QifRstswcz6W2OydzFL15R2PzSrYwL2yXJ0vlcaY/gvOmy8nPAkp7
         M4IeAjyMLjqrs67x1LNDPYdaJp/b3ICOWw/JM/BxI57WDeH7d6AXLnxVWYMEMvyjKLkp
         3jyhdu5olwPXH7VvDrhILtJk1bt8hX3Q5h5C6GFX7x9BiKtBNbvxTPnqdvRpsqJN3+sJ
         HKlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895389; x=1795500189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
        b=oxu+q6fgYWKxtHBHw8FvEpHrsqniQ8qJPoMRxryaL1MyrshMDryi758XSD277qDFDE
         6kQJ62qwIpdHfvwgQr8spoC/AFhwSMpfV9+iai3aUx0ROe87N+mIP3itcLpT80NDIawR
         jOjqE9ASRmOMDoROtB6AtMQBEIMtUDZIF0lpBpu1/MewronKUFiRIT3diqzTzylgYFC9
         pSHDQiLA9c/GONdGiNyXINVd26D3Bf2nK3FWnLoFMIjF+MR7LT8lMGuXmknfD8WCi9fR
         CygUu8XtbTumvS3Bvez5qc4mmqosPXuR8SsKIcokDd/8fXeaslqx7tFkFeBvjhRh4cvA
         AX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895389; x=1795500189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
        b=nuiaSSR1m9w4D3HirytB2h5HmwIN/iTbKuzxVbS0jrca0LG9rYFPC5T6d+ToGETH1o
         mr/WEgBB20X5rBD+hpMHyOO9dPWtvi9YDMUULUr5x63ZYKW/1kCdvTaA7pOt5UDLWepg
         lqb6y8aXvMfks/UvzTygtw3/z+56KLnMJjwd/0vZMjBYBKt1z6UWLOIYqfg3QIg3VLMe
         fITFbqiCIG+NuFyJCN7RXqs6eBX7PdoeKntoAylbebaW/LriwRTYnedQ6d57LXzaoAHZ
         oq+QV9qMVdvKz2wt/Hfm0tF5MvLoeHQrxKoFilTZOUIRRB+JK7CShn1r1yLK7HFueKR5
         6l/A==
X-Forwarded-Encrypted: i=1; AL+hErH6ySf3pmaWDqU4BqqptJfa1wMrSZ92/t6nBe1/ZquoXDNf9VMNQsksjW7sAKV0Ecx7HLL8ZMKTpF03@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZxJghEWZjDrhKoJKJBkhWo6LT70m1hXZ33hSGsNXbkhvxNgyS
	8wBH/awpT1b/sKW7xYCtsNNkBIccsygQaSv0qykItm7/2kEdGCj+jpKjEPSvF/3RrFE/eQx6Hzb
	tqSKY7nEYM8F+6gh9CqBlv92ylo/mFD4=
X-Gm-Gg: AYBFou0c2ofXqJWg42rCH6dL8cnf0uKpU0OwswVPLVjUt3FpbEHJtw7YYtI/HoU9SqE
	Z4KFICeJicZzb+GEg3U4HlsO3i/xjh8bGp1It6WrJoJr/E74KmSI34S7k5CA9SqmFcrcjF5f+cO
	uiXmeAaVWgmMN17JNSfKaUMJ0537P2xZi3lzPzu/MPnBpdSK7I5BL1W5yAJqBc1jnyXoPGbinCs
	d5mNgPbkZVPvKLBlGmaO+tGyzi4JbQNH7p6L0xAIDsQa/my70CR5xXUs+qL/pekqGLohUD4xUZW
	qEw/1gnroWJgGytYAtjzaVuVIOzBI7aI6iagAix8ZqE/0mzRuG7QUk4uv9BWFsq3h+xps8U+BgU
	6f5CmXwz01RsMO2SpKA1rQ4bq8Rgp4JEHGTiK+IQ=
X-Received: by 2002:a05:701b:4586:20b0:1ab:cbd0:1c96 with SMTP id
 a92af1059eb24-1b53a429876mr1337313c88.4.1794895388323; Mon, 16 Nov 2026
 22:03:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com> <CAPx+jO-qPAuOGnGfCyGnSYym8PBOaqUJptZh8duYJKZN4HARaw@mail.gmail.com>
In-Reply-To: <CAPx+jO-qPAuOGnGfCyGnSYym8PBOaqUJptZh8duYJKZN4HARaw@mail.gmail.com>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Tue, 17 Nov 2026 13:02:52 +0700
X-Gm-Features: AclHuK9yy_ki_wzibjw_yQRrzFByvuyKJxJWKjlXJNrv02S4I5fFrI_oRWpsa90
Message-ID: <CAAq9HC6kCspxX8DyDXp2RuhFSXmU=1p0s6xdOmjhGZ9gZgmj=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] cpuidle: psci: Allow skipping the suspend mode switch
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 8:14=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.c=
om> wrote:
> >
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> >
> > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
> > mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
> > NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
> > probe is aborted:
> >
> >   psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain faile=
d
> >   with error -95
> >
> > Add support for the "skip-suspend-mode-switch" property. When present,
> > do not call psci_set_osi_mode() and continue with the topology that was
> > already built.
> >
> > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > [Reza Kurniawan: split out the patch, added log message for skip case, =
renamed
> >  the property, added property check at PSCI initialization]
> > Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > ---
> >  drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
> >  drivers/firmware/psci/psci.c          |  6 ++++--
> >  2 files changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cp=
uidle-psci-domain.c
> > index 5722365b94..cc9f14769b 100644
> > --- a/drivers/cpuidle/cpuidle-psci-domain.c
> > +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> > @@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platf=
orm_device *pdev)
> >         if (ret)
> >                 goto remove_pd;
> >
> > -       /* let's try to enable OSI. */
> > -       ret =3D psci_set_osi_mode(use_osi);
> > -       if (ret)
> > -               goto remove_pd;
> > +       if (of_property_read_bool(np, "skip-suspend-mode-switch")) {
>
> Rather than reading this property here and in the psci fw driver, I
> suggest we just do this in the fw driver.
>
> In other words, let's make psci_set_osi_mode() to succeed when
> "skip-suspend-mode-switch" is set.

Right, that makes a lot more sense. Thank you.

Best regards,
Reza
