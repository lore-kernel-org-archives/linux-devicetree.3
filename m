Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747F73E4C88
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250692; cv=pass; b=Cmo+myYlQv2zx3SqtNkMAbKVgRWEvMf0734KzzfVl/A6ceoHGiKTxt25/mYMcHMiIX87czUIWVP4q2MjWBthVnYb64dj5jtlQofovnVQk7QHPYrFtd7KwVlo9ke90Muz+rQA0vU2Os0TBbB9DvVNh3PQN+goQ5M5zFXlVFOq0z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250692; c=relaxed/simple;
	bh=AAW7Bc+70pQhpUTfJT214lM/e5AbzwxyHZSFmCFPS7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M56IpLpEL3hUjVYCVPOP8QDUkBqxmv7r01C0BrkOTUdMPRjow2ZPbwP3Tk/BKf8vzOQmvHY1if7KY+kq1G4BxlUGeXn0s9yCIPAgpoHJatoYT2+QUS+VS26EQxJsT5ooMsGRYdI467kp6cTiCnIx5QAruTSpsHvQ+TKxJi5xrwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FOExL29O; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FOExL29O"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7dc6fbf3e86so8162717b3.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781250684; cv=none;
        d=google.com; s=arc-20240605;
        b=i9CK5I8g95ruEu48/h2ZOkQCArnEYLKx93Yapn4p7crneY6oMkilXip1OIBDkw6p9j
         /0r20LMQ8fLQrc23WzjLWLv/IGjHlFn7dpTO6rpUXSRHXHeZtQ6t+MuFEISioSiYRDQ2
         t3PuWBfEVeNng7zxT7c9zKSCB+0KoHQo/iZsqU83RminDSaamDUPlZSki4DnPTleV3n6
         kNjLUgL1VhUSqAAnkTwm4nGe6JBRyyO1j2pEp9Hkf7+CvDsIERsQ7dP4qxqEqttQEhAH
         oHMvaBEDUuJ8MgV5wSOrEuwnfpmFcQRmtE8R4DXOfkB7eIVmYQ9yhkwEt6kz/+7O71/9
         9Uhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        fh=6uZwbD7zgsTorYzbSwhsOI124Hxw77GyZinkAihyAX8=;
        b=BWi00gnKi5/YWCFfsoGgKSggis1to9vndifMaY6RajTb7Fm93xFoArgWqq9gWRyk9U
         vQtCuUd09ka4s9c3PXIPGnCo78tRkGK3WX0TXCjCS8Dm1HuBls+5UTL+kxNEv3Tonx4I
         WHxe+REDuwosNzonTFdcUcj4MoUHFgktWUvtw2tPtQIwe1JyW2tItJ7HOibPjhF3GVpR
         O9EeYCmoBT3L5CYvkHvmBB1CaupjhOTXsQ8/IJiUFF11AdUWB5JgINbynqSOOHNb6JlI
         Gzw/AzZLENs4Ex0FlPuUzGylcx5tyF0vkktMgTtNFCAbcxAZ6nsIW0zCBJ6PB+f4vi0U
         dy3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781250684; x=1781855484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        b=FOExL29OPYXtRjr1jFVeFa7zcPsHHFHr6diu6VMqNotYkNZv7Wjo3syPc4R8ExctZp
         dRfHQrQ1QbppC5ogpXbF12ugxXsiKvzABW9lOoaQg9awzs4dNN/NYp20PF5wDlT8hpjJ
         1S1xuuiqMchZQ6nCjXW2tI+NMR/LrTS+SDRC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250684; x=1781855484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        b=ZsY0H9Zx1Mo41pOb6ahf8h8dk1mMJrSoT35QhFovDbfSk+HwVIXx2emlLvNJ+jQjRx
         /LECoWxqzcRAmzF8PE+DZCJ5AEb5NhmwyoGuXGn5pfSRMDPvovi5ZdcVKoXWF30O20Pv
         qle4B/y29WI38CRqy6cX3t1uAxhdh3ENRmpRouFCu1EqBnGIE+3dfgsUklyaRBe3Gvu8
         1G8NKJ+oTCLHQtzt7JY0Xv4aXjee/MnP3JkGEN8dhaYJ/l3dvZOPJmOnB4W2Juk6AW7q
         ZelAoKUTCNNGsoLY64rTB6SBAKYJ/C6qsSEnWJo5ay5apjtcf2AgVO/4pyxXKSFN/SpL
         c4VQ==
X-Forwarded-Encrypted: i=1; AFNElJ95LtOKmUDdR1HJjG10njo+DNjXVJ8zDCgfF5BAfRvu4yh03W8LsHYDqKEwmwCm71x2J2ZDocDN7NvB@vger.kernel.org
X-Gm-Message-State: AOJu0YzDXYKEPzZl7/dYjYpZRUn8/fp/qQwJLoZ9XTrpfOPHwizhJw6e
	VeeuXUqOYykYn4GSd3Rtcde0XVIfbO5jM46qyZUH5JLEqBNuRR9/81UbzXRjvjRTVmpkPJ667QS
	qUZCLo1f/CfbFoYTTQbex3XQap6UFvwcKyylxGyGI
X-Gm-Gg: Acq92OHvPAi0uIJV8BDSnPdDwmrB5yWXfg95+YnD4YGpDYHzAcJaLEg4SQrQk2nPhvM
	jU4P3ngTjnxtIXrWYPaUBP2CzkiIR3rvlv6yDRYHBO3+NnD7C9IcUaFERN8AQnSM+/qqGBqGe8K
	gLlzIowTjZGwgDu6byzEEVxkseJAxhTQ1b7iRVi1qtZraJ6zE54kr9UUxDpEPy2AvBneVkOfpYM
	n8Sap1dsUSkpxc9VjClN34+NDH89b12FKeP80Qax1jvi+KpqV8QIr4ZuDoBYkMn6zLNpAYgQmnA
	nWlJMz94
X-Received: by 2002:a05:690c:ec7:b0:7bd:73f3:7a70 with SMTP id
 00721157ae682-7f7b8523999mr14898787b3.32.1781250684397; Fri, 12 Jun 2026
 00:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-5-wenst@chromium.org>
 <ailytpKQcvYTUH7j@ashevche-desk.local>
In-Reply-To: <ailytpKQcvYTUH7j@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:51:13 +0900
X-Gm-Features: AVVi8CeA8ndBvqsmj_bBdEg4mr2h2E0R3_zPJJzKBFEx0mTdugBDzHIodwmMGm4
Message-ID: <CAGXv+5FrD7abUvw5JgZECcGBvtOOpezDtmUrCRmVAbDx0ApxhA@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] usb: hub: Return actual error from
 hub_configure() in hub_probe()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 11:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:38PM +0800, Chen-Yu Tsai wrote:
> > The addition of power sequencing descriptor handling in the USB hub cod=
e
> > requires dealing with deferred probing from pwrseq_get(). The power
> > sequencing provider may not yet be available when the USB hub probes.
> >
> > Return the actual error code from hub_configure() when it fails, so tha=
t
> > the driver core can notice the deferred probe request.
>
> Makes sense to me.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> One nit-pick, though.
>
> ...
>
> > -     if (hub_configure(hub, &desc->endpoint[0].desc) >=3D 0) {
> > +     ret =3D hub_configure(hub, &desc->endpoint[0].desc);
> > +     if (ret >=3D 0) {
> >               onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
> >
> >               return 0;
> >       }
> >
> >       hub_disconnect(intf);
> > -     return -ENODEV;
> > +     return ret;
>
> Can we convert to regular pattern, id est checking for errors first?

Sure. Will do it together in the next version.


ChenYu

>         ret =3D hub_configure(hub, &desc->endpoint[0].desc);
>         if (ret < 0) {
>                 hub_disconnect(intf);
>                 return ret;
>         }
>
>         onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
>
>         return 0;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
