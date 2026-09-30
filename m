Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095EB4E4333
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775074; cv=none; b=fyezz/dSYqguFZzkLGJFytBW0rQHMZAC0QqAdfQ8BSyESxSjvG6oPuiMzie8sO3W7W8j5CknLoYvH5y26/C7MwfJ3TR4Ov/ePTvP08IJNV2Ax1LilutM01keIh/0JUFBm2TgerdyvLRMOeHE/Qa6tRbqP4WGuvdGQ0zqwPg3jkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775074; c=relaxed/simple;
	bh=Hla/uZsWVEKXphFJEWpAx2WjC/np20jV7/TfOdXn4CM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnCd0WNiB0HgAYl+MejU6M/xw46pnbvRHZtDY0RGbNeXXksVn4JnItaYUWGuD+IeOc7AyiaDjgzYSfm/FqDQ5LXCe64NlJKjr1wXHyfuSjs40uvFZkSvreavdua+O7koIANsE7hOrJZW5I/TyanVUOP/m8l+lHIUFKoFvgbFlEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7p2nkR3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7p2nkR3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191B51F008A0
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790775062;
	bh=DgLNjcFeGNUMR6LneImuRXAc6L6Itov9WGhxY/Of5Fk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D7p2nkR3qhmiuEq08pq2mE0/Ks/nhYF2CFMiAxJX8nUQfMloqhbLZUVo2Bs9BtjN3
	 iEoKbt2FAgpwwZKii4E+nfC9OdoP78DYhvgRKbKJLePgG+w4BQe5xz9DGSvOzwKu6B
	 tpNqezunsZOBK+Y2GtOxMav0/zcICTJaM0eTmU7Yd9lSn5YxIL+pFhtGnG5byTNqI4
	 qnsoffa39xDmZuDlvMp8qZU7b90+3mcNvEf2F1UA44ijKPgI6wo6HoxHOtr8xYbg02
	 A7XZ9u+op/EC16t1oWpDHhEjd5futLwZ62eY9x0rBGTiy6wUO2RBaGUIDvfyCnbl+E
	 qhySDJpEgc57w==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a66f8bc23bso34513981fa.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:31:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzS6qdPcwtSLOU/95XGppNJ/1zxdSHwttFOLNguPirBjtNPjcyGBFSFiOCGP7t6vJTq/KQPEz3jz8zR@vger.kernel.org
X-Gm-Message-State: AFq9FYLH23u9ViA6YvFQrBX2DbToUSWPCjfQNhRbsnIJfNaYW7gPGvi2
	q4dgvTbf3gVY2/DbZQKhp0Yn38VYz9OjP9qgdER2bBJZBo+OjUlzh942mB6vk7Mc6PpZ5ZTelxc
	3Wib8FoQTDbIA3FFy1abSVPxb/Gq8hAk=
X-Received: by 2002:a05:651c:3241:b0:3a6:67d9:af17 with SMTP id
 38308e7fff4ca-3a779224357mr4581961fa.12.1790775060845; Wed, 30 Sep 2026
 06:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918143846.30458-1-linux@fw-web.de> <20260918143846.30458-3-linux@fw-web.de>
In-Reply-To: <20260918143846.30458-3-linux@fw-web.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:30:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLk3w5q=bb=nzQicBjRd6xJAxr9WsKvauF-_x4eue8owbw@mail.gmail.com>
X-Gm-Features: AclHuK80elw9ImXmT4mImfPwVaF2TBSlxvLDtJVkK_HN16dU0cX72iILdS784_g
Message-ID: <CAD++jLk3w5q=bb=nzQicBjRd6xJAxr9WsKvauF-_x4eue8owbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Wunderlich <frank-w@public-files.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 4:39=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> =
wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> GPIO hogs were tagged with name "?" in recent kernel versions (7.1+) due =
to
> commit d1d564ec4992 ("gpio: move hogs into GPIO core").
>
> 7.0 showed the unit-name which behaviour is restored by patch [1], but
> labeling the hog directly makes things easier.
>
> gpiochip0: 84 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
>  gpio-0   (                    |tx-disable          ) in  lo
>  gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE L=
OW
>  gpio-2   (                    |los                 ) in  hi IRQ
>  gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE L=
OW
>  gpio-13  (                    |reset               ) in  hi IRQ ACTIVE L=
OW
>  gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE L=
OW
>  gpio-21  (                    |tx-disable          ) in  lo
>  gpio-63  (                    |?                   ) out hi
>  gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE L=
OW
>  gpio-70  (                    |los                 ) in  hi IRQ
>  gpio-79  (                    |?                   ) out lo
>  gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
>  gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW
>
> after the change:
>
> root@bpi-r4:~# cat /sys/kernel/debug/gpio
> gpiochip0: 84 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
>  gpio-0   (                    |tx-disable          ) in  lo
>  gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE L=
OW
>  gpio-2   (                    |los                 ) in  hi IRQ
>  gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE L=
OW
>  gpio-13  (                    |reset               ) in  hi IRQ ACTIVE L=
OW
>  gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE L=
OW
>  gpio-21  (                    |tx-disable          ) in  lo
>  gpio-63  (                    |pcie3-cn14-hog      ) out hi
>  gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE L=
OW
>  gpio-70  (                    |los                 ) in  hi IRQ
>  gpio-79  (                    |pcie2-cn15-hog      ) out lo
>  gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
>  gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit=
/?id=3Dd54a489c8c4b627775445d54a6cbd32f209bda8f
> "gpiolib: use of_node_name if line-name is missing"
>
> Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

It's always good to use line-names on boards for tinkering
makerspaces prototyping etc.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
