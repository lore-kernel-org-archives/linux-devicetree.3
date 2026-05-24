Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529A725B0BE
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779610001; cv=pass; b=QXSbu5Wai8qcVRYzOEDo0haA07Y0a3clPfpLM/mJfxlrlxNDKYvR+UkwNMpYFycIRntDfILUBYbA6D4Ob/hL/q8FPMqr+pkrErG8YwQjX2vtrUd5SS/s3TuAWOHs4MFD2ph4m14zWva3gCwegJTPXMhWcsYJcyWnayfSiK63s2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779610001; c=relaxed/simple;
	bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1RPRzL3X0Z+0ped5VY5XQp5dogsTC1f2Z5Qh0WywRKcd/HBNrjU7VcAMdu8nc65dG9qUsTKGSWNpZAldp10mVogv7XvkRU3DX4sqtRF8ycarfwE2+nwwz/+2imk5RLuvTCP46tdlXum6HlATKXWtnb1Tc0V+opDbdZ9tDMNd+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HCF50kvM; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HCF50kvM"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso8815869e87.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 01:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779609997; cv=none;
        d=google.com; s=arc-20240605;
        b=IobH+XxcdgEM3FeLHKT57ePk+m0VrRKaxRDWzWgqVvUJNBcZL3g/T0yWqfY1RPW2tX
         8ZJZhOzIXeX2D6AV/ipeOjLwYko4al+eltImPw4Eg7yVwQRLH85Mbfp4641cBrPoobgx
         JQAIkF9k3FCwqMpEyaof0AnbpXpeWIOjRv/PqGzLEtK+oYEZYYSch8y5KGKpNevcM5Qk
         yHNTw+OYiOtFx9DhaTyVKdlPieb6Lqrvs+wurr724FrzdQO0z4BJ9OYyFEMb+oPF3yeB
         n63uku34xXkJh0XHALOXnatFa7Nb6fOqgLQGI4kk+s1KuMXel0rUa/zBzA+ZuFmMPhVU
         Cn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
        fh=3QCdyYR3DUHp3HByDTzV2wGwppe648ndQkVq8laLehw=;
        b=KgRwNoG4dY9saGNBOdZHAqISLnFZCfNmeWGgNc2/wBsbFsZDV8V2eBr6A23UdZ2+c0
         0Z9SR/kb3KHRbLgIFU8Fd40AnKMpmpqp3gPNAOslYdHdzriDzRBC8ODUrHYxvIE7Qay8
         1tvAv3advA4tKfyepvsRM47jdCFjiHXlOXpPU62TUcEgzP+McsKrkKMSogi3fNDYxOfy
         JaaUsgrXoKA2gcF2EzWKgNtl1ehgdNORsHpDAkJwLK8AmzKMdmud9yG7wTPHVyVgS53P
         /HUUqYTQzrxqaf51mgKxAvu8s9wOZm4d56pf6iLi5gK+DLkyAPGUeZgSYcwmoOi7G0vm
         W4uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779609997; x=1780214797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
        b=HCF50kvMwRvyV6XJTP+4HauBdJ+E3X9+mYqzAHDfbAVErJ0oknBtGt2eG9+goD9yJo
         3QOD0ZMjWkrylDZztf34rcgw76ey5KQqYQcq9l14e70LLH1fpEz/3gj8lcYbe4wymUo4
         8IiucWp7tXP28mCk+v49wdgh+yz/BFHIN6wIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779609997; x=1780214797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
        b=iKiAImbx5WC96auPkdWnvbK6JYpph7TBcunDqwNY+Hm52yvRZ4pSQ1L6OgWa8Th0Ro
         210nbtmrrST1ZxK32HEwiB+exYKntGRWRWVe/osoUPTCgLsCXkrRsUl4KdwtE07sVkX4
         30dHRRvotW2k9QQmkT7NnCU4cfEVEUGAeKkvke7nAabwvSfKY9aUeOO9j0EhgVD6FnQe
         7zth5R2Y4sQ0NwmvlKt2YwSoyt0rrw4i6kCQ+IWGH6dL1cwRrGM8+5+bjI/XYqqtPF/L
         B0/9l525/6wts+eazKN+iL7XJZ5tPgfxYcZaBZoSbu6O8ldFq9lmlziWtywKI7VtmTLm
         sZIQ==
X-Forwarded-Encrypted: i=1; AFNElJ80DHAuU18pKdVW6/U9E/Mfb8gZgeED2aqrWO8JvssJ7UpINXzIOtSp2Zk6LA/NuLxKmW+Qrc4gDq71@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Uq7oF9px0vgPHU4J7Wa5ks1S9Sr+XfCnvEWg15BuzMrYj2LR
	8tjRT2NKrCr92VcxKna5N75/bSt0RkBM7r8nJtUocWChCCWtxRjhYTK3V37urOGHU8OMHqyeab+
	BmBVjQ6VBcSd3TMYW9Jdy386CBZCJ32d6qTxOGKTS
X-Gm-Gg: Acq92OFFTlNCKmfTIviZQIgCWlIx461l9XhMnP4WBcTloNFFdm9zOftEuogxJoy+PzY
	98ZQuiSqOv2uN3nyObcymTPxoGOFYIdgPFe/9mwTGJ4Gp65FV73fsLj5ooFbWA9eqltIuVDC8fi
	Cr0DGtjxbCvgELC/R6ZREPOXoPFeY9agH0N0XgzzOFupaLIrrwhKj/vf4jz/Sz1Wmw4OaKdQdh7
	m1ZDyHWN1UCEeUBKVOr0bsf4QcdeZsH3rBbtxpoYcpCnzH6+o2TtQVy04fnEqEnVldQjbkNZIxr
	QIr1oyKHVUPu8jaR
X-Received: by 2002:a05:6512:1548:b0:5a4:52e:5933 with SMTP id
 2adb3069b0e04-5aa3235c913mr2060405e87.5.1779609997332; Sun, 24 May 2026
 01:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sun, 24 May 2026 11:06:26 +0300
X-Gm-Features: AVHnY4KQQKvEna3YmFG3JiRUMuMCSWWGPOX7GZHTMr-aA0Q2R8PaQnONHyygdDE
Message-ID: <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 7:01=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, May 15, 2026 at 11:02=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > Hi everyone,
> >
> > This series is my attempt at enabling power sequencing for USB to suppo=
rt
> > the USB connection on M.2 E-key slots. M.2 E-key was enabled in v7.1-rc=
1
> > with just PCIe and UART supported [1].
> >
> > Most of the series is based on next-20260508, while the DT changes also
> > depend on some other DT cleanup patches I sent [2][3].
> >
> >
> > Patch 1 reworks the power sequencing framework to allow matching agains=
t
> > different USB ports. The consumer API gains an "index" parameter (which
> > is the USB port number on the hub), while the provider API is reworked
> > to pass the index to the matching function of the providing driver.
> >
>
> Sigh... I would really prefer to avoid going in this direction. IMO
> it's not very clear what this index actually refers to in generic
> terms, given that pwrseq is flexible on purpose and there's no
> specific, well-defined DT property which could have an "index".
>
> > Patch 2 implements the index matching in the pcie-m2 driver. Matching
> > only happens when a valid (>=3D 0) index is given.
> >
> > Patch 3 reworks the power sequencing targets for the E-key connector in
> > the pcie-m2 driver to add targets for USB and SDIO. The former is used
> > later on in this series.
> >
> > Patch 4 reworks the USB hub driver to return the actual error code from
> > hub_configure() in hub_probe(). This is needed in the next patch to
> > correctly return -EPROBE_DEFER.
> >
> > Patch 5 lets the USB hub driver look for power sequencers for each port=
.
> > Currently this only works for M.2 E-key connections, but it could be
> > extended to cover other cases. It should also make port reset via turni=
ng
> > off the port VBUS work, even when VBUS is not directly controlled by th=
e
> > hub.
> >
> > I expect some discussion on this patch, because a) it adds some
> > OF-specific code into an otherwise generic (core) driver, and
> > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up powerin=
g
> > on the port twice, which negates the port reset part.
> >
>
> I understand that you do this because the port device has no OF node
> assigned. If we wanted to call pwrseq_get() for the port device, is
> there really no other way to associate it with the correct pwrseq
> provider?

I suppose we could tie the "port@X" node to the usb port device, but
AFAIK no other subsystem does this so we would be introducing a new
pattern.

In the M.2 pwrseq driver, we would have to match by port node instead
of its parent device node. We may end up with different behavior for
the USB target vs the other targets.

Also, the "port@X" nodes only exist for the OF graph connections to
connectors and/or muxes (this series doesn't deal with the latter).
For directly connected devices, there is a "device@X" child node
directly under the USB hub node. That node is what gets tied to the
the USB device.

> Does the child index in hub_configure() relate to the port index as
> defined by the unit address of the port DT node? I'm talking about the
> X in port@X?

Yes. The downstream port numbers start at 1. I believe 0 corresponds
to the upstream port.

> > Patch 6 reverts an incorrectly modeled OF graph connection for the
> > MediaTek XHCI controller.
> >
> > Patch 7 then adds a proper representation.
> >
> > Patches 8 through 12 enable the M.2 E-key slots (used for WiFi/BT) and
> > USB type-A connectors found on MediaTek-based Chromebooks. These are
> > provided in this series for reference. The USB type-A connector changes=
,
> > while not directly related, have overlapping context, and was easier to
> > include. They were also used to test some extra local changes I tried
> > to convert the USB A connector from an onboard USB device to a power
> > sequencing provider.
> >
> >
> > As this series changes existing power sequencing API, and also uses the
> > changed API in subsequent patches, I think the best way to merge this
> > is for Bartosz to take the power sequencing patches and provide an
> > immutable tag for Greg to merge and then merge the USB patches.
> >
> > The DT patches can go through the soc tree once all the driver and DT
> > binding changes are merged.
> >
> >
> > Thanks
> > ChenYu
> >
> > P.S. I'll be at Embedded Recipes if anyone wants to discuss details.
> >
>
> I'll be there too! Or should i say "here"? I live here after all. :) Let'=
s talk!

Sure!


Thanks
ChenYu
