Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540724;
	b=JI2Edd2uyJ7X1jVT+N4vEBsQEaAOuPMBhuDqRyyZI2HhE2lwFiDYRFKVDtbwv6rXH6sn
	 U4Jz33mSsapecWIEKNOCa7zFP7ouKjgjFssD6JKn9hM6Zqd/xpcZf4fvOgBx7tccqXsOW
	 GQvENyg+rgk7TvBVOHUV+ofZi/UnOhU+PXCZbzksBM1+Sa9GJK3fJqLbaNIYw+RVtZ0Hg
	 siB7QFsRxYD51U2vyrATrTqy97v+h2SekzHMcPJEOAkvD2vzf1TlvIZ0xKxRj5h6IMxoa
	 P4YUhgBalmEEjSbKXsUk+CPmYOUkDpVzYzBoWo4VzrYBFisA2HiQ4mN2fdbn8RpQepQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540724;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Last-TLS-Session-Version;
	bh=MMIveEgZcxzjxz6ZQiv/+4zr63avK8Y8JIemnxMuPEU=;
	b=lqPBE8vetJ5APL2a8WEKp9h60m3Ho27WThy1tsDhkF/yFZjl8UMXEqbyhuAnHOfz1BD1
	 Ks3lUsd7RpJiC0WQOhyPadTLNdNlE+e0fGTidEqpOAGGh8VPK3tZagh5vfAx0boqNVjh8
	 lZFGUvMdaaQ7eq9SsNjlkiZcrD+MAR4fufFZFqmD21o2U13NiBuEdQp602Ir6Vq9f0rIw
	 7QvZMevwJMzABhemTVopInSUU1GISfpGLTkbE1vq7h8UhphzfAYRtNuvWq7otrG2Q7ZAW
	 r3FNX+L7E15BcMFuHisQPMY+ks5v4IQFs21+DMFIhz7f/4Ul+/5BWnrdfZSOXn8RD2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=g+54x+pL;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B26D606A321;
	Tue, 24 Nov 2026 17:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B26D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=g+54x+pL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43DEBC2C65F;
	Tue, 24 Nov 2026 17:18:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B4E7601E1;
	Tue, 24 Nov 2026 17:18:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F64211E69AC2;
	Tue, 24 Nov 2026 18:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795540717; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MMIveEgZcxzjxz6ZQiv/+4zr63avK8Y8JIemnxMuPEU=;
	b=g+54x+pLU5Kc2m40alhMaVRIENF1mgYNwpY79Wr/hIkUVfH+6KcxX042P/N7vI3ZCrXQqX
	cYHmmzcrNhi+W0dZqmqEUgBvYr9/fuq5j+inrTYwA6DcNo09xgx1XmHjalE/+PCrBWJEyZ
	j5DKjgo4ZSJIql7gm2ZokKvKKEEZm0HeKhDDWDX9AHr1r0fubD5FZibQ0tt9dVmRYPd9Jf
	jFDN2GIIN+I0MPPul+TJs7I/VKkQ89JfMGb3h5uQSCmY0enkaucsyfdDToglMov2VdE3Iq
	r+2Mu+QbFeLnZ/WHPeTkSIOMEyWaW8fraPv+FHvSYkSfVPjk5f23Gs9RqtwDng==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yuti Amonkar <yamonkar@cadence.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>,
 Abhash Kumar Jha <a-kumar2@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Swapnil Jakhade <sjakhade@cadence.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 4/4] phy: cadence-torrent: rewrite Torrent PHY driver
Date: Tue, 24 Nov 2026 18:18:24 +0100
Message-ID: <22sq13shQmSOkQPF53jaXw@bootlin.com>
In-Reply-To: <20261121-artichoke-sturgeon-of-karma-a7c4e5@quoll>
References:
 <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
 <20261120-phy-cadence-torrent-ng-v1-4-da2db7125cd7@bootlin.com>
 <20261121-artichoke-sturgeon-of-karma-a7c4e5@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Saturday, November 21, 2026 at 5:16=E2=80=AFPM, Krzysztof Kozlowski wrot=
e:
> On Fri, Nov 20, 2026 at 01:55:52PM +0100, Benjamin Robin wrote:
> > The Cadence Torrent PHY (sd0801) is a multi-protocol SerDes used in
> > several SoCs, among them the Texas Instruments J72xx family. Its
> > programming depends on many parameters: the selected protocol (each
> > associated PLL has to be set to a different frequency), the DisplayPort
> > bit rate, the reference clock frequency, whether spread-spectrum
> > clocking (SSC) is enabled, the number of lanes, and the PHY revision
> > and technology (process node).
> >=20
> > The current phy-cadence-torrent driver hard-codes, for every supported
> > configuration, the set of register values to program. Because this
> > configuration space is large, adding a new board or a new combination
> > of standards requires duplicating dozens of opaque register values,
> > which is inflexible and hard to maintain.
> >=20
> > This new driver version computes the register values instead:
> >=20
> >   - registers that depend on the reference clock frequency or on a PLL
> >     frequency are computed at run time, from the reference clock
> >     obtained through the clock framework and from the PLL frequency
> >     derived from the selected standard;
> >   - the other registers, which only depend on the standard type, the
> >     PHY revision and the technology, are handled by one function per
> >     register, using an internal table selected through a
> >     standard/revision/technology key.
> >=20
> > The PHY revision and technology are detected automatically from the
> > PHY identification registers, and the DisplayPort link initialization
> > and rate reconfiguration have been rewritten.
> >=20
> > Compared with the existing driver, this rewrite provides:
>=20
> 10k lines patch!

I was expecting this kind of feedback, which is why the cover letter says:

  Because this is a complete rewrite, the diff is large and not well
  suited to a line-by-line review. The rewritten driver can be fetched
  from the phy-cadence-torrent branch at https://github.com/benjarobin/linux

To give more context: the new driver was written from scratch, in a new
empty file, although a very small part of the old driver was copied over.
I initially considered adding the new driver to staging, but after internal
discussion we decided against it.

>=20
> No, instead improve the driver instead of doing bunch of significant
> changes like:
>=20
> > -#define MAX_NUM_LANES		4
> > +#define MAX_NUM_LANES		8

Regarding incremental changes: I could try to build a series of smaller
steps from the old driver towards the new one. That comes at an
additional "cost", since intermediate patches would fix functions or
how there are called, that a later patch then removes or replaces.

However, even with such a series, the core transformation remains: one
patch replacing all the tables with per-register functions computing the
values. That patch alone removes roughly 3k lines and adds 2.5k lines,
which cannot really be split further.

So, I am going to try to create an incremental series: many "small" patches
converging towards the new implementation, with one unavoidable large patch.

With this additional context, could you confirm whether you would
prefer the series split into smaller patches?

>=20
> This is absolutely unreviewable.


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



