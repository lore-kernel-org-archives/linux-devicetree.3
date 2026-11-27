Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810621;
	b=Owzmlc1X2PJj91sv3A1o0nLOtev32x6FC72R6/IoWG+rLHXV1e2HWmZ6tmPc2KHzP7jy
	 RLUubnbJobiwlWlb2S44YcMeMnTuJ8FAoZp/af25iX+Q6mRLtBbJK5/ArcZBt5tmpnIkc
	 uikOW+JjUjR9StTFT+0D7+bXqTEfA4HgdIjNknqAVzFkluckLFX+fPaaqYKfJKvs3w2Vu
	 NtAVI+ZL1s7w+fitUVW50wQzL53ECVVFnl8EPjsu16xpC9psvwvGCyVU5nVzLIYT34ju9
	 2WWFEGNHFZUiXO3cBR/6MMCplxjXcCkwRT+vjcuG3Mz5Jrnb9wrpRzYWe7zCx9kScDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=EO5k6n/37i6TdunZgGiZGXGdx4jOGbhNEYDu4cn2rWw=;
	b=mRUX4+y29qtsQU/r1zcpaBELw36walShsE9EWwNyLq9UnPUSqWuOsH6Z+KkQLu7okO/c
	 ix/V85g8Hzm7CuOi9+NitWgqzxbTDJljhYlF/r9ZW11V6EXx8Qwf7O/pTGuPb6B0Gb/CG
	 HQREh/Fq/okVHFLL4L6fUFUzcnLBHqDnQhVeordheGIUlFi8GzFDNWHxYUaDYV9c6jAfe
	 /5APq0OzUKlDu3BpHN4qPiF9Gv61iZ+0+njRogXzjXfBw7yHDH+mej0DxG+C38/GEFq/k
	 /MKBBmbq+LDAMPCoUfTOKBu8zTrtcnZP/O3xuk4/d3UHFkJGPYzm9D8wIlxLeZSL1/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDtyxHbU;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A43606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A43606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDtyxHbU
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso60976175e9.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810619; x=1796415419; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EO5k6n/37i6TdunZgGiZGXGdx4jOGbhNEYDu4cn2rWw=;
        b=RDtyxHbUna2CLhsAKbFg7qydec3+Fk84/8mG1l1EmvUQSBTO4yKXF/vBXD8MCHm06i
         /Srz/vEExGpmWHawDRnZxqMRs4BCbJsZUumDr6MZ56bDZRrz4VOFhaKyg7TH7zLpowcc
         1teeYl3mlvGvrExsvf1a9uVIiwoUaRmh2xPXzM2wVuWym8Demv/UJFJD+VTTB1mKPaHb
         7vts5II6MM7MqWuF/LapYzPcm9xcZ5a5R2b80wqSin3CJRehUA7m3Lfp0UuiMiWlHkct
         XwHdvKcskjHcd2WOCJQKHa9IuZzOln38lOG9ZYJw18IWUAv6dq3SZXwZZ2PmHxSClYff
         d9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810619; x=1796415419;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EO5k6n/37i6TdunZgGiZGXGdx4jOGbhNEYDu4cn2rWw=;
        b=ooP3f/j7f/K6ddpIVzB2FYzMhCdMs6RZucXxDH1F3duX1UZm4K02bxJr2VekaofEsB
         glMpP5R0apGPvpAZrGUYNf/N68ARKU7EE+Cix6hWAkjoxE2NxXKtBknIeWpnri0JtSTA
         9LvwPVMV0AKkHPJbBHk5bqI5TwSlytr2QvFIT+ITo668wyExKBcDhhbkFPDI2nHevWgQ
         +kS6v8nYTWsaDvoK8Qz1UmxqH3utVth7Xi8lIqGOU4UZQc4sE+OpYfOPueF+xU76QjWK
         ql2SljD7TDy5qrgGoQjEgvLw08ZAHvXwphcf9QsfdesPaDzk38Vz+AOQVZZYIsGFkEeC
         4XAA==
X-Forwarded-Encrypted: i=1; AL+hErELBU/uhSqLyvgT41tU5YYTD2FIJP1HyMK8di/GibYMsELxHcVy9CQCq57pUDz+YU11wru1caHZ40SI@vger.kernel.org
X-Gm-Message-State: APuU4Z+nwqDJTPqabcloZqp+ikyNRo2o2YZOVRgz52hhSphDYm84agsg
	LygTmGBsF9H+F0eIbTwb+TjU/wveY47eX251pOQ4j5cvo6Js+OEV+2ofaet7JQ==
X-Gm-Gg: AZFdTZcQDSPiy+lZdv3urMmf9DrZlrHiQNdcT4amKtfL5r4ff0q6B021jKQmYJEX7rv
	7jGgyWfoNLOV5Wsh9hV/t57tWGrutre33QT7PRbB3X8niplMpOG6o3BFt8ZDqy73JUmxAv5hBov
	o4Ub6qzyVKhyXotXr6oZqmxB4dwcqG5UhDth2pTEVkQq0PeX6tzVLXGmFnHJpJlUllzu0ciFkRx
	cACSaDmf2SpQSU9FiRWWhjEziyfgSWNK+RS69MJuGQvmvl/WU1XSWl5Xr8RierIQdTTDc1yoShV
	HrMvEZWGKyw1Li/EO/X/lIZl+89mMuyGD2MBRfSrGNIT0deJH0ucSn4sUOzHc+51HmafDoLI06c
	U+eNGg6YuGViu52LQL1SNJgserm3rgSJe9JkyA/7/mx4YQxizvlBEqV3v5d7rDDtP4JhRwVKORL
	8SbBmlc9UeYMHiZ3RPPKvnqfbZmH19+q1JPUB2Y4zzIKibOZ7Y3d230mvFUHuN+DaTxTMqZePV+
	22WVYkfYvwBOcl07+E+355KbYFx51M+t2uB5KGZ/QPV8MzA+LgMlnJ9Ya82nh9500x/i+2soL0N
	fWS/L5/1EwJeMpEWAhB+5kD6xNiAQRzGtmJHgbydxd7pj7y4BBk+yXGwkGlev7I3ODE0C/a77s4
	05AoF+/g0b87J1/p+67LXNki6dal/m2kklrQhln/uEDcaXuzI5RyDuDrSFM9IRYEB2YoJzaPgUE
	+AfVcUIoxdhHvdnc/Z0n4RCu5EVww2ldIJsxA5EarOX2hPWXnP0BfKRJGy7o/W4pFwSBIEW6Fhf
	Fy8uq/nPM2AXesM9chGSvAeBg==
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb88816acemr564296155e9.22.1795810619117;
        Fri, 27 Nov 2026 12:16:59 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1298123635e9.4.2026.11.27.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:16:58 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Hans de Goede <hansg@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Alastair D'Silva <alastair@d-silva.org>
Subject:
 Re: [PATCH 0/3] arm64: dts: allwinner: sun60i-a733: Add simplefb HDMI support
Date: Fri, 27 Nov 2026 21:16:57 +0100
Message-ID: <QITIdKDQRWGwlU1DQqnbAg@gmail.com>
In-Reply-To: <d4a41c5cfb33d6d39f0ba927541beca1175ad001.camel@d-silva.org>
References:
 <20261127080649.1982883-1-alastair@d-silva.org>
 <18637573-d20f-4a58-9e63-6bf71b015cef@arm.com>
 <d4a41c5cfb33d6d39f0ba927541beca1175ad001.camel@d-silva.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 27. november 2026 ob 11:20:02 Srednjeevropski standardni =C4=8Da=
s je Alastair D'Silva napisal(a):
>=20
> On Fri, 2026-11-27 at 10:03 +0000, Andre Przywara wrote:
> > Hi,
> >=20
> > On 11/27/26 09:06, Alastair D'Silva wrote:
> > > This series adds boot-time simplefb HDMI support for Allwinner A733
> > > (sun60i-a733). U-Boot enables DE3.5, TCON_TV0, and DW-HDMI2.0 and
> >=20
> > Where does it do that and which U-Boot version does?
> > I don't think we really want simplefb in the mainline DTs any more,=20
> > unless there is a big blocker or delay for proper Linux DE support (lik=
e=20
> > there was back in the A64 days).
> > In Jernej's HDMI series he hints about A733 support being pretty=20
> > straight-forward with the reworked H616 DE code, so chances are we see=
=20
> > proper DE3.5 support in DRM rather sooner than later.
> >=20
> > Cheers,
> > Andre
> >=20
>=20
> I think the blocker was firmware for DE for this SoC - it can be ripped o=
ut
> of the Orange Pi OS blobs, but that won't be acceptable for linux-firmwar=
e.
>=20
> I'm currently reverse engineering the GPU firmware blob, it's not very la=
rge,
> and is a well understood instruction set (MIPs) so that may be a path for=
ward
> without the vendor contributing the blob to linux-firmware themselves.

What is this GPU firmware blob? If you mean for Imagination GPU, that
blob is already in linux-firmware. But then, this has nothing to do with
actual display output. Display Engine 3.5 doesn't need any firmware...

I'm with Andre here. simplefb isn't needed. For anything more fancy,
Maxime is working on DRM readout series, which should allow seamless
takeover of display devices from bootloaders, like U-Boot.

Best regards,
Jernej


