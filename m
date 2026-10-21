Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792585739;
	b=AGjuphntTKDl5GERcpRqN9tsoQ1yuqWL0lnuuNzI9MIhCxcybKTvObPu0EF6AJpB7c7e
	 VzfF9ued3k66toPqGYJedBzj4QWjnudBi80EuXCS1vn3mZZumb6Y1sB6xMLbgHTyxs8s4
	 13XX+ZtvFsaKeFwDVaMG3BPZj2iIDoiN6FDdOIvzbUuq5VJ4qJ33xBDIDtROSujC4/pzJ
	 ApMcXuxUy4eh9LvNem3sUNRSyvqaojN4boaZq80I53ehLCIuSbyjXmBJceHMIVQtyPD0M
	 +ns4vrFqTSeY94Ssav1FuOEBfvez3+yKzN2pSe5wiElTGC/z65XXvXLjMt7tGrv9t2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=g4O8khcTpJs61vFbjSBcX9Y11r4LD3txGBsj73SOpGc=;
	b=2vPiakPH3+sNH0W7TE1LEBGpnEpbt8xOYDoWbZCbYLatkEs9wFfBS9+VXWWWhlt8kwnG
	 l8N7iINwH/u7BK0+ufaAbAVolQRYW6qZJl8DJU9/IrYYlxNRIkAyzJtb7yE8YL2Xp2C7T
	 wo0blwIYcRscCScvqcuQ2eNAimvkZQXfNXWE74zckB+ATS44h+/ratJAOmnrdNjE7G6Pb
	 pVY9kHmZEjRxma6TM6QCPKyXgT0ggO3mUGtCunT19QSVj5Opk/kv8VG8/e1sHyCeLBnKs
	 1qP/NdbShC/IgqZYBE1H1rYyByNb/pEDcms7ybefeWNZ1amYjfOU3rScw+RwW307mXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=iWHcQh1I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3515E606A325
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3515E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=iWHcQh1I
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-539a57a0b1fso234135b6e.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792585737; cv=none;
        d=google.com; s=arc-20260327;
        b=OuF2L6AB+A1xQgJRC6l3PdNMLAf6C7Z3TeigsZfRBkF4Mrvkwv+dvRxs43aZ5LFlW2
         cC0M/e0m10gdCngHK8OKeS4n/6SDmnmMwnKabVL+o2/iC871D9nKSATHTBxBsPdjyFKJ
         JYJMDAhIoAyriUcw71L/8dAWFh3fC6taJmde2XMUdtJsRtxNMVfFKdI16H6SIF/WmlUq
         cBjM6/EJwgMXaxIDyXVSWavQ+ezQ/cJHTiGCwnf9lKWTEygla2hBAy+yMdKVx9MfL6Bx
         +ZmNqMIHwzzmOnZ/2ijYE7n4AiT6FBArpTHlTvyf3LI5mBEk/DHXvHh0qFSkl6ogHV7B
         3t7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g4O8khcTpJs61vFbjSBcX9Y11r4LD3txGBsj73SOpGc=;
        fh=EhVyRNMgftudRIyjC3LVCnTrpf+Cuj8P6cw3tAkELzU=;
        b=GlnLAbW2mE8AxxJ8vug7ClPPUZZ80CPz41TuYRFcuGmllIrdGXIgsBByCOJ3rjDiOb
         f5shvNkcOvK60XENLVT6DEu/LiZOtlwLFRduB7Lm1QsJmbqYMWdb1NwaADSV4X/LeTkB
         DMo4jBveq0naQmdCtvbj35dopoaRY8BWqG9rm/+hIJkArpjvar/6fz6+QqEHIKR4plpw
         v141gSId57IOytUrSlf+yRpRUO+DYtXH7TCkspEtNov1Ah1ccJVdEcwfLZ2ElmUaaG3Y
         wY3NhG3O0edxufaEyEgwTpn3NYl5DA0y3fhvWBNRk5E7tF2GnC6Zm70CDPnGtE97V/4e
         ccSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792585737; x=1793190537; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4O8khcTpJs61vFbjSBcX9Y11r4LD3txGBsj73SOpGc=;
        b=iWHcQh1IkvrgBrClBwmWfgr3B+2jRDqd4IWd9LwEJb7K6SmshP2PV5Dtkw2GLp2RD+
         qTbDBnMJMqbsHCqqFkxeL7vW6geii9ppcHt9EJkuN9x5MSobo+B8s/EwhXIddAPdt2WV
         KWwJbtYMAZQOhR+FIwn+9bdedWylxmkzE8oOGmRaeFhFXzKH0tE2nqh7akNsDXWcuTxZ
         kn59h2zGgB+OCgK2stCKv3ItGkY8c9vQqi2mtF18p5r6oWawRhg0jL3Yeer3yoGNEITc
         CMgm5HRAmDhAwNULU2HsjXbMPbPZISDpQVFnGj4XekNiPJX3zJzcYMPKGPk1u+OaKJp2
         PIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585737; x=1793190537;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g4O8khcTpJs61vFbjSBcX9Y11r4LD3txGBsj73SOpGc=;
        b=jdH3FMs6+A0AuQAeWu41wJTgq6JQ75T8+8XhOkzr90kRYEr8OUBNscb7+9UeY5G6t+
         TP9zjfwXhbwMaRvVZjImz4RVW03GAQribUMsS3Xg75dWk1hrBC0eqHq7ktfW4n9yK9NK
         t1EbsFQMJM9I4IM98qIWR9jaDXMMDnEYtwybJJWEThZNVUSadNo1h47dxB2IrbIRsUc9
         Oa5bTfepJEfSe8tHFWR8ik9e94eQkLXq00j8rSqEYnzdAHNQTSgUyFi53fDk76CElk0z
         xHNk2yhpVQTXZhOYtDo94bQZg1042Nos6yOzOutrqlO5lhvWDK7uZ32AKxm8dWinmEX/
         znEw==
X-Forwarded-Encrypted: i=1; AKwUvBz+Jj4KshsquPilIRCLhPhFFfqrBVdRpNLTuKrIps0f9iYx9TrWjMKBQoGoRi4La+8TSzvHrgzdzBS+@vger.kernel.org
X-Gm-Message-State: AFq9FYIx/0wuhcXSEk5Wa6IF68qbfxNYjLc+VKVV8GLIjRgvNVjhycHU
	2/UJzsRY0tVP10DuJrk3wCMntE0TiPT+3WxdWZ4yH+CnfDTXiHuXUkYuKjUl158I7WSilcgW+ts
	1IeY+j6wrx60rPwzbFzN3+DLBBsxqHk6g0yIRBbkbWg==
X-Gm-Gg: AYBFou3Xwh2BojfsXHQAmxuejbrzUADX3Qfy1aTnXUG1gNLGK1k1B3CDthjpkOmcm1J
	TOmNj99a1hwQG+d00DxUwh/N8saoc+O1ZssAi5a0RRaFAdvyGfLxo6KYTBajsgOJljXduJ8DSo4
	c7EzsyevOsD3rjdtwxvtMg7ERFawIXUNLoKdgue47WLJYPMRTbbPbdMrRoAdhj6pGZVfjqlvxGs
	A3JWnJZECT0KRsaB2E5MPJDtlV8sU9V/X0kI2Ur1aWil2vyRcgka2vKjZSS9tNi9Fj95P+QVCVJ
	HeOaSDoWuMlP7ATcfD2mk+yDaJTlDzdlucxZA3q9xxFV+Ium7N39Z27FlSo30DGmGqzk9KqH4K8
	p/gV3YF5uEuwgjp9rrKgU+6JjQU83I2i4yCwkwp8YZ452hCzH+yYs91TBVXEIwOWAY1kPSHDaTC
	engLfp6fqqYHRIh5aySWET4Myf9rQSFDKccZorOR64Db/TaL7cW2BM4Q==
X-Received: by 2002:a05:6808:4482:b0:4d3:9029:5ab3 with SMTP id
 5614622812f47-553585760c1mr1050030b6e.35.1792585737133; Wed, 21 Oct 2026
 05:28:57 -0700 (PDT)
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
 <20261020125630.GA158670@killaraus.ideasonboard.com> <CAPY8ntBUncMWB2DqFG+iS9gFgW2aaeyMrD6x-c_4Da7rJDv6Mg@mail.gmail.com>
 <atiogo14sCFw4xlT@kekkonen.localdomain> <20261021120521.GA273922@killaraus.ideasonboard.com>
In-Reply-To: <20261021120521.GA273922@killaraus.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 21 Oct 2026 13:28:40 +0100
X-Gm-Features: AclHuK9hqxcMJ0HhysTs5L34pzu1OSW612PUOHHd1l1X6LjoVQ847rGG4xISb-Q
Message-ID: <CAPY8ntB6bbdX+3drOjubV4dNAxxKgNmHoE+uZ_1JmQ2-Y+ocbg@mail.gmail.com>
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

Hi Sakari (and Laurent)

On Wed, 21 Oct 2026 at 13:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Oct 21, 2026 at 02:56:50PM +0300, Sakari Ailus wrote:
> > On Tue, Oct 20, 2026 at 03:50:09PM +0100, Dave Stevenson wrote:
> > > On Tue, 20 Oct 2026 at 13:56, Laurent Pinchart wrote:
> > > > On Tue, Oct 20, 2026 at 01:47:11PM +0300, Sakari Ailus wrote:
> > > > > On Mon, Oct 19, 2026 at 10:47:20AM +0900, Lachlan Michael wrote:
> > > > > > The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
> > > > > > output interface. The driver supports RAW10 and RAW12 output formats,
> > > > > > exposure and analogue gain controls, image flipping, blanking controls
> > > > > > and test pattern generation.
> > > > >
> > > > > The imx908 appears to be a Starvis 3 sensor. How close is it to the Starvis
> > > > > 2, for which Dave (Cc'd) is working on a driver (see
> > > > > <URL:https://lore.kernel.org/linux-media/atdAsDGw_jvhaydM@kekkonen.localdomain/T/#m0c50ea017ef9ae0d3d76a36b840db9b6f7ac296c>)?
> > > > > The register defines in the two drivers appear to be quite well aligned.
> > >
> > > Asked and answered at v1
> > > https://lore.kernel.org/linux-media/TY6PR01MB17839FF48671E744E7E23A93E92D42@TY6PR01MB17839.jpnprd01.prod.outlook.com/
> > >
> > > > The current version of the driver implements very few features of the
> > > > IMX908 sensor, as crop support has been removed pending the raw camera
> > > > sensor model, and Clear HDR3 is being developed. I expect more
> > > > differences to appear when those features will be merged, so I believe
> > > > it makes sense to have a separate driver here.
> > > >
> > > > In the future, I expect the raw camera sensor model to open the door to
> > > > more code sharing and more drivers supporting a wider variety of
> > > > devices. We can decide then if the imx908 should stay a standalone
> > > > driver, support other sensors as well, possibly across the Starvis 2 and
> > > > 3 families. I'm willing to help with the refactoring at that point if
> > > > needed, the maintenance burden won't be on you (and I'm sure that
> > > > Lachlan and his team will of course maintain the code base).
> > >
> > > Agreed.
> > > I have compared the datasheet for imx908 against the Starvis2 ones,
> > > and when we start looking at HDR modes they diverge a reasonable
> > > amount.
> > >
> > > Even the later Starvis2 sensors (IMX585 and IMX676) have minor changes
> > > to the earlier ones, so adding Starvis3 would need some care.
> >
> > There's quite a bit of this in the CCS driver, due to the variance it
> > allows for implementors. I don't see this being a problem as long as the
> > foundations are reasonably similar, albeit we can see whether this could be
> > further extended later on to other sensors.
> >
> > I'm fine with having a separate imx908 driver for now. Dave's driver also
> > exposes the variant information through the media entity name so that
> > should be done by the imx908, too (at least if there can be multiple ones).

No it doesn't. My driver passes .name from the variant to
v4l2_i2c_subdev_set_name, so the media entity name is common for both
mono and colour variants.
It's the same with the imx290 driver supporting the different variants
of 290/327/462.

libcamera uses the media bus codes to determine whether the sensor is
mono or colour, not the entity name.
Having different entity names would mean duplicate entries in
libcamera's sensor_properties, or otherwise manipulate the name.

  Dave

> As far as I understand, the IMX908 does not have a mono version.
> Lachlan, could you please confirm that ?
>
> > I'll review the driver properly soonish but I reckon it's in a pretty good
> > shape already.
>
> --
> Regards,
>
> Laurent Pinchart
