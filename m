Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794190984;
	b=NFlS2MBRMHuf54J2HUmzouBz2VodDdd3Q7Z1vei8UJu3+cu6/H7LAGW6uN6o8WdGsYh6
	 HrGbtNP0H8JCSF7r3C9piqEuC1/SCXc3aoj8BO8U288iM+R67qT/U/81/ZaYmNu//3F2c
	 POsH2onTQPhuYimn2qAZIRNLTWeDyvN8CXXIfuD2KwYxDRKXITYtui+U7hY0lc7vukNKv
	 vpT81SJmNLnCeIldBVAN68HLAG9gq3Py88JlV/qigurM23QpNN5KIHthaXIbn+XKenTHg
	 LmT0E+prklEDMwEJZwpjFkXE8BEsvJZri4XFR5P28Mo8EUADAkt1pO3GYtsRNQV5hOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
	b=4/UO5UHzcu6VDUWjSYq6d1MsV3HAoIemaNxUnqBItCQ4HXP2u/XF/oKpuX1XXMMSRWHA
	 AXtoFtXBRyN2VEuYUsZng4NaC7SqwirTsfHNQMRSSMeQ9yWKBvcdNW2NuSJuGGGEiyx7k
	 H2+/CZXk4tivGPEdiBtNnKymaHOGQYfYl2jgHKrq5i3EtGZHwly2SKGJOTKfb7ywN10Th
	 L2qGzTzbU7keZQhqP/kdSMO5ZxMN83n/TStL1dzLnW2QxJA1UGjjK15gK/+S1HrYe21fC
	 aQpuO3Y8ns0rSQ7YikBoKBFZ8LHyLI6gVYLJBFoShkqAuqjHfnoPIqQmMrGAUYgUW9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCMkFxKX;
	arc=fail smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9574F606A320
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 02:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9574F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCMkFxKX
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso185274a91.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 18:23:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794190984; cv=none;
        d=google.com; s=arc-20260327;
        b=o/gqTUCch2VFOI4Os8tJ5GMPCUsCh2n9Cx/oIQ4Ajs6Mj7pilKa5BFv4eJR+AhALhV
         f2GlI7Zbw2roL0lkEL5fbuiyuzLbJMBIrLvbErQBGC4o8iH3Dmmr6M23SuElYfnJTNQP
         JtJYm9YtL5ARotlpRQyhB/rcQwmbfyjMhh/fHfPT773xw5xa6uWkC/XWTRg+YaLiQez+
         SRjVT0FHHI8+ytol17bqvZGkZQD7NalpfO/iDUBNqT/G7ISlB51QIYNY752ntGAVsGBg
         6hqImCW4m84vlWmRlosDk9E1ADTzOnNSV/zL+KXiSZqzXdXx/Lh0Os9l1QCI4Qg4uXtl
         ZnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        fh=ABG/6IwgNHFr2mrNsIYlGbhUfuXQax2bmJCv+/Ic1vc=;
        b=J0vjX5Sl/UoMALcyTLTQcSK2e2KN6jB+cyAYEvLuAP1SlUak2hLWG8wAvFBhsuIMul
         wQjgunl0pF9d6MQLcVmK9gEqGg4aS+ZW1phqzYUxBi1OZbz+toL7wOKn8k9wdceVBsWa
         MWwhOYaMIBY644/vjcsU53CmmU6+wIXUcZjhahcJH8StatQabNCchIUhL6G36bxc6lsR
         l5vxmxYIGK0Kj5FzvU4tCOmUBwvZ3CgOu0mjsoRu5HMSjFvK6uP4W9X0gihZlAhTef+s
         SD+anmR20mkzzIlDH/J2RWBTdegARl4RSol7PxZ9le2yowbD+BpWZLEG31+hCT5a4hbF
         PUBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794190984; x=1794795784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        b=BCMkFxKXZilOqS5qGGm3zfzewgjNuwk+ApN5Tn6q039iGQMx1tnYeShFlkP5g0aptX
         mtRlkVraq2DkEaDbMUdpfZlR4BXbFSXTkySnLKRQ/I2NTWggzuAcHySDasGW70gDDyXC
         Aqo2aKPslSKIN5QMxdI8XFw4SYLYSEM01xtE7ZmKHWPG4sx+He6tS5xMNihqgp0cYgwM
         w3h2wLk8afqVpScQ//Tb2pAJlIhsDzOiRCpNTon0U8VjNvzGLDtg/ma9pJ3HLTKB17VO
         m8GaGRFacLDudVzNYAglpjAhNc354xwCpvv36Beh6ZTSvi+wbXTbC0lz60vF62ALlC0w
         UmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190984; x=1794795784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        b=ZC3tj4+i5k10RJ8HLDw3GkfUNUMY1tCvLHebg5gL+2JYbc9iyFACvP6eSHk8z7dqWN
         CA9ufBMQVl/HJvqRpEvQusF/2yd6UGNKvXj4VZ7m5jQjkeDls9jTHP5QRqh02VbPxHT2
         OqxDp4SAk3xjitiBLHEbQyG7z9dw6qxWFqsUK3bw8U1L04TR+d8SWc7kDcKAwWVPPvQX
         3x3deRiAItDeUm3pHnCiVRqnFMGLLqoE2fG1Ceiy4a+t6JUxVvCQni4mB+1MeHauuXtJ
         vo9xep2wdnxk/jzbLyb1mhCFniG4eZmuv5P/Ra4XKs9SSjS78D8iWsbf2Dy634CRTlpf
         We9Q==
X-Forwarded-Encrypted: i=1; AL+hErE1bn4khWn70m0T5VJZPSK01TEr9jDMBM6/5pxmhyu+kgAyhkNV3L9eYjthvM26xYKB03k1wb+5RkCF@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gb8sczKO8ExqvxNmmXoI7eru1fq5IM4eH9UNle31SGYGfkisI
	OeVOItIJhB13FL7Sm+8r55+EnZHQZP4r/6gNAKfFrSGkO745YdbfY2IJ5xRtFSKZCGG5n1+76cc
	mYNuWz/oKkJJZyfDHgdITh2vfIjNSDRM=
X-Gm-Gg: AYBFou0nenAcWFyoilZDNxYTYa/16/ButAFUXrzdoqFzhgJG3AQPallKopbd+Kf8RCv
	mMpS4oU3wsRQZx0T6Tdj2uIzXUe7wcJuQXezuSWfJPVkkqvOPU2tlG2udqrULPAf+ZXVg5vNeEm
	Nv2I+n73QSEnGCXcFpYs99cYMD5FRf8yiQy3xCdHLMlP5E+1dz0F/cm1v1WLEMpzfcNhtbjbPQv
	WVdcY3tPC4bVUwSzFdyqcG8Xxi7NcNGw/1EDE9VOLWpQlA+EYI75EFlBkGYhAbZhO64xhFuPfIq
	52ywjj11u3B/BaU84fanWq+kD5+7yGtRyB88WaW//TGK+gL+3Aiyn/QpJUSba62UpJfi2ZBU/e3
	GiVgouftfH4IfgrZpJVtpKVRarkOs0yw52AY5J85LogFW9NoPuCHuuzbtKA==
X-Received: by 2002:a17:90b:4d07:b0:3a4:7195:ecba with SMTP id
 98e67ed59e1d1-3b12d488e88mr1529576a91.20.1794190983895; Sun, 08 Nov 2026
 18:23:03 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
In-Reply-To: <20261106-savvy-invaluable-gaur-7af1b6@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 10:22:31 +0800
X-Gm-Features: AclHuK-so4ygy7ZQpiwiv8L7y68F48OdPR-9-HT6EDLnbJ3aW8Kx7LpzrpeA0Ho
Message-ID: <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The HiFi4 DSP provides a separate reset control for its debug logic.
> > Keep this reset deasserted so that an external debug agent can access
> > the DSP and perform debug operations.
> >
> > Also require the reset properties for the i.MX8ULP HiFi4 DSP.
>
> That's ABI break without explanation.
>

The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This series
adds the DSP node for the first time, so there should be no existing upstre=
am
DT relying on this compatible without the reset properties.

I will add this explanation to the commit message.

Best regards
Shengjiu Wang
