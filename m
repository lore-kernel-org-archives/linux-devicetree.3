Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4F01EB5C2
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259220; cv=pass; b=VFHelZI25SLWYQRNADppPxgeaPqafdc/oLMAibecjx38uOqgltRTy+AzpR5/i0sQzxnUK9fYuW30+3Qx5cMnnqm6e5EQ+n2LLoaCjuQlb0fI7ByfWtYO9i39SrJCyno0xKElAyjX1EaFDbaXUKEtVZtVZWzMC+RFHCjVc8Si0oI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259220; c=relaxed/simple;
	bh=MTpNRk7w6vzPKVgSIynyWRvRyY9jOjm8Y+Z20YHKAnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7pa51mHrkr+2nWoeJmV5UbO0glLy9TvgIojL6if4JOepQ/z6ga45hSZWWC+QlukeqLUbJeKAfgfVrlerMxuEbyDYmZVNITpe7/arIyBpECrRa+XOOi4U/TCRGOQK5KaFg0MC/988iNgZgFmwG8vzCrALe9g0ez5Wk5Nd/5kVOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlpHxCpS; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlpHxCpS"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f33ae12f97so1730826eec.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 23:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779259219; cv=none;
        d=google.com; s=arc-20240605;
        b=WA5ho1UonNLawg1Y4bol0IGa4A0nuTYNPTWNQAeLNTJaR/jyS9VoOpdWV7bffDuiDA
         TRYzjVfVud0Rkjct7zXKwxhpA+jg4MiR51w5vUuQoyk2B/+r/3ZKzUMqUxiYun+BDW0F
         Lo/zgUMAWWY7e1GnV8BRYds/CatOjyFnjzUT3G1oywULuCooVn86+DXUfy9ebEYFZ/SK
         lPzOwHQw2/hL6EQAypKXe+OUqCs92cNY9spMg3lDHSOYP+kF3oCavjkmGb6aiDjmY+CC
         tqDXgkzUPY9V9kkLsO5PUwu4UtpjNbO80M2b/l04fNO5aBv2ZkeV6BhkRcu2HnApizpD
         /uqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G060AVqJsIIyC6kEiga/qmD1PuI78M5kJXkgzfK6+o8=;
        fh=H2C+3hZhJrY0VklxAl6JfZGMrA+CsZ9AROAkXKrpYXk=;
        b=CsrZfC1uKSuqsrUrbWCCBYR+/9EVBNkanMnkHa72dWy+cKaE/l978rmS53CVrTsxgl
         9q9aiqRb9g4M7n9/chOEhy/w3u7FZQQlenXNfjbqIo3aAUTUgccwzI7VMgE29YYbVqgl
         gBFx8u4MzS72RKcdv8FdQ5JHVaCSXTGf8dkDr3EH7L0TgGQflmdXN1el2Qd1+6AtD0OY
         suxm/6wAGmhuYpEH88bYpi3u4TKVQ9rYTbSamy4pR5VxnvB4X9+SrfxlacoyvW74kXDU
         ZTQU4QQW53KKn8LUS4h1yg1VYgNwO5AbHhVNMeYTjkcMrrZLfLX3N5tR46046jTsXwgs
         82sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259219; x=1779864019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G060AVqJsIIyC6kEiga/qmD1PuI78M5kJXkgzfK6+o8=;
        b=DlpHxCpSj98B82hV8yKngrwlyh4LbQctRIpE7tKA1R4guvs/iyxLm9kw9cVua6sidR
         t463bylg3uyICmhUCSYW4Xbm9175riRSZMuvFg5ofEmozYEA9D1ei0b/NYdPibk0Ykxs
         8m13D9kbRlX+TCAOm4b/hF3A64elVMapnhKon3a4VOoqrcSc/zEjIPl8HveJtEgOBH5A
         I1sRa2pjh0+OnHVdfhdEnLnOqpZQWfVX7OkJvVHsMtw2HqakWyYUs4zOxeXRehv4tfPU
         S+uWrW01ulLbWYS5xDfuw8MbZ2qBaen+kBAqLWIGFoP9xthN+x56SDQQDD9TnB/r5GBw
         lnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259219; x=1779864019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G060AVqJsIIyC6kEiga/qmD1PuI78M5kJXkgzfK6+o8=;
        b=nT9jUupY30bExAwwMBhxWaK+TSk4wQmteP9HDuVZfbzgY1cZ+o39kVbK1wtvafjTxL
         iI8lG3CtmIa9QUpV4Fg5PJrn19YtkfmgcPRGYDqxT4WY4ZTPAFbVktESFbUICM41W9Be
         Ce+jtKGFLF1qqi1KjKGZMcH63dWV/dKACo7YmYo67yhWd9vpwetzDeMEPB/qCbi5vy+S
         FPCiU9sL3hfqNBBbqjc33RJxhRJg6UGvEkYRKodlWAg55tsH8Sl4qI0VrdAcFsi4mZO1
         y83Tvq6Q4HudAwyl1+paWVYIxQ6/+U7H39VxOvT1orIQ52beYPBL+aLeyhJcO1ZeF2vd
         Whow==
X-Forwarded-Encrypted: i=1; AFNElJ9oDwlSnG7y18OUbhKkmL7guUKEXmg53XxphTR45ESb6cd9cre7EXYZScyuKrFs4OQV2SISHRD5NigB@vger.kernel.org
X-Gm-Message-State: AOJu0YwngqD6HXIOTYem1JnnxpBckJxdPLP5tbfGgXdGe7cyPrElv2a8
	D/igTd8Tq5DG+TGssyZIGRQwkd/5Rr3I3t/4lGNdREpCkABbkyt4BG3rXnfHj6t81FprE9UyHud
	P2n2HFEzK/n7rQesc9WKo5s9qxkYsalGnq4i8
X-Gm-Gg: Acq92OGvNcsrpavehb9KlLlg18cYxhMMeZjG9v4XPcTOGhm/vDPeO1NLmCcrOTuWHyX
	9S07h+HE4YFQFioEGguIkoEF5kvRtKgqSQUahKR89XP+VwLWX50nELTY9GN1K+Lx9ZrJ0O3zBpS
	TmFuouQbLcOgzRkp1us64/KPX/iLv/woN+AYmhHGgS7OWNRrBI6Daor9cafkzTjDEU8nwEuMcW8
	fq7UWpIXM62V2Guvj9DTWodW4wIVBb6TNa0EyG5NtIz18fEmNkyoeEpbkERKAZ90qavKJWvXqC9
	urhl00TaGbPf2yTFGw==
X-Received: by 2002:a05:7301:4185:b0:2d8:97d6:6ac8 with SMTP id
 5a478bee46e88-30398625a6amr11919674eec.21.1779259218719; Tue, 19 May 2026
 23:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519075558.91466-1-Ashish.Yadav@infineon.com> <51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net>
In-Reply-To: <51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Wed, 20 May 2026 12:10:07 +0530
X-Gm-Features: AVHnY4Iepxm-mJMOkOxQoHVH0KszUzysdkJGmhPPBqTTDoKHtWYjCTLk1Ni7Zpg
Message-ID: <CAJKbuCbW9frUay5Z1NzF+RbiCEU6t+-p20YTwNhdWjnxJu_FOg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for Infineon Digital eFuse XDP730
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thanks for your time and response.
You are entirely correct that the XDP720 and XDP730 drivers are 99% identic=
al.
The only functional difference between the two variants lies within
their GIMON values.

To programmatically identify whether the current target device is an
XDP720 or an XDP730, the system must query the MFR_MODEL register.
Because this register is 8 bytes long, it requires an I2C Block Read
operation to retrieve the model identifier string.
However, some embedded I2C controllers do not natively support I2C Block Re=
ads.
It is precisely due to this hardware controller limitation that we
proposed developing two separate drivers, ensuring reliable
compatibility across different system architectures.

As a better alternative, an elegant solution to consolidate this into
a single driver is to utilize the i2c_transfer() API to read the
MFR_MODEL register.
Please let me know if you have any questions regarding this approach.

With Best Regards,
   Ashish Yadav


On Tue, May 19, 2026 at 8:59=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 5/19/26 00:55, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Hi,
> >
> > These patches add support for Infineon Digital eFuse XDP730.
> > XDP730 provides accurate system telemetry (V, I, P, T) and
> > reports analog current at the IMON pin for post-processing.
> >
> > The Current and Power measurement depends on the RIMON and GIMON values=
.
> > Please look into data sheet sections 4.4.2 and 4.4.4 for more details:
> > https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp=
730-001-datasheet-en.pdf
> >
>
> This driver is 99% identical to the xdp720 driver, except for the gimon
> constants. Please add support for this chip to that driver.
>
> Thanks,
> Guenter
>
