Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1071A239A
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 00:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776905712; cv=pass; b=IGp8ZvRGcjuuaYWjH5Br3wZe2lecXzFkq+D8W6HOR073S3o0Qq84RuYU//BCoiosE3ZmNYY7VYW9RB45EuA/s/Ruza+bpLlWGH3zxVF62cbTeByxZ8fHAOXTTWi1sAb38AwP0ayz36xb+szVxn0i7P/ZyeR+gsV+bn+CYhVIGQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776905712; c=relaxed/simple;
	bh=dtPuzdew3nEOmm0pIGgkbqeLJz6VCqmHHH4uxQI0PUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/sdGxFnipx4stxekeYvy/r5dUwOquUhNNBiL9xja1rd0LaekjFgSLUiwiPZR3yc7HOPkdJvk0bH6SfarPTqj8mUK9jz7CaMyop7X/RIaFD1i9M2CrefzoiD8OPvZ7m5M5ByatG8995X1CP0/C1GhwAn3mWTQCGg4Pxj1Xa1eEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+GcnMho; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+GcnMho"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d4c12ff3d5so5488356a34.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 17:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776905710; cv=none;
        d=google.com; s=arc-20240605;
        b=IYFv5DFLFNVORdNMAUvDSg0zFgDjtZiTBmwyoAdzG2l1go821Od0EV3gszwgBq2vMH
         v/v8RQk+OCPCVAVZl2D5wyLNaRZWBoEn4C0uChvDxu7XvQoc1MkKb6XFCSLdB5Vh88Ui
         GiPC5TZ2vqnUb60dvtUu6TPVEOtgTgWTfVChk137hFyx1W7TICMVHXRkiX3+DRj/BicU
         wGIjKJ7ERVFIYDTgUk4ibODN2wWOO8p/dva6KHNDviPuHnSl/NRel1oPXK7NmkcBjqxf
         TPHlefJ6Q+uonRNv1HZct4K+bHyq3ZOfDnnw+j2ECW5TIdwwJvIyYDacivaS7SwCfetk
         cqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+UtLEa2foHKEHFU/SLXwh05Wz0Pck1xJ13q7G3dvIOM=;
        fh=yKIbl54ojvrpw2clW/IeOMsG2P4GhPFPC2Nkt/oJ0HQ=;
        b=d1JYDQ/gQGMMlarziMesdZVk/LuRwU0K/nGQ6A3rtHGa7kKu0Pa/HUzOI3m36eqQN7
         Vo3xNKQbZjVYxoRoJAOUfcLpCfjPYpy7qbvNTEs3TRJ4iw+idizHODtdN0sw1NrV6FA+
         DtWGkysPu76axc1m1sKaw2NXmQEmTQXeYPHj5gjWykJkbeeCYVY4XpkU+4tEfriECfeH
         rfQLbPVfGI1gWBvsR/P7giqbBNuVKkDiWmm13C8TuzovYEANeezFEapAfx3TE+jeovpo
         Rj0L0IKi0zi56BgYIaVS01eY97hiHKq06d5ouZs6Z5HzYmWHmUrL/v5/TIx9GU2Mq+5j
         Em/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776905710; x=1777510510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UtLEa2foHKEHFU/SLXwh05Wz0Pck1xJ13q7G3dvIOM=;
        b=L+GcnMhoSOczDOqlTbO+18Csz0hY0cR5rSAA0Bb/7MMJ/H1A/mYY8P0YEsWiqKsC4u
         T8Jj3stCPuaUHjrX/IM7vJnfAQS/87hTMkQazJi0/w1LcJIvuO5nNIUSIEmOA+UTz/cz
         /MGgN7xS3OXaJmcuDauxRL8PXMDc3D5WTTSFE+jdKTExqMO8momtBDCdO96o+iNXI4FV
         m9KVq3qIBEZTQ09WtylP/19v7gGkT+xKSSFCZadAdXLKHIsFFM6Pa9/icxFZ7pM0fJPz
         mJHVQNUxNvt7/1gA1QgEwVP5D7fCNHwWbij21A94cfwFjCTNVKixFbkasCvmrklBbP2g
         zbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776905710; x=1777510510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+UtLEa2foHKEHFU/SLXwh05Wz0Pck1xJ13q7G3dvIOM=;
        b=hOUwCPOI+YTGESTqfOpbK1llNKx59Rmkl75vju7+hwXO0punrouLsqQTVRVlF2G0rz
         lJw50cT+RSZ/qM8fURfqjUh85EnCcC8hvAxiDSgGLXhjc/ZiIlrP5ENieRxtym7niOhf
         hQradum/jRghgwbHXJrWz0uU7JQA97uNtrvwVWm4GqAGgqgr38Kj1ScEUT0rSPd9PIxm
         JxJTpsFRnvduv9Hbs+aZtThR2zhcjd58of9md4lzDh80nLgdgiXDSMFltnxVlf4QbRta
         HNn8Wo+bPjJD5NOJxVwT+4z5v6XdF0RfgetG7SuFFVEKIX0SYnSF96hlnpPYYJ9JHXXB
         SO7w==
X-Forwarded-Encrypted: i=1; AFNElJ8C6KzblpNwq0iU1aKVhpSHIABDPnsF2EcoztOtyZzrrUKj7ojzfJk0vD7SFWcgCmD6Qu5TRufkpNrY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2pCMwJ3AWoXBMb7xTsxmKMQeE/Ox8afA2F1Ku2paonK9W3eSY
	ttIpNLiydZHwNCrbHR5B6Rzb2QsjlGZNCdCJlB8tTN1tvzrkWD5HnUUgc2DfV3gfDVoN7Fdyfk2
	4KWQ782BJ4qV4pT3YOX5HEpWHixdKALA=
X-Gm-Gg: AeBDieujDUrOCJOnhB/BYGg9xMwsFlD5l+bqHMmd5qkYxWTzoyUP5lAAAQfM7V4yIH2
	VrYPKCNXK+h8eaxxbx5j7mkMHEXW+vHw0ZAquxrZwdjYC0Lu6Yd7dFAvP66hLX58/X0y9kYAmLB
	R7VFm+tdo3klznVh/JeJ4O/cLOBOMX5k0aLImV8Z4KzOYXQJ2IEBy1d1W2OrZunfaFvJyh1wnJA
	89pyaJONwx8xd/0gzuF0x/9twejKNoYPyfo5zWAepjZQpd2ERVypiQFNlbqDtjE/LuN2Z2U4FU9
	XZWBaUhUpTGSaszEnFm4Z0KVHth/
X-Received: by 2002:a05:6820:4284:b0:680:6d72:9389 with SMTP id
 006d021491bc7-69462e62342mr9688484eaf.22.1776905709878; Wed, 22 Apr 2026
 17:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420023354.1192642-1-syyang@lontium.com> <20260420023354.1192642-3-syyang@lontium.com>
 <CAO9ioeXDfTdETEBQknoLehk2aiabCgse109sDgJoPHuQ_07nKQ@mail.gmail.com>
 <CAFQXuNYV+wt2-+8R4m+mtby9TBwcX+vGdqvUvb_6wXkkBg6b=w@mail.gmail.com>
 <ed5u73a5lpsixqvm35zpmooolstjv22ygusorub2owbgz7cwj5@42uq6kl6run7>
 <CAFQXuNZXe0vXAr+dN4LQfC95pvJ5C+Z+b+AuSGZnG4Ui+Nbjww@mail.gmail.com> <3gzudodwvibrlzvzb4csbh5ljmhoxvexs4xef2jag5z7ih5nqw@ral5sgh5diso>
In-Reply-To: <3gzudodwvibrlzvzb4csbh5ljmhoxvexs4xef2jag5z7ih5nqw@ral5sgh5diso>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Thu, 23 Apr 2026 08:54:56 +0800
X-Gm-Features: AQROBzCge4WejUVf8NQQWOe-Uex68G1vhWDb55cQCiSB92inlzglDUjGgLlX5Y0
Message-ID: <CAFQXuNa9BWgKsJ6sjesU96FrUczKPcgdy3yaEy4uhd9kCF==4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: Add LT7911EXC edp to mipi bridge driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com, 
	tzimmermann@suse.de, xbpeng@lontium.com, rlyu@lontium.com, xmzhu@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
4=E6=9C=8823=E6=97=A5=E5=91=A8=E5=9B=9B 02:58=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Apr 22, 2026 at 09:06:22AM +0800, =E6=9D=A8=E5=AD=99=E8=BF=90 wro=
te:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B44=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=8C 19:15=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Tue, Apr 21, 2026 at 11:13:30AM +0800, =E6=9D=A8=E5=AD=99=E8=BF=90=
 wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=
=E5=B9=B44=E6=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 11:57=E5=86=99=E9=81=93=EF=
=BC=9A
> > > > >
> > > > > On Mon, 20 Apr 2026 at 05:34, <syyang@lontium.com> wrote:
> > > > > >
> > > > > > From: Sunyun Yang <syyang@lontium.com>
>
> > > > > > +       int fw_version;
> > > > > > +       u32 fw_crc;
> > > > > > +
> > > > > > +       bool enabled;
> > > > >
> > > > > What for?
> > > > >
> > > > (bool enabled;) is used as a flag in the code to reduce the frequen=
cy
> > > > of power supply switching.
> > >
> > > How does it help to reduce the rate?
> > >
> > The enabled flag is used to track the hardware power state. In
> > lt7911exc_pre_enable(), we check if (lt7911exc->enabled) return; to
> > avoid redundant regulator enabling and reset pulses when the DRM
> > framework calls pre_enable multiple times.
> >
> > Similarly, lt7911exc_post_disable() uses it to prevent multiple
> > power-down sequences. This reduces unnecessary power supply switching
> > and potential side effects.
>
> Is there a code path leading to multiple enable or multiple disable calls=
?
>
Sorry, this is my mistake.
it will be fixed in next version.

Thanks,  Dmitry.

> >
> > However, if you consider this optimization unnecessary, I can remove
> > the flag and the related checks in the next version. Please let me
> > know your preference.
> >
>
> --
> With best wishes
> Dmitry
