Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF493BD642
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359344; cv=pass; b=GHqzBIhbl+bA9eMT3FSmZbZKpa1+Nvy5+V5SDcYZ/68yJcvW9oYBIpKgDkkGEnArs0/Wmbbck92XuQe8WtyEek5Om9AlB59dY0jfqaCeRnV3chvv5X+KoaBh15dRQGMSIj5IOSCnCQnff3hc+yRAcFBxywEJ3IEgIO4EJKBMK+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359344; c=relaxed/simple;
	bh=whp17tHwzK4LQg7Nc9ShOMIrpcTZjYnNPpwNE+2pyaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0ul+xbjAiv5hu3hCmX+hr2UVA7C8T0o+gChu4bhLUXXpPwHlcFCxkohS3W1A3c7L3PLl63muZDOCAhmvoKsoFDTocCuS2lbBvBf5395gjh9KRk00RckMWjMt9ZJIqXh6/SJZTZmWDmjzbRQ1dhe/bk2RqwL7VGI7bMg/NfktsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qf0K5z/w; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qf0K5z/w"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8f186025973so15877596d6.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 03:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786359341; cv=none;
        d=google.com; s=arc-20260327;
        b=h+AoYyrdE0ZhLsll+iAG29Yc3T4Cq7+01p1Dn+3251Z+usdug6pUI0bS5k9zCalO6b
         f+vbWghBztmw1lzBS+NQz0T0Uno1wplmz+NNwbNFzDHaIJzUmkwzcc0aET0hXEYPzmpj
         U6JLCtpJ41i0oFX2vhNGkJ1DOazK6uqcV6gNvK4+vtYFu+o97UlJiQi0tPV9TIXOMokb
         Me01pwEKo7/F/9WTBqXjIDFiFB1y1KVKrrSD1Ltr8/sI8pxO/mSJMlJdKnG5G2xkrWSn
         WDR4iy7S7owQGo/gSnG4HxKo7vepDRb0dhmz+A8it9L6g3+z54FYXvTauRfgunDEW06a
         kREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=whp17tHwzK4LQg7Nc9ShOMIrpcTZjYnNPpwNE+2pyaw=;
        fh=XsYZqBYcHNSsPZg7vJb2XSuJy50eJPTLXrfZ84DqOww=;
        b=OW9Cu7TffJJBuoo8FsZzQcRmeg/uUzmPoqRLKf+55S5Cprgr/6xsS1R+Wjc34tWhiX
         sDbdrMej2sbHTSDoK3EwFvzYXWBtY8xBaamHvqw+B5I0eImxK4U+Ewn7JiolNdGTyQCX
         202IPitWWk2M7FcZ+/s9oeNwOpsBQOFMKr8qoU4wd0/jKjuHw33W1QEMPQKL9oo7dO4L
         D2TYtD3+CppnBhQdvUfIbvHiDeLUj/Ujm/7ZSjNhl/fZpYg3lj/IgMxOw2GoQoR115ES
         2ksMiOUzHq6/g70lVVrNRVmTUOTiUbcmGk9wab0ofpINC3znX7bL1FV9s3tf+scP4Wxx
         ukxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786359341; x=1786964141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whp17tHwzK4LQg7Nc9ShOMIrpcTZjYnNPpwNE+2pyaw=;
        b=qf0K5z/wmI0MGkjG9LElKPMAChuA5q8ZuxKNcWtevm/xbFl820k3gvzWEuiKjHW0IU
         CJC8jtunxe8hWmvIXsfhUEDcKb1KFbJhNCnME9LDa4WLrLEzCq+t8Xp4S4wr0OtTegaz
         DF9lUOS8pi+oQUp2RKxmNnzUnAP7KczfjQu/2FL2vqGhqAVnNzbXzOERNNKI2kw3uOp7
         JkjbQ6fgYu4Jur+oYhYmEJrupUBZnfhkKb2sDo3yY5JiTqt1QQm7bqZ2SDBJeNbOg4I5
         sw9sNu6ik/nssQ5EqyjaKmsYDj/IZrZIkEKtqrJXcPXwTMzyIiSE89Ewq9sUundTJx0j
         HfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359341; x=1786964141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whp17tHwzK4LQg7Nc9ShOMIrpcTZjYnNPpwNE+2pyaw=;
        b=Uiuepi8GoAP76ToZ/Ik+cxLg64OcexyPx+mIlGuoNMqhHdwxcU9zcbWVhZ/x4yc8b7
         7/MxOM2C+cYRrK5Z8eAZiIPLjOUT5tzOF4GJ4lqYn2GkjUtdZNRa986CWr29QLTTTHlc
         y1MBCIQRjgvZmKXkl4OxUrNF/7GVlerLzP8BkRfO7jciZEw/2hkHOgqNwctszUKpbbGV
         nnSvPFjQPEDlMyjrN200a0FotdPxSiPoK8ulPg52ZTp+512gdq0iArrJZXTpFFQ4ajhY
         S1qzWJEQ5rJYF+2zytxEZRn2ZvLLKKxMqUkgHFbJ+Ixxl6eG4CBfD7jE8FuScQOadpgu
         f7og==
X-Forwarded-Encrypted: i=1; AHgh+RrqpXPN34ZOcH2fGTWUcPBLXPU9yXNy1YagRYAufW/IfwUB8V3+DvNy2zYxhhtjKchgm6a//rRPzu32@vger.kernel.org
X-Gm-Message-State: AOJu0YyQPAhzKzaH5CKNTNJmlH42P/ztggQsLpJ1efLP9B4bkHpcjKkG
	NiMrFqbzDB67RdWWF0UOJm3r+ulxFzbyr7FMtZHRfk5SRBHIFwn/FRc25yDmqpbUJRXEWtBRG9d
	8iwxzCpFM163I9wlkOL5oD91ccehWWsg=
X-Gm-Gg: AR+sD12sk3d3WkpwXKEXjoRoCSXc8mV6m4hxOVtW7Mc7bkQf2Wx4KnBSy5qR07ey5AH
	Qttfob7ErwD6ntzpoMyBtu9AvMRSIOlzn6x+euMgNeFf/liL+a03FlD/pJ+r6R9zjv/BI6NDF4l
	1SwokDAboUezrxHd2CkKaJqegWUR6pYNb53W4UcVQKdWUDIyRKE2m/CE9LsW+NJqiaHrxBwOurQ
	T7hki4oOFDdf9km/tL8VvQVnRsPj5wIm9GjpciVsiogBfJSN9dzUP6WQt9hMLJlumKZAoh+IwQw
	sL9c8Cb+3qVYPFFYruLwczTjBHnLRaZDOuxDD/5laA==
X-Received: by 2002:a05:6214:2684:b0:908:9fd5:ed42 with SMTP id
 6a1803df08f44-90a34707604mr228548096d6.28.1786359341307; Mon, 10 Aug 2026
 03:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
 <20260807152059.GA39821@bhelgaas> <CAGXv+5GNvV0yfX2v7E9HxvFpm0xwhGMQLjec=_xV_6YipXFcbw@mail.gmail.com>
In-Reply-To: <CAGXv+5GNvV0yfX2v7E9HxvFpm0xwhGMQLjec=_xV_6YipXFcbw@mail.gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 10 Aug 2026 12:55:28 +0200
X-Gm-Features: AUfX_mybRPX8_wU1Vtkqf_AyjNZAKV0N0JAhtDmUF1bKQ7p9IPinpVnjULwvpq0
Message-ID: <CA+_ehUxa6U+0FEFuptJXQZ0kwbthYjshZftx32CmwkisAyo=+A@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno lun 10 ago 2026 alle ore 12:33 Chen-Yu Tsai
<wenst@chromium.org> ha scritto:
>
> On Fri, Aug 7, 2026 at 11:21=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org=
> wrote:
> >
> > On Fri, Aug 07, 2026 at 11:24:09AM +0800, Chen-Yu Tsai wrote:
> > > On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsmth=
@gmail.com> wrote:
> > > > This small series introduce support for 2-lanes mode for Airoha AN7=
581
> > >
> > > Just a nitpick, but I would probably name this something else, like
> > > "cross-controller lane-bonding mode" or "lane stealing"? PCIe already
> > > has 2x lanes as a standard feature, so this naming is a bit confusing=
.
> > > It's not like dual-LVDS display in which LVDS is only a single lane.
> >
> > I suggested the "2-lane" and "x2" terminology because I assumed the
> > result is what the PCIe spec would describe as a "x2 Link" consisting
> > of two Lanes.
> >
> > If that's not the case, maybe "cross-controller lane-bonding mode" or
> > "lane stealing" would be more accurate, but I don't know what those
> > mean, so if we use them I would also like to know what the result
> > looks like in standard PCIe terms.
>
> Benjamin pointed out later in the thread that it is just bifurcation.
>

Yes but as me, you, Benjamin and Bjorn people who weren't there with the HW
team at times the SoC was created, and given how the internal documentation
these are just assumption and observation... Everyone can be correct and wr=
ong.

> I would assume "PCIe bifurcation" is a standard term, so maybe we could
> call this "Support un-bifurcated 2-lane operation"?
>

And how coming from PCIe bifurcation to un-bifurcated 2-lane operation keep=
s
the standard meaning?

This terms is equally custom as the previous "cross-controller
lane-bonding mode"
and "lane stealing"

I want to be honest... I'm not following why we are trying in every
way possible to find
a standard meaning for an highly integrated PCIe controller for a vendor So=
C.
It's not like there are devices shipped with PCIe slot where you can
insert whatever
card you want. (there is only a single RFB board but that is really to
debug stuff and
develop)

The SoC is designed to have WiFi cards attached and only a subset of them.
And some of them require 2 lanes mode to work with this special configurati=
on.

Even the DT bindings are not that specific to the details... at the
end of the day
everything is modelled as simple as "num-lanes =3D <2>;"

And that is effectively what the HW gets configured to. If then a
robbery is done
internally to the HW to get the second lane with probably some criminal act=
 and
some murder then those are just details. But unless we have a correct polic=
e
report on that (Documentation) we can't assume someone got shot in the
process.
(sorry for the joke around the stealing thing)

> On the implementation side, having to reach into the second PCIe controll=
er
> is a bit messy :(
>

I can assure you vendor hide all kind of bad stuff behind single register..=
.
It's just Airoha that loves to expose godzillion registers and configure
everything clearly... Something that most of the time is better than hiding
everything behind ATF with SCM commands (or even configure stuff
in bootloader from HW strap)

A bonding solution where 2 controllers are configured and then bonded might
also be problematic as for 2 lanes mode the configuration needs to be done
in the same time segment. (and that would introduce lots of complexity in
both DT and driver for the sake of just having an additional reset and
an additional reg)

Aside from these 2 point... I'm open to any kind of naming and change
but it seems sad to me to delay this feature for these details that would
only affect the commit description and nothing else... This is currently ne=
eded
for Eagle WiFi card to correctly works... With the current code it works bu=
t
sometimes it doesn't as the reset and configuration phase is not well defin=
ed.
This series fix exactly that to have stable functionality (tested on OpenWr=
t
from at least half a year)

> > > > SoC. This is needed for correctly functionality of Eagle WiFi Card
> > > > normally attached to this SoC that require a 2-line PCIe card to
> > > > correctly work (and give the proper performance)
> > > >
> > > > The first 2 patch address a limitation of the PCIe implementation
> > > > where the PERSTOUT reset were indirectly asserted and deasserted
> > > > all at the same time (for all the 3 PCIe card) with PCIe
> > > > enable and disable.
> > > > The 2 patch address this and introduce correct reset to control
> > > > reset line for the relevant PCIe line.
> > > >
> > > > The last 2 patch add additional logic and support to assert
> > > > and deassert the PERSTOUT and also apply the required configuration
> > > > for 2-lanes mode.
> > > >
> > > > 2-lanes mode is implemented in DT by adding the required property
> > > > and by defining the "num-lanes" to 2.
