Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974199;
	b=fMXk8ti32UIaS4UI2dZn6SVbD24fzgDpe8MGYHnfK/aAJqfK//ACL0CRygNjgKAelM04
	 MxGL8KUUNlyeBi1vsqmWF5W0Q19HDTTQf9VmAWLGz1gFimNlU0aH2YOEHKGRxhGZmBmKB
	 NBa9bEMEKjMO8VbOvaCkOjWIQSeU9VxjlyMwYnpBoCjjrcuZ/Mt7BzffGn0TrA2xJf3zr
	 G9eV51Un70woq23329JHn9dHs4hM2/QrYcjINnvigC5Yg7QynU15dFnCryZp6Zm1VdgmM
	 RI2cBXzwmWnxyxsNKflx5w3WyZHWvxIfvd+DCQ3jTuS8lZeeE/Y09F/tm9Lt5/xoq4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ziCxpeJuEuP3+fM2uEf4yqPzKab2VX2n4iM7IOvJP5g=;
	b=fBEHzx9CFQLIbPScB8wXlfNxQxp5CZ9emiJvt39BFWgINzgwKoVXe0M2FtNGRVD5LHWi
	 ecwAvfI0HrsZVF6WLvwUC2Mg1+6MPpFIKYE6T1zq+WReqE22YVAk3XTF+c3No095tPBzC
	 EEZCLQIcAj2sdoLfXiujbyMUCu/Cj8CH9OFXgg2a8IzuVMVxUfy8YUCqsfJHXUOk6x4pn
	 J7CEqaQUx5CFmJzjvM4FMpfMApO4rUUqoOiUaRZXrB8nKNKWKijd3QEUSxKWwlj9cZ/VP
	 bE/JtVcDgnZ82XsQR2CUE3RVDm0AU6XhG3K5cyWQ0pKqNo6ZQaYfYar35WMCvF9jGGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oWxmGrI/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94550606D806
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 14:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94550606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oWxmGrI/
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4c9abc1824so97927466b.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 06:09:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793974192; cv=none;
        d=google.com; s=arc-20260327;
        b=JsSX5XuOtCd5TNniKWfwYJqNZKts7zlkef0BkT+3aQ2KBsR6w+j0YkObWEuVCr1Y4e
         tdBDpeTqVew5hMA+IAhdFegDsTzy92nOXV+sVhepLrTXqohqMnKT4jFT6dEwWsDANzbC
         rdxGw25nBe/RQISJSwoF+i2sEqp3uSZ/TbiUKxv1b1qE8SNG2CeG6wi3zKDjKrVSjv5o
         Q9bEsZ7n869e+850U+G3aTsJa5Uz8rR7CSt77INzRwliOzxDm0rEAMGUKkyqocVLv66K
         hRn3emohaYBQU/c/eS9aTCSVKM4Jq+5MOoUgiC9oboMB2hsHY0ZetVJ4H1KNyMCwuKQf
         7kSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ziCxpeJuEuP3+fM2uEf4yqPzKab2VX2n4iM7IOvJP5g=;
        fh=LL56AQ7j+grG9oefFSqMCAPdJoEH6dAQseB13uUeRHc=;
        b=ISdscAbWC1yYLggyG+nubhx1QhzSWi1n3ZwomOCGr/Wbs45VOyQo/2sWbtWwwOluOD
         gyz4jjrz6ircP2pcyGxilkU9D+aTrimxATj5Jvd70lLvSegOMVvarILuz2FtKQdv+IZ3
         3Y7JQe1hVGRt4ZjMs97fZeoPk3dU0IirFZdLiVqtimGD9uK8Jmivhkam3UriXln61UTi
         G4fQmZfYI8WPrPODbD0pD/mwhYF2rSABUS/14+GFChdUYj6Adr4qcOlycGO7ppbkheGH
         iUFXT2dufWUKXzUA3oT76elNhvUN5bbgQiNj4UPQM7UGRFw7PKhLOYCfpPdbtUs8MYJK
         EpWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793974192; x=1794578992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ziCxpeJuEuP3+fM2uEf4yqPzKab2VX2n4iM7IOvJP5g=;
        b=oWxmGrI/VLJ1xkgXDpseuv1p5AaWUS4yXjq0c4PJZxvcDs7wn41s5xKxp/hpBp1jOb
         rawxidujgp1ZMtTuPLlKDGJiDNUnIWuqEqlbOo1MkBoSyhw8OU9StvTCZvQ0r6o0aJZ9
         iJ61Zxh++Llmfcvtz+7Ekdl2U6+8qrAw3X9aN/iZlqFTGFWKK8OUi/ngoRL9HXF23nnt
         Jd9Kch5lbgQM/f/WMcdqeowB8nYYRi9kg7SMzhvwHg3Kig6nMDaph9kx+nf+o2zyyD5r
         DFeeUlCokM7AWYjCtqhsPzR5JDFGQnzQi38/Dbvk7ZdxI4gT7eAYem2qSINnCMwwLpb7
         Uxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974192; x=1794578992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziCxpeJuEuP3+fM2uEf4yqPzKab2VX2n4iM7IOvJP5g=;
        b=i5ra3OZ8eyuG813a95RMOj4yJ28hbGp6tLnosDtIHU81jhgS7TakLLmz1wooTkV/UH
         7KEsliFvAJ8h9lJP5I0R6XINYkrc9xvhvS2WocxIRXJSy0KWHigotOrPw2Em/4Wd1DmY
         7FdK0eyTY0UZPNFYR6XghskCgNFUws1V1oJ/yICd2Kvv2ksPv5afpJwWA4klB7S6kHzI
         iLB43HieXCmRK1YeYbo1HJy7BJ9lLsuTFRrv94FumV4G2MUPT+xfLFnE3/orISpPkkUy
         dxplTtNtARcMi8Z3FqkBGrv6R8l8x119vDwYvd4S0q1UKGrmXQi5fgKcChxuGfpXWrqN
         Mj9Q==
X-Forwarded-Encrypted: i=1; AKwUvByxLmlSzfprERpoDx+fJfMVjc+8WbiWFqUFYu0UjI7UUXYQpebqe0XAzSa+kZhudSXSxE4YAaPHgK3P@vger.kernel.org
X-Gm-Message-State: APuU4Z90EeMpunBHToJV806Bp4OhVEGcl9TZVTldYnOue8wg7YcnE3Bu
	UTom/7TR5fmcridt2XMl36qCaoRWcLQ70O3HExk7IXS77NyKXzjuMvXnmd8pcR31Qb0J7+cWIK7
	k0dT2TXAGbovX2Vkn26twJE3R3YZBSfE=
X-Gm-Gg: AYBFou0qwBr2e6lFyXh77wXiZksVBepSfxyXgFYSl3/rHlE0vFSw/MMughBKs28KhFt
	ogZjqrCQmsBHz2Pwf5w9eSvnBxID4EX8BKAAg159r4W7LYi9PgTIX1GzBbIgBMpnnS+RM7/oBNV
	GNWVCPkP9crj25CHIjhqlz8CmHdfc+Hesn1goCHKzwvUMAd6Jzg5TYSkzktmy6i1n1bdWUeT2+G
	pcKr4cJtDF/W4p2cMw7zBnB4v8V6VFKtdbebG1iHuTo2v2P9epdIIXG1tcBXTzBJy/LlKNR02Bz
	zUI9/44V5FJ/kg3itvMFA/F9cMnkEtf8G3s1calSVzEuB4iXiU7zHdn6/CXm6zj0incP9N6PxTW
	z/yewDQXDTzk7AsSN4veWEjVG+8ltFewoOyIHB9iilyHSXys8vA1CofR47mSJlYNc5/OtpoQFTm
	tUBaLG5XFr4V1TOf4oNFfVRdg7jjzfyx4=
X-Received: by 2002:a17:907:c0b:b0:c41:731c:534 with SMTP id
 a640c23a62f3a-c4d352c83c7mr245800666b.24.1793974191437; Fri, 06 Nov 2026
 06:09:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-7-clamor95@gmail.com>
 <au3dMlmsLEOUqan9@orome>
In-Reply-To: <au3dMlmsLEOUqan9@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:09:36 +0200
X-Gm-Features: AclHuK_cVVXjJEkd02nCSMWJMQCoAmARR5pIv9xMRuv91xrb2JMaT2_t676ijeQ
Message-ID: <CAPVz0n3=R1UhyTw1o-ZR2hMyXwKAomNkb5O-cQbG+TBFJi5=JQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] drm/tegra: Make panel parsing by
 tegra_output_probe() optional
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:00=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:06PM +0200, Svyatoslav Ryhel wrote:
> > The tegra_output_probe() performs panel parsing unconditionally, even f=
or
> > devices that do not require it (such as HDMI) or that handle panel pars=
ing
> > on their own (like DSI). Make panel parsing configurable.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.h    |  2 +-
> >  drivers/gpu/drm/tegra/dsi.c    |  2 +-
> >  drivers/gpu/drm/tegra/hdmi.c   |  2 +-
> >  drivers/gpu/drm/tegra/output.c | 52 ++++++++++++++++++----------------
> >  drivers/gpu/drm/tegra/rgb.c    |  2 +-
> >  drivers/gpu/drm/tegra/sor.c    |  2 +-
> >  6 files changed, 32 insertions(+), 30 deletions(-)
>
> Does it break anything to try and parse this even when it's not needed?
> In all cases we error out early, so there shouldn't be a whole lot of
> extra overhead either.
>
> Adding this extra parameter just adds extra complexity for seemingly no
> benefit.
>

Dual DSI panel fail for Xiaomi Mi Pad. Maybe you should check your
email a bit more often?
https://lore.kernel.org/lkml/20260305161035.64548-1-clamor95@gmail.com/#t

> Thierry
