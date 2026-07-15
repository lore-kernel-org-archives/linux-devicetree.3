Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9217C423786
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107295; cv=pass; b=FIYNg0QHDP2lvF5yyIPmwqmjGn4COm0Jfc+m8Ku+LoKl2CKcFIdxa0Qu5SPGrdnIujK9I4gaMGnMjo7HjCgMxnIRqqt9xCQ8WeGSA/wpZqvQ8s5oEsOthGFtr5zH98XWuCxJf4IfBrEsYSqLiA0L7rM5eboTIUfvsWkqglKbjAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107295; c=relaxed/simple;
	bh=Hd5amGQyf5d7sp4D/OZ6c1BHeDBP0x2XX9BRCpzpK1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ncS7y4aj+g+VIFVJVHbeoVWvE0kweQThFjQW9bXsIuSom0ahcsE5AhpEOVVCNq5G7ZX0x+d5CFVL5lU/WCsC8yIcXhjp9uSEMf9w+5Yx32z+GS7HOmhn85RM59XsLfWnIoLMK5BE5sSJGh2JeXPZnsn5QE9wTVvKuL9e9BJhGEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=LKKRMplK; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="LKKRMplK"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7eb64371a2aso1177068a34.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784107292; cv=none;
        d=google.com; s=arc-20260327;
        b=P0Io3sGaA5oArbsSqxBBrAy18x4VsefkX1NHMN8581Hctuvi5zTQRftfH4iPspuo0C
         eYhqjJpveEkZwRSNiluolrYLXz51m6IX7oLDB3LfiwaaIcznvuZEKeWzANkTgQAwZtIP
         AgljX/CToHlpD1myCVi1H/2oEm73RqH+WFPIojapfLH28c6pxG7oy8KpOZUEnLMDB4Hq
         1OtWApX5dU9aNIGgcWeHqQmO5umLoQeVleTjJDnLvgd8aafex9ABeaSnrruRE3/I6TBS
         3ctxD8kd42IsW/zmYbIV795R3IPpLGXVMuY7YQ2l6Hg8EfRFaorbdMOUDxDStZHsqaj0
         NPbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q13SU6ITtTBdmGlSBxUH2RoASVTqkGnEBShwZvrhOJA=;
        fh=4CZLULb8XVAXwhL8CEqYAFEFTczymjDcvbM/EFl5RyU=;
        b=Uqa4r67XJXe6M/SXJKfGQyKy6B8Dk77EUVQaqDgFe/vb7CVPzlJxkiXmSTvBOsq1pc
         ZjuReG1xP8BHhj/xdCeObDQLYIzemp4rR97fM1SM/qgYgjEGFe2j7vf7qJ9i5goyWVg7
         4jqr9xLtWjJ2P84B5ZZQzDGRqzJ3xLe+LazXdjVewH0G35SHBm72oUGgIeMJHix4gXzu
         B3Bq2s62aMy2TsIUULt8iUbgaNHPuky9yGtd5okGz7DX6CV88Io8Z+Gj+PwzmnnDqh4M
         0oNxhIe3FrcNdp2M0UmGg5zEIDvXsuxL0Zu3EI7gMC7PcfHNzr/gYxezTkRmcpNvflPg
         3bWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784107292; x=1784712092; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q13SU6ITtTBdmGlSBxUH2RoASVTqkGnEBShwZvrhOJA=;
        b=LKKRMplKNRXNvFPkIJ3RNyNrOBHt36SCHHZ4ifdiW0t//H1fwVjPv6R02Phhk0nWuv
         X9sZIR4Erm7o+dD3qBiqwnSAsSkzKm0C9E0MmKdw2cKtDv2phUrWoQVvhGroc8GgKVFb
         +GgZasKoG1LK0U6sHRHA2UCwBZY6vY7blZTlUrngdHBzC0womF+ZCxv9tbFyLPew326i
         wZrZ81n7Q7hLs4lYwkXwj037UHNT5V2s+5Vv2y4I9yJVFJ3HHXw4191+gbZdBoJuDZxF
         UrM/FiUvO/YCLe6m4QHknlG4mRPNcMDIV766VRJ947UZttPK9WT2obkDRxNfPB7BeJ2z
         IqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784107292; x=1784712092;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q13SU6ITtTBdmGlSBxUH2RoASVTqkGnEBShwZvrhOJA=;
        b=lIg6aB6ffOp/VmIEWrHXLhSF/rd+oI2LR5hvGo7OSt+InBsekPhAozzp9iqyjPkGiy
         nLYlPNfjZyq/+Af/suY/sVmP0F9ElqQB6fXqEjrkEqWJK6KZ9ew3XCwBn6P1VccKiEMR
         6jGsmnU3G8oLclHLQT1mVZNIIh7CSe8Uysor+a7Tb8WUpW5YIJJWo0+iWGoAzPSmQOm0
         jX0JPigzC/iXr4t5zDKpJtzP+SFaZNxtrBRlnEtD8VuRHSzRR1YWPtSkjrbMwSgAjBvs
         6SZpPzFJxNcoytRlQ3mjmpn+E3po1pRqdpllRfbRL3Se2A7x7SwfOxL8WOA2DIQMRFgU
         2ehA==
X-Forwarded-Encrypted: i=1; AHgh+Rrr1+vVdaSy/LwjZxLfY20Z5CCHk4IIZmngY93G2Hgcfi8Y59ExGvlC1bVoWFspy8/ELiqiLLZCM/KL@vger.kernel.org
X-Gm-Message-State: AOJu0YxsZDccNOQm1Lf6QNTCG4Pcy4LCFn6um7biDNXFvtaW0a7qRF6O
	mL7vh3y20XG+aR+id2tVhBs/77PPDH3AX/Ci8lAC3dY18X/rt3dkvamSEHIW3D2yf2Be3k6S6xv
	UZctMVFTv8SpOv/STG7kIQQGyez2q+JO79AKSowHPAA==
X-Gm-Gg: AfdE7ckfU5/tcFXXc3ZuFXo6y7HtdFMy/3usx1MWvA2jcp5sKtcZUxkKjRDMA0YzeQy
	0KOrWKTMtVXf9b919AH/bjPRAMl9Iu0SRkE9q0Uc3CsMx/73Y5p8KA+jPdrsE/gB+AJihyQeaGU
	8nP9p2r6job7towaOmgSE4oiXfm9k58QnQNNUiWD/sNhv4hpdqs+Mbv5Ui/X4MgdcP7NzDq6kEY
	Dg0S+HLtLjsdwi6ljVCOWXUZBMgSuTUe1Zu2oSlzzkbSRSP0zrxAQKpxSLKEGG1/FVyoV/7IYOA
	tTM2vbzaZjdunUTyIF2MXMCZzQE0w+mB2fbIMItBduWZqkbdZUYqJwbTgG4CiSxJomFGU5mq/jw
	hQ4jcibi52dX0cl3oet/MJFY=
X-Received: by 2002:a05:6830:710a:b0:7e9:f6ca:e59d with SMTP id
 46e09a7af769-7ec097a2316mr10470988a34.19.1784107292358; Wed, 15 Jul 2026
 02:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
 <20260708-media-imx355-v3-12-9df386a623d7@raspberrypi.com> <alYfNhqYLLP7Ob2m@kekkonen.localdomain>
In-Reply-To: <alYfNhqYLLP7Ob2m@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 10:21:15 +0100
X-Gm-Features: AUfX_my3kG0frO1GrVnJ7ehCBbH7PHfESPzj6OQyX5yeLJHNv31QUmhUkhMWQAk
Message-ID: <CAPY8ntDaA6w44u88hfomYCkbTAiFW14rp2CK0WXGZP+g1+ntrg@mail.gmail.com>
Subject: Re: [PATCH v3 12/20] media: imx355: Use pm_runtime autosuspend_delay
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Acayan <mailingradian@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Tue, 14 Jul 2026 at 12:36, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Wed, Jul 08, 2026 at 03:48:48PM +0100, Dave Stevenson wrote:
> > Avoid powering the sensor up and down unnecessarily by using
> > pm_runtime's autosuspend_delay feature.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx355.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > index ee1f41a66a0b..f01a1a5ae7c9 100644
> > --- a/drivers/media/i2c/imx355.c
> > +++ b/drivers/media/i2c/imx355.c
> > @@ -1073,7 +1073,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
> >                       goto err_rpm_put;
> >       } else {
> >               imx355_stop_streaming(imx355);
> > -             pm_runtime_put(imx355->dev);
> > +             pm_runtime_put_autosuspend(imx355->dev);
> >       }
> >
> >       /* vflip and hflip cannot change during streaming */
> > @@ -1085,7 +1085,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
> >       return ret;
> >
> >  err_rpm_put:
> > -     pm_runtime_put(imx355->dev);
> > +     pm_runtime_put_autosuspend(imx355->dev);
> >  err_unlock:
> >       mutex_unlock(&imx355->mutex);
> >
> > @@ -1436,6 +1436,8 @@ static int imx355_probe(struct i2c_client *client)
> >       pm_runtime_set_active(imx355->dev);
> >       pm_runtime_enable(imx355->dev);
> >       pm_runtime_idle(imx355->dev);
> > +     pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
> > +     pm_runtime_use_autosuspend(imx355->dev);
>
> I think it'd make sense to do this before calling pm_runtime_idle(),
> wouldn't it?
>
> There's also a pre-existing bug here: if pm_runtime_idle() powers the
> sensor off before calling pm_runtime_disable(), imx355_power_off() will get
> called twice. The easiest fix is to call pm_runtime_idle() only after
> v4l2_async_register_subdev_sensor().
>
> This should be fixed before adding autosuspend support.

Ack, I'll do that.

I'm aiming to have a new revision out tomorrow to address the build
breakage in the middle of the set (I've updated my test frameworks to
catch this in future), and the Sashiko comments that the device-tree
list bot has flagged.

  Dave


> >
> >       ret = v4l2_async_register_subdev_sensor(&imx355->sd);
> >       if (ret < 0)
> > @@ -1446,6 +1448,7 @@ static int imx355_probe(struct i2c_client *client)
> >  error_media_entity_runtime_pm:
> >       pm_runtime_disable(imx355->dev);
> >       pm_runtime_set_suspended(imx355->dev);
> > +     pm_runtime_dont_use_autosuspend(imx355->dev);
> >       media_entity_cleanup(&imx355->sd.entity);
> >
> >  error_handler_free:
> > @@ -1476,6 +1479,8 @@ static void imx355_remove(struct i2c_client *client)
> >               pm_runtime_set_suspended(imx355->dev);
> >       }
> >
> > +     pm_runtime_dont_use_autosuspend(imx355->dev);
> > +
> >       mutex_destroy(&imx355->mutex);
> >  }
> >
> >
>
> --
> Kind regards,
>
> Sakari Ailus
