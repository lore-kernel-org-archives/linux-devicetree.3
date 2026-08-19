Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BB981AA8
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 17:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159533; cv=none; b=qJ6RN56JXifdd43h1OyyBGUkIz4owhm9YxRM76xl84tHaUrZ3QFMWv6c/F/ooon8h/j3CG5TR4QGpR1w4KDQC+7mI/6ZgNIk9JZpbDaFEljuQsVt8mxe+4mgYJUjd6yVsZQLEAm9HUG4hrMPA5czCzZlEvMaBHPO7JDhWo/6Sfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159533; c=relaxed/simple;
	bh=R+X1+pJjWvWvVDlg36MzfNwzU5dUF/DCSQzZsCpt9jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5k+YfAmD1BN8zeDEsmbQB4NuXcVR1chVmaXOkvGP8Vrxc3MwXJ/JTzUijHEtNjyEiCrBfA0YYajNwFGL/mipL9ypzZETcyPMq8vgNsd9Yg5/sSYEEJ7VBU8kWdfHC2/LI11nlIVYI22Oh7+kAZ0n41INgXu8jSTyESeNOEfFO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b1L5yICS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b1L5yICS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2072332a91.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787159532; x=1787764332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oOL0sGbjRAF6LYH92WM9uY0MD9+Nj1oBAHQxCb/Np7E=;
        b=b1L5yICSYZF8bZsLtqR+NexgG0rXsvP2RtgOyFjw53Wq10dtysm05/IGL2eTnuO2i6
         /JnEqlCMd9XMsux19EwzzJPq/qVHid+rvja44bpb5AsVJ/3vvC3lFCjOLrEOThfX0+Oe
         yAbIzu+mX3DcrSrBeEjnfJ0FatLHq2cPV3oNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159532; x=1787764332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOL0sGbjRAF6LYH92WM9uY0MD9+Nj1oBAHQxCb/Np7E=;
        b=I7w5EUjGD5hAE3N+9ztPFOnJQ5DuX3n/zH2rh+6zMmV4Kyl9UufTG1byf7nGUIyYqy
         cTisfQZuB5ZxSaCa+21qOKHxpZ3MO619bMs9mtF8ZaHDJ3ZIpbnFNKptluWom5uZyuPN
         rYW1I3W532XVvbwHpAkslewnNcFsF6UDx7Kr+KQD2E6qFDJ6BryJTy9KDh0uRnbfOoHv
         xEkq1OLIcVv658ZLjrd/eIW5rz39GPaHOCcjvyI+GHaylhW/YadvAhgjtolP4qCYbhrP
         k+A2A02xF5N7InK4MqyROlcApx68FOppBJgTnkK3jieWQQUCC6gNgakCMRFWk0f5Gybs
         T05A==
X-Forwarded-Encrypted: i=1; AHgh+RoMfonuLcAzH0219/CjM9CZluNZwRB4sM8gQvkzXne/dri5YUZKEMlL7qoybWbJURt9KF/ehyPF0c5T@vger.kernel.org
X-Gm-Message-State: AFuF++nTNbLxxROBwozFHvNhfimdCsZj6it+yUXwoqKX+mVBwIZRTDiW
	oIJ7lsSH6wpUK/GCeJhVe/DlhZ87HizEL+KwYhXec+aYzAdW2LFUx4DWWVTam7XujHrVdp7FarA
	QjFc=
X-Gm-Gg: AR+sD12uq7EGPsokoZlFlF2Nn2vIbTQs5irTZjhwTuRdtFc6xbQTjhONUgdatMStwm4
	ne7ut9plA0F2r8j1FbRCxJRwNd0TTenl3YI2FT2/ppy8vgPQrfQp6L60WLMIdUE81N59LZe9u9X
	8Q+HgduYH5vdPNZ8acCbaKtENYiqqmdSb2X+CoxeOhjw/M9nXTtbs6gm80RgDf3bbGVq/LCq/FO
	mkFLJUh2iJBNWas3WDjL26kn7yVxr+AvOm8QjUBnqiFp3kaOKQw91I/YdnRLtwXuZoTH/f4qY+l
	eNjjpKZXRq/YjLToFtrc8qTEz23EDw9zxUXoIpLkckR42YpY4h3KYPbLiSSWm270lUKhmglHi7K
	9IIDALT6Rz+7Oqz/Uri3RR+GzHC61Liy9ZZrZ0p5Fat6zg9kATV/sCwC3C/vlO5EheRqs0BZNJ0
	X5cg3ws6oaztDc3i/32xmv5HvpoHWxZstMmih4ewsePQq1RE2ST4/VlM85MAE+5FOmBp0nE4xZW
	yWCfmATNnU0eZdp3kELRsg5kq6lPn4qkxeXHw==
X-Received: by 2002:a17:90b:5289:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39580aa5d7cmr12686773a91.6.1787159531804;
        Wed, 19 Aug 2026 10:12:11 -0700 (PDT)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm3268720a91.1.2026.08.19.10.12.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:12:11 -0700 (PDT)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1242473a91.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:12:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RojNXS3wUs4MKSiyQI+mqFHNzDsjoCavS8RmPArYzcDrPoAeiw7NRQUqdQvPgZEk7a4GTOoTPzGzcij@vger.kernel.org
X-Received: by 2002:a05:6102:191a:b0:778:5579:c662 with SMTP id
 ada2fe7eead31-7785579c755mr1067469137.9.1787159074606; Wed, 19 Aug 2026
 10:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com> <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org>
In-Reply-To: <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 10:04:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
X-Gm-Features: AcwNN1VC5Sr-hmHls4qje9y_sLrQ3mcRyp6W877ec39iaS3jdP4hd--uL8qQ3VU
Message-ID: <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 19, 2026 at 2:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> > Is there some other documentation saying "aliases =3D=3D evil" that I
> > missed? Maybe some email thread we're all supposed to have read?
>
> A lot of rules are implied by other rules and this one, how Linus stated
> in other thread, might be implied by no-Linuxisms as you want ordering
> or stable naming of Linux /dev entries.
>
> I understand your reason is actually different than above, but your code
> does not suggest that.
>
> Anyway, if you wanted to have aliases as ABI, it would have to be
> documented. You cannot send post-factum DTS and say "we already use it".
> Every ABI must be documented before usage.

I'm happy to document. Can you please point to how / where I would
document this? As far as I can tell, no aliases are documented today,
so this would be the first. If you could give me a hint of where you'd
expect it, that would probably be better than me guessing.


> And this is what my comment was about: "they MUST talk
> with upstream open source maintainers before they ship such ABI."
>
> And no, sending such DTS in your v1 is not documenting ABI. Does not coun=
t.

Sure, sending a DTS isn't documenting, but it _is_ talking. Discussion
in responses to patches is where we figure things out. For that to
work, reviewers need to point out problems and then we need to have a
continued discussion until we can figure out a solution. When that
discussion just stops, it's incredibly hard to make progress.


> > thus implicitly provides an "instance ID"?  Would it be OK if I
> > changed my alias name to "ufs-primary" or "ufs-internal" or "ufs-boot"
> > or just "ufs"? We're not using the alias to get an instance ID, but
> > when I added the alias I followed the pattern of all the other aliases
> > and put an number at the end.
> >
> > I'm happy to attempt to fix our bootloader using whatever scheme
> > upstream suggests. I'm trying to "talk to upstream" as requested, but
> > for it to work I need upstream to talk back. :-)
>
> Make your case - what is the purpose of it? Boot device? Then you have
> "chosen" node for stuff between firmware and OS. There is even a
> property called "bootsource". If this is not boot device, but some
> calibration data for ONE given instance of IP, regardless whether you
> boot from it or not, then I find such case as border-base and not worth
> implementing, because basically one can come one month later with "I
> need 1000 aliases because my bootloader is patching up every device
> node".

I think I've presened my problem fairly concretely [1]. If you hate
aliases as a solution, I'd love for you to tell me which solution you
prefer so the firmware can add calibration data to the DT. To quickly
summarize options:

a) Hardcode the DT path to the UFS node in the bootloader.

b) Use some variant of aliases to find the UFS node.

c) Firmware finds the UFS node by searching the whole device-tree for
the right "compatible" string.

d) A separate "UFS calibration" node stored somewhere in the DT
(where?), as proposed by Linus W.

e) Something else?


[1] https://lore.kernel.org/all/CAD=3DFV=3DU0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr3=
8p+YwRnC_G6w@mail.gmail.com/
