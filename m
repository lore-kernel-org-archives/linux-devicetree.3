Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A7363084
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 21:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785533112; cv=none; b=FMQkQDA3C/55ATOkM33WBLn45f4nZwnHVf66MOPb51Y6Qq4jbDpo4TPxLIB9abSwVPr2o8rdRUzG+qJpNvUaaPwhOFfXYnZrkjjTXJfLOgTgPcAZhxB7ljXOBg85Fr0BJjBoBovdeX5Jyv9xPt1Qdcg/8XlmPh8GeK/I2kybKOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785533112; c=relaxed/simple;
	bh=1zaxBmYVK8cE2/bwlVBSFSqNhFysAIWZF9qGc5utEW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRYxldQYpKkWH0afxrD6jcgX5wBYkqEGGBsr0eWcuE0Z5YGxGpIVqNxBLKtnXxcXhSQ36jM9L0cYtu9Qf0gmEH1nkxT1TW5me5Zy1d4Ah7UxxzKSFhyv76vf4JSjLm1I8ySwfAUSmW1rJqWoSTAKiN5jFcADsvkR9iul0DAfTsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L4dbD6QK; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L4dbD6QK"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-74ab6c88052so485328137.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785533110; x=1786137910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WqGuhJc0lvZLrjwGWLKB/fYoo0jzM7wM4K/RxlMWzzA=;
        b=L4dbD6QK55uQE3O7TZ2tfWPqE97gIqS2pDQfjIQJipi+W4Op6MjSvo6Z08Y/7rT946
         pxclWirNOneVm1y6QwzCY6QfJ0l0uMwjbG3hbiPmcquFD/lJjgsYK3+JAW5ycJtAgy9o
         lp7oERKzrVm7QRjuehQ3gXCD028Ep1SLLXOR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785533110; x=1786137910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqGuhJc0lvZLrjwGWLKB/fYoo0jzM7wM4K/RxlMWzzA=;
        b=f4BHiomR0gCXzgAC/J+4w8YbZp3QLaB8rJd9Bn6EGI2DrbJ1gW/dL09kTBml50hpn0
         yLlkpR8Z9z9doUyImqaeD8kOPbxDnhn989WQ84OMmd65/UH3QIgMbN6RmqN7vHTdR/Mz
         Xhq9vx4k10/AnGCAqP2fN9HdhwFmV/leN0wJeYOwIOwwKsxDDLgymR0d+jrLHnGdurre
         uzZVI52QiEob+f59WJRG4/l18wpkbX898ZFZQRj+Ars0NFevWo5IOD/31CaGLnRv6N9u
         EtPmUBxizVIpGnANHiMkm17liJGeGlO4Pq0svDDSu7B2dcqJS8c6kARaII/werF2mcng
         CvYA==
X-Forwarded-Encrypted: i=1; AHgh+Rp89JhSM/p1oTXGuwtGsuLytnYtWEbYBgBgKGqUKB446Tn3fuSZwH3hlU+qN5Pvgm505DwEjSRAV00K@vger.kernel.org
X-Gm-Message-State: AOJu0YyMqphNcUGN/g0D/VsOchAI3YjSGzZKUhSBWZuzU1X/rZznZv3i
	ir1+lCEuJFHwNKSKfhn65DNrp978jn8C40Rq58V9x3HXgznqUSYnRG/elTd0K8Mzbm2DLXR0S6i
	zIjc=
X-Gm-Gg: AR+sD11/HzgpC7wK4v+RSbgb82Kck++9YxDH65wSbXc9N/VrUAjuX53C3ddPgLeQp39
	yb8ziddkXwxxKMjq5CbJfQXTktnzcbGfXIDQNwla3iG4UTTWVFhva9IRJTYww6MMq1HIatHWAhw
	ED0YHVu41Yju7z8FrV13zGUhqHSNNpiVMDAdaeB0G17Iopf30lSSr/mVpkMp2YDOaPHwHXN/67R
	hO4bx4Q4eExb4KMfcCTC//kpjInzpp9DTEjSrCSOnJF4wuquYOWFfbot9BXDugpK8Bl3bo6q1R8
	klN1DxdHjABMp8vRW19z7baHBJ9DLg9ya7cKWJtGWdbceGGqCjrLiy5/cLAJFk5bDMBohV6q+IT
	qmLKmRom6n/Iz6NM+fZJYbYkr3HEZ8uL5LdFODcl1S9dN5upYLjNF7P+g9u0KL/+KgD3lom4sqg
	qDXWHC+K8yb+xijmgPIa8O6MP46zhgvz+V6jexEa2+paY3oS9HjMNnkjufjxCIwUrBr4uROuxeU
	Lxqir+EXZ21S+89VEWlfM/HpXU=
X-Received: by 2002:a05:6102:c49:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-75b21a66f05mr1597703137.4.1785533110061;
        Fri, 31 Jul 2026 14:25:10 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977e6a40a67sm1521169241.8.2026.07.31.14.25.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 14:25:09 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so370807241.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:25:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrOHvtJ6NBMTZeYG0F8ByXUQdFCmZ4ieWbf2fLPk14RQqZEV8aaLT9/2bIer3g3kG1nSL3XNAtqwMdU@vger.kernel.org
X-Received: by 2002:a05:6102:512a:b0:737:783d:1916 with SMTP id
 ada2fe7eead31-75b23356ad6mr1399686137.11.1785533107796; Fri, 31 Jul 2026
 14:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org> <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
 <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com> <CABb+yY05L30Gt9cmF8Hoz2sGwUc1XocZG3vPoKMwEDfRH4tpKg@mail.gmail.com>
In-Reply-To: <CABb+yY05L30Gt9cmF8Hoz2sGwUc1XocZG3vPoKMwEDfRH4tpKg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Jul 2026 14:24:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XC=rqmRqEvamnA1SvJzx=NPsygHTO0tYrot9AViooP5Q@mail.gmail.com>
X-Gm-Features: AUfX_myXjwKEOJ-vL5onxMR_Vg-RLEVjT2kJyhDho-rEogDtoe-tql5rKnrLXoU
Message-ID: <CAD=FV=XC=rqmRqEvamnA1SvJzx=NPsygHTO0tYrot9AViooP5Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 29, 2026 at 6:27=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> Hi,
>   Replying in one place to the two main points of contention ...
>
> 1) Compatible string :-
>    I too think leaving it too generic is a bit bold ... we often think
> it is final but more often it turns out to not be so. But I also don't
> particularly like the idea of naming it after the SoC because
> controller IPs are usually not tied to a SoC. So giving it a
> controller version specific name should be good. I hope we treat all
> controllers as potentially 3rd reusable blocks rather than a part of
> SoC's identity.

Jassi: How strongly do you feel about the above? It seems like
Krzysztof and Rob both feel strongly that any type of generic
compatible string (including a versioned generic name) is not OK. They
seem to strongly believe it should be named after the first SoC that
was upstreamed that contained the IP block.

Will you object if I send a v2 with "google,lga-mailbox-array" as the
compatible string and no generic?

Personally, I don't think this is worth fighting more about, but if
you feel strongly about it then I guess we need to resolve things
between you and the DT maintainers before I can send a v2?


> 2) Single-channel Controllers vs Multi-channel Controller :-
>   Looking at the description of h/w, especially the separate and
> optional register sets and the fact that we are not talking runtime
> ad-hoc links between two endpoints, I lean towards single-channel
> controllers implementation. That seems like tidier dts+code.

Thanks for your opinion. Unless I hear more thoughts on this, I'd be
inclined to send v2 while keeping one node for each single-channel
mailbox.

Jassi: do you want to review anything else in this series before I
send a v2? ...or I can just send a v2 and we can do further review
there. :-)


-Doug
