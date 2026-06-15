Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C4B3AFCE3
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504381; cv=pass; b=TaQL46ml8igmS8xz2LKI0pkiAo0DN9osslXcslnjHEt1KvkqVTWHReNP9mDhdkrwqxHQwx/MIlhXE67L2ajrqTEgxS96BaNDLDKU4qX/bD5ktIlKeiFvjXYqitaQRlRBJlHPmLoxhpm84LQjIIY50wwQQP+ijGzUtjHkzLm/1fI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504381; c=relaxed/simple;
	bh=uKORwtqYpfXR4URW16kzwBGgnHmTyYEZYYWGYWsyxdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZ4dDsbZar7p48drWB4+SeIs+xNzNCDGcoftvHMUzUEnPQZ+3cVa2D+4iFlGrDhmYORjIO+3GtIZ08PC9wFLN1OOdrC7pt9PgQNUu9hf6xR2J3PX8y6wX1IlbhsA4FtkXbLemdepK/hPVP5AjY29GYtdyDEqA/T8PO0F5I5V59M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUAXna2m; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUAXna2m"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1363fe80fe8so4146427c88.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781504379; cv=none;
        d=google.com; s=arc-20240605;
        b=U0TvGX000gC41fMxTB5cTnsB2KW0kmRxZbAXXrTtNy27GlOwXtpvyvkBvW9rP23HHF
         jkrqXPPsBX4Ncnd44lYMAV5D9SX1pVLXX7B393g3c5H24A9LBuObiYyqtkziMIRS8c4f
         r171VOdz4kZmFxS9FRbQqVaKGcAo/+pMkcZOsA6CYRm3cBnqkb2OSy4MRvDMG0RIkZh7
         yQ43ofxAPFI8KRFiIbREPx0PUC6zCAfvMQSf2j27cHdt3UmsCHqQ60T0RCBbThcqk5m9
         iSwrGIJXNpsF8kNtAIDzAGMLTi9t6ad1Oqrg88OqSlUx5qAFEy5rT++c2SIpYAN9VaG1
         lyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KkQasuouwuEak96wMIXgS6fQEBBTQ0Mb+VZ+Zy0vKsE=;
        fh=HTdP/F8n46kR/OwtXA6jWf2kvhcTg21/W4YOLdlRk28=;
        b=VAt3jfXunTh4liLyZo9tRqossBEpUhjBaFmxSmxuF3X0Bt+jpfYWZnpER8Ml7l8VCo
         UZULHBZc5E+S8Sdp+Gt3HX5b/i5aPqxPW/lK3jXWVigwRyQzI/DH8diJff5fcjgNgpur
         Fm6t2YX6o0cK/AN2a2EXg250Jg9rMKvahDlYJKbLusQ1M5tEDaCNuvejp3Ab7RP3hqhX
         q9F16XM4cC/FCRVbR4hLwIoKt3PHiVHI5aswuPTYLUaokrhGS3sLiKLBEY40Mrqps5Ub
         T4ZqG/08qTN7QBneuCmdtSVL6Mv7frG/b1uRcSS7z/2cLobRPE9htMUVErQthOyrW4er
         IcEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781504379; x=1782109179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkQasuouwuEak96wMIXgS6fQEBBTQ0Mb+VZ+Zy0vKsE=;
        b=KUAXna2mDQqYUQvBtDp4PU49mmg7pm+uWUa9hwXiNnw06y6YrWRmoBymxpae6IhcUU
         hWvU3FIQk2Ke/GCblignyu3rOGUiMSsijfAWFrilNfjZ1c1/BgRESNkBCaYme4QkgU/X
         Fv6/GK3uflpe/j0Gpgi1tF/qWRefEdayTBvfIhQ4oTW7bhbV9wmq9UiB1oG+zTt1Kak1
         +FSRIPo29M8/8FLOx/ApJxFbF/Pgd5btBkvSQWWtQaoyvShGzj2M/k6Y89tI0UOUhrhC
         0jU09xjcecPUqBFlGfac/Puhhn8poGwA6WhG/J1Z5y4Wyy20PPYwiKF9xnud2lfV6mxr
         3jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781504379; x=1782109179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KkQasuouwuEak96wMIXgS6fQEBBTQ0Mb+VZ+Zy0vKsE=;
        b=HG90z31hpWwVoAqK0j/sYX6si6JrIx8O3Xm6RqbsYpMSojFThjx/rZW7k+OPc8SUdN
         Fhvee+eK7f59nylPSpsyj/rboaMcN3HZc7qX+Pk6PHI4+u1BcTxfMWSrdb7dC9+HkQSo
         uUAdyM/ANnkteoEk2VYj5TB2ETjmzczwvugLPJSXEaasqh2UPuSTVR/KZQhTj5XkkmJw
         VxP03tOsNo4MiitVgxVvXtHjL8jOki60ryuNk5Z/8xMIzsqPOu139UkVafVsMcCyBIzd
         cXk55yEGHPKL+Ex0naiKGCNP4tKOxv2Sda1ASw1yGjRe4KBbuLCwgZEf4aYJPhJtgTPG
         6tVg==
X-Forwarded-Encrypted: i=1; AFNElJ8shy0jZ7sj44PC0/u+X2sUOI+mG9kusyezcoBnEDsm6lVHunIAJROHF4+JblXj7xykGHCPXmTMBeth@vger.kernel.org
X-Gm-Message-State: AOJu0YzsSa8hhFTqRK3t87jb83jhzlr/t+AtMO505nzNT+mvb+zVCOox
	RKUJIjrBIJTvUGIfXXcCzv4DVS6Zk+kICVY1Cby4tcInGUAjA2VETuvhFKlxBwshRX5KVYfjmEM
	DWLmRNmzcSUX9XEMBRtHgvxd5efyEcLU=
X-Gm-Gg: Acq92OFVUyE05iGd/h86ZVIKs/M3j970P9qox6/vCgn8FdxSmHaXt03LQ40ExF0HDtj
	qGwkhb8kNCD02w4FD/35g/0P6R3boRJjjyPUWOVobb4+ZlGWYeiEdLzLOfCVSXr9JXouMyHTgL9
	J9kD3T8CPAy+M6nTzd/TwVl0mb+Xgp3HEMxRCvYQU0LwxKYStUm1bEAuIR3UvNu8j95GRPP/qTH
	EuW1jR6sXQew0jPrum1t8ss/P+cwGZTe57kUeFB5b7ZhblzCBQM0eACSK/EqJZbvxZIkrSpxXdT
	P1F84QYz
X-Received: by 2002:a05:7301:578c:b0:2d9:6373:ad24 with SMTP id
 5a478bee46e88-30820096097mr6464257eec.26.1781504378983; Sun, 14 Jun 2026
 23:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512102445.55372-1-clamor95@gmail.com> <20260512102445.55372-3-clamor95@gmail.com>
 <CAPVz0n3Dw6Vtqqn8if=MYkBbYittXqsBKbDvrs1ntbD5Zn6iig@mail.gmail.com>
In-Reply-To: <CAPVz0n3Dw6Vtqqn8if=MYkBbYittXqsBKbDvrs1ntbD5Zn6iig@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 15 Jun 2026 09:19:27 +0300
X-Gm-Features: AVVi8CfLJdI-JlhNPqLeAzg6IgycKqp1cAjmQHr2_cfTHiJbI2u6XdfnMNWcOyw
Message-ID: <CAPVz0n3iCSeT3xJ2XkwZ6PYofwSLkc0gfm+iYo4xbKBkAtihcQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] Input: isa1200 - new driver for Imagis ISA1200
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 28 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 08:3=
8 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 13=
:24 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > From: Linus Walleij <linusw@kernel.org>
> >
> > The ISA1200 is a haptic feedback unit from Imagis Technology using two
> > motors for haptic feedback in mobile phones. Used in many mobile device=
s
> > c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsung Be=
am
> > GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.
> >
> > The exact datasheet for the ISA1200 is not available; all data was mode=
led
> > based on available downstream kernel sources for various devices and
> > fragments of information scattered across the internet.
> >
> > Tested-by: Linus Walleij <linusw@kernel.org> # GT-I9070 Janice
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/input/misc/Kconfig   |  12 +
> >  drivers/input/misc/Makefile  |   1 +
> >  drivers/input/misc/isa1200.c | 524 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 537 insertions(+)
> >  create mode 100644 drivers/input/misc/isa1200.c
> >
>
> Hello Dmitry! Do I need to make any further adjustments to this driver?

Hello Dmitry! Do I need to make any further adjustments to this
driver? This driver is hanging in LKML for some time already without
responds from input maintainer. It is still relevant and I would like
it to move forward.
