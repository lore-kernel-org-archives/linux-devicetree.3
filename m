Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FF43B4EB3
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782720295; cv=pass; b=b4Qfxqmu5gQG5uevIQfSK3VAdGm7kbRp1JtxkorQJcMtH/sVYxm0q05mkzCJk/dizAdN5tG84noguqb2p/SF57VFitlIWLPaaWnSHUF033z1IrWVDVhBtywGLaMPXVMoTseeJVb/+Hg8/blcm3H+82cr2bWoJYiIwoNOLEz7zcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782720295; c=relaxed/simple;
	bh=qb/Jl8OBR7LsWp9RSeOT+le399If/gM44rjjvFuSEws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DD3WnIz2q6QpErnQqaYkSYGTkdG+GJS8NVktH4NR7sSBX7mehlUzDVq4iiiIq1IZpBxxvOwzIEvsHZZc4G8fWtZsVQXbze6ZLvvgpR0yBTcy2SO5UYhVSSmPCyX+riJ3IWAv9A6qr4imBf5S50f/EtzZvq/AjtayuvVf9WYgb7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXekYCG8; arc=pass smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXekYCG8"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-96944741eaeso127075241.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 01:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782720293; cv=none;
        d=google.com; s=arc-20260327;
        b=luGP4nM68Iw7kLybEprpB+XlY5XVJ7Epe1jW6LlCClkM7sg+fNmlCbT7m5Hi/h6hbo
         t7p+VYqvSf9Dc9I3t0qUrwgriqVcG15C+tsdrXDqE6ZfvXiUllK6n1N2RmUOkM5VO626
         KAUuuy/SctVh95wWgEK3jgSVcSwA1+/bz+7Y/rzgYnN8a3wIiVRPs+DGWnfA9Gj1VZDu
         JsfzGy2nPC3a0pa88hYAsw+WeICD1uDIy3mABpZ9S9WT36FE3SRRRTAGvMg/2w/21JSd
         xZC4Sk/eK05AVdcLeiUo/pJlzugQjcMZeM1oxzARAZ35sKQlgyH9ut4bP2xNaUerbTav
         WPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cLafhBxn/syeb/3P4J0V6pVOYzw0kjPfQXRFzRJWndY=;
        fh=Zl8aDhM0ZR5L4p6EYGOnckRI2QqCjiiysPmIeJ21akY=;
        b=hUCDXNCPHBnnMQwUkv/8G5Tnb+aHFIBm/fs+HjyUflGhLShIxkc4LWObhjkKgE9/X8
         eOqTN80GAR5Qz8swnle2ms1AAbvNpVXHjOqgO81cIcC0cAW0GLC+2C417iTbIFU0UpiL
         ruvR+0b/yT29wyiFPPq0ALJcttMD27dqJZP/KlthP6fzuyCoQB3edYtupb9fw7BMnz+u
         PMg2y/hfBS+e1AJ26H/QHQjAclcgIfFpAvIOxeu/NpHSQrOwwQW1QTyLGtVr8502bVab
         QxVviq+KYY+OxGYEhAZmiHOtHaPk03sVMaHwopIjdastsQ7h5Qzed595qSiCK/Hd8Bem
         749A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782720293; x=1783325093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLafhBxn/syeb/3P4J0V6pVOYzw0kjPfQXRFzRJWndY=;
        b=ZXekYCG8O35/EsqE+32kkQ3P8Y2L6kwxoTExn/55zVTCrRDFOwmrL0rQPqu7j5fRU4
         l29+s2VhVyqag8BMO+9hD1RD+O4n5R86eVl79afKBSKWO/pL7eDc5XfcDecfnNmLQjOK
         WgM3S1ENYKonsCbA2sNlwLF6EU3BZOA3XsTaIGo7HjsZ7GPE/X1OJYpzbmpCJ2IC5mFE
         MY52XrIEHmoQ/XMVpZdy+R7g1oZB4s27tpsxEL5xGBHx+uTG7snnBCgbrk12pFlCIpdG
         KLcJ228E1PaInDiAlXPmqq52oqI0U/haa4KUxqRV9U9s80pz7nw/YQVOCKqSYgc6Tc+2
         Du9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782720293; x=1783325093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLafhBxn/syeb/3P4J0V6pVOYzw0kjPfQXRFzRJWndY=;
        b=oucqRMsEAYGB/BvIQccngsXGiCd6wRcQCEwIO0onnwbUGQ6gn0rtq3K2silJ0DDwz0
         3o3SGo+u4DQ0zZLnU1i5UBDCy1ecCVkQpFPjGyvGToPtdNKkFbE4E5Sy3TrX5chMOkJG
         irvI5ozIk7h37SqpV+D9wDiwDnLGhtWj2I5+TDWMAvjnE895F51W31NTNFW6+x0LPN0J
         +FnP4WfDOv4X9Negbektap+h+jpPakT1TxZmfTOkDQoJlWmMFJ49nV3Cuaixi5sE3uEX
         gU/LebPByqbdHPEV0VqMai0UMMZ7jS+mUOP9ebuZa5ZkKo/GK2ytckqN8TVePbWDzATe
         Go7A==
X-Forwarded-Encrypted: i=1; AHgh+RoteskBbMey54NYxx+YdLkgSeUqfCIC8lH8R/OYRNP3/pfwu8Qf511w/mBjj/jtYoroZqEXU1Zmeasp@vger.kernel.org
X-Gm-Message-State: AOJu0YyvhTlN7LieDFf1zvO0DkpjmuludeseiU8iccloRsJvR/YFLqWq
	C918SewN9h/4eCDWuB2Gpor0CrcbiABHy0NiLYVi2rnRRYKOPXcHoqCwu2zXH0LPrg4KcQ9q6cz
	/JKfxx257mcTFx3NShEIIAsuHudP8YeA=
X-Gm-Gg: AfdE7cl/mGMEDWV9ypNOklX5cb3OysoV5aNMYsNkDPAGhOT64PD7ywGXxAAeZM82an2
	wKyb/Fxf7k5zXG1DjtXfFk/O77p5gyHcHX/y384iJCNaG8XxFsT5j7e2wSsp0EmnVVQa6ojg93x
	Py9w6+xZ52q+w2fu0kQm/jWKIAiMtwilVTLL+sj3+MKHBHTQ73LRDT4kSKZ2L5jiK3BqAlHwYWG
	+6xV1wpimjpHJCxGqAjSJR4GLDs9M5YOIGjjsd95hPTbvgt+YRzMFajcmxDrJPf0JgBxMwCRQfB
	aD/tU2dgXjnjSRi8OGuxnRcaArj5Jq0mIhSEHLU=
X-Received: by 2002:a05:6102:32ca:b0:631:28c1:154c with SMTP id
 ada2fe7eead31-73434452a9fmr6446524137.9.1782720293340; Mon, 29 Jun 2026
 01:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com> <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
In-Reply-To: <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 29 Jun 2026 16:03:25 +0800
X-Gm-Features: AVVi8CfV0vTEuw_OaCQ_mBABpEVc3al20mAjIqLbvt3oZ-TrUI_bjF0BO6hQB-0
Message-ID: <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 1:36=E2=80=AFPM Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
> Hi Pengyu,
>
> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
> > On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> >> Some devices (such as gaokun3) do not disable FIFO mode, causing the
> >> driver to fallback to FIFO mode by default. However, these platforms
> >> also support GSI mode, which is highly preferred for certain
> >> peripherals like SPI touchscreens to improve performance.
> >>
> >> Introduce the "qcom,force-gsi-mode" device property to hint and force
> >> the controller into GSI mode during initialization.
> Why to force ? You can directly configure in GSI mode. Note there are
> some configuration done prior to Linux bootup too.

Sorry, I don't get it. how? I know there may be a qupfw, but it is
impossible for a normal user like me to generate one with GSI
preferred.

Best wishes,
Pengyu

> >
> > Ideally, this should be decided by the SPI controller based on the
> > requirements. Another option would be to prefer GSI for all transfers i=
f
> > it is available, ignoring the FIFO even if it is not disabled.
> >
> Yes, it should be decided in advance and configured accordingly for GSI
> vs non GSI mode. Because there would be limited set of GSI pipes, which
> will actually make must have GSI mode device run with FIFO mode.
>
> Why don't you decide prior and configure for GSI mode ? We don't need to
> change the current logic of deciding FIFO vs GSI.
> >>
> >> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >> ---
> >>   drivers/spi/spi-geni-qcom.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >
>
