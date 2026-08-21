Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDFE39282C
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787310390; cv=pass; b=SpAO4NPKTao6N3ANU2cXIEqZpE3lvVGs+Q7hDFhX71b6aJYCzLsZvrw1FowcJqPDbfEpYySeefnetYBDNTcCv2VOiq/+m9DzPBMw9R6ypZ7RFunYgYfKB8FI+uwfvcXcFwkTMPUBKgUn/P7UrqjvwprFnC6ovGNkd/6B4oky1dA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787310390; c=relaxed/simple;
	bh=KrZ6HeRxc2ZB4KNjY9rusjhD8xWXy4q4jVkQHO73EgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFEGxA8h1nzGU4Nx8GH6wiSogLh0nXVnKGYsDW7fFsGFgO99n+SUbQUqwi9uamGN5W2Mjr+j1noks9W6maDxmguuibR8G9oex6M3R6f6CNiKSCRrxJS2+++t3PrUue27sfitPZSDuGnehTyBIh5LUJVpzDp2X97q7Wjzra14Wks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8m9tW3n; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8m9tW3n"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fe89fb333so456327f8f.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787310387; cv=none;
        d=google.com; s=arc-20260327;
        b=r4o7Z2koZxeliQmCNfXOfET0pEMznS/nYzTp7UTawyo4WNF48QGK5Zi+vRkSR34bx3
         vYhSnDIKaLwmEljqZSwAma4PQL+OZhzOSkwz7V7rWBHjUUp+D1KXrLVDB8mpV4LIv9Gr
         dVq5BSWtnkAGspbyUnrWP9brPCWwJrswrrUmAuGJHO2Opqmeo3nv2QUxTNrYrF8x55Fk
         FyG3YDw9jRMAhkvUJFJ4OeWZ+6RuAaCfRDBjIlZdTBnJ38SuYPLo8xf3XSjLohLzYoz6
         phXB9jzZLmNVkrRMyiX755igHI+n8Kag38hW8v0EQfaX6LMKXl7qjO2R8jj3eZy4pvX/
         d47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HoJf6c72cR7dmFL5Gn6KP1hZaz/7qfGbBe5YOvKHjgs=;
        fh=5VMwSRRaKmaQtpjQCKcAqF1PkDCARU8ay++xijdJqbA=;
        b=Dzvk+mcMPxYkXqFJB3Alg2mZwCq6MiWfDjyTJjljc16axPHs73crH2YmzpYq5352SH
         ledOEUCNvOD16vTATTx+pmH8XD36PE2MF0w8Ryt9ZjWGcG2V3TNm5HulA6YWVVLZ/x4Y
         XODC4JHK0/y5EYnAVUJ3Ih/eU9SsDBI8p8Snn0Q0YVWmutb1KIGE91qZFxVNvOh0yeAO
         Vfn+g68RvlUHYzLbqidaY8uIX2QTq2f7OFCPa26AkiOzTgO1dfjfFoxYdLSnBPN6TNEx
         JXhciJMaIq28Oq66n5bfCI8j2WrGmvTdAnx67mhh8aV2aWKfqJDpH49FVkFR6Si76jVa
         f7Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787310387; x=1787915187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HoJf6c72cR7dmFL5Gn6KP1hZaz/7qfGbBe5YOvKHjgs=;
        b=d8m9tW3nM+Y1r60sS8EOkeQyEfpz8DPciym6BDPezegSU6e0mqaGGtRR2x6mo47JYk
         H4lGR2kQ1TLKnj2Ky+2vB6Ni/DQ+JhAnzTrfaso/VJXOzFbqmug7IxBow8wVyqWfSA58
         eKE25VmYC2wSUWbGWbsKIIxli/pUwCwjN+TM27hxE7KhDog61lgaX7Brt5qIAZ/BNBZB
         vkQ1FoLxSskQcr+IwnQ1v9OYXTAyk4RjaAi7CA39LqoNDYfGB/+FdZHfQE9CZ4QdXIG1
         VKNe5sagm1UUcoDJqYUfkDI5KfYkU1RGCRdbpRUaW8eDHg+HlmmBMwY9wjVag0kckKvy
         p9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787310387; x=1787915187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoJf6c72cR7dmFL5Gn6KP1hZaz/7qfGbBe5YOvKHjgs=;
        b=DLSHC8KRpdvs/26Ko0Vr6WsLsrbketTtn6x4HefstCZ+Tph08dX/zMszNUP/IU+yRA
         Y6enHZXo6DdVzhqXkfZO5JnFsJXbn2t7w2We5de9EQCUC81vMI2+AV5PsIAHtDtAROn8
         ds5h/cLU2Vpk0r/nP3v2e/Ye18+UHwOHrGaDvsHwMf5uQ6OGMjkdzEJUQkNf0zfKtf0c
         FRiraFUi3A9MlVdZDqeIoq7juW7il8i478LQkBc1k3KmwLMdiOidTPycroj0/hBXj6YH
         29c/0xRyuPpqtd5X0Zcvt/bpEu4UnTWCngXfgTTsOw34Kqi9J9JH7AmZ+Du8E8T46xQB
         OtfA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3/Bt5KLJT5ykVZN1ebkkQ6JCTjKeM6M3dhQzhE3T360q/ePv/GjTUUzHZt6s4DhO7ZvnIgyhrnQS6@vger.kernel.org
X-Gm-Message-State: AFuF++lSIvsXlAna9hLww1aoMT29Qhen11PiCwmXivkKA0WuaSDXDcKR
	LRwdzVqXzbu/tVAFLgnFgqdvKHMUs9UNl63xP6EwhBNgRbJ6edcGGRI3K0jDeMDiywIaElNaapj
	hE8wqXgX17CONRUmvGXRiJJKYF44vQog=
X-Gm-Gg: AR+sD138FxNu13HRSQeycRHMZkG+T+9ICHgb95Gr0H7k8BoZGwevjhiCyUJp91etoZG
	3xOxi/p2BmvQtQcT585d34sZ8C0AMFa9vRERcBYeyne2MOxIeYKRVs84rQ0MALj4xSO5ArLxr5b
	Ox0H2iVFuYNjjFw//b4NRgjMTMfY7LX7Fe/rYk9I0GNgru625zZ4uOXntBz3wQ2rbaN2Ie71FAR
	byMVgqs34ZkNlgWjSbBBZDktzAtLL9Awz/v91x18LKv38ZuopKZL86OtCYnBlXJ855wrBMBQJHD
	Jk8falmzIOh9ObXZ2Ta1UJ8gD0mCkIbpYYauiwAcS7HjPZz0KeDQNdB2mNz1MThl2sylbDOdw6w
	F/CDBdwCT4yCcWRdj80efbNchOUgDfX+Pggs=
X-Received: by 2002:a05:6000:41e5:b0:47f:7b75:9dfe with SMTP id
 ffacd0b85a97d-482c0b5bf92mr8558786f8f.8.1787310386687; Fri, 21 Aug 2026
 04:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aobjCr7ZtpLmL3VP@ninjato> <CA+V-a8tpo2Rc9xsvsj9LLqD2ZjoHzRAVsox=7xURAtwA-GYVEw@mail.gmail.com>
 <aogbk-moFmTTFkJ0@shikoro>
In-Reply-To: <aogbk-moFmTTFkJ0@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 12:06:00 +0100
X-Gm-Features: AcwNN1UGmz1uUQCIu-LKe-mxUq6Df2QcPbc9ZZ1iJn0ahM-r4uBoryBwB3wI0p4
Message-ID: <CA+V-a8txC5U_VvXBYnMXctBg2Jz3a44NZjn-P39amUq5HihG+A@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] rtc: rzn1: Add OF match data to gate SUBU
 register access
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, Aug 21, 2026 at 10:34=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > } else if (!data->has_subu) {
> >         return dev_err_probe(dev, -EOPNOTSUPP,
> >                              "No valid XTAL provided and SUBU mode not
>
> Yeah, looks good to me. It is maybe a bit hidden that xtal =3D=3D NULL in
> the above case. I wonder if adding a comment above the return command
>
>         /* xtal is NULL here */
>
> will help understanding? But I'll leave it to you.
>
Sure, I will add a comment.

Cheers,
Prabhakar
