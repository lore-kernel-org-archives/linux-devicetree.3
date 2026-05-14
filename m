Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B81339934C
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783074; cv=pass; b=jWBJvm11nW3m3BxQGfcRVW15zfuwv3QK9vFLZkqwFyMJMAMTOo1WvT5MKNOCUawOBOvNnKcUk4h/BHwkr+WtA6hqLwbNhFuCfqZ9mHnC7V706nLTAoOnCOWJeB0aQkCqUx92kQFrdxLqjF9Fm+dOv4acjXqmbrX4psMQy0cLdp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783074; c=relaxed/simple;
	bh=BWJ3uPdZgcyXxdg32SVJEvPY0NDEyQy6xYo6WYiFonY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jSlgJQxeKeNuDc7sri/h8TGfLIuV/TZ+TKYnJrTnzDoDnDnZ1C/HWC1hH/PK5uwZCUg1znwsfBxqVZsfHdS12G6mKMn5sdy9GbzPc/pTRy450PePKL85l6H9g1BWvDS8VYK/hX+aTVuCgSF0ygEi10HwjFUYut5Nrjx1/iJ6ms0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZyWgsf5; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZyWgsf5"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39556b00a85so6510091fa.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778783071; cv=none;
        d=google.com; s=arc-20240605;
        b=AvVJbv289XGO3EVYpnBnDQc0IofMJUcr9CNWFoMHYocL5/qim3F9ZGKtTU8qeqOfS6
         SAwAxZbOghsE31LNu1c1uXOkEA8eIPs7nRZUVD5hHtEDfiJhIOQmfdvRKa8ibegHDVDg
         xc1kqTBzW6QtPZio7nBVtKYIKYI1jEQrUGKAAT0Y4ZrNsjnXFKYLoGmmU98rcajkqAx+
         0ALGgh078SB2nn5jAJPMgWCdsk1llVTiR7oO3CKGwa7ReOKn0NN0gHSYTM1u4ZkHmtgg
         ysp3irkoZk4b06FCi2DkAAgr4FoYbQBjRCOXyQ9OsdqBAMQCFXHIMG8c5MJl4Zof2BCp
         Fwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/n7qmH+UjfqU3oZNtSb+ulfjY44x4tUNOP96fJ9Gp8=;
        fh=yfD8+FLfx9/OX8Sxrvb5SYSn2lxTjQQFViGMLn+xpek=;
        b=DO/n0wxwx9puCe9nufAtOLxpjqYHvJPXQlnLv9FFZD3gOY3zaghhbLC260OmhEUyce
         oNzQCRft6AXuUNV/JRmCQNo0JlD4X0HRnFr9ee32teANYe2JUS2FexfdlvLOoXN4x4k/
         U+NSkKvH/HKRI4rDhSc53GFgOM0D1lhruWpxZKGMf26kwqFCIh0tIjH1hvgLnxXr24VN
         OtzMjoHEFL7++lkkAEMtctVznH7N+WgyzSnixKo+aJWKo6mmgvvCInY80LFj9gyfOCT/
         oeZ2GWlUGgm2cADM0YjFW6h/EOp5U8uj2D5tuU0yLNwvdpSJTljw4u+yYc6x55aBXYNH
         BCvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778783071; x=1779387871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/n7qmH+UjfqU3oZNtSb+ulfjY44x4tUNOP96fJ9Gp8=;
        b=SZyWgsf5dWvLDGNVlYDXLbg1PW6BWjkm+3Z4Ud5lAc8xYe2JNeSOnY+aYrdotSQDs7
         YWs13VmZoZTNaqUZiKVVW+5T8Bo7hMTHuclsZ8xbdwUWgBw2tTULC9613JBzKXuHZpTu
         l8I8MqAmJ5OsGhcPKBV+2TQqd9BKaRwPy8sIYnFJoirxT60Fzxf7DwVNq85SGu5Vo/HM
         6vOBdNC7X78VoX6RWmt0m3Pxwi9jNZ9tyYVVYQdqXllIXKpyyKwhurJQCKm1VLR7oiZJ
         D/FfXCeEM8dGJKgEYCIbO7Pn3lW4xeE31RlaU1g4hIHdZ3/hfnU2GBSNGFouHZaZfDuJ
         jEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778783071; x=1779387871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g/n7qmH+UjfqU3oZNtSb+ulfjY44x4tUNOP96fJ9Gp8=;
        b=eS6a/tH1qzBwJhVhwtVvL7EAciyUMmt8hPwZEqr2bbMZCE7C3lFmxdttxytaqbZ+fE
         YwMPpcAMWAGpchB6CdxYDLt96QiPsd42U2gBTIv2+w70g5WU8u+cE5I0e808PUbXkHpz
         xn1AyI9fwqWQFlhBvCQvwiYVWT+eiN9dbWbqJwKM5FZiWteuzvrPByakMVZw9lDXng6D
         h0QTruTk5JM8MkEbJ8Y+9bXGf2tUt6ecKiXF8TOPT4qisRAduZ8wNNgzOlc3fKrtBJay
         dLZkjLLf6vELsy7tummjyvFrTMtACG78st2AZ4CdJUVpg/G/1VhgVj/bqtR6VbREkm1v
         D3Rw==
X-Forwarded-Encrypted: i=1; AFNElJ8rTvKX0Iuxm75tWthK6dISXtR3QmmyMt/QZpEYWAeVaswTuv3g6AtE0hCQLFEPnB7iTGrIXJsolzI5@vger.kernel.org
X-Gm-Message-State: AOJu0YysRZvUfI4RffHoMONlHvw348tOgzI17YttczcMPUgDSTMVjhvc
	fBgpOMK6JAptM49GdONfCHOchHXdObDhEWEOwjp/nE3ZdpdZV6/3+pn15pkMXMwwgb6TYfXOQ+R
	QGgDzee33KskUinq73K7kt4cDHazYp18=
X-Gm-Gg: Acq92OFoBtoOAdpRAnT/sYb6s2ZYLUCsDaSNe9CiJZ04mTlNMB/utAHVXrYT4aTZPR/
	YyxerdB3zNheeZ1YFe8UfXTbzBJySkapmVWFP8m5fLZ1BZaSgb07ZdWUmdyikPjypa3fT49Mvxw
	Zmc1cx2rk7y44ll/icfKNRrJWu5wO/MCNcf0Li9hAhEBk/gN8k3UJYJZCCfx2LlZSSEU1aeqNXu
	AnmsDYQgaMX0z+DYzS4+qnGw948Q7gRgr/85JuGmq11ruzThQwxVZM9Y16hcDxxmZ2hSURAtyq3
	P56Ih5ey5LcfRI8CZrFUta+UaBLbL7aSs5EB64xMVYBTwxDs1p+R5yIes02h8qRHifI5
X-Received: by 2002:a05:651c:b0d:b0:38c:6b42:3d83 with SMTP id
 38308e7fff4ca-39561d884e6mr611691fa.15.1778783071177; Thu, 14 May 2026
 11:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-icna35xx-v2-0-45acd1dfa566@gmail.com>
 <20260514-icna35xx-v2-2-45acd1dfa566@gmail.com> <20260514-sphere-overstep-e564bf7ca609@spud>
In-Reply-To: <20260514-sphere-overstep-e564bf7ca609@spud>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 14 May 2026 13:24:19 -0500
X-Gm-Features: AVHnY4IjQHSroQwEIE5qXCkACNibttIrvT8hL7GmzRjoramD1sZbohpVjnGBbBM
Message-ID: <CALHNRZ_4aii1MTqd58zZ_1sFoxNZPPehuRauvExvQzzBBb7tKg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: Add panel driver for Chipone ICNA35XX
 based panels
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 1:05=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, May 14, 2026 at 12:24:50PM -0500, Aaron Kling via B4 Relay wrote:
>
> > +static const struct of_device_id icna35xx_of_match[] =3D {
> > +     { .compatible =3D "ayaneo,pocketds-panel-top", .data =3D &odin2po=
rtal_desc },
> > +     { .compatible =3D "ayntec,odin2portal-panel", .data =3D &odin2por=
tal_desc },
> > +     { .compatible =3D "ayntec,odin3-panel", .data =3D &thor_top_desc =
},
> > +     { .compatible =3D "ayntec,thor-panel-top", .data =3D &thor_top_de=
sc },
>
> This looks like you could be using the fallback compatibles instead of
> matching on the panel's. Why aren't you?

I'm uncertain if the panels are actually the same between these
devices or if the init sequences are just similar enough to share. I
am told that the thor top panel and the odin 3 panel are the same
model. But I don't know about the portal and the pocket ds, just know
that they both fire up and work as expected with the same init
sequence. I'm trying to follow the bindings idea that these might be
different physical panels that only share a ddic and thus driver
handling.

> > +     { /* sentinel */ }

Aaron
