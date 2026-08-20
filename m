Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D3381B0E
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 23:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787269309; cv=none; b=UuDXEz/WC46iZJqmWi6J7zLP2hO/PrzlZ1ofdRI4uXbWzcz2BUXvX7XOdH1HIXQG9jWVDLDn6gFhz7CYIEAo1TmZl0/A6A4oqHJ+Wce+7oMkOCmt8ZHNTWBxBWq1/gQ77qLHuixlSeczgP8e+g/8LCmzZkDBVd7cAO8qC0oOjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787269309; c=relaxed/simple;
	bh=UtldySaucpx0WiT2hf6Tf+4ZCCDvPTnOPP4X9Lh8abA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqHEI8usbVwmYvtYcaeY5MPt945dmeF6gm6sy6YU2MX5Zrow8qUA0wZNnK4ogOtAI5dUZxZLo67rhYD/llvglLY0/yk1VxAmP08+si7hSa8uKXaT+3ICCcoBepQa259U/OmG6AHm3b7uOE0PYOfGc8YSFms7UZASCEC1nmNDwp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XRfJlfpD; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XRfJlfpD"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97bf91b2e6eso117042241.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 16:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787269307; x=1787874107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtldySaucpx0WiT2hf6Tf+4ZCCDvPTnOPP4X9Lh8abA=;
        b=XRfJlfpDbEZSeVrJtqh73EITCyCXpHDHjKWPfL44jJ+MFDmL37jQt8fF7WyI44/MCM
         Eo7iUX3Xc8e0zGtzDsThrZ51YqRI/sXossv2UE4SgJvVTnJsnpWWVOBgYynaMLh1MR/5
         ZtyKuXkLsq0N4T1fnCjZJdKu7YckTvs9gFmVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787269307; x=1787874107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtldySaucpx0WiT2hf6Tf+4ZCCDvPTnOPP4X9Lh8abA=;
        b=LR7f1R/8PdUBOxBdBBnZGEXd3T190+esvg3LTflxU8Bp7O6CIy22jyekaoMVmjSKQS
         9ii7tMMlCtJlMO2MPCWbMwNN7wgn7vZVLykD4WWauB9fvbOj3208d+zWg0aHcFSWo6R6
         UjJXzFPhhkJCvqHttTVnyfVrk90VycLzBbZ064jBKpsKAlVcCY32tgrjK8hiN6mgH+1J
         ZzYKoNLfzORNnRd9WASEVFP49LAd5suNkuUmXJ5QFNYxKvM8vtzb78xyaOUYafE2EoRq
         Gt2N4tNwOyJLZnWl31+X3Hw3zBU9Y8PGR82Cj0ukhliwzSqf+geUqdOdCyYCuy3OLkz2
         qqmw==
X-Forwarded-Encrypted: i=1; AHgh+RrmHSQwiejBOOgup3Uk0f5BtddF0Ws1tVzvhkncASVP5tovTgJGZHdUybvAKVE1juUq7HQzbVF0JnDb@vger.kernel.org
X-Gm-Message-State: AFuF++mXGL9gyHLvKananCrn4mnsoRjaiJL93DGKcpAnQP/cTYqs0vwe
	njlKky+1Zyqag1KwVzHWZXfU12IBOv7WzC+BvOVU1051CqCzeR0aS5fvpLqK/dFgTPN3Cnrk141
	4Mqo=
X-Gm-Gg: AR+sD12OtN9BmS3fou802Vfaot4ar+6nGlwh3GAPqhavcD5I3AHBQrpLpUtwnkeNcDI
	YfTGEl+5KhCv/6l3AYZ3t9GoQaNIe0sYdELu7xQfUNVnIj9YcK1f+rO+UWTw1xWT3eWnz8KL0qw
	03GZJLYFyiyfMdOp3MHf+0wsFamg9wYi2A8+X7wuh0t1fpe+w0WR4CVuDuT6UwPk+aj+1DRdIDM
	Rnm+XAwKnvHsIFHfVLCeS4ch//PCORRlftsungF7F6ID2IACYXV55fGlH3IdD/pf+4Xd12RTaAY
	nnPM+O0eE8L0tKgNfgQ3KIgvKOWrPbnQaA1E86GXkydlwZFA49cs1LV6qq78AnYtHYwewXcJaNH
	S2Aod7el8Ra9+g5tgvBjfVCfqPMVXHopvMTruMM42n88L9YtGOgWFcbFHpxk+kcplgAnJAfLQvc
	FY10n2tyFmcjC5d4DS6pjT7fmiWJP6GpUscXglwaidAM+5yXSlGTuuNI01IBng6Y3LnQx7wgrk7
	tAlot8A6SlyYxijGQ1pBSrJ2eI=
X-Received: by 2002:a05:6102:919:b0:74a:be82:73a6 with SMTP id ada2fe7eead31-77a6334b113mr966082137.8.1787269307065;
        Thu, 20 Aug 2026 16:41:47 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777dafa1c59sm7678067137.3.2026.08.20.16.41.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 16:41:45 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-754ac74c495so194663137.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 16:41:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrLgomGfNES/TVTFdJlAOP7VfneeBfUqTl77BlEGp/eeceLHaBxw8OmUKPBkocMDP0AQGSYfoPAxoGQ@vger.kernel.org
X-Received: by 2002:a05:6102:5809:b0:76f:eaa2:6fa7 with SMTP id
 ada2fe7eead31-77a623259d3mr898151137.2.1787269303777; Thu, 20 Aug 2026
 16:41:43 -0700 (PDT)
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
 <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
 <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
 <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com>
 <CAD=FV=VsiQfoGYHw3D2xmV=Jedu+cmqEfrCk0mkKFzsrRCQcTg@mail.gmail.com> <CAD++jLkJq0t8sC6_S4LHERbTTiUanKh32QJtdDtUZrXdDEHgMg@mail.gmail.com>
In-Reply-To: <CAD++jLkJq0t8sC6_S4LHERbTTiUanKh32QJtdDtUZrXdDEHgMg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Aug 2026 16:41:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WjWd8fRuByAUn-mk-fMJqJN9wrzxAsYH7yYY3XxoDFqA@mail.gmail.com>
X-Gm-Features: AcwNN1W02_U2EPpwN5r9pV16wwm63sX1fk_h0bppJD-El35NE0PVzCZcm5fPTEs
Message-ID: <CAD=FV=WjWd8fRuByAUn-mk-fMJqJN9wrzxAsYH7yYY3XxoDFqA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 20, 2026 at 12:04=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> This is where the imperialistic ambition of device tree
> kicks in: the piece of software - be that a manufacturing
> run-it-once piece of code - that produced said calibration
> should have *also* used device tree to find the thing it
> was to calibrate. Supposedly looping over all UFS devices
> in the device tree and calibrating them one at a time,
> something like this.

Sure. I guess this is one way to look at the root of the problem. The
firmware doesn't itself consume the device tree. It has its own
independent ways to know what hardware is present. Trying to get
Pixel's firmware to use device tree is pretty far out of scope, but I
do see how this fundamental disconnect can be seen as the root fo the
problem.


> "I have a random piece of calibration data and only I know
> which UFS it is for, so I am going to encode that knowledge
> into the device tree as an alias."

To be fair, it's not encoding the calibration as an alias. It's using
an alias to _find_ the node where it can put the calibration data. ;-)


> I don't know if this solves your problem other than saying
> "go with any hack because this takes place in an imperfect
> world", but at least it points out how this kind of problems
> collide with some of the core philosophy of device tree.

LOL. Yeah, I think at this point I'm ready to give up and just
hardcode the path that we hope we'll end up with upstream. ...and if
we're not allowed to have an "empty UFS node" for now, I guess I'll
just have to have the first detect that it's running on an upstream
device tree and have it not fail if it can't find the UFS node. Ugly,
but it'll get us booting and I guess will be uncontroversial.

-Doug
