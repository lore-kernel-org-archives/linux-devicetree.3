Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D5E4BB5DE
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165474; cv=pass; b=Id0+gDnQy5MBj3fmR4TscTSsLkMVRQzbPhwqAwDE22bId2HSpfWPIwtNHKG7/c2yr3X4G0IaBF39lKqztT8Nbk1XepOeFJG7vI7Bz8f3EIzy1iUy0plL6kqp2e/YOckzSVAAHN4ACHK3sY0OzRmoscQm75KUZu8FMLi3s0S52OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165474; c=relaxed/simple;
	bh=o9ESTc8AilBu3NYkC+X8HMlQp3tCaNfUdjSt8pFWTNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSh78DUXlfMoc6zEbeI0eNJRXeJ2gX8sfUqNb4VgHOE5ADoQjJ2LqiaBK9mYdl2lsDKM5exYSV2GEjhopx9vmqD87HtDKC410g09ZN4jbFidNCxCgDc8k4xBUtS5/2QndDqg0mx2JSLEOjzs0EzCs2bnva6DDJtZsez3FzoKceQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OxuZWshG; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OxuZWshG"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-33e630052ebso982963eec.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165465; cv=none;
        d=google.com; s=arc-20260327;
        b=IlHX+R3YLN9ATUHCD//B1w2i+nzS55vvlc47H1xjf4BBqtvBSdR7T4ojIynCkfhFEO
         M46+tMhVSrDNKglkfy55CY7F9C4c4VHNgvAdSlF+mf056C0LyUq7ZrCuE+S4sdWYQAsC
         H04w9CKAqdjylvzJT/DtX23XHdLSOoYyOL1ytxezZg5jjtAKi3xlHr39s7LJOt8w9rBa
         OFMYyEcqL7ZVnShZcT+1+aziFL4kdjw4yCaAx8jVi/HvE/TW+rX3EpOcsDFOiwewpp7h
         upSeZAcdqMWP+n1DVyb3cegkNXn9QumUQbaCt7cCYHmIovplSfgRAXssNq8amYwA2F2Q
         Rhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        fh=z67mmaIcAdc9aF0/Qg2f21y8HmbcTRVUcMk6fbbjPvM=;
        b=Fm8QFtp0E35yOG6byhlddhwYvq5MK+IDtqGeKJnEJalA2z2Wx+NGbil9mPeKnmJUkG
         cZnxdKzbGTxfyX8EHreA8vmpw05+cjl9Z1FPDaQugaRcvzH56+Z+PE2Lucy2IECNxee3
         hd2KHqy+4/EZWqBi2Klvb7Z82QDg41QiAC7d4oCHWKdyIO42/Abw/srmWhuMKIcosvNv
         a+jYxcOzwi6/nTdsOuL9OYXOKa6pII8b7KQHaw9/4Tv2GI1kUAhEKSCYaf8fSzCVvF7h
         yx1KtRJ7o/Qu+D2LOra7AIq8uOvjYRvkfgOyMDp2Rwr+EgdDekoY2IBygU/JTSJ1Hvtj
         02JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790165465; x=1790770265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        b=OxuZWshG81Pu7Q/R9zG6hbx+dwDw7NwyKM7czLs2lWaBn8/7gpC/FHK2oiCmmsjHMQ
         3fCDRnxSP6EEPQ6UF/eA7HxQiR401m7ejC8xcEaRF16egQQuwEkBLgc+KQQ32sqLZHYj
         O4Ac8xA2zyyCCBMOVRGJ+oNYUbeAd3e0L2nn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165465; x=1790770265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+sAs6/yZPqQPCCjoSh/yVQa4eqK/t0Brk5AQsTggYw=;
        b=WreYPuytG/FHLSNpVz61TSk5eeBM8PWMz7V/SAs7+D9yZjZVknsI8eqNyb99vOLbHM
         D9Xai3Txs/9H2KSvFe+IhtaD5eYFj1HHRSfgeTT9ZMGsFBfRswxHIcsx6apzAjIoorPR
         H8SpCbXr6MTd8HPM3OkrI2as64JhDz/3AzAGkho+ZNjjjz41IoBPdusmSxrQvxUIDtU3
         /EdCNgGy7DCbzGogYyE4xKwZJtFS6qtjGjfIyQoL+xjjZdx6mA1hmNc4a0Qzp9a4auY5
         QPS1R9V0fqL9lUCrTZB3nh4dSh2H2Pqvz1k2eWk+T9WRGIgjJrzzR/f7GYqu6KHGYcNV
         zblQ==
X-Forwarded-Encrypted: i=1; AKwUvByjBYjKVg/t4Qp+sXPgUcJMGOb/WyK4L3MvOwY6IykXZ/tiaH1ZSbObO3zV1PLfcajF1+DPh7CsIbyv@vger.kernel.org
X-Gm-Message-State: AFuF++lMijv0e/0iOvK8m8hXoxe5Oq4vnF9LHFL9WZnziJTLD6sX+t3P
	zEK9XxKsydTrxJn6kcVHEjGsHE/BqjBfiGi1yRzqSUPTThHoPkj1H6xShntV7QIK0YKdwKXqjV+
	PImCc88cxrbBOyFxubFnSj40WAwUYJTl4NaIzk6K1ng==
X-Gm-Gg: AYBFou2xUd8q1XBp2xTixMvks4U2zisBM7KaycvNl2+R4BudOxlWuPpasoXX/4tPn0w
	N58SvnrcPilj9muYXoGx09MTihSND71H1ErzFiKZCI75xNOu2+l5epXBpN9IQFUbHSkspXctp/Q
	h4U8kw+A/Y6JIRqApFIXqOvicLaCN/eh/pekppFdeAhMnMD0mCXWA5PUdw2rmXAkZJxqQhu2Pt5
	CU9j2sWVYjTi8+N+hwdagdwJJva9iMHGwEdpxAx08mpemsfg8lZ1DXKj9ZVg73g6g+Db+OYi/QZ
	L4VbDCMbgfzm3+r9pttCYblEJwqpQVX/Bx3kU5lTLfIed5OvquWJjXvbgnyZMa1bsbgpl57s/2Q
	TwHXEzU7h
X-Received: by 2002:a05:7300:c7c8:b0:315:9d54:6bf with SMTP id
 5a478bee46e88-33ea4d875damr2193402eec.10.1790165464415; Wed, 23 Sep 2026
 05:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
In-Reply-To: <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 23 Sep 2026 14:10:52 +0200
X-Gm-Features: AclHuK-84lPkb8p5nYwdkesZrMKYeKl0UBKC7sQ4h-YVRpCrvvaQQCitxdpuwrs
Message-ID: <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, May 22, 2026 at 4:55=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Paul,
>
> Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9cri=
t :
> > This series introduces support for the V4L2 H.264 stateless encode uAPI=
,
> > core and support in the hantro driver for the Verisilicon VC8000E.
> >
> > While this is a first version that will likely need some level of rewor=
k,
> > it is already usable for most common use-cases and supports constant
> > bitrate rate-control.
> >
> > A GStreamer tree can be used to test the series at:
> > https://github.com/paulkocialkowski/gstreamer/tree/v4l2codecs/h264enc
> > And an example pipeline would look like:
> > gst-launch-1.0 videotestsrc pattern=3Dsmpte num-buffers=3D25 ! video/x-=
raw,width=3D640,height=3D480 ! v4l2slh264enc rate-control=3Dcbr bitrate=3D8=
000000 qp-min=3D8 qp-max=3D42 ! h264parse ! matroskamux ! filesink location=
=3Dencode.mkv
> >
> > Note that documentation for the new uAPI is intentionally left out of
> > this series since it has not yet received approval.
>
> The unfortunate part is that the spec is important for the actual review =
and
> interops analyses. That omission qualify this submission as RFC from my p=
oint of
> view. Any chances you can reply to this cover filling the blank for the f=
ew
> important bit (something similar but non spec style of:
>
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-statel=
ess-decoder.html#initialization
>
> - Querying capabilities
> - Initialization
> - Encoding
> - Dynamic Resolution Changes**
>
> The other sections are just going to be the same imho. The ** for the DRC=
 is
> because H.264 is not that complicated, its intra only, so you can reset t=
he
> encoder (use the drain flow). So that's probably something for future us
> (VP9/AV1). Adding your view on these topics (or just matching what you ha=
ve
> implemented) will make review more constructive.
>
> cheers,
> Nicolas
>
> >
> > Marco Felsch (2):
> >   media: hantro: use hantro_decoded_buffer only for dst_vq
> >   arm64: dts: imx8mp: add VC8000E encoder node
> >
> > Paul Kocialkowski (12):
> >   media: h264: Add a more generic reflist builder init
> >   media: uapi: Add H.264 stateless encode support
> >   media: h264: Add SPS video definitions
> >   media: h264: Add stateless encode core
> >   media: h264: Add stateless encode rbsp
> >   media: h264: Add stateless encode reference management
> >   media: h264: Add stateless encode rate control
> >   media: verisilicon: Report default pixel coding for non-JPEG and fix =
JPEG case
> >   media: verisilicon: Cancel job with runtime pm put/clk disable on fai=
lure
> >   media: verisilicon: Add common encoder parm and frameintervals ioctls
> >   media: verisilicon: Add support for the VC8000E H.264 encoder
> >   media: verilisicon: imx8m: Add support for the VC8000E on i.MX8MP
> >
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   11 +
> >  drivers/media/platform/verisilicon/Kconfig    |    1 +
> >  drivers/media/platform/verisilicon/Makefile   |    2 +
> >  drivers/media/platform/verisilicon/hantro.h   |   17 +
> >  .../media/platform/verisilicon/hantro_drv.c   |  180 +-
> >  .../media/platform/verisilicon/hantro_h264.c  |    6 +-
> >  .../media/platform/verisilicon/hantro_hw.h    |   28 +
> >  .../media/platform/verisilicon/hantro_v4l2.c  |  123 +-
> >  .../platform/verisilicon/hantro_vc8000e.c     |   68 +
> >  .../verisilicon/hantro_vc8000e_h264_enc.c     |  883 +++++++
> >  .../verisilicon/hantro_vc8000e_regs.h         | 2129 +++++++++++++++++
> >  .../media/platform/verisilicon/imx8m_vpu_hw.c |  113 +
> >  drivers/media/v4l2-core/Kconfig               |    4 +
> >  drivers/media/v4l2-core/Makefile              |    2 +
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     |   62 +
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    4 +
> >  drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c  | 1173 +++++++++
> >  drivers/media/v4l2-core/v4l2-h264-enc-rc.c    |  558 +++++
> >  drivers/media/v4l2-core/v4l2-h264-enc.c       | 1322 ++++++++++
> >  drivers/media/v4l2-core/v4l2-h264.c           |   69 +
> >  include/media/v4l2-ctrls.h                    |    2 +
> >  include/media/v4l2-h264-enc-rbsp.h            |   72 +
> >  include/media/v4l2-h264-enc-rc.h              |  108 +
> >  include/media/v4l2-h264-enc.h                 |  135 ++
> >  include/media/v4l2-h264.h                     |  146 ++
> >  include/uapi/linux/v4l2-controls.h            |   33 +
> >  include/uapi/linux/videodev2.h                |    1 +
> >  27 files changed, 7231 insertions(+), 21 deletions(-)
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e.c
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_h=
264_enc.c
> >  create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_r=
egs.h
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rc.c
> >  create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc.c
> >  create mode 100644 include/media/v4l2-h264-enc-rbsp.h
> >  create mode 100644 include/media/v4l2-h264-enc-rc.h
> >  create mode 100644 include/media/v4l2-h264-enc.h

I tested on px30 and achieved working H.264 encoding with some small change=
s

Michael
