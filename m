Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC07333438F
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 02:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600526; cv=none; b=blXBSzkiv4cF8Y+/IcgMF6XHal6DhrzxfMa4Z5q2iXWeKx0pdxdTtYMPX+x7Oat+I9reIasGHohsoQZEi5fw0bauXUxhvv9BvHrQ7LeR+WtC2pCuii9wOgV88YAl9A+mKlZrtwS949fgxf/6bp8Zg4cZm1L+3fIus/cpwCCP0Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600526; c=relaxed/simple;
	bh=PR8UKdZZVI65hHMoanhVFfK2UYdeJJzvlhtOcX9oidg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3H0vO2vY7Z+fpyfEB9EG5EscPD6U0PhzjeXhN9Qf/EwKw4kmXPfuVXhfZm+W4OGIf3K56n1efJPFNn3lrPBAwO8ciwp298igxZyn+yMZufAxYzQtLB8zOxa8HRKdUYyjQP8pwXuM6pXrEzNsOWOkqhbb1zRxHUfpHJrTtk7E6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YndYrzF6; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YndYrzF6"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so194875a91.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 19:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791600525; x=1792205325; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=;
        b=YndYrzF6jCtaHnRQgKf1m3MRopG9sNpN9THcpHxcxO5bKaRZKuKRFxcfkKvox18KQ4
         gER+ddoaUHD+6fcJrmxUx2CJ806r5ng3HT07x7f7kG/SNTqQAJ4d25RTFONVuHBrCq8Y
         nfsgnKxPviVKQlXW/xVU0BJSGl8b0pypk3w6kszsp0ZU47JAa+iBn6l4suCFDw2Ch7Iw
         kpXhBBTvyu2R4+8MpwIWuMIZSce86qtd01yLTAUhCvL9XoGavdBNeLFFr1rcgQPsc9w3
         Jn0u3ZMQHoxCrDUP1/rDRXn4pS5z2izqP7fhPOn1qiZ37YKHbDmiXqgH+QWeyyJpOwSb
         5uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600525; x=1792205325;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=;
        b=ynZGHS8rrV4AFng3BGtcfQetakQ5m0WiRmloqk3D9JHrLxb01SMtvxqsEU/zbQRY79
         4DRX3CFshbZD5+K4iSxanzo5Op9z7hNww9D8zQ9HdrWJ3Z6kBDT0mBDOjHbwz7pays/r
         9UK3G6c2myehheEDEdLXpVoCPfdLXPC6llD2m9LMOIFxWOls3QLgWACfC8TpX723/6+M
         6iIUl/q6RyGjtwBuBxiMw0HprgVkhs2cZYHgJ5XNrQymEEOLTiaPo3Lfi6tWBDLxkno5
         ErRebLPwiPgT3juASEiUJB4WQUJCxLubUtMSq0rtEXm8s/msFV+MpY2K5ouorEgs4kiV
         oKzA==
X-Forwarded-Encrypted: i=1; AKwUvBwLMx8tP42NWLCJNC6clsIy6tNQTSodxxHKOBDXt+q8mh7qr2VXfhpDpguYlfFdsIv7M8mwM57etyVi@vger.kernel.org
X-Gm-Message-State: AFq9FYIMAE6P5eExIn1cbeCdA8EFVuR+wOMOUWwon+nSx9SbmutMBaZs
	6h75D1RjAAsSqUQJiaJ8EqbjqQc+HwyKKweQv54NDWWfa4wO4f5HK8rs
X-Gm-Gg: AYBFou0zrHznbHAa/QeE3fIU/CpFBQ5b6cbSd/n61lNdQi6L6LpF9fQr/yTRXB6zagE
	BYIYmgNqDDu+couNeqFjlma8svzGZKEDdvT80d+LuK5Z/MJON1Xji8OFbKxivpWResQhCqExnr1
	32rJY6GgXUyvPDutXxTAMxT1ruQGFYlTqeFv6m1uaFNcoQ5hgi4G5kIr68QXNUKD7EzqGWHvJOV
	UxjjUSWYaye1de+2ogyIkxeL0uxxY+QGH7SuOyl3JM3oEDBBQLL/9zsokPmyxccvbMrbtZtaTQt
	HuB+h8BzcEHOus05eVMLMlmvU+yBtiylLKyblsYFTLy63ZgBOWhuGcn/CQ4qakLstE3RVra+oIj
	sOgbOLl7htrvOA95XlmBsJAHG9cVwQTqvQWIHecD3Mh4BVicnj0d+PRnP5Ph+7saKoRnKBH4GPo
	6eTk1j8cLLMaDYq78c9u78smNzw0K0iYdIymJOH/gbCuWHGZvVF44miPA6lT48pYi7qWmQuWg6Z
	i1uBbOaWb1LxuABiGB5bmlJMfRenyyElEBTnjszcQHEVEb8VY6gZ+YD9/EJ31hdK0m1mDsnjqo5
	7gbZwJaJk69qfScEJgEnYHAc00t/R2wW5KjbsSXo3Ev1zQ3vM4I=
X-Received: by 2002:a17:90b:5887:b0:3ab:364a:9532 with SMTP id 98e67ed59e1d1-3ab3acc548fmr3728946a91.44.1791600525144;
        Fri, 09 Oct 2026 19:48:45 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm7675161a91.6.2026.10.09.19.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:48:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon Mac
 audio
Date: Sat, 10 Oct 2026 12:48:34 +1000
Message-ID: <m3VYUqb-SXeeNuWXNMFX0A@gmail.com>
In-Reply-To: <20261009-daring-objective-flounder-c0b66d@quoll>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
 <20261009-daring-objective-flounder-c0b66d@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 9 October 2026 5:17:53=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:32PM +1000, James Calligeros wrote:
> > +    patternProperties:
> > +      "^dai-tdm-idle-mode-[0-9]$":
> > +        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
>=20
> This looks like you put several slots into one. TDM slot is for one
> slot, no?

The codec bus keepers (which these properties exist to support) only
need to be configured on one codec for the left and one codec for the
right. We use the "main" L and R woofer codecs for this purpose, so
the extension of the properties like this allows us to specify which
codec's bus keeper should be set up, as we need to support machines
with 6, 4, 2 and 1 speaker(s).


