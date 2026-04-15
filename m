Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66533A0E8E
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776241899; cv=pass; b=Zppi4xppA7rZCnXuwt+HQTSuNYB9SuxUTiUiZhPwZ36SPuvJ2wYCActqauLJRoPagfilNg7WcQm50rKVwxDb6HIC4wqBDDMGBX8EL/0VeP1yrrHbqX3bnpnCQiXX/bdcFDvLkzrQKudJ3YoaYQfFagMz+K9FnduQ/ysE1l8S1eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776241899; c=relaxed/simple;
	bh=2vto3FW353Zu82QYk26GNUwn95iDmVTER564VnZJYjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqteitC2bBL5adDgMcVv2WdOUzUDxmGAsZRjeGDWbDY2nqk5bpXrRsg6OcGdG0ndNoseXyx2oPrHKzBUXiBdE4tLuhlTce5PxFRKNr0EG161ToZzCYBGXjcoJMl1G8EEQR1MvFEjaVhUBQCG/dDBVcUfKkz4AP31Tu8r4FdhGss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K5UGAvvF; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K5UGAvvF"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3cc771c26so5188029e87.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 01:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776241896; cv=none;
        d=google.com; s=arc-20240605;
        b=VqqYqTDU/SQpi928CsjJVby/pm/GiJzwDSzfhHZa2Jo8bDuycb60JgD8hJ4V8Aukmo
         UIu6A/Sc/JLLdIMkGVq1+zReb/fsUov1aOs7qZ+dcHLCjn8BYF33iCKhTHrD4W26615d
         9enw+nMT9sol2yRdG2gl+DMm42eSlxsX2VOolGoLX0hM9km0ZjyYcsWD6vO6u2lamolu
         H+nZVGl8s5qb3dsl7aYc3wanantyoZ/fQbPuAfm4ux/7IqDzQFY2rv00auz3PAcOnAzd
         //RABdEAnJXwsmIJacK2ElzQr7k8YQT+y+TJwYOnoWqSrdQpX+H+rjIXNhn4acukKTBa
         HtNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75qqfi9qSpcNd5UITToYiihcYMMpTHFOID21ZWu5+AE=;
        fh=LUQlKaeCH1tV3M3JvO1sEFIc3CJHad9cXheGvwRQALM=;
        b=IPWipObqsjJ2W0TDEqvvbG4wpF8AmkgCqSDzA7ZpPZCgK1q72xoDob8bra8s913Qfv
         A0GenG0yVfemz1lT1UoAD8/SZo0OB2Z9ZxJVD1CJBeSGxUSfCikXL7IB6lR5U4taTBHi
         3uGD0e4InnnC8IkWGwh4+63rIWQ9krWR5m3k6SgkZjsU0AZFmzQa6IpCMb3nlQMXLSue
         vBbD9rEjtJnFrrEXQP0a9RsPDnx5FY4dUCgvfkbWACjWpONtXKkYp9zttrAh61iAbYJS
         l12wwXr01HLzYHeQ8iz2e0OfNTzvXb+IcKMBHZdtLdnAIXfYjzN8kjUVCTOEwtQYlSut
         k9iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776241896; x=1776846696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75qqfi9qSpcNd5UITToYiihcYMMpTHFOID21ZWu5+AE=;
        b=K5UGAvvFYCw1lKIySpdxs+2VhQlu1DNfkQnTJo6uJshdmSwQBoqYPkYm885x67rk5A
         Sj0gGABTH/LttyV0M6yVENkD0MxhWEPS0tm4ubGvXt0SFTGMEnMnxewpxBPr/X9Kr5Cd
         qAZ5aXEbrM+4DvQYOBBKj/rlzLSiDmcR7mKsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776241896; x=1776846696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75qqfi9qSpcNd5UITToYiihcYMMpTHFOID21ZWu5+AE=;
        b=Ihgtsm7xpiyb6N/XP5NKIK9S/lgix5Bg8yz4nqW2EcKdg81RjiMs72zq2y4cQ9/SYF
         bjXp39R2N5IbQ2xgMmVqALdkkqBcEjPL4yBemOm85BFbX3t0KmP1bLPCoCZyv8xGL/Ta
         wfO86PRjSbdqRG3Jsc+m7i80S9aEo6MYOXuKu7utUT0PIKt88JgLkdZFnhj+FYGDdryb
         +uZupfFpX9eh5swkMRbv5zwLeWnvSax8358sp4AWQupROAdMJIwmZMV6Ydo68Fd6oTx5
         DfwH2aXhkA2mPQkHbTFhjB2b2EQYL+xDaReJObcry49VUQCi42g0fX7XttzbLwntnpJe
         SlJA==
X-Forwarded-Encrypted: i=1; AFNElJ+a2IVNpbcA7DlMUyumtUWTxPE9ySug7e/66lC+nr5H1cXnHijMrgUxuEF52XNarc13edfP9B8lOz5H@vger.kernel.org
X-Gm-Message-State: AOJu0YwSZp5IFdWik7IpiRUT14d5iUlaFuZhNACcC0Xb6MwE0laxKrQt
	zrQMwqFPW+wrVzOOQyinci6xmDisfHwDMlsz5l1CrL+HlzF6h/o9BhVc7qwGSRnSiY35kHvU5DJ
	PgO6TTt3v66GbtOq4HUhATDrQnjmyFZXMKtLwihn/
X-Gm-Gg: AeBDiesECte24put1M5jrEZt7e941sjeUaqnvL9KAhBUXPC5YaKGapY/mZd9zHCy15D
	wOYNH/V1H1r2BApN8mjDwu7k7c+RpqdbNPUNUlvVcS2LgD6tYUzx3PruycUe+1kbENQcWVjF+VA
	BtTMh5c4pM4xFl+7u+k5o9GfktjbXj/KKyDSQz+5rN/+2ylzlsqbebF/5a+ieY3hKxDYQdgRrm8
	i2OMo/v1Mb9UXUwOQnDGed5/uS5GHeQp5pIl2HkLxslxNhxFqgHzkFRXjLoLGYnxRIapqfFJ3F5
	cCXjEdiBIC2wejbrkDnMawdKT+2l0uw8BsDTtWlGn3ZDySD9
X-Received: by 2002:a05:6512:3e26:b0:5a2:a174:8958 with SMTP id
 2adb3069b0e04-5a3efb4968emr7410769e87.35.1776241895968; Wed, 15 Apr 2026
 01:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
 <20260413075459.GA2626902@google.com> <fpcs4p62f35a5qyqwgm5ysa73stbysxcr62tkmmkrrcvsuf4t4@4ivukyqjey57>
 <eeytuhqpgdz4do4tgtbmfntub2femtyq7bij7svhodpyjwaylx@j3gmvq2a2zqc>
 <CAGXv+5E=tujhtZjwi6Qm7hk3Ks74UzTQHWq82NiTEw1+vYod5g@mail.gmail.com>
 <ad36pIu-0dutL7Nk@ashevche-desk.local> <CAGXv+5EGe59nJctLweEdZjb3MNmMvjuCHngGSfptzN985OiLdg@mail.gmail.com>
 <ad4tJN27opdEooA7@ashevche-desk.local>
In-Reply-To: <ad4tJN27opdEooA7@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 15 Apr 2026 16:31:24 +0800
X-Gm-Features: AQROBzDzEraU5iaeBZSJUdxidhUdHObcnpB5nGLDAzHMGlTf0-gnuExg99lbWBI
Message-ID: <CAGXv+5EPA29G-fsH=wWOD8AK6TZFezFhsE0NHPYj_Pt3nT+d_w@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E connectors
 in devicetree
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 8:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 14, 2026 at 06:29:02PM +0800, Chen-Yu Tsai wrote:
> > On Tue, Apr 14, 2026 at 4:28=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Apr 14, 2026 at 01:03:19PM +0800, Chen-Yu Tsai wrote:
> > > > On Tue, Apr 14, 2026 at 12:08=E2=80=AFAM Manivannan Sadhasivam <man=
i@kernel.org> wrote:
> > > > > On Mon, Apr 13, 2026 at 07:33:12PM +0530, Manivannan Sadhasivam w=
rote:
> > > > > > On Mon, Apr 13, 2026 at 03:54:59PM +0800, Chen-Yu Tsai wrote:
> > > > > > > On Thu, Mar 26, 2026 at 01:36:28PM +0530, Manivannan Sadhasiv=
am wrote:
>
> ...
>
> > > > > > > - Given that this connector actually represents two devices, =
how do I
> > > > > > >   say I want the BT part to be a wakeup source, but not the W=
iFi part?
> > > > > > >   Does wakeup-source even work at this point?
> > > > > >
> > > > > > You can't use the DT property since the devices are not describ=
ed in DT
> > > > > > statically. But you can still use the per-device 'wakeup' sysfs=
 knob to enable
> > > > > > wakeup.
> > > >
> > > > I see. I think not being able to specify generic properties for the=
 devices
> > > > on the connector is going to be a bit problematic.
> > >
> > > This is nature of the open-connectors, especially on the busses that =
are
> > > hotpluggable, like PCIe. We never know what is connected there _ahead=
_.
> >
> > I believe what you mean by "hotpluggable" is "user replaceable".
>
> From the OS perspective it's the same. From platform perspective
> there is a difference, granted.

Yes. I just wanted to clarify.

> > > In other words you can't describe in DT something that may not exist.
> >
> > But this is actually doable with the PCIe slot representation. The
> > properties are put in the device node for the slot. If no card is
> > actually inserted in the slot, then no device is created, and the
> > device node is left as not associated with anything.
>
> But you need to list all devices in the world if you want to support this

Why would I need to? The PCIe slot representation just describes a
PCIe bridge. Granted this might not be entirely correct, but it's
what we currently have.

And even then, there are properties like memory-region or wakeup-source
that are generic and aren't tied to specific devices.

> somehow. Yes, probably many of them (or majority) will be enumerated as i=
s,
> but some may need an assistance via (dynamic) properties or similar mecha=
nisms.

Even if we wanted to add dynamic properties, there is currently no proper
device node to attach them to.

> > It's just that for this new M.2 E-key connector, there aren't separate
> > nodes for each interface. And the system doesn't associate the device
> > node with the device, because it's no longer a child node of the
> > controller or hierarchy, but connected over the OF graph.
> >
> > Moving over to the E-key connector representation seems like one step
> > forward and one step backward in descriptive ability. We gain proper
> > power sequencing, but lose generic properties.
>
> The "key" is property of the connector. Hence if you have an idea what ca=
n be
> common for ALL "key":s, that's probably can be abstracted. Note, I'm not
> familiar with the connector framework in the Linux kernel, perhaps it's a=
lready
> that kind of abstraction.

I'm not arguing for a even more generic "M.2" connector. The "key" is
already described in the compatible. I'm saying we should have some way
of describing the individual interfaces (PCIe, SDIO, USB, UART, I2S, I2C)
on the connector so further nodes or properties can be attached to them,
either with overlays or dynamically within the kernel. Right now the
are only described as individual ports, but we can't actually tie a
device to a OF graph port.

But maybe I'm overthinking the representation part. AFAICT for Qualcomm's
UART-based BT bit part, Mani just had the driver create a device node
under the UART (by traversing the OF graph to find the UART). If that's
the desired way then the connector binding should mention it. And that
works for me. But I think it's messier and also we're missing an
opportunity to make the M.2 connector a standardized attachment point
for overlays.

Mani, could you also chime in a bit on what you envisioned?

(Added Luca from Bootlin to CC, as I think there are parallels to the
 "Hotplug of Non-discoverable Hardware" work)


Thanks
ChenYu


> > The latter part is solvable, but we likely need child nodes under the
> > connector for the different interfaces. Properties that make sense for
> > one type might not make sense for another.
> >
> > P.S. We could also just add child device nodes under the controller to
> > put the generic properties, but that's splitting the description into
> > multiple parts. Let's not go there if at all possible.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
