Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC82222CC
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 00:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776905431; cv=pass; b=nlncGplRXgPEsm3AFruuuaFyGp2mCssMONG0EP3ZnoqxcJWg1LoYeBqWSu8xXvIlU4afmKxJwbdTfhNxOR+tiROj+xf+A/tkEgUjTR4Jxb2ckCrXZNsIb8ipGJP2NQeYk0pzGujTgmL7CjkGdH0B/XlVBO5iL9XLRuJWNXERtBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776905431; c=relaxed/simple;
	bh=RgQhkhHK1q85bpq3fGuk9aoMwiO0WXdmeEOL1g0G4Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSAz8QzyFIRb8+2wBfdEnJveE8AtnelunI7UN6/wMbx/Iiso+o0ArmPX5LkhPLkn09O0PPEYaBcR5rv7o7R2yCWa1o1pCMNZbksJch1aMCNE3i9KhPfgw3+DX07vuREV+spNBCE9UM3roLxm2d6soE8PTeK7szIYyF0ZVRbEyv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWPZgqKR; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWPZgqKR"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-692205ca402so2173515eaf.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 17:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776905429; cv=none;
        d=google.com; s=arc-20240605;
        b=UX4Qi5ec2sW+777Fg7ViVbVu0aH+BuFfrxZmU9y4e4gBfqQUzMrCMbTfNvZB2O0UhE
         srT7orJEy3njEBMnt3htq7Ia77VxmMYEugoa2agM/TUUXIVhLbPmuqdnoceKsszunb1Y
         YXdwDicYz23Wd/oWYAlzi8ubLIwRe9JMcj48o7Fp9I7aNzog6M23KsqAETTQH5AIk9n8
         YL4jfS5v+4yYGpY5mUHlx/kBWUwgFtKEu/ISAi52KJVuNuB+kF0IPjM5DA7dFO5d1Odz
         dweio03WMBopOU+kXGEFPRadFLdAmn09ltPItB0y1KOxVPkewllcAAzwivg93M7L6vpS
         +Tcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/nEWRDfbzTChYAGuWA9e4JOGkSzV/lYIHVDwL6GP/tA=;
        fh=hVr4M87Ce0d1LrJO3GN3fVGwTEZGv3QQxx49Q+3PdHU=;
        b=ffiNhHpLoEKVX6wq11HGkno56H9ZVa7qr+QmCIWO4LUaZ0o1sPTcvFrnbN6r94F3D8
         AFX7xN4uGhHstdbgNEOPLWUuTGDcvEhw64lICTIP3DPyeNa6Bp8S3au7nzaZkenkUcJA
         S+nJhxjeXdj6KHCiOYZPu2a4HD98eT6Ipqjk+racEli3Np5fY6J1eu0UnlREU72xFXnh
         u4qhbsP/FWxXGxMbv33kIr5YHBPa1F0dbsSjBZrdOkIMJB7NZzeEQRFW/E0kfqpZt0TS
         pk+bj3/r/+aprL3HYYDymGHxMWmlfuqn3EYHFj+qyX7o/rr9sQex2/r8+ebtT2YuC7a9
         Stkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776905429; x=1777510229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nEWRDfbzTChYAGuWA9e4JOGkSzV/lYIHVDwL6GP/tA=;
        b=WWPZgqKRdBqZFloRK7V2c1acyFB+SAoIWXkipN0k1vJ1/ynusZMHU57wkdrOzAjK0u
         DeD60XoYXRnSRXeRXbA9JUuNfv9eQ5oEw6wMJgjXInt7cAphME6KG6SEv1wgsYh1ulRg
         EBDNFtH0UEQ38NgsV4zv1vrDmp5TxOOppfoPp90OYjsHJZxklq+028or9ao9o5DFoWJf
         9NS5LcmztEf+vAxGYgp4J/XOB/AdtzSt2PWKT6p4fEYs1babNcpUgU2TxOPLrxVeaQSu
         R3egbUcy7ZV8oa+0zDC2+Fi8eGFn1CqUEizhi6PeFJRm+2UDyjBJ4vZFxiOu8lfgDlXa
         PojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776905429; x=1777510229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/nEWRDfbzTChYAGuWA9e4JOGkSzV/lYIHVDwL6GP/tA=;
        b=RbwKhcEV688RNGS80kgQn0QWRO2baMBAolvih4nHSuNEB2cr8lQQ0IP4fUScYsrg1z
         hA/UipZFPwz2MH+0LM7bm5Wamtae3tyk0lJrBserqgk1zQ0DdXKLfnC3mlD6Hz48w2So
         Fy+vSDRb/k4K9OVJGW5D0pBFfoxZ8lTa1lmYGZTZY9gnUPVjQehK1pseLAbv0j5b9WsY
         Zi7du0/OxdkfKX3woN+PdKVJ1/t+Uzm55fzMdSviQGff/7nzXAL2/IOai+gBnib+SSO1
         i53RsB4MOvi7NdHiaj/5iO/IVvZGvKWiU6WSAwb8+XNbBt+ommM0Ho3RU0rWQb1Uzu5w
         HjgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ajlBUeVshydmvsfi99cAdWRRgqDwGkrs06m9yanol9iNtNWUhnW1WMjbWf/czBX469mEm7LAkViho@vger.kernel.org
X-Gm-Message-State: AOJu0YwMfsehNVPwQRZiUuawvZGVc546jz9oqlUmFK3ueUeuFswsOnJ2
	ldmMPzotVsGQTi2H64CVUygS3Zr3p47wJKlriRClrALlzw8iWd5kKuKEBaFIrmuyjgjpVLu5Dag
	AHV599Vet+rJdVs8p/lSnHP/7MsjtE8U=
X-Gm-Gg: AeBDiev7Iz7eYNm85j4wwe6X60qAhAfrb5V5Kxj/ZWN9gKnVx56gpxURYu0PUEWK4dK
	TEyBKicuxb4jxmlubvLjXgo//4KRHFeH5qdb9tGS+C1SyENvR+lT0NLoAGKV7ahoykkLHuQIVKC
	Hz48O7NWNFEmocPHzXwDaEESn86ixBv2JqC8I+Kx2hX8qifKpFs/wwOaTc72nG5jsOYAJuCBpVF
	2MnJGrhXFjHBQg4JNFXnhnDPWTHmnvKVVrFLNrQQ5FGqfwXXAHRW4+9iRkjRcBa95ACVd+c6Ltk
	eSTfjo5XmTUcwbjxUw==
X-Received: by 2002:a05:6820:168b:b0:694:a2c9:2d50 with SMTP id
 006d021491bc7-694a2c92d8cmr3710704eaf.59.1776905428946; Wed, 22 Apr 2026
 17:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420061644.1251070-1-syyang@lontium.com> <20260420061644.1251070-3-syyang@lontium.com>
 <stkoeboxioodtki3nyksdglihgze243u25ui7dbyac4tuuobgx@ncl4j6l4vfqh>
 <CAFQXuNYXP1fiJtUiMb5iBL=jVXTB8HX8JLzto_eGOZvUaeZkfw@mail.gmail.com>
 <mvthlwcekj6i2h7bi5lns7ycictafjjyninvubp6adgaqxchkz@372c36cxon5t>
 <CAFQXuNZG-La0YpmHgMA-TZ2ayPDLfEvkbrSJZyW-jFCzXU-mLw@mail.gmail.com> <seno7shjhledyrunl5pib323zwgshtyhi455hzyspkhuvbps4m@qb4gwwakfww7>
In-Reply-To: <seno7shjhledyrunl5pib323zwgshtyhi455hzyspkhuvbps4m@qb4gwwakfww7>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Thu, 23 Apr 2026 08:50:13 +0800
X-Gm-Features: AQROBzBHLWJYWmQo9B-MiMuVDVxir1nNlnqbfrHtYvsavDSTDptUuFtwGXyCe4c
Message-ID: <CAFQXuNYUj6OnR9Fo4qqebO3g38A2jbARbUWzgTXjYVB08WYcbQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: This patch add new DRM bridge driver
 for LT9611C(EX/UXD) chip
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com, 
	tzimmermann@suse.de, xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
4=E6=9C=8823=E6=97=A5=E5=91=A8=E5=9B=9B 02:56=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Apr 22, 2026 at 12:41:11PM +0800, =E6=9D=A8=E5=AD=99=E8=BF=90 wro=
te:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B44=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=8C 18:48=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Tue, Apr 21, 2026 at 03:37:52PM +0800, =E6=9D=A8=E5=AD=99=E8=BF=90=
 wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=
=E5=B9=B44=E6=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 20:18=E5=86=99=E9=81=93=EF=
=BC=9A
> > > > >
> > > > > On Mon, Apr 20, 2026 at 02:16:44PM +0800, syyang@lontium.com wrot=
e:
> > > > > > From: Sunyun Yang <syyang@lontium.com>
> > > >
> > > > > > +
> > > > > > +static int lt9611c_hdmi_audio_prepare(struct drm_bridge *bridg=
e,
> > > > > > +                                   struct drm_connector *conne=
ctor,
> > > > > > +                                   struct hdmi_codec_daifmt *f=
mt,
> > > > > > +                                   struct hdmi_codec_params *h=
parms)
> > > > > > +{
> > > > > > +     struct lt9611c *lt9611c =3D bridge_to_lt9611c(bridge);
> > > > > > +     u8 audio_cmd[6] =3D {0x57, 0x48, 0x36, 0x3a};
> > > > > > +     u8 data[5];
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     /* Validate sample rate and width (LT9611C auto-detects b=
ut we still check) */
> > > > >
> > > > > What for? You don't trust ASoC / ALSA core that the rates would m=
atch
> > > > > HDMI_RATES?
> > > >
> > > > Chip has limitations on sample_rate, sample_width, and fmt, and can=
not
> > > > support all formats.
> > > > The validation here is to ensure that only the formats supported by
> > > > the chip are used.
> > >
> > > Again, for sample rates, is it different from HDMI_RATES? If not, it =
is
> > > useless protective coding.
> > >
> >
> > I checked the definition of HDMI_RATES and ended up doing a redundant
> > validation.
> >
> > #define HDMI_RATES (SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
> > SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |\
> > SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |\
> > SNDRV_PCM_RATE_192000)
> >
> > However, if HDMI_RATES is extended in the future to include sample
> > rate not supported by LT9611C, this driver would require corresponding
> > updates.
> > If this is not expected to happen, I can remove the redundant check.
>
> Updating HDMI_RATES would cause enough issues for the existign drivers
> which don't have this kind of a check.
>
OK,
it will be removed in next version.

> >
> > > > >
> > > > > > +     switch (hparms->sample_rate) {
> > > > > > +     case 32000:
> > > > > > +     case 44100:
> > > > > > +     case 48000:
> > > > > > +     case 88200:
> > > > > > +     case 96000:
> > > > > > +     case 176400:
> > > > > > +     case 192000:
> > > > > > +             break;
> > > > > > +     default:
> > > > > > +             return -EINVAL;
> > > > > > +     }
> > > > > > +
> > > > > > +     switch (hparms->sample_width) {
> > > > > > +     case 16:
> > > > > > +     case 18:
> > > > > > +     case 20:
> > > > > > +     case 24:
> > > > >
> > > > > and no support for 32?
> > > > >
> > > > no support for 32
> > >
> > > Then check for that rather than listing all the widths. If you check =
the
> > > hdmi-codec, you can't get 18-bit samples at all.
> > >
> > You are right, there is no 18-bit support.
> >
> > same reason with sample rate.
>
> Yep. Check for 32-bit, the rest is fine.
>
Same , it will be fixed in next version.

> >
> > > > > > +MODULE_LICENSE("GPL v2");
> > > > >
> > > > >
> > > > > I think, checkpatch.pl should have flagged this.
> > > > >
> > > > yes,  it is need use GPL?
> > >
> > > If it flagged the line, why didn't you fix it? What did checkpatch sa=
y?
> > >
> > Sorry, it is my mistake. i will fix.
> > checkpatch say:
> > WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db
> > ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
> > #1450: FILE: drivers/gpu/drm/bridge/lontium-lt9611c.c:1364:
> >
>
> So... If there was a warning, why did you ignore it? Please don't,
> unless you really know what you are doing.
>

it will use GPL in next version.

> >
> > > > I see that many of the latest code still use GPL v2.
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
