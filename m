Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028D94D9F96
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672222; cv=pass; b=lq6ReA6qdKbBzAa3Po+K43+ucYfj9gsZgBXXZTLwDj/ulwlnfSmkSv8EtW7xfY5wWsodvoKG9wtnnsNaGKoxD5XM2n7KejYgJWcRf181OKp4IaPPctHth2eLiB1bPR74XCOzbmE9zvFg+ns3BWOhW2aVQC1UQUgqWNN0qEX3cyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672222; c=relaxed/simple;
	bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvuvKeIDl/8miTKaIeByorjJ/7UmEX3U7nIGmN/hev4yC4Pc0yX0VOxwffizXj6a51z7qG6tL0Th1dI7EZrJ+jd2c8AP8t8/mF0tf+xrVmPgFhh1dYOT7w2WIDPjktuzpuT1NBRmWYebyKkaJUJEqnYosPeUtoX1+NgcgB9GIqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=egkX0bpL; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="egkX0bpL"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so6348705a12.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 01:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790672218; cv=none;
        d=google.com; s=arc-20260327;
        b=Ddl9nUJI0iCk412rXXNBu7xSjGK3ZUXReKj3LXMM9LstlyqktWcL1EeEFxoHGdsHY0
         EFVDZC83Wmn9WWmaOM+TTSuH35RWXkJYwrXpb/17ycNAGTdmOzSznvG9NpvwcRMYBekc
         W1A/9RW3Hr7HAFIX3p8XOCxqvMUp2PZOMQFfj0oHg6e7wsxecpM0ebYtlJZdHfbtwIas
         PkRF+I9cTkwtNEnYXPZjJTJIU3ZuA68SfPAybzvE712vZIx1US3plmSkMvlLvH9vYHQz
         Zu0BUT/ECBOfCX+l2Yi5QZDcbz+bDdjnpwFZmcag8Q+fryVcA7Z9/hvdbWd39GA6pi6q
         iaCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        fh=TQU98MUGVGxwyo9asf84lDrhs43EI4guUOIMbMz8bGc=;
        b=TTqJCWGQOLJG4jzMV+dsxr3h/lEE9qWwyJyYOHzi83qP+gL/WoyrFi4Mp92P1DzACY
         fmFuZuWADl9HsI8Df32fpjDna4aKyWYHHAsBpuhahb/94Lun1h1Kchsu9/PHlzIWh/Fc
         iS5D9gqfiqWnQTpLoM0pUVsv9yk4WYKVOgqAgVCfKvyDSfJxIsUk13ZnpcM6Uz/ra9DO
         DKDCjd/7AomV+FI8Wbqxljxe3zIPHtjYRuXSKCgBY3+mZq0ff3y8r2B1kj/Fs4zU0VTv
         Lw960zFCRj6OLTfIL6VLyt8akgeAHjgAn5+lVhFwa2AD3eL/o7Qkq8t6r+TtKZksf9LK
         o5jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790672218; x=1791277018; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        b=egkX0bpL6rutl34raL6Zr2+yA6+NRhsfdwGss+M1PG3PmWtN5xcj7wyQzmXZM8tOpE
         k3YPGc4I0soEljUWJp/bjCcfLCFwHPHk2tDNe8OI+B6RiY+zCl+94iHDaEtdMq7pOjq1
         FA8AWwOZmBiEGsGzDNSpdggISx9rHbM1/OUdkm2fbzMb6hy4baA0vcmxCboLJrha9BhX
         tbHLJ+AHEr+mPjt3RVqTWMxSKWJoYlz6SpnhUn34zJZFb/XjNTtVk5KfA7ky8NSrWWFx
         rEbcckJMr7quxmO1VpZon0Lx2Q4p8mq2yGPe/E0pVtpsHe7VgUrQsSjXous/G+/5V2b7
         f3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672218; x=1791277018;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        b=hEKMRQYeu+56sPAHASu2e3AKJF3bvyeBdbkH0K59X3BaJWnKxtitzi/RHvJJKpBqt0
         GwGPeZobclx+emYKYQR2h81ZEgKE1MLhYkQ0YrJhpZ02tlxdkOhq4NMbPgV/yVIsR54q
         lmTyholfNI4zg8VfZ7+ooRUQ5f1b3ZWGGVjQlPk91zicYX1P8TqWHbpv5zE3n78Bvp+n
         vgtfD8vySriDpWbuXsVgWUegDLyKkyiTSdy4Jyao3u/RN68gkLY0mvp3AjhDhG2/nMBl
         UR4YILk30y5qmiUyUley1S2bD+WqGU5FAYfhUTSa3yoU5omJh7PjkdXw8gp3tO2JH0gF
         57Pw==
X-Forwarded-Encrypted: i=1; AKwUvBwqZMT4n1P+nn5fp8lkHfd1NxVmw8OtQXKZVcOPv3BQwOVEN6bfXEnauklSsnYXiIbwwFpb+BfMGW9E@vger.kernel.org
X-Gm-Message-State: AFq9FYImPIzLa1MPhd90hdW4sNxHfS7moBwm1I4aHBi6vi4CyBFjsDsn
	F/vPqLnF5oGJO7Y09T0GRTfKtlae3bGhfcqZC5TWFf2TPVkb8QHc5ECpE08ln5Safg1fb/LDFHX
	GvC3idMyyvN6MeMA3NYz5hfKunxZYyQ3fikQPVh+qnQ==
X-Gm-Gg: AYBFou3BDJYZT7L4QOaeyqs4HqrCHf7QSZ57U/7bVIJ7QKbNb0WXfspnsjiYYN3jFk1
	rvLWSUWbNPQlSFxd/p4ClUNhgo/voFFgC7oe+IU2UZOSCEJleUtuELs0cz0iOukavZciiLo+xtD
	YhB4rnDNikWITsVgls04LcR9o2DbOPEF2Lm2z/2F1trRLthwgs61He4My0getE/TmXJnXaDAN3+
	Jauu7fwtyu7EhbWe1qKVaMpHOrFQ/FwzoZ21EIoKwzGBptdZ+W2oRmV/Aw2d6JUycjGrXM6oYUt
	1ZX5/GbKLbgcqSOF+r+sS/tAg/s8r72iYr34mnmfYB3Iw7NYbWNMSpTeMDul+4AU/IAtNXPuk/F
	L+fj7rfvc6+p5
X-Received: by 2002:a05:6402:1951:b0:6aa:f14f:556f with SMTP id
 4fb4d7f45d1cf-6aaf14f5874mr8695635a12.43.1790672217943; Tue, 29 Sep 2026
 01:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <20260918-contrib-pg-pixel10-initial-dts-v4-3-745eaca28b1a@linaro.org> <7553dff6-004a-46a7-88c2-728651366113@kernel.org>
In-Reply-To: <7553dff6-004a-46a7-88c2-728651366113@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 09:56:46 +0100
X-Gm-Features: AclHuK-S5lTQAo2phJ3ee1A6qOipGEmCVgzdBHBpPtrnraavkUJzNtrZ-i9YXbY
Message-ID: <CADrjBPrUr4+oa2jFJw8PkFbO__Ov91Do7A-h8xp3zdePGQcMKg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzystof,

On Sun, 20 Sept 2026 at 16:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 18/09/2026 21:05, Peter Griffin wrote:
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > Add initial device trees for frankel (Pixel 10), blazer (Pixel 10
> > Pro) and mustang (Pixel 10 Pro XL). These device trees are enough to
> > boot to a serial prompt using an initramfs.
> >
> > Currently only Laguna B0 silicon found in mass production phones is
> > officially supported. Further revisions such as A0 silicon and EVT
> > devices maybe added in the future if they are useful. As of today,
> > these device trees boot fine on EVT devices with A0 silicon.
> >
> > A few things can be noted about these device trees:
>
>
> I actually forgot if you intend me to pick it up. I assume it's not for
> me to pick up, but nevertheless let me know if something is needed from me.

Thanks Krzysztof. If you could take this via your tree for this cycle
that would be much appreciated. I will then look to set up my own SoC
tree moving forward.

Thanks,

Peter
