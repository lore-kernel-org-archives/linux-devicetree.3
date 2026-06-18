Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B513EC2DE
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778314; cv=pass; b=nRHUqDXSImSPCRljhfWBcM+AhNfttJuubEnyuY9Xx93DEM7Edx2lOb3x7ZuK/OPlP4lZ/3GvhXKsi9PI4FiB8JCvnGiTIpzvjygrh0CMRjf66zSZ12E0Bcowej/zFGtPkdtzEkCE0OLXVMfUHPWSHIUaR0McxOloB/vkTNxuPNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778314; c=relaxed/simple;
	bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IInya9yrrGMcjYv3ffseUXFVgCaVd+y2eeF39FNTWw8r6K3Hc/fKSTUTS/JYMYK5vkBwNk+MyUeKBU+28EgKC6a/Pz6tDQM2ZOo23LJmk6+9nUvFSfJPOgfHVkZ7GBmf/HT0PlyPv2Qob920UxQyVDkW9hVwP6mhvep44E3vRxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrO5TUnt; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrO5TUnt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so5360275e9.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781778306; cv=none;
        d=google.com; s=arc-20240605;
        b=lH0KcJrUTy7l+WNdZX2hCjKqGVZudiOir+Sns2y7hpgPuhxNOrtvszpJKCzBkx+g/a
         DxTmlV1kv2gsMT9sx9ro+CdqeT/qr2kMUTwsa8rmxZLpzE/vWd5A7dQA2JXlmt9dccBr
         51JpnLCp/ZNsEnnp54OTzVSx1YHKNJnh9aoOadr/cIfajev0nBO+rMFUq8hbix9+MQTb
         8TGZnT6Awkj2c8XOuls/JdE0wJdipH0kqbo5bIrvlb+7CyvbaMZzDD4a6x0axcIkymyc
         8p2M/GpD/Q627fBkqpTolgWSQxVXsDf641il1UY/4OgrqpTvXK+/0n8iGl/ogovTQgQw
         cQCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
        fh=dhAVYq6cSh79LaFnHLoOwBaVUQjHRkGJAQXuAxycK1Q=;
        b=InzhbfzfMkXe1Bz0ioF5aTXXe4022JgOGkWKtNmDq5Upl4NwDz7WZGprkaMq/UziyJ
         u4kqougKqBxIpMtacgG08SpiSf9T6VRdJzzegr519MAwBo935WieG+EzJlbpW6BAPny2
         zVyg3BKrfxZTiWjz8Vi4woGxs57Wdv4mx/bFlF2JS2t0+nF3bbLf8QUXzmULypNki1w0
         ld3Ae82kinkm2wBg0hhQ1mCCvUPfbl+nHu1muSsuHAk55e+jNTmGUX+49hYAz0AmdSw+
         YbG38AH8/J+ZAE5riJR+Dz2oDH/FjaCu0wTfFe4RkUjnJ2bgZpAjKyS5IT5PGViPUcJP
         ioMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781778306; x=1782383106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
        b=JrO5TUntxG44+akEv+ys39/1vOLyjc/hJRYPeYu35hkT/Q1x4ewokDZyrQ7WFYFYHX
         pvR++tOqATJM8FKDZTRB5JXXbIcQxprX4ZSJ4SPoaS7uCuL1Ludh6MkIgWXsQdn3cx1s
         17wkY3V+pjqTK42of1TriBl81hMF3gwiA926SekONyVeuiwbW0X+zjeElG3ikVYbDsL9
         t3JY6CE6FOxGama3M0Af7E8Xfg7AjU+JxVP6QfCSV6+4u6AJUerHGLIRHt3VC/Vl9QmI
         yt57Jd8oiPK4ztigwFE+/ZXLCfISesdPS8tKaeT7g98kG1HNrqN67MvkBT1cqO8I5+rL
         UWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778306; x=1782383106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
        b=pUPKmR4RTW5N4SdBnrKwdRZViXMIWFLYGqAXba0zZSSvhuIMjOzzb1Sw29X8boubcD
         9Ultdgg4FjmZaoVlY8FOelug7yCTQCww3aXok1PkcWSwMVPwfZqj/qNepPUJEAyvH/RQ
         qJ9tOGEWUHoHtgwOu4G/Pbg9dObFtIyMnZd2z6VB4rl7FlkqMUBVyeERQcYnKtVnuaaV
         rZNwWAKGlLzAEMoQW2v2yTd7ZKDKgN/brteLqVjShaVedwPyuUpI6fg1vjTuj9SRjI97
         EDHn0bzRUJJVDNMdGh3+TVFsnL7P0t+ClQIXWhTfSch4jYjDYhbihOJwtPuOkvjK+FIM
         /0dA==
X-Forwarded-Encrypted: i=1; AFNElJ9pYNSfeZHNIQpVxw+O2q2RX/PDpNigxhjp3mtH0NmV7ThongrvUJOa1jkA6sOkmfIddLLZClhnKEJk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh2akMrut/PGSE9fIJrtHDE5qSLEZuB5nVhT7FlM0MeCU3UR/0
	lUOzvjSj+jP92SBsfQCoMdikJ5Q6+SGFUODSzBqIEUcJhR6PfcOYml9O/odcsBNtO37iGCGwRdY
	yZ2uRku9tCUJNEPuC2NMesF7EaD+gcQE=
X-Gm-Gg: AfdE7ckwqzkE402EiMQinPtez7rzWlc5D9ePNNSXF/wpOlqbagrA/llL8aFHhqmjG2T
	G8F5pyj/pOSFBxrZa9Q3Rp7M5OIs6MnPx94JLtTWOK5lelou/9FiQ/bjC2JZfkZ8r+/1KgYCVFB
	X2qOfCQNdmamGhMy1u7hjUlwqA91nQbyggW+GovEnSz8W5tDJE/C+2xCkFEksPqgPWdE/LWqErA
	fH3XxPfUaM7FfSZ/9HAquhySm97BnidbPWdmWLyXm6E7V6scyITmnMJTnZTmyjL+CyHhkDxKT6L
	e+h9JXdpqLpPl4aqZC0z9oJFUjsnmEAs8BQmZKPQ3h+PmSkJr4AMVO6OSgx6YPyHu26nCubJKG8
	Z2w5mCQhsddPclm4=
X-Received: by 2002:a05:600c:5644:b0:490:adb6:7957 with SMTP id
 5b1f17b1804b1-49234141d98mr81843365e9.33.1781778306310; Thu, 18 Jun 2026
 03:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajJwqDt2jUfhSD1x@shikoro>
In-Reply-To: <ajJwqDt2jUfhSD1x@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 11:24:39 +0100
X-Gm-Features: AVVi8CeKp76ZYhBRPcDvdhbfVkObzMomSw3gP3ldqFUf5h9HH7P4rMMrIdx25Ww
Message-ID: <CA+V-a8uo9sr3m9F_MQYbHVD5wa3LT3n6MWrVpiNiPDumnVHMYQ@mail.gmail.com>
Subject: Re: [PATCH 05/12] rtc: rzn1: Add system suspend/resume support and
 wakeup capability
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Jun 17, 2026 at 11:02=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Add system-wide power management support along with wakeup capability t=
o
> > the rtc-rzn1 driver.
>
> Do you have an actual use case for the wakeup functionality? If it is so
> limited, then we should maybe not support the weak abilities until
> someone has a real use case? For which then, a proper solution has been
> developed and tested?
>
For running s2idle cases with rtcwake > 60sec this feature would be
helpful. What do you think?

Cheers,
Prabhakar
