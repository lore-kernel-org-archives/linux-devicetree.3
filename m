Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFE1370AE3
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786699410; cv=none; b=rP33AXhPQLkPCCEfz6Q/DQ9NjblZ+FVpIxbqPBviHvojuE3UXqBAWD+F3XhfeOIuQWxMnUIhV52LcfVGgSYL5tT3FCMHj3diC4IriHWb4qcGv5uNiMOLmhggagRGLHSB2SD3SGcMY0IgyjZO1Fi/srJYWzSKsfqQWGoJhkXhX0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786699410; c=relaxed/simple;
	bh=aOOgMxJ0Wi9wjpidoIa1jqFMJbdgv7Y5I9i5lPA6l0M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=djaeqwbPDHyDMNb+7zy3/btGzmLLP68xYgT0xGyMc1TgSPw7ALKpt8LNBW9K64fVylg/yMgZA/BGih/lBBc67xqMQhAHwoughFqZ77YwXexLjqFVBTSnPkvPWEGWOU4CUbl8V9l/gPATOV4kWJcYGbu2z3FXOfSH6o8a34UILE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTr2tFGZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTr2tFGZ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso385690f8f.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786699407; x=1787304207; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GAkYCe4/uinOape0Z9uWaL7vPL69AcEJPMJYJNOaYGY=;
        b=ZTr2tFGZfAkstHFnnwY63Da9QO8KzreukVs6QLk7L6fXNYwO+SYjTITuh1k2JZFtsB
         9+B1ZiRsjbWSzWpnQ6Q9+7Fr5FoZUP+UeQ6abnnB5qEK+NWeKwoIf/L81dvfBM8wetnq
         U1oAoX5US4LIs8wrQjfHV197ozzMFfZpfKOexYg+4DF5gTFmPRPTRge84JzPMZE5LmAM
         U5yfN9Vbu26Fa7niiM3WUalpcA2Sdg67ATygwO1nnTFwTKrqjq0x8pNAstn4nn8LLxu0
         PAKj9ptYDd8xwWfiLppn/Y2VJtaustm1SxnZPhxmefwy3o570rXGopHjz0WJW6Bollkf
         Hxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786699407; x=1787304207;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAkYCe4/uinOape0Z9uWaL7vPL69AcEJPMJYJNOaYGY=;
        b=B/q4RnfLgS08eTzjaNVCpp+k8oRQAZ6IzlwW2CGYAo+NKy710a3jaS1MPZvSCGvtmP
         iY4NQUHx3HQEOxl1ahoDTanJ+sfK53NfN+sa/bWtHffbSUztE+ZK6zylzjiAaGfqHJ5j
         7HW9Gj3QmLyHSjUKc9p1buL8AMODqemeX6V4Ap1RV1/yqDhWH7td5/IUerfH/GiOh1TS
         +HZmU0L1zUZwgK1YU4eOQ6OfAVXOv2HlsfCRQcLxtqkYpzevn0S+V14XrbgLviacj7LR
         8ixBYBnv4f86blTZNRWBhYJ0Uewx4JAXMDn0ueTB0m+FpPOcA9yUfcjfRv/0aS3iHWZo
         U+eQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAVdjUdg0s7LgXHxyZ6mgwk5+gzAS6iyUx+ZX60eJh8efc97c5g4oUY2q9aMRRRpu24boR+sqP3ZLr@vger.kernel.org
X-Gm-Message-State: AOJu0YwfpNtA+sdE7LtECY3JFvMdp+KpDK3Cm2O3xodmyGz/7gEQKA5u
	3+qE4NK1K1MgYLLkV105aqSvBPQwGlLGM9QsEQuJDuug+H+Acv1i72qY
X-Gm-Gg: AR+sD112Q52Drb7bpFlMMllPNZDzHp4GutzJJQMCdGn3l+MDjlfPaZ6FDnKH7De14iu
	kkCS46WG+4Bkb+zCNLk3YAbObKNSQbIfnsf+OpJ+893CwDheVwlR1Nfu/uDkA5DTC38Nt4ZmlSL
	b11pZLX1C7INAyFt5gtjAzVepcWGms/PKkiCEZyI6luy8sEdJUV+ua/06sOq/08cw3Ov2YMP7jg
	vzih5rgTT6Gbu1E6IQYrVnAERftJy0gIxiClrhWLZie1rmAyPkPcbyo0rBDjYGtLO2DFT0V59q7
	a7JJXXFm4d+1Bhvb8KO27cXHScsfjkpnUTnqdLw3vm8lCdpqo0ztRKavZ2nECknKQoAzoVAfVeb
	qpyYAsAwqzaLECb1ZVKY9pVWfoWB3t5OCILEd+n+dXcotNNRZ+v9G62gc4iObrmm7a9gJMY5VdK
	XtAoxvipAESz7c9sQYhcgRTRaAhwzfN+B65zkYHKZ2MEFAeD/f8FDcKvc5TzC4h67wGr68XyURk
	xQ=
X-Received: by 2002:a05:6000:1889:b0:47f:e877:641b with SMTP id ffacd0b85a97d-48160738643mr5409441f8f.11.1786699399170;
        Fri, 14 Aug 2026 02:23:19 -0700 (PDT)
Received: from localhost ([2001:4bb8:16f:15e0:6cd4:2382:91e2:c6e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2005bcsm7077632f8f.6.2026.08.14.02.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 02:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 11:23:16 +0200
Message-Id: <DKOK2RLVHGH5.Q3B5J8LW2U64@gmail.com>
Subject: Re: [PATCH v6 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260812-veml6031x00-v6-0-7eef6e4ce290@gmail.com>
 <20260812-veml6031x00-v6-2-7eef6e4ce290@gmail.com>
 <an1rR07iJd_XLSPr@ashevche-desk.local>
 <DKNPY12RSCH4.2KQCX98171G2H@gmail.com>
 <an7IpvdXnxzzDknS@ashevche-desk.local>
 <DKOJJJSXCZ8Y.KCR5NRYX7PVL@gmail.com>
 <an7atynATsJHlt7_@ashevche-desk.local>
In-Reply-To: <an7atynATsJHlt7_@ashevche-desk.local>

On Fri Aug 14, 2026 at 11:07 AM CEST, Andy Shevchenko wrote:
> On Fri, Aug 14, 2026 at 10:58:10AM +0200, Javier Carrasco wrote:
>> On Fri Aug 14, 2026 at 9:49 AM CEST, Andy Shevchenko wrote:
>> > On Thu, Aug 13, 2026 at 11:46:32AM +0200, Javier Carrasco wrote:
>> >> Hello Andy, thank you again for your thorough review.
>> >> On Thu Aug 13, 2026 at 8:59 AM CEST, Andy Shevchenko wrote:
>> >> > On Wed, Aug 12, 2026 at 10:27:41PM +0200, Javier Carrasco wrote:
>
> ...
>
>> >> >> +	data->regmap =3D devm_regmap_init_i2c(i2c, &veml6031x00_regmap_c=
onfig);
>> >> >> +	if (IS_ERR(data->regmap))
>> >> >> +		return dev_err_probe(dev, PTR_ERR(data->regmap),
>> >> >> +				     "Failed to set regmap\n");
>> >> >
>> >> > Is debugfs access already enabled for regmap after this call? Perha=
ps you want
>> >> > mutex to be initialised before that?
>> >>
>> >> Could you please explain what you are trying to avoid? Even if the
>> >> debugfs is already enabled for regmap at this point, what is the
>> >> possible race condition?
>> >
>> > That's my question to you. If you think there is none, then we are all=
 good.
>> > Basically the Q is if that mutex (that is initialised later in the pro=
be) is
>> > required for the device IO which might be possible immediately when re=
gmap
>> > is registered.
>> >
>> >> The IIO device is still not registered at this
>> >> point, and the registers are set to their right values in _hw_init()
>> >> after the mutexes were initialized. Moving the mutex initialization a
>> >> couple of lines towards the top is not an issue, but I would like to
>> >> understand the reasoning behind.
>> >
>> > User may read (and depending on the driver case writing) the register =
map.
>> > Would it be a problem?
>>
>> That is not a problem, as no assumptions about the original values are
>> made.
>
> It's not about the values, it's about the *access* HW during that time wh=
en
> there is no mutex available yet.
>

There is no issue with that either. The mutex serializes the access to
multiple registers that store the scale to provide a consistent value
that can't be manipulated by other accesses (e.g. debugfs). That does
not have any meaning as long as the IIO device has been registered,
which of course happens after the mutex initialization.

Best regards,
Javier
