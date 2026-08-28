Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D96817B425
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896334; cv=pass; b=Z9JAnHmMR3sFU/z8QfCrCg3cQx7XQf0H8Do0HXZIx4FRh1CSLbUEmcJ2V/P4hlIsky1FZQhRxSXXQqgxyuTmCvUQCBwYo0Tdxw3DUTltDTxjiui2L92WD3pdd8Rt/bjkMKCVy65hugO5q9UjycFYdSizQW+wF0Q0rRpSywFh3XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896334; c=relaxed/simple;
	bh=0ZYEOp/O+ITey9Y7ZR7D2nXGA6TvESPGUO22btqlbjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmRH/86ufjc+s/JoFl1BA3g/eQY8Q3TRbVcW7EdwdcwYRYy3wrswxmzmfN3cwpJRPtzjGFR6b6HoxiAduPv3d6YufiHQ60B0Hlp2nJIK9dKLZjPfQqN+34eZqgaJqH9uQ1HOPxsJ9u2tfmPUxcB8JZmPixBDJU01eDWCvQK+5Dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRDORABx; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRDORABx"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so398286a12.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 22:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896332; cv=none;
        d=google.com; s=arc-20260327;
        b=Kt/9wKyeza6aa2YB2XxdKiLJR/Uz/3FDenbqui9wsfzwSJ+UTXunqGfJBn5XO9z5cT
         OEO+y0ESLdQy7O/u0HBkCBlqrWcIsiT8aCejDnb9eddDfJDmEouW6MVIfMPgSiK+MQHV
         18ePouYzsTRdlZzj/WGi7unauwpJv53uTX2AvSnJ/Oa+Jdg8eB3Ek0INospRqh5TizXE
         15SeHkwYgaKiQqbPmxeoVx5ra8taUdfQLQefIkemMof2CvshAAsilMLN8WoL9Cd4kjrl
         zteQiamNwAr3183zu3DF8eC86qg03XeLxB9no9P2A1NfoBZ74Deil05txf5OOL39Qoln
         onnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3WVmGIasWFn4hSSL+mKRJR03iqSi2SrceDpr9Pcy6Ew=;
        fh=U+sjGGyrgAIE+lhg0pmUzo5BhYkhTSlnrb/NxK3kH6U=;
        b=gxzTCWCHrM+FicFHBBTxxlrJOh68LVZDvjlsa1gwMwK/khdZirhtX6Jg5S1UOLR7Zi
         ibPwoYVcHwVEP9ghmEttPx/NytMVW0y6VG2xPOXlUFmFwhT26vlJ4d3XcPjkdSvxBy+n
         BaGHyxAqNApIRRheulatseeOUxw1GgEv2kItFDv/u+JozT4F4MYi9XVYk1b7RrD0yW3C
         LUxexgLmbHgMhglu3R2rI1aWTNEiWYTEtMK2gOlvYwaD5HFUH9yATOnLIbW4Kc4wdwgK
         qaXMig3o5oO7lv+qBslkpc9W84mMWpG+7HcE+dF4KPMgMNXK2M9ZTjQprODSquko5gPQ
         uQ+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787896332; x=1788501132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WVmGIasWFn4hSSL+mKRJR03iqSi2SrceDpr9Pcy6Ew=;
        b=XRDORABx07hFk/aT6uRoyI5XYIqcThBcxBG+lOghO1k0GAueiHzfLQpEjY3/MvTdJ/
         qfeTR74n337zUJPIE3rB/TRE3M5Z6+VTL+S0rnU6fs11q0L8aCZTqx1ditCmZ0ODL2KY
         5f7U8f7B+jfQ2TymbfP4ERILZiOXZP0LjhG+gRe3FBRJin5bEZjki+Dq/zeW/fs/UiJo
         R3FJknsDzuyIgqyLe5J/6CjDi0BDpcCwpe7X033FILYQi2aVA07zO0piZfOtSApGKRoA
         nT/PX6iAmFYuoRlagvNnTgsvdFaSDVqQepxOy7E18chWYhaf3PUNsAiGVu/zKAcAjgDL
         zgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896332; x=1788501132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3WVmGIasWFn4hSSL+mKRJR03iqSi2SrceDpr9Pcy6Ew=;
        b=WAz9LfxlIbGAzIFNRbozYkxJ7D6Iy0WYhvbHLgVJLwSb94gC1F3LPje0iKjgReqWE8
         FQ8IWrk/D+P5CVY5tClQytB/pXZYb/asA4TYo26HTCMmJ/rvCgOF4osz3Vt4nbfgGvzV
         0S0FP5PcdAs0CdHLFNHDG3/2Jl53rTeq6ZrHD2O/W9vM786gEycxwiFHhqzz6pAtkuxT
         QAruuaupvhsrCEzmBlJzeWE/R05/Zzjfp8U/eN88Ht+YTu4jX/Zk1aOTcam5dyjYkK4O
         QxfsY8pK5QlfFAELTdYoZcBpd4KSOwizAZfIpBBw1yJzgnnDZ+pC2KrqXO1QHWeYLyCA
         t/ig==
X-Forwarded-Encrypted: i=1; AHgh+RrQsvqyXVt7mE84cXohjKjBK2efsr+hpjnISvCBy7EAm2lVApq7U+5KjsX2pitlIlHEIbhGNVXi8dp9@vger.kernel.org
X-Gm-Message-State: AFuF++mF8yVWq1VDNB2WDmXUKdGzmUzYavLydcn7+Lw6MuO1E2WMn/D0
	KXSHdPXKYEEXlnEVicgurpui6sEvqlFWNnN1Foo2uajIJFiVbakRJTT0DtxrmeSM0JLJaeJbO6a
	r/Q1CBbhIzuhSbtdwqjY4swoXyrBXlRI=
X-Gm-Gg: AR+sD11qrUkaLh8y96O0Yg1FdzYP5KRFC2OF+7aOXIzcRMUbOlFMlekgarsP3Aj1xkq
	IsYEIG8sHoaGABn3WgEdA11qUzRQ12yxeXF4axSXzovP8c74Hwm3IeFeKwwOUNBPm924+0Y6DeD
	/JvBDqMKW25C7gr+HxgBgAnK34HDqzAlJDnljP8XYqsx5ny44pRL6Tldi1DwMh4OyXknO0PuoIN
	NhBzWx8kNOvI90jOA7XfQgLxtN5NifT8PiGu5u3Z+oZ/YCRe+YVn+lZQ+7G8edQ0F1ilBSg9WrD
	YNaPNtBsb6IT4b/fwP8oZE/8Ncqw7Fy5hcgdgfw2gh1OeA==
X-Received: by 2002:a05:6a20:3c90:b0:3d2:2011:d184 with SMTP id
 adf61e73a8af0-3d2681aa109mr8347990637.14.1787896332335; Thu, 27 Aug 2026
 22:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
 <20260820075524.2056029-2-eagle.alexander923@gmail.com> <20260827-legendary-viridian-tamarin-4e56e5@quoll>
In-Reply-To: <20260827-legendary-viridian-tamarin-4e56e5@quoll>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Fri, 28 Aug 2026 08:51:59 +0300
X-Gm-Features: AcwNN1Xrmf-v0fd1jUHBsQov9V95clmiFkrlORa83OAKqyTkDszVfmK1QM_KdGM
Message-ID: <CAP1tNvSg4yWHCJW6UNZ4yQv5FCjz9u5ZLpuW5Z9skkjQYbS9AA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Quentin Freimanis <quentin@q-lab.dev>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hello.

> On Thu, Aug 20, 2026 at 10:55:23AM +0300, Alexander Shiyan wrote:
> > Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> > ---
> >  .../bindings/media/i2c/onnn,ar0234.yaml       | 121 ++++++++++++++++++
> >  1 file changed, 121 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
>
> Unanswered Sashiko comments.

I do not understand this remark.
The corrections based on sashiko-bot's feedback are included in the
cover letter.
Is something wrong?

> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
...
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - onnn,ar0234cssc
> > +      - onnn,ar0234cssm
> > +      - onnn,ar0234cs
> > +    description:
> > +      The AR0234 sensor exists in two different models, a colour variant
> > +      (AR0234CSSC) and a monochrome variant (AR0234CSSM). The device exposes
> > +      the model through registers, allowing for auto-detection with a common
> > +      "onnn,ar0234cs" compatible string.
>
> So all devices are compatible? Then why compatibility is not expressed?
> What are the actual programming differences between sc, sm and "none"
> variants?

Perhaps I need to revert to the compatibility strings that were used
in version 2
(https://patchwork.kernel.org/project/linux-media/patch/20260807102847.1813059-2-eagle.alexander923@gmail.com/).

From a programming standpoint, it makes almost no difference which
sensor is used
- the only differences are in the output format and the format count.
Either way, the driver always uses the sensor model determined via
register reads.
If the specified type does not match the detected one, only a warning
will be printed.

Thanks!
