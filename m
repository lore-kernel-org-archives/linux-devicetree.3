Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC093F44EC
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827600; cv=pass; b=SKcW/HT6saTGPYSSgsTY4VmtTSzerakdhf/2PRNdNXMEXWJRucIXi9AfJ4b8jt1JSySc8srkxwaj0zJ5HorHj2KoeQI2UcL6n8ICWySCrIN5ajkP81Au5aTSLKMQOucBW+XCLejXjw/ee1ijmYIurzplr/P0xFGYvLF3tBJwndA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827600; c=relaxed/simple;
	bh=rva4hyw7gvKgQLI6nx2kY6fQhy1GsNHj8d008wglKkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXsCihQChdbKXtGkardwf3w0xO0fqIEe1oduDZR29Odyvp98q95ZuyfsNE/81jTbqnvcI/wsc1r4WNstYUaM3OBxsiriDjPYmrSm+LKizPLwmyTMF3lEBiR1fV4aH/yZzvVRsVlBeZoXLKn35lbvJFD47Z3PuXKV2JKvhBKKOnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isFJEwQc; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isFJEwQc"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so2132044a12.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785827597; cv=none;
        d=google.com; s=arc-20260327;
        b=iO9o4RkKnBKoh6jgGUsa/YGIErQ+QTfPz+9AXqipn6bhTLPyLqIeWjl6yizTd75Rfm
         cxqO3A4Xa5oIt73lRmXxhon7T8f76dseTEAg3FXQb/HcAWT74F4Y9N9jXQbaJPFkA5kc
         Esw4aJ8VOaDeCqO0m0bPlpegbvTxIw16D1+a5v7oBTU+K3KvwPyfRSLhBuf0gJxsZZS5
         lqHY7HmYx2dbsg2EzFBXiFA8RsOwwnAGfSUGWMw3q10m5Mh0VHDS+t1JoiuGgwkjTONx
         S9CHBdTbFgrYzXzRF1irI9ptE7sj2Dhzl6bjGL9Mpazra8+xGqHdYU43Aq2J0NHt0Ziz
         7eNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rva4hyw7gvKgQLI6nx2kY6fQhy1GsNHj8d008wglKkw=;
        fh=K1vQzDCKRtMvatf0W2opf+0b1//ZrrG3kwggcGDWdI0=;
        b=nKzAf2HYpfuqHCBfZvJBHE6kFXHaNC9H7Y/XmePlU1QA6josd5Ws4Xz0mc/088Ryp0
         ZsyQqM1kL1eSmK+iNRHBm6ZqQUoY/eM3YqRwO4ONVZYzu9CSEB/SlP5YONXULhsOgiDF
         5RgIkxFmGg+dy+VtNNit3qgyVrkcn6Dy+xhAAEWxsRjEUWKC73zhplKFg8sr0eCuDCnT
         edQOFv3OyiDLnK1kn5eIdfPR7KY6ZCRSBYQOVB3VwUObv6yN9JoX/PVHn5a+zOpy5miL
         REJ9VJpmcczV8tNd27MqgRoaFf1wonEGLW8JjIdKE4u69zbUY1Xt/KK6257pMbZnaWj2
         NLgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785827597; x=1786432397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rva4hyw7gvKgQLI6nx2kY6fQhy1GsNHj8d008wglKkw=;
        b=isFJEwQcN8Ge7PL0FMyyXPQ25cS3PxEcps8G/iVkEN4jygPt9+G4WhS9ULkKUt+MWZ
         /HpechSL3QSAI3Y5Z7QSxelF2ei8hRSQbtH/daqrTyEG+tW8j4aMbhun/BhwkcDuIVPZ
         KWnQTVjeHWvgHr+NL2uKY4l/COF6tshmdmVx4SsYJfRg5YYVTL+re1B/Oi+TOm/yf6N7
         n45q1KU8Si0+HZ4sASyRtMS6D2RGqWOsISJmquUZhb1257FUMssqGekRqoszqkMETvjP
         LjeoZTKbO5Os5bGWKCpzHL42ZNSUyFM+q+xKhhsmINCI43mfEzwVL9na/sFTmzUf5r6F
         sC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827597; x=1786432397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rva4hyw7gvKgQLI6nx2kY6fQhy1GsNHj8d008wglKkw=;
        b=XBOTrr5sw855Ms5tFjl+D6HqsXUbQ16D7PpufNkrBmtpzjFW9EvZIw7hth4QC/MP7f
         4SgKdWhymIiYWrDMZ1jHzi6H/KdEbwfHN9L0Q8Rx+LFX3pPrQ6PezbCgoiEPzTxWQ6t9
         ktTE/luztX3XU/jx6+iwSZ14ku7CD5syFHWL7Ugw0z6qh+WztiDnE2VNj+WZJY9A+d23
         4wPVHCEQR5Tago2QtAeoSE0OZPqd4kLTCafNERE5pDDWIMkaloDqZhArSmMYF64Xoes4
         AtXl3qI2R3yMkmP4GTVapLCiBO7WsOUdvYraQb6kSYJk6WaNmDG5/hoWvXMx4rcbRCAl
         b+mA==
X-Forwarded-Encrypted: i=1; AHgh+RqFAkAsN5pQVNZlSiEBGbfvbwpZHCORlNs081SNSx9p7yCGYkLLBWni+YOwSsc/yMFcXqu7poc1NSoe@vger.kernel.org
X-Gm-Message-State: AOJu0YyECCyEhC+M5KeOx8rr8j0oqbjtMnKsjw148epKOdRPpWZJOqxr
	DV/hq0qnldDgs2tql/SMVc2N+oMeJ8zPFHBBK8wTkPwe5jYinyCXWz/rQ5d3+C4Rj8vYrlcnXYP
	UCqDWcLPcuW3z3FNStVDn3PJE3PwNuEc=
X-Gm-Gg: AR+sD10+EEKo0k2Yfhga4zebhYhmVdlQUCdaYxAYfDKNSjRaumVCqdEzv+pmuJyT4sf
	dPX03isBAHrkDC5bkyijJ2ltfc6Bn+hLrMms2/KUhETKKFvM5Ev4zMhcMgxeP42hehTEiHhtqzI
	1mdVUYs0ldMZOhZ+kzV8qPIJdqnKooAQgGlLeWZWg7uDiN+xEuKmByPK3sDcHD1wDcADWpz/OcW
	UmFzz8Q8iVNk/cK951oyvb8lzO3Lnktebgb7gJ7XcJoEdvZJC83xIS5mQQBLfgJhM8Lf/Z7Ylxo
	Q+YJ/gIGp/EVLigZa43cDi3jPA3iUkhkM5cJyplOile2Eg==
X-Received: by 2002:a17:907:6091:b0:c20:2165:d74f with SMTP id
 a640c23a62f3a-c202165d8a8mr344142566b.22.1785827596816; Tue, 04 Aug 2026
 00:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803101734.270821-1-a.shimko.dev@gmail.com>
 <20260803101734.270821-4-a.shimko.dev@gmail.com> <239a7699-bbda-4fab-bfa0-604b1d8806a9@lunn.ch>
In-Reply-To: <239a7699-bbda-4fab-bfa0-604b1d8806a9@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 4 Aug 2026 10:13:06 +0300
X-Gm-Features: AUfX_mxu7URC68Rp2eIqVenze66FGmXtUS8bwDr_GTr_7zs2xAgae4LnKHh4U1Y
Message-ID: <CAOPX744YEhdgmOFPT8PjfKp=v4tVq4XefYaRnk7N3J4MPB9sfQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Aug 4, 2026 at 5:30=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:

> Why 0.00 for one and 0.15ns for the other? PHY_INTERFACE_MODE_RGMII
> means no delays.
The 0x1 for TX is the hardware reset default from the datasheet, not
a value we choose for RGMII mode. For PHY_INTERFACE_MODE_RGMII, we
explicitly set both delays to 0.

Sorry, could you please advise me should I explicitly set TX delay in this =
case
to 0 or the default value specified in the datasheet =3D=3D 1 (150ps)?

Thank you for your review!
--
Best regards,
Artem
