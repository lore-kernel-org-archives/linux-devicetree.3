Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F323B2FF6
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 21:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779917057; cv=pass; b=oCEXa3T9WASKr1RIzWbPDZW9v6VCryldONyoqIcD+uih7+gu0PB3BXu2oJto69PkvMQYYRKx1Vi2mFxQOp1ErFPwA/0kVbpbUASuXRZNeqEDJGlwe5IC89GIKW6vBDTuGR+PIDhGzw79e7gYWRRag9RF9sZiJZnVS4HvElu0SKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779917057; c=relaxed/simple;
	bh=c5Jc2Curx+hrKXgScOBcK42cc4R5Gw14VE5X6Khiqxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjshTGes2K6zv1/V4/41h9MpCaSS28Af+Ji+JXkIlAbQeGK5XQ0ahwrLbVgSuajFPFIsmISoPn++VAV6I4mz9GBjHEA58kPrbNau0NJbfUpUI2RJrqLztC/rgj3EYLt76IsB8EN0yTzgRj8GsXsqnZ8SHHgJo8zH+vhaU9a1H6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NSPlKI7b; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NSPlKI7b"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a8cb92f26aso13145408e87.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 14:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779917054; cv=none;
        d=google.com; s=arc-20240605;
        b=LQ509KC2+ZoT3RYMoNl2rx75tJXMKWnEj81jZqeI3mtgcl7K8B5gfnz/vYTXrTD+Jb
         ao9913ZtX+3SbLXsL3kJN44wbXdUAiHuf6tCdaz2HQmMn7gQRAjJKWB/tRy9luErXyaN
         bnKleULlIhycqzJ0rdZHs9Uitf+a1HJ/0pMgihXyDl1DNXVJViV8V0T0VW1Pdz68l2C3
         iraH7OZcCwbLLuHnQN7b3KBd2/Q9IPyifYoXMxmeUjL9xvHaLULOhVbfqmLF5p8IT+MB
         Zp0yjtBrjme9A4Enpw4curGXRCwAPsGC1aOZ8/nuutfdO+l3sTSfHoZywNji7TXPkOxy
         WNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UNa7dgr+T6R1ukhKHHLy6CJqrOmDsV/gnRDcoFC7IoM=;
        fh=fZr3EFQx3jidSBSFXUHejONf6y1L+5oLArA977owO8w=;
        b=PoPJnT6mo4e3KASDJc8lU+Dq2YfEPxKkagi7msfs4IRr5Mzp1VtrQYxPnc2prB/4kh
         nv0S5Rntna2lCK0RQjj0zOc4DYMtx0QSjBOrY7tXdARVGEXy2uYuFxINcX85v71GcVri
         OB/4XP6D1WWkJ9KSez9W73Ar+jPVllBO58j3qtSYO1gdxKWUjtCDZRFNHkDLhugm8kSd
         zYWTC+PX7Aa2Sys1g+Kg8E9RNmk+JGCTwinV6iXEU9BUG6xpyfiqIa+5c4+c2eKPmvgQ
         7oDlHjTxXCXu2ZUIyaA5LcEw/S/qNgbvvVmA5X0+3QRvbOav6PVqikSes7j6FtfupsUg
         LqOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779917054; x=1780521854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNa7dgr+T6R1ukhKHHLy6CJqrOmDsV/gnRDcoFC7IoM=;
        b=NSPlKI7bCiybkA7NZQEXKfT95r2jQgQlFICBKaVjauyaCL2d72SRvEqwJc6AQcWHp0
         22pKsGgJ670pGIG4quBx3lRUCM5iiyPiADKLIKuuGjaZ0FElq/m1ZPaIU+D0hSR0VEAK
         p5fhex9bnEjkKf6QVnebXorrqnwOpyErVmGkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779917054; x=1780521854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNa7dgr+T6R1ukhKHHLy6CJqrOmDsV/gnRDcoFC7IoM=;
        b=pTdyqTE0FrNJZhLKlDrgAvaieiNoDNDbleubW4YMnXc/o72dZ1TXAeOiXaAziqZTp4
         qC6WjwdM8PwLns78VSLdkP5SEMuVmWFPV1zsE7NfCGUztjsLw+H4ytuaEVkhvkEMyuF+
         UlEtUhTlYtEovZtUISTKu4WmY8jUkz193NI7tiGiFenCb/HtnMM2QGc4cfeucDcP4t2J
         IaFS8ZXafZ2KGFWjmoKxECuyAp/qAbqu3k/+qnU2zNsAEURrl8cQouZNhhiWdfVt8Zzi
         J5FEiKdxTups0lTcqTw/RxYdYltTGmvsAuXipTq+OTtRnTKrtnd9P2JBgiIhkyp/uiIl
         /SiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9L8ObxdejWS2BYUS2PBvISq2A8MCiBMq5zeFR1CFeP/2sf10sWAVuqmsnp+jRw/J13uJu24QZgRr16@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo8q1Q+yAb20SKZWh7wtAOHinYeKQu4gtKw63lLgK1q0WMk2sp
	Dj6fMR7BELTS5MDqESUkgY/PySQFh07noyZ62wZSTgEPc0dF6TABGz1NAuGThMKvg9d5q5tTHKZ
	P4Qmr/CPsb27Q8RU2zpEvysW4rx42MJsN5iua539w
X-Gm-Gg: Acq92OFveGNzMBDs0VmYpoBV59PzgU53etVtwO37SM5+8qCSbgMAaBUQ2BBXNaKiAF6
	dSJPXIiMqsudnJdEYtCNyvF7wog/oT4LtvoBzfbGvY/uglFJWOBvfnoOGPa3Fge9MY17CTkHjQo
	U5D4sIY4k+UVu4Hes4OUI9qR56TEvikqNbHbHKy64+CJ8CwSDeyUqmKBgV9B7aQbpu5uoEIbv0J
	TZhRguuQx4vpplqjC+wlcg8M7DPJhph+d7L1kqLVjHdzU6w+r/l0lAuvcDb8B5rvPLRbhqKSsB6
	y/iZYpiMPWMW7UusxA==
X-Received: by 2002:ac2:4c50:0:b0:5a8:65ce:e83b with SMTP id
 2adb3069b0e04-5aa3238bcc6mr8479844e87.7.1779917054041; Wed, 27 May 2026
 14:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com> <2026052710-flagship-unsmooth-ce82@gregkh>
In-Reply-To: <2026052710-flagship-unsmooth-ce82@gregkh>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 27 May 2026 23:24:02 +0200
X-Gm-Features: AVHnY4LeDHWwGMjgnhSmei9PL68DdRKYxFo5lLp-irYNZJy9WYHdf0RaNUwFV18
Message-ID: <CAGXv+5HdrKjFe=jZFYQzanmHOgCNOXRydLCvsM6o=DGhoO1HBA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 7:42=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 27, 2026 at 06:21:00PM +0200, Chen-Yu Tsai wrote:
> > On Tue, May 26, 2026 at 11:48=E2=80=AFAM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> > >
> > > On Sun, May 24, 2026 at 10:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium=
.org> wrote:
> > > >
> > > > > >
> > > > > > I expect some discussion on this patch, because a) it adds some
> > > > > > OF-specific code into an otherwise generic (core) driver, and
> > > > > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up=
 powering
> > > > > > on the port twice, which negates the port reset part.
> > > > > >
> > > > >
> > > > > I understand that you do this because the port device has no OF n=
ode
> > > > > assigned. If we wanted to call pwrseq_get() for the port device, =
is
> > > > > there really no other way to associate it with the correct pwrseq
> > > > > provider?
> > > >
> > > > I suppose we could tie the "port@X" node to the usb port device, bu=
t
> > > > AFAIK no other subsystem does this so we would be introducing a new
> > > > pattern.
> > > >
> > > > In the M.2 pwrseq driver, we would have to match by port node inste=
ad
> > > > of its parent device node. We may end up with different behavior fo=
r
> > > > the USB target vs the other targets.
> > > >
> > >
> > > I imagine, we can check the bus type of the parent device to know if
> > > this is USB?
> >
> > The "bus type" type is probably not exported. However since the DT bind=
ing
> > explicitly says which port on the M.2 slot is for which connection type=
,
> > I think the matching can do a special case check for the USB port.
> > The next obstacle is that the target string is not given to the provide=
r
> > match function.
> >
> > > > Also, the "port@X" nodes only exist for the OF graph connections to
> > > > connectors and/or muxes (this series doesn't deal with the latter).
> > > > For directly connected devices, there is a "device@X" child node
> > > > directly under the USB hub node. That node is what gets tied to the
> > > > the USB device.
> > > >
> > >
> > > Is this a problem? I don't think I understand what you're saying here=
.
> >
> > It shouldn't be. I'm just saying there would be different behavior on
> > the USB side for connectors vs onboard devices (like hubs) device nodes=
.
> >
> > I talked to Greg earlier, and he said not to touch the hub driver; the
> > hub driver should only deal with features from the USB spec. The
> > "onboard USB devices" driver is what should be used. And this would
> > be a proper case of adding an auxiliary device to the M.2 slot driver.
> >
> > However this seems to completely decouple the power sequencing from the
> > USB core. Take the USB A connector for example, it was recently added t=
o
> > the onboard USB devices driver. However the connector has a device node
> > that is not a child node of any USB host controller or hub; it is conne=
cted
> > through OF graph. At the same time, since it typically sits at the top
> > level of the device tree, a platform device is directly created and the
> > driver subsequently binds to that device. This is totally different fro=
m
> > how the hub and other directly connected onboard USB devices work. In
> > the onboard device case, the device node is a child node of the USB hub
> > or controller, and the corresponding platform device only gets created
> > when the USB hub driver probes, thereby sort of tying it into the USB
> > device topology.
>
> Hm, did we mess this up?  If so, we can always change it if you think
> this should be done differently.
>
> Hubs should be dealing with the power issues for their ports, so maybe
> rethinking this might be wise.  I'm just loath to add hardware-specific
> hacks to the hub common code for obvious reasons.  Anything we can do to
> pull it out to a separate driver is best so it doesn't affect the 99% of
> the users that don't have that crazy hardware :)

I understand. The way I have it in this series is that besides having
the port powered up initially, usb_hub_set_port_power() port power
control also extends to the pwrseq target for the M.2 slot or USB A
connector, just like if VBUS was controlled by the hub itself.

M.2 slots might be somewhat rarer, but I think many embedded devices
have USB A ports with VBUS that are controlled via GPIO, not wired
to the USB hub's (if any) port VBUS control pin. This is also present
on Chromebooks.

I think wiring up pwrseq to the USB port and using it for VBUS control
on these USB A ports is an improvement over the recent addition of USB
A connectors to the onboard device driver, which just turns on VBUS.
It would make the power cycle loop in hub_port_connect() actually work
on these devices.

Is it code for stuff outside of the hub itself? Yes. Is it crazy hardware?
Maybe not.


Thanks
ChenYu
