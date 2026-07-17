Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A6A397B05
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784270226; cv=pass; b=anPIlNwqXfCb4bEYMetdImQIAcCK5JYb1/x5MlZW7feb27JYOAOPX5zJehYOYOjbBUA4QxiUCBOhh0BMl5creszfK4jz8yOhcEbUv5X3v5vO7HlU1oW6/f3XjnQfJrvZA8EmS8dRBNkkKJZcT4v8g4zbZVDTWuD5O/HIWrz3Gt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784270226; c=relaxed/simple;
	bh=FQcK5JUiP/gXgDsJI8Rp9EcrkBL1pDWQ/i2WTxSogpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lugB39+CpzgH8yly6eTYMUMcq5zJFGSviv1LUg1iWFmplK+1MhyGj7TUTjzSWDB7ZYFniN6XRUc6FC27tvWoWvTNHBoS8Sh1aO0zS4l+ydzv2rAkGgZ2CogwYrxPYRdwvqWU44Vdf6TjjI6pKqbksrnwuQyzodW0hlYmc1v2/Vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRBcmkdp; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRBcmkdp"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81eb46f76a1so9024307b3.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784270223; cv=none;
        d=google.com; s=arc-20260327;
        b=KKbSZluB8MAU746YAPhbUMEmFtAZLclAG5nwZr6hQe947ReNbjTxut6i5+9Iel+Md8
         96wziZ0JjxYSeYhCwA7dbm519u4UiM1scxkwkHc2eHTdOX9kUg/ujAMZkrrDEZhlnrX8
         6i3xtjXXa7N+75XEZ+dy4iJdkZa0jLOHhSwh5/Sdm7y7P/nXokx9Qe6/iUyBygLAwEoZ
         Zf672bBI+B383MeHTpcXbOemCuWWmb8YbGzX6qo1tRdj8EV8UycGTl5dxjCXVhqnGyMb
         RmrtSQF1DRNQyAVSbr2j9CXkckyl9EGbvmUvhRFPrKmAOLQ6d4UsS7jz1AGNIrPxWPH2
         AUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lqzO3SUkfmfUH/INNl0EQx6vlwhEsJxA+B0h08XZOg=;
        fh=0l7+PGlRTG8BTXBXQw5/zzuJSGWhiilFFV3nFiqz/LQ=;
        b=s8eMfJ5u6QwKItyoWVU6ZYqs3v8SUgIbQbYyIjr19BcN8xDfAXHBJX1F4KE1b2sGZl
         clvzy73EzjQlj6lnDpdwgszy4LNgxt5V5uC8JA+TmctC/XpMBknD6g0ciApE+FPj+eeC
         cXAWq3YkSck7E78CHoMs/3t9xd80XBwk3IG6t3/2dfPK4/9KvYYptxsIieJkZ7Au4Ll4
         4yLrPsQb9uvHTBly/8QW6uUa3XEX0Pjc37sN+YDQHWYZL65DcL9Q6ZhcvXAlVw6fLpTe
         nPy1XS4ZTP4jt8Or+bfFfd7qAhQ4GR5h/GYudj/4eM/QOMfbQlGNFt5eYKWC8VwJFSUH
         Ax0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270223; x=1784875023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3lqzO3SUkfmfUH/INNl0EQx6vlwhEsJxA+B0h08XZOg=;
        b=PRBcmkdp67sBv5/pEIvXidXyFL4xZF9kBIDVRK6tfDRx0LGOQ0W1xOH82kXbVwLuZU
         7elACLDKep4S6yiOa6LpH+Vh05Yq1tIGXLPWmulKFC3CRCRGsY2EfQS+8Dc21bLBq/IT
         7NLGWShl6bJTPx8rhKQjBrUnygNwogm+wzIMcRR3w19EoYxIN6OeRs91KFwpWuu0ySq3
         krd3Dad1iRbEUY9hbTWNdofBUJoRnn056vNOq6tzTFSXuKm5MNdmhoqBul7uhUoqd8Wy
         JeIueL5w+1aGR8YmrJkPC6hAB3HhhemI+BNUsiLau5fturTngvbYg8/gYWQt50WIvf3R
         bmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270223; x=1784875023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lqzO3SUkfmfUH/INNl0EQx6vlwhEsJxA+B0h08XZOg=;
        b=I5NOrUCW3pqatxNND0w2o0BJOXxu8fXST6oWoVsBCOTkflLt9/Hmg2mGFbtsmcBQkQ
         NRryhP1GN5qJJq/pETantJDj0arNScO+n+2AN1bqkTJMYWWHU/Z6xYPt/X+wsmu2v1h3
         zwG0lkXZkRhQkX+sIUuGYjB9DyuhKX+8vc1LKcXQnWdHkCQ4D3vYNhi4YieSr2ps8ohG
         PuhGWsDx0eC2ckks2upiQYp/sylxuEo2Q8nUk/KZwW+9FAJhB3XUdVxxISN5a4wa6Wad
         LnRQOe+448utNPPub3p/Z+2SOGppCiomit+OzVSwzdZ6XzB76kOwBPtWL4j9QqoTPENP
         ATPg==
X-Forwarded-Encrypted: i=1; AHgh+RoENSHlOdst19A/2ECk+Mah/vhBd8JheFl+NxOCj72Q6aWl3ZTA//Us6gH+qX66Z3iwQr3BniCSmtoo@vger.kernel.org
X-Gm-Message-State: AOJu0YxLPue5+X0Ft3IOHrEq38DMDMlVTvuu8mSXOFBgQDAu0bKmSv6j
	USRNOxu/pjUI2amBRn5Kco04gzQNFcjoO/1bnpf5xwzEPPL/KAwZhR79XN7v3+ctjPvMXzhDQde
	spxRIWhF2pBRc83UO6vaM5+Fr9HX7OSf+xzZJdqo=
X-Gm-Gg: AfdE7claHS0q8QZOUoGUNFLCw988qsPQPM2dIJF91SgfZaIPePu2H2j/eZmakCHD4sB
	CLSS1JTBYInSus/OFOhw9CK99xPfkTMsxP9UUUUlS49xUNuFh+7nwuSgolauL2qZjQI3i1o0IA+
	X/kcSXzmtjSgzj1TKNz7I2UIwMrl4oPn9OwwrqpyjyASWlgG1CB+zrjtGH6R+6iyZjrvSon/n+p
	nBNJc1MBkjpiofOabh5vbCxfgg/MK0O+cvq7BhVSWvUDtk8xwtlT0La0R3EWX+ySVyiq/1T6Afm
	7TlbRHtXA9V4usU92pFPKpQlM9Ambw==
X-Received: by 2002:a05:690e:448a:b0:664:bb15:ca76 with SMTP id
 956f58d0204a3-6683bd56f54mr268674d50.5.1784270223565; Thu, 16 Jul 2026
 23:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715200834.8486-1-royalnet026@gmail.com> <20260715200834.8486-3-royalnet026@gmail.com>
 <3b5092d0-f132-4335-a3a2-b7f9de55d8e9@collabora.com>
In-Reply-To: <3b5092d0-f132-4335-a3a2-b7f9de55d8e9@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Fri, 17 Jul 2026 08:36:51 +0200
X-Gm-Features: AUfX_mybSprLSrIZJBIZmysGtwxzPOlgLX5e-x5hgjboIL5B6eY2-4dKT3CXgYI
Message-ID: <CAEWPSH7xi5tPT4DWZZchJ+bt9jNZ36VMkhoAvmeYMZfhRoen7w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: synopsys: hdmirx: add HDMI audio capture support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-media@vger.kernel.org, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

> Audio capture should be stopped when the codec removed and
> hdmirx_audio_shutdown() stops the audio_work. The v1 was good here,
> Sashiko bot should be wrong.

You're right -- the worker is only armed while a capture stream is
active (from hw_params()), and hdmirx_audio_shutdown() already stops
it with cancel_delayed_work_sync() when the stream closes. The extra
flag clear and final cancel in remove() were redundant, so I'll
restore the v1 teardown in v3.

> I'd like to see rest of the patches (I2S and etc) to test this patch
> before giving ack.

The enablement I test with on the Orange Pi 5 Plus is small: enable
i2s7_8ch (the RX-only I2S interface dedicated to HDMI RX) and add a
simple-audio-card that links it to the HDMI RX codec DAI 0, with the
codec as bitclock/frame master. I originally planned to send the dts
part separately through the rockchip tree, but for testing it belongs
with the series -- I'll include it in v3.

If Rock 5B is more convenient for you to test on, the same two
additions apply there; I can add that variant as well, compile-tested
only since I don't have the board.
v3 will then contain: the remove() revert, the ACR local renames plus
a byte-packing comment and the get_dai_id stub removal (both from the
bot's v2 review, already discussed in that subthread), and the dts
enablement.

Thanks for taking the time to test!

Igor

On Fri, Jul 17, 2026 at 1:08=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> 15.07.2026 23:08, Igor Paunovic =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > @@ -2788,6 +3058,16 @@ static void hdmirx_remove(struct platform_device=
 *pdev)
> >       struct device *dev =3D &pdev->dev;
> >       struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
> >
> > +     /*
> > +      * Clear the streaming flag first so a running worker cannot re-a=
rm
> > +      * itself, then tear down the codec (which stops any active strea=
m)
> > +      * before the final cancel.
> > +      */
> > +     WRITE_ONCE(hdmirx_dev->audio_streaming, false);
> > +     if (hdmirx_dev->audio_pdev)
> > +             platform_device_unregister(hdmirx_dev->audio_pdev);
> > +     cancel_delayed_work_sync(&hdmirx_dev->audio_work);
> > +
>
> Audio capture should be stopped when the codec removed and
> hdmirx_audio_shutdown() stops the audio_work. The v1 was good here,
> Sashiko bot should be wrong.
>
> I'd like to see rest of the patches (I2S and etc) to test this patch
> before giving ack.
>
> --
> Best regards,
> Dmitry
