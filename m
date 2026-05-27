Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029EA428464
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898877; cv=pass; b=uP6vcmF5Gs7GjItDom192DR+O7mMHMfKXUJKVQt80+HdZTOkDhPiAFev6YxvVjMvTP28yraAfAjyomzxgTSZfkAN/MXbNE/FhpVUhQHyd6mAG/WrnrtZ8S4pm85aLjSpPSRQ5rZi1QrpS7hdzQi3FQvn+8FasP08E3JUUiwM/6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898877; c=relaxed/simple;
	bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIkj7rh55lPT4+B0lLWZClJmlaibiw++uCqca0/VjaystU62fOEHXkTNMZPzIJ+TSM40oszEqXxc2lVPoOODIugmx8Dbtgo+ihChwB+/ENANcjKTA/KwKpQ5lZuPPL1uF9IhaNNXd0Kd/YUVIUGO+/vV47nG73A0/a+wS5fCQxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MtsCw/0k; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MtsCw/0k"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a858881ad2so14787772e87.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779898874; cv=none;
        d=google.com; s=arc-20240605;
        b=V6VRRYwXkRCWqZBMJUQyyVC33SyTzIDrS/nTLr3mNAVV5I+0oE/tJa9qHQn8FvhCX7
         /4xLXswtK1GLhLKW4bYAEoKXI7dry+9gX8/MddVv4R026afnUzfTswOld7tUggsr26gx
         36jWMG00Z8FkKKiFByYZ2X8jVTk+BXVae/NPqG+MjwuiFIeO1FHC3a6oLNaxULaZRszC
         rDha5jr0gCIdu4TQWO1tTH5IRwiS2DGH5tD2RRRJJOOlACaz0v/DEhNsLwvUryqQa4p8
         yYo+/JwrhmLsssfOvxnasORq+GNyuLLmbdkfWrqop2soTtBfpuc85ZtkAlzr9W4hrvv2
         RD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
        fh=66NMNZxvox/4gBSVdvTtZvCny0FlN2r/PWnaQOYcah0=;
        b=EVJGD5gbHR/j3lKyXfFARBzX721xRC1uDcG2LSUkSr2sSixy37HNRP9RQaHZdYPL6H
         YqNUnTWdELIE787MjtHvNwjNL5J0Zqam4CEpBRRZJ0EwCnceLmvUR6QTE7YD1cvM5Ogd
         xMupmGi/42ZoeZ0t6tuYR+XlFvsT74uv6QDLp7MoUltC4DDo7JHvIRLi9n5Hsvb2SmAX
         zpTtfqYhsx16+z3U/CUOEw+CDyo8SsLRphFRTJ0tKK6eVKOXRmWOSkoDqHN/uqjy6jFi
         PI0FuB71U4EVJ8vAgTKLG1BMiffHYvK3pbAJ0P5TRY1vlj8cTq+71xMMjQAU++TuluYG
         uG0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779898874; x=1780503674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
        b=MtsCw/0k4OTSh4B9Pxdh8daiLEm1A4poAtaF365+vNmdjmNuioPQE6g8HcgmwrknBF
         f1Q3Jm83/Zr6u9mhgKmWMxNGSPRXmiv1g6vEKggOtJJgd2yttYR/1v+gVAIoNokSeBof
         G5Lj2vyr9uNlDENkRHcJphLP7MfjDoFs3NgvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898874; x=1780503674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
        b=R8qT0A1EXVE+8U4GCLjkaGJ0hySlbysYYpYObWZkTLbsamylIf0ysCnjGndSh7Teab
         l0vlK9ATCl+ltC/ehBSBvIZqQqcT5k9xzg8dx75nlOzPjz7DvMn9g5uHWCuM3nRkXsVm
         e5xraDhJHDgvnZEdPXABb1rfWFZW/0Q6oNGXyRow/Mrcr30XVCCm/xthvwxjGdT/BWSR
         BL2+13xi4S/YZp720jq4GpZHG2WRD6ql6vpWgKjtNN5itTRPrA2CXxTOo5CZ8kJlnNtz
         0A61wak1WKUYXRSApnWKTIKNC44dlwwFE4LDaTeEuR+egZM2LaPahJGfE2J9rmvG+IE7
         a6ow==
X-Forwarded-Encrypted: i=1; AFNElJ9+qZngXwODizXBh99crzu09Tr4zKQJ4i4Z/ydClW6KZNKS9bXr+GrHooP73UU7uJjtiOThsE/MfFOj@vger.kernel.org
X-Gm-Message-State: AOJu0YwqyqnFp3Zzjvtg3D6hkpbn+W2JU8CCFvAhV5UW3eQWtuw74oTT
	2fQqRp0bKE2eJLL21Koyzfj8HFPbYPIa9sv7mnii7yqXDT93fHPhkDNGOwsTu8CNsobvp+lxLh1
	695RlptwzPiFGHWccEjaQDYEGBVYY5ZX49xvTOTYIVT4oHnqqsh79+w==
X-Gm-Gg: Acq92OGVjtgwE/Cqlqjvp8MXj1BrQrrlbfTi+yQ55nhBqP8sQust/iYHvw0qhOXgMpo
	90c9AzDHrCVCLCxFDqZpHUHhl/42U/utnDxE+4Fkk2+kyuJq5mojOrpMAslp251hJllyCAaVFO3
	794X620LE9BhkRftbizMiMu88vJ29dFJ00NtWTJbomGi017IcMDdIEOZwl2HbwR2Uau42hQgZq6
	ns+nBHHVuJNcFZUKnxg9LWCuB+C/Sk42ziAqiihyYtb0Ntb2dniLnaYlAsI2bzq5dEoAOMzBTMj
	eWv56CYuE6g8mUF4OA==
X-Received: by 2002:a05:6512:2204:b0:5aa:b6a:9257 with SMTP id
 2adb3069b0e04-5aa32393ff6mr7614476e87.44.1779898874134; Wed, 27 May 2026
 09:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com> <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
In-Reply-To: <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 27 May 2026 18:21:00 +0200
X-Gm-Features: AVHnY4LzsI5n_9iqirzC_of7SGIfiJw_kQ6vIsCvh5Qe5puVB03Deb7QvAn9uiw
Message-ID: <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 11:48=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Sun, May 24, 2026 at 10:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > > >
> > > > I expect some discussion on this patch, because a) it adds some
> > > > OF-specific code into an otherwise generic (core) driver, and
> > > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up pow=
ering
> > > > on the port twice, which negates the port reset part.
> > > >
> > >
> > > I understand that you do this because the port device has no OF node
> > > assigned. If we wanted to call pwrseq_get() for the port device, is
> > > there really no other way to associate it with the correct pwrseq
> > > provider?
> >
> > I suppose we could tie the "port@X" node to the usb port device, but
> > AFAIK no other subsystem does this so we would be introducing a new
> > pattern.
> >
> > In the M.2 pwrseq driver, we would have to match by port node instead
> > of its parent device node. We may end up with different behavior for
> > the USB target vs the other targets.
> >
>
> I imagine, we can check the bus type of the parent device to know if
> this is USB?

The "bus type" type is probably not exported. However since the DT binding
explicitly says which port on the M.2 slot is for which connection type,
I think the matching can do a special case check for the USB port.
The next obstacle is that the target string is not given to the provider
match function.

> > Also, the "port@X" nodes only exist for the OF graph connections to
> > connectors and/or muxes (this series doesn't deal with the latter).
> > For directly connected devices, there is a "device@X" child node
> > directly under the USB hub node. That node is what gets tied to the
> > the USB device.
> >
>
> Is this a problem? I don't think I understand what you're saying here.

It shouldn't be. I'm just saying there would be different behavior on
the USB side for connectors vs onboard devices (like hubs) device nodes.

I talked to Greg earlier, and he said not to touch the hub driver; the
hub driver should only deal with features from the USB spec. The
"onboard USB devices" driver is what should be used. And this would
be a proper case of adding an auxiliary device to the M.2 slot driver.

However this seems to completely decouple the power sequencing from the
USB core. Take the USB A connector for example, it was recently added to
the onboard USB devices driver. However the connector has a device node
that is not a child node of any USB host controller or hub; it is connected
through OF graph. At the same time, since it typically sits at the top
level of the device tree, a platform device is directly created and the
driver subsequently binds to that device. This is totally different from
how the hub and other directly connected onboard USB devices work. In
the onboard device case, the device node is a child node of the USB hub
or controller, and the corresponding platform device only gets created
when the USB hub driver probes, thereby sort of tying it into the USB
device topology.

If the power sequencing ends up not connected to the USB subsystem, then
maybe the M.2 slot driver could just check if the USB port (port@3) was
used, and just enable the USB / BT pwrseq target at probe time? That
would mean less changes needed.


Thanks
ChenYu
