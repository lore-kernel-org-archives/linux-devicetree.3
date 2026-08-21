Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B9A42E41C
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787330457; cv=none; b=hejGyznh53M8lzwoxxFEPlwfpX3MYgadmpTZckUhNREZSMi5uM8AiXDRkC6nV7iM1KbO1kDJ3MDRAAiPDeuah1zERBn3PWJhSNg5CqUezBDxhOFXfD36jXIKkqm9V3kpFsZgCLuTFwtAWmk7tilMjcg1gTmg9+rLdygKNt0tj5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787330457; c=relaxed/simple;
	bh=ZXeo8EI+t7/t3ez1NovFOGBbAko3PEvsb48iBmoNbLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvXCKTagYC/px0CrRodapcOVofWF6nF3MBWk+8o2eIkZRQ3fO9O43QatO1lYzzgz4os9Dcr9Kzar5zwVqwrxI7xSTepyFD/TfZrO8RIpXhy2Qp+07TfZlb3DbBdyp8gv8K25VFr66w/RNwBA2S8JMUj6PJVA+yCclHAeDkFRo+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=agTQ71RF; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="agTQ71RF"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c276bfce7eso1048590e0c.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787330453; x=1787935253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXeo8EI+t7/t3ez1NovFOGBbAko3PEvsb48iBmoNbLk=;
        b=agTQ71RFpmkJI6dvvdAew1de8lVM0vtCN6nU3Ku5OK8MA9McbXL6xDoCzHlP0fjIP4
         fWb0UlXPV2AITX+IfAAHqvFoe2uHhd8JE3V2CEByZ+vVtAd3SJ5Zgm1IEOi9Lfj2Pu2P
         ZCUYm65+3HE5rJMxz0O0KvZ28euazrn1/hfE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787330453; x=1787935253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXeo8EI+t7/t3ez1NovFOGBbAko3PEvsb48iBmoNbLk=;
        b=JRzIvfMtAhJrkA9cOFMYDs6OOeR4m7XFkIhHIEePmtojLIAAqFEuuvFvLaQXEAG+x5
         K7tMppCcdZz0buxoVphuPfP+KWSXXldMuIIdXl2fBhPKp9I35YpvU6Tg8durCcJQ4NcL
         5jVEhjBFKJ8+j5PgOpO3jivP8QzSW7ahrcxy8xMkpYfDwQAqsZ2w8wdcUCqz57zKQtR9
         By0Y97CqkeorksEUBANOnsiUoTDrAa/xLZLOT+hw/Qq5BylsEKUzqfupzN1cZdfj1ogb
         1jw2FRqtjNl1Vg3etTVx4Klfmkkr2uQjdkRp/bIhTyFOGk8/Rv68HaLI4jZAOnzVpQde
         mTCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRHBdn+ZdyzpJGKcEqRyr7CQN+AfMoRsL5L4fSEkRWh072kf47YfAqbmxPrjSAqnXWcCb6Op4Gnaqz@vger.kernel.org
X-Gm-Message-State: AFuF++m9j6cT/JyvwpwjUIoO8ETwnV08ITc9G+9T0o4jt+1IntSBWKRO
	I+Ux4LIdGsH4QfFXKnqpvHE8YJkKzxyoBy1d2S01YbO1NrgHdzz1xN3nHJeMvgjFa+y5IMLtTcm
	RNS8=
X-Gm-Gg: AR+sD127OG+GSE45G0gH5wPj/SmIblDjiCWnUCFoD3H6tIsmPIOkiE2RETmfGC2jZ2R
	kv5FQemfhr+9ne9sEwWz8jG/HlqdgPcEvrRqxJYjLvhwuZU1keGgvAeXvUeGw+wL0EbXtmtO8bs
	TU2EEQSclE4NvQmqTSLvIXRUQYwAi87abHyAEpSE31V+9HI3rNEkH8/g9Kweq5g/mhKojFobhPG
	k4K0CIgOCCMi27Du1ntK/6GTk5QF3KB1Gg0lTU7jVZSjXJ+ZNHntHwye0Wn3DuQtHT6sToW5J5p
	+CWhylWFpPkp6FNL/S2KDsXbLq7BsXJEly6BdZY3Ej9bKvOEFj+PhEhfx/sTv4W61YRXGQclfHQ
	1kOFPI7RjmbJzbiRYU+WsdK3smM0Z00vgtLidpbyGQrONC2CoQuNQ3gSj1T5TxhcLT4TzuSRyZQ
	2Hta1zvy3df7ntmns7n/ju8MXb4gjZt89w4rAS/SNlkN1aXXyNFLpIszsIvnkoQZUTOr03m3t70
	YTQXKZQId/YSeJcxfZpXdLzn28=
X-Received: by 2002:a05:6122:8ca:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5c60dd1a3a3mr69627e0c.1.1787330452949;
        Fri, 21 Aug 2026 09:40:52 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e276d7ebsm9245063e0c.10.2026.08.21.09.40.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:40:50 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-74748e3a4d1so683823137.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:40:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrteeD97Cp22Gyv4Knj0SMumRVMpA61TM6RfgP9oxMYsZZQAlTcuQsXzVBvurBLgsx/IIwClIBybpht@vger.kernel.org
X-Received: by 2002:a67:c996:0:b0:77a:9991:5d08 with SMTP id
 ada2fe7eead31-77a9991cec1mr1941674137.9.1787330449569; Fri, 21 Aug 2026
 09:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org> <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
 <56db332f-a18e-4a9e-be9d-67d2e25c3666@kernel.org> <CAD=FV=WUMKGRUbAyd7XFFc-NGoJEKRwu4MaUnEQUDB9Mq6YYXA@mail.gmail.com>
 <d6685094-b241-415e-9e56-d2fba75f3269@kernel.org>
In-Reply-To: <d6685094-b241-415e-9e56-d2fba75f3269@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Aug 2026 09:40:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPu5tuWA7MhC=48r=1uP3LK6hSqY7Egy=56V1Dqq1wRg@mail.gmail.com>
X-Gm-Features: AcwNN1WVXS8N4-UYjDXHL5iUmkkapXer1429A5JjKjwhm2wT5WS30SWZHssAmw4
Message-ID: <CAD=FV=WPu5tuWA7MhC=48r=1uP3LK6hSqY7Egy=56V1Dqq1wRg@mail.gmail.com>
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

On Thu, Aug 20, 2026 at 11:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> >>> I think I've presened my problem fairly concretely [1]. If you hate
> >>
> >> There is no description of the problem at [1], except "bootloader adds
> >> the same type of calibration data".
> >>
> >> So I repeat my questions: to every UFS node? To every node? To one UFS
> >> node (but how do you guarantee that?)?
> >
> > I'm sure it's not what you want to hear, but I guess my answer would
> > be "for these boards".
>
> No, the question is how many aliases you need. Devices might have more
> than one UFS storage, e.g. ExynosAuto.

How many UFS aliases do I need for this board? The answer is in the
patch that started this whole discussion: one UFS alias.


> And then someone might need to calibrate UFS and SPI NOR storage? And MMC=
?

Not for this board.

If you're asking about all future boards, of course they may have
other things to calibrate / tune. My point is that the contract here
is between the bootloader that will be run on these boards and the
device tree that will be run on these boards.

FWIW: the idea of a bootloader using an alias to find a node is not
something I invented. Coreboot (the upstream, open-source project)
uses "wifi" and "bluetooth" aliases to find nodes on Chromebooks. It
uses these aliases to place MAC addresses (which are stored by
manufacturing outside of DT) into the DT nodes (where bindings expect
them). Perhaps coreboot is doing it wrong, but this concept isn't new,
and I didn't invent it.


> > I'm not quite clear on the "overlay" suggestion here. You're saying
> > that we should require the base device tree to be compiled with "-@"?
> > ...and not because we necessarily have any overlays upstream, but
> > because the bootloader will generate an overlay dynamically? Compiling
> > with "-@" would mean we could give a "ufs:" label to the UFS node and
> > with "-@" that would be preserved. The bootloader could then use the
> > "ufs:" label to find the node. When compiling with "-@", the exposed
> > labels are essentially ABI. Did I get that right?
>
> I am saying that if you cannot answer my questions earlier (and you did
> not)

I'm still not quite sure which question I didn't answer, but I guess
at this point it doesn't matter.


> thus this should be treated as adding calibration to multiple
> random nodes, then essentially you are reimplementing overlays and this
> won't be accepted. Instead you should use overlays.
>
> "-@" will give you the labels in __symbols__ section, but it won't be
> treated as ABI because it is not feasible. No one would remember which
> boards have @ and which don't thus which labels are needed externally.
> Only a comment in DTS code would prevent it from being changed.
>
> Well, same for aliases honestly. There is no tool which would guard that
> ABI.

Given the above response, I'm a bit baffled how "use overlays" helps.
Each individual board will have different calibration data. It's
presumably stored in something like an EEPROM on the device. The
firmware is getting this data out of the EEPROM and putting it in the
device tree. This puts the calibration data somewhere the Linux driver
can easily find it. This means any "overlay" would need to be
dynamically constructed for each device by the firmware. In order for
this to work, there has to be _some_ guarante that the firmware can
use to find the UFS node and add the calibration data.

You are saying: "no, there isn't."

I suppose one answer here is that the UFS driver in Linux could get a
phandle to a "NVMEM" device and read it directly. ...though it might
not have permissions.

I suppose another answer here is that the UFS driver in Linux should
somehow figure out how to directly query the firmware for the info.
That seems unnecessarily convoluted, though.

...so I guess the answer is: time to hardcode the path in the
bootloader (shhh, don't tell the DT maintainers) and end this
fruitless conversation.

-Doug
