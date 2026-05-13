Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B167943C04B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683473; cv=none; b=hqIrWsEgeNwRDYQnBGzBZF3vx4jbpqkD+QMJbIda30DhPBZqjtPJP8JP07iivwSZMXt4WtR9OJITCOgt908T8q9+kMmPG+ypQnGtyEOoR++tvWbcXqp5im61+0OVNWtkADlaBPSyOc5i5lCdR5/WDLSycMGY9pVDjZy/sQ+iQgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683473; c=relaxed/simple;
	bh=au+mOMR8czIiSMhZyNPY5z9ArSGWfnPUhHacyjBoQtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i1v8Px84iYOObGBSv87khSTG/ayS5dzqrg1r1k13zjN7Yg2q+GCYMCeiSQj8lmNF/ra4oPBfpUSTcPdbn48re8G4b4f01Fe4o7DU6mFDDWJxlSGV25C4VAtuA3sgv9rjGoys2+B5gwakpnNJiNT7OmaCsyX8iwyy9VfQprooaG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfcLahxg; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfcLahxg"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13317450f83so3076380c88.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778683467; x=1779288267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2XlaJwSBpPWg5uTVaQnN9+A5FFLDYX24zRCV5h5kec=;
        b=SfcLahxgAznAUhz7kdUP7MYW9RSRciQFE8cKCFiKjcWEQFvAE9BlYZJeuO2nKqFEJB
         sXH82dr0KQMsYWCshmII61+g3XPVm7d6f0aCBw5UedQf9zIQ786GZtpWNOcFLfU3q55I
         8KtOi8G1RdqMRvb2x7CeawYxLIGnx5GT01erZeoTWM8nsa/ic8TndjMcy2WMsmA19v+9
         ZJzSEk3ZtWgthOR1PJY8w8f6xLT7KTFeYY+RGX/S2ysIA3nUHLn7KB8Tv/Zbw68oTxNm
         IfkSXQw/f8sdpAXiJsD9Dt5Dxx0/i5XZXkiBtl2YJ5y69hgTNiwuRLTuSipZvBFgbIWV
         c6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683467; x=1779288267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f2XlaJwSBpPWg5uTVaQnN9+A5FFLDYX24zRCV5h5kec=;
        b=G1eu5CAo4Y3oZqsRG/1L/K+GEG9NsZP2GDdZZtTQOEmXD512GPd4rsZCe9RNXbHPqX
         89tqM4UdgrgfENz8SVJ2c/a/NFvL7ZoayTtJtzUnW240DHPr5Sq9GTW8dgnaAHk8vKXv
         tXzilytpGUvTLUxV5B1ge01sfkrZhYcKs9W9GyQqw927tY15k9/YuMkGBp0DJmPTrU4f
         zbg+zfEl3qJOrTHrEeT20GfkPenoy/mmwxBiqZHmlm6Wp10MOc6i44oqCvLJUZLUdsU4
         bmp4ri32tbT2hcI+q4Vtl2/sQQ59X1YKOEdeR11A7YU2jsc7nxrp+nQdsZBsog8B5u41
         Nt/A==
X-Forwarded-Encrypted: i=1; AFNElJ9R2ZssVqq6lhJjFg8tcrZYWGFtBvFIWjGx8HkWLETMMDujqjXC04KX+XESZT6LZF2QiF4iXWAqci/d@vger.kernel.org
X-Gm-Message-State: AOJu0YyvRKh75833WAc4gX6iW7kAd2KXmwbypAThLsDpSoXyZk8nLmin
	AQZm/0TelF57T6QnSupKy/xsYN0lbIIKRfxJrEF7iIIiYdzgHBFz4hRJJ3fs6FZ6
X-Gm-Gg: Acq92OGaiJdTvtept+I60jdPNQptPm1pEsgAW2GEYBQEEnrL5/5qurvUln4bIfpM/e2
	9RsnL9rIjUpmSZpwCGIwMsCYAruDgZiUPT5mebGpJJsa1oKLnn5gZSsErfCOr8O8hVQsDSgu005
	AHLukh891jL8R83q4T2XDXvhBfuTUGpWHAM50j9sMxX0HujNcjD3bSYqklmC5KLrRQ+xpzMkNDo
	RfzYS6jWTht4abVAJjNZyKwSYxtke4Tlz2RS08iJe92Q6yMECvujKNyow5mtBiywLDDQkbibyWc
	qpzmjBG+LYLZ0qsK9hdV388NMtSbrFYP0QzGjh1W1tbPWMnv0STxgACbQSUL1OYfP5K4yHrgNZm
	Z7v+JZ5+B4Yw3uXTuG5J6APEDNU8yowfQsB2hB32sECuDxSsaS8ekOpd/YGxUPrACM5/kls4aLa
	GKS1kOPZ+RIN+yM2EMkmcUJaoSlGKAhwWh7g5n
X-Received: by 2002:a05:7022:128c:b0:132:83e6:41 with SMTP id a92af1059eb24-1342f2230ddmr2313170c88.13.1778683467152;
        Wed, 13 May 2026 07:44:27 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865955fsm29768228c88.11.2026.05.13.07.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:44:26 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org
Cc: alexandre.torgue@st.com,
	andersson@kernel.org,
	andre.przywara@arm.com,
	andrew@lunn.ch,
	baruch@tkos.co.il,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregory.clement@bootlin.com,
	jerrysteve1101@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	paul.barker@sancloud.com,
	pavel@kernel.org,
	pavel@ucw.cz,
	peda@axentia.se,
	robert.marko@sartura.hr,
	robh@kernel.org,
	romain.perier@gmail.com,
	sebastian.hesselbarth@gmail.com,
	vincent.knecht@mailoo.org,
	von81@163.com,
	xuwei5@hisilicon.com
Subject: Re: [PATCH 2/5] leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant startup pulse
Date: Wed, 13 May 2026 22:44:10 +0800
Message-ID: <20260513144414.244968-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
References: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Fri, May 8, 2026 at 5:26=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> w=
> rote:
> 
> > 1. Per IS31FL319x datasheet [1], the hardware shutdown pin (SDB) is
> > active-low.
> 
> So that means that driving the line low will shut down the hardware.

Yes, that is right.

> 
> > -       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
> GPIOD_OUT_HIGH);
> > +       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
> GPIOD_OUT_LOW);
> 
> Add a comment here that this will in fact drive the line high,
> because the GPIO line will be flagged as GPIO_ACTIVE_LOW
> in the provider (such as the device tree).
> 
> At least write this in the commit message, it's a missing piece
> that helps readers understand what is going on.

Okay, I will add the necessary comment in the V2 version.

> 
> Have you checked any existing device trees so you don't
> break something here?

I have modified the problematic device trees and CC'd 
the relevant platform mailing lists as well as the device‑tree mailing list [1].

[1] https://lore.kernel.org/linux-devicetree/20260508152435.21389-1-jerrysteve1101@gmail.com/

> 
> If you're breaking platforms you may need a fixup in
> drivers/gpio/gpiolib-of.c to force the consumer active
> low for legacy device trees.

Thanks for the reminder. I will add the necessary fixup in the V2 version.

> 
> Yours,
> Linus Walleij
> 
> Yours,
> Linus Walleij

