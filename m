Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B676346E56
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 04:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783398558; cv=pass; b=YKckn2rqjP+J3L+KYUbpzp/tEQ29MeMVlGEKfJiKurxHYDLJOJqSoSfl/F+g8ne1vK4toMOSxIf9aNYRFjclaghzucjFZ+DcMLZ7WP/9+e/o2Xy+XDRkkargBFRTWGc7d9TrB5wYiLIz8B8Q871IYBxmCqgTTtlLQMcmuSXanhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783398558; c=relaxed/simple;
	bh=PSqME/IPugtczex5NRAm1XmhU5y/+03GI6oS0AsEg0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tgkfs2m94W2qpyxhpIVA7lm3N9ifpJgNLm/Q1Kk75tCZewv5sqywbtmuhwZuLNbz9USddX+CMaIs6b2ZFyGwpeKt3fhBprJevt+4K1g5nD92bX/QA5EY4pJ+LaqRlelHwUw+XqwJsky/aZ+p8jL+i0ZjvhOeLRrL0jxhkOqBsX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S52CYQCo; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S52CYQCo"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664c6304683so3596300d50.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783398556; cv=none;
        d=google.com; s=arc-20260327;
        b=W0sE/bNIRKHvSsQOMecSB5N67ToV2H9yM+fdoly78DwxNCdfkuPVMUJny+tOViR9/5
         qpezG+O2vwcQnPS13LiRqyLvaa2MT0hdwAnzcNcirnw2zNNWbfWrD3tmfcgDMrNFqgPV
         N+xmVL66WoavGI3AGddn52DogFN6A223/4A2NHsdehS9LJVQNUtCM2JfQts3IAOZf+3l
         kt4IeztAOfXl5vq7lf3yMzW8E1KupvdlLTEAiMQdthZXr+DBsscW2nMvKAciTF+/wT9Q
         qoIaWiAwDHfopaBIVDkAFms3UqX0AdVWWMS95HMIKUBIKlAelV41zI3szES6v4Ik+mRB
         c+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1bHz8pIdj5qCHMVmE3ZgrvqBvuIVwQ8F/DhCqlx20Pk=;
        fh=77mV70v5Ddv0yfsU0C+TOhxucn7hz7DX/WKUp50x9Rk=;
        b=Xxt4cOaCweqlvvHX+Rgi7BtsvCUwG1Ern1z/mySZOoevEr6gWM1aMYq+aSBEIOr8hG
         kJcm6N0UwgV/FpRhgv+osPmI+TqnhZs5hS7odZbAcewrKXJcTK2jXioWgFCWFJQdgji4
         aSTInJsaYzm3DnIkUNOPjaeR+ZNOma4I07bhGzGe12zI73iAkbogrEq6nMEdPaOBi0qx
         MTgDHPK2wdbZr7KFAYdcvIRAZhjMbx8P1I3DFd0oLAihvObqyCM7RVCbniOWWeMCV0Pj
         GgBPn31J5u04OcSgx7os0ttLLgRIt9vH7bwmBJIigJlvGSWj3K9Qh2kILY3D0HNcMS3X
         Qz3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783398556; x=1784003356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1bHz8pIdj5qCHMVmE3ZgrvqBvuIVwQ8F/DhCqlx20Pk=;
        b=S52CYQCotEH8dw3N4wHAkEvIGgiFgLyj8Ojw0yloH6rv4EsRH1/NXDuhCfIZEpAiQC
         ZRYNEp+gcPgEJMfIdlVEIu9mqaDJk7q0OIhMYpdFIXVGCSlfBkfekpao1lwjYzmcipib
         J35lfe6nc1sAxtwhNAT9CNHR1/iO9PltWiY1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783398556; x=1784003356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bHz8pIdj5qCHMVmE3ZgrvqBvuIVwQ8F/DhCqlx20Pk=;
        b=dcP/KnWnZWA6Vlc9kQJukZH+2zrHs3ehG67hguruY8KbrvkNWSMNWfKvoy6ozENfCR
         4B/0k/+L3qVMy49uLMhFwu/CNPei5Gpj++0Ik8IrKPAIsH3WMVCs/y3dv7WqrWmq6jW1
         dYhdBYcBlHSUL0o5GqECItIGRjtmb5ZU1AlG5WgNi9GANan33vU7HxvGg2D0on+/tew4
         3NFjQymmfCEBuuiG6zjWnJv5livwOyq8VMNBdIj3kxoaCUGR0okyJX0P/wqXTaeoNFs6
         3cU2+XOPHWm9YbWLkvFaupw6avGj9l+GgnyaxXFY10EEKwZ+XgJ4+PGwIQHJ1SHkE5h+
         oY2g==
X-Forwarded-Encrypted: i=1; AHgh+RplVxmJUyBLbUcYMJvu7fjOcFifGsXc+zLs9YkX1dvRsAj4z0JeMpx53vA1OwK2lio7KBkMckTE174t@vger.kernel.org
X-Gm-Message-State: AOJu0YxD8BuP2NZavpxwFdOUvKXRY/QhAG4YVSBxUgVJy27X9WqUbviu
	IvUrJEtITIunJi8YeRFJokRYgDr3AvTrK7AjkkFsoZNrK9GUIdX3L2VPTn+368JusjIOZTG/bD3
	ToHc3/Z+C9vvKXhclTMel9+7ovsLXuXh9cOw3C6pR
X-Gm-Gg: AfdE7clpEQgvs05+p7F3YfL3RILKa2WIdKiTTFRklR9xKYcgIMmuNfzgN0LJ3FO21tY
	HV2ExjyFyrBXejfPPQH1vW67IzU5bEAPR8ukunsuTjskucNSzKTos/SX0OE05KPgg7AT5v+jiW3
	vhjsUedSlO1JTPh9HbbB1DE4HE+X/G13nT2cqDYDwDzsVo8AN/CmGneR4gvSgcusI6ygp1siA3V
	XJ/66QgGIZTPjtu3Eb9hkDIgVHU4dTiInqqktqf+lfVCI33enSh7+yvjtdJSiv/68NmsBWIBK3Q
	ZSXXyRFPJgKlPWoEHKEjDBSUV5eE4GNlr/jsKw==
X-Received: by 2002:a05:690e:4549:10b0:662:b6fc:ab84 with SMTP id
 956f58d0204a3-6677fa2ea7bmr2174279d50.17.1783398556262; Mon, 06 Jul 2026
 21:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-7-wenst@chromium.org>
 <ake09vk4fEv1D9QC@ashevche-desk.local> <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
 <ake6FNy83LLtCs3b@ashevche-desk.local> <CAGXv+5EgpizA3Pc8ScNuChPhvFKWd5F6dxB-wT4-7EwabE-9dQ@mail.gmail.com>
 <akvRMcGnUPxE3sxR@ashevche-desk.local>
In-Reply-To: <akvRMcGnUPxE3sxR@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Jul 2026 12:29:05 +0800
X-Gm-Features: AVVi8CeDQS-P0cN7_fGlNwSI_p7eUQN2BPzLo_iMICLRCJ8sboVGUDAVuWI9R6g
Message-ID: <CAGXv+5EqsDbzTg9eDMGK3Ph6Pe3_uDoSrjVL4q23cy6jZCk2tw@mail.gmail.com>
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

On Tue, Jul 7, 2026 at 12:01=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jul 06, 2026 at 07:08:07PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Jul 3, 2026 at 9:33=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Jul 03, 2026 at 09:17:16PM +0800, Chen-Yu Tsai wrote:
> > > > On Fri, Jul 3, 2026 at 9:11=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > > At a brief look this will be the only function that takes usb_por=
t
> > > > > instead of usb_hub in the entire hub.h (I don't count container_o=
f()
> > > > > as a function). With that being said I would rather see it to be =
moved
> > > > > to port.c altogether (yes, it's more invasive change, but looks m=
ore
> > > > > consistent).  I would even dare to move struct usb_port (and cont=
ainer_of()
> > > > > accompanied with that) and this function to port.h. This might re=
quire
> > > > > a separate patch, though.
> > > >
> > > > I agree with the reasoning, especially given the function name. How=
ever
> > > > I wonder if it would cause problems given the linking order. I'll g=
ive
> > > > it a try nevertheless and report back.
> > >
> > > Thanks!
> > >
> > > In case it won't fly (but I still think it's better to split), can yo=
u at least
> > > group usb_port APIs and struct? Means moving the proto closer to that=
 struct
> > > usb_port followed by container_of().
> >
> > Looks like it works out fine. port.o is linked in after hub.o, so movin=
g
> > the function from the latter to the former doesn't cause issues. One mi=
ght
> > even say that it is the correct thing to do.
>
> That's what I say! :-)
>
> > > > > Perhaps something like: 1) "move struct usb_port and associated A=
PIs to port.h";
> > > > > 2) "...this patch...".
> >
> > There are still some left in hub.c:
> >
> > static void usb_lock_port(struct usb_port *port_dev)
> > static void usb_unlock_port(struct usb_port *port_dev)

These are only used internally in hub.c as a wrapper for the port mutex.

> > static void port_over_current_notify(struct usb_port *port_dev)

This is only used by the hub's overcurrent event handler.

> > static void hub_usb3_port_prepare_disable(struct usb_hub *hub,
> >                                           struct usb_port *port_dev)
>
> This one takes hub as well.
>
> > These are used only in hub.c and moving them probably makes things
> > messier?
>
> Perhaps better naming to each (kinda moving to usb hub namespace)?
>
> > OOTH, the following bits are in port.c but declared in hub.h:
> >
> > int usb_hub_create_port_device(struct usb_hub *hub,
> >          int port1);
> > void usb_hub_remove_port_device(struct usb_hub *hub,
> >          int port1);
> >
> > Any preferences for these while we're reorganizing the code?
>
> These ones would be good to be in hub.c if there is no circular dependenc=
ies or
> alike.

Those two, along with all the static functions they call, ends up being
half of port.c. That doesn't help the size of hub.c, which is already
over 6000 lines. I think I'll leave this one as is.

Both this part and the remaining bits in hub.c I mentioned above are
outside the scope of this series. We can discuss whether they really
need to be moved or renamed.


Thanks
ChenYu
