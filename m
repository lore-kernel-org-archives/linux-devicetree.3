Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62EF3C37B4
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781444169; cv=none; b=U9JQ4zLfdSsf4eluAM5SqP3tFWIo7hW363mW7dwMtref6uOFpbx/sU/GZvFAC8I5bpDZhBjhlV4TwWSUDdpqKD2A3mhazxY0iPsKYhNebaXIy1QyRueU4NxtSeYnBPARSlpIyeb3BBr5msqJ2X4WMESJwX5hCxg9ZUQUTydaMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781444169; c=relaxed/simple;
	bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dDvHRKPA3ZJfG6BddTRV1AAfVSMNJlTxNO7TjcYyoQ51jFS3UpmMuLWbAemnA++m8/fL3qKHPbRIVwXSWxJufqPK5WkFX/NkkIb2AxUJS7fmuRIgq0109Mcg50ORHypSqJojkjEHdbJJ6lWgtFLvtEvVyujHYe4zVUtDX3ydujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpDmrifd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpDmrifd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso18335225e9.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781444166; x=1782048966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
        b=RpDmrifdVYRm7w5uVqe6oo3KthisxnGYVHjbrQ/g22lavHg/KGCkoJwNc7ijI0J3eT
         oTM209FyB8AYtpWmwrOPwjmegbBrr/1YFe0VNxtJOMe1a409Koy3Jx7KtXD9+i0J3wNV
         YNU5hkJd4x/JIGKAcwANwGMFZcMWprALWSaw9gX50D73us/V+yNYh5DVkNpt0obgkHbn
         LWbqbr8HEfiDB69a2q7MyHLbZelHT+Xu1frjmwxJQT6KDYlrct0Ny1gvVPjq9lsTcqdD
         Xr6NBaHwB4WKZOXqaNGoNDwKi9p2e8nCRQ2cHVacT1WKSljxcspjv89OY8BDU2S1ou5A
         GlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781444166; x=1782048966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
        b=erpDbuh5x/b5wga9Yhd1q+3EXb8I/8HlQQAS0mOhQcK7EIXUVkyj6c3VlskSw8QsGs
         Md6ivccOcQm+4JvNbwcFV86jD1qRhd6xUrTbGydGpE2W8BSSPBPxSSGQ0MlsHCijXJsh
         5cq8vvGmoSJ4Iy+hGO0ATbaU4oOaA1YRQEQNNUwVhHxsAEVxpV1mxLr+k5JxAyufItca
         1rbANKq1Ha6iH2TkX5B9x97BxPqCRJgSdKty3BTOzbXiPacfUQ/w++NyAbJoAWt/qzWp
         GggSZDbzWYS8/sA8fxrPhxmGK80r7ah/PSoEhdBo+EiLGGQTxT4Nzc7WELiAce/xm/R6
         qlJw==
X-Forwarded-Encrypted: i=1; AFNElJ+48K7tmPUqQUA4NOm1v0N7miq2sGXAxJNP9ZS/4CX31h8APYNcjOA5+DyzaSuhK0y9b4rSCbWQCM4j@vger.kernel.org
X-Gm-Message-State: AOJu0YzYNuvBMeQyJ3L5E7ie1CmQ3NDk5u7KIdEY8jmJXnlE49F9c8zI
	sm0JiEY+mXbaRdPPQIITjrzeOx8/IaMslBb6m8CdoZxqlQsRGqDG3uiw
X-Gm-Gg: Acq92OHA3u4+rxwc8Uyez+i/5ZZveze9MU4Y5YhQbfytUuoS36oHrOYs+Ye057ZUwDf
	k8PUJR34xDvABcA2tazr6xqqdFpNSXxBQx1bpB9t/ZyhgBFCpHG8X5wOoDdtyw6a5v8dFV6RBQb
	v4MS4wmLGZKg/w7EI9Ew93UjUMyjgHa/D8vh6rNQlhMlHlyS6XeOi3PkRmpXq5XaqesB8Y3l/2L
	Z/gSnDl1zXV1BBpuI8egYSylXA2QXBOXzNDitWx0HHsMvqFfZnjzDyb3315N+G8Xrb0B5Dvd79U
	EnprstcMTwLZ+2VTuQB/dwSu/Yfc/lOTSEw0msKyOdUZMeiyrJT70At0MPdXfTs+ptGa9MES+Ed
	4d6aWcAhGji3ECVmGmV3F3VFDT+BjD/RSKsBR0Q1Zybh7DjsEjZ9q1yAfeahJ4YaqZOS/Zrj56B
	u+8IxfeO01Ptwj4+O7XVxNK4MazF1TTL0Ha0aR5YaLsLTm
X-Received: by 2002:a05:600c:58d5:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490ec523a8amr94122335e9.34.1781444165973;
        Sun, 14 Jun 2026 06:36:05 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea9520f9sm148794265e9.1.2026.06.14.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:36:05 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Sun, 14 Jun 2026 15:36:03 +0200
Message-ID: <XYko-1bVTYuJiQeSr0cTOA@gmail.com>
In-Reply-To:
 <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
References:
 <20260505134812.408316-1-wens@kernel.org> <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
 <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. junij 2026 ob 16:34:00 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> On Sat, Jun 13, 2026 at 6:33=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne sobota, 30. maj 2026 ob 18:43:05 Srednjeevropski poletni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> > > On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.sk=
rabec@gmail.com> wrote:
> > > >
> > > > Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> > > > > The Allwinner H616 SoC has a video engine hardware block like the=
 one
> > > > > found on previous generations such as the H6. In addition to the
> > > > > currently supported features of the H6, it is also supposed to in=
clude
> > > >
> > > > Remove "supposed".
> > >
> > > I can't actually verify that, so "supposed" is accurate from my point=
 of
> > > view.
> >
> > Isn't info from manual good enough?
>=20
> The manual says the SoC supports it. Same was said for the H6. Then
> we discovered that the VP9 decoder was a separate Hantro block.
>=20
> So again, *I* cannot claim in the commit message that the hardware
> block supports VP9 decoding, because I have not verified it.
>=20
> > In the interest of unblocking this, I would be fine with "supposed" too,
> > but manual and all my experiments show VP9 is supported.
>=20
> Please give an ack or reviewed-by with a comment at the end stating
> VP9 verified.

Well, just go with original text.
=20
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
>=20
> Thanks
> ChenYu
>=20
>=20
> > Best regards,
> > Jernej
> >
> > >
> > > ChenYu
> > >
> > > > > a VP9 decoder. However software support for this is currently mis=
sing
> > > > > and still needs to be reverse engineered from the vendor BSP.
> > > > >
> > > > > Add the compatible for the H616 variant, using the H6 variant dat=
a.
> > > > >
> > > > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > > >
> > > > With that:
> > > > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > >
> > > > Best regards,
> > > > Jernej
> > > >
> > > >
> > >
> >
> >
> >
> >
> >
>=20




