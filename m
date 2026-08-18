Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DE53DDAE9
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 18:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787079531; cv=pass; b=UYr4SpoEgJXzvdVTtM4QmDQ15TfcEZwF+ORL94vscXGciFpQPdu2Un+WN3k6xtnvTyGCqic4I6uG5nXHkh11xxx046dN7ePfMK+oUQ3RBvJ9/rJdEUh0i4l+T4Mv3Zon+4fTPkB1lrGt1RmkfFs7ob7eV5B1LpcV6mh6iEpP27E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787079531; c=relaxed/simple;
	bh=1964DuSHA7WB48aD9EqBAW5OwZ93A7bA31ghwPLXZLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ek+buBU3ibzl+aTCHQxeOTzZGbUrnZtXQfmPU6KBx/KVwCjgE5Estw8Me0VLpeyi/kpmAN5JukIbKswEe1J8FGxB4rKP2g3g3ttqpTVjmvarhuBLaRdFUyW17jNLoYZ26JW9SvHuhNdPy1XYiNc4Ug6mT+X+MT6+eYktLRsTxdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvEcP6cH; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvEcP6cH"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-495b27007d0so215691b6e.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787079529; cv=none;
        d=google.com; s=arc-20260327;
        b=qreuevGiP6Wu2aq9NXi6iV5CRL4M9r2TjHUzPbw0eNxujSjci1LkUckoLS5Ew8mq2a
         m14So5r3aMRc4qFj4PxlBj0zATaG2gkQecLK0MXW32kva13Wujn+oIyx0p57906XYjXR
         xWDBNA467wPEZWEikjFfzdhdnV7Vq3NHu464ypEbI9lQ/cpflS+9SdoHZatr5K43rjd+
         Mrf6IUTtY13c7H74re7wDmHMzuqtBeAwbg37i6R3Y2pqJ3LMN7dHgZZRRSRjhuR8OUhT
         Pw56YSNWj9gIHq+Ox0EGDiR7Zdl9JNZ7lgbLrPya8nxKW8rmjJjXdJYU9/92nnCOPHqb
         BB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9BSkI8G8ihTCxIT7mAPP/NBqIKcGAH08sndQ9lGa/eA=;
        fh=vo7XGEVDQsuVLQ8P5QCuilTyzyxKN0/2cVqBoLNIU9E=;
        b=YU5vIaveU2dbQi8glGe4cSlo/8/ZPnhK/6ruqTBleRj/BLeuEV6UuFgQxNQMi/HpFs
         m84JD5550EfnsDaup3EKr28fDlNVO1vjvYsc90yerCgfIzVoRhvOLWIpUWmo2jACpk66
         rP6HvX+hNYhDXeYhwAZ5ylLShxGtc8U27jgtlwu9/UdSQ6u3FVdua4BgPwkQNxEg1qKg
         jQxpy9fk109/ginhxV92yvmR3/GKEhRdIiYP14482KiBSxZvImaKMR/hUI3cB0WAqC0x
         IqzV/8PqQVjofjgI19sgtXkFmXGWKB8Iqc6bEOcW0tBpUIMRg7jNaEhg3h3gn4zro4eO
         wBSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787079529; x=1787684329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9BSkI8G8ihTCxIT7mAPP/NBqIKcGAH08sndQ9lGa/eA=;
        b=YvEcP6cHzHb05mAvOxpv6w9/uYoKEpBJOnFCpGg+2ARVLPfX/dcok4bMqJHoUyKbV+
         HuhayKXHTnSY+gWK9letNedvLMdOikpGnUKFBC5YbrQtjX9x8hNda61rTd37d3H2r8R0
         JfZ6c1FtIRiVh+KVqGBsDA/rE42VbxLkeHa8gz/RAw8N321KjK9nUQYDD3YE4XG8e+Wi
         bUruoIKbS2CVCJwZ3KMS8oNp4+vbzhEgid2nazEu980EtjFLzYVsjKbDssVct3CenGYz
         1QtoGdIiy3cLMpFuTTkAtpeudPeldcKZPU01s1tKtwFSs3rjj3+FP+oYpV+HzBdS1PBq
         SFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787079529; x=1787684329;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BSkI8G8ihTCxIT7mAPP/NBqIKcGAH08sndQ9lGa/eA=;
        b=Lcj70KHJlwap9Q5r5Mw2WRaXoMzocR3dAGTlq5k01NeOZoODTcB7SWv3ALHKAl9AI+
         4aLrciUMuTpKQ8xp2NlHc3TzjekPVrABDEermKMsbXCpadItmsBMBvmHJhnvyDfsrGlk
         lFRp78bLjnrDvNeHsLOlAmBHr4/H6W0ZPMrHNpJG6Tyf55Qe0viNBtW3UfInhcGtQYCc
         c8Bl5aWhRjfM+HRpOL0q0nRAi6HLZMtr4vawTa0NKovA9HECKef3It0PAv557LwysmpS
         EZgJYMO/oW4npv/BHSwUREvTSdSTep4bb+sRZETin5v0jbl3y3Ca684Gdh/4PORmDahp
         4u1A==
X-Forwarded-Encrypted: i=1; AHgh+RpHTU9NEvXznh3sGP+GSjWghWm9hvS4n/+VU7zWceXkEyqj/K6VkRBqOQmFyuBa8x+OFCZDmoKN9LMq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Qx8oSzbEJclT/s0CtrrM7KY6ViGKCzrjsACTezIuOHH50PHm
	rCtWggKRMbiZrmSUWTlXxgpjDAl4rd9F2DHWp3sGWvaUuv4vlpUH0WMqNHWGG0zSrZsyD9A93xa
	MWl9zem4BjlqSylrAIDkv+fEISDhC/mQ=
X-Gm-Gg: AR+sD126DqcJ3hgDKU2GfePJ17QImJ7g07+WDhkmEgEKx8rdKpo3wCQugvCmVJEwcAg
	xp9BQfRrpW/eyLsuxlNUtwZVGrp+r15LC6OUb7UZn4lgONGjAkmNtPbNY1cdqdg9MVpJNjtboSt
	tmAXHMEt08ktVEBcrbP5gLehgiAIwQiJ3brntRi1gVQK238ZORsvGcwqzAHfBtq2xyHjU1AwASL
	8CTzW0noR0pRcHuGbaW6dpDu6g53LnonlcFagcXhQiWwJoR6PAzGhurjptMsrUrLYPce8IBNb3F
	Jx4TvWdSKXyJ/GSAqoB1h44IWoUNklpbLhcTliUBMNZ+LDszstE1P0nastHXlMnZzcY6CrvTHhs
	Shw0=
X-Received: by 2002:a05:6808:1245:b0:4a3:26b5:7c3a with SMTP id
 5614622812f47-4b241cf770dmr26917515b6e.15.1787079528776; Tue, 18 Aug 2026
 11:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
 <20260818080626.30430-3-amit.barzilai22@gmail.com> <aoQZqnbqoiOw6MKt@ashevche-desk.local>
In-Reply-To: <aoQZqnbqoiOw6MKt@ashevche-desk.local>
From: Amit Barzilai <amit.barzilai22@gmail.com>
Date: Tue, 18 Aug 2026 21:58:37 +0300
X-Gm-Features: AcwNN1X07bZnaFjODTfP2-I0pIQ46TZIiUc18MtLrsRAuThX19xt2MqlCsToMtw
Message-ID: <CAOEgbEpLGAiPRTvyogFdDYXdVrMjogFv=R4FFGwnQ4RpCvHCeA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] drm/ssd130x: Change SSD133X color format to RGB565
 from RGB332
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Piparo <holofermes@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:37=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> > +     /*
> > +      * Horizontal address increment, normal SA,SB,SC (e.g. RGB) sub-p=
ixel
> > +      * order, COM split odd even and 65k (RGB565) color depth.
> > +      */
> > +     u8 remap =3D SSD133X_SET_REMAP_COM_SPLIT |
> > +                FIELD_PREP(SSD133X_SET_REMAP_COLOR_DEPTH_MASK, SSD133X=
_COLOR_DEPTH_65K);
> >       const u8 cmds[] =3D {
> >               2, SSD133X_SET_MASTER_CURRENT, 0x06,
> >               3, SSD133X_SET_COL_RANGE, 0x00, ssd130x->width - 1,
> >               3, SSD133X_SET_ROW_RANGE, 0x00, ssd130x->height - 1,
> > -             /*
> > -              * Horizontal Address Increment
> > -              * Normal order SA,SB,SC (e.g. RGB)
> > -              * COM Split Odd Even
> > -              * 256 color format
> > -              */
> > -             2, SSD13XX_SET_SEG_REMAP, 0x20,
> > +             2, SSD13XX_SET_SEG_REMAP, remap,

Fair point, there is no downside to marking a variable that shouldn't chang=
e as
const. I'll change it in v5.

Thanks for the speedy reviews.
--
Thanks,
Amit
