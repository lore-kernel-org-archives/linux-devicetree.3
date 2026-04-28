Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C1E37FF77
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363732; cv=pass; b=GjN8dxxXXI2/pgND+cIbMYYTzFJsUWKq6OEAZKEGRbvztZ9Hys3zG8O+rjMC0vhDkZjaGb1jEFNc4ynRkxhOgmOGlfDQlSxwFeSKzTcVU5FLdL5shpvnwfvrezCquuLblSpyRs/wOa0UIDIcQX+q9IkSsWTq96+VbaRC9MS64IA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363732; c=relaxed/simple;
	bh=7UEwv92PoD+4ILJO8JX/q3C3X7YrwX0Cm3GLepTk4j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g07kzktBGeZcv84ARIt3Eks0d+OihAuoAJZ2JO0Pv5JCMtBXONYQkaXkPh0B+8lgRD6jEb7XJqsmQpniKzDRQi5272k/vFQvHbFz2wJBoBQNeMlvbqe33Gq6RUALT0+/NmORS1TYxBXwxmRIuRAT9/SHXTzoY91K15+k6MJMZvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4mKZS9k; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4mKZS9k"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-479ef2b7979so5118262b6e.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 01:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777363727; cv=none;
        d=google.com; s=arc-20240605;
        b=bgoNL8yt9yEpVjd9FGx06QabK/WWLFR8vHl5L/kBTC57np+61oE++vPWHs6hciTb7Q
         +iZ8mirTyB7xezj1R8TE/l9IbdfvqyF0EFSlV0cuf1QIF6fCY/JKTD2Zxzrkd/MTQUHO
         TkhMjXccMZNcJFXDu3UlpNLELtvCiK/i5TMAwnLyZ3QXRSZpouy4HRyVHM00/xR6Rrit
         z8rpUGRD44mdM+7BXf0BOXsPzg0ceEdk6thlvdbvsaJIkO6Fuwjxo8jHvomnR6dtGB6V
         N4yjXfeCh1HBmKy8gqwiB2tJH4j/U+JXguYcYyZ/k1s1LVvELzBI5E5901uYSJWHo5xn
         JV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7UEwv92PoD+4ILJO8JX/q3C3X7YrwX0Cm3GLepTk4j4=;
        fh=5LoNg/1YzoRYGNsA1B3wT1uiidprwGsLATQPWQUaFGU=;
        b=EQmKMxGbx9DeUg4Ll2Uno5Frd6/bfw4jcSggVVYLZnq9XrT+R4vxxRTRYG/ECzA0Yk
         LU7HNY0QdNdL/8y8tTcy4tNC93P5FTxGAtFERbTVplkrFQhFy49o2vS//R8LNbacPiOH
         nF2zdV1ZkfZmPK6WjyK39CuD7zlK85t1lJ8yVcais/qqaEWZtADWXfmsUq4Ohp15YjH0
         6t2hoMQ2o9XViDbwXxQuoGt5QVAcARF76hQgxsyRSpHTVa0nrv9kn0W1WVdxxUs7qsju
         DeNBfS4ciZE8jSnSUTK8rzJy2AqHZPFFzo9dgBgEzeL9gPCm84aVKJzyaEVJI2BxzvTT
         3fNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777363727; x=1777968527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UEwv92PoD+4ILJO8JX/q3C3X7YrwX0Cm3GLepTk4j4=;
        b=A4mKZS9kiHa/y1a2trFt7icvLYCkOKDuGJw5WUZGqtaJnbOW+d6xrjJhuTjTE7EKG1
         m0asNoXvEVOyA97sSZgY7y8ASN6OqN75o+NQemUBCThu9tKCd5y+ERaRW3mlyMQro0DK
         OQY0qEKy9SYWezMdGHYtL4LKpjWZX6Ihm1PsthW1OekUsIPQ0IkfusSN06VdwSF8dtrI
         yUQw1/TejqfRESfPjkjffwiI4WwGt05jfyrsab5hDViMexCr5kB0VpFCpcwsfwwXUF4m
         rw3vARY6Snhlb+zUX8OQer22BGxIEGgp/yXFBm7Y7vbC3IavE7N6RcvXCANL96XEHWWc
         PCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777363727; x=1777968527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7UEwv92PoD+4ILJO8JX/q3C3X7YrwX0Cm3GLepTk4j4=;
        b=PlaST6hx2FT0TJApbbgKQ4SuCURm9ZiU+mnygaPE8NJWLsy2M6GOV04oW/IVsC7LoA
         px2ou5qTAvkog7bkZrrSb0bZotiVNhL9H+U0SEx+rieoRjS1kxSK2PX7xE+k4A5zTVC7
         ckXalR9/BT3VSPOrfEHjSl0MWsTYtcLeHpXEn6V4mclxAJHsFeeACVgg8FfNpzE+NU8/
         MP5rPk+D8mFsoTxDxvs4WBF7sbYxzglT18nLGLJAL67DHB6w3ElqNIx1NOwn8q3v6d/8
         0EwkqP5IWYbMt+UCLcKlGvp8qmfR38cfOD6hkNEDovoNLFe+ZLEpmEj8vG8RFMSdR1Nb
         xzug==
X-Forwarded-Encrypted: i=1; AFNElJ/XWZono8UqQOoqy60eeQ5dlzOsbzVuIrDuNTataAKGT9uCPqwMJ2QPN8O6QGSxWwtXr33ajXTVfPTB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz22NHQCcLkHKS3fELOIRo/Ir0yhENgP/DhQ4Ye1kuwIrIlHbo0
	OKcf5MX10HwU/ghvcHF/etURP9SypdgOd8DC2wV2Dw2TbSSewk6U36kQeM7bm6AqusrQPSQleoN
	KSzUq7fK6EZ+jkMXFSsWZyUkE388r0Zw=
X-Gm-Gg: AeBDietWKUc+s8voY7FXCKu4VW9+Y0WxN/OlslAij2g4cZ5vGuyK/Y90cXVJFKOKZGM
	/EWwkC48mIEZ4RCTYlcnUfzXsKT0iwSfnUjrExKB0nU8bFsFT63fMp8rZ5q6fYOLllH2E9OAoqK
	GhtUvhnZQ3Pcrtb2KUgPVF+JaO70+sbqDoY3QJQr+zzJiowGBhKl9B501+gs4LDnPgqIHm1YHxA
	/Mz5OKahFXPUcs6muzMFbf3aapOEVvTvLrp70Dpk815XTA6BJ6YcRTwcAG/boXdnD8l/qg4rLEy
	ePgX8WJkUd42PZvMeQ==
X-Received: by 2002:a05:6820:f004:b0:694:9c29:c288 with SMTP id
 006d021491bc7-6965cb787d4mr980070eaf.40.1777363726695; Tue, 28 Apr 2026
 01:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428063224.3316655-1-syyang@lontium.com> <fe73b59e-bbe2-4452-8bea-1fe1ea09d4ee@kernel.org>
In-Reply-To: <fe73b59e-bbe2-4452-8bea-1fe1ea09d4ee@kernel.org>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Tue, 28 Apr 2026 16:08:33 +0800
X-Gm-Features: AVHnY4IZADbXY3ILR908Azef-6srzy9Im9HPPnfOtJszFXPeyNaoufpsUDkQ-Hw
Message-ID: <CAFQXuNaQdo-qE3sQs_pjbm4tLKqEGJYZxkuwWokVp5VpbxC__w@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add Lontiun LT7911EXC eDP to MIPI DSI bridge
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
	rfoss@kernel.org, mripard@kernel.org, Laurent.pinchart@ideasonboard.com, 
	tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com, 
	xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B44=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=BA=8C 15:35=E5=86=99=E9=81=93=EF=BC=9A
>
> On 28/04/2026 08:32, syyang@lontium.com wrote:
> > From: Sunyun Yang <syyang@lontium.com>
> >
> > The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
> > and output signal/dual port mipi. This series introduces:
> >
> > - A device tree binding YAML file describing the hardware
> > - A new DRM bridge driver implementing the basic functionality
> >
> > Signed-off-by: Sunyun Yang<syyang@lontium.com>
> > ---
> > Change in v1:
> > - dt-binding:
>
> So explain me how does it work:
>
> b4 diff '<20260428063224.3316655-1-syyang@lontium.com>'
> Looking up
> https://lore.kernel.org/all/20260428063224.3316655-1-syyang@lontium.com/
> Grabbing thread from
> lore.kernel.org/all/20260428063224.3316655-1-syyang@lontium.com/t.mbox.gz
> ---
> Analyzing 5 messages in the thread
> Could not find lower series to compare against.
>
In fact, this is v2. I made a mistake.
Link to v1: https://lore.kernel.org/lkml/20260420023354.1192642-1-syyang@lo=
ntium.com/
> Best regards,
> Krzysztof
