Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8F8372047
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588646; cv=pass; b=D5vALrIEqQXH+7rXPwZ/Rsqo1J39t5r4YBfT7RaeUi0KcswQJrWscLVtkDAWcE7Yux9KpeDs5JYxentDyQXyT8o3607fG4piIqa+901AGQaL/OdWJxbrtcQyltQS0tfV1ArOaH4PKiy/bBcgwb8m9Sps2l6bCFCj9wqkbpupT50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588646; c=relaxed/simple;
	bh=cdz0xEOAawKit8K9bAUZtblyQ/JOZkBeEj8dOx9FdF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=devvzmTXBNM8fzPZdJALs8m91bjFXantVXsftmPgAAEk8YlSKNnxeurvxer01kWEZBt75JjURQD/lK090tDePFUAS1qlN+3lGGeqx5STcH4rQiAGZHwgxv24VDM3YtASAH496KdUXQxJR5wbcN/GJ4XZ0B2r+Pr5cW4dA+IZ1wM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxgjkgrB; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxgjkgrB"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39380e79936so67103441fa.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778588640; cv=none;
        d=google.com; s=arc-20240605;
        b=LRA2+5wvHTQpYl9xD58zR4BTQVD/uO052nwkj9S08NNMPkooQcY8+IiK3hweOyv4xM
         E1Momn+ZJrW7fTrULp3hGB5PUJj5AzxTSCG+1cOhnGgBreea/tENWng1NKHP7+ex3N6I
         bu6Lvjozc4+GqSzTuexAqP1NVAWkS6VNRUw7y/CGMFae6YA0SMB8LTjMh81R+OsXsv4a
         EAMS1JNsL/yDcFGvLFlPN+yxeFU8J9YCDlXWSBtAkUda1WyzojvPMCVH1nBLkHsPzO2v
         091VO7Vf8yvzWEWZCx3Jmf4qKoSp8RRwCn43rJKiSj5IW9c8lJCiIXdermI9IDBtUM5P
         VAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZNiNSCnuGRYY15l9t3kR4oZkdq97BMSAIqkVYXGT2lI=;
        fh=5rOb3HD03UOSKNEDxbucFM5n4rZPSJJhSlIJJ12ewEc=;
        b=k046tVCmt2UBES8EmayYkaYIvLoSLQehFkcVcM1UUR8TlzwRc/npf4VhKPTkUY80NV
         vdI1+FdPwl3GLA8zH2EC19+jHmQ32C/GYTo9+bPBFVAkDlnA2NDF+/OHm5ALt9AXxWCQ
         Plm48saddv0+mfxmqMrhY1/SkKjQDWsDdfhT92Mi7Fbo29F7eu31pPoFXkZ9L2GY/Kwy
         LsetS7pw+v8NM+hIgXI9J+fHvRcLlfSLHuxRM1st7T9K9AQ+i/bcHsWK54eTV5R+X6db
         791yBIgxOYuf2euBMJCOY9EdDUpJa/J+wDkZh4FrbAqeRvBRjxely2e7NTjpIqDcfsCK
         cZHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778588640; x=1779193440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNiNSCnuGRYY15l9t3kR4oZkdq97BMSAIqkVYXGT2lI=;
        b=PxgjkgrBsGOh1lkTwSYJQF5+1GUhV/5jqSEiQ9NWY+35ARexZY1H4h+19kYcsqCVNa
         46Q3c7xCJZYPOF/aHQOsacTkVer0vjWb9YXE9puGlnhpfEyMJCVEYJ3TAdFMvyvM+S8f
         dX4g6lJVAQgp7Hlqg5a/0P0Y6h+Ud7hiTnJarrJaiYzNk9CQm4BD1eWVraapViegqQe4
         j1QCmMzM0LZvmhChg8IrPNNCZAhXnowM6ZNWTuhxn3ExRz9N46jQGASpEBf+zhiBMKHy
         e7TDFqJV94tZcuHAa8Kcc2zVvqop+saEtK10dMgxBymH1C4qe/j8KRDfL7PsOIhHYk2L
         tFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588640; x=1779193440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZNiNSCnuGRYY15l9t3kR4oZkdq97BMSAIqkVYXGT2lI=;
        b=WMpvVEctjaqGFcwaKdVZaatcjb0rBFyHnaW2Vl6ehnCFwDYL3kCP27ZNFpPz5KvNLc
         mDFJMSVb8Lj+3wZtULdGucv7bIjYtdD5DPmERHnuCD80aR9v6MIfVuCJtU/BwitZhWIa
         3IOrGvySyB724z9LH4mq/OnqhvhBkisQKWT6+cVhfmIvLJsI4Be0VuorAQ7jLeP3d7xC
         xFKCGicjWdfo8p7S0efrvmhm1j2AdtAqjMQXQvORBVgrEleozbMarSnqBurw40PTd0vn
         2QVxt9YmSm6GVcQk66Vvn/BXn+kDM8imWXy1+UbgapXAslj0pffGkRcZkBR33cKk0z5e
         +ZIg==
X-Forwarded-Encrypted: i=1; AFNElJ9r6WK6QluXGcX3TLmpCH/o1TJg/DwTE+kSRc7tFufq7B8/kHNRgykQreZ1o0qSESWegrVGqvbT7eTn@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZonlBBzHAL/L70110m78B2CwmhYN3CBBZe+vS6yrvwLeG2j4
	VrzKamY+272S62br2OFM2xQunIa+Imx8g3ww61MaHK0ga/YMJI55mdEu7+tGRIgJNuYBNWi2FtZ
	308mu0CUEOkadQDKis58YK3aA3kA3CX79zJCn
X-Gm-Gg: Acq92OG0NxN4IVusoaRrZAlL07p2NGG4igxzcxju3FuD7gr2PQbrdPkYBT1uSCtrMdI
	7l/2/tsh07MlYvaIhWtahFYCHp9Nrf2QaO+8MibIdK6zD+9m+uhgn1fRYIXwJotQWJkz5rOTRlO
	wOb0I9/tajPrF90/WqK6Py9eYwYew21urH+DON/GQM1bfvrBMhe2ORtj0gJOdHgSj94sPCPjxWZ
	QjrYI6itZ1xKFgPC41SEe2RbNMGz4t3qslDTDHIicsnFJY0WFYrCSRvqVrzpmbJRNXfNSvvjFMX
	wwSTYKIb6jhZblqoG3AgOXITUItZ72ItjWePzI1AOxHBB1c14eH12M73noJ3iEfg76snsDbT
X-Received: by 2002:a05:651c:35c6:b0:393:903c:225b with SMTP id
 38308e7fff4ca-3943cc32a2emr8953951fa.31.1778588640195; Tue, 12 May 2026
 05:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com> <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
In-Reply-To: <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 May 2026 09:23:48 -0300
X-Gm-Features: AVHnY4Igm0-o-ifd6S-hgKzaiMJz5oaJeDrrGsoCgjz255blF80xw9vHPNmBKaA
Message-ID: <CAOMZO5Dm8FgzOfyp=6ZuDc=528FiqCPVYF07PjMGVP0Paye6vg@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
To: Andrew Lunn <andrew@lunn.ch>, Gary Bisson <bisson.gary@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Gary.

On Mon, May 11, 2026 at 7:15=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 11, 2026 at 05:04:56PM -0400, Frank Li wrote:
> > According to IEEE 802.3 Clause 22.2.4.5.5 PHYAD (PHY Address), A PHY th=
at
> > is connected to the station management entity via the mechanical interf=
ace
> > defined in 22.6 shall always respond to transactions addressed to PHY
> > Address zero <00000>.
>
> Did you read 22.6? I've not seen a mechanical interface as defined in
> 22.6 for at least 20 years, maybe 30 years.
>
> That cause does not apply in this context.
>
> > -             ethphy: ethernet-phy {
> > +             ethphy: ethernet-phy@0 {
> >                       compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                     reg =3D <0>;
>
> This could very well break this board. Without a reg value, the core
> will find the first PHY on the bus, at whatever address it is at. If
> you hard code 0, the PHY must be at 0, otherwise it will not be found.

On this board, U-Boot checks for the Ethernet PHY at addresses 4, 5, 6, and=
 7:

https://github.com/u-boot/u-boot/blob/master/board/boundary/nitrogen6x/nitr=
ogen6x.c#L287-L296

In this case, shouldn't U-Boot fix up the Ethernet PHY address accordingly?

Something like mx6cuboxi does:

https://github.com/u-boot/u-boot/blob/master/board/solidrun/mx6cuboxi/mx6cu=
boxi.c#L414-L446
