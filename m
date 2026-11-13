Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540622;
	b=BkZwoYYU/E3FOr19zrdU6kdrYnZD2kpxcbj0HYW1YlWMmjd/jFjg2mI13MHAiKtcrAM9
	 zGJoCx0IG/hPQ8+FVaMJbmTuZcwrXh5otEIP0TuuZtALD9hit36AqgSC9DqnKHPWt6w1W
	 2bU7VXJKLpGf/wwrvofZf1vDsACcP/ls6/qAZbJmMoVdnsPns8mJRODj51Jy4OQkKmikB
	 2a/m7HEQuFPmTnGx8oJkF/8qm4wSdBFmriRUWaevcrjOvTyWP4OFWImkWsdV/NGrRRapw
	 pTbwwkHsPZlMB5m4h9v5tQb3a8kEZKvQHucrdWVwLJmdCt7AOgKhN+p0DsHoQPq/EGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IyDgmHlGc2LlHCU+APm/SncKRB3P+rRs9H3SfqU7anQ=;
	b=TxWBGBQxjeoYPFjlPWdjfY+o00KqHpPgdyAh1Pup/Cu9WOcIy9qcu27c8i8KofTJqJtO
	 /luqayAwZVJ6I+zGMsNys9WJkJ+hwVyhdxM6OgvWBNV/W5hwWowap6yJIBoI1DqCqDJCr
	 3K15O0bblycuiSr6eLFsGM6GddZEiNbZrPoMjX6PEjhsTOOwtnJC3dogT1GGYnwsEAZ5i
	 POHXNFWphyelr82qHV4YdTo9SqcViPLG8yulB6J2Aki7FuLSyZt0ZdA8yiaMAaNbrK0Mh
	 EbIN+9Dv4IkfjHCAjvdKipuAw2/8qBXSW8kZZez1iN1D4LC3dCdjvP7pXPklcgTYDeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n0vnSv7c;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47728606A331
	for <Devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47728606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n0vnSv7c
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5080ef9b31so63264666b.1
        for <Devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794540621; x=1795145421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IyDgmHlGc2LlHCU+APm/SncKRB3P+rRs9H3SfqU7anQ=;
        b=n0vnSv7cElidOz1lvprPJ8hmH9Okhg1NNaQcJO0XBIehKFtlf2lBP1nI/ws0nf2xov
         4MaDm5lsUVq8FHEGo1MGyobijhuQHE5nXQoK7OM7sJ4a2mfx/qLJnSWRzkgsuVl6I63r
         YJXuzxefKgYlmgi7Nb6z8n2Z9ajL3aJGlOjLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540621; x=1795145421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyDgmHlGc2LlHCU+APm/SncKRB3P+rRs9H3SfqU7anQ=;
        b=VWBMmFTUCoUZk6STeZCr91ezMJaegGarkJhPn3/JZmG1IFxOSQqbwjWrr2rhuIheKT
         DbztG2aprBbwpqZexv9GXQjqCSz9PxDO/LGi2w5TT5LfVeTxBgaP7ORB//Hyklge9Kes
         cw+2tiXZgfiqCSBqsAk4buX9MJAmlB1DevUjg9HGs6JQXl1Bl1LkhlciyASMcKt8toUd
         qYcB7FImrL7em/SUxZWyeUgSw6bYCww3AZ9QrAfO9kD3oSREQrUZV1moFgSbF4PYJB5A
         tyMjEZwONbiZQVHpTHNr+tLa6nZRJXkB0qLfsRVEW65FcqyvDvBqs6TFNUIIoxZOo8SK
         o18A==
X-Forwarded-Encrypted: i=1; AL+hErGKgv0krjW04mGQEctdsFIvuqRUE3J55DAmIhIU2Ls0Dt83JcSu5CSkyP49mG8FefhaULcpw82gZnJ0@vger.kernel.org
X-Gm-Message-State: APuU4Z+wN7mEUOstN8V5k7GgNEpJXjEMJ6qrtrF/47CxSJlsO7Be2Gdo
	Nj08khY4TVlP+SH7iyvfrdiwBuUQBpaB0sCk/Ec+vAwpJTqzcnSUPb2yzHMKfRFz5mNxWgZTrs7
	SBHSLjXVM
X-Gm-Gg: AYBFou3iQBAtRrqZ1xNZELCUe4yzXTSSPpxzwYLS5bmJ9cd1q1td1D5MOlFk17ug9KU
	lVYV2BSklNCdRvxhE/S9LfRPgwv5BSDPCphcXwBd6yR2tKl5+ccBastGJVndEQkSF5C6wv1yu8b
	uyQiKqSUOgXDsa3z8kTjt5MxtndmoPMoufMZt/vKj9zZS59ertCFZwVYgbgT37ycbIrRSFUAFFS
	bSDyF5QZkk8pinnwHmwzwFeHnIUdvN3JHQIpMssnVvMoJNlKuH/PJ9zThcfEEty/zs5R92l2xVT
	qsQ/JlF79+Oc1b8osH4/fYTidGAOq2ZDnzGk3T5ecs7F6xqGZJmAQwJNyCSUJsbW9U4YMAR8mui
	S9t2K6zC0bSE98yIeB2Xx4GnjjtQp18MO3r2YxMvBl5c78+wxkZMxjd7lTMOjzsRXYf7uW7DPoS
	r0bhkZO301H2Aq1XmVEOxpMehD3UXeYE+gwRaH3hh/Vp/uf6JR1Lz+nBY5F03xw+6ts9PSv7tMX
	CpsZ9UXVx0sCOIDTGJ8y5N7zGNpsM6mKvQRRY8CXrLPkpQNTidUfIqZdTLAP6snA4sx2dtpr6Qc
	lhX3snNl8DcdntdLmE3vTISNdxz/hvO4H5YoD8H8vDkKfzAt/oiPzZeK/uosr57ljyXX
X-Received: by 2002:a17:907:9302:b0:c50:4983:5d8c with SMTP id a640c23a62f3a-c509634b582mr88330966b.34.1794540620662;
        Thu, 12 Nov 2026 19:30:20 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8e16fsm43440366b.80.2026.11.12.19.30.18
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 19:30:19 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so3227885e9.2
        for <Devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:30:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHCx0j6tYGEtWG8SpNsm/lOJny7eLP3CCDrXA50ppzeTgRXo7jwDwN+YsWm1mI0UJjPFqtChxFmbPDG@vger.kernel.org
X-Received: by 2002:a05:600c:6912:b0:4ba:59fa:510e with SMTP id
 5b1f17b1804b1-4bb55ab411dmr22862225e9.23.1794540617960; Thu, 12 Nov 2026
 19:30:17 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
 <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
 <avPZeSgU8ABix34f@gractus.seuss> <CAFLszTiUYv2rx2OzvLR6UyO-uoya0WthPsr+oohQtCa+_itZsw@mail.gmail.com>
 <avUZ-uqxLAu2ICyJ@gractus.seuss> <CAD=FV=WAAk7ddDM3Uq8fRVYF4fCEDnufDbCiVgHfH2cwLqrT7g@mail.gmail.com>
 <avaDbTmhq1NuTKJr@gractus.seuss>
In-Reply-To: <avaDbTmhq1NuTKJr@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 19:30:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V+iLQQvUi3g7+JED0S=8ksup+59rNxrqAnXtHjXc+AWQ@mail.gmail.com>
X-Gm-Features: AclHuK-aJhOTg1eK8SFSLRiauTt_F0qspaiN0WNuraPul_eSmwqC3QJG2lM2xV0
Message-ID: <CAD=FV=V+iLQQvUi3g7+JED0S=8ksup+59rNxrqAnXtHjXc+AWQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 12, 2026 at 7:26=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Thu, Nov 12, 2026 at 11:28:29AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Nov 11, 2026 at 6:31=E2=80=AFPM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > >
> > > > > > > > +++ b/devicetree.py
> > > > > > > > @@ -0,0 +1,226 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clau=
se)
> > > > > > > > +"""devicetree - Non-flattened in-memory device tree repres=
entation in Python."""
> > > > > > >
> > > > > > > I'd forgotten about this but PyPI has Zephyr's python-devicet=
ree
> > > > > > > [1][2], which installs a top-level 'devicetree' package.
> > > > > > >
> > > > > > > I'm not sure what to suggest. Would libfdt_devicetree be too =
awful?
> > > > > >
> > > > > > Right. I'm OK with libfdt_devicetree. David: do you have any
> > > > > > objections?
> > > > >
> > > > > Don't love it, but can't quickly think of a better option.
> > > >
> > > > Would libfdt_tree be better?
> > >
> > > Not really.  The problem with all of the above is that they're making
> > > this library which is about managing a non-flattened device tree a
> > > part of the library/project/namespace that's explicitly about
> > > flattened device trees.
> >
> > Personally, I kinda liked "libfdt.devicetree" that Simon suggested
> > (though my analysis says accomplishing that would be difficult).
> > ...but I can also see David's objections to namespacing this under
> > "libfdt". Does this mean "libfdt_devicetree" is out, too?
>
> I wouldn't say it's "out".  Both options are adequate if we can't come
> up with something better, I'm just not enthused.
>
> > One other option is "dt_livetree". That matches the "livetree.c" that
>
> Again, adequate but clunky.
>
> > already exists in the source base. What do folks think about that? If
> > we switch to this, should I move the ".py" file? In my draft v4 I
> > still have it under "pylibfdt/", but I could move it to a
> > "pylivetree/" directory...
>
> How about "libpydt"?  I'd prefer to reserve "libdt" for a hypothetical
> future cross-language live tree library.

It's fine with me. Simon?

-Doug
