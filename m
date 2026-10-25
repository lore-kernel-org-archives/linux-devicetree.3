Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792918331;
	b=d/WpkbLV8rIN8+W2T19mAVGw9Co2RNbyvOYdpFIoZyjz+2uk+4PBTppvQuVcYPmhKXwn
	 4rCzP8rPKf58lkggs03Yk4gv/Wc0BCjTA5uCgXlZu1tzkixDFHZL00A6qRrHdTTKdpWNW
	 X56dXxjykOJV4b6Qn+/4O0PGG81acEal78l4L30FC3rzVev5L73VN7b/VV1pwfP3QPZj4
	 cHFv+yTTOnJiMddeUrE0YRtcfdVbltrEK5t1di1z2e1yO3ffi+JgpkHK3KXO8LRSj19g9
	 Gx6X1/sVUjmq5FFkr+kKbuVhH7T1r04YvBmGdcXIDeqWuXG7mSXk6pQnxPonOBHIHrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=bc41FckTcBQthvtCzkFLVNCK1+fJ08FUf/3Pl3O3aMU=;
	b=1ZSvuB6+HtQFiRBVkmRTNBYklHAv8CuML8tjO8+uUjXIrytl56sDsT3f8pkhm3q3xWdE
	 i1FelsnmTx5PaKwLYnvkiqu1aLE4HgvBpgw59C17GvRRiXyc35QEan4VYfBEgPLx/33sj
	 DY7jlNBL8dqSUX6YUbEjVUlDY2vrQTjMGBIZgr2IYdYvxb6xAj/u7CfcDh6ZHHhqQ15mu
	 UECns1HO5o/Koe+tpxOCS13BZEES9xfsuqKpfKZNXoA+JRd6bn5/aZqehB7MAHF1pzY4Z
	 yFGyhQ4vA7aG0oD54LjJ936NVwyT6JL5+M7HakILeHyXm+MVQZRfxhaGjoiJDoSAs/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="fHuKXae/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335FB606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 08:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 335FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fHuKXae/
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5862291eec.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 01:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792918325; cv=none;
        d=google.com; s=arc-20260327;
        b=FQjD0i9xV/TNdqavrCzFAHRVv6pRWztTLOtpe9tXKtejT1Aw8JNAhZuMhhu3i16/2L
         D/+zXL5/8v6pBw178GAlVv4MII8L0TXS3dEnnSnjN0ldbkR8l8iRVlLPjeLGIw0xlJ48
         iCsYzWKTp38ytd2RCZGksCfjoPQ6iMaqZSIcQIclC1ti0BtOowmxMdTq8SYsaBWALhW2
         voz3qjboxh8GqdVSyHOtK1oZ0GZSZRvGM+R7E34Q5H8PvIXtmpGkSOLxiKQgtqb7Vcnm
         Vh6ccvRm2IsCy4r1YcTgMcZofO1ioLMNgopaP+zPqP5ws6/y/q/DK4EXP7YWfKkZTqX5
         5gHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bc41FckTcBQthvtCzkFLVNCK1+fJ08FUf/3Pl3O3aMU=;
        fh=wo5cyauCgkullpj+HfchJeWs3jJccKmUgib8BMVMvZM=;
        b=Qhyy7gcBTQkASZGRrFIlZnl/7zjf2MBGgudI2uvDP3cXcfmVC1rprprvn+xM//7K33
         Wo6MZddtrBH0YQ1RXDe9u3YlV/OOR4++IJ6WOXAnvaFTjqtDg6RENdbupaI73kFdvOBO
         7alVuq6doVmJr8h/gxmaZJC/EwYxhuoq/Pxm8PkJzkrayBbokrIsITQBa0Fp0doLrPvC
         IFBWemlzQO0OPv3trJh//GrK+SC9fVbSMSz9riEvgZsp4LNyvf+c/hNsr253+8PNcGYb
         6vHLoQi5TROahBr9TKLmOBp/ijvIqt9Pbf50t9/rfdEK3Rby9g9lGW0B2NzlDCE2wKh1
         oXYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792918325; x=1793523125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bc41FckTcBQthvtCzkFLVNCK1+fJ08FUf/3Pl3O3aMU=;
        b=fHuKXae/GVi8tRawUFa4lbNSNPGpcGy3etaTNS3Eq865jP6HTXqyTAU7pQ9lO5hztV
         L5T/ZeoFN1auALf2FXwqBPd7bBS2wagtMIyz37ToFRQMa/WXNVD2BEtbTGUextAR6OC6
         m8uMdrEus0LGhKtjw18ZAw7Xky2dQ1k8endaHdCWWVCVIQF+aZ43iOE+gZdVkiSA+7S9
         3rYxkMEDMFtqfVnmDFJ2mIM4OYrdYpqdVvaZ34/8vJ82aQJ7/B8SKZdFeN9aS9WzZRwj
         A/dKaDDRhdAcXB5yS5wm4iH2pYAGPR/KvcqTD1AaDgNBeRnCRbeFzhw1rqQLW1Veeq0v
         5J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918325; x=1793523125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bc41FckTcBQthvtCzkFLVNCK1+fJ08FUf/3Pl3O3aMU=;
        b=LfRd95XRefe4/GmlxArSpdK2nCamQBRrF/XOEXprUwrtZflUIx5KvQxYLJeg59h54o
         /M1zisJBMNicpJx5rej8gEIxAbYPycY2NQpaPhXWsXfa5dBb6WPeze7yQKLhZ+N3BpPd
         tXqaokpPMyoXtdPuiaIZuFI/sRHY40807OmSwGLDJy3EDQ9hkRjMNOU7efYa+ovDUKJu
         FEQXI/KJ9//NP0OS9KzsqKEFB2x0s0GhXeGhvD9mu2UDandOi0/EcEOuaKbwRV3eQ/Bq
         2Vc9/WK6w83fL47/KtVlYvkQBL6iko4M+Usasfv4JzJ/sNraU1UYvkf6YHd/4N2rJ1ZN
         EHGw==
X-Gm-Message-State: AFq9FYIPq0ICHfkoM+gNRX965w8F5A6yrSO1oPRre5aYHB7TE7BHyOtQ
	52mcppA8ZbdnPveV4yrFcO2HSa0zcR1u5iBgkqYWLH6QoPt+7n4YQXYE9j/Rjk9iaWcvwC/Ty6+
	8Jnp/hdZi9/+7XP2aCtpzFx6zRa/JzLw=
X-Gm-Gg: AYBFou0c5Sj2OHWcP2uwbi5os8tTl6rWQV5s7PU/oalU5Kck/0djje/Ulx5SPDO504M
	ApjD/TBr5hHybWQ7wpoH79x2D6dkhLmjzWMSS7m2wHuh4feRyZszBVY/jvcUZoM/tAHawsRArJp
	f+Zg+6nDJnt5kYUGk5fKr7k95DeTw56sbSlT680JtD3kkb78pqNgmtEJMurChPE6t2/S0+x9Xi2
	41YnUH3U2cyZ3UAbeDlIv9mhlATyMgYULoxY7C3YK3iE8G2z26ozA3Jnnay53et4O2ChbsU4pyI
	p5c6lpc+ur8H9H8v+zXrAbZlA6EzWmjsQdFBY1wG0anaDFXHkqvPkDGHZ65tRfoqbYIq+xB9Mv/
	cWPbw9wZJVWo+cXD3LnPD/NDiZgiDmAewGGi859gGKf/ps/HPRaksjCnWuSrjFOJIQzn5Pg==
X-Received: by 2002:a05:693c:66c1:20b0:35e:51d6:9f6f with SMTP id
 5a478bee46e88-369e84f5952mr5827731eec.27.1792918325200; Sun, 25 Oct 2026
 01:52:05 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <CAPVz0n3Vrzb96iR5ZW8zvmruZ4aK0hKGKpJ2T9Ys+bSPCtLWHw@mail.gmail.com>
 <CAPVz0n3gzV+gAu_gzp3oTG9VOu-YiNSiQA0SdCFApKsi0dGjKQ@mail.gmail.com> <0g7damfVTZ2r6s4H0kv6Lg@nvidia.com>
In-Reply-To: <0g7damfVTZ2r6s4H0kv6Lg@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 25 Oct 2026 10:51:53 +0200
X-Gm-Features: AclHuK8VdLvGZN3upYS8jizoanUHoPG-jyCBtPV5Pp4C9VbRI_nvkyJWhb9qq0g
Message-ID: <CAPVz0n1G0cDuUj7WRfj9YRgvMSd0sqSCjnir2p=QxUGu5BWTXQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/tegra: Add support for 8-bit CPU interface
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 25 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:4=
6 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, October 23, 2026 11:14=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
11:26 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 10:53 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > ...
> > > > > +MODULE_ALIAS("platform:tegra-dbi");
> > > > > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > > > > +MODULE_DESCRIPTION("Nvidia Tegra20/30 MIPI-DBI Type B driver");
> > > > > +MODULE_LICENSE("GPL");
> > > >
> > > > No separate platform driver or device. If a separate struct device =
is
> > > > needed for some technical purpose, we need to create a minimal sepa=
rate
> > > > virtual device, but unless there is a strong reason to have that we
> > > > should be fine with just the dc device.
> > > >
> > > > Thank you
> > > > Mikko
> > > >
> > >
> > > ATM, I use bridge framework to describe interface and I am attaching
> > > it to RGB since it basically uses RGB to transfer video data. It work=
s
> > > pretty nice so far.
> > >
> > > You propose to replicate how RGB works just for DBI?
> > >
> >
> > One of the reasons I used separate pdev was to be able get mipi_dbi
> > from it using dev_get_drvdata() from patent (dbi bridge in this case).
> > DBI framework seems to not have a way to pass it in any other way,
> > unless you know smth I don't.
>
> Right, I think using a bridge is fine; passing the mipi_dbi interface is
> properly done in other ways. The direct parent devdata link is a bit of
> a "poor man's bus", and sometimes it breaks down, such as here.
>
> MIPI DBI is comparable to MIPI DSI -- both have a hardware channel that
> sends both pixel data and commands. I think we should follow DSI's
> example and have a DBI bus and devices while keeping it as simple as
> possible.
>
> The DC driver would register a DBI host and the panel would bind as a
> DBI device. The DC driver can then supply the mipi_dbi object in a field
> of the mipi_dbi_device.
>
> This is a bit more complicated than a parent devdata pointer but much
> cleaner, and follows the existing DSI pattern.
>

I understand your intentions, but ATM kernel lacks any DBI type B
framework. No hosts, ho devices, noting granular. Implementing
everything just not worth my time to support 2 panels of device based
on Tegra 20. And I am talking not about time to actually implement
this in the code, but to upstream. DSI framework is huge, copying even
part of it to wrap legacy DBI interface and ustreaming it does not
worth hassle. And yes, I am a poor man, I use a parent devdata bus.

>
>
