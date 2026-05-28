Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE79379989
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957607; cv=pass; b=ZlrKydXv8PowTmRrt+ByYO3gm8QARyHrCu2TjQaPMNltyQnKalqieRJGadDlYKSU+UhWo+j7kajJ+9lcWNYb5Py2+BpnkCQlWT9D7FevnXG0wKkcdPjxIRYBe4ZQxj9VMUjyC6eL3dB9mZKHRTykgShgPeu7KinH98llqc1mWI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957607; c=relaxed/simple;
	bh=bMVYCHW2rA/kKGjqYMY6NUZrWJ1hytGHa1uCrkcH62k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZA3YbBb6i3xttIKNWa7hvbNfrfSjm4bfv6LvMg+KG6PFbym1BbBEjH+I+uyld6kTeO+lErv5RjVWuXfaekDxpCxoNVvTCiuNBG89cdKD5wmkUR9gFTkEd8MEaAiz84elQg1SSbOP81vd69c0KlbIxP0jFSleTPflkX8mFj9E9XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cXGfUXPo; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cXGfUXPo"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a4113ab355so7623604e87.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 01:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779957604; cv=none;
        d=google.com; s=arc-20240605;
        b=LEYS0rkqC2jqWP5hl0HFI11bYPVsTXUq/X7QBYgj+xbuYNzwPo/LwdXwPuIi8+eEj6
         NIzl7B0ec1lNCxsiVk2hcePIrnHPFDlqbfMr/nBiwzE2i3Bo2a86fscWrjIO6jiw+ar3
         sAQgU+6YVPPEeljg9OtlRlPpYxdeBQgojmj+/DN+vfpdZVHHJrBsKc5tnA3MfG5RPDmR
         lq0LTIbM0XFd0wTqqhKeTc1N0OIUNU+jR9ctKSbrds8NLYfrQFf0sq6AvmBGuhhZfquT
         2hqy/J2HCo9QkBDyNS0isvI7PzcbkMKnalw3xmhw4sXiCH4xjdigROaXn2a97sqzey8e
         skBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=;
        fh=dy2pB7Cj9yZh0DUilHtTuLw3bRaV7fTD0ivRmb7HzjA=;
        b=U/EjKArGwW6I39AYKcYqjhMgN8gM4nXgs3APTHBQhg+dkYNoKFPTw4fmTfnoSe4Dqn
         um7bGR3Dzmvy2Tj0FOCh+7aktQJ+oOajNXt7UTxhR7mJjytpM+yCynXrxNkkWut+Cevj
         jVhjtGq2JCThIFc0ABXzuC/AB8kcuYH4LItQN0xLVJ9/x57OVwkAuh1TCvbF9keiubwy
         oyVdYZcFuxdiFadqIOpsQEHsB4CosFpp4rnqrjexv6EUCF+o6gde7DDcbs2+7ExeJ1Le
         q9Dwen0sXLTqBqw5lut9gnYI/TJg2Od3EZwH5VGuXHqK+WXbZ2q+wO1c6RXyMGVMh4sN
         B6lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779957604; x=1780562404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=;
        b=cXGfUXPor2b1Nakp3P0r8YwatpnWa5ja4K3M7lsC9HsERO15z7WxUBx5Tl63C3srvd
         8HUB3N66ZWmcqB/PENV3t4Oq/7gXoxnmeh5XuomDFMRcaBf8A7qUCuISyS2w3VmIidCS
         9tB9VkPhpYvwAyC6eS40t+Cz6X0BEaNsYSqOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779957604; x=1780562404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I3ozGp08XBKPc3Oc1CPTjccxZqkmofz+VaCJR4hZhDE=;
        b=sIc2ltvVfiveoBFo4Vb0PO5oOkjVvzFAzYfGImj5C17HYvoTs3gTnLleAjW/6YWEer
         J2Q35v0dZ0wAcvJa/wPMatoMvlRpTe0G1leG9w985ibtKcQ5CZLQxDym91Ojee4HCTEI
         Btiwj7kTSFS9rrU10csfAEhHY4qmkWTcbW7WjvXD+f4X+ajWrSOGHpHM2VEpdeURLEqq
         mnrdfOYsJv6ZmBiBmEnGvvFr/AAiWwJAH9KFxqqJsfP1F/hrsIFjmACd3ilpSjF3GCn1
         hDPXw1k4ohzcHlbq6rIQswdds3kz1LcUVpG5RDB39pp4164sOhEBbIB8NXtQMD2xaQMN
         3cyg==
X-Forwarded-Encrypted: i=1; AFNElJ+yYzQBq/bG08WkisvDInfTbHCf9uhCOUyPrTAIlkOz7OeheopkGAFnxdwwtzsgVo0bizRR8WjZ73XG@vger.kernel.org
X-Gm-Message-State: AOJu0YxR3tynFHEGprCaQ453HGjRHG3lAp3HU2ucOxN/zacIfKK/TFlp
	olXigyAbL0XJ+3YFWV/0OUQxhRUPESxzTImVRbWphtHwW6wyI7qGMvnRYUDaeDgJXJcooNJ/T/r
	0A9V90Kyg17VEnZWUZ6hLJom0lhMsHwhUcROGkA88
X-Gm-Gg: Acq92OG4O4npUNFFS4j3Rh/vgnUbvmZQ+fiXTdDjLkA/1Q/n4MZ7RnJCjSKdAzNvv7S
	+D5ygJUnlz0MtJDfQxMKKV59hEVtWdbmzoUWNhsmPgue/Qc/PQwvTwqwhkBHhuYWumqDUsJLmdZ
	cPunsTpmIYLeIS0a2vwUOfUCcqj+w/cHxzTM+9GXicH47nHyquVvo+ND915e3fqXWv7xB4o9b/j
	FS+urqBVLp6kgclxn6v91KZiSi664Jko8NAZqJzATikH6xhik6mAfnwuHYexiLYLACmwIOZx1eQ
	a9FRUUpT9CHX+Su34QhfvbnU+hMd
X-Received: by 2002:a05:6512:3ca9:b0:5a8:afc8:c37 with SMTP id
 2adb3069b0e04-5aa32369fccmr7817435e87.4.1779957603539; Thu, 28 May 2026
 01:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
 <2026052710-flagship-unsmooth-ce82@gregkh> <CAMRc=Me=ujnscSOKhHDLz+ccMDyLyCfZnpqobF2BJ4YowgXB5A@mail.gmail.com>
In-Reply-To: <CAMRc=Me=ujnscSOKhHDLz+ccMDyLyCfZnpqobF2BJ4YowgXB5A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 May 2026 10:39:52 +0200
X-Gm-Features: AVHnY4ImlKiDtiu3PtJAJE_NOkB4Apdo_R0OjsOkU3xKzZOWZm2qt_u0g9B3V2M
Message-ID: <CAGXv+5HKxhfZuAHTZECsVFp4S9yTN2rXW_Nps2TcoV=r9KgfEQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 10:36=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Wed, 27 May 2026 19:41:30 +0200, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> said:
> > On Wed, May 27, 2026 at 06:21:00PM +0200, Chen-Yu Tsai wrote:
>
> ...
>
> >>
> >> However this seems to completely decouple the power sequencing from th=
e
> >> USB core. Take the USB A connector for example, it was recently added =
to
> >> the onboard USB devices driver. However the connector has a device nod=
e
> >> that is not a child node of any USB host controller or hub; it is conn=
ected
> >> through OF graph. At the same time, since it typically sits at the top
> >> level of the device tree, a platform device is directly created and th=
e
> >> driver subsequently binds to that device. This is totally different fr=
om
> >> how the hub and other directly connected onboard USB devices work. In
> >> the onboard device case, the device node is a child node of the USB hu=
b
> >> or controller, and the corresponding platform device only gets created
> >> when the USB hub driver probes, thereby sort of tying it into the USB
> >> device topology.
> >
> > Hm, did we mess this up?  If so, we can always change it if you think
> > this should be done differently.
> >
> > Hubs should be dealing with the power issues for their ports, so maybe
> > rethinking this might be wise.  I'm just loath to add hardware-specific
> > hacks to the hub common code for obvious reasons.  Anything we can do t=
o
> > pull it out to a separate driver is best so it doesn't affect the 99% o=
f
> > the users that don't have that crazy hardware :)
> >
>
> IIUC what we discussed with Chen-Yu yesterday, the only thing that needs =
to be
> done in the USB hub driver is attaching the port firmware nodes (if prese=
nt) to
> the port devices we instantiate. The rest can be handled elsewhere.
>
> Chen-Yu: correct me if I'm wrong.

The above, plus adding pwrseq_get(), pwrseq_power_on(), pwrseq_power_off()
calls to the appropriate places in the hub driver.


ChenYu
