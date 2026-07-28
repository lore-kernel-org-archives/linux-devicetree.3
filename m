Received: from out28-147.mail.aliyun.com (out28-147.mail.aliyun.com [115.124.28.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9CA41DE00
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233144; cv=none; b=ZBpmO/cJz9PTjJINRNOmfAVBIc1DVl8b3cBZvDT5jaPkb4nYVv0SQrCLktlZFzQsGRg/YarEVewaxi49bOpJPyzCja0neNeRh7lwqGU9dVtSangIffTXi9zmYRl5kiAqwlSCCpV8OLNhQaHPiqbcpOuZs8x9AIsG8xXIw9ZPrcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233144; c=relaxed/simple;
	bh=fT68u8sSrv8oS3L+4o0Lmx18m+dMySIhxsU32rr41Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPds8/G3bB65BGOx4Zpo5RWADSr0QC8MD4PtB/iwGDY+thawLRkha8jyfa8i0p0EHjvYCpvke57EDpZoXJgPTu2HhrNMUkOE18Y8pBQFgXKbEoOcz6GNtYyJGIfIj3pX4hoiGNt990WJ1owJxrN82DR6D5w8uB60tfzu8dIy7sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=NsoQhH14; arc=none smtp.client-ip=115.124.28.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="NsoQhH14"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1785233134; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=bBH0cL6G6qap42QvvVNvtCdPPQMC/xd8/rQDEJIsUyo=;
	b=NsoQhH14xoC4t8FDP+Jq3Dbsqi/mNoF/xVN60HkOXXwpPIkhceURvPnrAAax47j9C9UTxx27CwkoCv1W8Wq2Ze/T/Im0HT4U3ZNJfOm5xIkoiw6jod6eYe3UhUc8szhtr284dO9NvE4cPgF2b3U50rktOrTlNfGFOr7ZJdQ7IZG+c3TYOSebOHfcV3qQOwB78liJNnYDJ0Oa1fhsRrlMk6OIquEI/N3WrcqQlcfFp2jQ9MFCa1CkWYCpywD0yUPoAb/vZ6CbredtkISofgVjDbkVAmyt3FbBu9V4T9leITVbHnGCzesvEZvgSBb6N5tXqMJ8MU+JKgMmZEuIEb7UZg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.09451956|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0493304-0.000723678-0.949946;FP=3202147417340437341|5|1|6|0|-1|-1|-1;HT=maildocker-contentspam033037017159;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.iXKP8OB_1785233131;
Received: from mail-oi1-f174.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.iXKP8OB_1785233131 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 28 Jul 2026 18:05:32 +0800
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a483a552efso1561122b6e.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:05:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqu1j9x+GWn+P6zWJjF8bHKrNutcGOBdgXAGkNp/oQXPnSDZiihHoad6ZPuJ8TrQBfFApxi8N8UlY82@vger.kernel.org
X-Gm-Message-State: AOJu0YyZn2x6Lgb/1JKjxt4zwJ+Xc+KbWgUhqq8KmbgyaPO0Vzq/zk5s
	8NgbS3KW/iLo3o0LAde/GsTwF0uNOTpQk51W5F1byhw/U4zVLdkBpvEL1pGucIe6LeFxvWFpq9K
	Itq73lRL3aUmUfgz50zsq/DSqnyaWls0=
X-Received: by 2002:a05:6808:2211:b0:4a4:2424:eb23 with SMTP id
 5614622812f47-4ad5bb23138mr1059928b6e.27.1785233130334; Tue, 28 Jul 2026
 03:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715015438.2770155-1-syyang@lontium.com> <tfkg2cjn4uznzy57rpkqwan26sduqzptnb7uwsucfboz37wz7k@rukuu36mozif>
 <CAFQXuNazLnXOr+qRug4De8W3U932aG9LVRVWgkHAE=ALSQ+ZGA@mail.gmail.com> <waw7uhdebjavtcdgcgvrdhos3vcervc3b6ggooj2zgkd6yq47v@kkzdagga6hoj>
In-Reply-To: <waw7uhdebjavtcdgcgvrdhos3vcervc3b6ggooj2zgkd6yq47v@kkzdagga6hoj>
From: Sunyun Yang <syyang@lontium.com>
Date: Tue, 28 Jul 2026 18:05:18 +0800
X-Gmail-Original-Message-ID: <CAFQXuNZGLkdcWe-nFhzV_1D83he26sxSGpW06aa=4wOD1vqufg@mail.gmail.com>
X-Gm-Features: AUfX_mywJFi7PauVGw8ltpx0PR28MU_m9SRfrVypOLPLzksh8-UysZnr9i1qcw8
Message-ID: <CAFQXuNZGLkdcWe-nFhzV_1D83he26sxSGpW06aa=4wOD1vqufg@mail.gmail.com>
Subject: Re: [PATCH v17 0/2] Add Lontium LT7911EXC eDP to MIPI DSI bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com, qdchen@lontium.com, llzhang@lontium.com, 
	hfxia@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
7=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 17:46=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jul 28, 2026 at 09:56:11AM +0800, Sunyun Yang wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B47=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 09:22=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Wed, Jul 15, 2026 at 09:54:36AM +0800, syyang@lontium.com wrote:
> > > > From: Sunyun Yang <syyang@lontium.com>
> > > >
> > > > The LT7911EXC is an I2C-controlled bridge that receives eDP1.4
> > > > and output mipi dsi. This series introduces:
> > > >
> > > > - A device tree binding YAML file describing the hardware
> > > > - A new DRM bridge driver implementing the basic functionality
> > > >
> > > > Signed-off-by: Sunyun Yang<syyang@lontium.com>
> > > > ---
> > > > Change in v17:
> > > > - dt-binding:
> > > > - drm/bridge:
> > > >  1. [High] devm leak and list corruption on panel rebind           =
                                       [sashiko-bot]
> > > >            False positive. The -EBUSY guard at the top of host_atta=
ch() (line 527) rejects re-attach
> > > >            when output_bridge is already set, so neither devm_drm_o=
f_get_bridge() nor drm_bridge_add()
> > > >            is reached on panel rebind.
> > >
> > > This is not a changelog. Don't mix replies, with the changes in the
> > > patches.
> > >
> > In the driver code, when I reply to the issues raised by the AI bot,
> > the AI bot does not respond to me.
> > In subsequent submissions, can I simply not reply to the AI bot's
> > questions and only modify the issues that are useful for the driver?
>
> AI is a _bot_. Talk to people. You should reply to the bot directly as
> that's what the reviewers will see and consider.
>

Thank you for the guidance, Dmitry. I will follow this rule in future
submissions and describe the change log.

>
> --
> With best wishes
> Dmitry
