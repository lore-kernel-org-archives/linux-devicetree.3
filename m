Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794597300;
	b=MaEHjXFIORm1eCjLYwG/cLRNx1pwwWACPchm0RPJJadYXZxc2Y98npePjEJNPL6ODy3h
	 Js2p1d8kzo57CIMz94zlnL7BvdexX3puYpHM0ovYc468p1OS4qZNsm/dP5bbVQnn86fJz
	 z6EyzK6spycRGcxENzyaDJePYKQBkaVyGG8oSjklMyn3wYMM9N+VBz8no6zE+MbQz7hdg
	 2rhVbt2b4xvGnv73OPnZobj6kqkw8Zn4hjH8IavyCHbtV2XsG72+pLcqJQ6F/af2TsE9w
	 BBMjBuUUkVU2d1qCvsUzm7Q8TspliMa3EmGRve7iOB3HZgG9/XmiMorNeFK0CJ2b+zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
	b=xgTtRUfpsfPnQc2C42HV7t0MOXLhLRlM6N8tjGgtquKOZLduWHbbxzS4uE8xfHseYHdq
	 1Slz/NJARG/3Iu7k4XWQIk6EmN57ytc/NacZT5HtN84zJ4kuPJKnyVI3ZVFtFSZ+EeaDS
	 HWQlh3hnIRzbu/R1r9jQIQb5wDViltdANXL5OO7eaUcA7wFOzcMTTuxgBQnBiW66rkr96
	 z5iQOiop1Da1LaknT5GdQ7kDFxTLMj66wumW1M+mP8+cqOLClqwl1BYO9kVad/o+5zbYm
	 U4FT0nxeEMcbOiH3j/8YvYizGuk09SPqx+d6btezQ1F2lQxXmcO7EVIyVIic5skxyFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NxInhMNU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1F5606A334
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E1F5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NxInhMNU
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67be7b9abc8so1105017d50.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794597299; cv=none;
        d=google.com; s=arc-20260327;
        b=GGU6vErIDGT/wzneTQrqxEnnpuTzNrhhlXqkusYgTSRyVFMAGzxxqrgJ8uw6bx2zYP
         11xF6v1EpXTwBa0pIHzRevXFTY1UrAh7n26obhfeP1ixCUIuSbfrqjbjFjkNfmGNiqnM
         dpLXJPHKgZM3zjZq4eE3IF7KkOJk/ko8cvOvfE7Aqp6tsArShheh7bJYdCMb75z3QdLd
         JVri5FK23FxNLXFm9uUo9/eG1y7CY9w5PAnjqDFC7aDNdQjknuNXbE8kXyaT41roEo+K
         5kqViCnL6DmRRMeUEw1tgOgxkdMo2aGBpuVlCUF6PE2sBERYqnmA69magIIOTeX02X1s
         gCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
        fh=00NZ5uP+v0cLv8KiaODn0AcR36zpJeIisIY/qMWiUBg=;
        b=NRH2U7qRo6h5V7laB6YlVWSfAGOw45r7gyWHFStsIk603kHFKamxR4yxB6/+JnjgO1
         m2qXK6iHB7Ho2fRB1mh7EvIBAwN4HrNmZMJP2WEejEARn0vzrkQ6c2sLDa2S6gPe5nGi
         SjBV2QdcHqh7F7c9f64TwOZR6WNojY7HxO5WHKGAFgVzc+rSaUoNDlYth7lpxWtdRGEP
         nBUObCteHah7/1UHznTbKQc+IdqAEQzpnw9izjbtJjEsvY1TO/cZruMuVDkmJc7a+uWy
         1zh+mS1wqSUSTi/6joAJ5KIHiEsWe5/3LQUusHDJgFckojwNZclvgelp3a9f9+lmBDM8
         6Heg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794597299; x=1795202099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
        b=NxInhMNUsk1V/GHuk1KJEYz7215Gz/JpAe8IOmddxaqdRdV3SRBV6i4ekftDaqb5kM
         aNmI8zGb87pgvjwzaq6B89gecxVmqqFLzJusRJwwA3OwsIbA7BuQYtGaP4A8sNt2kleZ
         NyW/BoJyCMWS3aBm3XxNxhxB0a8kUb9niJY76q1Z01Fj89zGHdS3otf2dIInzkQ6dwgY
         zPx2UsPTrqqDaAYBr1oYlOxUYjfbGzKIBzmWbo7NkAr6Af2D+gpiKLvLSJOG7P+9uVfv
         G8kpWf+CLRYJcUAj9aYqW2QJGz5ZH38aJ7wMXHvqEbRl72V9Ut8yE2FpGX0/IdgDmid7
         SmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597299; x=1795202099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
        b=Ky7/JA9Mzj5nW3uJJQNZ+ASf+sVhILSigf9oXnAXrdcc8c7yhIyLMxnMYrb/uOv64R
         q6AJqZIoFx0zbUdByikAhLk+H8jVKwWhRSUpaF0vRvD4tqXufSePqSqNAYfTc6oaNUUD
         O6oIJWqC44YDhRUQmRZL1N1aRBBw8my7ch89F1G4zoYlIDGmFrUiG/NSYvCG7q2QCC4L
         VRNWljvSWSW+5FfWIPqXeiQfS8h/pN23x+ZCECOLLaNurHyJzMC0CXrYAakqkODki7UE
         1svOywm6s8iUdw4J5gvG4yCuG1N5p3+YxXmIpzlIopMN5LMfI8/jgmT2yVHXDMa6MzJO
         xxrQ==
X-Forwarded-Encrypted: i=1; AL+hErE4SiCK4L8oaEEwREcFlzWce4WAdH7z4xB3BTTjfJBlwTeFSiNzgvnFbKmBjh+ETNWjKmTFLroy42iJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rjus9EcPXeJ67f/eVK4oSw6OU12SSXxbPNyjqRJJLHZdtPAUr
	ICAjAwPTcaA9TOAUj+tx4cpgrmUc6D8zaK5RPqrUStrf7Y3NKTxOzijijeJBP8Qk/pxs3XK9TFZ
	GaIafyBJvP3UQDv03PZhxDO+h3M4zfOw=
X-Gm-Gg: AYBFou1nq1HfEQjI6YaLL87d9nYyHfpFFHivlKCCcvagSqMdGK8uY5EEMxQXrfS1lSH
	SqUxP/JfihEWBKHn/GnFk5VpPVaWW5Uv2ANs/ktT2uADpeQ6njA+sfv1ZMGgiFvAGCGqlYnpJ6A
	xOljL/t/kknFwqpOZhR5UTvwJfg8nJ2+I1Itv3OivAdyZ0XQHHpK+/JV9a/qbi9rgP/UnV2DjmC
	ljVGUN9DwpsKuU//Pdk5Cx0vOUOraXIvgm+Wilhdfpw8dEoQmy3W7kyJWqeSDqjhb/Ia0VjKo2k
	L4KSEVyt1EB7iX7/MHhlzetvu6SOMbmja6QiZubl349FVT0Nae1ljXoYmTcgQdCUqpDv8IheXIt
	++rTO+Bbh3WwDpbVvivfxTFk7SQRoZovMxknKLw==
X-Received: by 2002:a05:690e:1188:b0:67d:98b7:8861 with SMTP id
 956f58d0204a3-67d98b79810mr345876d50.48.1794597299405; Fri, 13 Nov 2026
 11:14:59 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
 <20261015-orangepi-gpu-v1-1-03566a615660@gmail.com> <20261111004732-GKB2005@kernel.org>
In-Reply-To: <20261111004732-GKB2005@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 13 Nov 2026 20:13:00 +0100
X-Gm-Features: AclHuK_kboH0z5fWoPol696e94WfTnxywiDJDP5pOyMB6ipnYxJpzrLU0NPVDpw
Message-ID: <CABdCQ=MPPuTQ-3aCds7F6C1AZ2c79HVJXGjtqN9_jHpKo+0E2w@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] riscv: dts: spacemit: k1: add PowerVR GPU device node
To: Yixun Lan <dlan@kernel.org>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

El mi=C3=A9, 11 nov 2026 a las 1:47, Yixun Lan (<dlan@kernel.org>) escribi=
=C3=B3:
>
> Hi Iker,
>
> You could drop "RFC" prefix next time..
>
> This patch generally looks good, while note that it has to
> wait for power domain to be kicked in

That makes perfect sense, I already noted it in the cover letter and
I'm fine waiting until that one is merged.

>
> On 20:56 Thu 15 Oct     , Iker Pedrosa wrote:
> [...]
> > Disabled by default; boards enable it individually.
> >
> As GPU is integrated within SoC, I'd rather see it enabled by default,
> so will not only one specific board befenit from this patch,
> besides, I see no reason why people should disable it by default?

This is one of the reasons I sent it with the RFC tag since I didn't
know how to proceed. I'll make sure to enable it by default in the
next version.
