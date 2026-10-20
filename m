Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792507212;
	b=5qW/gCahGjTHdGRLKHdIqK71LJ7v4Yc8ENDceTosLMNZZNLNuu2kEhQWWP7FSIjm5Oqr
	 p2EMEzXfhaNaQ6G2nj73812M4Dvl7f806P2A7YTPb/l1BQZ+AUli310rZBZnNXcJaPjSQ
	 VtK8iavAxJZSV3ncKhmIrHQqPHBgx8JH9HO79g8k0iSUOiaHaeSg4SHgZKOVP1aE3LPM2
	 Scd1B/cb7Y2tBviec4KzdGtJHEl3aQIjP9HmQiixbS6QRbqdAnxmItVfZf0ZPjOGloUrZ
	 c0OxBhZiC8Tbc2+mPRaKYK4H8kn0RzGrXepI+HYWSmTyNa8i2vwVdErPjVY3fE7UxPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zAYhqF7UHNil85yBBTWI6ys7OAUDS3/xjzlE+sXIqIM=;
	b=N/JU1Fqm1dT4pfqVksT9Sb5w4lakNWJvW5uheSP5vmM05ZWKot4O4oGYVSmHNV+gVR/T
	 /oyDS/rXCIUm+ZlTr4klFIH6RUjt7b/dnXn4kEdh8q2BE5gDq1hPCqpgfwJskvm/DyP9/
	 ZYU4CJ5DdUxgyDGJ3koB07wtu9SV+amOFRt1HWCvN//T9ssYkqs4YqeVBroC7C+uzikx3
	 3M0FfK4GMJO4L8Zv5RE0k66oyHl81RRV7Bs1dFvRy/YtGLBkbxoE7Wc1yQGIJYguFqi2k
	 +DA+xosOAaC5ODTUvRq2LlzZ9Tv56FB8t+TDRqU0FWL7IMgiiz2W+bjkUQZtLVgyFeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Z6ribNwS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE288606A321
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE288606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Z6ribNwS
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70094949641so709752eaf.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792507210; cv=none;
        d=google.com; s=arc-20260327;
        b=YtKf6nYGzQCa9yqOPIGEYQkJITHlb34PjUBsSlps6O5j383iyj+mseX/4qoZiWuZq7
         NiLznU0gL9lyPRKEYCan+EPwZ5DtflaDZ8/Z5Y2e4bKNMsOGI4DJ+cJaz7NV7orSMiGo
         1VHYe3X7i+PlVfppWd9Z5sHXDiwkrtkri/z+MjN6KhsebqHsF5rztFq6asf5yIa4zh74
         RzxxyMRn66Y9YLs4Fm8XH/FJjZIhB3JXwVKFgthAvb3hd0rhZNOrOPfoeNWsIHEIQ5y5
         Eg0g1LC+NCEVLuMsUYaQtAsLNp97CU7iavjGNfZttW4+nR/1KvTPmc96rPQx87lMDCeO
         jpFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zAYhqF7UHNil85yBBTWI6ys7OAUDS3/xjzlE+sXIqIM=;
        fh=adcJMZDZl4RhelsNmR3wNO9mm1pEJJNgznevP4/NnlI=;
        b=GC/iMKpisMbHCLi0+zD6gsCKsfRhKmS0F9lFxjlWhU7X03g7+MTqwgYRxFu6eCi2v3
         rYv8ow4Hidsaj845EhLfQZnKtFGjBESXVVLnk0Tjz4/vVR2FB0RsWqPRCcE9+4RzRz3n
         /tI1Sq2aDU2Mp0AHwUNIwThg8l0qZDXL+z6cDEFAT1XqwV1Gy2OXEsXbgy4tlWPPZ90w
         W1KNxp+5YkUOLcDMPXDlcNdSFWt9ADUoLR/0AIiFncyxFyffutvI/Ki1YxgfRKBZtD4o
         sHbbjk0Ft+VBE9n24X++MJ7SVxxWPBS3U8B5nnwoL11yFMssJv4dX8zVrbVTZ18ieTY6
         RbAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792507210; x=1793112010; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAYhqF7UHNil85yBBTWI6ys7OAUDS3/xjzlE+sXIqIM=;
        b=Z6ribNwSkuRORSRUqgJFndKt+a8pNkfz+uixDZBj2RIOvLAexORAwbiSKcQUVGCjop
         no35lkWv9bv6vKlR8fbjqwM9NDFMSs7PVNzOG059ZrH9BBqxjCeiS56Yo2HUm46Yp1cS
         KdMO2m7IWh5CC05+ItHv3vXvOMsde5bPxkYUJdhEfbmO8YOoM0g9+v0FLMvJVDrqo0Dz
         npsVT+CmXl4AmmCH9Mp2ZyIwqARrrJr+fZx1BbWiHMRtgagoNolGfVCU8QRJ9mTMygzz
         VIYfE057NaafOemF/r5oX5sh5UF+HIDpV3sRJdp1bOX03m3OwrlIh9aVXr+CRhMtyceS
         aTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507210; x=1793112010;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zAYhqF7UHNil85yBBTWI6ys7OAUDS3/xjzlE+sXIqIM=;
        b=22dSaipk2JpIUaG0PjPONfCkqjHGVMxOXY0T3Ag+NPPUu+qqNdraCVK/OpJI1sUXIR
         ScfALcJffIH1pos8WoppwcsIhmjPH8omYqDFeEsAeHYRFbDJ5R4YRNN7nS98Az1qxRms
         XS12wxZboqrxWFekG8vVFrK3YuWde+Y1yyBmuVvvkXp83wT6nZKfcWE2CKbOvkL8hwPM
         QT8HNXo3VqMRw35D6WLMa9La0I5BYC8mG1hNc1loybwFcykli8APFxqHZDeENoOWiGXZ
         Kvcq2VfVxMf+JUe1yBmCaCigQtAdNxXJAKl7cH6HmWt8gHN2O+FXevdbP0Uc0iwVoq81
         7wYA==
X-Forwarded-Encrypted: i=1; AKwUvBxxvfqV3yKHKZ9aAnTjuLFR5iHda/r7007nFiZek0HoCfn0k8bIjqSaTFwjqr3NasL7NPWJz+9dNbIi@vger.kernel.org
X-Gm-Message-State: AFq9FYJxwp0IwIzFwrWPzW9/Gy9AAE6gZZHeKoa+QG+iAKtWdeBoAXIg
	+yYM9RvhTR5XSabzo4W8s3e9msbPyvUewrfDzhRLPu4IB73bYUyX1Qcj13yy0Rq5KqMPafsOlzK
	xdbQ41zoGGfnj2bnnZ4ZrfYhTje/Nhjabt+OXr6nA7Q==
X-Gm-Gg: AYBFou2m8MVus+W2mJ/aDJtKLzSNKh27EatKOxXeKYGg31+/hV8iSQINIdEDBnFaGDN
	7nkXcM2tjovS4l7yD4f/xYf916GVbqiTJ1ZBN+hx6+wyIty3xey0Aa2gc4qcMG1DrSEqTcgrYn3
	Xwtmb0Mgl6k1bZc7Fj+CZ03GfBZc76Jat7WRWuQE5fue3Qq95RzcDE9DkW9ulzN04cUOuPkwMXl
	9xGjddZpZsZreZPJjQ6mRnRPSwhBDgYSAjEVdmJQP5fIX0bumBZeX9HE6FOYSidFvi82/aXKvUn
	QPtioo5ygRT0zfV2GJVavnUh8NIFUiwCWDO39qr4iY9lAgA7kcFs7cr5aqjSlaRewyWmwFiCITp
	hY/uBz6GqAKUUesAzQ0UQwz5kNHSujaxUfrhR5xrV8bI4dPIQ2qfw/3ddns7MUhjTyoGfQ4at
X-Received: by 2002:a05:6820:2d03:b0:6c7:8dab:ca1a with SMTP id
 006d021491bc7-707bbe2cd66mr1550317eaf.17.1792507209625; Tue, 20 Oct 2026
 07:40:09 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-10-75fcdb4163f3@raspberrypi.com> <atc9Uxt_hsyYu2o5@kekkonen.localdomain>
In-Reply-To: <atc9Uxt_hsyYu2o5@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 20 Oct 2026 15:39:52 +0100
X-Gm-Features: AclHuK_b39VaTdZ3dmgtb-s5SV-tLyOzJVne1uRjIl6FFmaQNj3mm_E5Od-ztsk
Message-ID: <CAPY8ntD2C-7UTKX2Srusn_Tzx5KS3tnUtPP+piMYbUKZP91Rpg@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

Thanks for the review

On Tue, 20 Oct 2026 at 11:07, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Thu, Oct 15, 2026 at 04:57:36PM +0100, Dave Stevenson wrote:
> > There are multiple members of the Sony Starvis 2 image sensor family
> > that have the same hardware requirements as imx678.
> > Add them as options to the imx678 binding, rather than duplicating it.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
> >  1 file changed, 32 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > index 098f72544216..027872a134f2 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > @@ -5,7 +5,7 @@
> >  $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Sony IMX678 Sensor
> > +title: Sony IMX678 and Starvis 2 Sensors
> >
> >  maintainers:
> >    - Jai Luthra <jai.luthra@ideasonboard.com>
> > @@ -13,21 +13,47 @@ maintainers:
> >  description:
> >    Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
> >    image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
>
> You could rewrap this while at it.
>
> > +  It is part of the Starvis 2 family of sensors.
> > +  Other members of the Starvis 2 have the same hardware requirements, and
> > +  therefore share this binding.
>
> This paragraph could be rewrapped, too -- the limit is 80 characters per
> line.

OK, I'll rephrase it so that it makes sense as one reflowed paragraph.

> >
> >  allOf:
> >    - $ref: /schemas/media/video-interface-devices.yaml#
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - sony,imx678-aamr
> > -          - sony,imx678-aaqr
> > -      - const: sony,imx678
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - sony,imx585-aamj
> > +              - sony,imx585-aaqj
> > +          - const: sony,imx585
> > +      - items:
> > +          - enum:
> > +              - sony,imx662-aamr
> > +              - sony,imx662-aaqr
> > +          - const: sony,imx662
> > +      - items:
> > +          - enum:
> > +              - sony,imx675-aamr
> > +              - sony,imx675-aaqr
> > +          - const: sony,imx675
> > +      - items:
> > +          - enum:
> > +              - sony,imx678-aamr
> > +              - sony,imx678-aaqr
> > +          - const: sony,imx678
> > +      - items:
> > +          - enum:
> > +              - sony,imx832-amr
> > +              - sony,imx832-aqr
> > +          - const: sony,imx832
>
> Should we also have a sony,starvis2 compatible? Just wondering.

I deliberately didn't based on the discussions Jai had with DT
maintainers when upstreaming the original binding [1], particularly
Conor's comment:
"Remember, having distinct multiple compatibles for the same hardware so
that you can induce different software behaviour is not something we
typically permit. While we do want to support all use cases, it isn't
always the case that devicetree is the right place to do it."

Sorry, but when time is limited, IMHO debating dtbindings just isn't
worth it. I've therefore taken the simple option.

I do have patches that implement that compatible and fully autodetect
the sensor[2], but I'll keep them downstream.
Doing so means that we have one common overlay for connecting any of
the supported Starvis2 sensors to a Pi.

[1] https://patchwork.linuxtv.org/project/linux-media/patch/20260520-imx678-v3-1-8b5f9676486e@ideasonboard.com/
[2] Currently the top 2 commits on
https://github.com/6by9/linux/tree/mainline_starvis2_v2, but that
branch will get rebased/reworked.

> The driver isn't generic still as it requires sensor specific information
> to be passed to it. CCS solves this with CCS static data (via firmware
> loading mechanism) so there are no driver changes even if the capability
> and limit information can't be obtained from device's registers or the
> device requires MSRs.

I'm assuming you're referring to the patchset as a whole as I don't
believe I've used the term generic in this patch. I'm happy to swap to
"common Starvis 2 driver" where appropriate within the patchset
instead.

IMHO Pushing the config to firmware files doesn't help, particularly
as these sensors don't have a common ID register and so identification
isn't trivial. It also makes life more involved for a distribution
maintainer to ensure they're picking up the relevant files, and that's
assuming that someone is curating them.

My aim with the series was to reuse as much common code as possible,
rather than submitting 5 separate drivers which are identical other
than constants and arrays of registers. Jai now has IMX676 working
with this driver, so that would make it 6 variants. Refactoring to use
a firmware file adds complexity for minimal gain, and you'd have to
special case IMX678 so it worked without a firmware file to avoid
regressions.

I guess the common core could be refactored to be a library, so that
you could minimise module size by having the sensor specific config in
a module that depends on the library. You're talking of saving a few
kB uncompressed though, so that would be quite extreme. I'd be more
tempted to have individual Kconfig entries and use #if
IS_ENABLED(CONFIG_IMXxxx) to conditionally compile in the config to a
common module.

  Dave

> > +
> >      description:
> >        The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
> >        variant (IMX678-AAMR). The variant-specific compatible describes the
> >        exact sensor variant, with the generic IMX678 compatible as a fallback.
> > +      The same applies for the other sensors in the family.
> >
> >    reg:
> >      maxItems: 1
> >
>
> --
> Regards,
>
> Sakari Ailus
