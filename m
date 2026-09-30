Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB15F38E8A1
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790741669; cv=pass; b=Lt74ajdKvHaIbbhmXd8r0Le6iELSESJW4rdL8Hn2LY/s2NoqcEiuSJu9KHAUT2FKJx1fBOfTX4aWN7gWIBOdek2fvRiiP0DRcBRH3e2cu3PSSavxhYBMLYuZW1CR9Yw5GF3yj9T/RMTbsnP5TYdsqMwT02VjvtkwavXBdQk5Gmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790741669; c=relaxed/simple;
	bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3qs7bHdgWlO71uJHhD7PlSCXRufqcac2+gZTx1yRCTrxNHrUKAXPnVbe3q+ofIg686JD0prPgIyQcwENYPrLyCbtrfRY2/yfyTrMzFKzym0ZEEqisVC0/K5ubZav926Ml+uhgHdpeJniV5xTOJVX9JqOS/tiAueay91ry6Cl4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bEsg7GBF; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bEsg7GBF"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-6762de1c77eso446673d50.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790741666; cv=none;
        d=google.com; s=arc-20260327;
        b=F6ISL4Ij44RVgeJ2TnkJ9eemWgwjIv84QVlD/e38mNnWfwhhQnVR6ZOIph1qRa/V+f
         MjUk3cT8S8MTBHeVrEi+UqIxpsJAOvO9gkZRGkz4qZaFsU7rzzc9Lwkb60oHk1aoeBFa
         CS0GP4MRQUJuQObRh/qWwk4UYeU6UeVbyhEifkaFJvyc0K4mXiGeWMEan0qvMehT0re6
         UWScYYf0cijgF6sfmrHgchJst3o2WLEEFJglXKSDE6EmsWz+CSEv/i0OFreZ0fqcvDIS
         HckejzEe2tt185khCvdLGG6+pisdxYyjzRIcWEzSDudWQI/OjvEBj62LvzZ5xUnRhM2d
         zA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
        fh=RtACwoa2xiEDJzlr+5GJSLyDcz16Hk/FWejvfkAx+o4=;
        b=dubj2jd7UIMCR4vz62fkaPrIb+HD4whWM9tSfBgeebG88djzMospCsZI4mQWCFLLqb
         oPDu22GpM2Mg3FGf1wKMghfmyOrhJWfwg+7vY0yBtdU71E1jedyidOTNhbiaqUzxgJn9
         EK3+uP9+vHd4JdpqEFZb0E0SkUcRxfs2PB2qrpI8/mlkbIEANBnJMiXeuG4YO+lnkzto
         RorCUlD0/Y/RNox3vnVW46H18qGSkD4Us82L406Zsf5cKXCMwh5pqdADV50hHUpJ4Lyk
         ZMEucI2EqbRsHf8sXTWUHUXesLr4pKjZDNyZmI59UwdH7WpBHrFVYsiDRXhVNPzp9IWd
         mQCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790741666; x=1791346466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
        b=bEsg7GBFT1zZzhGc6u8sDmnXTAV25/gAq+pd6f6PktV6+Y91n3ehaPpZu1cNMNBBdP
         tBb6Q5H6oZlt/SVxy6CAfvy38XSkOyzXh6T6XJeAOH/GDvs5dBDL4UAKWvnsZ/wBU8sa
         Ab/ZyXjxV4D1dkvZKVmN7TRkVP830fBtz5RAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790741666; x=1791346466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
        b=SNrXszeLErltK18kfHM2ILacDRnAYP5Si1o0Eb1WPe+OfdbItMmiCLd4/RIvCvoYF3
         dQmHGd2tWos3jGmmHuxEhJwA6z3niNHcqj93iHDJ1Vp5poBfaaK8Wa+OMAkamcaxSyNh
         5hZVlZY1S16AhbkOhvIUP1dRdct7RtfT3G1OkMZMc229cviYWdZiPIpWFlrMtoDPnbiA
         keuzEWv/ralh88/QqPO/peGL2viOG/OAgkl+9Ol+W3UhiLYyPYFAKI9WXADt4hF/3N0r
         IaujJkFpusL19PcjQB7yt6Rgx9KWLiOUwRxACLtEsNCMAdMGgP4jtE88EQ1rPPZJ/qpF
         Qnvw==
X-Forwarded-Encrypted: i=1; AKwUvBwA4BtE8ppXYCzmUleV9t32CJdgoGlRuZ9Nsg5hOYkKQaaG3W7b3/C5tGBRXMO4Ryp1M+RED0yeUUfV@vger.kernel.org
X-Gm-Message-State: AFq9FYLNm56O6SpWmDCz7zyGAx5V75pKMefXOompzjn3VYqa/dA3XiFk
	YFJz6UWPJSux0qjD0utxxqP8Ebi8vLBWj8Ypag6t4xnAZhjoIuLcK4cIXu3KMfosapWIcY6q3Fe
	yz6lc43U9+Qp3D722M9QY0j5//7G/OldQeVB4YIhx
X-Gm-Gg: AYBFou0vvjje8BUqY0j3/cdA+kebN4wf2aX9x8uMa1vmguM3XLHjZwjHSlghQTsBxtX
	DVHrnUHDCgfes1K9vCIk96ENCBXoeIvBfCdrP7eGVotXA3VgVpS7DTpXBQJEmUl599egXOyoqgO
	SPENtdwphMeJr1hWtBaORXqaN16OSOTUIuXPUEkYXMqIoel/KgJK9gFFfcUF5r4XaqFsl6Kuwrv
	bEzKaile7NdTCwcOqTnP+Wy8J5/aqba0H4lovwskLXfYKc3++532D6dvpzMdz/HkVGtgdClwnYZ
	F41kUCPWvok1r0reoYHaYYUPfG3IPf7rGl0QlgJDXOp4WfAtvSANXlAwa73C9rf5iz0XZU3zaZn
	lFTBnWh8daw==
X-Received: by 2002:a05:690e:4197:b0:675:405d:643b with SMTP id
 956f58d0204a3-6768349a6c4mr76844d50.98.1790741666569; Tue, 29 Sep 2026
 21:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
 <arQxC3DmDyVIGdqq@collins> <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
 <arVnQmik-CveaAkY@collins> <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
 <48271d518bb25f552309de12758e9a9995905f0c.camel@collabora.com>
 <arWIcrSFkEA4GMTY@collins> <013b1e7ceb7cf046888109631e72ce4c408ab88a.camel@collabora.com>
In-Reply-To: <013b1e7ceb7cf046888109631e72ce4c408ab88a.camel@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Sep 2026 12:14:14 +0800
X-Gm-Features: AclHuK8VlKUTvMI0v8jjtLYpqVzk8qBeIKfHOI-d_wW7lfMXYke40oAj8SBNDvc
Message-ID: <CAGXv+5F8iJQJK4N2g8pmpGQVf8TxNvkC5Gm-RZ6F4HdQaThXpA@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, 
	Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 4:46=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Paul
>
> [...]
> > By the way if you have ideas about specific problems with the stateful
> > API that should not be reproduced in the stateless one, feel free to
> > mention them.
>
> Few things:
>
> - Drain flow should be as simple as for stateless decoder, there is no
> reordering, and so no holding on frames.
>
> - Capability query should mimic the stateless decoders (but up-side down)=
.
> Basically, we don't add a pseudo unset state, that was bogus.
> V4L2_FMTDESC_FLAG_ENUM_ALL could be made mandatory, this is only partiall=
y
> implemented decoders today :-S
>
> - Capture/Output S_PARM, maybe review/revisit, but likely still needed,
> otherwise the rate controller can't know the rate.
>
> - S_SELECTION, maybe make it mandatory for codec with a conformance windo=
w ?
>
> - Of course, encoding process requires a request
>
> - Anything about keyframe insertion can be dropped, since frame type is e=
xplicit
> and per codec.
>
> One ambiguity we have in all decoders at least is weather or not the enum=
erate
> sized are coded or display resolution. I believe technically, all statele=
ss
> decoder exposes constraints in coded resolutions, and display resolutions=
 are
> not easily enumerated. Not a blocker, just a remark.

IIRC from working on bringing the Chromium V4L2 code up-to-date, userspace
programs coded resolutions as the frame dimensions, and uses the selection
API for the display resolutions. And yes, the decoder exposes constraints
in coded resolutions, like having the resolution steps match the macroblock
sizes.


ChenYu

> Hope this is helpful,
> Nicolas
>
> >
> > > A second implementation, not just a variant of the same brand would a=
lso be
> > > nice.
> >
> > I still have it in mind to add support for the Allwinner encoder based
> > on my earlier stateful-ish attempt. Hopefully that work can be funded.
> >
> > All the best,
> >
> > Paul
