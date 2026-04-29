Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8847632AAD6
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444634; cv=pass; b=ezmbwf4rGSqHuT0PHbhQI4+miHCntF551pG6xfNqbcSZKSORXiF7aaCc8WQXK6Uj+h9Y1rbhQ9rUvvkJZghw8x8VLar43h20zFVoH2S/T7ewGNzgHL1dxMCIZx9bJbOeTBJhXnyRlScBzBdDaq7mW6Fw1IgS1IdRdfqRCLfb4Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444634; c=relaxed/simple;
	bh=Q2vxHwF+w1NeyIBy9nFRIS4OBMvwxx+orrKuuS0Quww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6MTy/MetLCgceH/hUf6UxVm1vTzBYvSCUdu+PQSrDsGRyEoeuctJcmi0tShYNfQQcKlDY2awi7SKLzibgZUHcdmj2mbrJkHIYcLZ8oSLq7AYVm6A42gFN/mQegUJxOitYE57cxCN3q5CSs/SuoB45PIPxQ6kyL3DfX75TwKl40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhcZB74z; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhcZB74z"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso7589196241.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 23:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777444632; cv=none;
        d=google.com; s=arc-20240605;
        b=GllKjGxn00SUFMqxrUwFfG6IhjPKcJB2P4D5ER9ro14gk7tavO2QFnH1AYfHydCRBa
         ez+eg6r4Cc5QCfTVh0jS49GpK05Jz/Cd6doM+uuLKLRiZit6os9WKAqWWHzl4i5MKg/f
         HlBH/KbWRryWSPPFVPXn8rQV5+r+QEEdmL++gbUz/UjxukajblVWJAyKJG4gPn6YJD5U
         R0mXQNFLky54FVqWTol7M8c67tiPhXYD3dYLovjV8/TAY9f0JOmXdgOhwp99c3KJx24c
         6+qlU34ZuAPpAOf1jpQL9KDdCryvFefXbyteIT+wsNkMlvHunNlMa7V+zXidiM7EE3Yj
         lJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J4JGbabSxe5kDg/hMbP2sAh1Oso0gASiI4ZSnSAcI7Q=;
        fh=YGoJitfZqUqCus8xSFLRb5BwTEJt07V4j6kdZiMob9A=;
        b=GuPSGpezHHKrLZXVU3bGQC1/46FgN8kO5kHntEpw40GePZ5Q4/QoEfgySPUQtsmUWs
         Ox/jJMt1hHJZwl8sa4WA968SIYyxuIhBeajO6cLzD3M/2JtPDegATCPqTVn6whTh2U3x
         kckv35bj1l+KGtzhveevZqRKQpRu2/RUxvrA0OmamA6P8Xt9G1DKyjbCoSVUoxlL/IG2
         9RFJw9BmLBPey8gWSpzveFUinW0aL/m2zX7zfZDnLmuXZDR/HztHi3ZGrXMSBvrV8kUO
         d++xQS9iFWvn4h1ExMfKzB2arRP+ErqzAW4LqwOziHYxV56zQsUR8oI22J+auflCdnxF
         BLiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777444632; x=1778049432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4JGbabSxe5kDg/hMbP2sAh1Oso0gASiI4ZSnSAcI7Q=;
        b=IhcZB74z3qTipT2irKKaBm66Sy7n9HXXjdb19VgPXRN/Ot4hktTLvgGDT7Xs4ydD60
         mcmy/OyGLYKg+shxv6SM/hpJffQhE144iHHHZnQS2902ShxD+gUJgXFFrknLIVkxxaSP
         YZAQNbYL4j3w+yB5Izr03sgaw9U7KMw46v7MZFOsjp2poscSTIgYKUFV3Z5R3A6CXsSO
         xgnyHBlYilE1UNR9jhEFojsZUZJLl78/vwZ90rTD8Ho8qaclvdlvAI3Cu1z5fwVgVkG0
         KCedrTMB8jLW2eZ1+8ElMwWH0xAdSH/q+MkSqDL/+rXJbZ2X10utlKCcE1Y4e8eFubBP
         UTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444632; x=1778049432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J4JGbabSxe5kDg/hMbP2sAh1Oso0gASiI4ZSnSAcI7Q=;
        b=kK8KcsXyG59NgU6HwSBU9YgOPuw393PvJJ2m1V3Lh+T6D+i0ZhpQr7OHbebae9r4Ax
         6dlr01d1BAMQgBF/F+PL7a77XJz74kGiZkRrnHJLSqAiPEE50BF+v1zpoRTiR8og2rAk
         8XteHz6HGO/cMKOE+7D/6WaKeeK7EZOpk687wEIjK3BKU27bW8MBYojSc8ig8/d7bihw
         3lR4SQatn2piMgZoYMrjOaRHyxYngMDQFheJgq8dm4q5BivgMbEEGsX3XU7xL7UnrMen
         OVJeWD+1i/CfxIjJgAd1YuQb45E4TW+0JPyq1kHN002LZLmHBUNQQd9RYLAo7/1uTk3+
         Cuog==
X-Forwarded-Encrypted: i=1; AFNElJ+hzP0vonye7aLNc3TRnW4EUHi0DOsFnpR7/Qz9G/LqEj4fvtmBRuIlr8SFVOO4ezYqcpyL9oY7F1ms@vger.kernel.org
X-Gm-Message-State: AOJu0YziTjbM3JlYQGxF+UHhplox+ycsbNpHvCC7eruS39D1qSn1xvz/
	rqN9vivohqTz3Q0jjvY7/koCkAH42NI0FouSo5EhmM+zgCDz2zqXTsR/v33bilZntReAI0clnwZ
	9SOYlSbwxh5PKoZA2eTOZahq9gFphPCo=
X-Gm-Gg: AeBDieubGwBapjgeexFlTXkpJt4mWyvaMIuPHyXgzlW6qUGrgVUaCG4bHQww1N2eUCi
	Jzx10A7Z5iHnVWS1Es7VELh4HjEF812N1eWXYUxoJCRgDSfUVTVLxQEB03T1IXQpRUEIxI1IZy+
	e3eyD9rvLgVctxoQ2CcebovjRwMJRk3LB/mxlSFkMzBem9QMoTGgzLO7AbyeEQBFaIovhX8AQzJ
	IhsYyJ7pC9sRNBhkZg2W64S+gMZg0Qt8RHQ8n6d9il1roasBYA/oaFD/BWMORIK0s0FmgevYoUd
	qvz5eMpvbLBpizRBVIp+lOGMH1Sz8jJ/7bRG2k417dRE7H0L6Q==
X-Received: by 2002:a05:6102:1609:b0:605:218d:ae0f with SMTP id
 ada2fe7eead31-6280a9b9ae0mr3204992137.18.1777444632395; Tue, 28 Apr 2026
 23:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com> <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
In-Reply-To: <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 29 Apr 2026 14:36:21 +0800
X-Gm-Features: AVHnY4JomMW4gOBIDoscYuhdxXx5fsSdnFlsuPTfAzSM9S-h5zn83OQeXtICICg
Message-ID: <CAH2e8h6AvtaQjrwOu-QumeqYVoz6GyQPRR363JWfS8Wy-jNBkQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Kepplinger-Novakovic <martink@posteo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 9:00=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/25/26 12:52 PM, Pengyu Luo wrote:
> > Hi846 is found on my Gaokun3, descripting it.
> >
> > Note that it seems that only Goakun3(3.0GHz) version is equipped with
> > Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.
>
> Are there any other noticeable hw differences between the two variants,
> that could warrant the DT to be split?
>

Except for the cameras and cpu, I think no.(But I couldn't tell all
3.0 variants are equipped with hi846) Before camera support, this DT
worked for both of them.

> [...]
>
> > +             orientation =3D <0>;      /* Front facing */
>
> Please either drop the comment or s/tab/space
>

I see.

Best wishes,
Pengyu

> Konrad
