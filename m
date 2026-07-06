Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692523546F6
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332547; cv=pass; b=EwF2hN2wAIy6B8o/2eNbqgy3S9IceZFOjieSIk30wEQMxZBgl3+wkhUGUdZgc60bXEbyUv1oc9kyH/3hICd5mIi9U4zTwP4F3HhpSjimiSrf4v7fVgYlZvBuLlg7VLRJS6UosQnTfXAuJDPf9kAczvpW+QxgfPea6cbTyBfbQ48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332547; c=relaxed/simple;
	bh=IFML3rF9djtar7SwsjcOXZQUh4NL6BJakKNcU6x9ydY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/rn7DXudDc/4r7flR8GWkqaeC5GZTyg7N9b4CUAiTDeDDkN2vtcpReDOV+aEM7ui9Ffbpn9SaK7SDavaBmas47WEUz7o0JZnUt2a3hDJZZJ2XkP2Et8uURy/6tTS07Qq8GTl9qt8o+I6cQY+RmOSLqTlNtGcE9LR9paScIbpjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W8gWe78Y; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W8gWe78Y"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-664b3831a20so4008958d50.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783332545; cv=none;
        d=google.com; s=arc-20260327;
        b=OlQuOhvn2na4A886t8COMCKewHhvSgo5vvCDGY8qlI0IioINMUrNw6LNf5N/UCSD2N
         Q3Ole53USwfUYBGU9F51j1vPHvhYmhHEaLWNrtvuBAFxEqrf4P8P7rj3y2CMxY0shbID
         mveElBJHqKb8h8NEIkVgG/H1E0Ijka2Ku3GhLmPH5jCkolpOcL67//IO1uiH/ncXN2Bj
         eCQSssVVgG5QzvANZjRZfwNsptluL6STWuHSf2P0rCTX0Eoa0w8ACwUNOwvTKcPzVCHU
         bThmQB779vfQlPLcyIa5n6agvefWzchyKkBWW3l1J5iOifT5hbkwvUB9cEpaFky4F6Ky
         ROLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=;
        fh=k52ZlyhU6/38VjKVpHk6LQxZdcaOJF31C91MYZC1bxM=;
        b=eDBnjNqBRel+odF5cSy1xNHioxwi4Tu8jr4eMwfW9UDjQGQYkuC/yT4mycszk3iBtK
         eJpbXzETbBoIzjpeLGxM0hBcN9yjwq4ZhqeOsvuQM6KYkiO821OUmmcg0+OSDbwGVYlw
         EkVz+DxilR7PsI0mZrIzflTeyaPgC/XCDoTvpQMFMTsVbWKF7xmLuM0fYJBqOxvI1Lu/
         d8ETQ0RMntkffEhEmArdFvD6fdXCFP81zdcxRfA/Wa5ydp7cqHOQZJ6H3zZdf00Ne5m+
         j+e9wrRK50OFC7xGrwFIma+oKJeHgrwNS1Na26rtZ2c785gAZyu8dhQ5T/YPnA+cGvrg
         vcaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783332545; x=1783937345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=;
        b=W8gWe78YrA1pTi5GDFMAUKQe0D2iKHK0Vguck/qLEYSo3O+R+m9ayYRo4WZx26FsAp
         35DA2NHhnJ7m6fHEN/ix4oylhpJxi81jfNRT5ytbLsrmJVaATVuC0pEIXRxLGgiFryKo
         WO9E9sa9ijZQbodstMFeBvql79r4HSdJwAE+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332545; x=1783937345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=;
        b=USdHkEynsgwiFn2lLOldBVg1aNwxcCqHuRkmzsB3DB0brsoGLJAi6/pc9IIN3SAgMu
         fnf9wK2qqNHY4tK+0psehM2veaYTgDesieckDB+y2rMsYpsQqhVxDQBtEAFu75JdOsSP
         yb8y22yRTlQ7rgkzAv6gx6aA6Q5XoNpTBtsdGGHlyCjhVMy+B7vCeTOPWZvkMjPDYqED
         mD+YT1KyOgIZZEvqbxloCAlMXdmWv62GZZdKdYI0hhRGKnhRzhStOwdcDsfcC/WNgNyG
         cH3Z/YYt2oIPuEg0CB7B4ExXCvxHnJ1WDdz8NzCCP8i6vXTB/bSZc+2hBsXqUfuOecQK
         2wdw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5j49LMUeZUxv9FL/Eswh3O059udMZ5iOffbbC5Mv66D1BdQiLkpLuugfEkmmnYM9uk601IPGMJHJc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3h8IFeREpP5yghhqUuMj9aECPP5GfGJUccKJvYfy8fs3l+D8D
	ChpXUNAQ//oJybBRtBIQ29S99W3pXbfFdl927TVykIMrdQmJQeK4LxIaawM4/w3CNIDH4Bme8C9
	//dhQSUgjI0a44MDeMRyTvSPh5MfE6IeyluIN1QEa
X-Gm-Gg: AfdE7cm4ua5bUnlgBh3GFIQlJ/Z2yZwe76iuffZhZ2S5d1j5mhID4yS5IpbG0f/3zZ8
	VNSizlRHEsCTAevUZCfwuxAfEjEK6h+Sg9YAi+Px5g13Ul/n7Sklk3+tPun0VxzZWai+y7D1CMY
	5hJBN9nIX5BJzp47HOd3/olyLQ+beyP79I9uhjEWqeKQ5/EuaKG0BdQeOz1ardPCrfnxzV4Kzl7
	ZZV+2JbxaG7Fkz9gwVwRDDOwwkumnN/scJO2sQp1bCXfYVtQw/J6oZL5kYHjTXE5Ap2w6SL984I
	bvEHzUCVneK+GSdUV6k/ovhujAw=
X-Received: by 2002:a05:690e:120c:b0:652:5567:b3ec with SMTP id
 956f58d0204a3-66652e2416cmr8660052d50.37.1783332545405; Mon, 06 Jul 2026
 03:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703115601.1323491-1-wenst@chromium.org> <20260703115601.1323491-2-wenst@chromium.org>
 <akmZOC_J2ZTl4zLX@google.com>
In-Reply-To: <akmZOC_J2ZTl4zLX@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Jul 2026 18:08:54 +0800
X-Gm-Features: AVVi8CdednA09-ELXrMS4uc6xSUtulA0xKkThvjfCvkhmpOamhA7IkBdQY8wb_E
Message-ID: <CAGXv+5H_SXO0DtN9wjrXyAvuzG+CkYh2-4eMg=biOSsFV=E1=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] Input: elan_i2c - Wait for initialization after
 enabling regulator supply
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 7:44=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Chen-Yu,
>
> On Fri, Jul 03, 2026 at 07:55:54PM +0800, Chen-Yu Tsai wrote:
> > Elan trackpad controllers require some delay after enabling power to
> > the controller for the hardware and firmware to initialize:
> >
> >   - 2ms for hardware initialization
> >   - 100ms for firmware initialization
> >
> > Until then, the hardware will not respond to I2C transfers. This was
> > observed on the MT8173 Chromebooks after the regulator supply for the
> > trackpad was changed to "not always on".
> >
> > Add proper delays after regulator_enable() calls. To avoid impacting
> > the boot time of existing devices that have the power rails always on,
> > skip the delay if the regulator supply was already enabled. In this
> > case the regulator is either always on, was on by default at power up,
> > or was left on by some other driver, such as the I2C OF component
> > prober. Either way the controller has had ample time to initialize.
>
> Unfortunately we do not know that [it had ample time]. For this code be
> reliable we need to record the time at which given regulator was turned
> on and then execute/adjust the delay as needed. Until we have it we need
> to assume the regulator was enabled at the time of regulator_enable()
> call.
>
> I am not concerned with increased boot time too much given the driver is
> set up for asynchronous probing.

I'm a bit confused since you raised the issue for ACPI platforms that don't
go through the regulator API. Now you're saying it's not a big issue?

Either way I will add some new regulator consumer APIs to handle this.
This needs to be in the regulator core to prevent race conditions, such
as when one thread deems the delay is enough just when another disables
the regulator.


ChenYu
