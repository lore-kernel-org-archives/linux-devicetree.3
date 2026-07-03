Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEF23D566B
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085016; cv=pass; b=p6tJ1fxPqph7RJ88JIFDbcU/Lp39jZCGBecjFJdYMzbS+4w79HWjRhTGOyXCjMneDxrQQq7cWttklk8cb3gK/5Qy+ZMjVbUTLzlOgiVRP4+hjINbyodXvsJgSoeKEItZmLau6IpdudNsaoCm0E3qLs/1yvc9Zce8JQDweto66u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085016; c=relaxed/simple;
	bh=3AQ8P2Il+2wWlMlJMTJ9+9roF3hePCnmEzgS9nHgr5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKNqhYRgQAunUIr12LNp+AgP4VGkkkmUZT/UKkLPJonFCUEoAVLpsBf33SOUGmsErnZCGPfCLHtYqS288demyruVxrD+MB/yY4Bcy1LjvCOUHxuXlN1a0m67kC0gwNPLKDs95KJXMi/ZlJr0i4YjU3TlPoiJcpQE+TMbOVJaUoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IQ4aUi8C; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IQ4aUi8C"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664b84118d5so856650d50.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 06:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783085014; cv=none;
        d=google.com; s=arc-20260327;
        b=X/UBaQw9RJT2kL1MgjwjfU1oMxeLk0ktJX9kCIQJcUY3CN9etP4AFKbYG/iafE+dNc
         DcixgJk4c5QGJfzoLBk90KW6bNuEKMXSaU9Ypp5ZUfRxCsn3V4br/pf6JUk0x1cdDTAW
         ViaSVuBwqnPsMmqx92sPZp83PaDdAdIMW8KwYfDdBGNFjg7f0mDyKVfbLYt01XMPlMsv
         jOn9O/XcPos/w9McvoBMEAaMT7EKxqSozAQLiTn8EDa8iQDGxbnf/UxPU0boK3FGNGPx
         rv2vGijw9dfdVl+gCVXeBFbAyOsxETmvxFGLHZI610jmpKzsoFabIu09fJ5TCXxBg24a
         sTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        fh=gU6eNXIJectlCiDsEAB960eTpfGLHLVCSRj1AM+KQME=;
        b=WqsmLvORu5mVmvUzS/TQi8b1gtrVsDwKCFYN5u9erXpNQ8FuwnYr1o9yy5jcan4lV0
         Ex5EZ80cOEXMQSbxnzkwWB7BKxynkRbkJyvR/7HxluuRrZv5OrHEYVgmRdKORIKt7LDo
         2akIhGKDuuCmc9eI2LViVOnOtWBnMe0rYbX5ACZpW6x0Mf/+pPjevOpWuepmANKh+f0i
         AUtw7i1DOHDSwLCzT1p2N5n7gha2Yl7HxpaUPy+30ERHB/8wELnocBYDdobVNTgKDuVB
         y1kt5fDP7p8Uv9o4r672LgojVamhtk6hnyAVXGv7ZlMwr4m6wao538inyPk/BLisLcdi
         c+/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783085014; x=1783689814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        b=IQ4aUi8C0LNoTxme4CuyHG7VIaNpGV12g3QXJ+WtQWTRVO6ehCpT1hEHRYiXC9n6U3
         TLeXCjwO4xjlAu8/gdaJJSXobtwRTa54Q+LI/sZWcUvVIwA04wHkyrRTaFSD4asfhNon
         4lwXVe69j2XLgKi1T0+0jhTSL3Ovd4nhMAQJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783085014; x=1783689814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        b=fa5ydmSC7m6OAZZVmX/xfIL0Bb4WeySP+o/W7cWJsvVODeIVEK5G+oj+FA/+7IZYML
         CYyNQo4MsgDo7+W+u2R9msX1FOOFgPBdh8UMdyflhciGfmCdz8BjkfUAMxR0H6xFBAag
         EcUkdnX4rDyIHNqvSQLAOTaeEVTd13wNeEsLT/6foK4o3oFP2NIj7mj8Ujrz3e1ij2g9
         lCYr0fK4Zu5sFQcnjhBR4I8L9F530iax7yx0dIcCDykhb5Cq1lyhr2CdRIL1Aht9JeGz
         JCz0hUEr0/7q/D4RaWPqnzpRiAKBuaSpOj8I8HjvZZSBOvpBc4sehE0Qgajinc9uK0Fk
         1Arg==
X-Forwarded-Encrypted: i=1; AHgh+Rre3Uzftd+Z0YmsXFdraYEO5HXwJ5C1jhZavpE/tSnxqURYiYcJnKh5NrcGX+n7FKYTkBPWpoFs+MpV@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZM01Ll+etcb+g6enqwFUoUYfSpu/q9XJ0jelbOS8cm6JExMX
	SY+3yxL0jbRlHrWYpY0e/Drqla7jNpiudA5579bygI1Rot/EZQCTj0cKCl1FIBctHPSD83CsZ4q
	s/DFccHclcAbmz8r1NpG4p41tSglqzgX75KxRu629PZz74GFGTRdBWg==
X-Gm-Gg: AfdE7cmlf38gAL1Kj7hs20Vc9wnc9b2+3Sy/ULGut2bvR8w1f+0da1uC5YQ3KAEeyfV
	zrdZ31LHvvVNCU4+DR4xtViOECK0s4iVWEE28Qy86g/tlkhCdAsMpPJ6fFV40VzOXSnCUJg/iRg
	nvbhKKfG66W8KFVW9XmC670wInEqiiVvUwjV3tkyYJNLdEYJ7TBA1X6t5T21UPPoz48NHAA+Yfp
	4o9n4xLTBT3ebsFDSSQoJruu7+lbhQ+JMeYupmM7hYoVDe4jppM7OB4YsNgNWaODtgRnCOetrMO
	/03HDZHlSgHFjPYdpBzHhwg1NGE=
X-Received: by 2002:a05:690e:4805:b0:664:de7a:a014 with SMTP id
 956f58d0204a3-66521a07484mr6637877d50.34.1783084648062; Fri, 03 Jul 2026
 06:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-7-wenst@chromium.org>
 <ake09vk4fEv1D9QC@ashevche-desk.local>
In-Reply-To: <ake09vk4fEv1D9QC@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:17:16 +0800
X-Gm-Features: AVVi8CfejZEcwq-X4tSLhB9B5zlOpwIE7AknFvssi26xknUZgb1hl9QfxXck8os
Message-ID: <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 9:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
> > usb_port_is_power_on() currently takes |struct usb_hub*|, but only need=
s
> > it to tell if the hub/port is SuperSpeed or not.
> >
> > In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> > state tracking field in |struct usb_port|. Either structure can be used
> > to identify whether a port/hub is SuperSpeed or not, as the field in
> > |struct usb_port| is inherited from the hub:
> >
> >     port->is_superspeed =3D hub_is_superspeed(hub)
> >
> > Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> > |struct usb_port*| so a subsequent change can use it.
>
> At a brief look this will be the only function that takes usb_port
> instead of usb_hub in the entire hub.h (I don't count container_of()
> as a function). With that being said I would rather see it to be moved
> to port.c altogether (yes, it's more invasive change, but looks more
> consistent).  I would even dare to move struct usb_port (and container_of=
()
> accompanied with that) and this function to port.h. This might require
> a separate patch, though.

I agree with the reasoning, especially given the function name. However
I wonder if it would cause problems given the linking order. I'll give
it a try nevertheless and report back.

ChenYu

> Perhaps something like: 1) "move struct usb_port and associated APIs to p=
ort.h";
> 2) "...this patch...".
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
