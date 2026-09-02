Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2964156FB
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341052; cv=pass; b=jEArLIlcSYDjbu/UWN8nUkvAQcg0eUfnDu7hQ1zcyy1T0q8N7I1DxHm7mNg+A//XGjLDsAD60kuanRK7UQLDwZD/ZHyB2+Bz+sKd2kjNZr1MC0FlLwNUBHn7RYngLA+JgniAf+S9zGxm7/9B0rKDlA2vui9nTtfuwFBCFN8QcEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341052; c=relaxed/simple;
	bh=Ztg/iuQclPd7J/lDVuGJccxiw/xoO54Q7eyscqFYx+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILuoeV+qRvGDOeMn+24rGdExl61qJqs6SfkkexDDSYfDznNM/bnEN25MPXDIX0nPnp93wa/JLPU59pLej1v6GHRSJkiYdVNVvOApWKHEWP0SRFj4oRcVJzYKOycZgLLDNFf9YCvo2FbCaFv2cCvaEtb8kI6YmSYOiEYCxRY5M+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=tA93ivPS; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="tA93ivPS"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d942c7cc2fso6557305ad.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 02:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788341050; cv=none;
        d=google.com; s=arc-20260327;
        b=ZKCA+aNAHxD0t+FTf++yYalBi7qtKTp6pEnWU9N3lQGUUdx5/82qMlREsURJnyDY1k
         AOentGaLglZAl+OkRfJzhZ945QXx5zQii13ApNczY5/N1kHsAuq0yS1rC8ZByultOI9C
         /ioh1HqxA8+bFXdBA6TKpM19gnAGFiGgHx37BGEtoDj0PuSVxebQA1aprG7Em43fNrRO
         F3vu34H7hiy3spYjQYrPHsH4WggBgvmrMeNgtoiSmHatqwlEhekXMk8jsx5tItod5fYi
         2HicGACuiVd953WaWvzYW/xHOBMK4aHq0ZtlCGPhVlCbTbmJklX5drY2GWWIBzxwQjo/
         lctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ytaSS9E97s/JULLyGWR20qPV51uikwUgTS3pF5XmIPU=;
        fh=kMhY1Q7Msviv7zlKJ4MPUjzxf8xE5b6zG+EaoH4y3MM=;
        b=f9HOKwUyx8Mo3OyuoWImWzyFXOUKbx3cPeh/zT9wyGh1j4j4etF6GYqSqywlb/5jUc
         kGfqTiB1HmFp0J66qVAEsUKk/ywarNScwhJ/bASkAqIkCwVoq/E0l45bqbx/p0axNiaA
         7UtCxQP/TiLBA4NfQp9ga8A63TyM2q+VAld6yq6U6/1DkkebYcD8gzD2LBecNSkGRonH
         muibyqWG2MwMjc34timDwlK/47hZJ/OnISMrb8ulE36GhZjlThxsA4wjsfvg4l8BjxSM
         x6gP++BPNqHKFO9d8ujiW8bT7FG16t1zsGo2e+Dc7Q3i9mxaW1XfcxrK1kYTwRF8mhoC
         uU2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788341050; x=1788945850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ytaSS9E97s/JULLyGWR20qPV51uikwUgTS3pF5XmIPU=;
        b=tA93ivPSkpyOt+jNZM//pU3zX/HrR/P3Tt2g/ksqfdK9UTDuOXLEGaDqbX1O3WDg25
         u3YMN0pGGfVTGBG8I9q7jb++TWSAWoluy0DP8vmxhg0YR8N5W2jGPvVv0TZ+Z8lfkp+r
         ZLC14i9NKPn2PcbDDVqbVWkLbl6vRpErfBBGje5Tm4rEFF43cHBVJVkvJKRsir0CVagu
         cbGM6nPiBcxGIEIJfAPGlxkcOIkoaRXid+MskD3jBUAxc5+U3YbqgkcNz5CTAbR0gxX5
         SvCRqzwWOiBJp7am8o1qXO8LSzN6ZYUurO8USFsZFT5YGzTVLKOOpSYSKaU1n0GOP9WN
         wEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341050; x=1788945850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ytaSS9E97s/JULLyGWR20qPV51uikwUgTS3pF5XmIPU=;
        b=dOWMjm1hKQw7TPwWRqJ1ifU/DuN8xRtjHeRgeHv3zVritplt8r7coXn8SzF+xBDrOa
         ojpQm0zdiSp5VbxlzX87vee0eMASoTMVWr8JH9GJX/pQ5dethbmG6zFQXAuNChJ/A+qV
         wM0xLdKhDb9dysbekB79+qLY3z2hJ+dv/lnV+BLSftZNa//E4xRkDgx4ZltBUfgnxi+X
         7bZAIow1Hrd3cfMgz9Kyr/HI86ekUG93X4FI7+bkheMIw3RnaTUT/TGzR6mQ71mt/OEJ
         C1pPQYpPboc5tGKLiLLN98UN6aXjiasymw1HjDf3lBltcB3WAeH7hHSmLg2iSEXNoHa2
         cx4w==
X-Forwarded-Encrypted: i=1; AKwUvBxfrMaHpO75kNXlK63f6jTLLrqJuby2Ebarunn6s04utRTvIet0DOosf7Tzauy/X9nGLP74rT4W8chd@vger.kernel.org
X-Gm-Message-State: AFuF++ngArG++Z1Uf8y35gzQ7Fa98S64CWPz0QAN4e11n3HVPIuZl6RZ
	BIhHlamw1hFBbAqHujqtFNTSomWZv3/oGPUZDLRttvd/YXeSNT8YULpPgR09Adt6SToPajZUn1X
	F7TK5EtkSzF8G3q1pU0oFSIAZVEY4SwDa6JnmImXaHw==
X-Gm-Gg: AR+sD10+Gkho0dmp9TNtDZZ14+1c0aoK8EB/fYykw91XsqWS05MZ346ckAGNwUVAL1u
	knzaOWy3NNDLILN4514NJaS/SKPNFf7Vjxr3KkLbUBZuG5tMoY1Q2tYxfIRvKg7CNAL7v8jxStf
	+g7Cj4aU7/xTqleZJEJums7L4Lx2RP1nUhzvC8n9BULA96Oj9p9cQwD7fVMNeOKOH1BjHuZst55
	qMbMwse8zephELD/+BVhMFAINjtTyUB1Ub7J8EJCr0lK3BR9M1NYhGjVEozC6kJdmUc/DLtuq3Q
	rvD0E5bq6P0nZ4mScGUA4y6fwH8YVC6TF/a7nAgOPogyoOxx6tC10SL9s6NeBsj3RL2YBzGuw5/
	k+w==
X-Received: by 2002:a17:902:f682:b0:2ca:f21a:a6c5 with SMTP id
 d9443c01a7336-2daec5ad6d8mr40455475ad.1.1788341050320; Wed, 02 Sep 2026
 02:24:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
 <20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net> <87ecfc81e9.fsf@bootlin.com>
In-Reply-To: <87ecfc81e9.fsf@bootlin.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 2 Sep 2026 13:24:00 +0400
X-Gm-Features: AcwNN1Vwt1UNue4ueZiVCGXuJAETKqvfhojim__xlQfGqQYcvUB9rCpZaBk-bcY
Message-ID: <CAKTNdwH5S3MxgR=5s2LXPquCFRXE-61LTTsZoHP9+YmXo_P4Ag@mail.gmail.com>
Subject: Re: [PATCH 1/4] nvmem: rockchip-otp: Serialize reads
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 1:10=E2=80=AFPM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 01/09/2026 at 19:33:11 +04, Alexey Charkov <alchark@flipper.net> wrote=
:
>
> > The OTP controller is driven through a single set of registers holding =
a
> > state machine which has to be stepped through for every word read, yet
> > nothing keeps two readers out of each other's way. Concurrent reads
> > interleave, and the outcome is either a reader bailing out:
> >
> >   rockchip-otp 2a580000.otp: timeout during read setup
> >
> > or, worse, one of them silently taking delivery of the other's data.
> >
> > Reading two cells in parallel from userspace on RK3576 reproduces both
> > within 150 iterations - 53 read errors and 9 corrupted results, the lat=
ter
> > either losing their first word or, in one case, ending in the two bytes
> > which belong to the other reader's cell - whereas the same reads issued
> > sequentially never fail. Concurrency is not hypothetical here, as six
> > thermal sensors source their trim values from the OTP and reach the dri=
ver
> > straight from asynchronous driver probing.
> >
> > Guard the read path with a mutex. Reads are the only way into the hardw=
are,
> > as the driver registers no write callback, and they always run in proce=
ss
> > context, so a plain mutex spanning the whole clock-enable, read,
> > clock-disable sequence is enough.
> >
> > Fixes: 755864feb729 ("nvmem: add Rockchip OTP driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your review Miquel!

Sashiko complained about mixing a scope-based guard into a function
with goto-based error handling, so I am replacing the guard(mutex)
with explicit lock and unlock calls for v2. There won't be any
semantic change though, so if you don't mind I'd like to carry your
tag into the v2 version.

Best regards,
Alexey
