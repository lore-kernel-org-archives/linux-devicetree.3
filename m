Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792507833;
	b=Jndn4Q7lKelX1dLeRhhs3bV2ZLB8/OTn9UHYMpH2UygA8gr/kP/lhqd2Qii0ZawJQjWe
	 uXH8c9EdXk9mGP5vb9IN4tCKCTCX2jJNuQdsy46/cwzs8mFhsZ43dnHyvky0z4jabzD+N
	 FKSr8Mm3h1oADpGRS7kVYDGpOlyETVRPIzzxfAfHHcN6l+30s6PjxCK1cmaK3Fl8MnIGA
	 l4keTY9XDz9n5nUxMT0vun3ly++1HL66Po4YsNTNrjZNHgUZBfRRUb38ZL98uiGPQq470
	 h6Qe7aK/YTaCLcy/t5fFxEMJ2xHg45WlL59saKbZ/n11Txg+RhpdpJOqBPjP7Q/IR9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wlkmGnexwUZqrSR6Z2ocUUR37fT6HoJKzxvPZMwVYqk=;
	b=OoUxYCQ34gREpm3axnuhZbzzSfc1uIyJidl8b7+L8Vz5H6OMYT31DXUkOLnXUBskN/MQ
	 jEwS0iub5MfkYYilvwjIGCMvK7A8zU+iCcY57wColCNmf1AGddPxHNITy/FvketBSfTLy
	 MOgZB4dg87Ci7MTI4ndBCJaEyC63RsaYK/nCQA9islvtH5g+xW1tvEHo5FugZVTBRClKh
	 O/KEPfwkjay/a1ZN0sDz0VdNMDHJfoPIj5KH/JbvtNwgAokap7ZFZCV631MMXjR82fhYT
	 q8Vo4RIr6RtnxhXO/MreU4mKFR06/ipQvUuREsjGZMylaA4pIpgk34l0hAAYSyNjpbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=DmCj1Mhl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36E6606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36E6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=DmCj1Mhl
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-43bf9548df4so2976059fac.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792507826; cv=none;
        d=google.com; s=arc-20260327;
        b=NKIZ+0qiBfHmj5+yQcbXZB1H4Chw0vTN3vlygc4Nfb3BqpmL4BqOif2PxlZJ9+VLXF
         BhFhD9CmPGerriyFxQumRVCNHzP+pxR2amZlVnMkMfR1fPZfn5AiWOFS0DaW8TL7epyg
         KMmn5ICeisPXgQNYnUAU3oZg6kbbvyCb6WI+nqnvj08airIoVeW9sLVv+4s9WwWPPoOl
         ZsKIbfKY0vLsp05wKPh+c+eRxbCf2STdXeulS7/1vRtgcenu4z8v2ha/ODNdy1MKOEGq
         rDG2KbjSNTUYqwFI7NpKJ7rYhWnNNYrSTJDE/WLTX7lCZ42OapbfLsjdTh/JipF1oTg0
         VWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wlkmGnexwUZqrSR6Z2ocUUR37fT6HoJKzxvPZMwVYqk=;
        fh=wAPJ65wEFzCVdSbrdanQDsqgMg9izpYrX316rPpmQ0s=;
        b=NF1tVQxAaSuOlmasy9v3kYt9UzR88M25lUZXtnVC1WIK2h2E83RoPO756wsMjOdGFJ
         9GWQT24/1UTQRzGI/nq/AY0mgqVvUScmX6cV+HKD5Cg2hmUZPyUgCzRh62fF9vUM92pS
         ujZ9HaxNHp19XAvReNqrHJRdh+cG2EQJj5VGtvF7YYQLT7tg4vpsACq++ecjZn34u61R
         GazhILuGFIiq+MIdkJO2xlwK/CuwACXwM4LLivKUpMPr1cCm+R6rtJrK9+NicJffWp7C
         dSlYNM2BLOzC4oOeWqoKkKYEQU95mFajJEkALF2G8MiUUzpMrJZ0wYqsbfxDTMpWNoIV
         q7dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792507826; x=1793112626; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlkmGnexwUZqrSR6Z2ocUUR37fT6HoJKzxvPZMwVYqk=;
        b=DmCj1Mhln3zqO7y9erOlJM2Ywiu68q+JoJR/UR+crGO3/NhfvsvVsgGuvpXgKc+kUn
         p97Q+8zY/X0ls6r2ZJh+tYeJZ4CALYBE6akJTIIXLqsLg6WvmQd5HTOWcVkJhiaZRfLq
         lsYN2bSBEzuUvSk0s5Au3PVY9RgCxU6hrqOd83QM3rpUqbZX3NmfwvUV7odJZTfxtEFK
         3L+joEWHomj/v9GTLz8IJ8DkwwZ6Qc4ID7hctC6IBEXQUkd4H0/wIUi5SouTDnOFMNhV
         SYcpBNXsfPiN1/2FvWA2CB3lvq0h3UmKTkJLEsTtQ1oEiKaNiEyer0LDDRbnDPXlYc4s
         BcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507826; x=1793112626;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wlkmGnexwUZqrSR6Z2ocUUR37fT6HoJKzxvPZMwVYqk=;
        b=OFQKmIGkc25Aj3SHpKkrWs0+ga/KKrYN8bXr3UmLh43zaaQGhHmtv40Zt/O+gvcNi0
         BLx3Hu3jueDNSn/97SzQCe+ylBiV86bpElbguma5tRqQNEhqPU3xkb6Km+fXy1m+YCkW
         Rjrj0kNqo4BZulKlweSH12sPEkjb/EFvYhV8E2vTftObXVKicdkd0vgVSyawdhfxQyMc
         pd4GxecIbdsS+6qjZIaVaYgenlGOKpgemd12b1BqEoA9TzsBRrCvhKmUONYWSPx65Ib6
         hxuwRl/xqZrFhkWLkt510XwZLk9sfhyZHdLoScEYwZwGgBGiruaHP9NOpXO3NR08tVxV
         gPQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfm9/XHjmU4huis6XnEz+IxoZpa98/27NspwrekVLT3lXdnyNHjB2fToNdNJcZILZvDHCnKF0ZBJGq@vger.kernel.org
X-Gm-Message-State: AFq9FYJBInGIrisQu2S9JvQsp0djafFPT6bUtCztNLeRkyruRM2wZYGi
	/PQ+heXB/Q5v2F1So8LdFzfyaQHiK+Gc/6VY4bkJyHPIk7Hov415PwBUw6roo8pqOk5b8WCQXJJ
	0B9zOfUFxZZEzLNwpZTbSkwQSKGyExTUXQsdf+v2BSg==
X-Gm-Gg: AYBFou35Ic9snWXIhPGIa/wGEKhaKWXlIb0nfMaxpauAFpoG0IvQhKjW+1MIgpIU+EZ
	oBaYsILrUc/Sm9uYnBdbZr8Gzk/sQf7eYZmfj6UAUPhAM+lRLxewxmAuq6axy134YD6PzVtynon
	CaIEX2NXnphFDCOlVg2hB0C9Kba2okYeq1p2xyx/mFQFnk367SJAILksMS0gWMNm0UnkcQ+JSRA
	LEuAVBpYd44Z3bXKJEiU3zvCp4LjgPnd2Zz3qtTwThwNj1mhtEQr841kh92WhGHQs67U6pkI5VD
	Uj4rVGuJgj030CDsdDip4xvPqaSyMuJGJtDNU3hreTvaHbKZ+MUFZQDV65SW8hPIWi20j7Xp8Ob
	EtjHkQaikt5A5xsoy3x5rZuufLQylCb+xEhTjzA1eq9ctOwdvZMzwXToId8VW3XWkcPbaDhFvaK
	gDdrnOH/4=
X-Received: by 2002:a05:6870:b3e2:b0:4a7:424b:934 with SMTP id
 586e51a60fabf-4a75789dac0mr9577479fac.12.1792507826447; Tue, 20 Oct 2026
 07:50:26 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-3-lachlan.michael@sony.com> <atdGr8S2sf1kZFUw@kekkonen.localdomain>
 <20261020125630.GA158670@killaraus.ideasonboard.com>
In-Reply-To: <20261020125630.GA158670@killaraus.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 20 Oct 2026 15:50:09 +0100
X-Gm-Features: AclHuK9jchI3nSC4JyaTIAm_0oNifQyoET0OAG28wvGpwbLI8WQ-9SbVDsLY7f0
Message-ID: <CAPY8ntBUncMWB2DqFG+iS9gFgW2aaeyMrD6x-c_4Da7rJDv6Mg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add Sony IMX908 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, kieran.bingham@ideasonboard.com, 
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, 
	Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari and Laurent

On Tue, 20 Oct 2026 at 13:56, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Sakari,
>
> On Tue, Oct 20, 2026 at 01:47:11PM +0300, Sakari Ailus wrote:
> > On Mon, Oct 19, 2026 at 10:47:20AM +0900, Lachlan Michael wrote:
> > > The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
> > > output interface. The driver supports RAW10 and RAW12 output formats,
> > > exposure and analogue gain controls, image flipping, blanking controls
> > > and test pattern generation.
> >
> > The imx908 appears to be a Starvis 3 sensor. How close is it to the Starvis
> > 2, for which Dave (Cc'd) is working on a driver (see
> > <URL:https://lore.kernel.org/linux-media/atdAsDGw_jvhaydM@kekkonen.localdomain/T/#m0c50ea017ef9ae0d3d76a36b840db9b6f7ac296c>)?
> > The register defines in the two drivers appear to be quite well aligned.

Asked and answered at v1
https://lore.kernel.org/linux-media/TY6PR01MB17839FF48671E744E7E23A93E92D42@TY6PR01MB17839.jpnprd01.prod.outlook.com/

> The current version of the driver implements very few features of the
> IMX908 sensor, as crop support has been removed pending the raw camera
> sensor model, and Clear HDR3 is being developed. I expect more
> differences to appear when those features will be merged, so I believe
> it makes sense to have a separate driver here.
>
> In the future, I expect the raw camera sensor model to open the door to
> more code sharing and more drivers supporting a wider variety of
> devices. We can decide then if the imx908 should stay a standalone
> driver, support other sensors as well, possibly across the Starvis 2 and
> 3 families. I'm willing to help with the refactoring at that point if
> needed, the maintenance burden won't be on you (and I'm sure that
> Lachlan and his team will of course maintain the code base).

Agreed.
I have compared the datasheet for imx908 against the Starvis2 ones,
and when we start looking at HDR modes they diverge a reasonable
amount.

Even the later Starvis2 sensors (IMX585 and IMX676) have minor changes
to the earlier ones, so adding Starvis3 would need some care.

  Dave
