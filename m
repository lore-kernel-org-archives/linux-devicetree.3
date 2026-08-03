Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A3513A3F7
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 22:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785794678; cv=pass; b=CjegFJt7VKpmUQrx4csUTWgSMDjdxxGVo4xH5L0UFBHSEVY+tU6o8J9T3+hJwot9V+t3eyp5GkZliYNjk3ipWuQV+R8BoppYqXFWZI4N74b3/VozFSZ5/tDvkl/0sQ9ONWc2forfICI0sRhBhuKsqUI02q56PeJQOpEWNGWaElk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785794678; c=relaxed/simple;
	bh=7WoJ364o71w8b02TDFU0Hi19/xzHT2Re2qR96++mBVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LEOnnjWR2WygBIlYgW/j0GuNyuAbss0aNDS0z6rzdIkMK7BfN/OBFSbDmC/xW1kTiRob3OYoJ7dcDYG0kYh5zIepRsg4DHEtvpmzPE734WVZL/daPJPyvXkcysBZj7LB4Sq49LeZoH1KAdapWA/3as5XQ5VzoEiL/wjGY4ZNpPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRLf1n1B; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRLf1n1B"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a097f5ab95so5190290a12.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 15:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785794675; cv=none;
        d=google.com; s=arc-20260327;
        b=cyf2MWomPZMFEAqEE+e9rEy1/0aaaBZREYhPQP8ymSlGvdvLU2Q6JBjGAJ0vpbeSQg
         Ut2RRXZ6OGwqfxS+ldLltOUDhwf7FVWgNnBSvPuHkaK1bEqIABOt+eW2IWsrI0YODbw6
         BxWz5uX+82tjH8dJUfnR+1ngNyLh2D266QANLxdozzqijshInC6lA8rnf/R8Op/0pGdC
         Txss6WV55Mvj4qoh1MYrz8vVylQapBKTA1hYiO15YCuAVJfyI3y/q18hRYjew5sxW0g4
         2rjds5kQLM6BuHytfuhEsFgL60Zu360M6b7JFwhjOu2frSsD8tr0CfO2RM7MzD9HZ688
         jZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7WoJ364o71w8b02TDFU0Hi19/xzHT2Re2qR96++mBVE=;
        fh=latB61FWJkhsz1gPXXes1tx6BgkX5S2KyNzbboHoRJw=;
        b=I5WJ/y2XGaYmvZn8IZhKngDD1FII+0cU5HpuV2VPpc0ulP7lbtllcOhe+VuUdKyhKZ
         xph6e4Sr5cqODdKSmvJl/uYpQHgHfcJjEp9lO0Kxlf6WEE4VfTl1Qi/rvmbICAeFk96q
         JMoo2kW9j8K/tO7YuKy7ujTgGTeG1Xggrq1uYl1Z8D2nQXfmoFPmMymkqAAfynHkqVxL
         PjvoWiYDgW5DBn0TtMNHzve78kk+LR+wwXei6Oqt7f25ZRrb1YaKI9n3DEg+JSmy6LeL
         k7nYy++WIBYrIRv56coplcP18ZHDUExO6TTlHSnvf4W/zPO++6Q3qWtJ/6kuk/CQHYy4
         HmoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785794675; x=1786399475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7WoJ364o71w8b02TDFU0Hi19/xzHT2Re2qR96++mBVE=;
        b=KRLf1n1Byd3j9CtJ5fG7KJgYszv40Ow0Kg2e+9XEw5aUq1y7WBjUo35fBSP1E0E50N
         F2yFxg5NudPlxNiNkFrFJ5H9ymX5IZkKryPj7YC0TJ89AlnL8FsS4RKbnkvqqMlMu9uG
         b2HpdUlgY/p86Km0/h/W/WZjo7yfb5tY4PoZbo2iiNIHwrsPk2fFco3tK9YeV9nAXvy1
         gqPAe+I7mYSTleUGYoCPAKppcxa4GrVQq+x+2t3V2uVf2LP3VZ27rbMZzUXVXyn2HrWj
         y7yUMWQhifMnKhfqnmYvaKIVXkG6ryxDuS/CsEcK3icQVnYv70Acxb7vGXC3qoPhRxU7
         Pn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785794675; x=1786399475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WoJ364o71w8b02TDFU0Hi19/xzHT2Re2qR96++mBVE=;
        b=UCRFrOAZW5+7jGRGAnNCnrN5QpBiB2DzNixIhEnbnaRCBjK+4RZYU3/S5/CwrXjY/X
         p1TqrQJlfQbc/M637ikp5dCkNifHia9iRUMblNyLkc/5H09lxa33KAVgsfZ5659rQwgz
         gFkg/8elYpe2CBnTUIyYwOShn+Jw4QelBStw+CuGYz80SCugAkjhks+4Gjq5DacRQy98
         CFBkWVVUgTdzKvgNoRYEO04VNgnxgn/I5c7yGCxnV2r/QsvYEwoQXPW7RabETkXhPAeu
         YHhfnXul22X/rCkk592hZl3QO7fNfi01hrZXseL3l7Fbt5xpE0aiNC5U3+pwJYvjlHZ8
         LEyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqF0R5q8Mof3Ojw7+rwS+89mQcNY8IYVBgb1iyfsvYBhuiJOdhjAJuzHsce8I/I/a/b6joynIZQWLxp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3QAwUXJIxBLsEVAoBeMHvxPv6gzzwncI9notjgNdaib5hX0dU
	nhql5KrU5Ligw2RJ4IUEGpQjCEqrcb2geE4xZbMReAf19PjX/FsWcQ+gDw5BbVdjQWG1nZv00MP
	1SrMy99YqwAnW4ilB4Iiuq/esSf6jKrg=
X-Gm-Gg: AR+sD10DEqkjUsFOUSv/z6zJ6e9EgDhenmfjwX+eD/Qip0pFIdutIfAzh9vXs+e2Xei
	GCqRKkq62Wthmk0/QfIWz5c/oveLIze9abaAPHjEGh9CiGc+cgv927MmJqiTSPl2qW+TQYwEIJh
	MVpyALGUsTTr+VZlVVxYELMeQ7m8xQ3eqbXuErVnQ/gVeU+lTVohqFTxDaVxlS1At5oxoMQfgg4
	1rSs7u6GXHu0D8xaKupyB5iM8aAMSfPZ+/65yFZh7AmjR9L2+SjYDUu7hCBuFcOTgs5xCf7sTmb
	ShdO42PG7H4450KG+CgwHCHkAfwTXEgbazVBtnbWjE0=
X-Received: by 2002:a05:6402:a0c2:b0:699:728e:48c3 with SMTP id
 4fb4d7f45d1cf-6a0a7c60706mr9085678a12.9.1785794674539; Mon, 03 Aug 2026
 15:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731215043.30392-1-maximpedraza@gmail.com>
 <am2mvECnCcO9IxuI@monoceros> <6rbjbj74zh.fsf@pengutronix.de>
In-Reply-To: <6rbjbj74zh.fsf@pengutronix.de>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Tue, 4 Aug 2026 00:04:23 +0200
X-Gm-Features: AUfX_mwLFzASRisUw0SGYbdrUbrTEEZl2WcpJHPwHspkAa-eHL0jaqDpB83YDME
Message-ID: <CAEUXW=EHD1Y1zHQWE=jFhONM5Hg6TTc_uPYHgp-GS-4YWYJN3A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Boot logo supplied by the device tree
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 3 ago 2026 a las 14:39, Ulrich =C3=96lmann
(<u.oelmann@pengutronix.de>) escribi=C3=B3:
> independently of the specific implementation, please keep in mind that
> the kernel is distributed under the GPLv2, which may have implications
> for a proprietary image embedded in the device tree. That doesn't
> necessarily have to be a deal-breaker, but it's probably something that
> should be considered carefully.

Good point, I had not considered it.

A warning could be added to the binding documentation about the licensing
implications of a proprietary logo, aimed at anyone thinking of
submitting a device tree carrying one to the kernel tree. I am happy to
add that in v2 if it is considered useful.

Patches 4 and 5 also avoid the question by construction: there the image
is a separate binary the bootloader loads, and the device tree carries
only a phandle to the reserved region.

In any case, whether such device trees are accepted is ultimately for the
device tree maintainers to decide.

Best regards,
Max
